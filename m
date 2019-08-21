Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705398D4E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483606EAB6;
	Thu, 22 Aug 2019 08:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B136E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:16:23 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 069CC1A000F;
 Wed, 21 Aug 2019 12:16:22 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EE8711A02A4;
 Wed, 21 Aug 2019 12:16:21 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 4B1C1205D3;
 Wed, 21 Aug 2019 12:16:21 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 08/15] drm/mxsfb: Signal mode changed when bpp changed
Date: Wed, 21 Aug 2019 13:15:48 +0300
Message-Id: <1566382555-12102-9-git-send-email-robert.chiras@nxp.com>
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

RnJvbTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+CgpBZGQgbXhzZmJf
YXRvbWljX2hlbHBlcl9jaGVjayB0byBzaWduYWwgbW9kZSBjaGFuZ2VkIHdoZW4gYnBwIGNoYW5n
ZWQuClRoaXMgd2lsbCB0cmlnZ2VyIHRoZSBleGVjdXRpb24gb2YgZGlzYWJsZS9lbmFibGUgb24K
YSBtb2Rlc2V0IHdpdGggZGlmZmVyZW50IGJwcCB0aGFuIHRoZSBjdXJyZW50IG9uZS4KClNpZ25l
ZC1vZmYtYnk6IE1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFidWxlYUBueHAuY29tPgpTaWduZWQt
b2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwppbmRleCA3OGEyMzgyLi5mNTFjOGEz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCkBAIC0yNiw2ICsyNiw3IEBACiAjaW5jbHVk
ZSA8ZHJtL2RybV9kcnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+
CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1f
Z2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1faXJxLmg+CkBAIC0x
MDgsOSArMTA5LDUxIEBAIHZvaWQgbXhzZmJfZGlzYWJsZV9heGlfY2xrKHN0cnVjdCBteHNmYl9k
cm1fcHJpdmF0ZSAqbXhzZmIpCiAJCWNsa19kaXNhYmxlX3VucHJlcGFyZShteHNmYi0+Y2xrX2F4
aSk7CiB9CiAKKy8qKgorICogbXhzZmJfYXRvbWljX2hlbHBlcl9jaGVjayAtIHZhbGlkYXRlIHN0
YXRlIG9iamVjdAorICogQGRldjogRFJNIGRldmljZQorICogQHN0YXRlOiB0aGUgZHJpdmVyIHN0
YXRlIG9iamVjdAorICoKKyAqIE9uIHRvcCBvZiB0aGUgZHJtIGltbGVtZW50YXRpb24gZHJtX2F0
b21pY19oZWxwZXJfY2hlY2ssCisgKiBjaGVjayBpZiB0aGUgYnBwIGlzIGNoYW5nZWQsIGlmIHNv
LCBzaWduYWwgbW9kZV9jaGFuZ2VkLAorICogdGhpcyB3aWxsIHRyaWdnZXIgZGlzYWJsZS9lbmFi
bGUKKyAqCisgKiBSRVRVUk5TOgorICogWmVybyBmb3Igc3VjY2VzcyBvciAtZXJybm8KKyAqLwor
c3RhdGljIGludCBteHNmYl9hdG9taWNfaGVscGVyX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCisJCQkJICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCit7CisJc3RydWN0
IGRybV9jcnRjICpjcnRjOworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X3N0YXRlOworCWlu
dCBpLCByZXQ7CisKKwlyZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjayhkZXYsIHN0YXRlKTsK
KwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJZm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUo
c3RhdGUsIGNydGMsIG5ld19zdGF0ZSwgaSkgeworCQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpw
cmltYXJ5X3N0YXRlOworCQlpbnQgb2xkX2JwcCA9IDA7CisJCWludCBuZXdfYnBwID0gMDsKKwor
CQlpZiAoIWNydGMtPnByaW1hcnkgfHwgIWNydGMtPnByaW1hcnktPm9sZF9mYikKKwkJCWNvbnRp
bnVlOworCQlwcmltYXJ5X3N0YXRlID0KKwkJCWRybV9hdG9taWNfZ2V0X3BsYW5lX3N0YXRlKHN0
YXRlLCBjcnRjLT5wcmltYXJ5KTsKKwkJaWYgKCFwcmltYXJ5X3N0YXRlIHx8ICFwcmltYXJ5X3N0
YXRlLT5mYikKKwkJCWNvbnRpbnVlOworCQlvbGRfYnBwID0gY3J0Yy0+cHJpbWFyeS0+b2xkX2Zi
LT5mb3JtYXQtPmRlcHRoOworCQluZXdfYnBwID0gcHJpbWFyeV9zdGF0ZS0+ZmItPmZvcm1hdC0+
ZGVwdGg7CisJCWlmIChvbGRfYnBwICE9IG5ld19icHApCisJCQluZXdfc3RhdGUtPm1vZGVfY2hh
bmdlZCA9IHRydWU7CisJfQorCXJldHVybiByZXQ7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX21vZGVfY29uZmlnX2Z1bmNzIG14c2ZiX21vZGVfY29uZmlnX2Z1bmNzID0gewogCS5mYl9j
cmVhdGUJCT0gZHJtX2dlbV9mYl9jcmVhdGUsCi0JLmF0b21pY19jaGVjawkJPSBkcm1fYXRvbWlj
X2hlbHBlcl9jaGVjaywKKwkuYXRvbWljX2NoZWNrCQk9IG14c2ZiX2F0b21pY19oZWxwZXJfY2hl
Y2ssCiAJLmF0b21pY19jb21taXQJCT0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0LAogfTsKIAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
