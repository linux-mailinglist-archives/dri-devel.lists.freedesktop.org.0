Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7A57CCE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CCD6E5D0;
	Thu, 27 Jun 2019 07:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F86B6E433
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:32:26 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 21B2A200F53;
 Wed, 26 Jun 2019 15:32:25 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 138C82009B6;
 Wed, 26 Jun 2019 15:32:25 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 5AE4D205DB;
 Wed, 26 Jun 2019 15:32:24 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 04/10] drm/mxsfb: Signal mode changed when bpp changed
Date: Wed, 26 Jun 2019 16:32:12 +0300
Message-Id: <1561555938-21595-5-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
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
 dri-devel@lists.freedesktop.org, Mirela Rabulea <mirela.rabulea@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, linux-arm-kernel@lists.infradead.org
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
cy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwppbmRleCA4ZDE0OTIxLi42NDU3NWRm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCkBAIC0xMDUsOSArMTA1LDUxIEBAIHZvaWQg
bXhzZmJfZGlzYWJsZV9heGlfY2xrKHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCiAJ
CWNsa19kaXNhYmxlX3VucHJlcGFyZShteHNmYi0+Y2xrX2F4aSk7CiB9CiAKKy8qKgorICogbXhz
ZmJfYXRvbWljX2hlbHBlcl9jaGVjayAtIHZhbGlkYXRlIHN0YXRlIG9iamVjdAorICogQGRldjog
RFJNIGRldmljZQorICogQHN0YXRlOiB0aGUgZHJpdmVyIHN0YXRlIG9iamVjdAorICoKKyAqIE9u
IHRvcCBvZiB0aGUgZHJtIGltbGVtZW50YXRpb24gZHJtX2F0b21pY19oZWxwZXJfY2hlY2ssCisg
KiBjaGVjayBpZiB0aGUgYnBwIGlzIGNoYW5nZWQsIGlmIHNvLCBzaWduYWwgbW9kZV9jaGFuZ2Vk
LAorICogdGhpcyB3aWxsIHRyaWdnZXIgZGlzYWJsZS9lbmFibGUKKyAqCisgKiBSRVRVUk5TOgor
ICogWmVybyBmb3Igc3VjY2VzcyBvciAtZXJybm8KKyAqLworc3RhdGljIGludCBteHNmYl9hdG9t
aWNfaGVscGVyX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJCQkJICAgICBzdHJ1Y3Qg
ZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCit7CisJc3RydWN0IGRybV9jcnRjICpjcnRjOworCXN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X3N0YXRlOworCWludCBpLCByZXQ7CisKKwlyZXQgPSBk
cm1fYXRvbWljX2hlbHBlcl9jaGVjayhkZXYsIHN0YXRlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4g
cmV0OworCisJZm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUoc3RhdGUsIGNydGMsIG5ld19zdGF0
ZSwgaSkgeworCQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwcmltYXJ5X3N0YXRlOworCQlpbnQg
b2xkX2JwcCA9IDA7CisJCWludCBuZXdfYnBwID0gMDsKKworCQlpZiAoIWNydGMtPnByaW1hcnkg
fHwgIWNydGMtPnByaW1hcnktPm9sZF9mYikKKwkJCWNvbnRpbnVlOworCQlwcmltYXJ5X3N0YXRl
ID0KKwkJCWRybV9hdG9taWNfZ2V0X3BsYW5lX3N0YXRlKHN0YXRlLCBjcnRjLT5wcmltYXJ5KTsK
KwkJaWYgKCFwcmltYXJ5X3N0YXRlIHx8ICFwcmltYXJ5X3N0YXRlLT5mYikKKwkJCWNvbnRpbnVl
OworCQlvbGRfYnBwID0gY3J0Yy0+cHJpbWFyeS0+b2xkX2ZiLT5mb3JtYXQtPmRlcHRoOworCQlu
ZXdfYnBwID0gcHJpbWFyeV9zdGF0ZS0+ZmItPmZvcm1hdC0+ZGVwdGg7CisJCWlmIChvbGRfYnBw
ICE9IG5ld19icHApCisJCQluZXdfc3RhdGUtPm1vZGVfY2hhbmdlZCA9IHRydWU7CisJfQorCXJl
dHVybiByZXQ7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNz
IG14c2ZiX21vZGVfY29uZmlnX2Z1bmNzID0gewogCS5mYl9jcmVhdGUJCT0gZHJtX2dlbV9mYl9j
cmVhdGUsCi0JLmF0b21pY19jaGVjawkJPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjaywKKwkuYXRv
bWljX2NoZWNrCQk9IG14c2ZiX2F0b21pY19oZWxwZXJfY2hlY2ssCiAJLmF0b21pY19jb21taXQJ
CT0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0LAogfTsKIAotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
