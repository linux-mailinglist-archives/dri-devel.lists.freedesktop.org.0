Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4B580884
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D456510F6F6;
	Mon, 25 Jul 2022 23:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B9910F6F6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793280;
 bh=B3NibfqrBTPY8v2f3GyR6l9xSQeC3b3ZNSGlF6SzQRU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jDdCUlTG45xbwhuRN6ke0nzqMibZQfPqe7Xu5Zz1sJaaXejwEIfXT57NO8kLxw1s4
 NH/LLmM9PR1cL56YnnFInUlRox41tbxl/STnlXDRNit5csvJEa+qFog3IdzY1Ccmil
 TRvunUtFQND2eWpmXDRniFQsfT3LxI/WuISRePvU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MD9T7-1oOcDW1fdJ-0099aa; Tue, 26 Jul 2022 01:54:40 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 20/32] drm/via: Add via_pll.c
Date: Mon, 25 Jul 2022 16:53:47 -0700
Message-Id: <20220725235359.20516-1-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JR3PhX9AcV+o+Ln6BP2EZOSDupDrRNY3KGLOiAdx7Z06Us0fEvq
 bE1wnRc4B05Pp0UhZJnPeX1UOHY63yhiitWvHLhRHZ2ttezISqbDKKd5jwHP0H2DjQD50K9
 7N6J6ZFlAYDbPf0g9Q7zaZ8I2lsV9tPPvzejSlr52kSqYunA5rTP5Iu81VjR9KcVhvFnnyH
 +o3qbVkYj7r56BRMzenCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U4wBgXPxp6w=:eI0q5zGayNhZ/nNTAJ9e3p
 ePNAVVYlzo7IALlmEOh2Iv4teaA720c7slNMExd/5b69LQqpY0cyyI/toT8Z9rT6aFIAU5X6G
 G7F3DytmnApTOpfa0MVq90uTJg3jbD3ga9AaXzXOIDpwIn3cram57oemLDJZ6UqoXkDkuv3cm
 Zx9wAMFbsWYFI1G2B1ECmLHiKUR7GcBjbvM1eguNSJaurWRzrL0SiiR7P/sNIbZxhmVzCQSyC
 YupBklcAsc6WntEONta21vmiu+VzyPMwiMDMLZ+WrQY2s9dnF7VfnxbUYYyurE/LPmVJn5YEo
 pAckApTli2mwb6pecawWlcGD8ecS9iilcgQA+ZxMGCj8wv/G23GAMp+YUwBcG13bZpVpylnr1
 d/JoH0PIpXMJmaKjTk/xQmUMU02Vr889L/7FTGKr39BCFvadtbrIQ45bULscA3fei+RiNry0x
 WUE+3CFLhXRIMrXxiu5dIxZvUHtLuOtT2O/nc6Wr5Zf30OeRgC0OX31Zr9CPruZehcImIgPUh
 SpzbUfXbX4PhOTWJFs7jP2L4eDkqcIvX7BFFejvAcZu4Ddk12Cg0GVTtfjXo/ku7IpkvoUuPE
 1ajM5XPh4n40UccrvUPStqOmGDHBPd1z2fB/+czMJj1KNCvoyB+gFdGCINmUo/0bApaRDCmrv
 dp5ZEowo1cO6StcxXv4QfMZQeDfiYR2prSF6hRQCczkObsFcbkNC7whHij8PWOOX485znj9aO
 rsKKTEd4gj263niLagZSMsC0fpaLQxyqjjCtXszGEa70DBIdGdtk8rtg+h6foqcflc990iuNd
 2n0djhA2/Nk2kCKvH2revLN0u4k9b2W3VdgYSsXCVNbPBJN7lA+UyUrCsjUt/Yq9Rd3XYcip+
 ijoXTQ4m1auGLVEDspIACdJibley3S+7e1YDn7GqJ0vzL9ndL3zW8J8tnwnbQ7yz543dUNE/T
 Wvgu1+b4h+7tuMZuuIIkineOyg0kaLf+XCw86Srl3ARPtWDax3YXXHX+IVqk8ZqJuhz3sMOyc
 skzlkkYMSrMiBIERUapJsMSs/PTQu6hE5s4VxwD2JHvhDqitQwjt7Xna6c0WpTk0CDrg9mwRA
 95qpkQb435M7fQwTJO48cm7DJy+TSnx6f+mL2wUisQVe1oz10fxi471gw==
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

