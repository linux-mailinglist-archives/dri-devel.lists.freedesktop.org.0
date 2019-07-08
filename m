Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C3361EE1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CCC89D43;
	Mon,  8 Jul 2019 12:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709E889D42;
 Mon,  8 Jul 2019 12:53:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 05:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="185675452"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 08 Jul 2019 05:53:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 15:53:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/19] drm/i915: Allow downscale factor of <3.0 on glk+ for
 all formats
Date: Mon,  8 Jul 2019 15:53:11 +0300
Message-Id: <20190708125325.16576-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkJz
cGVjIHNheXMgdGhhdCBnbGsrIG1heCBkb3duc2NhbGUgZmFjdG9yIGlzIDwzLjAgZm9yIGFsbCBw
aXhlbCBmb3JtYXRzLgpPbGRlciBwbGF0Zm9ybXMgaGFkIGEgbWF4IG9mIDwyLjAgZm9yIE5WMTIu
IFVwZGF0ZSB0aGUgY29kZSB0byBkZWFsIHdpdGgKdGhpcy4KClNpZ25lZC1vZmYtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCA5ICsrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCmluZGV4IGVlOTM1NzdiZGY5NS4uMmI4
YTZhODQ2MDVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXkuYwpAQCAtMTQ0NzIsNyArMTQ0NzIsNyBAQCBza2xfbWF4X3NjYWxlKGNvbnN0IHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAogewogCXN0cnVjdCBpbnRlbF9jcnRjICpjcnRj
ID0gdG9faW50ZWxfY3J0YyhjcnRjX3N0YXRlLT5iYXNlLmNydGMpOwogCXN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoY3J0Yy0+YmFzZS5kZXYpOwotCWludCBtYXhf
c2NhbGUsIG11bHQ7CisJaW50IG1heF9zY2FsZTsKIAlpbnQgY3J0Y19jbG9jaywgbWF4X2RvdGNs
aywgdG1wY2xrMSwgdG1wY2xrMjsKIAogCWlmICghY3J0Y19zdGF0ZS0+YmFzZS5lbmFibGUpCkBA
IC0xNDQ5Myw4ICsxNDQ5MywxMSBAQCBza2xfbWF4X3NjYWxlKGNvbnN0IHN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlICpjcnRjX3N0YXRlLAogCSAqICAgICAgICAgICAgb3IKIAkgKiAgICBjZGNsay9j
cnRjX2Nsb2NrCiAJICovCi0JbXVsdCA9IGRybV9mb3JtYXRfaW5mb19pc195dXZfc2VtaXBsYW5h
cihmb3JtYXQpID8gMiA6IDM7Ci0JdG1wY2xrMSA9ICgxIDw8IDE2KSAqIG11bHQgLSAxOworCWlm
IChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEwIHx8IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYpIHx8
CisJICAgICFkcm1fZm9ybWF0X2luZm9faXNfeXV2X3NlbWlwbGFuYXIoZm9ybWF0KSkKKwkJdG1w
Y2xrMSA9IDB4MzAwMDAgLSAxOworCWVsc2UKKwkJdG1wY2xrMSA9IDB4MjAwMDAgLSAxOwogCXRt
cGNsazIgPSAoMSA8PCA4KSAqICgobWF4X2RvdGNsayA8PCA4KSAvIGNydGNfY2xvY2spOwogCW1h
eF9zY2FsZSA9IG1pbih0bXBjbGsxLCB0bXBjbGsyKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
