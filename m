Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692AE1AEB46
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC046EC82;
	Sat, 18 Apr 2020 09:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB18C6E3A6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 07:06:34 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CE01AEDE46B32705C65D;
 Fri, 17 Apr 2020 15:06:32 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 15:06:22 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <eric@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <p.zabel@pengutronix.de>, <yanaijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/v3d: remove unused 'v3d_v3d_pm_ops '
Date: Fri, 17 Apr 2020 15:32:43 +0800
Message-ID: <20200417073243.40552-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9k
cnYuYzo3MzozMjogd2FybmluZzog4oCYdjNkX3YzZF9wbV9vcHPigJkgZGVmaW5lZApidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2
X3BtX29wcyB2M2RfdjNkX3BtX29wcyA9IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWku
Y29tPgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMgfCAzNiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92
M2RfZHJ2LmMKaW5kZXggOGQwYzBkYWFhYzgxLi42M2YwOWM1NWE5NzAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNk
X2Rydi5jCkBAIC0zOCw0MiArMzgsNiBAQAogI2RlZmluZSBEUklWRVJfTUlOT1IgMAogI2RlZmlu
ZSBEUklWRVJfUEFUQ0hMRVZFTCAwCiAKLSNpZmRlZiBDT05GSUdfUE0KLXN0YXRpYyBpbnQgdjNk
X3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCi17Ci0Jc3RydWN0IGRybV9kZXZp
Y2UgKmRybSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwotCXN0cnVjdCB2M2RfZGV2ICp2M2QgPSB0
b192M2RfZGV2KGRybSk7Ci0KLQl2M2RfaXJxX2Rpc2FibGUodjNkKTsKLQotCWNsa19kaXNhYmxl
X3VucHJlcGFyZSh2M2QtPmNsayk7Ci0KLQlyZXR1cm4gMDsKLX0KLQotc3RhdGljIGludCB2M2Rf
cnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQotewotCXN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKLQlzdHJ1Y3QgdjNkX2RldiAqdjNkID0gdG9f
djNkX2Rldihkcm0pOwotCWludCByZXQ7Ci0KLQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUodjNk
LT5jbGspOwotCWlmIChyZXQgIT0gMCkKLQkJcmV0dXJuIHJldDsKLQotCS8qIFhYWDogVlBNIGJh
c2UgKi8KLQotCXYzZF9tbXVfc2V0X3BhZ2VfdGFibGUodjNkKTsKLQl2M2RfaXJxX2VuYWJsZSh2
M2QpOwotCi0JcmV0dXJuIDA7Ci19Ci0jZW5kaWYKLQotc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZf
cG1fb3BzIHYzZF92M2RfcG1fb3BzID0gewotCVNFVF9SVU5USU1FX1BNX09QUyh2M2RfcnVudGlt
ZV9zdXNwZW5kLCB2M2RfcnVudGltZV9yZXN1bWUsIE5VTEwpCi19OwotCiBzdGF0aWMgaW50IHYz
ZF9nZXRfcGFyYW1faW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJ
CSAgICAgICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKIHsKLS0gCjIuMjEuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
