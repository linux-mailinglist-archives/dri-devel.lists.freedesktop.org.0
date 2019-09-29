Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E32C1930
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 21:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D596E31A;
	Sun, 29 Sep 2019 19:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 986 seconds by postgrey-1.36 at gabe;
 Sun, 29 Sep 2019 12:49:58 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7C89E69;
 Sun, 29 Sep 2019 12:49:58 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E1906D8485D84484684B;
 Sun, 29 Sep 2019 20:33:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sun, 29 Sep 2019
 20:33:22 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH V2] drm/amdgpu: remove set but not used variable 'pipe'
Date: Sun, 29 Sep 2019 20:40:16 +0800
Message-ID: <1569760816-60192-1-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 29 Sep 2019 19:47:03 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmM6IEluIGZ1bmN0aW9uCuKAmGFtZGdwdV9nZnhf
Z3JhcGhpY3NfcXVldWVfYWNxdWlyZeKAmToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dmeC5jOjIzNDoxNjogd2FybmluZzoKdmFyaWFibGUg4oCYcGlwZeKAmSBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbmV2ZXIgdXNlZCwgc28g
Y2FuIGJlIHJlbW92ZWQuCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5j
b20+ClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmMKaW5kZXggZjliZWYzMS4uYzEwMzVhMyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYwpAQCAtMjMxLDEyICsyMzEsMTAgQEAgdm9pZCBhbWRn
cHVfZ2Z4X2NvbXB1dGVfcXVldWVfYWNxdWlyZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAogdm9pZCBhbWRncHVfZ2Z4X2dyYXBoaWNzX3F1ZXVlX2FjcXVpcmUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiB7Ci0JaW50IGksIHF1ZXVlLCBwaXBlLCBtZTsKKwlpbnQgaSwgcXVldWUs
IG1lOwogCiAJZm9yIChpID0gMDsgaSA8IEFNREdQVV9NQVhfR0ZYX1FVRVVFUzsgKytpKSB7CiAJ
CXF1ZXVlID0gaSAlIGFkZXYtPmdmeC5tZS5udW1fcXVldWVfcGVyX3BpcGU7Ci0JCXBpcGUgPSAo
aSAvIGFkZXYtPmdmeC5tZS5udW1fcXVldWVfcGVyX3BpcGUpCi0JCQklIGFkZXYtPmdmeC5tZS5u
dW1fcGlwZV9wZXJfbWU7CiAJCW1lID0gKGkgLyBhZGV2LT5nZngubWUubnVtX3F1ZXVlX3Blcl9w
aXBlKQogCQkgICAgICAvIGFkZXYtPmdmeC5tZS5udW1fcGlwZV9wZXJfbWU7CiAKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
