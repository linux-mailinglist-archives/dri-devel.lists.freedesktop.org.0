Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619FCA325F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D694F6E2A0;
	Fri, 30 Aug 2019 08:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB8E6E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:27 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3EDD820032E;
 Thu, 29 Aug 2019 13:30:26 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3191E200073;
 Thu, 29 Aug 2019 13:30:26 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 5CAD320613;
 Thu, 29 Aug 2019 13:30:25 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 10/14] drm/mxsfb: Update mxsfb to support LCD reset
Date: Thu, 29 Aug 2019 14:30:11 +0300
Message-Id: <1567078215-31601-11-git-send-email-robert.chiras@nxp.com>
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

VGhlIGVMQ0RJRiBjb250cm9sbGVyIGhhcyBjb250cm9sIHBpbiBmb3IgdGhlIGV4dGVybmFsIExD
RCByZXNldCBwaW4uCkFkZCBzdXBwb3J0IGZvciBpdCBhbmQgYXNzZXJ0IHRoaXMgcGluIGluIGVu
YWJsZSBhbmQgZGUtYXNzZXJ0IGl0IGluCmRpc2FibGUuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQg
Q2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+ClRlc3RlZC1ieTogR3VpZG8gR8O8bnRoZXIg
PGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5j
IHwgMTQgKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmgg
fCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCmluZGV4IDFiZTI5ZjUuLmE0YmEzNjggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwpAQCAtMjI0LDkgKzIyNCwxMiBAQCBzdGF0aWMg
dm9pZCBteHNmYl9lbmFibGVfY29udHJvbGxlcihzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14
c2ZiKQogCQljbGtfcHJlcGFyZV9lbmFibGUobXhzZmItPmNsa19kaXNwX2F4aSk7CiAJY2xrX3By
ZXBhcmVfZW5hYmxlKG14c2ZiLT5jbGspOwogCi0JaWYgKG14c2ZiLT5kZXZkYXRhLT5pcHZlcnNp
b24gPj0gNCkKKwlpZiAobXhzZmItPmRldmRhdGEtPmlwdmVyc2lvbiA+PSA0KSB7CiAJCXdyaXRl
bChDVFJMMl9PVVRTVEFORElOR19SRVFTKFJFUV8xNiksCiAJCSAgICAgICBteHNmYi0+YmFzZSAr
IExDRENfVjRfQ1RSTDIgKyBSRUdfU0VUKTsKKwkJLyogQXNzZXJ0IExDRCBSZXNldCBiaXQgKi8K
KwkJd3JpdGVsKENUUkwyX0xDRF9SRVNFVCwgbXhzZmItPmJhc2UgKyBMQ0RDX1Y0X0NUUkwyICsg
UkVHX1NFVCk7CisJfQogCiAJLyogSWYgaXQgd2FzIGRpc2FibGVkLCByZS1lbmFibGUgdGhlIG1v
ZGUgYWdhaW4gKi8KIAl3cml0ZWwoQ1RSTF9ET1RDTEtfTU9ERSwgbXhzZmItPmJhc2UgKyBMQ0RD
X0NUUkwgKyBSRUdfU0VUKTsKQEAgLTI0NCwxMSArMjQ3LDE0IEBAIHN0YXRpYyB2b2lkIG14c2Zi
X2Rpc2FibGVfY29udHJvbGxlcihzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14c2ZiKQogewog
CXUzMiByZWc7CiAKLQlpZiAobXhzZmItPmRldmRhdGEtPmlwdmVyc2lvbiA+PSA0KQorCXdyaXRl
bChDVFJMX1JVTiwgbXhzZmItPmJhc2UgKyBMQ0RDX0NUUkwgKyBSRUdfQ0xSKTsKKworCWlmICht
eHNmYi0+ZGV2ZGF0YS0+aXB2ZXJzaW9uID49IDQpIHsKIAkJd3JpdGVsKENUUkwyX09VVFNUQU5E
SU5HX1JFUVMoMHg3KSwKIAkJICAgICAgIG14c2ZiLT5iYXNlICsgTENEQ19WNF9DVFJMMiArIFJF
R19DTFIpOwotCi0Jd3JpdGVsKENUUkxfUlVOLCBteHNmYi0+YmFzZSArIExDRENfQ1RSTCArIFJF
R19DTFIpOworCQkvKiBEZS1hc3NlcnQgTENEIFJlc2V0IGJpdCAqLworCQl3cml0ZWwoQ1RSTDJf
TENEX1JFU0VULCBteHNmYi0+YmFzZSArIExDRENfVjRfQ1RSTDIgKyBSRUdfQ0xSKTsKKwl9CiAK
IAkvKgogCSAqIEV2ZW4gaWYgd2UgZGlzYWJsZSB0aGUgY29udHJvbGxlciBoZXJlLCBpdCB3aWxs
IHN0aWxsIGNvbnRpbnVlCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJf
cmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX3JlZ3MuaAppbmRleCBkYzRkYWEw
Li4wZjYzYmExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfcmVncy5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmgKQEAgLTEwOCw2ICsxMDgs
OCBAQAogI2RlZmluZSBDVFJMMl9MSU5FX1BBVFRFUk5fQkdSCTUKICNkZWZpbmUgQ1RSTDJfTElO
RV9QQVRURVJOX0NMUgk3CiAKKyNkZWZpbmUgQ1RSTDJfTENEX1JFU0VUCQkJQklUKDApCisKICNk
ZWZpbmUgVFJBTlNGRVJfQ09VTlRfU0VUX1ZDT1VOVCh4KQlSRUdfUFVUKCh4KSwgMzEsIDE2KQog
I2RlZmluZSBUUkFOU0ZFUl9DT1VOVF9HRVRfVkNPVU5UKHgpCVJFR19HRVQoKHgpLCAzMSwgMTYp
CiAjZGVmaW5lIFRSQU5TRkVSX0NPVU5UX1NFVF9IQ09VTlQoeCkJUkVHX1BVVCgoeCksIDE1LCAw
KQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
