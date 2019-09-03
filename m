Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADB3A64DA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 11:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8070896A3;
	Tue,  3 Sep 2019 09:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F2A89612;
 Tue,  3 Sep 2019 09:13:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 02:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="207022011"
Received: from helsinki.fi.intel.com ([10.237.66.149])
 by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2019 02:13:07 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/i915/dp: Attach HDR metadata property to DP
 connector
Date: Tue,  3 Sep 2019 12:12:35 +0300
Message-Id: <20190903091235.32304-8-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
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
Cc: uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgYXR0YWNoZXMgSERSIG1ldGFkYXRhIHByb3BlcnR5IHRvIERQIGNvbm5lY3RvciBvbiBHTEsr
LgpJdCBlbmFibGVzIEhEUiBtZXRhZGF0YSBpbmZvZnJhbWUgc2RwIG9uIEdMSysgdG8gYmUgdXNl
ZCB0byBzZW5kCkhEUiBtZXRhZGF0YSB0byBEUCBzaW5rLgoKdjI6IE1pbm9yIHN0eWxlIGZpeAoK
U2lnbmVkLW9mZi1ieTogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29t
PgpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCA1ICsrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcC5jCmluZGV4IDdmY2M5ZjI4ZDJlNy4uMjQ2NmQ3YWZmNjcwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCkBAIC02NTM2LDYgKzY1MzYsMTEgQEAgaW50ZWxfZHBf
YWRkX3Byb3BlcnRpZXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwgc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3QKIAogCWludGVsX2F0dGFjaF9jb2xvcnNwYWNlX3Byb3BlcnR5KGNvbm5l
Y3Rvcik7CiAKKwlpZiAoSVNfR0VNSU5JTEFLRShkZXZfcHJpdikgfHwgSU5URUxfR0VOKGRldl9w
cml2KSA+PSAxMSkKKwkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJmNvbm5lY3Rvci0+YmFz
ZSwKKwkJCQkJICAgY29ubmVjdG9yLT5kZXYtPm1vZGVfY29uZmlnLmhkcl9vdXRwdXRfbWV0YWRh
dGFfcHJvcGVydHksCisJCQkJCSAgIDApOworCiAJaWYgKGludGVsX2RwX2lzX2VkcChpbnRlbF9k
cCkpIHsKIAkJdTMyIGFsbG93ZWRfc2NhbGVyczsKIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
