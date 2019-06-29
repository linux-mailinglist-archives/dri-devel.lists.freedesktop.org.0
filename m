Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7195AAF8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 14:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DD16E99F;
	Sat, 29 Jun 2019 12:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47F46E99F;
 Sat, 29 Jun 2019 12:37:26 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hhCbc-0006uv-0b; Sat, 29 Jun 2019 12:37:24 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/amdgpu: remove redundant assignment to variable
 res
Date: Sat, 29 Jun 2019 13:37:23 +0100
Message-Id: <20190629123723.12752-1-colin.king@canonical.com>
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
IHJlcyBpcyBiZWluZyBpbml0aWFsaXplZCB3aXRoIGEgdmFsdWUgdGhhdCBpcyBuZXZlciByZWFk
CmFuZCByZXMgaXMgYmVpbmcgcmUtYXNzaWduZWQgYSBsaXR0bGUgbGF0ZXIgb24uIFRoZSBhc3Np
Z25tZW50IGlzCnJlZHVuZGFudCBhbmQgaGVuY2UgY2FuIGJlIHJlbW92ZWQuCgpBZGRyZXNzZXMt
Q292ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcg
PGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggZGYwOGVhMTcyNTk1Li45YjFiZDg3MjZmYzIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwpAQCAtNDUyNyw3ICs0NTI3LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1fcGxhbmVfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiB7CiAJdWludDMyX3QgZm9ybWF0
c1szMl07CiAJaW50IG51bV9mb3JtYXRzOwotCWludCByZXMgPSAtRVBFUk07CisJaW50IHJlczsK
IAogCW51bV9mb3JtYXRzID0gZ2V0X3BsYW5lX2Zvcm1hdHMocGxhbmUsIHBsYW5lX2NhcCwgZm9y
bWF0cywKIAkJCQkJQVJSQVlfU0laRShmb3JtYXRzKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
