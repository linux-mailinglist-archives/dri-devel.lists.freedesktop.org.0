Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B67E13BF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7856E9AE;
	Wed, 23 Oct 2019 08:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511006E986;
 Wed, 23 Oct 2019 07:59:35 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A09A113FE714AAF0BAA1;
 Wed, 23 Oct 2019 15:59:30 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 15:59:22 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Felix.Kuehling@amd.com>, <Philip.Yang@amd.com>, <jgg@ziepe.ca>,
 <kraxel@redhat.com>, <tzimmermann@suse.de>, <tianci.yin@amd.com>
Subject: [PATCH -next] drm/amdgpu: remove set but not used variable 'adev'
Date: Wed, 23 Oct 2019 15:58:31 +0800
Message-ID: <20191023075831.33636-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
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

ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOjEyMjE6MjQ6IHdhcm5pbmc6
IHZhcmlhYmxlIGFkZXYgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZV0KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOjQ4ODoyNDogd2Fybmlu
ZzogdmFyaWFibGUgYWRldiBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmM6NTQ3OjI0OiB3YXJu
aW5nOiB2YXJpYWJsZSBhZGV2IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCgpJdCBpcyBuZXZlciB1c2VkLCBzbyBjYW4gcmVtb3ZlZCBpdC4KClNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCA5IC0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmlu
ZGV4IGE2MWIwZDkuLmJhMDAyNjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMKQEAgLTQ4NSwxNSArNDg1LDEyIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X21vdmVfdnJhbV9y
YW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKIAkJCQlzdHJ1Y3Qg
dHRtX29wZXJhdGlvbl9jdHggKmN0eCwKIAkJCQlzdHJ1Y3QgdHRtX21lbV9yZWcgKm5ld19tZW0p
CiB7Ci0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXY7CiAJc3RydWN0IHR0bV9tZW1fcmVnICpv
bGRfbWVtID0gJmJvLT5tZW07CiAJc3RydWN0IHR0bV9tZW1fcmVnIHRtcF9tZW07CiAJc3RydWN0
IHR0bV9wbGFjZSBwbGFjZW1lbnRzOwogCXN0cnVjdCB0dG1fcGxhY2VtZW50IHBsYWNlbWVudDsK
IAlpbnQgcjsKIAotCWFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPmJkZXYpOwotCiAJLyogY3Jl
YXRlIHNwYWNlL3BhZ2VzIGZvciBuZXdfbWVtIGluIEdUVCBzcGFjZSAqLwogCXRtcF9tZW0gPSAq
bmV3X21lbTsKIAl0bXBfbWVtLm1tX25vZGUgPSBOVUxMOwpAQCAtNTQ0LDE1ICs1NDEsMTIgQEAg
c3RhdGljIGludCBhbWRncHVfbW92ZV9yYW1fdnJhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLCBib29sIGV2aWN0LAogCQkJCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAogCQkJ
CXN0cnVjdCB0dG1fbWVtX3JlZyAqbmV3X21lbSkKIHsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldjsKIAlzdHJ1Y3QgdHRtX21lbV9yZWcgKm9sZF9tZW0gPSAmYm8tPm1lbTsKIAlzdHJ1Y3Qg
dHRtX21lbV9yZWcgdG1wX21lbTsKIAlzdHJ1Y3QgdHRtX3BsYWNlbWVudCBwbGFjZW1lbnQ7CiAJ
c3RydWN0IHR0bV9wbGFjZSBwbGFjZW1lbnRzOwogCWludCByOwogCi0JYWRldiA9IGFtZGdwdV90
dG1fYWRldihiby0+YmRldik7Ci0KIAkvKiBtYWtlIHNwYWNlIGluIEdUVCBmb3Igb2xkX21lbSBi
dWZmZXIgKi8KIAl0bXBfbWVtID0gKm5ld19tZW07CiAJdG1wX21lbS5tbV9ub2RlID0gTlVMTDsK
QEAgLTEyMTgsMTEgKzEyMTIsOCBAQCBzdGF0aWMgc3RydWN0IHR0bV9iYWNrZW5kX2Z1bmMgYW1k
Z3B1X2JhY2tlbmRfZnVuYyA9IHsKIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICphbWRncHVfdHRtX3R0
X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJCQkgICB1aW50MzJfdCBw
YWdlX2ZsYWdzKQogewotCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2OwogCXN0cnVjdCBhbWRn
cHVfdHRtX3R0ICpndHQ7CiAKLQlhZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT5iZGV2KTsKLQog
CWd0dCA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBhbWRncHVfdHRtX3R0KSwgR0ZQX0tFUk5FTCk7
CiAJaWYgKGd0dCA9PSBOVUxMKSB7CiAJCXJldHVybiBOVUxMOwotLSAKMi43LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
