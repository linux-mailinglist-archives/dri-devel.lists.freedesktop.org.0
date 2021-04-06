Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8B3552CE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 13:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2509C89DA9;
	Tue,  6 Apr 2021 11:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A176E0AB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 09:07:43 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FF1p1297Kzrd4Z;
 Tue,  6 Apr 2021 17:05:29 +0800 (CST)
Received: from huawei.com (10.67.174.96) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Tue, 6 Apr 2021
 17:07:30 +0800
From: Zhang Jianhua <zhangjianhua18@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/bridge: lt8912b: DRM_LONTIUM_LT8912B select GPIOLIB
Date: Tue, 6 Apr 2021 17:07:33 +0800
Message-ID: <20210406090733.169989-1-zhangjianhua18@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 06 Apr 2021 11:53:50 +0000
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
Cc: zhangjianhua18@huawei.com, johnny.chenyi@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heying24@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgQ09ORklHX0RSTV9MT05USVVNX0xUODkxMkI9eSwgdGhlIGZvbGxvd2luZyBlcnJvcnMgd2ls
bCBiZSBzZWVuIHdoaWxlCmNvbXBpbGluZyBsb250aXVtLWx0ODkxMmIuYwoKZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYzogSW4gZnVuY3Rpb24K4oCYbHQ4OTEyX2hhcmRf
cG93ZXJfb27igJk6CmRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmM6MjUy
OjI6IGVycm9yOiBpbXBsaWNpdApkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhncGlvZF9zZXRf
dmFsdWVfY2Fuc2xlZXDigJk7IGRpZCB5b3UgbWVhbgrigJhncGlvX3NldF92YWx1ZV9jYW5zbGVl
cOKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgZ3Bpb2Rfc2V0
X3ZhbHVlX2NhbnNsZWVwKGx0LT5ncF9yZXNldCwgMCk7CiAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+CiAgZ3Bpb19zZXRfdmFsdWVfY2Fuc2xlZXAKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250
aXVtLWx0ODkxMmIuYzogSW4gZnVuY3Rpb24g4oCYbHQ4OTEyX3BhcnNlX2R04oCZOgpkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jOjYyODoxMzogZXJyb3I6IGltcGxpY2l0
CmRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFs4oCZOyBk
aWQgeW91IG1lYW4K4oCYZGV2bV9ncGlvX3JlcXVlc3Rfb25l4oCZPyBbLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICBncF9yZXNldCA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlv
bmFsKGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0hJR0gpOwogICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KICAgICAgICAgICAgIGRldm1fZ3Bpb19yZXF1ZXN0X29uZQpkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jOjYyODo1MTogZXJyb3I6IOKAmEdQSU9E
X09VVF9ISUdI4oCZCnVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlk
IHlvdSBtZWFuIOKAmEdQSU9GX0lOSVRfSElHSOKAmT8KICBncF9yZXNldCA9IGRldm1fZ3Bpb2Rf
Z2V0X29wdGlvbmFsKGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0hJR0gpOwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHUElPRl9JTklU
X0hJR0gKClNpZ25lZC1vZmYtYnk6IFpoYW5nIEppYW5odWEgPHpoYW5namlhbmh1YTE4QGh1YXdl
aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKaW5kZXggZGJhNjJm
OTJkMDUxLi5jYWE5NjU4ZWM5MzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
S2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKQEAgLTY3LDYgKzY3
LDcgQEAgY29uZmlnIERSTV9MT05USVVNX0xUODkxMkIKIAlzZWxlY3QgRFJNX1BBTkVMX0JSSURH
RQogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBSRUdNQVBfSTJDCisJc2VsZWN0IEdQ
SU9MSUIKIAloZWxwCiAJICBEcml2ZXIgZm9yIExvbnRpdW0gTFQ4OTEyQiBEU0kgdG8gSERNSSBi
cmlkZ2UKIAkgIGNoaXAgZHJpdmVyLgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
