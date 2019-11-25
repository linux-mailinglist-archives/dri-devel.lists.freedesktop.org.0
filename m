Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE61109A05
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4136899BB;
	Tue, 26 Nov 2019 08:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1658916C;
 Mon, 25 Nov 2019 14:59:04 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F06DE5FD51FD902D2374;
 Mon, 25 Nov 2019 22:58:56 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 25 Nov 2019
 22:58:50 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <evan.quan@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Prike.Liang@amd.com>, <yuehaibing@huawei.com>,
 <chenwandun@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH -next] drm/amd/powerplay: remove set but not used variable
 'stretch_amount2'
Date: Mon, 25 Nov 2019 22:58:43 +0800
Message-ID: <20191125145843.15764-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVt
Z3IuYzoKIEluIGZ1bmN0aW9uIHZlZ2FtX3BvcHVsYXRlX2Nsb2NrX3N0cmV0Y2hlcl9kYXRhX3Rh
YmxlOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvc211bWdyL3ZlZ2Ft
X3NtdW1nci5jOjE0ODk6Mjk6CiB3YXJuaW5nOiB2YXJpYWJsZSBzdHJldGNoX2Ftb3VudDIgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIG5ldmVyIHVz
ZWQsIHNvIGNhbiBiZSByZW1vdmVkLgoKU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFp
YmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1n
ci92ZWdhbV9zbXVtZ3IuYyB8IDEwICsrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jCmluZGV4IDUwODk2ZTkuLmIwZTBkNjcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVt
Z3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211
bWdyLmMKQEAgLTE0ODYsNyArMTQ4Niw3IEBAIHN0YXRpYyBpbnQgdmVnYW1fcG9wdWxhdGVfY2xv
Y2tfc3RyZXRjaGVyX2RhdGFfdGFibGUoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAlzdHJ1Y3Qg
dmVnYW1fc211bWdyICpzbXVfZGF0YSA9CiAJCQkoc3RydWN0IHZlZ2FtX3NtdW1nciAqKShod21n
ci0+c211X2JhY2tlbmQpOwogCi0JdWludDhfdCBpLCBzdHJldGNoX2Ftb3VudCwgc3RyZXRjaF9h
bW91bnQyLCB2b2x0X29mZnNldCA9IDA7CisJdWludDhfdCBpLCBzdHJldGNoX2Ftb3VudCwgdm9s
dF9vZmZzZXQgPSAwOwogCXN0cnVjdCBwaG1fcHB0X3YxX2luZm9ybWF0aW9uICp0YWJsZV9pbmZv
ID0KIAkJCShzdHJ1Y3QgcGhtX3BwdF92MV9pbmZvcm1hdGlvbiAqKShod21nci0+cHB0YWJsZSk7
CiAJc3RydWN0IHBobV9wcHRfdjFfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxlICpzY2xr
X3RhYmxlID0KQEAgLTE1MjUsMTEgKzE1MjUsOSBAQCBzdGF0aWMgaW50IHZlZ2FtX3BvcHVsYXRl
X2Nsb2NrX3N0cmV0Y2hlcl9kYXRhX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJCQko
dGFibGVfaW5mby0+Y2FjX2R0cF90YWJsZS0+dWNDS1NfTERPX1JFRlNFTCAhPSAwKSA/CiAJCQl0
YWJsZV9pbmZvLT5jYWNfZHRwX3RhYmxlLT51Y0NLU19MRE9fUkVGU0VMIDogNTsKIAkvKiBQb3B1
bGF0ZSBDS1MgTG9va3VwIFRhYmxlICovCi0JaWYgKHN0cmV0Y2hfYW1vdW50ID09IDEgfHwgc3Ry
ZXRjaF9hbW91bnQgPT0gMiB8fCBzdHJldGNoX2Ftb3VudCA9PSA1KQotCQlzdHJldGNoX2Ftb3Vu
dDIgPSAwOwotCWVsc2UgaWYgKHN0cmV0Y2hfYW1vdW50ID09IDMgfHwgc3RyZXRjaF9hbW91bnQg
PT0gNCkKLQkJc3RyZXRjaF9hbW91bnQyID0gMTsKLQllbHNlIHsKKwlpZiAoIShzdHJldGNoX2Ft
b3VudCA9PSAxIHx8IHN0cmV0Y2hfYW1vdW50ID09IDIgfHwKKwkgICAgICBzdHJldGNoX2Ftb3Vu
dCA9PSA1IHx8IHN0cmV0Y2hfYW1vdW50ID09IDMgfHwKKwkgICAgICBzdHJldGNoX2Ftb3VudCA9
PSA0KSkgewogCQlwaG1fY2FwX3Vuc2V0KGh3bWdyLT5wbGF0Zm9ybV9kZXNjcmlwdG9yLnBsYXRm
b3JtQ2FwcywKIAkJCQlQSE1fUGxhdGZvcm1DYXBzX0Nsb2NrU3RyZXRjaGVyKTsKIAkJUFBfQVNT
RVJUX1dJVEhfQ09ERShmYWxzZSwKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
