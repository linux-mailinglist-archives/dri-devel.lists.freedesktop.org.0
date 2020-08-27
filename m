Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0572A255549
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD006EB74;
	Fri, 28 Aug 2020 07:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264B86E0AC;
 Thu, 27 Aug 2020 13:01:23 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5615799FE8BD911E23F4;
 Thu, 27 Aug 2020 21:01:15 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 21:01:06 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jgg@ziepe.ca>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/nouveau/svm: remove set but not used 'ret'
Date: Thu, 27 Aug 2020 21:00:47 +0800
Message-ID: <20200827130047.429089-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBnY2Mgd2FybmluZyB3aXRoICJtYWtlIFc9MSI6
Cgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jOiBJbiBmdW5jdGlvbiDigJhu
b3V2ZWF1X3BmbnNfbWFw4oCZOgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5j
OjgxODo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0CmJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KICA4MTggfCAgaW50IHJldDsKICAgICAgfCAgICAgIF5+
fgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2Zm
LWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3Zt
LmMKaW5kZXggMmRmMWMwNDYwNTU5Li43Yzk1ZmZjYmQxOGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9zdm0uYwpAQCAtODE1LDcgKzgxNSw2IEBAIG5vdXZlYXVfcGZuc19tYXAoc3Ry
dWN0IG5vdXZlYXVfc3ZtbSAqc3ZtbSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJCSB1bnNpZ25l
ZCBsb25nIGFkZHIsIHU2NCAqcGZucywgdW5zaWduZWQgbG9uZyBucGFnZXMpCiB7CiAJc3RydWN0
IG5vdXZlYXVfcGZubWFwX2FyZ3MgKmFyZ3MgPSBub3V2ZWF1X3BmbnNfdG9fYXJncyhwZm5zKTsK
LQlpbnQgcmV0OwogCiAJYXJncy0+cC5hZGRyID0gYWRkcjsKIAlhcmdzLT5wLnNpemUgPSBucGFn
ZXMgPDwgUEFHRV9TSElGVDsKQEAgLTgyMyw4ICs4MjIsOCBAQCBub3V2ZWF1X3BmbnNfbWFwKHN0
cnVjdCBub3V2ZWF1X3N2bW0gKnN2bW0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCW11dGV4X2xv
Y2soJnN2bW0tPm11dGV4KTsKIAogCXN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVy
ID0gdHJ1ZTsKLQlyZXQgPSBudmlmX29iamVjdF9pb2N0bCgmc3ZtbS0+dm1tLT52bW0ub2JqZWN0
LCBhcmdzLCBzaXplb2YoKmFyZ3MpICsKLQkJCQlucGFnZXMgKiBzaXplb2YoYXJncy0+cC5waHlz
WzBdKSwgTlVMTCk7CisJbnZpZl9vYmplY3RfaW9jdGwoJnN2bW0tPnZtbS0+dm1tLm9iamVjdCwg
YXJncywgc2l6ZW9mKCphcmdzKSArCisJCQkgIG5wYWdlcyAqIHNpemVvZihhcmdzLT5wLnBoeXNb
MF0pLCBOVUxMKTsKIAlzdm1tLT52bW0tPnZtbS5vYmplY3QuY2xpZW50LT5zdXBlciA9IGZhbHNl
OwogCiAJbXV0ZXhfdW5sb2NrKCZzdm1tLT5tdXRleCk7Ci0tIAoyLjI1LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
