Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F20D59EDB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759106E94E;
	Fri, 28 Jun 2019 15:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9706E94E;
 Fri, 28 Jun 2019 15:28:07 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgsnE-0004FY-Lr; Fri, 28 Jun 2019 15:28:04 +0000
From: Colin King <colin.king@canonical.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/powerplay: remove a less than zero uint32_t
 check
Date: Fri, 28 Jun 2019 16:28:04 +0100
Message-Id: <20190628152804.16954-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBjaGVj
ayB0byBzZWUgaWYgdGhlIHVpbnQzMl90IHZhcmlhYmxlICdzaXplJyBpcyBsZXNzIHRoYW4gemVy
bwppcyByZWR1bmRhbnQgYXMgaXQgaXMgdW5zaWduZWQgYW5kIGNhbiBuZXZlciBiZSBsZXNzIHRo
YW4gemVyby4KUmVtb3ZlIHRoaXMgcmVkdW5kYW50IGNoZWNrLgoKQWRkcmVzc2VzLUNvdmVyaXR5
OiAoIlVuc2lnbmVkIGNvbXBhcmVkIHRvIHplcm8iKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXgg
YWMxNTFkYS4uNmVhNDhkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYwpAQCAtMTA0Myw5ICsxMDQzLDYgQEAgc3RhdGljIGludCBuYXZpMTBfc2V0X3Bvd2Vy
X3Byb2ZpbGVfbW9kZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgbG9uZyAqaW5wdXQsIHUKIAl9
CiAKIAlpZiAoc211LT5wb3dlcl9wcm9maWxlX21vZGUgPT0gUFBfU01DX1BPV0VSX1BST0ZJTEVf
Q1VTVE9NKSB7Ci0JCWlmIChzaXplIDwgMCkKLQkJCXJldHVybiAtRUlOVkFMOwotCiAJCXJldCA9
IHNtdV91cGRhdGVfdGFibGUoc211LAogCQkJCSAgICAgICBTTVVfVEFCTEVfQUNUSVZJVFlfTU9O
SVRPUl9DT0VGRiB8IFdPUktMT0FEX1BQTElCX0NVU1RPTV9CSVQgPDwgMTYsCiAJCQkJICAgICAg
ICh2b2lkICopKCZhY3Rpdml0eV9tb25pdG9yKSwgZmFsc2UpOwotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
