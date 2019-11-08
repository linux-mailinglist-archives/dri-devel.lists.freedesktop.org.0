Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E555F4E9A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 15:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085DF6F9BB;
	Fri,  8 Nov 2019 14:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2EC6F9BB;
 Fri,  8 Nov 2019 14:45:30 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iT5Vv-0007iL-Vj; Fri, 08 Nov 2019 14:45:28 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: remove duplicated assignment to
 grph_obj_type
Date: Fri,  8 Nov 2019 14:45:27 +0000
Message-Id: <20191108144527.120927-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClZhcmlhYmxl
IGdycGhfb2JqX3R5cGUgaXMgYmVpbmcgYXNzaWduZWQgdHdpY2UsIG9uZSBvZiB0aGVzZSBpcwpy
ZWR1bmRhbnQgc28gcmVtb3ZlIGl0LgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIkV2YWx1YXRpb24g
b3JkZXIgdmlvbGF0aW9uIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtp
bmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YXRvbWJpb3MuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2F0b21iaW9zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWJpb3Mu
YwppbmRleCBiZTZkMGNmZTQxYWUuLjliYTgwZDgyODg3NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0b21iaW9zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2F0b21iaW9zLmMKQEAgLTM2NSw4ICszNjUsNyBAQCBib29sIGFt
ZGdwdV9hdG9tYmlvc19nZXRfY29ubmVjdG9yX2luZm9fZnJvbV9vYmplY3RfdGFibGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKgogCQkJcm91dGVyLmRkY192YWxpZCA9IGZhbHNlOwogCQkJcm91dGVy
LmNkX3ZhbGlkID0gZmFsc2U7CiAJCQlmb3IgKGogPSAwOyBqIDwgKChsZTE2X3RvX2NwdShwYXRo
LT51c1NpemUpIC0gOCkgLyAyKTsgaisrKSB7Ci0JCQkJdWludDhfdCBncnBoX29ial90eXBlPQot
CQkJCWdycGhfb2JqX3R5cGUgPQorCQkJCXVpbnQ4X3QgZ3JwaF9vYmpfdHlwZSA9CiAJCQkJICAg
IChsZTE2X3RvX2NwdShwYXRoLT51c0dyYXBoaWNPYmpJZHNbal0pICYKIAkJCQkgICAgIE9CSkVD
VF9UWVBFX01BU0spID4+IE9CSkVDVF9UWVBFX1NISUZUOwogCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
