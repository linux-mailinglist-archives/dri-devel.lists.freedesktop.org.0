Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C7A3285
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757416E2D5;
	Fri, 30 Aug 2019 08:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537A56E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:22 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E2E961A032E;
 Thu, 29 Aug 2019 13:30:20 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D6C571A032B;
 Thu, 29 Aug 2019 13:30:20 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3432D20613;
 Thu, 29 Aug 2019 13:30:20 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 03/14] drm/mxsfb: Add defines for the rest of registers
Date: Thu, 29 Aug 2019 14:30:04 +0300
Message-Id: <1567078215-31601-4-git-send-email-robert.chiras@nxp.com>
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

U29tZSBvZiB0aGUgZXhpc3RpbmcgcmVnaXN0ZXJzIGluIHRoaXMgY29udHJvbGxlciBhcmUgbm90
IGRlZmluZWQsIGJ1dAphbHNvIG5vdCB1c2VkLiBBZGQgdGhlbSB0byB0aGUgcmVnaXN0ZXIgZGVm
aW5pdGlvbnMsIHNvIHRoYXQgdGhleSBjYW4gYmUKZWFzaWx5IHVzZWQgaW4gZnV0dXJlIGltcHJv
dmVtZW50cyBvciBmaXhlcy4KClNpZ25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5j
aGlyYXNAbnhwLmNvbT4KVGVzdGVkLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmggfCAxNSArKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL214c2ZiL214c2ZiX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9t
eHNmYl9yZWdzLmgKaW5kZXggOTMyZDdlYS4uNzE0MjZhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL214c2ZiL214c2ZiX3JlZ3MuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhz
ZmJfcmVncy5oCkBAIC0xNCwxOSArMTQsMzEgQEAKIAogI2RlZmluZSBMQ0RDX0NUUkwJCQkweDAw
CiAjZGVmaW5lIExDRENfQ1RSTDEJCQkweDEwCisjZGVmaW5lIExDRENfVjRfQ1RSTDIJCQkweDIw
CiAjZGVmaW5lIExDRENfVjNfVFJBTlNGRVJfQ09VTlQJCTB4MjAKICNkZWZpbmUgTENEQ19WNF9U
UkFOU0ZFUl9DT1VOVAkJMHgzMAogI2RlZmluZSBMQ0RDX1Y0X0NVUl9CVUYJCQkweDQwCiAjZGVm
aW5lIExDRENfVjRfTkVYVF9CVUYJCTB4NTAKICNkZWZpbmUgTENEQ19WM19DVVJfQlVGCQkJMHgz
MAogI2RlZmluZSBMQ0RDX1YzX05FWFRfQlVGCQkweDQwCisjZGVmaW5lIExDRENfVElNSU5HCQkJ
MHg2MAogI2RlZmluZSBMQ0RDX1ZEQ1RSTDAJCQkweDcwCiAjZGVmaW5lIExDRENfVkRDVFJMMQkJ
CTB4ODAKICNkZWZpbmUgTENEQ19WRENUUkwyCQkJMHg5MAogI2RlZmluZSBMQ0RDX1ZEQ1RSTDMJ
CQkweGEwCiAjZGVmaW5lIExDRENfVkRDVFJMNAkJCTB4YjAKKyNkZWZpbmUgTENEQ19EVklDVFJM
MAkJCTB4YzAKKyNkZWZpbmUgTENEQ19EVklDVFJMMQkJCTB4ZDAKKyNkZWZpbmUgTENEQ19EVklD
VFJMMgkJCTB4ZTAKKyNkZWZpbmUgTENEQ19EVklDVFJMMwkJCTB4ZjAKKyNkZWZpbmUgTENEQ19E
VklDVFJMNAkJCTB4MTAwCisjZGVmaW5lIExDRENfVjRfREFUQQkJCTB4MTgwCisjZGVmaW5lIExD
RENfVjNfREFUQQkJCTB4MWIwCiAjZGVmaW5lIExDRENfVjRfREVCVUcwCQkJMHgxZDAKICNkZWZp
bmUgTENEQ19WM19ERUJVRzAJCQkweDFmMAorI2RlZmluZSBMQ0RDX0FTX0NUUkwJCQkweDIxMAor
I2RlZmluZSBMQ0RDX0FTX0JVRgkJCTB4MjIwCisjZGVmaW5lIExDRENfQVNfTkVYVF9CVUYJCTB4
MjMwCiAKICNkZWZpbmUgQ1RSTF9TRlRSU1QJCQkoMSA8PCAzMSkKICNkZWZpbmUgQ1RSTF9DTEtH
QVRFCQkJKDEgPDwgMzApCkBAIC00NSwxMiArNTcsMTUgQEAKICNkZWZpbmUgQ1RSTF9ERjI0CQkJ
KDEgPDwgMSkKICNkZWZpbmUgQ1RSTF9SVU4JCQkoMSA8PCAwKQogCisjZGVmaW5lIENUUkwxX1JF
Q09WRVJZX09OX1VOREVSRkxPVwkoMSA8PCAyNCkKICNkZWZpbmUgQ1RSTDFfRklGT19DTEVBUgkJ
KDEgPDwgMjEpCiAjZGVmaW5lIENUUkwxX1NFVF9CWVRFX1BBQ0tBR0lORyh4KQkoKCh4KSAmIDB4
ZikgPDwgMTYpCiAjZGVmaW5lIENUUkwxX0dFVF9CWVRFX1BBQ0tBR0lORyh4KQkoKCh4KSA+PiAx
NikgJiAweGYpCiAjZGVmaW5lIENUUkwxX0NVUl9GUkFNRV9ET05FX0lSUV9FTgkoMSA8PCAxMykK
ICNkZWZpbmUgQ1RSTDFfQ1VSX0ZSQU1FX0RPTkVfSVJRCSgxIDw8IDkpCiAKKyNkZWZpbmUgQ1RS
TDJfT1VUU1RBTkRJTkdfUkVRU19fUkVRXzE2CQkoNCA8PCAyMSkKKwogI2RlZmluZSBUUkFOU0ZF
Ul9DT1VOVF9TRVRfVkNPVU5UKHgpCSgoKHgpICYgMHhmZmZmKSA8PCAxNikKICNkZWZpbmUgVFJB
TlNGRVJfQ09VTlRfR0VUX1ZDT1VOVCh4KQkoKCh4KSA+PiAxNikgJiAweGZmZmYpCiAjZGVmaW5l
IFRSQU5TRkVSX0NPVU5UX1NFVF9IQ09VTlQoeCkJKCh4KSAmIDB4ZmZmZikKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
