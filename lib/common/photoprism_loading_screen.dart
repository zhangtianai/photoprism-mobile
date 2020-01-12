import 'dart:async';

import 'package:flutter/material.dart';
import 'package:photoprism/model/photoprism_model.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PhotoprismLoadingScreen {
  PhotoprismModel photoprismModel;
  ProgressDialog pr;
  BuildContext context;

  PhotoprismLoadingScreen(PhotoprismModel photoprismModel) {
    this.photoprismModel = photoprismModel;
  }

  showLoadingScreen(String message) {
    pr = new ProgressDialog(context);
    pr.style(message: message);
    pr.show();
    photoprismModel.notifyListeners();
  }

  updateLoadingScreen(String message) {
    pr.update(message: message);
  }

  Future hideLoadingScreen() {
    Completer hideLoadingScreenCompleter;
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      pr.hide().whenComplete(() {
        hideLoadingScreenCompleter.complete();
      });
    });
    photoprismModel.notifyListeners();
    hideLoadingScreenCompleter = Completer();
    return hideLoadingScreenCompleter.future;
  }
}
