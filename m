Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83F347C02
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC8A6EC76;
	Wed, 24 Mar 2021 15:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591C66EC76
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:20 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z25so30670657lja.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=una7OW7SwqxBKetRjUutsOKpzg9raxB99uDxP68mTsc=;
 b=oEyPq+l0VttqNWjHuQS3veEc+Pe99sYEZOZnL6LVimVOhyUl9qUii+VZu6LJk/PNCx
 rG3UH0PVz74iTCTL1AIQu3crTJaGZ14LMznoi4NbeLlSoU9LFAYeKLrg+3n4iJq1r0UT
 /mY7mndzHLBoJW7mWOp/PURHjn1CQTCi1nLMXshnRcdHBP8Xbp2AHkQNGQKKxW8392vM
 y0mSCM4p4DVjISdn04hQ7uNbGh4oOVxg5HGtxTMZEeyCorvQQLcCVfOCdW7Okgv8CgOM
 cIUqzMo0beaOG9Ge0Ke1Fw4uWFo1pPEH0iTIGXQwPbuSMDUHLPLiSGi7d/ApxTtYMpk9
 f1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=una7OW7SwqxBKetRjUutsOKpzg9raxB99uDxP68mTsc=;
 b=VooSqRWgxeLdJGgdnSFgeesG6/PL6dfdyyNchB2k4GoJP/qR1oDR8QOgppGgK7SEiz
 AVJM0SAf+mL7vXHSo1TcqTJDYc24SHZlcudqYo+PReFAuBeQ1VSuznjjxF142TdDrHSN
 BMRJp8hvrfVC2ZBQIQo+0XrlBDduW5O8VsoEzVfqOFoWYVXwXU2CYtjulYervvrBsfsr
 7ax2kDDmkYTfzQD9lJ0SsXIxi/22epHinxO85xCRsOFsPZxyCzHeNdq/xGbuRE+jQybe
 n4eVQzkpTnymVOKxtcPcbjRgrlc12EKNniiuMxbmDmGU0VlFXOvkUqyPxIiOYynLHpPQ
 E/Zw==
X-Gm-Message-State: AOAM533sjSMVp37IlJDYmQyPG1AI3uaFlV0w3F2sDDH00X2EgWij0Ln5
 O6UmyqpWnnTMwIM5gmfjc4QbCw==
X-Google-Smtp-Source: ABdhPJz5GpiOAHY9rYo2IgENSyWyZKP5LpnBHEih/MtMpqYzXPiJePxlP9jvj7Kqqm+BtsF7YjQrIQ==
X-Received: by 2002:a2e:9793:: with SMTP id y19mr2355270lji.374.1616599158738; 
 Wed, 24 Mar 2021 08:19:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 08/28] drm/msm/dsi: drop global msm_dsi_phy_type enumaration
Date: Wed, 24 Mar 2021 18:18:26 +0300
Message-Id: <20210324151846.2774204-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the current upstream driver the msm_dsi_phy_type enum does not make
much sense: all DSI PHYs are probed using the dt bindings, the phy type
is not passed between drivers. Use quirks in phy individual PHY drivers
to differentiate minor harware differences and drop the enum.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h                 | 12 -----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 11 +++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 19 ++++++++----------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 20 ++++++++++---------
 8 files changed, 25 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 21cf883fb6f1..98a4b296fa30 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -23,18 +23,6 @@
 struct msm_dsi_phy_shared_timings;
 struct msm_dsi_phy_clk_request;
 
