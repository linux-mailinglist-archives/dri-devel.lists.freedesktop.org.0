Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD86E9EC0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E242E10ED14;
	Thu, 20 Apr 2023 22:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F7610ED05
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:26:01 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4ec8da7aaf8so947972e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029559; x=1684621559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+rLH8zLsEJhOLQJivlTKfknlKfd1owOcPQWGe3hRNs0=;
 b=N4rVO7IIGt1D/KgQt7qp/rDDLnbckOhgzMygrIULaovIEMMkNcd0lCOaSmMDWdyLLz
 4KNOH8ZfkRqUin+Ne4lvrRxlFhYSxvuMyqjBktqCRxVxDAIt5RG645WbyMOnaxasFMdK
 39wsCsl+j3eVOyfD+5q2lLCRE3vKH8xJKxBXYKbNAR1rHHBbghDD1U61wPNI/xex5Rf5
 mjYWA0J/5/WtvMAdPhZ1D/k0oV78CPL1ZoAwXjLAlpocZ+K7LbwpqS8mBlV7Bcvr6wRS
 p6FTKHKoVbWJAvN3xjNFNFU+7AmGVzKqysEHo5S0bvy7OZRoFtZPtlfVWwvqRN2YMgOy
 W34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029559; x=1684621559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+rLH8zLsEJhOLQJivlTKfknlKfd1owOcPQWGe3hRNs0=;
 b=MB6ghkN/bhKEcd+1f5hLJX4Fw59nXAh+S/UC+DeF26zOhOBevJ+STVZiIOVDL8/xw8
 MegUOj/FQHR9qdv4PGj04AbIXaneeSSM5svLGJYYPuKqLYLcbJZSZcolfHj2eWUMET8D
 IyZ8+5FUNsbH8FCPIzXM+wVYh+yPFyS4VPFDnCE3+9BDLycbA5tbujza5gQXUNyeqbwE
 0pHmmiZm+2XyuZYSXO84MuXewWxbW0U9H6Xeftot02LhO9r7bTT5UoOhkEIXxHL8dWnG
 MJJ1TzXLbmB5WeWJKWwA5Qv44rRj5ugr/RTKWoiE5sL3XhxGEivhZf4tt4bLUx6uKmiu
 0VZw==
X-Gm-Message-State: AAQBX9cT8mfMIH7QIHmoBDSixNmdLwNN5Gv0cV9no5NnFPqADlwT6fZp
 obsk0bqrQtcaScja7hDkhQWneftwohTrKp/ZcTY=
X-Google-Smtp-Source: AKy350aRYfpGlOX/mJ09WdBiY/D6X8vTHzokImpwc9TO8NYhmo8R03jvfEwJvLh2rlnheajh6T9wJw==
X-Received: by 2002:a19:f70f:0:b0:4ec:a4b4:627b with SMTP id
 z15-20020a19f70f000000b004eca4b4627bmr749205lfe.14.1682029559415; 
 Thu, 20 Apr 2023 15:25:59 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f21-20020ac251b5000000b004cb45148027sm347567lfk.203.2023.04.20.15.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:25:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/2] drm/msm/dpu: drop the regdma configuration
Date: Fri, 21 Apr 2023 01:25:57 +0300
Message-Id: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The regdma is currently not used by the current driver. We have no way
to practically verify that the regdma is described correctly. Drop it
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  1 -
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  2 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  2 -
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  2 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 40 -------------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 18 ---------
 12 files changed, 77 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 2b3ae84057df..02e9b26b49b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -195,7 +195,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.intf = msm8998_intf,
 	.vbif_count = ARRAY_SIZE(msm8998_vbif),
 	.vbif = msm8998_vbif,
-	.reg_dma_count = 0,
 	.perf = &msm8998_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ceca741e93c9..63009435e258 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -193,8 +193,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.intf = sdm845_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &sdm845_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 282d410269ff..e17398f98734 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -220,8 +220,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.intf = sm8150_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8150_regdma,
 	.perf = &sm8150_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c57400265f28..d32f939e9c00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -198,8 +198,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.intf = sc8180x_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8150_regdma,
 	.perf = &sc8180x_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 2c40229ea515..f49fc1690b71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -228,8 +228,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.vbif = sdm845_vbif,
 	.wb_count = ARRAY_SIZE(sm8250_wb),
 	.wb = sm8250_wb,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8250_regdma,
 	.perf = &sm8250_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 8799ed757119..0a273ba8cf4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -143,8 +143,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.wb = sc7180_wb,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &sc7180_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index ca107ca8de46..865dc51d0fe5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -211,8 +211,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.intf = sm8350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9aab110b8c44..1ac7ad2ba0da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -202,8 +202,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 02a259b6b426..41c326fc3792 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -219,8 +219,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8450_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 9e403034093f..e60ebb6242e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -224,8 +224,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.intf = sm8550_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8550_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 03f162af1a50..57b3c495aeb5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -650,46 +650,6 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	},
 };
 
-static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
-	.base = 0x0,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sdm845_regdma = {
-	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
-};
-
-static const struct dpu_reg_dma_cfg sm8150_regdma = {
-	.base = 0x0, .version = 0x00010001, .trigger_sel_off = 0x119c
-};
-
-static const struct dpu_reg_dma_cfg sm8250_regdma = {
-	.base = 0x0,
-	.version = 0x00010002,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sm8350_regdma = {
-	.base = 0x400,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sm8450_regdma = {
-	.base = 0x0,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
 /*************************************************************
  * PERF data config
  *************************************************************/
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd56fd7..8d62c21b051a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -720,21 +720,6 @@ struct dpu_vbif_cfg {
 	u32 memtype_count;
 	u32 memtype[MAX_XIN_COUNT];
 };
-/**
- * struct dpu_reg_dma_cfg - information of lut dma blocks
- * @id                 enum identifying this block
- * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
- * @version            version of lutdma hw block
- * @trigger_sel_off    offset to trigger select registers of lutdma
- */
-struct dpu_reg_dma_cfg {
-	DPU_HW_BLK_INFO;
-	u32 version;
-	u32 trigger_sel_off;
-	u32 xin_id;
-	enum dpu_clk_ctrl_type clk_ctrl;
-};
 
 /**
  * Define CDP use cases
@@ -850,9 +835,6 @@ struct dpu_mdss_cfg {
 	u32 wb_count;
 	const struct dpu_wb_cfg *wb;
 
-	u32 reg_dma_count;
-	const struct dpu_reg_dma_cfg *dma_cfg;
-
 	u32 ad_count;
 
 	u32 dspp_count;
-- 
2.39.2

