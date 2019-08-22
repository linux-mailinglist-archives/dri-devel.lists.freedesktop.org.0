Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A275991AE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 13:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1976E4A2;
	Thu, 22 Aug 2019 11:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF5E6E4A2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 11:08:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 04:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="183855735"
Received: from wo73065l01s008.fi.intel.com ([10.237.72.188])
 by orsmga006.jf.intel.com with ESMTP; 22 Aug 2019 04:08:42 -0700
From: Simon Ser <simon.ser@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: add port info to debugfs
Date: Thu, 22 Aug 2019 14:09:27 +0300
Message-Id: <20190822110927.28249-1-simon.ser@intel.com>
X-Mailer: git-send-email 2.22.1
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
Cc: Manasi Navare <nabasi.d.navare@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGEgbGluZSB3aXRoIHRoZSBwb3J0IG5hbWUgdG8gY29ubmVjdG9ycyBp
bgpkZWJ1Z2ZzL2k5MTVfZGVidWdfaW5mby4gSWYgdGhlIHBvcnQgaXMgVHlwZS1DLCB0aGUgVHlw
ZS1DIHBvcnQgbnVtYmVyIGlzCnByaW50ZWQgdG9vLgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2Vy
IDxzaW1vbi5zZXJAaW50ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29t
PgpDYzogTWFuYXNpIE5hdmFyZSA8bmFiYXNpLmQubmF2YXJlQGludGVsLmNvbT4KLS0tCgpUaGFu
a3MgZm9yIHlvdXIgY29tbWVudHMsIEltcmUgYW5kIE1hbmFzaS4gSGVyZSBpcyB2MjoKCi0gVXNl
IHNhbWUgcG9ydCBmb3JtYXR0aW5nIGFzIGludGVsX3RjX3BvcnRfaW5pdCAoZS5nLiAiQy9UQyMx
IikKLSBGaXggdHlwbyBpbiBjb21taXQgbWVzc2FnZQoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfZGVidWdmcy5jIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jCmluZGV4IGIzOTIyNmQ3ZjhkMi4u
NGJhNTA4Yzk1NGY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVn
ZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYwpAQCAtMjU1Nyw5
ICsyNTU3LDExIEBAIHN0YXRpYyB2b2lkIGludGVsX2x2ZHNfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUg
Km0sCiBzdGF0aWMgdm9pZCBpbnRlbF9jb25uZWN0b3JfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0s
CiAJCQkJIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7CisJc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KGNvbm5lY3Rvci0+ZGV2KTsKIAlzdHJ1Y3QgaW50
ZWxfY29ubmVjdG9yICppbnRlbF9jb25uZWN0b3IgPSB0b19pbnRlbF9jb25uZWN0b3IoY29ubmVj
dG9yKTsKIAlzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqaW50ZWxfZW5jb2RlciA9IGludGVsX2Nvbm5l
Y3Rvci0+ZW5jb2RlcjsKIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZTsKKwllbnVtIHRj
X3BvcnQgdGNfcG9ydDsKCiAJc2VxX3ByaW50ZihtLCAiY29ubmVjdG9yICVkOiB0eXBlICVzLCBz
dGF0dXM6ICVzXG4iLAogCQkgICBjb25uZWN0b3ItPmJhc2UuaWQsIGNvbm5lY3Rvci0+bmFtZSwK
QEAgLTI1NzgsNiArMjU4MCwxNCBAQCBzdGF0aWMgdm9pZCBpbnRlbF9jb25uZWN0b3JfaW5mbyhz
dHJ1Y3Qgc2VxX2ZpbGUgKm0sCiAJaWYgKCFpbnRlbF9lbmNvZGVyKQogCQlyZXR1cm47CgorCWlm
IChpbnRlbF9lbmNvZGVyLT5wb3J0ICE9IFBPUlRfTk9ORSkgeworCQlzZXFfcHJpbnRmKG0sICJc
dHBvcnQ6ICVjIiwgcG9ydF9uYW1lKGludGVsX2VuY29kZXItPnBvcnQpKTsKKwkJdGNfcG9ydCA9
IGludGVsX3BvcnRfdG9fdGMoaTkxNSwgaW50ZWxfZW5jb2Rlci0+cG9ydCk7CisJCWlmICh0Y19w
b3J0ICE9IFBPUlRfVENfTk9ORSkKKwkJCXNlcV9wcmludGYobSwgIi9UQyMlZCIsIHRjX3BvcnQg
KyAxKTsKKwkJc2VxX3ByaW50ZihtLCAiXG4iKTsKKwl9CisKIAlzd2l0Y2ggKGNvbm5lY3Rvci0+
Y29ubmVjdG9yX3R5cGUpIHsKIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydDoK
IAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9lRFA6Ci0tCjIuMjIuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
