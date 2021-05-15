Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48538190D
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202316E409;
	Sat, 15 May 2021 13:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14A6E2E3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 13:12:28 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i9so2207146lfe.13
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9D09VWabSDdj6FOrxuJxK4mACfb9zFCE7liXfZak7o=;
 b=HO/Uhooj631HPA0uWEJ+Yxvkyg23DmN6M1fR3QJ74J5hgXze1WFc26RVcgRuNiAPPT
 OM3LLr9a/bK9flw2HCNPkB1ZXwgnjVs5RjMrucCbAFfmDm4ye6pumoCPmbOIq8UhQm37
 nlHgZMVIOyvqWq2eggvyhXScxMt8uxAFZctV3mDNk3DC6Dm438kx+p2PLG7xnglf63VR
 gNgwO897O2v4BCcTNW7/oZpFpyD6EjWr1eOcPC+4KPLQklCFEBzMqv5PVLVsLXax5cIz
 pFIrtNYszHXO41jhFsH2sneljdW//v2zu0O3P0tzdmig+wPushrqgweyklCQVRoL538h
 IhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9D09VWabSDdj6FOrxuJxK4mACfb9zFCE7liXfZak7o=;
 b=eu3ZjuKl66wfn9h2FDjj1obx7lQ1Z3qtP4uBFQgnN/24PXBI5aiDL7lY2nt/UGfbvG
 gm8MdzdRgCbQlZPpTNjD+ijyLRwGMvLfHA7qWONUIo+EYbBO8GJ1MXpBO3/R/XRx6O28
 NbA9U4+HvFt5yNX+c6/p22HGxEGrEdkZ/gSP38WiuAKpqLfdrfjx4UqR5iGjbs2Ljkh+
 BxPm4s0o5yxK8IXyN1jDTPVDiwwe0vvyoiHS5AaNH73QGm+IZNIWOAXtFQuD+K9BBvLH
 psoqbu9zt7GHAJZlBAPcPsy6GH9gAniPUnLdsZoMCgp8R6Z6QIcZUUk7Lz0PczvrNB8l
 KtZA==
X-Gm-Message-State: AOAM532KBXYK29sc4GwbLMCIaSuoFBtIlKMX5Zbbdef1wJSff5rPhBTV
 ipjDpVY3gsnEk/bPNwXZz8PTOg==
X-Google-Smtp-Source: ABdhPJw4Qk3PuQAD4Cj4AF6GdlqrEaMkgnDM6tQxa2AnooXZS3KdIIbFR47M8nPxizU52dHRTPRmJQ==
X-Received: by 2002:a19:9102:: with SMTP id t2mr2282600lfd.255.1621084346465; 
 Sat, 15 May 2021 06:12:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 8/8] drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy
Date: Sat, 15 May 2021 16:12:17 +0300
Message-Id: <20210515131217.1540412-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove struct msm_dsi_dphy_timing field from the struct msm_dsi_phy.
There is no need to store them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          | 18 ++++++++++++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          | 10 ++++++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c     | 11 +++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 11 +++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c     | 10 ++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c     | 12 ++++--------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    | 10 ++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c      | 13 ++++---------
 8 files changed, 40 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 53a02c02dd6e..47145cab6b55 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -453,6 +453,8 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	tmax = 255;
 	timing->shared_timings.clk_pre = DIV_ROUND_UP((tmax - tmin) * 125, 10000) + tmin;
 
+	timing->bitclk_rate = bit_rate;
+
 	DBG("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
 		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
 		timing->clk_zero, timing->clk_trail, timing->clk_prepare, timing->hs_exit,
@@ -756,6 +758,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_shared_timings *shared_timings)
 {
 	struct device *dev = &phy->pdev->dev;
+	struct msm_dsi_dphy_timing timing;
 	int ret;
 
 	if (!phy || !phy->cfg->ops.enable)
@@ -775,15 +778,22 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 		goto reg_en_fail;
 	}
 
-	ret = phy->cfg->ops.enable(phy, clk_req);
+	if (!phy->cfg->ops.dphy_timing_calc ||
+	    phy->cfg->ops.dphy_timing_calc(&timing, clk_req)) {
+		DRM_DEV_ERROR(&phy->pdev->dev,
+			"%s: D-PHY timing calculation failed\n", __func__);
+		return -EINVAL;
+	}
+
+	memcpy(shared_timings, &timing.shared_timings,
+	       sizeof(*shared_timings));
+
+	ret = phy->cfg->ops.enable(phy, &timing);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: phy enable failed, %d\n", __func__, ret);
 		goto phy_en_fail;
 	}
 
