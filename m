Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E572B148F0B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 21:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE5272BAA;
	Fri, 24 Jan 2020 20:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B81372BAC;
 Fri, 24 Jan 2020 20:03:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:02:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="216692588"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 24 Jan 2020 12:02:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jan 2020 22:02:53 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/edid: Dump bogus 18 byte descriptors
Date: Fri, 24 Jan 2020 22:02:31 +0200
Message-Id: <20200124200231.10517-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkn
bSBjdXJpb3VzIGlmIHRoZXJlIGFyZSBhbnkgYm9ndXMgMTggYnl0ZSBkZXNjcmlwdG9ycyBhcm91
bmQuCkxldCdzIGR1bXAgdGhlbSBvdXQgaWYgd2UgZW5jb3VudGVyIHRoZW0uCgpOb3Qgc3VyZSB3
ZSdkIGFjdHVhbGx5IHdhbnQgdGhpcywgYnV0IGF0IGxlYXN0IEkgZ2V0IHRvIHNlZQppZiBvdXIg
Q0kgaGFzIGFueXRoaW5nIHRoYXQgaGl0cyB0aGlzIDopCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCA4
ZTc2ZWZlMTY1NGQuLjRkODMwM2U1NjUzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTIyMDIsNiArMjIw
MiwxMiBAQCBzdGF0aWMgYm9vbCBpc19kaXNwbGF5X2Rlc2NyaXB0b3IoY29uc3QgdTggZFsxOF0s
IHU4IHRhZykKIAkJZFsyXSA9PSAweDAwICYmIGRbM10gPT0gdGFnOwogfQogCitzdGF0aWMgYm9v
bCBpc19hbnlfZGlzcGxheV9kZXNjcmlwdG9yKGNvbnN0IHU4IGRbMThdKQoreworCXJldHVybiBk
WzBdID09IDB4MDAgJiYgZFsxXSA9PSAweDAwICYmCisJCWRbMl0gPT0gMHgwMDsKK30KKwogc3Rh
dGljIGJvb2wgaXNfZGV0YWlsZWRfdGltaW5nX2Rlc2NyaXB0b3IoY29uc3QgdTggZFsxOF0pCiB7
CiAJcmV0dXJuIGRbMF0gIT0gMHgwMCB8fCBkWzFdICE9IDB4MDA7CkBAIC0yMjA5LDYgKzIyMTUs
MTUgQEAgc3RhdGljIGJvb2wgaXNfZGV0YWlsZWRfdGltaW5nX2Rlc2NyaXB0b3IoY29uc3QgdTgg
ZFsxOF0pCiAKIHR5cGVkZWYgdm9pZCBkZXRhaWxlZF9jYihjb25zdCBzdHJ1Y3QgZGV0YWlsZWRf
dGltaW5nICp0aW1pbmcsIHZvaWQgKmNsb3N1cmUpOwogCitzdGF0aWMgdm9pZCBkb19kZXRhaWxl
ZF9ibG9jayhjb25zdCB1OCBkWzE4XSwgZGV0YWlsZWRfY2IgKmNiLCB2b2lkICpjbG9zdXJlKQor
eworCWlmICghaXNfZGV0YWlsZWRfdGltaW5nX2Rlc2NyaXB0b3IoZCkgJiYKKwkgICAgIWlzX2Fu
eV9kaXNwbGF5X2Rlc2NyaXB0b3IoZCkpCisJCURSTV9XQVJOKCJVbnJlY29nbml6ZWQgMTggYnl0
ZSBkZXNjcmlwdG9yOiAlKnBoXG4iLCAxOCwgZCk7CisKKwljYigoY29uc3Qgc3RydWN0IGRldGFp
bGVkX3RpbWluZyAqKWQsIGNsb3N1cmUpOworfQorCiBzdGF0aWMgdm9pZAogY2VhX2Zvcl9lYWNo
X2RldGFpbGVkX2Jsb2NrKGNvbnN0IHU4ICpleHQsIGRldGFpbGVkX2NiICpjYiwgdm9pZCAqY2xv
c3VyZSkKIHsKQEAgLTIyMjEsNyArMjIzNiw3IEBAIGNlYV9mb3JfZWFjaF9kZXRhaWxlZF9ibG9j
ayhjb25zdCB1OCAqZXh0LCBkZXRhaWxlZF9jYiAqY2IsIHZvaWQgKmNsb3N1cmUpCiAKIAluID0g
KDEyNyAtIGQpIC8gMTg7CiAJZm9yIChpID0gMDsgaSA8IG47IGkrKykKLQkJY2IoKGNvbnN0IHN0
cnVjdCBkZXRhaWxlZF90aW1pbmcgKikoZGV0X2Jhc2UgKyAxOCAqIGkpLCBjbG9zdXJlKTsKKwkJ
ZG9fZGV0YWlsZWRfYmxvY2soZGV0X2Jhc2UgKyAxOCAqIGksIGNiLCBjbG9zdXJlKTsKIH0KIAog
c3RhdGljIHZvaWQKQEAgLTIyMzQsNyArMjI0OSw3IEBAIHZ0Yl9mb3JfZWFjaF9kZXRhaWxlZF9i
bG9jayhjb25zdCB1OCAqZXh0LCBkZXRhaWxlZF9jYiAqY2IsIHZvaWQgKmNsb3N1cmUpCiAJCXJl
dHVybjsgLyogdW5rbm93biB2ZXJzaW9uICovCiAKIAlmb3IgKGkgPSAwOyBpIDwgbjsgaSsrKQot
CQljYigoY29uc3Qgc3RydWN0IGRldGFpbGVkX3RpbWluZyAqKShkZXRfYmFzZSArIDE4ICogaSks
IGNsb3N1cmUpOworCQlkb19kZXRhaWxlZF9ibG9jayhkZXRfYmFzZSArIDE4ICogaSwgY2IsIGNs
b3N1cmUpOwogfQogCiBzdGF0aWMgdm9pZApAQCAtMjI0Nyw3ICsyMjYyLDggQEAgZHJtX2Zvcl9l
YWNoX2RldGFpbGVkX2Jsb2NrKGNvbnN0IHU4ICpyYXdfZWRpZCwgZGV0YWlsZWRfY2IgKmNiLCB2
b2lkICpjbG9zdXJlKQogCQlyZXR1cm47CiAKIAlmb3IgKGkgPSAwOyBpIDwgRURJRF9ERVRBSUxF
RF9USU1JTkdTOyBpKyspCi0JCWNiKCYoZWRpZC0+ZGV0YWlsZWRfdGltaW5nc1tpXSksIGNsb3N1
cmUpOworCQlkb19kZXRhaWxlZF9ibG9jaygoY29uc3QgdTggKikmZWRpZC0+ZGV0YWlsZWRfdGlt
aW5nc1tpXSwKKwkJCQkgIGNiLCBjbG9zdXJlKTsKIAogCWZvciAoaSA9IDE7IGkgPD0gcmF3X2Vk
aWRbMHg3ZV07IGkrKykgewogCQljb25zdCB1OCAqZXh0ID0gcmF3X2VkaWQgKyAoaSAqIEVESURf
TEVOR1RIKTsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
