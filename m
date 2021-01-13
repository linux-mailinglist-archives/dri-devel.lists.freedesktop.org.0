Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D82F5D4B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28C76E111;
	Thu, 14 Jan 2021 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A79C6E30F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 09:19:47 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DG21n2Dldzj4VQ;
 Wed, 13 Jan 2021 17:18:53 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 13 Jan 2021 17:19:36 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/hisilicon: Fix build error
Date: Wed, 13 Jan 2021 17:19:28 +0800
Message-ID: <1610529568-25754-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZXJyb3JzOgpkaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMv
aGlibWNfZHJtX2Rydi5jOgpJbiBmdW5jdGlvbiDigJhoaWJtY19od19tYXDigJk6CmRyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jOjIxMzoyNToKZXJyb3I6IOKA
mGRlduKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7CgpGaXhlczog
NGQ0ZGFkMjFjYzdiZWUgImRybS9oaWJtYzogUmVtb3ZlIHJlZmVyZW5jZXMgdG8gc3RydWN0IGRy
bV9kZXZpY2UucGRldiIKU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNv
bi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCmlu
ZGV4IDBhMmVkYzcuLmFiZDYyNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24v
aGlibWMvaGlibWNfZHJtX2Rydi5jCkBAIC0yMTAsNyArMjEwLDcgQEAgc3RhdGljIHZvaWQgaGli
bWNfaHdfY29uZmlnKHN0cnVjdCBoaWJtY19kcm1fcHJpdmF0ZSAqcHJpdikKIAogc3RhdGljIGlu
dCBoaWJtY19od19tYXAoc3RydWN0IGhpYm1jX2RybV9wcml2YXRlICpwcml2KQogewotCXN0cnVj
dCBwY2lfZGV2ICpwZGV2ID0gZGV2LT5wZGV2OworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAm
cHJpdi0+ZGV2OwogCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYtPmRldik7
CiAJcmVzb3VyY2Vfc2l6ZV90IGFkZHIsIHNpemUsIGlvYWRkciwgaW9zaXplOwogCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
