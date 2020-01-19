Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA05142650
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2B26E868;
	Mon, 20 Jan 2020 08:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C776E373
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 12:18:29 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9D748BB7BBD5755883CC;
 Sun, 19 Jan 2020 20:18:26 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sun, 19 Jan 2020
 20:18:17 +0800
From: yu kuai <yukuai3@huawei.com>
To: <benh@kernel.crashing.org>, <b.zolnierkie@samsung.com>
Subject: [PATCH 1/4] video: fbdev: remove set but not used variable 'hSyncPol'
Date: Sun, 19 Jan 2020 20:17:27 +0800
Message-ID: <20200119121730.10701-2-yukuai3@huawei.com>
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
X3BhcuKAmToKZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYzoxNjUzOjY6IHdh
cm5pbmc6IHZhcmlhYmxlCuKAmGhTeW5jUG9s4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBuZXZlciB1c2VkLCBhbmQgc28gY2FuIGJlIHJlbW92
ZWQuCgpTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Ci0tLQogZHJp
dmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L3Jh
ZGVvbl9iYXNlLmMKaW5kZXggM2FmMDBlM2I5NjVlLi5kMmU2OGVjNTgwYzIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMKKysrIGIvZHJpdmVycy92aWRl
by9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYwpAQCAtMTY1MCw3ICsxNjUwLDcgQEAgc3RhdGljIGlu
dCByYWRlb25mYl9zZXRfcGFyKHN0cnVjdCBmYl9pbmZvICppbmZvKQogCXN0cnVjdCBmYl92YXJf
c2NyZWVuaW5mbyAqbW9kZSA9ICZpbmZvLT52YXI7CiAJc3RydWN0IHJhZGVvbl9yZWdzICpuZXdt
b2RlOwogCWludCBoVG90YWwsIHZUb3RhbCwgaFN5bmNTdGFydCwgaFN5bmNFbmQsCi0JICAgIGhT
eW5jUG9sLCB2U3luY1N0YXJ0LCB2U3luY0VuZCwgdlN5bmNQb2wsIGNTeW5jOworCSAgICB2U3lu
Y1N0YXJ0LCB2U3luY0VuZCwgdlN5bmNQb2wsIGNTeW5jOwogCXU4IGhzeW5jX2Fkal90YWJbXSA9
IHswLCAweDEyLCA5LCA5LCA2LCA1fTsKIAl1OCBoc3luY19mdWRnZV9mcFtdID0gezIsIDIsIDAs
IDAsIDUsIDV9OwogCXUzMiBzeW5jLCBoX3N5bmNfcG9sLCB2X3N5bmNfcG9sLCBkb3RDbG9jaywg
cGl4Q2xvY2s7CkBAIC0xNzMwLDcgKzE3MzAsNiBAQCBzdGF0aWMgaW50IHJhZGVvbmZiX3NldF9w
YXIoc3RydWN0IGZiX2luZm8gKmluZm8pCiAJZWxzZSBpZiAodnN5bmNfd2lkID4gMHgxZikJLyog
bWF4ICovCiAJCXZzeW5jX3dpZCA9IDB4MWY7CiAKLQloU3luY1BvbCA9IG1vZGUtPnN5bmMgJiBG
Ql9TWU5DX0hPUl9ISUdIX0FDVCA/IDAgOiAxOwogCXZTeW5jUG9sID0gbW9kZS0+c3luYyAmIEZC
X1NZTkNfVkVSVF9ISUdIX0FDVCA/IDAgOiAxOwogCiAJY1N5bmMgPSBtb2RlLT5zeW5jICYgRkJf
U1lOQ19DT01QX0hJR0hfQUNUID8gKDEgPDwgNCkgOiAwOwotLSAKMi4xNy4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
