Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3314264E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064446E862;
	Mon, 20 Jan 2020 08:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D72E6E36F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 12:20:43 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8EE9479CA32EEF2EE3A0;
 Sun, 19 Jan 2020 20:20:39 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Sun, 19 Jan 2020
 20:20:31 +0800
From: yu kuai <yukuai3@huawei.com>
To: <b.zolnierkie@samsung.com>
Subject: [PATCH] video: remove set but not used variable 'ulScaleRight'
Date: Sun, 19 Jan 2020 20:19:45 +0800
Message-ID: <20200119121945.12517-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.17.2
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
aWRlby9mYmRldi9reXJvL1NURzQwMDBPdmVybGF5RGV2aWNlLmM6IEluIGZ1bmN0aW9uCuKAmFNl
dE92ZXJsYXlWaWV3UG9ydOKAmToKZHJpdmVycy92aWRlby9mYmRldi9reXJvL1NURzQwMDBPdmVy
bGF5RGV2aWNlLmM6MzM0OjE5OiB3YXJuaW5nOgp2YXJpYWJsZSDigJh1bFNjYWxlUmlnaHTigJkg
c2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIG5ldmVy
IHVzZWQsIGFuZCBzbyBjYW4gYmUgcmVtb3ZlZC4KClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1
a3VhaTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwME92
ZXJsYXlEZXZpY2UuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9reXJvL1NURzQw
MDBPdmVybGF5RGV2aWNlLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwME92ZXJs
YXlEZXZpY2UuYwppbmRleCAwYWVlYWExMDcwOGIuLjlmZGUwZTNiNjllYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9reXJvL1NURzQwMDBPdmVybGF5RGV2aWNlLmMKKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9reXJvL1NURzQwMDBPdmVybGF5RGV2aWNlLmMKQEAgLTMzMSw3ICsz
MzEsNyBAQCBpbnQgU2V0T3ZlcmxheVZpZXdQb3J0KHZvbGF0aWxlIFNURzQwMDBSRUcgX19pb21l
bSAqcFNUR1JlZywKIAl1MzIgdWxTY2FsZTsKIAl1MzIgdWxMZWZ0LCB1bFJpZ2h0OwogCXUzMiB1
bFNyY0xlZnQsIHVsU3JjUmlnaHQ7Ci0JdTMyIHVsU2NhbGVMZWZ0LCB1bFNjYWxlUmlnaHQ7CisJ
dTMyIHVsU2NhbGVMZWZ0OwogCXUzMiB1bGhEZWNpbTsKIAl1MzIgdWxzVmFsOwogCXUzMiB1bFZl
cnREZWNGYWN0b3I7CkBAIC00NzAsNyArNDcwLDYgQEAgaW50IFNldE92ZXJsYXlWaWV3UG9ydCh2
b2xhdGlsZSBTVEc0MDAwUkVHIF9faW9tZW0gKnBTVEdSZWcsCiAJCSAqIHJvdW5kIGRvd24gdGhl
IHBpeGVsIHBvcyB0byB0aGUgbmVhcmVzdCA4IHBpeGVscy4KIAkJICovCiAJCXVsU2NhbGVMZWZ0
ID0gdWxTcmNMZWZ0OwotCQl1bFNjYWxlUmlnaHQgPSB1bFNyY1JpZ2h0OwogCiAJCS8qIHNoaWZ0
IGZ4c2NhbGUgdW50aWwgaXQgaXMgaW4gdGhlIHJhbmdlIG9mIHRoZSBzY2FsZXIgKi8KIAkJdWxo
RGVjaW0gPSAwOwotLSAKMi4xNy4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
