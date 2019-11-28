Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F76C10CB31
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F3C6E83F;
	Thu, 28 Nov 2019 15:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFAA6E842;
 Thu, 28 Nov 2019 15:01:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 32DAC29237F
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Provide ddc symlink in hdmi connector sysfs
 directory
Date: Thu, 28 Nov 2019 16:01:30 +0100
Message-Id: <20191128150130.26266-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <878so0m7dd.fsf@intel.com>
References: <878so0m7dd.fsf@intel.com>
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
b250byBkcm0taW50ZWwtbmV4dC1xdWV1ZWQuCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9oZG1pLmMgfCAxMiArKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2hkbWkuYwppbmRleCAyOWExNzRhZjUzMTQuLjZlYzhkMTRiY2NkNyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKQEAgLTMxMzQsNiArMzEzNCw3IEBAIHZv
aWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICpp
bnRlbF9kaWdfcG9ydCwKIAlzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqaW50ZWxfZW5jb2RlciA9ICZp
bnRlbF9kaWdfcG9ydC0+YmFzZTsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gaW50ZWxfZW5j
b2Rlci0+YmFzZS5kZXY7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9f
aTkxNShkZXYpOworCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwogCWVudW0gcG9ydCBwb3J0ID0g
aW50ZWxfZW5jb2Rlci0+cG9ydDsKIAlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvIGNvbm5faW5m
bzsKIApAQCAtMzE0OSw4ICszMTUwLDEzIEBAIHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3Rv
cihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9kaWdfcG9ydCwKIAkJIGludGVsX2Vu
Y29kZXItPmJhc2UubmFtZSkpCiAJCXJldHVybjsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkZXYs
IGNvbm5lY3RvciwgJmludGVsX2hkbWlfY29ubmVjdG9yX2Z1bmNzLAotCQkJICAgRFJNX01PREVf
Q09OTkVDVE9SX0hETUlBKTsKKwlpbnRlbF9oZG1pLT5kZGNfYnVzID0gaW50ZWxfaGRtaV9kZGNf
cGluKGRldl9wcml2LCBwb3J0KTsKKwlkZGMgPSBpbnRlbF9nbWJ1c19nZXRfYWRhcHRlcihkZXZf
cHJpdiwgaW50ZWxfaGRtaS0+ZGRjX2J1cyk7CisKKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9k
ZGMoZGV2LCBjb25uZWN0b3IsCisJCQkJICAgICZpbnRlbF9oZG1pX2Nvbm5lY3Rvcl9mdW5jcywK
KwkJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJCSAgICBkZGMpOwogCWRybV9j
b25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZpbnRlbF9oZG1pX2Nvbm5lY3Rvcl9oZWxw
ZXJfZnVuY3MpOwogCiAJY29ubmVjdG9yLT5pbnRlcmxhY2VfYWxsb3dlZCA9IDE7CkBAIC0zMTYw
LDggKzMxNjYsNiBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9jb25uZWN0b3Ioc3RydWN0IGludGVs
X2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCiAJaWYgKElOVEVMX0dFTihkZXZfcHJpdikg
Pj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpCiAJCWNvbm5lY3Rvci0+eWNiY3JfNDIw
X2FsbG93ZWQgPSB0cnVlOwogCi0JaW50ZWxfaGRtaS0+ZGRjX2J1cyA9IGludGVsX2hkbWlfZGRj
X3BpbihkZXZfcHJpdiwgcG9ydCk7Ci0KIAlpbnRlbF9lbmNvZGVyLT5ocGRfcGluID0gaW50ZWxf
aHBkX3Bpbl9kZWZhdWx0KGRldl9wcml2LCBwb3J0KTsKIAogCWlmIChIQVNfRERJKGRldl9wcml2
KSkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
