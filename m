Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143A2EB0B6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1BA6EE62;
	Thu, 31 Oct 2019 13:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456636EBFE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 09:36:42 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A1E09484ACD35FA8B583;
 Thu, 31 Oct 2019 17:36:38 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 31 Oct 2019 17:36:29 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/dp_mst :fix gcc compile error
Date: Thu, 31 Oct 2019 17:43:49 +0800
Message-ID: <1572515029-42087-1-git-send-email-chenwandun@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
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
Cc: chenwandun@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hlbndhbmR1biA8Y2hlbndhbmR1bkBodWF3ZWkuY29tPgoKZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYzogSW4gZnVuY3Rpb24gX190b3BvbG9neV9yZWZfc2F2ZToK
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYzoxNDI0OjY6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiBzdGFja190cmFjZV9zYXZlOyBkaWQgeW91IG1l
YW4gc3RhY2tfZGVwb3Rfc2F2ZT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCiAgbiA9IHN0YWNrX3RyYWNlX3NhdmUoc3RhY2tfZW50cmllcywgQVJSQVlfU0laRShzdGFj
a19lbnRyaWVzKSwgMSk7CiAgICAgIF5+fn5+fn5+fn5+fn5+fn4KICAgICAgc3RhY2tfZGVwb3Rf
c2F2ZQpkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jOiBJbiBmdW5jdGlvbiBf
X2R1bXBfdG9wb2xvZ3lfcmVmX2hpc3Rvcnk6CmRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmM6MTUxMzozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g
c3RhY2tfdHJhY2Vfc25wcmludDsgZGlkIHlvdSBtZWFuIGFjcGlfdHJhY2VfcG9pbnQ/IFstV2Vy
cm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogICBzdGFja190cmFjZV9zbnByaW50
KGJ1ZiwgUEFHRV9TSVpFLCBlbnRyaWVzLCBucl9lbnRyaWVzLCA0KTsKICAgXn5+fn5+fn5+fn5+
fn5+fn5+fgogICBhY3BpX3RyYWNlX3BvaW50CgpzdGFja190cmFjZV9zYXZlIGFuZCBzdGFja190
cmFjZV9zbnByaW50IGFyZSBkZWNsYXJlZCBpbiA8bGludXgvc3RhY2t0cmFjZS5oPiwKc28gdGhl
cmUgaXMgbmVlZCB0byBpbmNsdWRlIGl0LCBhbmQgPGxpbnV4L3N0YWNrZGVwb3QuaD4gaXMgYWxy
ZWFkeSBpbmNsdWRlZApieSBwcmFjdGljZXMsIHNvIGp1c3QgcmVwbGFjZSA8bGludXgvc3RhY2tk
ZXBvdC5oPiBieSA8bGludXgvc3RhY2t0cmFjZS5oPi4KClNpZ25lZC1vZmYtYnk6IENoZW53YW5k
dW4gPGNoZW53YW5kdW5AaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggODViZWY3
My4uMTFhZGM0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC0yOSw3
ICsyOSw3IEBACiAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KIAogI2lmIElTX0VOQUJMRUQo
Q09ORklHX0RSTV9ERUJVR19EUF9NU1RfVE9QT0xPR1lfUkVGUykKLSNpbmNsdWRlIDxsaW51eC9z
dGFja2RlcG90Lmg+CisjaW5jbHVkZSA8bGludXgvc3RhY2t0cmFjZS5oPgogI2luY2x1ZGUgPGxp
bnV4L3NvcnQuaD4KICNpbmNsdWRlIDxsaW51eC90aW1la2VlcGluZy5oPgogI2luY2x1ZGUgPGxp
bnV4L21hdGg2NC5oPgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
