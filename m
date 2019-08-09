Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963A885F1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 00:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5F46EF16;
	Fri,  9 Aug 2019 22:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F0D6EEFA;
 Fri,  9 Aug 2019 22:27:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,366,1559545200"; d="scan'208";a="176927071"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO
 mwahaha-bdw.ger.corp.intel.com) ([10.252.5.86])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2019 15:27:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 24/37] drm/i915: set num_fence_regs to 0 if there is no
 aperture
Date: Fri,  9 Aug 2019 23:26:30 +0100
Message-Id: <20190809222643.23142-25-matthew.auld@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809222643.23142-1-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KCldlIGNhbid0IGZlbmNlIGFueXRoaW5nIHdpdGhvdXQgYXBlcnR1cmUuCgpTaWduZWQt
b2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50
ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50
ZWwuY29tPgpDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2ZlbmNlX3JlZy5jIHwgNiArKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZmVuY2VfcmVnLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2dlbV9mZW5jZV9yZWcuYwppbmRleCBiY2FjMzU5ZWM2NjEuLmJiN2Q5MzIx
Y2FkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZmVuY2VfcmVn
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZmVuY2VfcmVnLmMKQEAgLTgw
OCw4ICs4MDgsMTAgQEAgdm9pZCBpOTE1X2dndHRfaW5pdF9mZW5jZXMoc3RydWN0IGk5MTVfZ2d0
dCAqZ2d0dCkKIAogCWRldGVjdF9iaXRfNl9zd2l6emxlKGk5MTUpOwogCi0JaWYgKElOVEVMX0dF
TihpOTE1KSA+PSA3ICYmCi0JICAgICEoSVNfVkFMTEVZVklFVyhpOTE1KSB8fCBJU19DSEVSUllW
SUVXKGk5MTUpKSkKKwlpZiAoIUhBU19NQVBQQUJMRV9BUEVSVFVSRShpOTE1KSkKKwkJbnVtX2Zl
bmNlcyA9IDA7CisJZWxzZSBpZiAoSU5URUxfR0VOKGk5MTUpID49IDcgJiYKKwkJICEoSVNfVkFM
TEVZVklFVyhpOTE1KSB8fCBJU19DSEVSUllWSUVXKGk5MTUpKSkKIAkJbnVtX2ZlbmNlcyA9IDMy
OwogCWVsc2UgaWYgKElOVEVMX0dFTihpOTE1KSA+PSA0IHx8CiAJCSBJU19JOTQ1RyhpOTE1KSB8
fCBJU19JOTQ1R00oaTkxNSkgfHwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
