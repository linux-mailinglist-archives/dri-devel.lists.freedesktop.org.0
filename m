Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D891A32A5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4D56E342;
	Fri, 30 Aug 2019 08:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FA26E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:25 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C8C411A033E;
 Thu, 29 Aug 2019 13:30:23 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C658D1A033D;
 Thu, 29 Aug 2019 13:30:23 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 239A020613;
 Thu, 29 Aug 2019 13:30:23 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 07/14] drm/mxsfb: Signal mode changed when bpp changed
Date: Thu, 29 Aug 2019 14:30:08 +0300
Message-Id: <1567078215-31601-8-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+CgpBZGQgbXhzZmJf
YXRvbWljX2hlbHBlcl9jaGVjayB0byBzaWduYWwgbW9kZSBjaGFuZ2VkIHdoZW4gYnBwIGNoYW5n
ZWQuClRoaXMgd2lsbCB0cmlnZ2VyIHRoZSBleGVjdXRpb24gb2YgZGlzYWJsZS9lbmFibGUgb24K
YSBtb2Rlc2V0IHdpdGggZGlmZmVyZW50IGJwcCB0aGFuIHRoZSBjdXJyZW50IG9uZS4KClNpZ25l
ZC1vZmYtYnk6IE1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFidWxlYUBueHAuY29tPgpTaWduZWQt
b2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+ClRlc3RlZC1ieTog
R3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXhz
ZmIvbXhzZmJfZHJ2LmMgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL214c2ZiL214c2ZiX2Rydi5jCmluZGV4IDIzMDI3YTkuLmY5NWJhNjMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXhzZmIvbXhzZmJfZHJ2LmMKQEAgLTI2LDYgKzI2LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2Ry
di5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9k
cm1fZmJfaGVscGVyLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZm
ZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KQEAgLTEwNSw5ICsxMDYsNTEg
QEAgdm9pZCBteHNmYl9kaXNhYmxlX2F4aV9jbGsoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpt
eHNmYikKIAkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG14c2ZiLT5jbGtfYXhpKTsKIH0KIAorLyoq
CisgKiBteHNmYl9hdG9taWNfaGVscGVyX2NoZWNrIC0gdmFsaWRhdGUgc3RhdGUgb2JqZWN0Cisg
KiBAZGV2OiBEUk0gZGV2aWNlCisgKiBAc3RhdGU6IHRoZSBkcml2ZXIgc3RhdGUgb2JqZWN0Cisg
KgorICogT24gdG9wIG9mIHRoZSBkcm0gaW1sZW1lbnRhdGlvbiBkcm1fYXRvbWljX2hlbHBlcl9j
aGVjaywKKyAqIGNoZWNrIGlmIHRoZSBicHAgaXMgY2hhbmdlZCwgaWYgc28sIHNpZ25hbCBtb2Rl
X2NoYW5nZWQsCisgKiB0aGlzIHdpbGwgdHJpZ2dlciBkaXNhYmxlL2VuYWJsZQorICoKKyAqIFJF
VFVSTlM6CisgKiBaZXJvIGZvciBzdWNjZXNzIG9yIC1lcnJubworICovCitzdGF0aWMgaW50IG14
c2ZiX2F0b21pY19oZWxwZXJfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKKwkJCQkgICAg
IHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKK3sKKwlzdHJ1Y3QgZHJtX2NydGMgKmNy
dGM7CisJc3RydWN0IGRybV9jcnRjX3N0YXRlICpuZXdfc3RhdGU7CisJaW50IGksIHJldDsKKwor
CXJldCA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNrKGRldiwgc3RhdGUpOworCWlmIChyZXQpCisJ
CXJldHVybiByZXQ7CisKKwlmb3JfZWFjaF9uZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0Yywg
bmV3X3N0YXRlLCBpKSB7CisJCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnByaW1hcnlfc3RhdGU7
CisJCWludCBvbGRfYnBwID0gMDsKKwkJaW50IG5ld19icHAgPSAwOworCisJCWlmICghY3J0Yy0+
cHJpbWFyeSB8fCAhY3J0Yy0+cHJpbWFyeS0+b2xkX2ZiKQorCQkJY29udGludWU7CisJCXByaW1h
cnlfc3RhdGUgPQorCQkJZHJtX2F0b21pY19nZXRfcGxhbmVfc3RhdGUoc3RhdGUsIGNydGMtPnBy
aW1hcnkpOworCQlpZiAoIXByaW1hcnlfc3RhdGUgfHwgIXByaW1hcnlfc3RhdGUtPmZiKQorCQkJ
Y29udGludWU7CisJCW9sZF9icHAgPSBjcnRjLT5wcmltYXJ5LT5vbGRfZmItPmZvcm1hdC0+ZGVw
dGg7CisJCW5ld19icHAgPSBwcmltYXJ5X3N0YXRlLT5mYi0+Zm9ybWF0LT5kZXB0aDsKKwkJaWYg
KG9sZF9icHAgIT0gbmV3X2JwcCkKKwkJCW5ld19zdGF0ZS0+bW9kZV9jaGFuZ2VkID0gdHJ1ZTsK
Kwl9CisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25m
aWdfZnVuY3MgbXhzZmJfbW9kZV9jb25maWdfZnVuY3MgPSB7CiAJLmZiX2NyZWF0ZQkJPSBkcm1f
Z2VtX2ZiX2NyZWF0ZSwKLQkuYXRvbWljX2NoZWNrCQk9IGRybV9hdG9taWNfaGVscGVyX2NoZWNr
LAorCS5hdG9taWNfY2hlY2sJCT0gbXhzZmJfYXRvbWljX2hlbHBlcl9jaGVjaywKIAkuYXRvbWlj
X2NvbW1pdAkJPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXQsCiB9OwogCi0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
