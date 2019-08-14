Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99148E6E0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B539B6E943;
	Thu, 15 Aug 2019 08:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FD76E5EF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:57:59 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 56199200223;
 Wed, 14 Aug 2019 12:48:59 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 46296200220;
 Wed, 14 Aug 2019 12:48:59 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 475672060E;
 Wed, 14 Aug 2019 12:48:58 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 03/15] drm/mxsfb: Add defines for the rest of registers
Date: Wed, 14 Aug 2019 13:48:39 +0300
Message-Id: <1565779731-1300-4-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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

U29tZSBvZiB0aGUgZXhpc3RpbmcgcmVnaXN0ZXJzIGluIHRoaXMgY29udHJvbGxlciBhcmUgbm90
IGRlZmluZWQsIGJ1dAphbHNvIG5vdCB1c2VkLiBBZGQgdGhlbSB0byB0aGUgcmVnaXN0ZXIgZGVm
aW5pdGlvbnMsIHNvIHRoYXQgdGhleSBjYW4gYmUKZWFzaWx5IHVzZWQgaW4gZnV0dXJlIGltcHJv
dmVtZW50cyBvciBmaXhlcy4KClNpZ25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5j
aGlyYXNAbnhwLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfcmVncy5oIHwg
MTUgKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmggYi9kcml2ZXJzL2dw
dS9kcm0vbXhzZmIvbXhzZmJfcmVncy5oCmluZGV4IDkzMmQ3ZWEuLjcxNDI2YWEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL214c2ZiL214c2ZiX3JlZ3MuaApAQCAtMTQsMTkgKzE0LDMxIEBACiAKICNkZWZpbmUgTENE
Q19DVFJMCQkJMHgwMAogI2RlZmluZSBMQ0RDX0NUUkwxCQkJMHgxMAorI2RlZmluZSBMQ0RDX1Y0
X0NUUkwyCQkJMHgyMAogI2RlZmluZSBMQ0RDX1YzX1RSQU5TRkVSX0NPVU5UCQkweDIwCiAjZGVm
aW5lIExDRENfVjRfVFJBTlNGRVJfQ09VTlQJCTB4MzAKICNkZWZpbmUgTENEQ19WNF9DVVJfQlVG
CQkJMHg0MAogI2RlZmluZSBMQ0RDX1Y0X05FWFRfQlVGCQkweDUwCiAjZGVmaW5lIExDRENfVjNf
Q1VSX0JVRgkJCTB4MzAKICNkZWZpbmUgTENEQ19WM19ORVhUX0JVRgkJMHg0MAorI2RlZmluZSBM
Q0RDX1RJTUlORwkJCTB4NjAKICNkZWZpbmUgTENEQ19WRENUUkwwCQkJMHg3MAogI2RlZmluZSBM
Q0RDX1ZEQ1RSTDEJCQkweDgwCiAjZGVmaW5lIExDRENfVkRDVFJMMgkJCTB4OTAKICNkZWZpbmUg
TENEQ19WRENUUkwzCQkJMHhhMAogI2RlZmluZSBMQ0RDX1ZEQ1RSTDQJCQkweGIwCisjZGVmaW5l
IExDRENfRFZJQ1RSTDAJCQkweGMwCisjZGVmaW5lIExDRENfRFZJQ1RSTDEJCQkweGQwCisjZGVm
aW5lIExDRENfRFZJQ1RSTDIJCQkweGUwCisjZGVmaW5lIExDRENfRFZJQ1RSTDMJCQkweGYwCisj
ZGVmaW5lIExDRENfRFZJQ1RSTDQJCQkweDEwMAorI2RlZmluZSBMQ0RDX1Y0X0RBVEEJCQkweDE4
MAorI2RlZmluZSBMQ0RDX1YzX0RBVEEJCQkweDFiMAogI2RlZmluZSBMQ0RDX1Y0X0RFQlVHMAkJ
CTB4MWQwCiAjZGVmaW5lIExDRENfVjNfREVCVUcwCQkJMHgxZjAKKyNkZWZpbmUgTENEQ19BU19D
VFJMCQkJMHgyMTAKKyNkZWZpbmUgTENEQ19BU19CVUYJCQkweDIyMAorI2RlZmluZSBMQ0RDX0FT
X05FWFRfQlVGCQkweDIzMAogCiAjZGVmaW5lIENUUkxfU0ZUUlNUCQkJKDEgPDwgMzEpCiAjZGVm
aW5lIENUUkxfQ0xLR0FURQkJCSgxIDw8IDMwKQpAQCAtNDUsMTIgKzU3LDE1IEBACiAjZGVmaW5l
IENUUkxfREYyNAkJCSgxIDw8IDEpCiAjZGVmaW5lIENUUkxfUlVOCQkJKDEgPDwgMCkKIAorI2Rl
ZmluZSBDVFJMMV9SRUNPVkVSWV9PTl9VTkRFUkZMT1cJKDEgPDwgMjQpCiAjZGVmaW5lIENUUkwx
X0ZJRk9fQ0xFQVIJCSgxIDw8IDIxKQogI2RlZmluZSBDVFJMMV9TRVRfQllURV9QQUNLQUdJTkco
eCkJKCgoeCkgJiAweGYpIDw8IDE2KQogI2RlZmluZSBDVFJMMV9HRVRfQllURV9QQUNLQUdJTkco
eCkJKCgoeCkgPj4gMTYpICYgMHhmKQogI2RlZmluZSBDVFJMMV9DVVJfRlJBTUVfRE9ORV9JUlFf
RU4JKDEgPDwgMTMpCiAjZGVmaW5lIENUUkwxX0NVUl9GUkFNRV9ET05FX0lSUQkoMSA8PCA5KQog
CisjZGVmaW5lIENUUkwyX09VVFNUQU5ESU5HX1JFUVNfX1JFUV8xNgkJKDQgPDwgMjEpCisKICNk
ZWZpbmUgVFJBTlNGRVJfQ09VTlRfU0VUX1ZDT1VOVCh4KQkoKCh4KSAmIDB4ZmZmZikgPDwgMTYp
CiAjZGVmaW5lIFRSQU5TRkVSX0NPVU5UX0dFVF9WQ09VTlQoeCkJKCgoeCkgPj4gMTYpICYgMHhm
ZmZmKQogI2RlZmluZSBUUkFOU0ZFUl9DT1VOVF9TRVRfSENPVU5UKHgpCSgoeCkgJiAweGZmZmYp
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
