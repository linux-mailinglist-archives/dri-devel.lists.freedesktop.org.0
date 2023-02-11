Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD8692D0D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FE910EE51;
	Sat, 11 Feb 2023 02:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCFB10ECE9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qb15so18131371ejc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjmH2BTUiGhT73az5KchMgK1AxlFbVJaG3r1Et6DIO8=;
 b=uf8xQl3TMilBVJvlirV+lc9vlJT98lIJP+9L7VAngLp+zdIhTw3lhTAV7bSgD7ph+Y
 R8oA6LaO6pVbgCQh8tI81+G/PZq7O2S76OIL3xwUVkIWLby+xmqaf9J9+icPQQB/n0N/
 v/BBbGQCGuO6pCdviTzwNAhmRP2JWXlEoeJ1BFQcrzRY0/djBhIm5PvFxdT/XeUOBw5m
 oNn57/ZCvMxfql647Xyl0KQaQjHj8Gbp4+hWptQMf+J77Gy63DNc+2X+xZnA76l8LDD6
 olVJ5sVu37gevjD1G6FUlZJim8sv/G/8bODz/Ijkw6P6hgOolaGz4BPwX95/2xthAnDw
 JVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FjmH2BTUiGhT73az5KchMgK1AxlFbVJaG3r1Et6DIO8=;
 b=sxGntZrEG4RaSGmg/6FtTCZsKGIIMGkxXq2+1xtRYbcCUGp2uBFIr8/gOIkb+IWhiZ
 zAokpOW33VM1zBrG3IVYiTA2oWloYRdggzO5S2hUTYo1hkd7+KIjXnJtJO5+xD/+6tYW
 oiK8Mp2/OKvbU7RjeXmRJ/f1kW6vST5CFm7cAR6nCfx3GiOx6jxqfsZP+m90VE4ll6Ub
 g0pOZczBH4lbgb3vM+J9cy4WbA4RPpn5r/4CUOszTOt3LhbBumoKcEgoMkDfucW82Exk
 WsrwFTgr7t/oc5AYfWAl/xnv3ziUD6vGYs0EIIkxXeCL8SgUIhjY2Q/rVczJDb8ZrKMi
 WbAg==
X-Gm-Message-State: AO0yUKVBchknqip7R/AXineZ7lETl+8O9DSaLvgKY6RE2j5qaB6RvxaY
 xIy2IRp1iyvnzi9kJwwYrsIOOQ==
X-Google-Smtp-Source: AK7set9uAHOVvwdrCnoyTmsc5829CYB8CtYycY7X5MTcrI7mWD5d7u1c+uEJN+IQ+1Z9+uMf6Sj8Pg==
X-Received: by 2002:a17:907:62a1:b0:86f:64bb:47eb with SMTP id
 nd33-20020a17090762a100b0086f64bb47ebmr24552787ejc.3.1676081470659; 
 Fri, 10 Feb 2023 18:11:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 15/43] drm/msm/dpu: split MSM8998 catalog entry to the
 separate file
Date: Sat, 11 Feb 2023 04:10:25 +0200
Message-Id: <20230211021053.1078648-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 189 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 191 +-----------------
 2 files changed, 191 insertions(+), 189 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
