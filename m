Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B814265F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EC16E88A;
	Mon, 20 Jan 2020 08:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10AD6E36F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 12:21:36 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5A30590EA04A69A8F4B8;
 Sun, 19 Jan 2020 20:21:35 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Sun, 19 Jan 2020
 20:21:24 +0800
From: yu kuai <yukuai3@huawei.com>
To: <b.zolnierkie@samsung.com>
Subject: [PATCH] video: remove set but not used variable 'mach64RefFreq'
Date: Sun, 19 Jan 2020 20:20:38 +0800
Message-ID: <20200119122038.13425-1-yukuai3@huawei.com>
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
IGRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9neC5jIHwgMiAtLQogMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkv
bWFjaDY0X2d4LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9tYWNoNjRfZ3guYwppbmRleCAy
N2NiNjVmYTJiYTIuLjFiNzFhNWFhMmJhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di9hdHkvbWFjaDY0X2d4LmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2d4
LmMKQEAgLTYxOCwxNCArNjE4LDEyIEBAIHN0YXRpYyBpbnQgYXR5X3Zhcl90b19wbGxfODM5OChj
b25zdCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgdTMyIHZjbGtfcGVyLAogCXUzMiBtaHoxMDA7CQkv
KiBpbiAwLjAxIE1IeiAqLwogCXUzMiBwcm9ncmFtX2JpdHM7CiAJLyogdTMyIHBvc3RfZGl2aWRl
cjsgKi8KLQl1MzIgbWFjaDY0TWluRnJlcSwgbWFjaDY0TWF4RnJlcSwgbWFjaDY0UmVmRnJlcTsK
IAl1MTYgbSwgbiwgayA9IDAsIHNhdmVfbSwgc2F2ZV9uLCB0d29Ub0t0aDsKIAogCS8qIENhbGN1
bGF0ZSB0aGUgcHJvZ3JhbW1pbmcgd29yZCAqLwogCW1oejEwMCA9IDEwMDAwMDAwMCAvIHZjbGtf
cGVyOwogCW1hY2g2NE1pbkZyZXEgPSBNSU5fRlJFUV8yNTk1OwogCW1hY2g2NE1heEZyZXEgPSBN
QVhfRlJFUV8yNTk1OwotCW1hY2g2NFJlZkZyZXEgPSBSRUZfRlJFUV8yNTk1OwkvKiAxNC4zMiBN
SHogKi8KIAogCXNhdmVfbSA9IDA7CiAJc2F2ZV9uID0gMDsKLS0gCjIuMTcuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
