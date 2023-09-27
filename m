Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160607B00DB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 11:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6E410E4BD;
	Wed, 27 Sep 2023 09:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791B410E4BD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1695808110; x=1727344110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CCOE6BmWeaDqb6tP9tbSjg5nfAdmZAAsgLMSHmdR3j4=;
 b=Sc43Rr43uTO7bFaA11fG5NebSIQWH4I4SxnPPebSTFHmFJsMsU5rWObv
 dqDeE7Er2HtvVT63iy0Eo25H8U+sUgutZO3zkC8jGIwDFMQzjVh4Smqb0
 SvKSn9+vSDFIrjtATfRVLUC1cBS7X5t+KjDstss/bkk2flNyhnMZyePGZ
 1x8H99ZqZowmM4oC6DEbDPYi8FN/Mf2rCjCE9JbYrDg/FL59BAl4PUQrZ
 obyja427qmVUwdEM4mAQWOnylJBblZcvpuikBFeXRe/AzTfwnTrMBLsIf
 PL0ltT/skzUCgnNWaBWqdavVte+crp2yaE7gZZaB0GVbs97aT/+3PxDCr g==;
X-CSE-ConnectionGUID: TE5iqcZHQgCdOWID/zIucA==
X-CSE-MsgGUID: PgUq48gHS/6SazOsIWZTPA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="237426883"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 02:48:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 27 Sep 2023 02:48:14 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 27 Sep 2023 02:48:06 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 3/7] drm: atmel-hlcdc: Define SAM9X7 SoC XLCDC specific
 registers
Date: Wed, 27 Sep 2023 15:17:28 +0530
Message-ID: <20230927094732.490228-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927094732.490228-1-manikandan.m@microchip.com>
References: <20230927094732.490228-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com,
 Durai Manickam KR <durai.manickamkr@microchip.com>,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Durai Manickam KR <durai.manickamkr@microchip.com>

The register address of the XLCDC IP used in SAM9X7 SoC family
are different from the previous HLCDC. Defining those address
space with valid macros.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
[manikandan.m@microchip.com: Remove unused macro definitions]
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 42 ++++++++++++++++++++
 include/linux/mfd/atmel-hlcdc.h              | 10 +++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index c61fa1733da4..9965c7cc5bf8 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -15,6 +15,7 @@
 
 #include <drm/drm_plane.h>
 
+/* LCD controller common registers */
 #define ATMEL_HLCDC_LAYER_CHER			0x0
 #define ATMEL_HLCDC_LAYER_CHDR			0x4
 #define ATMEL_HLCDC_LAYER_CHSR			0x8
@@ -128,6 +129,47 @@
 
 #define ATMEL_HLCDC_MAX_LAYERS			6
 
