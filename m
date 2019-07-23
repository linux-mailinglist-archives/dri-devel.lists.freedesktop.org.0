Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E17198D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 15:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0316E296;
	Tue, 23 Jul 2019 13:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A567C6E297;
 Tue, 23 Jul 2019 13:41:23 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hpv2f-0007vi-0P; Tue, 23 Jul 2019 13:41:21 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Leo Liu <leo.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: remove redundant assignment to pointer
 'ring'
Date: Tue, 23 Jul 2019 14:41:20 +0100
Message-Id: <20190723134120.28441-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBwb2lu
dGVyICdyaW5nJyBpcyBiZWluZyBhc3NpZ25lZCBhIHZhbHVlIHRoYXQgaXMgbmV2ZXIKcmVhZCwg
aGVuY2UgdGhlIGFzc2lnbm1lbnQgaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KCkFk
ZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92MV8wLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMKaW5kZXggOTNiMzUwMGU1MjJiLi5h
MmE4Y2E5NDJmMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92
MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYwpAQCAtMTMz
MSw3ICsxMzMxLDYgQEAgc3RhdGljIGludCB2Y25fdjFfMF9wYXVzZV9kcGdfbW9kZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVWRF9KUkJD
X1JCX0NOVEwsCiAJCQkJCQkJVVZEX0pSQkNfUkJfQ05UTF9fUkJfUlBUUl9XUl9FTl9NQVNLKTsK
IAotCQkJCXJpbmcgPSAmYWRldi0+dmNuLmluc3QtPnJpbmdfZGVjOwogCQkJCVdSRUczMl9TT0Mx
NShVVkQsIDAsIG1tVVZEX1JCQ19SQl9XUFRSLAogCQkJCQkJICAgUlJFRzMyX1NPQzE1KFVWRCwg
MCwgbW1VVkRfU0NSQVRDSDIpICYgMHg3RkZGRkZGRik7CiAJCQkJU09DMTVfV0FJVF9PTl9SUkVH
KFVWRCwgMCwgbW1VVkRfUE9XRVJfU1RBVFVTLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
