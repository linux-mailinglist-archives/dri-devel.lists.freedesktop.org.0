Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3733E72DA80
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6115010E32C;
	Tue, 13 Jun 2023 07:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBEA10E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686640366; x=1718176366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/CEVsHh3cXtXVIDLUkkyiXlWx5YACPw7oC/4tgbf35c=;
 b=gcYwkBQvyTf9i+/MBlrGRiw4OVQGxVpTsfAUODsCUrExr2oxS+TdJyCl
 p18LbdVh/AF4j85JiGRkQcxYegcFfv4mOdqzGG8yQ0n6LFA49hI3cUDct
 NSMuFth6dAGrcsGKP73ejFmwO+J2J1YGC+lwH6VzAOfwK2aOJtoDfbgg3
 YpHqw83w/SrTAKMGleEbEUZ8vEgbc0uw+NTWKg7hc2VGgzwCPf4QBlpPQ
 u1wW7ivo5N1bmnCMDHgefA3fOqwzNl7Hn9uNu6dEJ4+vzxCyxWiNmi86B
 lTOnJOgOhDZtUeBx7RdnUwn4IaewyVxkhQC8r0woMcLTr2togxEwkmXHC A==;
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; d="scan'208";a="217553976"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jun 2023 00:05:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 00:05:38 -0700
Received: from che-lt-i67131.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 13 Jun 2023 00:05:29 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/9] drm: atmel-hlcdc: Define SAM9X7 XLCDC specific registers
Date: Tue, 13 Jun 2023 12:34:21 +0530
Message-ID: <20230613070426.467389-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613070426.467389-1-manikandan.m@microchip.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
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
 Manikandan <manikandan.m@microchip.com>, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai Manickam KR <durai.manickamkr@microchip.com>,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Durai Manickam KR <durai.manickamkr@microchip.com>

The register address of the XLCDC IP used in SAM9X7 are different from
the previous HLCDC.Defining those address space with valid macros.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
[manikandan.m@microchip.com: Remove unused macro definitions]
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 108 +++++++++++++++++++
 include/linux/mfd/atmel-hlcdc.h              |  10 ++
 2 files changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 5b5c774e0edf..aed1742b3665 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -15,6 +15,7 @@
 
 #include <drm/drm_plane.h>
 
+/* LCD controller common registers */
 #define ATMEL_HLCDC_LAYER_CHER			0x0
 #define ATMEL_HLCDC_LAYER_CHDR			0x4
 #define ATMEL_HLCDC_LAYER_CHSR			0x8
@@ -128,6 +129,113 @@
 
 #define ATMEL_HLCDC_MAX_LAYERS			6
 
