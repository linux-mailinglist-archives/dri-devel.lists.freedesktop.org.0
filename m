Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B31B5EED
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 17:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5ED6E88D;
	Thu, 23 Apr 2020 15:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762D16E88D;
 Thu, 23 Apr 2020 15:17:47 +0000 (UTC)
IronPort-SDR: VSj4dTBGTJgXuWLNk9s3dSS0ep65B12GNw/gXi4ajA8Fld/WSjH2suI1x5suqyV/aS983zubX2
 0S+F0+TVdtlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 08:17:47 -0700
IronPort-SDR: fy7yKvh7T2zNzZNCVaQq2XQHqN9fxWosy5gium/Inm9vptlj2UhOGg1ng+p0Ifj2mcXyt5m0T8
 0kPhmGDSrXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="244896817"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 23 Apr 2020 08:17:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Apr 2020 18:17:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Fix off-by-one in DispID DTD pixel clock
Date: Thu, 23 Apr 2020 18:17:43 +0300
Message-Id: <20200423151743.18767-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBEaXNwSUQgRFREIHBpeGVsIGNsb2NrIGlzIGRvY3VtZW50ZWQgYXM6CiIwMCAwMCAwMCBoIOKG
kiBGRiBGRiBGRiBoIHwgUGl4ZWwgY2xvY2sgw7cgMTAsMDAwIDAuMDEg4oaSIDE2Nyw3NzIuMTYg
TWVnYSBQaXhlbHMgcGVyIFNlYyIKV2hpY2ggc2VlbXMgdG8gaW1wbHkgdGhhdCB3ZSB0byBhZGQg
b25lIHRvIHRoZSByYXcgdmFsdWUuCgpSZWFsaXR5IHNlZW1zIHRvIGFncmVlIGFzIHRoZXJlIGFy
ZSB0aWxlZCBkaXNwbGF5cyBpbiB0aGUgd2lsZAp3aGljaCBjdXJyZW50bHkgc2hvdyBhIDEwa0h6
IGRpZmZlcmVuY2UgaW4gdGhlIHBpeGVsIGNsb2NrCmJldHdlZW4gdGhlIHRpbGVzIChvbmUgdGls
ZSBnZXRzIGl0cyBtb2RlIGZyb20gdGhlIGJhc2UgRURJRCwKdGhlIG90aGVyIGZyb20gdGhlIERp
c3BJRCBibG9jaykuCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZWZlcmVuY2VzOiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzI3ClNpZ25lZC1v
ZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IDQzYjZjYTM2NGRh
YS4uNTQ0ZDI2MDNmNWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAtNTEyMCw3ICs1MTIwLDcgQEAgc3Rh
dGljIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpkcm1fbW9kZV9kaXNwbGF5aWRfZGV0YWlsZWQo
c3RydWN0IGRybV9kZXZpY2UgKmQKIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZTsKIAl1
bnNpZ25lZCBwaXhlbF9jbG9jayA9ICh0aW1pbmdzLT5waXhlbF9jbG9ja1swXSB8CiAJCQkJKHRp
bWluZ3MtPnBpeGVsX2Nsb2NrWzFdIDw8IDgpIHwKLQkJCQkodGltaW5ncy0+cGl4ZWxfY2xvY2tb
Ml0gPDwgMTYpKTsKKwkJCQkodGltaW5ncy0+cGl4ZWxfY2xvY2tbMl0gPDwgMTYpKSArIDE7CiAJ
dW5zaWduZWQgaGFjdGl2ZSA9ICh0aW1pbmdzLT5oYWN0aXZlWzBdIHwgdGltaW5ncy0+aGFjdGl2
ZVsxXSA8PCA4KSArIDE7CiAJdW5zaWduZWQgaGJsYW5rID0gKHRpbWluZ3MtPmhibGFua1swXSB8
IHRpbWluZ3MtPmhibGFua1sxXSA8PCA4KSArIDE7CiAJdW5zaWduZWQgaHN5bmMgPSAodGltaW5n
cy0+aHN5bmNbMF0gfCAodGltaW5ncy0+aHN5bmNbMV0gJiAweDdmKSA8PCA4KSArIDE7Ci0tIAoy
LjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
