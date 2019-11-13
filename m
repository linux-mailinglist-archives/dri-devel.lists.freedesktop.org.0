Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C440BFC120
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FB16E27F;
	Thu, 14 Nov 2019 08:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DC48926D;
 Wed, 13 Nov 2019 12:37:25 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C5D77F412703946A966F;
 Wed, 13 Nov 2019 20:37:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 13 Nov 2019
 20:37:12 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Rex.Zhu@amd.com>, <evan.quan@amd.com>
Subject: [PATCH 5/7] drm/amd/powerplay: remove set but not used variable
 'threshold'
Date: Wed, 13 Nov 2019 20:44:32 +0800
Message-ID: <1573649074-72589-6-git-send-email-yukuai3@huawei.com>
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
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmM6IEluCmZ1bmN0aW9uIOKA
mGZpamlfcG9wdWxhdGVfc2luZ2xlX2dyYXBoaWNfbGV2ZWzigJk6CmRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jOjk0MzoxMToKd2FybmluZzogdmFyaWFi
bGUg4oCYdGhyZXNob2xk4oCZIHNldCBidXQgbm90IHVzZWQKWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCgpJdCBpcyBuZXZlciB1c2VkLCBzbyBjYW4gYmUgcmVtb3ZlZC4KCkZpeGVzOiAyZTEx
MmI0YWUzYmEgKCJkcm0vYW1kL3BwOiByZW1vdmUgZmlqaV9zbWMvc211bWdyIHNwbGl0LiIpClNp
Z25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYyB8IDQgKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMKaW5kZXggZGEwMjVi
MS4uYzNkZjNhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
bWdyL2Zpamlfc211bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
bWdyL2Zpamlfc211bWdyLmMKQEAgLTk0MCw3ICs5NDAsNyBAQCBzdGF0aWMgaW50IGZpamlfcG9w
dWxhdGVfc2luZ2xlX2dyYXBoaWNfbGV2ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwKIHsKIAlp
bnQgcmVzdWx0OwogCS8qIFBQX0Nsb2NrcyBtaW5DbG9ja3M7ICovCi0JdWludDMyX3QgdGhyZXNo
b2xkLCBtdmRkOworCXVpbnQzMl90IG12ZGQ7CiAJc3RydWN0IHNtdTdfaHdtZ3IgKmRhdGEgPSAo
c3RydWN0IHNtdTdfaHdtZ3IgKikoaHdtZ3ItPmJhY2tlbmQpOwogCXN0cnVjdCBwaG1fcHB0X3Yx
X2luZm9ybWF0aW9uICp0YWJsZV9pbmZvID0KIAkJCShzdHJ1Y3QgcGhtX3BwdF92MV9pbmZvcm1h
dGlvbiAqKShod21nci0+cHB0YWJsZSk7CkBAIC05NzMsOCArOTczLDYgQEAgc3RhdGljIGludCBm
aWppX3BvcHVsYXRlX3NpbmdsZV9ncmFwaGljX2xldmVsKHN0cnVjdCBwcF9od21nciAqaHdtZ3Is
CiAJbGV2ZWwtPlZvbHRhZ2VEb3duSHlzdCA9IDA7CiAJbGV2ZWwtPlBvd2VyVGhyb3R0bGUgPSAw
OwogCi0JdGhyZXNob2xkID0gY2xvY2sgKiBkYXRhLT5mYXN0X3dhdGVybWFya190aHJlc2hvbGQg
LyAxMDA7Ci0KIAlkYXRhLT5kaXNwbGF5X3RpbWluZy5taW5fY2xvY2tfaW5fc3IgPSBod21nci0+
ZGlzcGxheV9jb25maWctPm1pbl9jb3JlX3NldF9jbG9ja19pbl9zcjsKIAogCWlmIChwaG1fY2Fw
X2VuYWJsZWQoaHdtZ3ItPnBsYXRmb3JtX2Rlc2NyaXB0b3IucGxhdGZvcm1DYXBzLCBQSE1fUGxh
dGZvcm1DYXBzX1NjbGtEZWVwU2xlZXApKQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
