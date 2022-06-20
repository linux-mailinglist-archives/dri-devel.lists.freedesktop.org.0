Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF7655193C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253AB10E122;
	Mon, 20 Jun 2022 12:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EABE10E05E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:47:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25KCWOZc063877;
 Mon, 20 Jun 2022 07:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1655728344;
 bh=a2Lf1fI2N5ol6jg41Zf8mUCODL6OyvVyb8A6EHZWAiI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yJi+dNb9HilBgg8iW82663//v8nA3itVcjvAgxX6M6N5QC4kBoK6RJIryfC1llR8n
 061suy7A398DRXqvBkTpVeSzRV5ga9A6pynW+YdwhE8lNzeI7y/MnSlSw623atIyVk
 qgGtKUwGyfZvCnAG7EaFrO2mLJPTJcnMVcKA4oHg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25KCWOEL111533
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jun 2022 07:32:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Jun 2022 07:32:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Jun 2022 07:32:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25KCWNIs093056;
 Mon, 20 Jun 2022 07:32:23 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>
Subject: [PATCH 2/2] drm/tidss: Add support for AM625 DSS
Date: Mon, 20 Jun 2022 18:02:17 +0530
Message-ID: <20220620123217.25809-3-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620123217.25809-1-a-bhatia1@ti.com>
References: <20220620123217.25809-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 DRI Devel List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the DSS IP on TI's new AM625 soc in the tidss driver.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 83 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/tidss/tidss_dispc.h |  2 +
 drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index dae47853b728..511d1f1d46fc 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -272,6 +272,82 @@ const struct dispc_features dispc_j721e_feats = {
 	.vid_order = { 1, 3, 0, 2 },
 };
 
+static const u16 tidss_am62x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
+	[DSS_REVISION_OFF] =			0x4,
+	[DSS_SYSCONFIG_OFF] =			0x8,
+	[DSS_SYSSTATUS_OFF] =			0x20,
+	[DISPC_IRQ_EOI_OFF] =			0x24,
+	[DISPC_IRQSTATUS_RAW_OFF] =		0x28,
+	[DISPC_IRQSTATUS_OFF] =			0x2c,
+	[DISPC_IRQENABLE_SET_OFF] =		0x30,
+	[DISPC_IRQENABLE_CLR_OFF] =		0x40,
+	[DISPC_VID_IRQENABLE_OFF] =		0x44,
+	[DISPC_VID_IRQSTATUS_OFF] =		0x58,
+	[DISPC_VP_IRQENABLE_OFF] =		0x70,
+	[DISPC_VP_IRQSTATUS_OFF] =		0x7c,
+
+	[WB_IRQENABLE_OFF] =			0x88,
+	[WB_IRQSTATUS_OFF] =			0x8c,
+
+	[DISPC_GLOBAL_MFLAG_ATTRIBUTE_OFF] =	0x90,
+	[DISPC_GLOBAL_OUTPUT_ENABLE_OFF] =	0x94,
+	[DISPC_GLOBAL_BUFFER_OFF] =		0x98,
+	[DSS_CBA_CFG_OFF] =			0x9c,
+	[DISPC_DBG_CONTROL_OFF] =		0xa0,
+	[DISPC_DBG_STATUS_OFF] =		0xa4,
+	[DISPC_CLKGATING_DISABLE_OFF] =		0xa8,
+	[DISPC_SECURE_DISABLE_OFF] =		0xac,
+};
+
+const struct dispc_features dispc_am625_feats = {
+	.max_pclk_khz = {
+		[DISPC_VP_DPI] = 165000,
+		[DISPC_VP_OLDI] = 165000,
+	},
+
+	.scaling = {
+		.in_width_max_5tap_rgb = 1280,
+		.in_width_max_3tap_rgb = 2560,
+		.in_width_max_5tap_yuv = 2560,
+		.in_width_max_3tap_yuv = 4096,
+		.upscale_limit = 16,
+		.downscale_limit_5tap = 4,
+		.downscale_limit_3tap = 2,
+		/*
+		 * The max supported pixel inc value is 255. The value
+		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
+		 * The maximum bpp of all formats supported by the HW
+		 * is 8. So the maximum supported xinc value is 32,
+		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
+		 */
+		.xinc_max = 32,
+	},
+
+	.subrev = DISPC_AM625,
+
+	.common = "common",
+	.common_regs = tidss_am62x_common_regs,
+
+	.num_vps = 2,
+	.vp_name = { "vp1", "vp2" },
+	.ovr_name = { "ovr1", "ovr2" },
+	.vpclk_name =  { "vp1", "vp2" },
+	.vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
+
+	.vp_feat = { .color = {
+			.has_ctm = true,
+			.gamma_size = 256,
+			.gamma_type = TIDSS_GAMMA_8BIT,
+		},
+	},
+
+	.num_planes = 2,
+	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
+	.vid_name = { "vid", "vidl1" },
+	.vid_lite = { false, true, },
+	.vid_order = { 1, 0 },
+};
+
 static const u16 *dispc_common_regmap;
 
 struct dss_vp_data {
@@ -775,6 +851,7 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
 		return dispc_k2g_read_and_clear_irqstatus(dispc);
 	case DISPC_AM65X:
 	case DISPC_J721E:
+	case DISPC_AM625:
 		return dispc_k3_read_and_clear_irqstatus(dispc);
 	default:
 		WARN_ON(1);
@@ -790,6 +867,7 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 		break;
 	case DISPC_AM65X:
 	case DISPC_J721E:
+	case DISPC_AM625:
 		dispc_k3_set_irqenable(dispc, mask);
 		break;
 	default:
@@ -1279,6 +1357,7 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
 					x, y, layer);
 		break;
 	case DISPC_AM65X:
