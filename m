Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D6B52F45
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AB310EA8F;
	Thu, 11 Sep 2025 11:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ku1i1wlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D2B10EA8F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:07:47 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BB7VZC360933;
 Thu, 11 Sep 2025 06:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757588851;
 bh=HVehuTKMJdKIsK0iUY/hkaQkE8+DtFTzunOrYjb34AM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ku1i1wlzXOGFnD/3L1ILoK6dha1bduLyQv+Us6nMTr1z4zNYaSJAjGxRQYpDBBxg2
 yIZSw762ktl3Gkui/8VKktLtudN7hHPrij6YtwMWkcyd++9FvisfAq3Rcqi10H/hoP
 +MDx+UOh2kNDzzj6EXOjKRAOa8s3hozMTjuTqGdM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BB7VOc1895217
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 11 Sep 2025 06:07:31 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 06:07:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 06:07:31 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BB7FP52031347;
 Thu, 11 Sep 2025 06:07:26 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v6 2/3] drm/tidss: Remove max_pclk_khz from tidss display
 features:
Date: Thu, 11 Sep 2025 16:37:14 +0530
Message-ID: <20250911110715.2873596-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911110715.2873596-1-s-jain1@ti.com>
References: <20250911110715.2873596-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

From: Jayesh Choudhary <j-choudhary@ti.com>

TIDSS hardware, by itself, does not have variable max pixel clock for
each VP. The maximum pixel clock is determined by the SoC's clocking
architecture.

The limitation that has been modeled until now comes from the SoC's
clocking architecture (PLL can only be programmed to a particular max
value). Instead of putting it as a constant field in dispc_features,
we can use clk_round_rate() to see if requested clock can be set or not.

Remove the constant "max_pclk_khz" from dispc_features. In mode_valid()
call, check if a best frequency match for the mode clock can be found
or not using clk_round_rate().

Since TIDSS display controller provides clock tolerance of 5%, we use
this while checking if the requested pixel clock is supported. Also,
move up dispc_pclk_diff() before it is called.

This will make the existing compatibles reusable if DSS features are
the same across two SoCs with the only difference being the pixel clock.

Note:
This uses clk_round_rate() to validate all modes and ensure that the
driver enumerates only those whose clocking requirements are well
within the tolerance range. However, this incurs a slight delay, as for
each mode, clk_round_rate() is called, which takes ~100 us. So, for a
monitor supporting 30 modes, it takes an extra 3.5 ms to do
clk_round_rate() to enumerate all modes. If the user wants to bypass
this validation logic, they can manually modify the driver to bypass
these calls selectively. For example, they can just do a
clk_round_rate() check for the highest resolution mode and bypass it
for the rest of the modes, as done here [1].

[1]: https://lore.kernel.org/all/20250704094851.182131-3-j-choudhary@ti.com/

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Tested-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 78 +++++++++++------------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
 drivers/gpu/drm/tidss/tidss_drv.h   |  1 -
 3 files changed, 30 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 7c8c15a5c39b..1cd83a6763ba 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -59,10 +59,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 const struct dispc_features dispc_k2g_feats = {
 	.min_pclk_khz = 4375,
 
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 150000,
-	},
-
 	/*
 	 * XXX According TRM the RGB input buffer width up to 2560 should
 	 *     work on 3 taps, but in practice it only works up to 1280.
@@ -145,11 +141,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_am65x_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_OLDI_AM65X] = 165000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -245,11 +236,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_j721e_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 170000,
-		[DISPC_VP_INTERNAL] = 600000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 2048,
 		.in_width_max_3tap_rgb = 4096,
@@ -316,11 +302,6 @@ const struct dispc_features dispc_j721e_feats = {
 };
 
 const struct dispc_features dispc_am625_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_INTERNAL] = 170000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -377,15 +358,6 @@ const struct dispc_features dispc_am625_feats = {
 };
 
 const struct dispc_features dispc_am62a7_feats = {
-	/*
-	 * if the code reaches dispc_mode_valid with VP1,
-	 * it should return MODE_BAD.
-	 */
-	.max_pclk_khz = {
-		[DISPC_VP_TIED_OFF] = 0,
-		[DISPC_VP_DPI] = 165000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -442,10 +414,6 @@ const struct dispc_features dispc_am62a7_feats = {
 };
 
 const struct dispc_features dispc_am62l_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-	},
-
 	.subrev = DISPC_AM62L,
 
 	.common = "common",
@@ -1331,25 +1299,50 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
 			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
 }
 
+/*
+ * Calculate the percentage difference between the requested pixel clock rate
+ * and the effective rate resulting from calculating the clock divider value.
+ */
+unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
+{
+	int r = rate / 100, rr = real_rate / 100;
+
+	return (unsigned int)(abs(((rr - r) * 100) / r));
+}
+
+static int check_pixel_clock(struct dispc_device *dispc,
+			     u32 hw_videoport, unsigned long clock)
+{
+	unsigned long round_clock;
+
+	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
+		return 0;
+	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
+	/*
+	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
+	 * use the same 5% check here.
+	 */
+	if (dispc_pclk_diff(clock, round_clock) > 5)
+		return -EINVAL;
+	return 0;
+}
+
 enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 u32 hw_videoport,
 					 const struct drm_display_mode *mode)
 {
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
 	enum dispc_vp_bus_type bus_type;
-	int max_pclk;
 
 	bus_type = dispc->feat->vp_bus_type[hw_videoport];
 
-	max_pclk = dispc->feat->max_pclk_khz[bus_type];
-
-	if (WARN_ON(max_pclk == 0))
+	if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
 		return MODE_BAD;
 
 	if (mode->clock < dispc->feat->min_pclk_khz)
 		return MODE_CLOCK_LOW;
 
-	if (mode->clock > max_pclk)
+	if (check_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
 		return MODE_CLOCK_HIGH;
 
 	if (mode->hdisplay > 4096)
@@ -1421,17 +1414,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
 	clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
 }
 
-/*
- * Calculate the percentage difference between the requested pixel clock rate
- * and the effective rate resulting from calculating the clock divider value.
- */
-unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
-{
-	int r = rate / 100, rr = real_rate / 100;
-
-	return (unsigned int)(abs(((rr - r) * 100) / r));
-}
-
 int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
 			  unsigned long rate)
 {
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 60c1b400eb89..fbfe6e304ac8 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -78,7 +78,6 @@ enum dispc_dss_subrevision {
 
 struct dispc_features {
 	int min_pclk_khz;
-	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
 
 	struct dispc_features_scaling scaling;
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index e1c1f41d8b4b..f82e282e17a7 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -26,7 +26,6 @@ struct tidss_device {
 	struct dispc_device *dispc;
 	bool is_ext_vp_clk[TIDSS_MAX_PORTS];
 
-
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
 
