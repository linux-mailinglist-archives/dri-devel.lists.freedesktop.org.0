Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF798D2E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887736EA75;
	Thu, 22 Aug 2019 08:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239376E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:16:24 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CF7441A0411;
 Wed, 21 Aug 2019 12:16:22 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C23301A0304;
 Wed, 21 Aug 2019 12:16:22 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0917420612;
 Wed, 21 Aug 2019 12:16:21 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 09/15] drm/mxsfb: Add max-memory-bandwidth property for
 MXSFB
Date: Wed, 21 Aug 2019 13:15:49 +0300
Message-Id: <1566382555-12102-10-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVjYXVzZSBvZiBzdGFiaWxpdHkgaXNzdWVzLCB3ZSBtYXkgd2FudCB0byBsaW1pdCB0aGUgbWF4
aW11bSBiYW5kd2lkdGgKcmVxdWlyZWQgYnkgdGhlIE1YU0ZCIChlTENESUYpIGRyaXZlci4KClNp
Z25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgfCA0OCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuaCB8
ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIv
bXhzZmJfZHJ2LmMKaW5kZXggZjUxYzhhMy4uZGViNWUyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNm
Yl9kcnYuYwpAQCAtMTYxLDYgKzE2MSw0OSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2Rl
X2NvbmZpZ19oZWxwZXJfZnVuY3MgbXhzZmJfbW9kZV9jb25maWdfaGVscGVycyA9IHsKIAkuYXRv
bWljX2NvbW1pdF90YWlsID0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWxfcnBtLAogfTsK
IAorZW51bSBkcm1fbW9kZV9zdGF0dXMgbXhzZmJfcGlwZV9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKKwkJCQkJICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUp
Cit7CisJc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlID0KKwkJY29udGFpbmVy
X29mKGNydGMsIHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSwgY3J0Yyk7CisJc3RydWN0
IG14c2ZiX2RybV9wcml2YXRlICpteHNmYiA9IGRybV9waXBlX3RvX214c2ZiX2RybV9wcml2YXRl
KHBpcGUpOworCXUzMiBicHA7CisJdTY0IGJ3OworCisJaWYgKCFwaXBlLT5wbGFuZS5zdGF0ZS0+
ZmIpCisJCWJwcCA9IDMyOworCWVsc2UKKwkJYnBwID0gcGlwZS0+cGxhbmUuc3RhdGUtPmZiLT5m
b3JtYXQtPmRlcHRoOworCisJYncgPSBtb2RlLT5jcnRjX2Nsb2NrICogMTAwMDsKKwlidyA9IGJ3
ICogbW9kZS0+aGRpc3BsYXkgKiBtb2RlLT52ZGlzcGxheSAqIChicHAgLyA4KTsKKwlidyA9IGRp
dl91NjQoYncsIG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3RhbCk7CisKKwlpZiAobXhzZmItPm1h
eF9idyAmJiAoYncgPiBteHNmYi0+bWF4X2J3KSkKKwkJcmV0dXJuIE1PREVfQkFEOworCisJcmV0
dXJuIE1PREVfT0s7Cit9CisKK3N0YXRpYyBpbnQgbXhzZmJfcGlwZV9jaGVjayhzdHJ1Y3QgZHJt
X3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCisJCQkgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0
ZSAqcGxhbmVfc3RhdGUsCisJCQkgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRl
KQoreworCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gcGxhbmVfc3RhdGUtPmZiOworCXN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKm9sZF9mYiA9IHBpcGUtPnBsYW5lLnN0YXRlLT5mYjsKKwor
CS8qIGZvcmNlICdtb2RlX2NoYW5nZWQnIHdoZW4gZmIgcGl0Y2hlcyBjaGFuZ2VkLCBzaW5jZQor
CSAqIHRoZSBwaXRjaCByZWxhdGVkIHJlZ2lzdGVycyBjb25maWd1cmF0aW9uIG9mIExDRElGCisJ
ICogY2FuIG5vdCBiZSBkb25lIHdoZW4gTENESUYgaXMgcnVubmluZy4KKwkgKi8KKwlpZiAob2xk
X2ZiICYmIGxpa2VseSghY3J0Y19zdGF0ZS0+bW9kZV9jaGFuZ2VkKSkgeworCQlpZiAob2xkX2Zi
LT5waXRjaGVzWzBdICE9IGZiLT5waXRjaGVzWzBdKQorCQkJY3J0Y19zdGF0ZS0+bW9kZV9jaGFu
Z2VkID0gdHJ1ZTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIHZvaWQgbXhzZmJfcGlw
ZV9lbmFibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQkJICAgICAg
c3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAogCQkJICAgICAgc3RydWN0IGRybV9w
bGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpCkBAIC0yNTEsNiArMjk0LDggQEAgc3RhdGljIHZvaWQg
bXhzZmJfcGlwZV9kaXNhYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUg
KnBpcGUpCiB9CiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3Mg
bXhzZmJfZnVuY3MgPSB7CisJLm1vZGVfdmFsaWQJPSBteHNmYl9waXBlX21vZGVfdmFsaWQsCisJ
LmNoZWNrICAgICAgICAgID0gbXhzZmJfcGlwZV9jaGVjaywKIAkuZW5hYmxlCQk9IG14c2ZiX3Bp
cGVfZW5hYmxlLAogCS5kaXNhYmxlCT0gbXhzZmJfcGlwZV9kaXNhYmxlLAogCS51cGRhdGUJCT0g
bXhzZmJfcGlwZV91cGRhdGUsCkBAIC0yOTAsNiArMzM1LDkgQEAgc3RhdGljIGludCBteHNmYl9s
b2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCiAJaWYgKElT
X0VSUihteHNmYi0+Y2xrX2Rpc3BfYXhpKSkKIAkJbXhzZmItPmNsa19kaXNwX2F4aSA9IE5VTEw7
CiAKKwlvZl9wcm9wZXJ0eV9yZWFkX3UzMihkcm0tPmRldi0+b2Zfbm9kZSwgIm1heC1tZW1vcnkt
YmFuZHdpZHRoIiwKKwkJCSAgICAgJm14c2ZiLT5tYXhfYncpOworCiAJcmV0ID0gZG1hX3NldF9t
YXNrX2FuZF9jb2hlcmVudChkcm0tPmRldiwgRE1BX0JJVF9NQVNLKDMyKSk7CiAJaWYgKHJldCkK
IAkJcmV0dXJuIHJldDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9k
cnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuaAppbmRleCA4ZmI2NWQzLi5h
MTc4MTczIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5oCkBAIC0zMiw2ICszMiw4IEBAIHN0
cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSB7CiAJc3RydWN0IGRybV9jb25uZWN0b3IJCSpjb25uZWN0
b3I7CiAJc3RydWN0IGRybV9wYW5lbAkJKnBhbmVsOwogCXN0cnVjdCBkcm1fYnJpZGdlCQkqYnJp
ZGdlOworCisJdTMyCQkJCW1heF9idzsKIH07CiAKIGludCBteHNmYl9zZXR1cF9jcnRjKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