+/* XLCDC controller specific registers */
+#define ATMEL_XLCDC_LAYER_ENR			0x10
+#define ATMEL_XLCDC_LAYER_EN			BIT(0)
+
+#define ATMEL_XLCDC_LAYER_IER			0x0
+#define ATMEL_XLCDC_LAYER_IDR			0x4
+#define ATMEL_XLCDC_LAYER_IMR			0x8
+#define ATMEL_XLCDC_LAYER_ISR			0xc
+#define ATMEL_XLCDC_LAYER_DONE_IRQ(p)		BIT(0 + (8 * (p)))
+#define ATMEL_XLCDC_LAYER_ERROR_IRQ(p)		BIT(1 + (8 * (p)))
+#define ATMEL_XLCDC_LAYER_OVR_IRQ(p)		BIT(2 + (8 * (p)))
+
+#define ATMEL_XLCDC_LAYER_PLANE_ADDR(p)		(((p) * 0x4) + 0x18)
+
+#define ATMEL_XLCDC_LAYER_DMA_CFG		0
+#define ATMEL_XLCDC_LAYER_DMA_BLEN_MASK		GENMASK(6, 4)
+#define ATMEL_XLCDC_LAYER_DMA_BLEN_SINGLE	(0 << 4)
+#define ATMEL_XLCDC_LAYER_DMA_BLEN_INCR32	(4 << 4)
+#define ATMEL_XLCDC_LAYER_DMA_BLENCC_MASK	GENMASK(10, 8)
+#define ATMEL_XLCDC_LAYER_DMA_BLENCC_SINGLE	(0 << 8)
+#define ATMEL_XLCDC_LAYER_DMA_BLENCC_INCR4	(1 << 8)
+#define ATMEL_XLCDC_LAYER_DMA_BLENCC_INCR8	(2 << 8)
+#define ATMEL_XLCDC_LAYER_DMA_BLENCC_INCR16	(3 << 8)
+#define ATMEL_XLCDC_LAYER_DMA_BLENCC_INCR32	(4 << 8)
+
+#define ATMEL_XLCDC_GAM				BIT(2)
+
+#define ATMEL_XLCDC_LAYER_POS(x, y)		((x) | ((y) << 16))
+#define ATMEL_XLCDC_LAYER_SIZE(w, h)		(((w) - 1) | (((h) - 1) << 16))
+
+#define ATMEL_XLCDC_LAYER_DMA			BIT(0)
+#define ATMEL_XLCDC_LAYER_REP			BIT(1)
+#define ATMEL_XLCDC_LAYER_CRKEY			BIT(2)
+#define ATMEL_XLCDC_LAYER_DSTKEY		BIT(3)
+#define ATMEL_XLCDC_LAYER_DISCEN                BIT(4)
+#define ATMEL_XLCDC_LAYER_VIDPRI		BIT(5)
+#define ATMEL_XLCDC_LAYER_SFACTC_MASK		GENMASK(8, 6)
+#define ATMEL_XLCDC_LAYER_SFACTC_ONE		(0 << 6)
+#define ATMEL_XLCDC_LAYER_SFACTC_ZERO		(1 << 6)
+#define ATMEL_XLCDC_LAYER_SFACTC_A0		(2 << 6)
+#define ATMEL_XLCDC_LAYER_SFACTC_A0_MULT_AD	(3 << 6)
+#define ATMEL_XLCDC_LAYER_SFACTC_A0_MULT_AS	(4 << 6)
+#define ATMEL_XLCDC_LAYER_SFACTC_M_A0_MULT_AD	(5 << 6)
+#define ATMEL_XLCDC_LAYER_SFACTA_MASK		GENMASK(10, 9)
+#define ATMEL_XLCDC_LAYER_SFACTA_ZERO		(0 << 9)
+#define ATMEL_XLCDC_LAYER_SFACTA_ONE		(1 << 9)
+#define ATMEL_XLCDC_LAYER_SFACTA_A0		(2 << 9)
+#define ATMEL_XLCDC_LAYER_SFACTA_A1		(3 << 9)
+#define ATMEL_XLCDC_LAYER_DFACTC_MASK		GENMASK(13, 11)
+#define ATMEL_XLCDC_LAYER_DFACTC_ZERO		(0 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTC_ONE		(1 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTC_A0		(2 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTC_A1		(3 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTC_A0_MULT_AD	(4 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTC_M_A0_MULT_AD	(5 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTC_M_A0_MULT_AS	(6 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTC_M_A0		(7 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTA_MASK		GENMASK(15, 14)
+#define ATMEL_XLCDC_LAYER_DFACTA_ZERO		(0 << 14)
+#define ATMEL_XLCDC_LAYER_DFACTA_ONE		(1 << 14)
+#define ATMEL_XLCDC_LAYER_DFACTA_M_A0_MULT_AS	(2 << 14)
+#define ATMEL_XLCDC_LAYER_DFACTA_A1		(3 << 14)
+#define ATMEL_XLCDC_LAYER_A0_SHIFT		16
+#define ATMEL_XLCDC_LAYER_A0_MASK		\
+	GENMASK(23, ATMEL_XLCDC_LAYER_A0_SHIFT)
+#define ATMEL_XLCDC_LAYER_A0(x)			\
+	((x) << ATMEL_XLCDC_LAYER_A0_SHIFT)
+#define ATMEL_XLCDC_LAYER_A1_SHIFT		24
+#define ATMEL_XLCDC_LAYER_A1_MASK		\
+	GENMASK(31, ATMEL_XLCDC_LAYER_A1_SHIFT)
+#define ATMEL_XLCDC_LAYER_A1(x)			\
+	((x) << ATMEL_XLCDC_LAYER_A1_SHIFT)
+
+#define ATMEL_XLCDC_LAYER_DISC_POS(x, y)	((x) | ((y) << 16))
+#define ATMEL_XLCDC_LAYER_DISC_SIZE(w, h)	(((w) - 1) | (((h) - 1) << 16))
+
+#define ATMEL_XLCDC_LAYER_VSCALER_LUMA_ENABLE		BIT(0)
+#define ATMEL_XLCDC_LAYER_VSCALER_CHROMA_ENABLE		BIT(1)
+#define ATMEL_XLCDC_LAYER_HSCALER_LUMA_ENABLE		BIT(4)
+#define ATMEL_XLCDC_LAYER_HSCALER_CHROMA_ENABLE		BIT(5)
+
+#define ATMEL_XLCDC_LAYER_VXSYCFG_ZERO		(0 << 0)
+#define ATMEL_XLCDC_LAYER_VXSYCFG_ONE		(1 << 0)
+#define ATMEL_XLCDC_LAYER_VXSYCFG_TWO		(2 << 0)
+#define ATMEL_XLCDC_LAYER_VXSYCFG_THREE		(3 << 0)
+#define ATMEL_XLCDC_LAYER_VXSYTAP2_ENABLE	BIT(4)
+#define ATMEL_XLCDC_LAYER_VXSYBICU_ENABLE	BIT(5)
+#define ATMEL_XLCDC_LAYER_VXSCCFG_ZERO		(0 << 16)
+#define ATMEL_XLCDC_LAYER_VXSCCFG_ONE		(1 << 16)
+#define ATMEL_XLCDC_LAYER_VXSCCFG_TWO		(2 << 16)
+#define ATMEL_XLCDC_LAYER_VXSCCFG_THREE		(3 << 16)
+#define ATMEL_XLCDC_LAYER_VXSCTAP2_ENABLE	BIT(20)
+#define ATMEL_XLCDC_LAYER_VXSCBICU_ENABLE	BIT(21)
+
+#define ATMEL_XLCDC_LAYER_HXSYCFG_ZERO		(0 << 0)
+#define ATMEL_XLCDC_LAYER_HXSYCFG_ONE		(1 << 0)
+#define ATMEL_XLCDC_LAYER_HXSYCFG_TWO		(2 << 0)
+#define ATMEL_XLCDC_LAYER_HXSYCFG_THREE		(3 << 0)
+#define ATMEL_XLCDC_LAYER_HXSYTAP2_ENABLE	BIT(4)
+#define ATMEL_XLCDC_LAYER_HXSYBICU_ENABLE	BIT(5)
+#define ATMEL_XLCDC_LAYER_HXSCCFG_ZERO		(0 << 16)
+#define ATMEL_XLCDC_LAYER_HXSCCFG_ONE		(1 << 16)
+#define ATMEL_XLCDC_LAYER_HXSCCFG_TWO		(2 << 16)
+#define ATMEL_XLCDC_LAYER_HXSCCFG_THREE		(3 << 16)
+#define ATMEL_XLCDC_LAYER_HXSCTAP2_ENABLE	BIT(20)
+#define ATMEL_XLCDC_LAYER_HXSCBICU_ENABLE	BIT(21)
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

