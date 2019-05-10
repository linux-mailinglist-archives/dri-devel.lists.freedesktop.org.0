Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E619B01
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 12:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F6089B30;
	Fri, 10 May 2019 10:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1466D89AAD;
 Fri, 10 May 2019 10:08:46 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hP2SJ-00013j-8B; Fri, 10 May 2019 10:08:43 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: fix return of an uninitialized value in
 variable ret
Date: Fri, 10 May 2019 11:08:42 +0100
Message-Id: <20190510100842.30458-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkluIHRoZSBj
YXNlIHdoZXJlIGlzX2VuYWJsZSBpcyBmYWxzZSBhbmQgbG9fYmFzZV9hZGRyIGlzIG5vbi16ZXJv
IHRoZQp2YXJpYWJsZSByZXQgaGFzIG5vdCBiZWVuIGluaXRpYWxpemVkIGFuZCBpcyBiZWluZyBj
aGVja2VkIGZvciBub24temVybwphbmQgcG90ZW50aWFsbHkgZ2FyYmFnZSBpcyBiZWluZyByZXR1
cm5lZC4gRml4IHRoaXMgYnkgbm90IHJldHVybmluZwpyZXQgYnV0IGluc3RlYWQgcmV0dXJuaW5n
IC1FSU5WQUwgb24gdGhlIHplcm8gbG9fYmFzZV9hZGRyIGNhc2UuCgpBZGRyZXNzZXMtQ292ZXJp
dHk6ICgiVW5pbml0aWFsaXplZCBzY2FsYXIgdmFyaWFibGUiKQpGaXhlczogYTZhYzBiNDRiYWI5
ICgiZHJtL2FtZGdwdTogYWRkIGRmIHBlcmZtb24gcmVncyBhbmQgZnVuY3MgZm9yIHhnbWkiKQpT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDUgKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9kZl92M182LmMKaW5kZXggYTVjMzU1ODg2OWZiLi44YzA5YmY5OTRhY2QgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKQEAgLTM5OCwxMCArMzk4LDcgQEAgc3RhdGlj
IGludCBkZl92M182X3N0YXJ0X3hnbWlfbGlua19jbnRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCQkJCU5VTEwpOwogCiAJCWlmIChsb19iYXNlX2FkZHIgPT0gMCkKLQkJCXJldCA9IC1F
SU5WQUw7Ci0KLQkJaWYgKHJldCkKLQkJCXJldHVybiByZXQ7CisJCQlyZXR1cm4gLUVJTlZBTDsK
IAogCQlsb192YWwgPSBSUkVHMzJfUENJRShsb19iYXNlX2FkZHIpOwogCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
