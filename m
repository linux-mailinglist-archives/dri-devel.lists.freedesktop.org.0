Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9443263E90
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A7C6E22B;
	Thu, 10 Sep 2020 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7636EA2D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:36:01 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1CD00EA207CDC654870D;
 Wed,  9 Sep 2020 15:35:55 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Sep 2020 15:35:44 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <eric@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vc4: Remove unused variables
Date: Wed, 9 Sep 2020 15:33:27 +0800
Message-ID: <1599636807-9003-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CnZjNF9wbGFu
ZS5jOiBJbiBmdW5jdGlvbiDigJh2YzRfcGxhbmVfaW5pdOKAmToKdmM0X3BsYW5lLmM6MTM0MDo2
OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QKdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KClNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNp
bGljb24uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMgfCAzICstLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9wbGFuZS5jCmluZGV4IDI0ZDdlNmQuLjViZTBmNWRkYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9w
bGFuZS5jCkBAIC0xMzM3LDcgKzEzMzcsNiBAQCBzdHJ1Y3QgZHJtX3BsYW5lICp2YzRfcGxhbmVf
aW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0g
TlVMTDsKIAlzdHJ1Y3QgdmM0X3BsYW5lICp2YzRfcGxhbmU7CiAJdTMyIGZvcm1hdHNbQVJSQVlf
U0laRShodnNfZm9ybWF0cyldOwotCWludCByZXQgPSAwOwogCXVuc2lnbmVkIGk7CiAJc3RhdGlj
IGNvbnN0IHVpbnQ2NF90IG1vZGlmaWVyc1tdID0gewogCQlEUk1fRk9STUFUX01PRF9CUk9BRENP
TV9WQzRfVF9USUxFRCwKQEAgLTEzNTcsNyArMTM1Niw3IEBAIHN0cnVjdCBkcm1fcGxhbmUgKnZj
NF9wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCWZvcm1hdHNbaV0gPSBodnNf
Zm9ybWF0c1tpXS5kcm07CiAKIAlwbGFuZSA9ICZ2YzRfcGxhbmUtPmJhc2U7Ci0JcmV0ID0gZHJt
X3VuaXZlcnNhbF9wbGFuZV9pbml0KGRldiwgcGxhbmUsIDAsCisJZHJtX3VuaXZlcnNhbF9wbGFu
ZV9pbml0KGRldiwgcGxhbmUsIDAsCiAJCQkJICAgICAgICZ2YzRfcGxhbmVfZnVuY3MsCiAJCQkJ
ICAgICAgIGZvcm1hdHMsIEFSUkFZX1NJWkUoZm9ybWF0cyksCiAJCQkJICAgICAgIG1vZGlmaWVy
cywgdHlwZSwgTlVMTCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