-enum msm_dsi_phy_type {
-	MSM_DSI_PHY_28NM_HPM,
-	MSM_DSI_PHY_28NM_LP,
-	MSM_DSI_PHY_20NM,
-	MSM_DSI_PHY_28NM_8960,
-	MSM_DSI_PHY_14NM,
-	MSM_DSI_PHY_10NM,
-	MSM_DSI_PHY_7NM,
-	MSM_DSI_PHY_7NM_V4_1,
-	MSM_DSI_PHY_MAX
-};
-
 enum msm_dsi_phy_usecase {
 	MSM_DSI_PHY_STANDALONE,
 	MSM_DSI_PHY_MASTER,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 244d2c900d40..39abb86446f9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -13,9 +13,6 @@
 #define dsi_phy_read(offset) msm_readl((offset))
 #define dsi_phy_write(offset, data) msm_writel((data), (offset))
 
-/* v3.0.0 10nm implementation that requires the old timings settings */
-#define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
-
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
@@ -37,7 +34,6 @@ struct msm_dsi_pll_ops {
 };
 
 struct msm_dsi_phy_cfg {
-	enum msm_dsi_phy_type type;
 	struct dsi_reg_config reg_cfg;
 	struct msm_dsi_phy_ops ops;
 	const struct msm_dsi_pll_ops pll_ops;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index f697ff9a0d8e..dc8ccc994759 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -59,6 +59,9 @@ struct dsi_pll_regs {
 	u32 ssc_control;
 };
 
+/* v3.0.0 10nm implementation that requires the old timings settings */
+#define DSI_PHY_10NM_QUIRK_OLD_TIMINGS	BIT(0)
+
 struct dsi_pll_config {
 	u32 ref_freq;
 	bool div_override;
@@ -915,7 +918,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 	u8 tx_dctrl[] = { 0x00, 0x00, 0x00, 0x04, 0x01 };
 	void __iomem *lane_base = phy->lane_base;
 
-	if (phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)
+	if (phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)
 		tx_dctrl[3] = 0x02;
 
 	/* Strength ctrl settings */
@@ -950,7 +953,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 			      tx_dctrl[i]);
 	}
 
-	if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
+	if (!(phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)) {
 		/* Toggle BIT 0 to release freeze I/0 */
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
@@ -1090,7 +1093,6 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
-	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1116,7 +1118,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
-	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1139,5 +1140,5 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	},
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
-	.quirks = V3_0_0_10NM_OLD_TIMINGS_QUIRK,
+	.quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 011d285bf2c0..d78f846cf8e4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1215,7 +1215,6 @@ static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
-	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1243,7 +1242,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
-	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index b752636f7f21..5e73f811d645 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -125,7 +125,6 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
-	.type = MSM_DSI_PHY_20NM,
 	.src_pll_truthtable = { {false, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index fb6e19d9495d..bb33261d606d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -40,6 +40,9 @@
 #define DSI_BYTE_PLL_CLK		0
 #define DSI_PIXEL_PLL_CLK		1
 
+/* v2.0.0 28nm LP implementation */
+#define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
+
 #define LPFR_LUT_SIZE			10
 struct lpfr_cfg {
 	unsigned long vco_rate;
@@ -624,14 +627,10 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_28nm->base;
 	pll->min_rate = VCO_MIN_RATE;
 	pll->max_rate = VCO_MAX_RATE;
-	if (phy->cfg->type == MSM_DSI_PHY_28NM_HPM) {
-		pll_28nm->vco_delay = 1;
-	} else if (phy->cfg->type == MSM_DSI_PHY_28NM_LP) {
+	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		pll_28nm->vco_delay = 1000;
-	} else {
-		DRM_DEV_ERROR(&pdev->dev, "phy type (%d) is not 28nm\n", phy->cfg->type);
-		return -EINVAL;
-	}
+	else
+		pll_28nm->vco_delay = 1;
 
 	pll->cfg = phy->cfg;
 
@@ -706,7 +705,7 @@ static void dsi_28nm_phy_regulator_enable_ldo(struct msm_dsi_phy *phy)
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x1);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
 
-	if (phy->cfg->type == MSM_DSI_PHY_28NM_LP)
+	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x05);
 	else
 		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x0d);
@@ -791,7 +790,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
-	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -818,7 +816,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
-	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -845,7 +842,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
-	.type = MSM_DSI_PHY_28NM_LP,
 	.src_pll_truthtable = { {true, true}, {true, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -869,5 +865,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	},
 	.io_start = { 0x1a98500 },
 	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 08f31be3b0dc..79b0842a8dc4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -690,7 +690,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
-	.type = MSM_DSI_PHY_28NM_8960,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 68b54e5060e4..44ae495e8fca 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -59,6 +59,9 @@ struct dsi_pll_regs {
 	u32 ssc_control;
 };
 
+/* Hardware is V4.1 */
+#define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
+
 struct dsi_pll_config {
 	u32 ref_freq;
 	bool div_override;
@@ -178,7 +181,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll)
 
 	dec = div_u64(dec_multiple, multiplier);
 
-	if (pll->base.cfg->type != MSM_DSI_PHY_7NM_V4_1)
+	if (!(pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
 		regs->pll_clock_inverters = 0x28;
 	else if (pll_freq <= 1000000000ULL)
 		regs->pll_clock_inverters = 0xa0;
@@ -273,7 +276,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	void __iomem *base = pll->mmio;
 	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
 
-	if (pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		if (pll->vco_current_rate >= 3100000000ULL)
 			analog_controls_five_1 = 0x03;
 
@@ -307,9 +310,9 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
-		  pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1 ? 0x3f : 0x22);
+		  pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
 
-	if (pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		pll_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 		if (pll->slave)
 			pll_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
@@ -888,7 +891,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_7nm->base;
 	pll->min_rate = 1000000000UL;
 	pll->max_rate = 3500000000UL;
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		pll->min_rate = 600000000UL;
 		pll->max_rate = (unsigned long)5000000000ULL;
 		/* workaround for max rate overflowing on 32-bit builds: */
@@ -948,7 +951,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	const u8 *tx_dctrl = tx_dctrl_0;
 	void __iomem *lane_base = phy->lane_base;
 
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1)
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
 		tx_dctrl = tx_dctrl_1;
 
 	/* Strength ctrl settings */
@@ -1012,7 +1015,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
 		glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
@@ -1129,7 +1132,6 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
-	.type = MSM_DSI_PHY_7NM_V4_1,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1152,10 +1154,10 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	},
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
-	.type = MSM_DSI_PHY_7NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
