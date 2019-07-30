Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172DF79D5D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 02:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0970B6E2E4;
	Tue, 30 Jul 2019 00:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BB789E57;
 Tue, 30 Jul 2019 00:32:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 17:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="371322812"
Received: from nperf12.hd.intel.com ([10.127.88.161])
 by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2019 17:32:05 -0700
From: Brian Welty <brian.welty@intel.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 2/3] drm: Introduce DRM_MEM defines for specifying type of
 drm_mem_region
Date: Mon, 29 Jul 2019 20:32:24 -0400
Message-Id: <20190730003225.322-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190730003225.322-1-brian.welty@intel.com>
References: <20190730003225.322-1-brian.welty@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW50cm9kdWNlIERSTSBtZW1vcnkgcmVnaW9uIHR5cGVzIHRvIGJlIGNvbW1vbiBmb3IgYm90aCBk
cml2ZXJzIHVzaW5nClRUTSBhbmQgZm9yIGk5MTUuICBGb3Igbm93LCBUVE0gY29udGludWVzIHRv
IGRlZmluZSBpdCdzIG93biBzZXQgYnV0CnVzZXMgdGhlIERSTSBiYXNlIGRlZmluaXRpb25zLgoK
U2lnbmVkLW9mZi1ieTogQnJpYW4gV2VsdHkgPGJyaWFuLndlbHR5QGludGVsLmNvbT4KLS0tCiBp
bmNsdWRlL2RybS9kcm1fbW0uaCAgICAgICAgICAgIHwgOCArKysrKysrKwogaW5jbHVkZS9kcm0v
dHRtL3R0bV9wbGFjZW1lbnQuaCB8IDggKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
bW0uaCBiL2luY2x1ZGUvZHJtL2RybV9tbS5oCmluZGV4IDQ2NWY4ZDEwZDg2My4uYjc4ZGM5Mjg0
NzAyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fbW0uaAorKysgYi9pbmNsdWRlL2RybS9k
cm1fbW0uaApAQCAtNTksNiArNTksMTQgQEAKIHN0cnVjdCBkcm1fZGV2aWNlOwogc3RydWN0IGRy
bV9tbTsKIAorLyoKKyAqIE1lbW9yeSB0eXBlcyBmb3IgZHJtX21lbV9yZWdpb24KKyAqLworI2Rl
ZmluZSBEUk1fTUVNX1NZU1RFTQkwCisjZGVmaW5lIERSTV9NRU1fU1RPTEVOCTEKKyNkZWZpbmUg
RFJNX01FTV9WUkFNCTIKKyNkZWZpbmUgRFJNX01FTV9QUklWCTMKKwogLyoqCiAgKiBzdHJ1Y3Qg
ZHJtX21lbV9yZWdpb24KICAqCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX3BsYWNl
bWVudC5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9wbGFjZW1lbnQuaAppbmRleCBlODhhOGUzOTc2
N2IuLjk3NmNmOGQyZjg5OSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9wbGFjZW1l
bnQuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX3BsYWNlbWVudC5oCkBAIC0zNywxMCArMzcs
MTAgQEAKICAqIE1lbW9yeSByZWdpb25zIGZvciBkYXRhIHBsYWNlbWVudC4KICAqLwogCi0jZGVm
aW5lIFRUTV9QTF9TWVNURU0gICAgICAgICAgIDAKLSNkZWZpbmUgVFRNX1BMX1RUICAgICAgICAg
ICAgICAgMQotI2RlZmluZSBUVE1fUExfVlJBTSAgICAgICAgICAgICAyCi0jZGVmaW5lIFRUTV9Q
TF9QUklWICAgICAgICAgICAgIDMKKyNkZWZpbmUgVFRNX1BMX1NZU1RFTSAgICAgICAgICAgRFJN
X01FTV9TWVNURU0KKyNkZWZpbmUgVFRNX1BMX1RUICAgICAgICAgICAgICAgRFJNX01FTV9TVE9M
RU4KKyNkZWZpbmUgVFRNX1BMX1ZSQU0gICAgICAgICAgICAgRFJNX01FTV9WUkFNCisjZGVmaW5l
IFRUTV9QTF9QUklWICAgICAgICAgICAgIERSTV9NRU1fUFJJVgogCiAjZGVmaW5lIFRUTV9QTF9G
TEFHX1NZU1RFTSAgICAgICgxIDw8IFRUTV9QTF9TWVNURU0pCiAjZGVmaW5lIFRUTV9QTF9GTEFH
X1RUICAgICAgICAgICgxIDw8IFRUTV9QTF9UVCkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
