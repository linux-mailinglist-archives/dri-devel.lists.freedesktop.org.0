Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B1F142657
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F140E6E86A;
	Mon, 20 Jan 2020 08:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE7F6E35D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 12:18:30 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A20637D8C28224291A16;
 Sun, 19 Jan 2020 20:18:26 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sun, 19 Jan 2020
 20:18:19 +0800
From: yu kuai <yukuai3@huawei.com>
To: <benh@kernel.crashing.org>, <b.zolnierkie@samsung.com>
Subject: [PATCH 4/4] video: fbdev: remove set but not used variable 'bytpp'
Date: Sun, 19 Jan 2020 20:17:30 +0800
Message-ID: <20200119121730.10701-5-yukuai3@huawei.com>
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
X3BhcuKAmToKZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYzoxNjYwOjMyOiB3
YXJuaW5nOgp2YXJpYWJsZSDigJhieXRwcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbmV2ZXIgdXNlZCwgYW5kIHNvIGNhbiBiZSByZW1vdmVk
LgoKU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgotLS0KIGRyaXZl
cnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRl
b25fYmFzZS5jCmluZGV4IDdkMmVlODg5ZmZjZC4uMjJiM2VlNGYyZmZhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jCisrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMKQEAgLTE2NTcsNyArMTY1Nyw3IEBAIHN0YXRpYyBpbnQg
cmFkZW9uZmJfc2V0X3BhcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKIAlpbnQgaSwgZnJlcTsKIAlp
bnQgZm9ybWF0ID0gMDsKIAlpbnQgbm9wbGxjYWxjID0gMDsKLQlpbnQgaHN5bmNfc3RhcnQsIGhz
eW5jX2Z1ZGdlLCBieXRwcCwgaHN5bmNfd2lkLCB2c3luY193aWQ7CisJaW50IGhzeW5jX3N0YXJ0
LCBoc3luY19mdWRnZSwgaHN5bmNfd2lkLCB2c3luY193aWQ7CiAJaW50IHByaW1hcnlfbW9uID0g
UFJJTUFSWV9NT05JVE9SKHJpbmZvKTsKIAlpbnQgZGVwdGggPSB2YXJfdG9fZGVwdGgobW9kZSk7
CiAJaW50IHVzZV9ybXggPSAwOwpAQCAtMTczMSw3ICsxNzMxLDYgQEAgc3RhdGljIGludCByYWRl
b25mYl9zZXRfcGFyKHN0cnVjdCBmYl9pbmZvICppbmZvKQogCQl2c3luY193aWQgPSAweDFmOwog
CiAJZm9ybWF0ID0gcmFkZW9uX2dldF9kc3RicHAoZGVwdGgpOwotCWJ5dHBwID0gbW9kZS0+Yml0
c19wZXJfcGl4ZWwgPj4gMzsKIAogCWlmICgocHJpbWFyeV9tb24gPT0gTVRfREZQKSB8fCAocHJp
bWFyeV9tb24gPT0gTVRfTENEKSkKIAkJaHN5bmNfZnVkZ2UgPSBoc3luY19mdWRnZV9mcFtmb3Jt
YXQtMV07Ci0tIAoyLjE3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
