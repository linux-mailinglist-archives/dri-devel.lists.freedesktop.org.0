Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8432F357AF1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 05:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EA36E123;
	Thu,  8 Apr 2021 03:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8F86E123
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 03:54:44 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FG6lx1FR1z1BGNv;
 Thu,  8 Apr 2021 11:52:29 +0800 (CST)
Received: from huawei.com (10.67.174.96) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 11:54:30 +0800
From: Zhang Jianhua <zhangjianhua18@huawei.com>
To: <adrien.grassein@gmail.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <robert.foss@linaro.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <zhangjianhua18@huawei.com>
Subject: [PATCH -next v2] drm/bridge: lt8912b: Add header file
 <linux/gpio/consumer.h>
Date: Thu, 8 Apr 2021 11:54:35 +0800
Message-ID: <20210408035435.250677-1-zhangjianhua18@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.96]
X-CFilter-Loop: Reflected
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
Cc: johnny.chenyi@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, heying24@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgQ09ORklHX0RSTV9MT05USVVNX0xUODkxMkI9bSwgdGhlIGZvbGxvd2luZyBlcnJvcnMgd2ls
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
aS5jb20+Ci0tLQp2MjoKLSBhZGQgaGVhZGVyIGZpbGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4g
Zm9yIGxvbnRpdW0tbHQ4OTEyYi5jIGluc3RlYWQKICBvZiBhZGQgY29uZmlnIGRlcGVuZGVuY2Ug
Zm9yIENPTkZJR19EUk1fTE9OVElVTV9MVDg5MTJCCi0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9sb250aXVtLWx0ODkxMmIuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmMKaW5kZXggNjE0OTE2MTVi
YWQwLi43OTg0NWIzYjE5ZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9u
dGl1bS1sdDg5MTJiLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkx
MmIuYwpAQCAtMyw2ICszLDcgQEAKICAqIENvcHlyaWdodCAoYykgMjAxOCwgVGhlIExpbnV4IEZv
dW5kYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuCiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L2dw
aW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51
eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
