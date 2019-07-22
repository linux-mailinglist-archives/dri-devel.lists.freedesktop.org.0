Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281336FE04
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 12:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E8089C16;
	Mon, 22 Jul 2019 10:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410E489A77
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:43:29 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55388
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpVmx-0001lD-A8; Mon, 22 Jul 2019 12:43:27 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/tinydrm/mipi-dbi: Select DRM_KMS_HELPER
Date: Mon, 22 Jul 2019 12:43:10 +0200
Message-Id: <20190722104312.16184-8-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722104312.16184-1-noralf@tronnes.org>
References: <20190722104312.16184-1-noralf@tronnes.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=mjqglcz27VKBjehvOGMCF17d5hikRR7l1XBNrOwVKpU=; 
 b=Bb8XEBnrrcr9OGpUe4qtOCBM1aymHpb7Y4RT9rhL2Z1vvzPo0OuHAqF/CJKR8xi8FnchNQrYrG6Draf5M66h9f5jeKtuZWW1W9JPuB6+hlmvZFZoz9jnyTdfuP0LAHDHfq7aWvcaIHd8V+xsxJFPr38DNN5bBeIsCJIusHyT0HiXLdSABpN7IUYSyN73p7eJWAG5hnkSJg0dnlWQqGc69Psidp7noRjNmdA83Zjq+JlI+q/FyPGt4qdLeb5ylpwGny2bGHnZuNHhwRqa021+u8yGIcy8MulEMxfaGvhAxOXxM2FjSboEnsk3XD0z5vQB39jeZvC/PpwAcYLesIKmDA==;
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
Cc: sam@ravnborg.org, david@lechnology.com, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bWlwaS1kYmkgdXNlcyBzZXZlcmFsIEtNUyBoZWxwZXIgZnVuY3Rpb25zIGJ1dCB0aGF0IGJ1aWxk
IGRlcGVuZGVuY3kgaXMKbm90IGV4cHJlc3NlZC4gU2VsZWN0IERSTV9LTVNfSEVMUEVSIHRvIGZp
eCB0aGF0LgoKUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmln
IGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwppbmRleCBmMmYwNzM5ZDEwMzUuLjYz
NzY5NzY0OTYxMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmlnCkBAIC0xMCw2ICsxMCw3IEBAIG1l
bnVjb25maWcgRFJNX1RJTllEUk0KIAogY29uZmlnIFRJTllEUk1fTUlQSV9EQkkKIAl0cmlzdGF0
ZQorCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCiBjb25maWcgVElOWURSTV9IWDgzNTdECiAJdHJp
c3RhdGUgIkRSTSBzdXBwb3J0IGZvciBIWDgzNTdEIGRpc3BsYXkgcGFuZWxzIgotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
