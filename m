Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDADC14265D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B9A6E86B;
	Mon, 20 Jan 2020 08:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1530B6E5A2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 06:34:27 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4DC9D7ACF38E0BE79970;
 Mon, 20 Jan 2020 14:34:23 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 20 Jan 2020
 14:34:13 +0800
From: yu kuai <yukuai3@huawei.com>
To: <b.zolnierkie@samsung.com>
Subject: [PATCH V2] video: remove set but not used variable 'mach64RefFreq'
Date: Mon, 20 Jan 2020 14:33:27 +0800
Message-ID: <20200120063327.43548-1-yukuai3@huawei.com>
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
aWRlby9mYmRldi9hdHkvbWFjaDY0X2d4LmM6IEluIGZ1bmN0aW9uIOKAmGF0eV92YXJfdG9fcGxs
XzgzOTjigJk6CmRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9neC5jOjYyMTozNjogd2Fy
bmluZzogdmFyaWFibGUK4oCYbWFjaDY0UmVmRnJlceKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbmV2ZXIgdXNlZCwgYW5kIHNvIGNhbiBiZSBy
ZW1vdmVkLgoKU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgotLS0K
Y2hhbmdlcyBpbiBWMjoKIEZpeCB0aGUgbWlzdGFrZSB0aGF0IGRlZmluaXRpb24gb2YgJ21hY2g2
NE1pbkZyZXEnIGFuZCAnbWFjaDY0TWF4RnJlcScKIHdhcyByZW1vdmVkLgoKIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvYXR5L21hY2g2NF9neC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2F0eS9tYWNoNjRfZ3guYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9neC5jCmlu
ZGV4IDI3Y2I2NWZhMmJhMi4uOWMzN2UyOGZiNzhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2F0eS9tYWNoNjRfZ3guYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9tYWNo
NjRfZ3guYwpAQCAtNjE4LDE0ICs2MTgsMTMgQEAgc3RhdGljIGludCBhdHlfdmFyX3RvX3BsbF84
Mzk4KGNvbnN0IHN0cnVjdCBmYl9pbmZvICppbmZvLCB1MzIgdmNsa19wZXIsCiAJdTMyIG1oejEw
MDsJCS8qIGluIDAuMDEgTUh6ICovCiAJdTMyIHByb2dyYW1fYml0czsKIAkvKiB1MzIgcG9zdF9k
aXZpZGVyOyAqLwotCXUzMiBtYWNoNjRNaW5GcmVxLCBtYWNoNjRNYXhGcmVxLCBtYWNoNjRSZWZG
cmVxOworCXUzMiBtYWNoNjRNaW5GcmVxLCBtYWNoNjRNYXhGcmVxOwogCXUxNiBtLCBuLCBrID0g
MCwgc2F2ZV9tLCBzYXZlX24sIHR3b1RvS3RoOwogCiAJLyogQ2FsY3VsYXRlIHRoZSBwcm9ncmFt
bWluZyB3b3JkICovCiAJbWh6MTAwID0gMTAwMDAwMDAwIC8gdmNsa19wZXI7CiAJbWFjaDY0TWlu
RnJlcSA9IE1JTl9GUkVRXzI1OTU7CiAJbWFjaDY0TWF4RnJlcSA9IE1BWF9GUkVRXzI1OTU7Ci0J
bWFjaDY0UmVmRnJlcSA9IFJFRl9GUkVRXzI1OTU7CS8qIDE0LjMyIE1IeiAqLwogCiAJc2F2ZV9t
ID0gMDsKIAlzYXZlX24gPSAwOwotLSAKMi4xNy4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
