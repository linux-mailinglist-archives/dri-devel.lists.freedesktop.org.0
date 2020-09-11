Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B8426855E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9786E1D7;
	Mon, 14 Sep 2020 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C214A6E358
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:12:08 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 24089520872E27C33B4B;
 Fri, 11 Sep 2020 16:12:03 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Sep 2020 16:11:57 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <eric@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vc4: Handing the return value of drm_universal_plane_init
Date: Fri, 11 Sep 2020 16:09:37 +0800
Message-ID: <1599811777-34093-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGFuZGluZyB0aGUgcmV0dXJuIHZhbHVlIG9mIGRybV91bml2ZXJzYWxfcGxhbmVfaW5pdCB0byBm
aXggdGhlIGZvbGxvd2luZwpXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CnZjNF9wbGFuZS5j
OiBJbiBmdW5jdGlvbiDigJh2YzRfcGxhbmVfaW5pdOKAmToKdmM0X3BsYW5lLmM6MTM0MDo2OiB3
YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QKdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KClNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGlj
b24uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMKaW5kZXgg
MjRkN2U2ZC4uNjVjMTIwNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxh
bmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCkBAIC0xMzYxLDYgKzEz
NjEsOCBAQCBzdHJ1Y3QgZHJtX3BsYW5lICp2YzRfcGxhbmVfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAogCQkJCSAgICAgICAmdmM0X3BsYW5lX2Z1bmNzLAogCQkJCSAgICAgICBmb3JtYXRz
LCBBUlJBWV9TSVpFKGZvcm1hdHMpLAogCQkJCSAgICAgICBtb2RpZmllcnMsIHR5cGUsIE5VTEwp
OworCWlmIChyZXQpCisJCXJldHVybiBFUlJfUFRSKHJldCk7CiAKIAlkcm1fcGxhbmVfaGVscGVy
X2FkZChwbGFuZSwgJnZjNF9wbGFuZV9oZWxwZXJfZnVuY3MpOwogCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
