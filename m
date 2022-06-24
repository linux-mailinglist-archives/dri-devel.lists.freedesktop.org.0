Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB2B55A2BA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616D110F49D;
	Fri, 24 Jun 2022 20:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A72010F3AF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102812;
 bh=yw8YmE+N0z7n98ysIQchFAaXOgSFOyXS/YyyNr6RKjE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=epRE4XusNg8wPw2tVoTRCQoVYhvtb3K4N0MK65T7EP1pHz9SNtVl0KVd6Rv/Znfqa
 Lo7IPJks6RmVs9SLlNf+EEsEWitELepTH3IZqE+m5cqP/eDoHygitbi159AVhQsTyA
 BcqY0iXxKi55US8lsxskIFpOz7tAWsBKfp68UXa4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1Mlw7V-1nMjeW44Rf-00j1NB; Fri, 24 Jun 2022 22:28:29 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/28] drm/via: Add via_init.c
Date: Fri, 24 Jun 2022 15:26:20 -0500
Message-Id: <20220624202633.3978-16-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t3AltMHpJrkytvIPst4kL0htXgQWx40Robh4QgoDaVIkuJkDo9G
 qpZau/Wx9RkCwUTS/27Mm74yiR7XunNbDvbeLzC3aL5W1O1voJnchfdErcRRFLdoFee5TlY
 pCcFbq1NMKkTDgxl0CnF4lAD+LA9mr71oM3xXxOYKF5Qhyo8FOeGMF6+G7l19e1zcM5TGYI
 N7ntACqZ5sFtj6yNw79qw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3wL28/koBQA=:9Z53ho5+DPXKmc4eDHeUNK
 jC9niYYMAOv9t2JQywktI0JbuGbu1emNqVn/aKhFg2vP6r5igkrv97n+6W5QyCZPwL5sOxWCb
 CKUolukk00c8FWQqA8r29qkgwr4LAVkbDjN5Ur9tVVo9P950oJisvSFIBoDF1czkmNw6BcKYM
 VojrtNzDWiK/7V/L6cN7Ykznbli+A6vFSv7MN+DWtDCFi3Wu0/iVG7iKOANayLEtBR44t1cAB
 EPXhto+opQLpEUQRl23r82Z0CzUNErq1h73lYHFJPLkD85x/ZkclqPZ/h9xf+SK4BpImaygkc
 b32jLp9EwGC66QZhEff5mj55rC6DCgVOkbgwplfxt2qKBUZcXBF5iqpQptJGzDW2osF800D9U
 Vzkm7uA0K3L/7/UzXxIhnU4fxeM2wKJbJVous/gRDuQhWcRHpy9ZvonpAdXj4NyYGv8oaJLC+
 Sr/GhD5k5oTekRH2WMJaUeRi7nqDJQc2DUDqiwVRwprMyaJZ2/5KJJSSJwj3DyIJB+C8BstyG
 2mupW2/ixMgoF9ZRPTza6a67W70WE/P283mwMmIyR8dTpE5uSij+cOKaeZzaf9atvEZMk4tKm
 nR636OzjkebLh1xeZT6j2rRJ6a9jbsb6cOkW7RKOxoxot6B8Cv1y1ShHEjBGrPKUn2joEDcT9
 rr6r2H2c4l7IjBow6f5RuyqoAlIOFiZ/Pny/rk10BYmafPbY4G21Go/Wa8FhHP8k+pEwWTRHL
 LHG0uT1vuoUP2NuEIQcvTd/cstMVmEGkVliZf3QitjEaPB6fFakf21dcMAljt1OW9F2lF1iWC
 wJqYUZ23BQ+Dvtoqrua+Fvf2doI3m2ei1XK+L0N7r/3YXOOx3muD6vs7oOmJx7GYg0D0+wnL2
 6b7LTtLCgAMUsboDp6ZxFmPPIkwFm/r6PCxDVGxbRj+8rM/7R9/P5foFgbHAPOoL0MnBWDJnY
 2jREBmvO57h3khDNc+UKGa7U+L3F6xMnDkJ6lpTvGmXwv88DXhadLi6UrXln1x+JXzKUu5Uzh
 cGMccQy9ArGqbjVQPMHt/fANBHGmODhS+5g794IVnkDnzqNbZ381DZlgPWZwClpevID18H5Ud
 /mA5oKa/N+/GGCaEU+ae0um8TT+RGlhPnxKsfyiQCcY8c6VgCI/NjAtiw==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_init.c | 1300 ++++++++++++++++++++++++++++++++
 1 file changed, 1300 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_init.c

