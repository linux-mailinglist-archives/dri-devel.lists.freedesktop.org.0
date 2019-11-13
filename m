Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C41DFC130
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CD86E2DE;
	Thu, 14 Nov 2019 08:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4346E0D9;
 Wed, 13 Nov 2019 12:37:27 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D8149C0EE21B8436B52B;
 Wed, 13 Nov 2019 20:37:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 13 Nov 2019
 20:37:12 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Rex.Zhu@amd.com>, <evan.quan@amd.com>
Subject: [PATCH 7/7] drm/amd/powerplay: remove set but not used variable
 'us_mvdd'
Date: Wed, 13 Nov 2019 20:44:34 +0800
Message-ID: <1573649074-72589-8-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
References: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jOiBJbgpmdW5jdGlvbiDi
gJh2ZWdhbV9wb3B1bGF0ZV9zbWNfYWNwaV9sZXZlbOKAmToKZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jOjExMTc6MTE6Cndhcm5pbmc6IHZhcmlhYmxl
ICd1c19tdmRkJyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoK
SXQgaXMgbmV2ZXIgdXNlZCwgc28gY2FuIGJlIHJlbW92ZWQuCgpGaXhlczogYWM3ODIyYjAwMjZm
ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBzbXVtZ3Igc3VwcG9ydCBmb3IgVkVHQU0gKHYyKSIp
ClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgfCAxMiAtLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMKaW5kZXggYWUxOGZi
Yy4uMjA2OGViMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
bWdyL3ZlZ2FtX3NtdW1nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dW1nci92ZWdhbV9zbXVtZ3IuYwpAQCAtMTExNCw3ICsxMTE0LDYgQEAgc3RhdGljIGludCB2ZWdh
bV9wb3B1bGF0ZV9zbWNfYWNwaV9sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQkJKHN0
cnVjdCBwaG1fcHB0X3YxX2luZm9ybWF0aW9uICopKGh3bWdyLT5wcHRhYmxlKTsKIAlTTUlPX1Bh
dHRlcm4gdm9sX2xldmVsOwogCXVpbnQzMl90IG12ZGQ7Ci0JdWludDE2X3QgdXNfbXZkZDsKIAog
CXRhYmxlLT5BQ1BJTGV2ZWwuRmxhZ3MgJj0gflBQU01DX1NXU1RBVEVfRkxBR19EQzsKIApAQCAt
MTE2OCwxNyArMTE2Nyw2IEBAIHN0YXRpYyBpbnQgdmVnYW1fcG9wdWxhdGVfc21jX2FjcGlfbGV2
ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAkJCSJpbiBDbG9jayBEZXBlbmRlbmN5IFRhYmxl
IiwKIAkJCSk7CiAKLQl1c19tdmRkID0gMDsKLQlpZiAoKFNNVTdfVk9MVEFHRV9DT05UUk9MX05P
TkUgPT0gZGF0YS0+bXZkZF9jb250cm9sKSB8fAotCQkJKGRhdGEtPm1jbGtfZHBtX2tleV9kaXNh
YmxlZCkpCi0JCXVzX212ZGQgPSBkYXRhLT52Ymlvc19ib290X3N0YXRlLm12ZGRfYm9vdHVwX3Zh
bHVlOwotCWVsc2UgewotCQlpZiAoIXZlZ2FtX3BvcHVsYXRlX212ZGRfdmFsdWUoaHdtZ3IsCi0J
CQkJZGF0YS0+ZHBtX3RhYmxlLm1jbGtfdGFibGUuZHBtX2xldmVsc1swXS52YWx1ZSwKLQkJCQkm
dm9sX2xldmVsKSkKLQkJCXVzX212ZGQgPSB2b2xfbGV2ZWwuVm9sdGFnZTsKLQl9Ci0KIAlpZiAo
IXZlZ2FtX3BvcHVsYXRlX212ZGRfdmFsdWUoaHdtZ3IsIDAsICZ2b2xfbGV2ZWwpKQogCQl0YWJs
ZS0+TWVtb3J5QUNQSUxldmVsLk1pbk12ZGQgPSBQUF9IT1NUX1RPX1NNQ19VTCh2b2xfbGV2ZWwu
Vm9sdGFnZSk7CiAJZWxzZQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