Note that the code here is GPL based.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_pll.c | 255 ++++++++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_pll.c

diff --git a/drivers/gpu/drm/via/via_pll.c b/drivers/gpu/drm/via/via_pll.c
new file mode 100644
index 000000000000..4ebaa5ce1b70
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_pll.c
@@ -0,0 +1,255 @@
+/*
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ * Copyright 1998-2009 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2009 S3 Graphics, Inc. All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public
+ * License as published by the Free Software Foundation;
+ * either version 2, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTIES OR REPRESENTATIONS; without even
+ * the implied warranty of MERCHANTABILITY or FITNESS FOR
+ * A PARTICULAR PURPOSE.See the GNU General Public License
+ * for more details.
+ *
+ * Author(s):
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+
+#include "via_drv.h"
+
+
+#define CSR_VCO_UP	600000000
+#define CSR_VCO_DOWN	300000000
+
+#define PLL_DTZ_DEFAULT		(BIT(0) | BIT(1))
+
+#define VIA_CLK_REFERENCE	14318180
+
+struct pll_mrn_value {
+	u32 pll_m;
+	u32 pll_r;
+	u32 pll_n;
+	u32 diff_clk;
+	u32 pll_fout;
+};
+
+/*
+ * This function first gets the best frequency M, R, N value
+ * to program the PLL according to the supplied frequence
+ * passed in. After we get the MRN values the results are
+ * formatted to fit properly into the PLL clock registers.
+ *
+ * PLL registers M, R, N value
+ * [31:16]  DM[7:0]
+ * [15:8 ]  DR[2:0]
+ * [7 :0 ]  DN[6:0]
+ */
+u32 via_get_clk_value(struct drm_device *dev, u32 freq)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	u32 best_pll_n =3D 2, best_pll_r =3D 0, best_pll_m =3D 2, best_clk_diff =
=3D freq;
+	u32 pll_fout, pll_fvco, pll_mrn =3D 0;
+	u32 pll_n, pll_r, pll_m, clk_diff;
+	struct pll_mrn_value pll_tmp[5] =3D {
+		{ 0, 0, 0, 0, 0 },
+		{ 0, 0, 0, 0, 0 },
+		{ 0, 0, 0, 0, 0 },
+		{ 0, 0, 0, 0, 0 },
+		{ 0, 0, 0, 0, 0 } };
+	int count;
+
+	if ((pdev->device !=3D PCI_DEVICE_ID_VIA_CLE266_GFX) &&
+		(pdev->device !=3D PCI_DEVICE_ID_VIA_KM400_GFX)) {
+		/* DN[6:0] */
+		for (pll_n =3D 2; pll_n < 6; pll_n++) {
+			/* DR[2:0] */
+			for (pll_r =3D 0; pll_r < 6; pll_r++) {
+				/* DM[9:0] */
+				for (pll_m =3D 2; pll_m < 512; pll_m++) {
+					/* first divide pll_n then multiply
+					 * pll_m. We have to reduce pll_m
+					 * to 512 to get rid of the overflow */
+					pll_fvco =3D (VIA_CLK_REFERENCE / pll_n) * pll_m;
+					if ((pll_fvco >=3D CSR_VCO_DOWN) && (pll_fvco <=3D CSR_VCO_UP)) {
+						pll_fout =3D pll_fvco >> pll_r;
+						if (pll_fout < freq)
+							clk_diff =3D freq - pll_fout;
+						else
+							clk_diff =3D pll_fout - freq;
+
+						/* if frequency (which is the PLL we want
+						 * to set) > 150MHz, the MRN value we
+						 * write in register must < frequency, and
+						 * get MRN value whose M is the largeset */
+						if (freq >=3D 150000000) {
+							if ((clk_diff <=3D pll_tmp[0].diff_clk) || pll_tmp[0].pll_fout =3D=
=3D 0) {
+								for (count =3D ARRAY_SIZE(pll_tmp) - 1; count >=3D 1; count--)
+									pll_tmp[count] =3D pll_tmp[count - 1];
+
+								pll_tmp[0].pll_m =3D pll_m;
+								pll_tmp[0].pll_r =3D pll_r;
+								pll_tmp[0].pll_n =3D pll_n;
+								pll_tmp[0].diff_clk =3D clk_diff;
+								pll_tmp[0].pll_fout =3D pll_fout;
+							}
+						}
+
+						if (clk_diff < best_clk_diff) {
+							best_clk_diff =3D clk_diff;
+							best_pll_m =3D pll_m;
+							best_pll_n =3D pll_n;
+							best_pll_r =3D pll_r;
+						}
+					} /* if pll_fvco in VCO range */
+				} /* for PLL M */
+			} /* for PLL R */
+		} /* for PLL N */
+
+		/* if frequency(which is the PLL we want to set) > 150MHz,
+		 * the MRN value we write in register must < frequency,
+		 * and get MRN value whose M is the largeset */
+		if (freq > 150000000) {
+			best_pll_m =3D pll_tmp[0].pll_m;
+			best_pll_r =3D pll_tmp[0].pll_r;
+			best_pll_n =3D pll_tmp[0].pll_n;
+		}
+	/* UniChrome IGP (CLE266, KM400(A), KN400, and P4M800 chipsets)
+	 * requires a different formula for calculating the PLL parameters.
+	 * The code was borrowed from OpenChrome DDX device driver UMS
+	 * (User Mode Setting) section, but was modified to not use float type
+	 * variables. */
+	} else {
+		for (pll_r =3D 0; pll_r < 4; ++pll_r) {
+			for (pll_n =3D (pll_r =3D=3D 0) ? 2 : 1; pll_n <=3D 7; ++pll_n) {
+				for (pll_m =3D 1; pll_m <=3D 127; ++pll_m) {
+					pll_fout =3D VIA_CLK_REFERENCE * pll_m;
+					pll_fout /=3D (pll_n << pll_r);
+					if (pll_fout < freq)
+						clk_diff =3D freq - pll_fout;
+					else
+						clk_diff =3D pll_fout - freq;
+
+					if (clk_diff < best_clk_diff) {
+						best_clk_diff =3D clk_diff;
+						best_pll_m =3D pll_m & 0x7F;
+						best_pll_n =3D pll_n & 0x1F;
+						best_pll_r =3D pll_r & 0x03;
+					}
+				}
+			}
+		}
+	}
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_CLE266_GFX:
+	case PCI_DEVICE_ID_VIA_KM400_GFX:
+		/* Clock Synthesizer Value 0[7:6]: DR[1:0]
+		 * Clock Synthesizer Value 0[5:0]: DN[5:0] */
+		pll_mrn =3D ((best_pll_r & 0x3) << 14 |
+				(best_pll_n & 0x1F) << 8);
+		/* Clock Synthesizer Value 1[6:0]: DM[6:0] */
+		pll_mrn |=3D (best_pll_m & 0x7F);
+		break;
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		/* Clock Synthesizer Value 0 : DM[7:0] */
+		pll_mrn =3D (best_pll_m & 0xFF) << 16;
+		/* Clock Synthesizer Value 1[1:0] : DM[9:8]
+		 * Clock Synthesizer Value 1[4:2] : DR[2:0]
+		 * Clock Synthesizer Value 1[7] : DTZ[0] */
+		pll_mrn |=3D (((PLL_DTZ_DEFAULT & 0x1) << 7) |
+				((best_pll_r & 0x7) << 2) |
+				(((best_pll_m) >> 8) & 0x3)) << 8;
+		/* Clock Synthesizer Value 2[6:0] : DN[6:0]
+		 * Clock Synthesizer Value 2[7] : DTZ[1] */
+		pll_mrn |=3D (((PLL_DTZ_DEFAULT >> 1) & 0x1) << 7) |
+				((best_pll_n) & 0x7F);
+		break;
+	default:
+		/* Clock Synthesizer Value 0 : DM[7:0] */
+		pll_mrn =3D ((best_pll_m - 2) & 0xFF) << 16;
+		/* Clock Synthesizer Value 1[1:0] : DM[9:8]
+		 * Clock Synthesizer Value 1[4:2] : DR[2:0]
+		 * Clock Synthesizer Value 1[7] : DTZ[0] */
+		pll_mrn |=3D (((PLL_DTZ_DEFAULT & 0x1) << 7) |
+				((best_pll_r & 0x7) << 2) |
+				(((best_pll_m - 2) >> 8) & 0x3)) << 8;
+		/* Clock Synthesizer Value 2[6:0] : DN[6:0]
+		 * Clock Synthesizer Value 2[7] : DTZ[1] */
+		pll_mrn |=3D (((PLL_DTZ_DEFAULT >> 1) & 0x1) << 7) |
+				((best_pll_n - 2) & 0x7F);
+		break;
+	}
+	return pll_mrn;
+}
+
+/* Set VCLK */
+void via_set_vclock(struct drm_crtc *crtc, u32 clk)
+{
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	unsigned long max_loop =3D 50, i =3D 0;
+
+	if (!iga->index) {
+		/* IGA1 HW Reset Enable */
+		svga_wcrt_mask(VGABASE, 0x17, 0x00, BIT(7));
+
+		/* set clk */
+		if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) ||
+			(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX)) {
+			vga_wseq(VGABASE, 0x46, (clk & 0xFF00) >> 8);	/* rshift + divisor */
+			vga_wseq(VGABASE, 0x47, (clk & 0x00FF));	/* multiplier */
+		} else {
+			vga_wseq(VGABASE, 0x44, (clk & 0xFF0000) >> 16);
+			vga_wseq(VGABASE, 0x45, (clk & 0x00FF00) >> 8);
+			vga_wseq(VGABASE, 0x46, (clk & 0x0000FF));
+		}
+		/* Fire */
+		svga_wmisc_mask(VGABASE, BIT(3) | BIT(2), BIT(3) | BIT(2));
+
+		/* reset pll */
+		svga_wseq_mask(VGABASE, 0x40, 0x02, 0x02);
+		svga_wseq_mask(VGABASE, 0x40, 0x00, 0x02);
+
+		/* exit hw reset */
+		while ((vga_rseq(VGABASE, 0x3C) & BIT(3)) =3D=3D 0 && i++ < max_loop)
+			udelay(20);
+
+		/* IGA1 HW Reset Disable */
+		svga_wcrt_mask(VGABASE, 0x17, BIT(7), BIT(7));
+	} else {
+		/* IGA2 HW Reset Enable */
+		svga_wcrt_mask(VGABASE, 0x6A, 0x00, BIT(6));
+
+		/* set clk */
+		if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) ||
+			(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX)) {
+			vga_wseq(VGABASE, 0x44, (clk & 0xFF00) >> 8);
+			vga_wseq(VGABASE, 0x45, (clk & 0x00FF));
+		} else {
+			vga_wseq(VGABASE, 0x4A, (clk & 0xFF0000) >> 16);
+			vga_wseq(VGABASE, 0x4B, (clk & 0x00FF00) >> 8);
+			vga_wseq(VGABASE, 0x4C, (clk & 0x0000FF));
+		}
+
+		/* reset pll */
+		svga_wseq_mask(VGABASE, 0x40, 0x04, 0x04);
+		svga_wseq_mask(VGABASE, 0x40, 0x00, 0x04);
+
+		/* exit hw reset */
+		while ((vga_rseq(VGABASE, 0x3C) & BIT(2)) =3D=3D 0 && i++ < max_loop)
+			udelay(20);
+
+		/* IGA2 HW Reset Disble, CR6A[6] =3D 1 */
+		svga_wcrt_mask(VGABASE, 0x6A, BIT(6), BIT(6));
+	}
+}
=2D-
2.35.1

