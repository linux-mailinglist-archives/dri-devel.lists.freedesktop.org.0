Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B246159E66
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EB16E93E;
	Fri, 28 Jun 2019 15:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1408B6E93E;
 Fri, 28 Jun 2019 15:05:42 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgsRX-0002UM-E3; Fri, 28 Jun 2019 15:05:39 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu/mes10.1: fix duplicated assignment to
 adev->mes.ucode_fw_version
Date: Fri, 28 Jun 2019 16:05:39 +0100
Message-Id: <20190628150539.12195-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSBhZGV2LT5tZXMudWNvZGVfZndfdmVyc2lvbiBpcyBiZWluZyBhc3NpZ25lZCB0d2ljZSB3aXRo
CmRpZmZlcmVudCB2YWx1ZXMuIFRoaXMgbG9va3MgbGlrZSBhIGN1dC1uLXBhc3RlIGVycm9yIGFu
ZCBpbnN0ZWFkCnRoZSBzZWNvbmQgYXNzaWdubWVudCBzaG91bGQgYmUgYWRldi0+bWVzLmRhdGFf
ZndfdmVyc2lvbi4gRml4CnRoaXMuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZhbHVl
IikKRml4ZXM6IDI5OGQwNTQ2MGNjNCAoImRybS9hbWRncHUvbWVzMTAuMTogbG9hZCBtZXMgZmly
bXdhcmUgZmlsZSB0byBDUFUgYnVmZmVyIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcg
PGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9tZXNfdjEwXzEuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192
MTBfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbWVzX3YxMF8xLmMKaW5kZXggMjlm
YWI3OTg0ODU1Li4yYTI3ZjBiMzBiYjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L21lc192MTBfMS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192
MTBfMS5jCkBAIC05MSw3ICs5MSw3IEBAIHN0YXRpYyBpbnQgbWVzX3YxMF8xX2luaXRfbWljcm9j
b2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJbWVzX2hkciA9IChjb25zdCBzdHJ1
Y3QgbWVzX2Zpcm13YXJlX2hlYWRlcl92MV8wICopYWRldi0+bWVzLmZ3LT5kYXRhOwogCWFkZXYt
Pm1lcy51Y29kZV9md192ZXJzaW9uID0gbGUzMl90b19jcHUobWVzX2hkci0+bWVzX3Vjb2RlX3Zl
cnNpb24pOwotCWFkZXYtPm1lcy51Y29kZV9md192ZXJzaW9uID0KKwlhZGV2LT5tZXMuZGF0YV9m
d192ZXJzaW9uID0KIAkJbGUzMl90b19jcHUobWVzX2hkci0+bWVzX3Vjb2RlX2RhdGFfdmVyc2lv
bik7CiAJYWRldi0+bWVzLnVjX3N0YXJ0X2FkZHIgPQogCQlsZTMyX3RvX2NwdShtZXNfaGRyLT5t
ZXNfdWNfc3RhcnRfYWRkcl9sbykgfAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
