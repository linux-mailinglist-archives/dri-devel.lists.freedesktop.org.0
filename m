Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F492A2BC9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0126EB7C;
	Mon,  2 Nov 2020 13:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0046D6E441
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:21:36 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CPnV33Bt7z72BL;
 Mon,  2 Nov 2020 17:21:31 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 17:21:23 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <robh@kernel.org>, <tomeu.vizoso@collabora.com>, <steven.price@arm.com>,
 <alyssa.rosenzweig@collabora.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/panfrost: Fix unused variable warning
Date: Mon, 2 Nov 2020 17:33:19 +0800
Message-ID: <1604309599-10078-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: Zou Wei <zou_wei@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmc6CgouL3BhbmZyb3N0
X2pvYi5jOjYxNzoyODogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGpz4oCZIFstV3VudXNl
ZC12YXJpYWJsZV0KICBzdHJ1Y3QgcGFuZnJvc3Rfam9iX3Nsb3QgKmpzID0gcGZkZXYtPmpzOwog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWm91IFdlaSA8em91X3dlaUBodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyB8IDIgLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9qb2IuYwppbmRleCA0OTAyYmM2Li5lNzViN2QyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2pvYi5jCkBAIC02MTMsOCArNjEzLDYgQEAgaW50IHBhbmZyb3N0X2pv
Yl9vcGVuKHN0cnVjdCBwYW5mcm9zdF9maWxlX3ByaXYgKnBhbmZyb3N0X3ByaXYpCiAKIHZvaWQg
cGFuZnJvc3Rfam9iX2Nsb3NlKHN0cnVjdCBwYW5mcm9zdF9maWxlX3ByaXYgKnBhbmZyb3N0X3By
aXYpCiB7Ci0Jc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBwYW5mcm9zdF9wcml2LT5w
ZmRldjsKLQlzdHJ1Y3QgcGFuZnJvc3Rfam9iX3Nsb3QgKmpzID0gcGZkZXYtPmpzOwogCWludCBp
OwogCiAJZm9yIChpID0gMDsgaSA8IE5VTV9KT0JfU0xPVFM7IGkrKykKLS0gCjIuNi4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
