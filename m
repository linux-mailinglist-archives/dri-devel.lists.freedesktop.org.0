Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B3510C9DB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 14:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B25A6E0F1;
	Thu, 28 Nov 2019 13:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041486E0BE;
 Thu, 28 Nov 2019 13:51:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 34F6F291F34
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Provide ddc symlink in hdmi connector sysfs
 directory
Date: Thu, 28 Nov 2019 14:51:06 +0100
Message-Id: <20191128135106.21985-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <874kyonvpd.fsf@intel.com>
References: <874kyonvpd.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tClJlYmFzZWQg
b250byBkcm0tbWlzYy1uZXh0IGFzIG9mIDI4IE5vdiAyMDE5CgogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgfCAxMiArKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2hkbWkuYwppbmRleCBiNTRjY2JiNWFhZDUuLjQwZjMyZjJkOGFmMSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKQEAgLTMxMjgsNiArMzEy
OCw3IEBAIHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRh
bF9wb3J0ICppbnRlbF9kaWdfcG9ydCwKIAlzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqaW50ZWxfZW5j
b2RlciA9ICZpbnRlbF9kaWdfcG9ydC0+YmFzZTsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
aW50ZWxfZW5jb2Rlci0+YmFzZS5kZXY7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9w
cml2ID0gdG9faTkxNShkZXYpOworCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwogCWVudW0gcG9y
dCBwb3J0ID0gaW50ZWxfZW5jb2Rlci0+cG9ydDsKIAlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZv
IGNvbm5faW5mbzsKIApAQCAtMzE0MCw4ICszMTQxLDEzIEBAIHZvaWQgaW50ZWxfaGRtaV9pbml0
X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9kaWdfcG9ydCwKIAkJ
IGludGVsX2VuY29kZXItPmJhc2UubmFtZSkpCiAJCXJldHVybjsKIAotCWRybV9jb25uZWN0b3Jf
aW5pdChkZXYsIGNvbm5lY3RvciwgJmludGVsX2hkbWlfY29ubmVjdG9yX2Z1bmNzLAotCQkJICAg
RFJNX01PREVfQ09OTkVDVE9SX0hETUlBKTsKKwlpbnRlbF9oZG1pLT5kZGNfYnVzID0gaW50ZWxf
aGRtaV9kZGNfcGluKGRldl9wcml2LCBwb3J0KTsKKwlkZGMgPSBpbnRlbF9nbWJ1c19nZXRfYWRh
cHRlcihkZXZfcHJpdiwgaW50ZWxfaGRtaS0+ZGRjX2J1cyk7CisKKwlkcm1fY29ubmVjdG9yX2lu
aXRfd2l0aF9kZGMoZGV2LCBjb25uZWN0b3IsCisJCQkJICAgICZpbnRlbF9oZG1pX2Nvbm5lY3Rv
cl9mdW5jcywKKwkJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJCSAgICBkZGMp
OwogCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZpbnRlbF9oZG1pX2Nvbm5l
Y3Rvcl9oZWxwZXJfZnVuY3MpOwogCiAJY29ubmVjdG9yLT5pbnRlcmxhY2VfYWxsb3dlZCA9IDE7
CkBAIC0zMTUxLDggKzMxNTcsNiBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9jb25uZWN0b3Ioc3Ry
dWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCiAJaWYgKElOVEVMX0dFTihk
ZXZfcHJpdikgPj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpCiAJCWNvbm5lY3Rvci0+
eWNiY3JfNDIwX2FsbG93ZWQgPSB0cnVlOwogCi0JaW50ZWxfaGRtaS0+ZGRjX2J1cyA9IGludGVs
X2hkbWlfZGRjX3BpbihkZXZfcHJpdiwgcG9ydCk7Ci0KIAlpZiAoV0FSTl9PTihwb3J0ID09IFBP
UlRfQSkpCiAJCXJldHVybjsKIAlpbnRlbF9lbmNvZGVyLT5ocGRfcGluID0gaW50ZWxfaHBkX3Bp
bl9kZWZhdWx0KGRldl9wcml2LCBwb3J0KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
