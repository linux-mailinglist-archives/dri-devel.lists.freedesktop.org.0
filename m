Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AF3142658
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FF36E880;
	Mon, 20 Jan 2020 08:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F1E6E388
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 12:18:29 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 98785683CF474A60389B;
 Sun, 19 Jan 2020 20:18:26 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sun, 19 Jan 2020
 20:18:18 +0800
From: yu kuai <yukuai3@huawei.com>
To: <benh@kernel.crashing.org>, <b.zolnierkie@samsung.com>
Subject: [PATCH 2/4] video: fbdev: remove set but not used variable 'vSyncPol'
Date: Sun, 19 Jan 2020 20:17:28 +0800
Message-ID: <20200119121730.10701-3-yukuai3@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200119121730.10701-1-yukuai3@huawei.com>
References: <20200119121730.10701-1-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 20 Jan 2020 08:58:36 +0000
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
Cc: linux-fbdev@vger.kernel.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhengbin13@huawei.com, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy92
aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYzogSW4gZnVuY3Rpb24K4oCYcmFkZW9uZmJfc2V0
X3BhcuKAmToKZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYzoxNjUzOjM4OiB3
YXJuaW5nOiB2YXJpYWJsZQrigJh2U3luY1BvbOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbmV2ZXIgdXNlZCwgYW5kIHNvIGNhbiBiZSByZW1v
dmVkLgoKU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgotLS0KIGRy
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkv
cmFkZW9uX2Jhc2UuYwppbmRleCBkMmU2OGVjNTgwYzIuLjA2NjZmODQ4YmY3MCAxMDA2NDQKLS0t
IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYworKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jCkBAIC0xNjUwLDcgKzE2NTAsNyBAQCBzdGF0aWMg
aW50IHJhZGVvbmZiX3NldF9wYXIoc3RydWN0IGZiX2luZm8gKmluZm8pCiAJc3RydWN0IGZiX3Zh
cl9zY3JlZW5pbmZvICptb2RlID0gJmluZm8tPnZhcjsKIAlzdHJ1Y3QgcmFkZW9uX3JlZ3MgKm5l
d21vZGU7CiAJaW50IGhUb3RhbCwgdlRvdGFsLCBoU3luY1N0YXJ0LCBoU3luY0VuZCwKLQkgICAg
dlN5bmNTdGFydCwgdlN5bmNFbmQsIHZTeW5jUG9sLCBjU3luYzsKKwkgICAgdlN5bmNTdGFydCwg
dlN5bmNFbmQsIGNTeW5jOwogCXU4IGhzeW5jX2Fkal90YWJbXSA9IHswLCAweDEyLCA5LCA5LCA2
LCA1fTsKIAl1OCBoc3luY19mdWRnZV9mcFtdID0gezIsIDIsIDAsIDAsIDUsIDV9OwogCXUzMiBz
eW5jLCBoX3N5bmNfcG9sLCB2X3N5bmNfcG9sLCBkb3RDbG9jaywgcGl4Q2xvY2s7CkBAIC0xNzMw
LDggKzE3MzAsNiBAQCBzdGF0aWMgaW50IHJhZGVvbmZiX3NldF9wYXIoc3RydWN0IGZiX2luZm8g
KmluZm8pCiAJZWxzZSBpZiAodnN5bmNfd2lkID4gMHgxZikJLyogbWF4ICovCiAJCXZzeW5jX3dp
ZCA9IDB4MWY7CiAKLQl2U3luY1BvbCA9IG1vZGUtPnN5bmMgJiBGQl9TWU5DX1ZFUlRfSElHSF9B
Q1QgPyAwIDogMTsKLQogCWNTeW5jID0gbW9kZS0+c3luYyAmIEZCX1NZTkNfQ09NUF9ISUdIX0FD
VCA/ICgxIDw8IDQpIDogMDsKIAogCWZvcm1hdCA9IHJhZGVvbl9nZXRfZHN0YnBwKGRlcHRoKTsK
LS0gCjIuMTcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