-	memcpy(shared_timings, &phy->timing.shared_timings,
-	       sizeof(*shared_timings));
-
 	/*
 	 * Resetting DSI PHY silently changes its PLL registers to reset status,
 	 * which will confuse clock driver and result in wrong output rate of
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 94a77ac364d3..9ba03a242d24 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -17,10 +17,14 @@
 #define dsi_phy_write_udelay(offset, data, delay_us) { msm_writel((data), (offset)); udelay(delay_us); }
 #define dsi_phy_write_ndelay(offset, data, delay_ns) { msm_writel((data), (offset)); ndelay(delay_ns); }
 
+struct msm_dsi_dphy_timing;
+
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
-	int (*enable)(struct msm_dsi_phy *phy,
+	int (*dphy_timing_calc)(struct msm_dsi_dphy_timing *timing,
 			struct msm_dsi_phy_clk_request *clk_req);
+	int (*enable)(struct msm_dsi_phy *phy,
+			struct msm_dsi_dphy_timing *timing);
 	void (*disable)(struct msm_dsi_phy *phy);
 	void (*save_pll_state)(struct msm_dsi_phy *phy);
 	int (*restore_pll_state)(struct msm_dsi_phy *phy);
@@ -73,6 +77,9 @@ struct msm_dsi_dphy_timing {
 	u32 hs_prep_dly_ckln;
 	u8 hs_halfbyte_en;
 	u8 hs_halfbyte_en_ckln;
+
+	/* For PHY v4 only */
+	unsigned long bitclk_rate;
 };
 
 #define DSI_BYTE_PLL_CLK		0
@@ -90,7 +97,6 @@ struct msm_dsi_phy {
 	struct clk *ahb_clk;
 	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
 
-	struct msm_dsi_dphy_timing timing;
 	const struct msm_dsi_phy_cfg *cfg;
 
 	enum msm_dsi_phy_usecase usecase;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 34bc93548fcf..bc838ee4f9b9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -789,24 +789,17 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 }
 
 static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
-			       struct msm_dsi_phy_clk_request *clk_req)
+			       struct msm_dsi_dphy_timing *timing)
 {
 	int ret;
 	u32 status;
 	u32 const delay_us = 5;
 	u32 const timeout_us = 1000;
-	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	void __iomem *base = phy->base;
 	u32 data;
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc_v3(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	if (dsi_phy_hw_v3_0_is_pll_on(phy))
 		pr_warn("PLL turned on before configuring PHY\n");
 
@@ -929,6 +922,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v3,
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
@@ -950,6 +944,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v3,
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 65d68eb9e3cb..5372d741bc76 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -939,9 +939,8 @@ static void dsi_14nm_dphy_set_timing(struct msm_dsi_phy *phy,
 }
 
 static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
-			       struct msm_dsi_phy_clk_request *clk_req)
+			       struct msm_dsi_dphy_timing *timing)
 {
-	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	u32 data;
 	int i;
 	int ret;
@@ -949,12 +948,6 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 	void __iomem *lane_base = phy->lane_base;
 	u32 glbl_test_ctrl;
 
-	if (msm_dsi_dphy_timing_calc_v2(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	data = 0x1c;
 	if (phy->usecase != MSM_DSI_PHY_STANDALONE)
 		data |= DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL(32);
@@ -1032,6 +1025,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v2,
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
@@ -1053,6 +1047,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v2,
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index e96d789aea18..b953fb19e292 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -64,9 +64,8 @@ static void dsi_20nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 }
 
 static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
-				struct msm_dsi_phy_clk_request *clk_req)
+			       struct msm_dsi_dphy_timing *timing)
 {
-	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	int i;
 	void __iomem *base = phy->base;
 	u32 cfg_4[4] = {0x20, 0x40, 0x20, 0x00};
@@ -74,12 +73,6 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	dsi_20nm_phy_regulator_ctrl(phy, true);
 
 	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
@@ -138,6 +131,7 @@ const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_20nm_phy_enable,
 		.disable = dsi_20nm_phy_disable,
 	},
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 3304acda2165..e39801d309ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -699,21 +699,14 @@ static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 }
 
 static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
-				struct msm_dsi_phy_clk_request *clk_req)
+			       struct msm_dsi_dphy_timing *timing)
 {
-	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	int i;
 	void __iomem *base = phy->base;
 	u32 val;
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	dsi_phy_write(base + REG_DSI_28nm_PHY_STRENGTH_0, 0xff);
 
 	dsi_28nm_phy_regulator_ctrl(phy, true);
@@ -775,6 +768,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
@@ -796,6 +790,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
@@ -817,6 +812,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 86e40a0d41a3..7d50822085f2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -590,19 +590,12 @@ static void dsi_28nm_phy_lane_config(struct msm_dsi_phy *phy)
 }
 
 static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
-				struct msm_dsi_phy_clk_request *clk_req)
+			       struct msm_dsi_dphy_timing *timing)
 {
-	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	void __iomem *base = phy->base;
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	dsi_28nm_phy_regulator_init(phy);
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LDO_CTRL, 0x04);
@@ -654,6 +647,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_8960_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..993508268a15 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -802,13 +802,12 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 }
 
 static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
-			      struct msm_dsi_phy_clk_request *clk_req)
+			      struct msm_dsi_dphy_timing *timing)
 {
 	int ret;
 	u32 status;
 	u32 const delay_us = 5;
 	u32 const timeout_us = 1000;
-	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	void __iomem *base = phy->base;
 	bool less_than_1500_mhz;
 	u32 vreg_ctrl_0, glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
@@ -817,12 +816,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc_v4(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	if (dsi_phy_hw_v4_0_is_pll_on(phy))
 		pr_warn("PLL turned on before configuring PHY\n");
 
@@ -838,7 +831,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* TODO: CPHY enable path (this is for DPHY only) */
 
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
-	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
+	less_than_1500_mhz = (timing->bitclk_rate <= 1500000000);
 
 	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
@@ -965,6 +958,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v4,
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
@@ -987,6 +981,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v4,
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
-- 
2.30.2

