Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11846991D5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 13:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636C26E4C4;
	Thu, 22 Aug 2019 11:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532286E4C4;
 Thu, 22 Aug 2019 11:15:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 04:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="186537472"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2019 04:15:27 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 2/6] drm: port definition is moved back into i915 header
Date: Thu, 22 Aug 2019 16:44:41 +0530
Message-Id: <20190822111445.29350-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822111445.29350-1-ramalingam.c@intel.com>
References: <20190822111445.29350-1-ramalingam.c@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, tomas.winkler@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGFuZGxlZCB0aGUgbmVlZCBmb3IgZXhwb3NpbmcgZW51bSBwb3J0IHRvIG1laV9oZGNwIGRyaXZl
ciwgYnkKY29udmVydGluZyB0aGUgcG9ydCBpbnRvIGRkaSBpbmRleCBhcyBwZXIgTUUgRlcuCgpI
ZW5jZSBlbnVtIHBvcnQgZGVmaW5pdGlvbiBtb3ZlZCBpbnRvIEk5MTUgZHJpdmVyIGl0c2VsZi4K
ClNpZ25lZC1vZmYtYnk6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuaCAgICB8ICAyICsrCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaCB8IDE4ICsrKysrKysr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5oICAgICAg
fCAgMSArCiBpbmNsdWRlL2RybS9pOTE1X2RybS5oICAgICAgICAgICAgICAgICAgICAgICB8IDE4
IC0tLS0tLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAx
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2Jpb3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5o
CmluZGV4IDQ5NjkxODllNjIwZi4uOTQxNWUyMjQzNWJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Jpb3MuaApAQCAtMzQsNiArMzQsOCBAQAogCiAjaW5jbHVkZSA8ZHJt
L2k5MTVfZHJtLmg+CiAKKyNpbmNsdWRlICJpbnRlbF9kaXNwbGF5LmgiCisKIHN0cnVjdCBkcm1f
aTkxNV9wcml2YXRlOwogCiBlbnVtIGludGVsX2JhY2tsaWdodF90eXBlIHsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmgKaW5kZXggZTU3ZTY5NjkwNTFkLi40
MDYxMGQ1MTMyN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5oCkBAIC0xODIsNiArMTgyLDI0IEBAIGVudW0gcGxhbmVfaWQgewogCWZvciAoKF9fcCkg
PSBQTEFORV9QUklNQVJZOyAoX19wKSA8IEk5MTVfTUFYX1BMQU5FUzsgKF9fcCkrKykgXAogCQlm
b3JfZWFjaF9pZigoX19jcnRjKS0+cGxhbmVfaWRzX21hc2sgJiBCSVQoX19wKSkKIAorZW51bSBw
b3J0IHsKKwlQT1JUX05PTkUgPSAtMSwKKworCVBPUlRfQSA9IDAsCisJUE9SVF9CLAorCVBPUlRf
QywKKwlQT1JUX0QsCisJUE9SVF9FLAorCVBPUlRfRiwKKwlQT1JUX0csCisJUE9SVF9ILAorCVBP
UlRfSSwKKworCUk5MTVfTUFYX1BPUlRTCit9OworCisjZGVmaW5lIHBvcnRfbmFtZShwKSAoKHAp
ICsgJ0EnKQorCiAvKgogICogUG9ydHMgaWRlbnRpZmllciByZWZlcmVuY2VkIGZyb20gb3RoZXIg
ZHJpdmVycy4KICAqIEV4cGVjdGVkIHRvIHJlbWFpbiBzdGFibGUgb3ZlciB0aW1lCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmgKaW5kZXggNjU3YmJiMWY1ZWQwLi5jYTA1YWU3
OTlkNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmgKQEAgLTExLDYg
KzExLDcgQEAKICNpbmNsdWRlIDxkcm0vaTkxNV9kcm0uaD4KIAogI2luY2x1ZGUgImk5MTVfcmVn
LmgiCisjaW5jbHVkZSAiaW50ZWxfZGlzcGxheS5oIgogCiBlbnVtIHBpcGU7CiBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9zdGF0ZTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2k5MTVfZHJtLmggYi9p
bmNsdWRlL2RybS9pOTE1X2RybS5oCmluZGV4IDIzMjc0Y2Y5MjcxMi4uNjcyMjAwNTg4NGRiIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2RybS9pOTE1X2RybS5oCisrKyBiL2luY2x1ZGUvZHJtL2k5MTVf
ZHJtLmgKQEAgLTEwMCwyMiArMTAwLDQgQEAgZXh0ZXJuIHN0cnVjdCByZXNvdXJjZSBpbnRlbF9n
cmFwaGljc19zdG9sZW5fcmVzOwogI2RlZmluZSBJTlRFTF9HRU4xMV9CU01fRFcxCTB4YzQKICNk
ZWZpbmUgICBJTlRFTF9CU01fTUFTSwkoLSgxdSA8PCAyMCkpCiAKLWVudW0gcG9ydCB7Ci0JUE9S
VF9OT05FID0gLTEsCi0KLQlQT1JUX0EgPSAwLAotCVBPUlRfQiwKLQlQT1JUX0MsCi0JUE9SVF9E
LAotCVBPUlRfRSwKLQlQT1JUX0YsCi0JUE9SVF9HLAotCVBPUlRfSCwKLQlQT1JUX0ksCi0KLQlJ
OTE1X01BWF9QT1JUUwotfTsKLQotI2RlZmluZSBwb3J0X25hbWUocCkgKChwKSArICdBJykKLQog
I2VuZGlmCQkJCS8qIF9JOTE1X0RSTV9IXyAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
