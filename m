Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3791CA9B62
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC0889E0E;
	Thu,  5 Sep 2019 07:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E74D8915A;
 Wed,  4 Sep 2019 09:13:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E9E6B868;
 Wed,  4 Sep 2019 09:13:29 +0000 (UTC)
Date: Wed, 4 Sep 2019 11:13:37 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/radeon: be quiet when no SAD block is found
Message-ID: <20190904111337.77d4cb7c@endymion>
In-Reply-To: <20190904111152.266d5176@endymion>
References: <20190904111152.266d5176@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@linux.ie>, David@freedesktop.org,
	Zhou@freedesktop.org (ChunMing),
	"  <David1.Zhou@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo  Li  <sunpeng.li@amd.com>, Maarten Lankhorst   <maarten.lankhorst@linux.intel.com>, Maxime Ripard   <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Ville  =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,  Christian =?UTF-8?B?S8O2?= =?UTF-8?B?bmln?= <christian.koenig@amd.com>"@freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgZmluZSBmb3IgZGlzcGxheXMgd2l0aG91dCBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIG5v
dCBwcm92aWRlCmFueSBTQUQgYmxvY2sgaW4gdGhlaXIgRURJRC4gRG8gbm90IGxvZyBhbiBlcnJv
ciBpbiB0aGF0IGNhc2UsCmp1c3QgcmV0dXJuIHF1aWV0bHkuCgpJbnNwaXJlZCBieSBhIHNpbWls
YXIgZml4IHRvIHRoZSBhbWRncHUgZHJpdmVyIGluIHRoZSBjb250ZXh0IG9mIGJ1ZwpmZG8jMTA3
ODI1OgpodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDc4MjUK
ClNpZ25lZC1vZmYtYnk6IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogIkRhdmlkIChDaHVuTWluZykgWmhvdSIg
PERhdmlkMS5aaG91QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYx
OgogKiBGaXhlZCBzdWJqZWN0CgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8u
YyB8ICAgIDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCi0tLSBsaW51eC01LjIub3JpZy9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9h
dWRpby5jCTIwMTktMDgtMzAgMTg6MDQ6MTUuMTI1MDU2Njk3ICswMjAwCisrKyBsaW51eC01LjIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYwkyMDE5LTA4LTMwIDE4OjA0OjM1
LjA3ODMxMTM0NyArMDIwMApAQCAtMzY3LDEwICszNjcsMTAgQEAgc3RhdGljIHZvaWQgcmFkZW9u
X2F1ZGlvX3dyaXRlX3NhZF9yZWdzKAogCQlyZXR1cm47CiAKIAlzYWRfY291bnQgPSBkcm1fZWRp
ZF90b19zYWQocmFkZW9uX2Nvbm5lY3Rvcl9lZGlkKGNvbm5lY3RvciksICZzYWRzKTsKLQlpZiAo
c2FkX2NvdW50IDw9IDApIHsKKwlpZiAoc2FkX2NvdW50IDwgMCkKIAkJRFJNX0VSUk9SKCJDb3Vs
ZG4ndCByZWFkIFNBRHM6ICVkXG4iLCBzYWRfY291bnQpOworCWlmIChzYWRfY291bnQgPD0gMCkK
IAkJcmV0dXJuOwotCX0KIAlCVUdfT04oIXNhZHMpOwogCiAJaWYgKHJhZGVvbl9lbmNvZGVyLT5h
dWRpbyAmJiByYWRlb25fZW5jb2Rlci0+YXVkaW8tPndyaXRlX3NhZF9yZWdzKQoKLS0gCkplYW4g
RGVsdmFyZQpTVVNFIEwzIFN1cHBvcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