diff --git a/drivers/gpu/drm/via/via_init.c b/drivers/gpu/drm/via/via_init=
.c
new file mode 100644
index 000000000000..a46b9fb79884
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_init.c
@@ -0,0 +1,1300 @@
+/*
+ * Copyright =C2=A9 2019 Kevin Brace.
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ * Copyright 2006-2009 Luc Verhaegen.
+ * Copyright 1998-2009 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2009 S3 Graphics, Inc. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ * James Simmons <jsimmons@infradead.org>
+ * Luc Verhaegen
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mode_config.h>
+
+#include "via_drv.h"
+
+
+static int cle266_mem_type(struct via_drm_priv *dev_priv,
+				struct pci_dev *bridge)
+{
+	u8 type, fsb, freq;
+	int ret;
+
+	ret =3D pci_read_config_byte(bridge, 0x54, &fsb);
+	if (ret)
+		return ret;
+	ret =3D pci_read_config_byte(bridge, 0x69, &freq);
+	if (ret)
+		return ret;
+
+	freq >>=3D 6;
+	fsb >>=3D 6;
+
+	/* FSB frequency */
+	switch (fsb) {
+	case 0x01: /* 100MHz */
+		switch (freq) {
+		case 0x00:
+			freq =3D 100;
+			break;
+		case 0x01:
+			freq =3D 133;
+			break;
+		case 0x02:
+			freq =3D 66;
+			break;
+		default:
+			freq =3D 0;
+			break;
+		}
+		break;
+
+	case 0x02: /* 133 MHz */
+	case 0x03:
+		switch (freq) {
+		case 0x00:
+			freq =3D 133;
+			break;
+		case 0x02:
+			freq =3D 100;
+			break;
+		default:
+			freq =3D 0;
+			break;
+		}
+		break;
+	default:
+		freq =3D 0;
+		break;
+	}
+
+	ret =3D pci_read_config_byte(bridge, 0x60, &fsb);
+	if (ret)
+		return ret;
+	ret =3D pci_read_config_byte(bridge, 0xE3, &type);
+	if (ret)
+		return ret;
+
+	/* On bank 2/3 */
+	if (type & 0x02)
+		fsb >>=3D 2;
+
+	/* Memory type */
+	switch (fsb & 0x03) {
+	case 0x00: /* SDR */
+		switch (freq) {
+		case 66:
+			dev_priv->vram_type =3D VIA_MEM_SDR66;
+			break;
+		case 100:
+			dev_priv->vram_type =3D VIA_MEM_SDR100;
+			break;
+		case 133:
+			dev_priv->vram_type =3D VIA_MEM_SDR133;
+			break;
+		default:
+			break;
+		}
+		break;
+
+	case 0x02: /* DDR */
+		switch (freq) {
+		case 100:
+			dev_priv->vram_type =3D VIA_MEM_DDR_200;
+			break;
+		case 133:
+			dev_priv->vram_type =3D VIA_MEM_DDR_266;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+static int km400_mem_type(struct via_drm_priv *dev_priv,
+				struct pci_dev *bridge)
+{
+	u8 fsb, freq, rev;
+	int ret;
+
+	ret =3D pci_read_config_byte(bridge, 0xF6, &rev);
+	if (ret)
+		return ret;
+	ret =3D pci_read_config_byte(bridge, 0x54, &fsb);
+	if (ret)
+		return ret;
+	ret =3D pci_read_config_byte(bridge, 0x69, &freq);
+	if (ret)
+		return ret;
+
+	freq >>=3D 6;
+	fsb >>=3D 6;
+
+	/* KM400 */
+	if (rev < 0x80) {
+		/* FSB frequency */
+		switch (fsb) {
+		case 0x00:
+			switch (freq) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR_200;
+				break;
+			case 0x01:
+				dev_priv->vram_type =3D VIA_MEM_DDR_266;
+				break;
+			case 0x02:
+				dev_priv->vram_type =3D VIA_MEM_DDR_400;
+				break;
+			case 0x03:
+				dev_priv->vram_type =3D VIA_MEM_DDR_333;
+				break;
+			default:
+				break;
+			}
+			break;
+
+		case 0x01:
+			switch (freq) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR_266;
+				break;
+			case 0x01:
+				dev_priv->vram_type =3D VIA_MEM_DDR_333;
+				break;
+			case 0x02:
+				dev_priv->vram_type =3D VIA_MEM_DDR_400;
+				break;
+			default:
+				break;
+			}
+			break;
+
+		case 0x02:
+		case 0x03:
+			switch (freq) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR_333;
+				break;
+			case 0x02:
+				dev_priv->vram_type =3D VIA_MEM_DDR_400;
+				break;
+			case 0x03:
+				dev_priv->vram_type =3D VIA_MEM_DDR_266;
+				break;
+			default:
+				break;
+			}
+			break;
+		default:
+			break;
+		}
+	} else {
+		/* KM400A */
+		ret =3D pci_read_config_byte(bridge, 0x67, &rev);
+		if (ret)
+			return ret;
+		if (rev & 0x80)
+			freq |=3D 0x04;
+
+		switch (fsb) {
+		case 0x00:
+			switch (freq) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR_200;
+				break;
+			case 0x01:
+				dev_priv->vram_type =3D VIA_MEM_DDR_266;
+				break;
+			case 0x03:
+				dev_priv->vram_type =3D VIA_MEM_DDR_333;
+				break;
+			case 0x07:
+				dev_priv->vram_type =3D VIA_MEM_DDR_400;
+				break;
+			default:
+				dev_priv->vram_type =3D VIA_MEM_NONE;
+				break;
+			}
+			break;
+
+		case 0x01:
+			switch (freq) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR_266;
+				break;
+			case 0x01:
+				dev_priv->vram_type =3D VIA_MEM_DDR_333;
+				break;
+			case 0x03:
+				dev_priv->vram_type =3D VIA_MEM_DDR_400;
+				break;
+			default:
+				break;
+			}
+			break;
+
+		case 0x02:
+			switch (freq) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR_400;
+				break;
+			case 0x04:
+				dev_priv->vram_type =3D VIA_MEM_DDR_333;
+				break;
+			case 0x06:
+				dev_priv->vram_type =3D VIA_MEM_DDR_266;
+				break;
+			default:
+				break;
+			}
+			break;
+
+		case 0x03:
+			switch (freq) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR_333;
+				break;
+			case 0x01:
+				dev_priv->vram_type =3D VIA_MEM_DDR_400;
+				break;
+			case 0x04:
+				dev_priv->vram_type =3D VIA_MEM_DDR_266;
+				break;
+			default:
+				break;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+	return ret;
+}
+
+static int p4m800_mem_type(struct via_drm_priv *dev_priv,
+				struct pci_bus *bus,
+				struct pci_dev *fn3)
+{
+	struct pci_dev *fn4 =3D pci_get_slot(bus, PCI_DEVFN(0, 4));
+	int ret, freq =3D 0;
+	u8 type, fsb;
+
+	/* VIA Scratch region */
+	ret =3D pci_read_config_byte(fn4, 0xF3, &fsb);
+	if (ret) {
+		pci_dev_put(fn4);
+		return ret;
+	}
+
+	switch (fsb >> 5) {
+	case 0:
+		freq =3D 3; /* 100 MHz */
+		break;
+	case 1:
+		freq =3D 4; /* 133 MHz */
+		break;
+	case 3:
+		freq =3D 5; /* 166 MHz */
+		break;
+	case 2:
+		freq =3D 6; /* 200 MHz */
+		break;
+	case 4:
+		freq =3D 7; /* 233 MHz */
+		break;
+	default:
+		break;
+	}
+	pci_dev_put(fn4);
+
+	ret =3D pci_read_config_byte(fn3, 0x68, &type);
+	if (ret)
+		return ret;
+	type &=3D 0x0f;
+
+	if (type & 0x02)
+		freq -=3D type >> 2;
+	else {
+		freq +=3D type >> 2;
+		if (type & 0x01)
+			freq++;
+	}
+
+	switch (freq) {
+	case 0x03:
+		dev_priv->vram_type =3D VIA_MEM_DDR_200;
+		break;
+	case 0x04:
+		dev_priv->vram_type =3D VIA_MEM_DDR_266;
+		break;
+	case 0x05:
+		dev_priv->vram_type =3D VIA_MEM_DDR_333;
+		break;
+	case 0x06:
+		dev_priv->vram_type =3D VIA_MEM_DDR_400;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+static int km8xx_mem_type(struct via_drm_priv *dev_priv)
+{
+	struct pci_dev *dram, *misc =3D NULL;
+	int ret =3D -ENXIO;
+	u8 type, tmp;
+
+	dram =3D pci_get_device(PCI_VENDOR_ID_AMD,
+			PCI_DEVICE_ID_AMD_K8_NB_MEMCTL, NULL);
+	if (dram) {
+		misc =3D pci_get_device(PCI_VENDOR_ID_AMD,
+				PCI_DEVICE_ID_AMD_K8_NB_MISC, NULL);
+
+		ret =3D pci_read_config_byte(misc, 0xFD, &type);
+		if (type) {
+			pci_read_config_byte(dram, 0x94, &type);
+			switch (type & 0x03) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_400;
+				break;
+			case 0x01:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_533;
+				break;
+			case 0x02:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_667;
+				break;
+			case 0x03:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_800;
+				break;
+			default:
+				break;
+			}
+		} else {
+			ret =3D pci_read_config_byte(dram, 0x96, &type);
+			if (ret)
+				return ret;
+			type >>=3D 4;
+			type &=3D 0x07;
+
+			switch (type) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR_200;
+				break;
+			case 0x02:
+				dev_priv->vram_type =3D VIA_MEM_DDR_266;
+				break;
+			case 0x05:
+				dev_priv->vram_type =3D VIA_MEM_DDR_333;
+				break;
+			case 0x07:
+				dev_priv->vram_type =3D VIA_MEM_DDR_400;
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
+	/* AMD 10h DRAM Controller */
+	dram =3D pci_get_device(PCI_VENDOR_ID_AMD,
+			PCI_DEVICE_ID_AMD_10H_NB_DRAM, NULL);
+	if (dram) {
+		ret =3D pci_read_config_byte(misc, 0x94, &tmp);
+		if (ret)
+			return ret;
+		ret =3D pci_read_config_byte(misc, 0x95, &type);
+		if (ret)
+			return ret;
+
+		if (type & 0x01) {	/* DDR3 */
+			switch (tmp & 0x07) {
+			case 0x03:
+				dev_priv->vram_type =3D VIA_MEM_DDR3_800;
+				break;
+			case 0x04:
+				dev_priv->vram_type =3D VIA_MEM_DDR3_1066;
+				break;
+			case 0x05:
+				dev_priv->vram_type =3D VIA_MEM_DDR3_1333;
+				break;
+			case 0x06:
+				dev_priv->vram_type =3D VIA_MEM_DDR3_1600;
+				break;
+			default:
+				break;
+			}
+		} else {		/* DDR2 */
+			switch (tmp & 0x07) {
+			case 0x00:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_400;
+				break;
+			case 0x01:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_533;
+				break;
+			case 0x02:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_667;
+				break;
+			case 0x03:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_800;
+				break;
+			case 0x04:
+				dev_priv->vram_type =3D VIA_MEM_DDR2_1066;
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
+	/* AMD 11h DRAM Controller */
+	dram =3D pci_get_device(PCI_VENDOR_ID_AMD,
+				PCI_DEVICE_ID_AMD_11H_NB_DRAM, NULL);
+	if (dram) {
+		ret =3D pci_read_config_byte(misc, 0x94, &type);
+		if (ret)
+			return ret;
+
+		switch (tmp & 0x07) {
+		case 0x01:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_533;
+			break;
+		case 0x02:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_667;
+			break;
+		case 0x03:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_800;
+			break;
+		default:
+			break;
+		}
+	}
+	return ret;
+}
+
+static int cn400_mem_type(struct via_drm_priv *dev_priv,
+				struct pci_bus *bus,
+				struct pci_dev *fn3)
+{
+	struct pci_dev *fn2 =3D pci_get_slot(bus, PCI_DEVFN(0, 2));
+	int ret, freq =3D 0;
+	u8 type, fsb;
+
+	ret =3D pci_read_config_byte(fn2, 0x54, &fsb);
+	if (ret) {
+		pci_dev_put(fn2);
+		return ret;
+	}
+
+	switch (fsb >> 5) {
+	case 0:
+		freq =3D 3; /* 100 MHz */
+		break;
+	case 1:
+		freq =3D 4; /* 133 MHz */
+		break;
+	case 3:
+		freq =3D 5; /* 166 MHz */
+		break;
+	case 2:
+		freq =3D 6; /* 200 MHz */
+		break;
+	case 4:
+		freq =3D 7; /* 233 MHz */
+		break;
+	default:
+		break;
+	}
+	pci_dev_put(fn2);
+
+	ret =3D pci_read_config_byte(fn3, 0x68, &type);
+	if (ret)
+		return ret;
+	type &=3D 0x0f;
+
+	if (type & 0x01)
+		freq +=3D 1 + (type >> 2);
+	else
+		freq -=3D 1 + (type >> 2);
+
+	switch (freq) {
+	case 0x03:
+		dev_priv->vram_type =3D VIA_MEM_DDR_200;
+		break;
+	case 0x04:
+		dev_priv->vram_type =3D VIA_MEM_DDR_266;
+		break;
+	case 0x05:
+		dev_priv->vram_type =3D VIA_MEM_DDR_333;
+		break;
+	case 0x06:
+		dev_priv->vram_type =3D VIA_MEM_DDR_400;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+static int cn700_mem_type(struct via_drm_priv *dev_priv,
+				struct pci_dev *fn3)
+{
+	int ret;
+	u8 tmp;
+
+	ret =3D pci_read_config_byte(fn3, 0x90, &tmp);
+	if (!ret) {
+		switch (tmp & 0x07) {
+		case 0x00:
+			dev_priv->vram_type =3D VIA_MEM_DDR_200;
+			break;
+		case 0x01:
+			dev_priv->vram_type =3D VIA_MEM_DDR_266;
+			break;
+		case 0x02:
+			dev_priv->vram_type =3D VIA_MEM_DDR_333;
+			break;
+		case 0x03:
+			dev_priv->vram_type =3D VIA_MEM_DDR_400;
+			break;
+		case 0x04:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_400;
+			break;
+		case 0x05:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_533;
+			break;
+		default:
+			break;
+		}
+	}
+	return ret;
+}
+
+static int cx700_mem_type(struct via_drm_priv *dev_priv,
+				struct pci_dev *fn3)
+{
+	u8 type, clock;
+	int ret;
+
+	ret =3D pci_read_config_byte(fn3, 0x90, &clock);
+	if (ret)
+		return ret;
+	ret =3D pci_read_config_byte(fn3, 0x6C, &type);
+	if (ret)
+		return ret;
+	type &=3D 0x40;
+	type >>=3D 6;
+
+	switch (type) {
+	case 0:
+		switch (clock & 0x07) {
+		case 0:
+			dev_priv->vram_type =3D VIA_MEM_DDR_200;
+			break;
+		case 1:
+			dev_priv->vram_type =3D VIA_MEM_DDR_266;
+			break;
+		case 2:
+			dev_priv->vram_type =3D VIA_MEM_DDR_333;
+			break;
+		case 3:
+			dev_priv->vram_type =3D VIA_MEM_DDR_400;
+			break;
+		default:
+			break;
+		}
+		break;
+
+	case 1:
+		switch (clock & 0x07) {
+		case 3:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_400;
+			break;
+		case 4:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_533;
+			break;
+		case 5:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_667;
+			break;
+		case 6:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_800;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+static int vx900_mem_type(struct via_drm_priv *dev_priv,
+				struct pci_dev *fn3)
+{
+	int ret;
+	u8 clock, type, volt;
+
+	ret =3D pci_read_config_byte(fn3, 0x90, &clock);
+	if (ret)
+		return ret;
+	ret =3D pci_read_config_byte(fn3, 0x6C, &type);
+	if (ret)
+		return ret;
+	volt =3D type;
+	type &=3D 0xC0;
+	type >>=3D 6;
+	volt &=3D 0x20;
+	volt >>=3D 5;
+
+	switch (type) {
+	case 1:
+		switch (clock & 0x0F) {
+		case 0:
+			if (volt)
+				dev_priv->vram_type =3D VIA_MEM_DDR2_800;
+			else
+				dev_priv->vram_type =3D VIA_MEM_DDR2_533;
+			break;
+		case 4:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_533;
+			break;
+		case 5:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_667;
+			break;
+		case 6:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_800;
+			break;
+		case 7:
+			dev_priv->vram_type =3D VIA_MEM_DDR2_1066;
+			break;
+		default:
+			break;
+		}
+		break;
+	case 2:
+		switch (clock & 0x0F) {
+		case 0:
+			if (volt)
+				dev_priv->vram_type =3D VIA_MEM_DDR3_800;
+			else
+				dev_priv->vram_type =3D VIA_MEM_DDR3_533;
+			break;
+		case 4:
+			dev_priv->vram_type =3D VIA_MEM_DDR3_533;
+			break;
+		case 5:
+			dev_priv->vram_type =3D VIA_MEM_DDR3_667;
+			break;
+		case 6:
+			dev_priv->vram_type =3D VIA_MEM_DDR3_800;
+			break;
+		case 7:
+			dev_priv->vram_type =3D VIA_MEM_DDR3_1066;
+			break;
+		default:
+			break;
+		}
+		break;
+	}
+	return ret;
+}
+
+int via_vram_detect(struct via_drm_priv *dev_priv)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct pci_dev *bridge =3D NULL;
+	struct pci_dev *fn3 =3D NULL;
+	char *name =3D "unknown";
+	struct pci_bus *bus;
+	u8 size;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	bus =3D pci_find_bus(0, 0);
+	if (bus =3D=3D NULL) {
+		ret =3D -EINVAL;
+		goto out_err;
+	}
+
+	bridge =3D pci_get_slot(bus, PCI_DEVFN(0, 0));
+	fn3 =3D pci_get_slot(bus, PCI_DEVFN(0, 3));
+
+	if (!bridge) {
+		ret =3D -EINVAL;
+		DRM_ERROR("No host bridge found...\n");
+		goto out_err;
+	}
+
+	if (!fn3 && pdev->device !=3D PCI_DEVICE_ID_VIA_CLE266
+		&& pdev->device !=3D PCI_DEVICE_ID_VIA_KM400) {
+		ret =3D -EINVAL;
+		DRM_ERROR("No function 3 on host bridge...\n");
+		goto out_err;
+	}
+
+	if (pdev->device =3D=3D PCI_DEVICE_ID_VIA_VX900_VGA) {
+		dev_priv->vram_start =3D pci_resource_start(pdev, 2);
+	} else {
+		dev_priv->vram_start =3D pci_resource_start(pdev, 0);
+	}
+
+	switch (bridge->device) {
+
+	/* CLE266 */
+	case PCI_DEVICE_ID_VIA_862X_0:
+		ret =3D cle266_mem_type(dev_priv, bridge);
+		if (ret)
+			goto out_err;
+
+		ret =3D pci_read_config_byte(bridge, 0xE1, &size);
+		if (ret)
+			goto out_err;
+		dev_priv->vram_size =3D (1 << ((size & 0x70) >> 4)) << 20;
+		break;
+
+	/* KM400 / KN400 / KM400A / KN400A */
+	case PCI_DEVICE_ID_VIA_8378_0:
+		ret =3D km400_mem_type(dev_priv, bridge);
+
+		ret =3D pci_read_config_byte(bridge, 0xE1, &size);
+		if (ret)
+			goto out_err;
+		dev_priv->vram_size =3D (1 << ((size & 0x70) >> 4)) << 20;
+		break;
+
+	/* P4M800 */
+	case PCI_DEVICE_ID_VIA_3296_0:
+		ret =3D p4m800_mem_type(dev_priv, bus, fn3);
+
+		ret =3D pci_read_config_byte(fn3, 0xA1, &size);
+		if (ret)
+			goto out_err;
+		dev_priv->vram_size =3D (1 << ((size & 0x70) >> 4)) << 20;
+		break;
+
+	/* K8M800 / K8N800 */
+	case PCI_DEVICE_ID_VIA_8380_0:
+	/* K8M890 */
+	case PCI_DEVICE_ID_VIA_VT3336:
+		ret =3D pci_read_config_byte(fn3, 0xA1, &size);
+		if (ret)
+			goto out_err;
+		dev_priv->vram_size =3D (1 << ((size & 0x70) >> 4)) << 20;
+
+		if (bridge->device =3D=3D PCI_DEVICE_ID_VIA_VT3336)
+			dev_priv->vram_size <<=3D 2;
+
+		ret =3D km8xx_mem_type(dev_priv);
+		if (ret)
+			goto out_err;
+		break;
+
+	/* CN400 / PM800 / PM880 */
+	case PCI_DEVICE_ID_VIA_PX8X0_0:
+		ret =3D pci_read_config_byte(fn3, 0xA1, &size);
+		if (ret)
+			goto out_err;
+		dev_priv->vram_size =3D (1 << ((size & 0x70) >> 4)) << 20;
+
+		ret =3D cn400_mem_type(dev_priv, bus, fn3);
+		if (ret)
+			goto out_err;
+		break;
+
+	/* P4M800CE / P4M800 Pro / VN800 / CN700 */
+	case PCI_DEVICE_ID_VIA_P4M800CE:
+	/* P4M900 / VN896 / CN896 */
+	case PCI_DEVICE_ID_VIA_VT3364:
+		ret =3D pci_read_config_byte(fn3, 0xA1, &size);
+		if (ret)
+			goto out_err;
+		dev_priv->vram_size =3D (1 << ((size & 0x70) >> 4)) << 20;
+
+		if (bridge->device !=3D PCI_DEVICE_ID_VIA_P4M800CE)
+			dev_priv->vram_size <<=3D 2;
+
+		ret =3D cn700_mem_type(dev_priv, fn3);
+		if (ret)
+			goto out_err;
+		break;
+
+	/* CX700 / VX700 */
+	case PCI_DEVICE_ID_VIA_VT3324:
+	/* P4M890 / VN890 */
+	case PCI_DEVICE_ID_VIA_P4M890:
+	/* VX800 / VX820 */
+	case PCI_DEVICE_ID_VIA_VT3353:
+	/* VX855 / VX875 */
+	case PCI_DEVICE_ID_VIA_VT3409:
+		ret =3D pci_read_config_byte(fn3, 0xA1, &size);
+		if (ret)
+			goto out_err;
+		dev_priv->vram_size =3D (1 << ((size & 0x70) >> 4)) << 22;
+
+		ret =3D cx700_mem_type(dev_priv, fn3);
+		if (ret)
+			goto out_err;
+		break;
+
+	/* VX900 */
+	case PCI_DEVICE_ID_VIA_VT3410:
+		ret =3D pci_read_config_byte(fn3, 0xA1, &size);
+		if (ret)
+			goto out_err;
+		dev_priv->vram_size =3D (1 << ((size & 0x70) >> 4)) << 22;
+
+		ret =3D vx900_mem_type(dev_priv, fn3);
+		if (ret)
+			goto out_err;
+		break;
+
+	default:
+		DRM_ERROR("Unknown north bridge device: 0x%04x\n",
+				bridge->device);
+		goto out_err;
+	}
+
+	switch (dev_priv->vram_type) {
+	case VIA_MEM_SDR66:
+		name =3D "SDR 66";
+		break;
+	case VIA_MEM_SDR100:
+		name =3D "SDR 100";
+		break;
+	case VIA_MEM_SDR133:
+		name =3D "SDR 133";
+		break;
+	case VIA_MEM_DDR_200:
+		name =3D "DDR 200";
+		break;
+	case VIA_MEM_DDR_266:
+		name =3D "DDR 266";
+		break;
+	case VIA_MEM_DDR_333:
+		name =3D "DDR 333";
+		break;
+	case VIA_MEM_DDR_400:
+		name =3D "DDR 400";
+		break;
+	case VIA_MEM_DDR2_400:
+		name =3D "DDR2 400";
+		break;
+	case VIA_MEM_DDR2_533:
+		name =3D "DDR2 533";
+		break;
+	case VIA_MEM_DDR2_667:
+		name =3D "DDR2 667";
+		break;
+	case VIA_MEM_DDR2_800:
+		name =3D "DDR2 800";
+		break;
+	case VIA_MEM_DDR2_1066:
+		name =3D "DDR2 1066";
+		break;
+	case VIA_MEM_DDR3_533:
+		name =3D "DDR3 533";
+		break;
+	case VIA_MEM_DDR3_667:
+		name =3D "DDR3 667";
+		break;
+	case VIA_MEM_DDR3_800:
+		name =3D "DDR3 800";
+		break;
+	case VIA_MEM_DDR3_1066:
+		name =3D "DDR3 1066";
+		break;
+	case VIA_MEM_DDR3_1333:
+		name =3D "DDR3 1333";
+		break;
+	case VIA_MEM_DDR3_1600:
+		name =3D "DDR3 1600";
+		break;
+	default:
+		break;
+	}
+
+	DRM_INFO("Found %s video RAM.\n", name);
+out_err:
+	if (bridge)
+		pci_dev_put(bridge);
+	if (fn3)
+		pci_dev_put(fn3);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_flag_init(struct via_drm_priv *dev_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Set this flag for ttm_bo_device_init. */
+	dev_priv->need_dma32 =3D true;
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_quirks_init(struct via_drm_priv *dev_priv)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/*
+	 * Checking for VIA Technologies NanoBook reference design.
+	 * Examples include Everex CloudBook and Sylvania g netbook.
+	 * It is also called FIC CE260 or CE261 by its ODM (Original
+	 * Design Manufacturer) name.
+	 * This device has its strapping resistors set to a wrong
+	 * setting to handle DVI. As a result, the code needs to know
+	 * this in order to support DVI properly.
+	 */
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_VT3157) &&
+		(pdev->subsystem_vendor =3D=3D 0x1509) &&
+		(pdev->subsystem_device =3D=3D 0x2d30)) {
+		dev_priv->is_via_nanobook =3D true;
+	} else {
+		dev_priv->is_via_nanobook =3D false;
+	}
+
+	/*
+	 * Check for Quanta IL1 netbook. This is necessary
+	 * due to its flat panel connected to DVP1 (Digital
+	 * Video Port 1) rather than its LVDS channel.
+	 */
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_VT1122) &&
+		(pdev->subsystem_vendor =3D=3D 0x152d) &&
+		(pdev->subsystem_device =3D=3D 0x0771)) {
+		dev_priv->is_quanta_il1 =3D true;
+	} else {
+		dev_priv->is_quanta_il1 =3D false;
+	}
+
+	/*
+	 * Samsung NC20 netbook has its FP connected to LVDS2
+	 * rather than the more logical LVDS1, hence, a special
+	 * flag register is needed for properly controlling its
+	 * FP.
+	 */
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_VT1122) &&
+		(pdev->subsystem_vendor =3D=3D 0x144d) &&
+		(pdev->subsystem_device =3D=3D 0xc04e)) {
+		dev_priv->is_samsung_nc20 =3D true;
+	} else {
+		dev_priv->is_samsung_nc20 =3D false;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_vram_init(struct via_drm_priv *dev_priv)
+{
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Add an MTRR for the video RAM. */
+	dev_priv->vram_mtrr =3D arch_phys_wc_add(dev_priv->vram_start,
+						dev_priv->vram_size);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_vram_fini(struct via_drm_priv *dev_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (dev_priv->vram_mtrr) {
+		arch_phys_wc_del(dev_priv->vram_mtrr);
+		arch_io_free_memtype_wc(dev_priv->vram_start,
+					dev_priv->vram_size);
+		dev_priv->vram_mtrr =3D 0;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_mmio_init(struct via_drm_priv *dev_priv)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/*
+	 * PCI BAR1 is the MMIO memory window for all
+	 * VIA Technologies Chrome IGPs.
+	 * Obtain the starting base address and size, and
+	 * map it to the OS for use.
+	 */
+	dev_priv->mmio_base =3D pci_resource_start(pdev, 1);
+	dev_priv->mmio_size =3D pci_resource_len(pdev, 1);
+	dev_priv->mmio =3D ioremap(dev_priv->mmio_base,
+					dev_priv->mmio_size);
+	if (!dev_priv->mmio) {
+		ret =3D -ENOMEM;
+		goto exit;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_mmio_fini(struct via_drm_priv *dev_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (dev_priv->mmio) {
+		iounmap(dev_priv->mmio);
+		dev_priv->mmio =3D NULL;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_graphics_unlock(struct via_drm_priv *dev_priv)
+{
+	uint8_t temp;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/*
+	 * Enable VGA subsystem.
+	 */
+	temp =3D vga_io_r(0x03C3);
+	vga_io_w(0x03C3, temp | 0x01);
+	svga_wmisc_mask(VGABASE, BIT(0), BIT(0));
+
+	/*
+	 * Unlock VIA Technologies Chrome IGP extended
+	 * registers.
+	 */
+	svga_wseq_mask(VGABASE, 0x10, BIT(0), BIT(0));
+
+	/*
+	 * Unlock VIA Technologies Chrome IGP extended
+	 * graphics functionality.
+	 */
+	svga_wseq_mask(VGABASE, 0x1a, BIT(3), BIT(3));
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void chip_revision_info(struct via_drm_priv *dev_priv)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	u8 tmp;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (pdev->device) {
+	/* CLE266 Chipset */
+	case PCI_DEVICE_ID_VIA_CLE266:
+		/* CR4F only defined in CLE266.CX chipset. */
+		tmp =3D vga_rcrt(VGABASE, 0x4F);
+		vga_wcrt(VGABASE, 0x4F, 0x55);
+		if (vga_rcrt(VGABASE, 0x4F) !=3D 0x55) {
+			dev_priv->revision =3D CLE266_REVISION_AX;
+		} else {
+			dev_priv->revision =3D CLE266_REVISION_CX;
+		}
+
+		/* Restore original CR4F value. */
+		vga_wcrt(VGABASE, 0x4F, tmp);
+		break;
+	/* CX700 / VX700 Chipset */
+	case PCI_DEVICE_ID_VIA_VT3157:
+		tmp =3D vga_rseq(VGABASE, 0x43);
+		if (tmp & 0x02) {
+			dev_priv->revision =3D CX700_REVISION_700M2;
+		} else if (tmp & 0x40) {
+			dev_priv->revision =3D CX700_REVISION_700M;
+		} else {
+			dev_priv->revision =3D CX700_REVISION_700;
+		}
+
+		break;
+	/* VX800 / VX820 Chipset */
+	case PCI_DEVICE_ID_VIA_VT1122:
+		break;
+	/* VX855 / VX875 Chipset */
+	case PCI_DEVICE_ID_VIA_VX875:
+	/* VX900 Chipset */
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
+		dev_priv->revision =3D vga_rseq(VGABASE, 0x3B);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_device_init(struct via_drm_priv *dev_priv)
+{
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_flag_init(dev_priv);
+	via_quirks_init(dev_priv);
+
+	ret =3D via_vram_detect(dev_priv);
+	if (ret) {
+		DRM_ERROR("Failed to detect video RAM.\n");
+		goto exit;
+	}
+
+	/*
+	 * Map VRAM.
+	 */
+	ret =3D via_vram_init(dev_priv);
+	if (ret) {
+		DRM_ERROR("Failed to initialize video RAM.\n");
+		goto exit;
+	}
+
+	ret =3D via_mmio_init(dev_priv);
+	if (ret) {
+		DRM_ERROR("Failed to initialize MMIO.\n");
+		goto exit;
+	}
+
+	via_graphics_unlock(dev_priv);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_device_fini(struct via_drm_priv *dev_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_mmio_fini(dev_priv);
+	via_vram_fini(dev_priv);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct drm_mode_config_funcs via_drm_mode_config_funcs =3D {
+	.fb_create		=3D drm_gem_fb_create,
+	.atomic_check		=3D drm_atomic_helper_check,
+	.atomic_commit		=3D drm_atomic_helper_commit,
+};
+
+void via_mode_config_init(struct via_drm_priv *dev_priv)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	drm_mode_config_init(dev);
+
+	dev->mode_config.min_width =3D 0;
+	dev->mode_config.min_height =3D 0;
+	dev->mode_config.max_width =3D 2044;
+	dev->mode_config.max_height =3D 4096;
+
+	dev->mode_config.funcs =3D &via_drm_mode_config_funcs;
+
+	dev->mode_config.fb_base =3D dev_priv->vram_start;
+
+	dev->mode_config.preferred_depth =3D 24;
+	dev->mode_config.prefer_shadow_fbdev =3D true;
+
+	dev->mode_config.cursor_width =3D
+	dev->mode_config.cursor_height =3D VIA_CURSOR_SIZE;
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_drm_init(struct drm_device *dev)
+{
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	dev_priv->vram_mtrr =3D -ENXIO;
+
+	ret =3D via_device_init(dev_priv);
+	if (ret) {
+		DRM_ERROR("Failed to initialize Chrome IGP.\n");
+		goto exit;
+	}
+
+	ret =3D via_mm_init(dev_priv);
+	if (ret) {
+		DRM_ERROR("Failed to initialize TTM.\n");
+		goto exit;
+	}
+
+	chip_revision_info(dev_priv);
+
+	ret =3D via_modeset_init(dev);
+	if (ret) {
+		DRM_ERROR("Failed to initialize mode setting.\n");
+		goto error_modeset;
+	}
+
+	goto exit;
+error_modeset:
+	via_modeset_fini(dev);
+	via_mm_fini(dev_priv);
+	via_mmio_fini(dev_priv);
+	via_vram_fini(dev_priv);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_drm_fini(struct drm_device *dev)
+{
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_modeset_fini(dev);
+	via_mm_fini(dev_priv);
+	via_mmio_fini(dev_priv);
+	via_vram_fini(dev_priv);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
=2D-
2.35.1