+	case DISPC_AM625:
 		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
 					  x, y, layer);
 		break;
@@ -2202,6 +2281,7 @@ static void dispc_plane_init(struct dispc_device *dispc)
 		break;
 	case DISPC_AM65X:
 	case DISPC_J721E:
+	case DISPC_AM625:
 		dispc_k3_plane_init(dispc);
 		break;
 	default:
@@ -2307,6 +2387,7 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
 		dispc_k2g_vp_write_gamma_table(dispc, hw_videoport);
 		break;
 	case DISPC_AM65X:
+	case DISPC_AM625:
 		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
 		break;
 	case DISPC_J721E:
@@ -2580,7 +2661,7 @@ int dispc_runtime_resume(struct dispc_device *dispc)
 		REG_GET(dispc, DSS_SYSSTATUS, 2, 2),
 		REG_GET(dispc, DSS_SYSSTATUS, 3, 3));
 
-	if (dispc->feat->subrev == DISPC_AM65X)
+	if (dispc->feat->subrev == DISPC_AM65X || dispc->feat->subrev == DISPC_AM625)
 		dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
 			REG_GET(dispc, DSS_SYSSTATUS, 5, 5),
 			REG_GET(dispc, DSS_SYSSTATUS, 6, 6),
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index e49432f0abf5..a28005dafdc9 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -61,6 +61,7 @@ enum dispc_dss_subrevision {
 	DISPC_K2G,
 	DISPC_AM65X,
 	DISPC_J721E,
+	DISPC_AM625,
 };
 
 struct dispc_features {
@@ -88,6 +89,7 @@ struct dispc_features {
 extern const struct dispc_features dispc_k2g_feats;
 extern const struct dispc_features dispc_am65x_feats;
 extern const struct dispc_features dispc_j721e_feats;
+extern const struct dispc_features dispc_am625_feats;
 
 void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask);
 dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc);
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 04cfff89ee51..326059e99696 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -235,6 +235,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
+	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ }
 };
 
-- 
2.36.1

