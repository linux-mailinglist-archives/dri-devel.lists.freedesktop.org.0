Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624BD14265E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE59B6E875;
	Mon, 20 Jan 2020 08:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C8E6E35D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 12:18:29 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A6758F5E5F10B0003819;
 Sun, 19 Jan 2020 20:18:26 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sun, 19 Jan 2020
 20:18:18 +0800
From: yu kuai <yukuai3@huawei.com>
To: <benh@kernel.crashing.org>, <b.zolnierkie@samsung.com>
Subject: [PATCH 3/4] video: fbdev: remove set but not used variable 'vSyncPol'
Date: Sun, 19 Jan 2020 20:17:29 +0800
Message-ID: <20200119121730.10701-4-yukuai3@huawei.com>
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
X3BhcuKAmToKZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYzoxNjUzOjQ4OiB3
YXJuaW5nOiB2YXJpYWJsZQrigJhjU3luY+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbmV2ZXIgdXNlZCwgYW5kIHNvIGNhbiBiZSByZW1vdmVk
LgoKU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgotLS0KIGRyaXZl
cnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFk
ZW9uX2Jhc2UuYwppbmRleCAwNjY2Zjg0OGJmNzAuLjdkMmVlODg5ZmZjZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYworKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jCkBAIC0xNjUwLDcgKzE2NTAsNyBAQCBzdGF0aWMgaW50
IHJhZGVvbmZiX3NldF9wYXIoc3RydWN0IGZiX2luZm8gKmluZm8pCiAJc3RydWN0IGZiX3Zhcl9z
Y3JlZW5pbmZvICptb2RlID0gJmluZm8tPnZhcjsKIAlzdHJ1Y3QgcmFkZW9uX3JlZ3MgKm5ld21v
ZGU7CiAJaW50IGhUb3RhbCwgdlRvdGFsLCBoU3luY1N0YXJ0LCBoU3luY0VuZCwKLQkgICAgdlN5
bmNTdGFydCwgdlN5bmNFbmQsIGNTeW5jOworCSAgICB2U3luY1N0YXJ0LCB2U3luY0VuZDsKIAl1
OCBoc3luY19hZGpfdGFiW10gPSB7MCwgMHgxMiwgOSwgOSwgNiwgNX07CiAJdTggaHN5bmNfZnVk
Z2VfZnBbXSA9IHsyLCAyLCAwLCAwLCA1LCA1fTsKIAl1MzIgc3luYywgaF9zeW5jX3BvbCwgdl9z
eW5jX3BvbCwgZG90Q2xvY2ssIHBpeENsb2NrOwpAQCAtMTczMCw4ICsxNzMwLDYgQEAgc3RhdGlj
IGludCByYWRlb25mYl9zZXRfcGFyKHN0cnVjdCBmYl9pbmZvICppbmZvKQogCWVsc2UgaWYgKHZz
eW5jX3dpZCA+IDB4MWYpCS8qIG1heCAqLwogCQl2c3luY193aWQgPSAweDFmOwogCi0JY1N5bmMg
PSBtb2RlLT5zeW5jICYgRkJfU1lOQ19DT01QX0hJR0hfQUNUID8gKDEgPDwgNCkgOiAwOwotCiAJ
Zm9ybWF0ID0gcmFkZW9uX2dldF9kc3RicHAoZGVwdGgpOwogCWJ5dHBwID0gbW9kZS0+Yml0c19w
ZXJfcGl4ZWwgPj4gMzsKIAotLSAKMi4xNy4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
