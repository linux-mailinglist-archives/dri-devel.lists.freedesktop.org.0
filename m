Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A6CFC144
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE176E3D6;
	Thu, 14 Nov 2019 08:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACD8892BC;
 Wed, 13 Nov 2019 12:37:25 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B84AD6DD953281BE2A92;
 Wed, 13 Nov 2019 20:37:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 13 Nov 2019
 20:37:10 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Rex.Zhu@amd.com>, <evan.quan@amd.com>
Subject: [PATCH 1/7] drm/amdgpu: remove set but not used variable
 'mc_shared_chmap' from 'gfx_v6_0.c' and 'gfx_v7_0.c'
Date: Wed, 13 Nov 2019 20:44:28 +0800
Message-ID: <1573649074-72589-2-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
References: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:51 +0000
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
 amd-gfx@lists.freedesktop.org, zhengbin13@huawei.com,
 dri-devel@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYzogSW4gZnVuY3Rpb24K4oCYZ2Z4X3Y2XzBfY29u
c3RhbnRzX2luaXTigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92Nl8wLmM6MTU3
OTo2OiB3YXJuaW5nOiB2YXJpYWJsZQrigJhtY19zaGFyZWRfY2htYXDigJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92N18wLmM6IEluIGZ1bmN0aW9uCuKAmGdmeF92N18wX2dwdV9lYXJseV9pbml04oCZ
Ogpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jOjQyNjI6Njogd2FybmluZzog
dmFyaWFibGUK4oCYbWNfc2hhcmVkX2NobWFw4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCgpGaXhlczogMmNkNDZhZDIyMzgzICgiZHJtL2FtZGdwdTogYWRk
IGdyYXBoaWMgcGlwZWxpbmUgaW1wbGVtZW50YXRpb24gZm9yIHNpIHY4IikKRml4ZXM6IGQ5M2Yz
Y2E3MDZiOCAoImRybS9hbWRncHUvZ2Z4NzogcmV3b3JrIGdwdV9pbml0KCkiKQpTaWduZWQtb2Zm
LWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y2XzAuYyB8IDMgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjdfMC5jIHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jCmluZGV4IGU4M2I2
ZTAuLjk1YmIyNDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
Nl8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYwpAQCAtMTU3
Niw3ICsxNTc2LDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y2XzBfY29uZmlnX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiBzdGF0aWMgdm9pZCBnZnhfdjZfMF9jb25zdGFudHNfaW5pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1MzIgZ2JfYWRkcl9jb25maWcgPSAwOwot
CXUzMiBtY19zaGFyZWRfY2htYXAsIG1jX2FyYl9yYW1jZmc7CisJdTMyIG1jX2FyYl9yYW1jZmc7
CiAJdTMyIHN4X2RlYnVnXzE7CiAJdTMyIGhkcF9ob3N0X3BhdGhfY250bDsKIAl1MzIgdG1wOwpA
QCAtMTY3OCw3ICsxNjc4LDYgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y2XzBfY29uc3RhbnRzX2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlXUkVHMzIobW1CSUZfRkJfRU4sIEJJRl9G
Ql9FTl9fRkJfUkVBRF9FTl9NQVNLIHwgQklGX0ZCX0VOX19GQl9XUklURV9FTl9NQVNLKTsKIAot
CW1jX3NoYXJlZF9jaG1hcCA9IFJSRUczMihtbU1DX1NIQVJFRF9DSE1BUCk7CiAJYWRldi0+Z2Z4
LmNvbmZpZy5tY19hcmJfcmFtY2ZnID0gUlJFRzMyKG1tTUNfQVJCX1JBTUNGRyk7CiAJbWNfYXJi
X3JhbWNmZyA9IGFkZXYtPmdmeC5jb25maWcubWNfYXJiX3JhbWNmZzsKIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92N18wLmMKaW5kZXggNmIxYzVlZi4uNDNhZThmYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jCkBAIC00MjU5LDcgKzQyNTksNyBAQCBzdGF0aWMgaW50
IGdmeF92N18wX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiBzdGF0aWMgdm9pZCBnZnhfdjdfMF9n
cHVfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1MzIgZ2JfYWRk
cl9jb25maWc7Ci0JdTMyIG1jX3NoYXJlZF9jaG1hcCwgbWNfYXJiX3JhbWNmZzsKKwl1MzIgbWNf
YXJiX3JhbWNmZzsKIAl1MzIgZGltbTAwX2FkZHJfbWFwLCBkaW1tMDFfYWRkcl9tYXAsIGRpbW0x
MF9hZGRyX21hcCwgZGltbTExX2FkZHJfbWFwOwogCXUzMiB0bXA7CiAKQEAgLTQzMzYsNyArNDMz
Niw2IEBAIHN0YXRpYyB2b2lkIGdmeF92N18wX2dwdV9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCQlicmVhazsKIAl9CiAKLQltY19zaGFyZWRfY2htYXAgPSBSUkVHMzIo
bW1NQ19TSEFSRURfQ0hNQVApOwogCWFkZXYtPmdmeC5jb25maWcubWNfYXJiX3JhbWNmZyA9IFJS
RUczMihtbU1DX0FSQl9SQU1DRkcpOwogCW1jX2FyYl9yYW1jZmcgPSBhZGV2LT5nZnguY29uZmln
Lm1jX2FyYl9yYW1jZmc7CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
