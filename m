Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC6F8A3A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975C66EA67;
	Tue, 12 Nov 2019 08:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6AF6E340;
 Tue, 12 Nov 2019 02:12:03 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7A28C9AFCD83B5867FBA;
 Tue, 12 Nov 2019 10:12:00 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Tue, 12 Nov 2019
 10:11:50 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <Jun.Lei@amd.com>, <Anthony.Koo@amd.com>,
 <Zhan.Liu@amd.com>
Subject: [PATCH v2 -next] drm/amd/display: remove set but not used variable
 'bpc'
Date: Tue, 12 Nov 2019 10:10:50 +0800
Message-ID: <20191112021050.13128-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20191109093538.23964-1-yuehaibing@huawei.com>
References: <20191109093538.23964-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYzogSW4gZnVuY3Rp
b24gZ2V0X3Bibl9mcm9tX3RpbWluZzoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9jb3JlL2RjX2xpbmsuYzoyMzY0OjExOiB3YXJuaW5nOgogdmFyaWFibGUgYnBjIHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBub3QgdXNl
ZCBzaW5jZSBjb21taXQgZTQ5ZjY5MzYzYWRmICgiZHJtL2FtZC9kaXNwbGF5OiB1c2UKcHJvcGVy
IGZvcm11bGEgdG8gY2FsY3VsYXRlIGJhbmR3aWR0aCBmcm9tIHRpbWluZyIpLCB0aGlzIGFsc28K
cmVtb3ZlIGdldF9jb2xvcl9kZXB0aCgpLCB3aGljaCBpcyBvbmx5IHVzZWQgaGVyZS4KClNpZ25l
ZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCnYyOiBhbHNv
IHJlbW92ZSB1bnVzZWQgZ2V0X2NvbG9yX2RlcHRoKCkKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAxNSAtLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMKaW5kZXggYmRjOGJlMy4uMWJlNDI3NyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwpAQCAtMjYzOCwyOCArMjYzOCwx
MyBAQCBzdGF0aWMgc3RydWN0IGZpeGVkMzFfMzIgZ2V0X3Bibl9wZXJfc2xvdChzdHJ1Y3QgZGNf
c3RyZWFtX3N0YXRlICpzdHJlYW0pCiAJcmV0dXJuIGRjX2ZpeHB0X2Rpdl9pbnQobWJ5dGVzX3Bl
cl9zZWMsIDU0KTsKIH0KIAotc3RhdGljIGludCBnZXRfY29sb3JfZGVwdGgoZW51bSBkY19jb2xv
cl9kZXB0aCBjb2xvcl9kZXB0aCkKLXsKLQlzd2l0Y2ggKGNvbG9yX2RlcHRoKSB7Ci0JY2FzZSBD
T0xPUl9ERVBUSF82NjY6IHJldHVybiA2OwotCWNhc2UgQ09MT1JfREVQVEhfODg4OiByZXR1cm4g
ODsKLQljYXNlIENPTE9SX0RFUFRIXzEwMTAxMDogcmV0dXJuIDEwOwotCWNhc2UgQ09MT1JfREVQ
VEhfMTIxMjEyOiByZXR1cm4gMTI7Ci0JY2FzZSBDT0xPUl9ERVBUSF8xNDE0MTQ6IHJldHVybiAx
NDsKLQljYXNlIENPTE9SX0RFUFRIXzE2MTYxNjogcmV0dXJuIDE2OwotCWRlZmF1bHQ6IHJldHVy
biAwOwotCX0KLX0KLQogc3RhdGljIHN0cnVjdCBmaXhlZDMxXzMyIGdldF9wYm5fZnJvbV90aW1p
bmcoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCkKIHsKLQl1aW50MzJfdCBicGM7CiAJdWludDY0
X3Qga2JwczsKIAlzdHJ1Y3QgZml4ZWQzMV8zMiBwZWFrX2ticHM7CiAJdWludDMyX3QgbnVtZXJh
dG9yOwogCXVpbnQzMl90IGRlbm9taW5hdG9yOwogCi0JYnBjID0gZ2V0X2NvbG9yX2RlcHRoKHBp
cGVfY3R4LT5zdHJlYW1fcmVzLnBpeF9jbGtfcGFyYW1zLmNvbG9yX2RlcHRoKTsKIAlrYnBzID0g
ZGNfYmFuZHdpZHRoX2luX2ticHNfZnJvbV90aW1pbmcoJnBpcGVfY3R4LT5zdHJlYW0tPnRpbWlu
Zyk7CiAKIAkvKgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