new file mode 100644
index 000000000000..5971e6360650
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -0,0 +1,189 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_3_0_MSM8998_H
+#define _DPU_3_0_MSM8998_H
+
+static const struct dpu_caps msm8998_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x7,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_10,
+	.highest_bank_bit = 0x2,
+};
+
+static const struct dpu_mdp_cfg msm8998_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x458,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 12 },
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 15 },
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x3b0, .bit_off = 15 },
+	},
+};
+
+static const struct dpu_ctl_cfg msm8998_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x94,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x1200, .len = 0x94,
+	.features = 0,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x1400, .len = 0x94,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x1600, .len = 0x94,
+	.features = 0,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x1800, .len = 0x94,
+	.features = 0,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+};
+
+static const struct dpu_sspp_cfg msm8998_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
+		msm8998_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
+		msm8998_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
+		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
+		msm8998_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_MSM8998_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_MSM8998_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_MSM8998_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_MSM8998_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
+static const struct dpu_lm_cfg msm8998_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
+		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
+		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
+		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
+		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
+		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
+		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
+};
+
+static const struct dpu_dspp_cfg msm8998_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
+		 &msm8998_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
+		 &msm8998_dspp_sblk),
+};
+
+static const struct dpu_intf_cfg msm8998_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+};
+
+static const struct dpu_perf_cfg msm8998_perf_data = {
+	.max_bw_low = 6700000,
+	.max_bw_high = 6700000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.undersized_prefill_lines = 2,
+	.xtra_prefill_lines = 2,
+	.dest_scale_prefill_lines = 3,
+	.macrotile_prefill_lines = 4,
+	.yuv_nv12_prefill_lines = 8,
+	.linear_prefill_lines = 1,
+	.downscaling_prefill_lines = 1,
+	.amortizable_threshold = 25,
+	.min_prefill_lines = 25,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfffc, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(msm8998_qos_linear),
+		.entries = msm8998_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(msm8998_qos_macrotile),
+		.entries = msm8998_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(msm8998_qos_nrt),
+		.entries = msm8998_qos_nrt
+		},
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 200,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
+	.caps = &msm8998_dpu_caps,
+	.ubwc = &msm8998_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(msm8998_mdp),
+	.mdp = msm8998_mdp,
+	.ctl_count = ARRAY_SIZE(msm8998_ctl),
+	.ctl = msm8998_ctl,
+	.sspp_count = ARRAY_SIZE(msm8998_sspp),
+	.sspp = msm8998_sspp,
+	.mixer_count = ARRAY_SIZE(msm8998_lm),
+	.mixer = msm8998_lm,
+	.dspp_count = ARRAY_SIZE(msm8998_dspp),
+	.dspp = msm8998_dspp,
+	.pingpong_count = ARRAY_SIZE(sdm845_pp),
+	.pingpong = sdm845_pp,
+	.intf_count = ARRAY_SIZE(msm8998_intf),
+	.intf = msm8998_intf,
+	.vbif_count = ARRAY_SIZE(msm8998_vbif),
+	.vbif = msm8998_vbif,
+	.reg_dma_count = 0,
+	.perf = &msm8998_perf_data,
+	.mdss_irqs = IRQ_SM8250_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c80de77cb112..8b5819e066bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -301,21 +301,6 @@ static const uint32_t wb2_formats[] = {
  * DPU sub blocks config
  *************************************************************/
 /* DPU top level caps */
-static const struct dpu_caps msm8998_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0x7,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
-	.has_src_split = true,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.has_3d_merge = true,
-	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-	.max_hdeci_exp = MAX_HORZ_DECIMATION,
-	.max_vdeci_exp = MAX_VERT_DECIMATION,
-};
-
 static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
@@ -331,44 +316,11 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_10,
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_mdp_cfg msm8998_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x458,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-			.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-			.reg_off = 0x2B4, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
-			.reg_off = 0x2BC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
-			.reg_off = 0x2C4, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-			.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
-			.reg_off = 0x2C4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
-			.reg_off = 0x2C4, .bit_off = 12},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
-			.reg_off = 0x3A8, .bit_off = 15},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
-			.reg_off = 0x3B0, .bit_off = 15},
-	},
-};
-
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -396,39 +348,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
-static const struct dpu_ctl_cfg msm8998_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x94,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0x94,
-	.features = 0,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0x94,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x1600, .len = 0x94,
-	.features = 0,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x1800, .len = 0x94,
-	.features = 0,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
-	},
-};
-
 static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -561,25 +480,6 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
 	.clk_ctrl = _clkctrl \
 	}
 
-static const struct dpu_sspp_cfg msm8998_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
-		msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
-		msm8998_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
-		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
-		msm8998_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_MSM8998_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
-};
-
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
 		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -688,21 +588,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-static const struct dpu_lm_cfg msm8998_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