+/* XLCDC controller specific registers */
+#define ATMEL_XLCDC_LAYER_ENR			0x10
+#define ATMEL_XLCDC_LAYER_EN			BIT(0)
+
+#define ATMEL_XLCDC_LAYER_IER			0x0
+#define ATMEL_XLCDC_LAYER_IDR			0x4
+#define ATMEL_XLCDC_LAYER_ISR			0xc
+#define ATMEL_XLCDC_LAYER_OVR_IRQ(p)		BIT(2 + (8 * (p)))
+
+#define ATMEL_XLCDC_LAYER_PLANE_ADDR(p)		(((p) * 0x4) + 0x18)
+
+#define ATMEL_XLCDC_LAYER_DMA_CFG		0
+
+#define ATMEL_XLCDC_LAYER_DMA			BIT(0)
+#define ATMEL_XLCDC_LAYER_REP			BIT(1)
+#define ATMEL_XLCDC_LAYER_DISCEN		BIT(4)
+
+#define ATMEL_XLCDC_LAYER_SFACTC_A0_MULT_AS	(4 << 6)
+#define ATMEL_XLCDC_LAYER_SFACTA_ONE		BIT(9)
+#define ATMEL_XLCDC_LAYER_DFACTC_M_A0_MULT_AS	(6 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTA_ONE		BIT(14)
+
+#define ATMEL_XLCDC_LAYER_A0_SHIFT		16
+#define ATMEL_XLCDC_LAYER_A0(x)			\
+	((x) << ATMEL_XLCDC_LAYER_A0_SHIFT)
+
+#define ATMEL_XLCDC_LAYER_VSCALER_LUMA_ENABLE		BIT(0)
+#define ATMEL_XLCDC_LAYER_VSCALER_CHROMA_ENABLE		BIT(1)
+#define ATMEL_XLCDC_LAYER_HSCALER_LUMA_ENABLE		BIT(4)
+#define ATMEL_XLCDC_LAYER_HSCALER_CHROMA_ENABLE		BIT(5)
+
+#define ATMEL_XLCDC_LAYER_VXSYCFG_ONE		BIT(0)
+#define ATMEL_XLCDC_LAYER_VXSYTAP2_ENABLE	BIT(4)
+#define ATMEL_XLCDC_LAYER_VXSCCFG_ONE		BIT(16)
+#define ATMEL_XLCDC_LAYER_VXSCTAP2_ENABLE	BIT(20)
+
+#define ATMEL_XLCDC_LAYER_HXSYCFG_ONE		BIT(0)
+#define ATMEL_XLCDC_LAYER_HXSYTAP2_ENABLE	BIT(4)
+#define ATMEL_XLCDC_LAYER_HXSCCFG_ONE		BIT(16)
+#define ATMEL_XLCDC_LAYER_HXSCTAP2_ENABLE	BIT(20)
+
 /**
  * Atmel HLCDC Layer registers layout structure
  *
diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
index a186119a49b5..80d675a03b39 100644
--- a/include/linux/mfd/atmel-hlcdc.h
+++ b/include/linux/mfd/atmel-hlcdc.h
@@ -22,6 +22,8 @@
 #define ATMEL_HLCDC_DITHER		BIT(6)
 #define ATMEL_HLCDC_DISPDLY		BIT(7)
 #define ATMEL_HLCDC_MODE_MASK		GENMASK(9, 8)
+#define ATMEL_XLCDC_MODE_MASK		GENMASK(10, 8)
+#define ATMEL_XLCDC_DPI			BIT(11)
 #define ATMEL_HLCDC_PP			BIT(10)
 #define ATMEL_HLCDC_VSPSU		BIT(12)
 #define ATMEL_HLCDC_VSPHO		BIT(13)
@@ -34,6 +36,12 @@
 #define ATMEL_HLCDC_IDR			0x30
 #define ATMEL_HLCDC_IMR			0x34
 #define ATMEL_HLCDC_ISR			0x38
+#define ATMEL_XLCDC_ATTRE		0x3c
+
+#define ATMEL_XLCDC_BASE_UPDATE		BIT(0)
+#define ATMEL_XLCDC_OVR1_UPDATE		BIT(1)
+#define ATMEL_XLCDC_OVR3_UPDATE		BIT(2)
+#define ATMEL_XLCDC_HEO_UPDATE		BIT(3)
 
 #define ATMEL_HLCDC_CLKPOL		BIT(0)
 #define ATMEL_HLCDC_CLKSEL		BIT(2)
@@ -48,6 +56,8 @@
 #define ATMEL_HLCDC_DISP		BIT(2)
 #define ATMEL_HLCDC_PWM			BIT(3)
 #define ATMEL_HLCDC_SIP			BIT(4)
+#define ATMEL_XLCDC_SD			BIT(5)
+#define ATMEL_XLCDC_CM			BIT(6)
 
 #define ATMEL_HLCDC_SOF			BIT(0)
 #define ATMEL_HLCDC_SYNCDIS		BIT(1)
-- 
2.25.1

