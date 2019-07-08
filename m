Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97361EDD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6600289CE3;
	Mon,  8 Jul 2019 12:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A461889CF9;
 Mon,  8 Jul 2019 12:53:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 05:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="165452194"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 08 Jul 2019 05:53:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 15:53:34 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/19] drm/i915: Remove pointless planes_changed=true
 assignment
Date: Mon,  8 Jul 2019 15:53:09 +0300
Message-Id: <20190708125325.16576-4-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmk5
MTUgZG9lc24ndCB1c2UgdGhlIGNydGNfc3RhdGUtPnBsYW5lX2NoYW5nZWQgZmxhZyBmb3IgYW55
dGhpbmcsCnNvIHNldHRpbmcgaXQgaXMgcG9pbnRsZXNzLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5jIHwgNyAtLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2F0b21pYy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hdG9taWMuYwppbmRleCA5MGNhMTFhNGFlODguLjk1NGQ0YTkzMDg2NCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5jCkBAIC0zNzgsMTMgKzM3OCw2IEBA
IGludCBpbnRlbF9hdG9taWNfc2V0dXBfc2NhbGVycyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYsCiAJCQkJCQlwbGFuZS0+YmFzZS5pZCk7CiAJCQkJCXJldHVybiBQVFJfRVJSKHN0
YXRlKTsKIAkJCQl9Ci0KLQkJCQkvKgotCQkJCSAqIHRoZSBwbGFuZSBpcyBhZGRlZCBhZnRlciBw
bGFuZSBjaGVja3MgYXJlIHJ1biwKLQkJCQkgKiBidXQgc2luY2UgdGhpcyBwbGFuZSBpcyB1bmNo
YW5nZWQganVzdCBkbyB0aGUKLQkJCQkgKiBtaW5pbXVtIHJlcXVpcmVkIHZhbGlkYXRpb24uCi0J
CQkJICovCi0JCQkJY3J0Y19zdGF0ZS0+YmFzZS5wbGFuZXNfY2hhbmdlZCA9IHRydWU7CiAJCQl9
CiAKIAkJCWludGVsX3BsYW5lID0gdG9faW50ZWxfcGxhbmUocGxhbmUpOwotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