-};
-
 /* SDM845 */
 
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
@@ -777,13 +662,6 @@ static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
 		.sblk = _sblk \
 		}
 
-static const struct dpu_dspp_cfg msm8998_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
-		 &msm8998_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
-		 &msm8998_dspp_sblk),
-};
-
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
@@ -893,13 +771,6 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
 	}
 
-static const struct dpu_intf_cfg msm8998_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-};
-
 static const struct dpu_intf_cfg sdm845_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -1129,42 +1000,6 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 	{.fl = 0, .lut = 0x0},
 };
 
-static const struct dpu_perf_cfg msm8998_perf_data = {
-	.max_bw_low = 6700000,
-	.max_bw_high = 6700000,
-	.min_core_ib = 2400000,
-	.min_llcc_ib = 800000,
-	.min_dram_ib = 800000,
-	.undersized_prefill_lines = 2,
-	.xtra_prefill_lines = 2,
-	.dest_scale_prefill_lines = 3,
-	.macrotile_prefill_lines = 4,
-	.yuv_nv12_prefill_lines = 8,
-	.linear_prefill_lines = 1,
-	.downscaling_prefill_lines = 1,
-	.amortizable_threshold = 25,
-	.min_prefill_lines = 25,
-	.danger_lut_tbl = {0xf, 0xffff, 0x0},
-	.safe_lut_tbl = {0xfffc, 0xff00, 0xffff},
-	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(msm8998_qos_linear),
-		.entries = msm8998_qos_linear
-		},
-		{.nentry = ARRAY_SIZE(msm8998_qos_macrotile),
-		.entries = msm8998_qos_macrotile
-		},
-		{.nentry = ARRAY_SIZE(msm8998_qos_nrt),
-		.entries = msm8998_qos_nrt
-		},
-	},
-	.cdp_cfg = {
-		{.rd_enable = 1, .wr_enable = 1},
-		{.rd_enable = 1, .wr_enable = 0}
-	},
-	.clk_inefficiency_factor = 200,
-	.bw_inefficiency_factor = 120,
-};
-
 static const struct dpu_perf_cfg sdm845_perf_data = {
 	.max_bw_low = 6800000,
 	.max_bw_high = 6800000,
@@ -1205,30 +1040,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
  * Hardware catalog
  *************************************************************/
 
-static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
-	.caps = &msm8998_dpu_caps,
-	.ubwc = &msm8998_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(msm8998_mdp),
-	.mdp = msm8998_mdp,
-	.ctl_count = ARRAY_SIZE(msm8998_ctl),
-	.ctl = msm8998_ctl,
-	.sspp_count = ARRAY_SIZE(msm8998_sspp),
-	.sspp = msm8998_sspp,
-	.mixer_count = ARRAY_SIZE(msm8998_lm),
-	.mixer = msm8998_lm,
-	.dspp_count = ARRAY_SIZE(msm8998_dspp),
-	.dspp = msm8998_dspp,
-	.pingpong_count = ARRAY_SIZE(sdm845_pp),
-	.pingpong = sdm845_pp,
-	.intf_count = ARRAY_SIZE(msm8998_intf),
-	.intf = msm8998_intf,
-	.vbif_count = ARRAY_SIZE(msm8998_vbif),
-	.vbif = msm8998_vbif,
-	.reg_dma_count = 0,
-	.perf = &msm8998_perf_data,
-	.mdss_irqs = IRQ_SM8250_MASK,
-};
-
 static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.caps = &sdm845_dpu_caps,
 	.ubwc = &sdm845_ubwc_cfg,
@@ -1254,6 +1065,8 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.mdss_irqs = IRQ_SDM845_MASK,
 };
 
+#include "catalog/dpu_3_0_msm8998.h"
+
 #include "catalog/dpu_5_0_sm8150.h"
 #include "catalog/dpu_5_1_sc8180x.h"
 
-- 
2.39.1

