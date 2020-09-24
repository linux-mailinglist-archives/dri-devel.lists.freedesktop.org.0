Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905E8278125
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71026EC07;
	Fri, 25 Sep 2020 07:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625436E442
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 14:18:37 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 409F99240FE602BAB053;
 Thu, 24 Sep 2020 22:18:31 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 24 Sep 2020
 22:18:27 +0800
From: Li Heng <liheng40@huawei.com>
To: <tomi.valkeinen@ti.com>, <b.zolnierkie@samsung.com>
Subject: [PATCH -next] video: Remove set but not used variable
Date: Thu, 24 Sep 2020 22:18:26 +0800
Message-ID: <1600957106-13741-1-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy92
aWRlby9mYmRldi9zaXMvMzAwdnRibC5oOjEwNjQ6Mjg6IHdhcm5pbmc6CuKAmFNpUzMwMF9DSFRW
VkNMS1NPTlRTQ+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFi
bGU9XQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQt
b2ZmLWJ5OiBMaSBIZW5nIDxsaWhlbmc0MEBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvc2lzLzMwMHZ0YmwuaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2lzLzMwMHZ0YmwuaCBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvc2lzLzMwMHZ0YmwuaAppbmRleCBlNGI0YTI2Li4yNmIxOWY3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy8zMDB2dGJsLmgKKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9zaXMvMzAwdnRibC5oCkBAIC0xMDYxLDggKzEwNjEsNiBAQCBzdGF0aWMgY29u
c3QgdW5zaWduZWQgY2hhciBTaVMzMDBfQ0hUVlZDTEtVTlRTQ1tdICA9IHsgMHgyOSwweDI5LDB4
MjksMHgyOSwweDJhLAoKIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIFNpUzMwMF9DSFRWVkNM
S09OVFNDW10gID0geyAweDJjLDB4MmMsMHgyYywweDJjLDB4MmQsMHgyYiB9OwoKLXN0YXRpYyBj
b25zdCB1bnNpZ25lZCBjaGFyIFNpUzMwMF9DSFRWVkNMS1NPTlRTQ1tdID0geyAweDJjLDB4MmMs
MHgyYywweDJjLDB4MmQsMHgyYiB9OwotCiBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBTaVMz
MDBfQ0hUVlZDTEtVUEFMW10gICA9IHsgMHgyZiwweDJmLDB4MmYsMHgyZiwweDJmLDB4MzEgfTsK
CiBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBTaVMzMDBfQ0hUVlZDTEtPUEFMW10gICA9IHsg
MHgyZiwweDJmLDB4MmYsMHgyZiwweDMwLDB4MzIgfTsKLS0KMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
