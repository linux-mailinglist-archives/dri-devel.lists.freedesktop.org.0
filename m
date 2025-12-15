Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2002CBD1C6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD24F10E33F;
	Mon, 15 Dec 2025 09:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="FUoMSq9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B814D10E26B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1765790083; x=1797326083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w6l2xTMrISfCv+/Rqd1HY2hTKwEw5rskWfaAAH/PZME=;
 b=FUoMSq9ST5cCTuxQPbIKoNc815FzdQQrgcBMusOvPz/Esix6lqX1Mxke
 7v2X17hOWqMwnNAnGVlWv9eidG3c7o/wZq2pc6daN57CHkT7F1b95L30W
 WpflEQYoDp64XrZxjMIFCQecqxGIAZ4W1PtKGyRnuyIXigvJcODxoi9AW
 axCdGDpXtc2TYzNc+zHQPqxQrg2UWHg5fyWRGRs+r77Lb1ez1F8OUfmHI
 QCyjkn5e7L0PZaGTilmZ7gwpEbgG6PLIEh6PQy13BqeUWqNG2xqi8vFZR
 SG8wtQppEjEUknAg4Shf/q7HQOFZwz/wmLlKWfytQGhQ68Weu8Y2FX8Ck Q==;
X-CSE-ConnectionGUID: PcTJoc4CSZSXBJPpFg6KMg==
X-CSE-MsgGUID: 9O2qFZp1QHqau2RZELyEfg==
X-IronPort-AV: E=Sophos;i="6.21,150,1763449200"; d="scan'208";a="217865850"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Dec 2025 02:07:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Dec 2025 02:07:20 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Dec 2025 02:07:12 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 2/2] drm: atmel-hlcdc: add LCD controller layer definition for
 sama7d65
Date: Mon, 15 Dec 2025 14:36:39 +0530
Message-ID: <20251215090639.346288-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251215090639.346288-1-manikandan.m@microchip.com>
References: <20251215090639.346288-1-manikandan.m@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add the LCD controller layer definition and atmel_hlcdc_of_match
entry for sama7d65.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 81 ++++++++++++++++++++
 drivers/mfd/atmel-hlcdc.c                    |  1 +
 2 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index dd70894c8f38..9c18c6841e2a 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -566,6 +566,83 @@ static const struct atmel_hlcdc_dc_desc atmel_xlcdc_dc_sam9x75 = {
 	.ops = &atmel_xlcdc_ops,
 };
 
+static const struct atmel_hlcdc_layer_desc atmel_xlcdc_sama7d65_layers[] = {
+	{
+		.name = "base",
+		.formats = &atmel_hlcdc_plane_rgb_formats,
+		.regs_offset = 0x60,
+		.id = 0,
+		.type = ATMEL_HLCDC_BASE_LAYER,
+		.cfgs_offset = 0x1c,
+		.layout = {
+			.xstride = { 2 },
+			.default_color = 3,
+			.general_config = 4,
+			.disc_pos = 5,
+			.disc_size = 6,
+		},
+		.clut_offset = 0x700,
+	},
+	{
+		.name = "overlay1",
+		.formats = &atmel_hlcdc_plane_rgb_formats,
+		.regs_offset = 0x160,
+		.id = 1,
+		.type = ATMEL_HLCDC_OVERLAY_LAYER,
+		.cfgs_offset = 0x1c,
+		.layout = {
+			.pos = 2,
+			.size = 3,
+			.xstride = { 4 },
+			.pstride = { 5 },
+			.default_color = 6,
+			.chroma_key = 7,
+			.chroma_key_mask = 8,
+			.general_config = 9,
+		},
+		.clut_offset = 0xb00,
+	},
+	{
+		.name = "high-end-overlay",
+		.formats = &atmel_hlcdc_plane_rgb_and_yuv_formats,
+		.regs_offset = 0x360,
+		.id = 2,
+		.type = ATMEL_HLCDC_OVERLAY_LAYER,
+		.cfgs_offset = 0x30,
+		.layout = {
+			.pos = 2,
+			.size = 3,
+			.memsize = 4,
+			.xstride = { 5, 7 },
+			.pstride = { 6, 8 },
+			.default_color = 9,
+			.chroma_key = 10,
+			.chroma_key_mask = 11,
+			.general_config = 12,
+			.csc = 16,
+			.scaler_config = 23,
+			.vxs_config = 30,
+			.hxs_config = 31,
+		},
+		.clut_offset = 0x1300,
+	},
+};
+
+static const struct atmel_hlcdc_dc_desc atmel_xlcdc_dc_sama7d65 = {
+	.min_width = 0,
+	.min_height = 0,
+	.max_width = 2048,
+	.max_height = 2048,
+	.max_spw = 0x3ff,
+	.max_vpw = 0x3ff,
+	.max_hpw = 0x3ff,
+	.fixed_clksrc = false,
+	.is_xlcdc = true,
+	.nlayers = ARRAY_SIZE(atmel_xlcdc_sama7d65_layers),
+	.layers = atmel_xlcdc_sama7d65_layers,
+	.ops = &atmel_xlcdc_ops,
+};
+
 static const struct of_device_id atmel_hlcdc_of_match[] = {
 	{
 		.compatible = "atmel,at91sam9n12-hlcdc",
@@ -595,6 +672,10 @@ static const struct of_device_id atmel_hlcdc_of_match[] = {
 		.compatible = "microchip,sam9x75-xlcdc",
 		.data = &atmel_xlcdc_dc_sam9x75,
 	},
+	{
+		.compatible = "microchip,sama7d65-xlcdc",
+		.data = &atmel_xlcdc_dc_sama7d65,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, atmel_hlcdc_of_match);
diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 4c4e35d404f3..c3f3d39bf584 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -140,6 +140,7 @@ static const struct of_device_id atmel_hlcdc_match[] = {
 	{ .compatible = "atmel,sama5d4-hlcdc" },
 	{ .compatible = "microchip,sam9x60-hlcdc" },
 	{ .compatible = "microchip,sam9x75-xlcdc" },
+	{ .compatible = "microchip,sama7d65-xlcdc" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, atmel_hlcdc_match);
-- 
2.25.1

