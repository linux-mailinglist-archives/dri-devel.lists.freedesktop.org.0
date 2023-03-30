Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F126D112D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599BB10F05C;
	Thu, 30 Mar 2023 21:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B9C10F04F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x17so26404106lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBqUXR1haTFkXubxuwoecPQrKtij0Zdkq+VeOH9nGWM=;
 b=upQLAK9LDCSvirU3eKivC5/fRehO64SdutGsT8dIMvgniT7wu5WY5IGOhzQD78zCRb
 09XWo5ZUhbgymFiQdgOSQon33Dtbo+Rg1gRNsQtpGsottohud5XWc4fMYnVGE5bPIwtf
 uuUPt7vl/qmSzd9lcixd38QgoVT9KevioMl66Y7RRvpuXYu4xOkJGllXUUEdgQTnm5bA
 AP7uTRvrJ7vr2mvdq/oM/Y6PXNL8Mli7/xrn0y5NSZQLNrNH+VSWpPNvyP9slai88c4Q
 EyJnm1s/XebwzfRlEpCJ8fDh1QDRqRtW7aeMcjIoMe77dlsqKRyNsGarwzLmd2lokYbn
 1S0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBqUXR1haTFkXubxuwoecPQrKtij0Zdkq+VeOH9nGWM=;
 b=ysyP9to2+U3gww1N/6qMjDlcGu/qpD3EbxdMznWhIiSSV9qdyq0ejd8O5RsqyaVMVV
 Xy5gA9YQyS1gP7eNxAPjq+mK0WrF2MI7tfPDdlsVE3lQq6WLcewkdxbrVSlv5WBPn9ev
 nAdXdwq+lbu763BO4FDfRMtSbz7vzmH9+3KcwT/8k5UQI5DGB7/PCr6C0PCduDvV96tB
 SdCzCe8SwTG5JN3axybCgJ/kq4Ih0kJhnM87qljrC+RQivRrI5VE7EPtUlWAi240HGHU
 K3pkGlpveSt/qgRO0FmNX7Lq1C4XRt7GgDaDKtpUoOunRU2L3TfUQ1uZ6WLfRJ1ydYgE
 Gjjw==
X-Gm-Message-State: AAQBX9fnmRCivWNOVWX+4wTxfryQOhi5IeOsrggqEf4RuUJXzCyNJ72V
 2mXda3af5sNYLhUN9cd1hXXRWLte0M1mzWOtsXY=
X-Google-Smtp-Source: AKy350bROe+TvS/gaYK9lMOu0GTXw6JC6FEZNbQ8A71YXblCd7GSTfokhiowj40EAfcrbPiFEXO6og==
X-Received: by 2002:ac2:5929:0:b0:4b4:f9df:c6ab with SMTP id
 v9-20020ac25929000000b004b4f9dfc6abmr7215602lfi.60.1680213211202; 
 Thu, 30 Mar 2023 14:53:31 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:53:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 08/38] drm/msm/dpu: split SC7280 catalog entry to the
 separate file
Date: Fri, 31 Mar 2023 00:52:54 +0300
Message-Id: <20230330215324.1853304-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 148 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 144 +----------------
 2 files changed, 150 insertions(+), 142 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
new file mode 100644
index 000000000000..bdf1ec36f39f
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_7_2_SC7280_H
+#define _DPU_7_2_SC7280_H
+
+static const struct dpu_caps sc7280_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x7,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2400,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_30,
+	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x6,
+};
+
+static const struct dpu_mdp_cfg sc7280_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x2014,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_ctl_cfg sc7280_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+};
+
+static const struct dpu_sspp_cfg sc7280_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK_SDMA,
+		sc7280_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+};
+
+static const struct dpu_lm_cfg sc7280_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
+};
+
+static const struct dpu_pingpong_cfg sc7280_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+};
+
+static const struct dpu_intf_cfg sc7280_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
+};
+
+static const struct dpu_perf_cfg sc7280_perf_data = {
+	.max_bw_low = 4700000,
+	.max_bw_high = 8800000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
+	.caps = &sc7280_dpu_caps,
+	.ubwc = &sc7280_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sc7280_mdp),
+	.mdp = sc7280_mdp,
+	.ctl_count = ARRAY_SIZE(sc7280_ctl),
+	.ctl = sc7280_ctl,
+	.sspp_count = ARRAY_SIZE(sc7280_sspp),
+	.sspp = sc7280_sspp,
+	.dspp_count = ARRAY_SIZE(sc7180_dspp),
+	.dspp = sc7180_dspp,
+	.mixer_count = ARRAY_SIZE(sc7280_lm),
+	.mixer = sc7280_lm,
+	.pingpong_count = ARRAY_SIZE(sc7280_pp),
+	.pingpong = sc7280_pp,
+	.intf_count = ARRAY_SIZE(sc7280_intf),
+	.intf = sc7280_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sc7280_perf_data,
+	.mdss_irqs = IRQ_SC7280_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0ca1d5675151..bb5c76b621fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -428,16 +428,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_caps sc7280_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0x7,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.max_linewidth = 2400,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.highest_bank_bit = 0x2,
@@ -484,12 +474,6 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 };
 
-static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -650,21 +634,6 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sc7280_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x2014,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-		.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
-		.reg_off = 0x2C4, .bit_off = 8},
-	},
-};
-
 static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -845,33 +814,6 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	},
 };
 
-static const struct dpu_ctl_cfg sc7280_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-};
-
 static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -1093,17 +1035,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
-static const struct dpu_sspp_cfg sc7280_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK_SDMA,
-		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-};
-
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
 				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
@@ -1237,15 +1168,6 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
-static const struct dpu_lm_cfg sc7280_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
-};
-
 /* QCM2290 */
 
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
@@ -1430,13 +1352,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 			-1),
 };
 
-static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
-};
-
 static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1531,12 +1446,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
-static const struct dpu_intf_cfg sc7280_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
-};
-
 static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -2000,34 +1909,6 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sc7280_perf_data = {
-	.max_bw_low = 4700000,
-	.max_bw_high = 8800000,
-	.min_core_ib = 2500000,
-	.min_llcc_ib = 0,
-	.min_dram_ib = 1600000,
-	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
-	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
-	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
-		.entries = sc7180_qos_macrotile
-		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
-		.entries = sc7180_qos_macrotile
-		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
-		.entries = sc7180_qos_nrt
-		},
-	},
-	.cdp_cfg = {
-		{.rd_enable = 1, .wr_enable = 1},
-		{.rd_enable = 1, .wr_enable = 0}
-	},
-	.clk_inefficiency_factor = 105,
-	.bw_inefficiency_factor = 120,
-};
-
 static const struct dpu_perf_cfg sm8350_perf_data = {
 	.max_bw_low = 11800000,
 	.max_bw_high = 15500000,
@@ -2294,29 +2175,6 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8350_MASK,
 };
 
-static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
-	.caps = &sc7280_dpu_caps,
-	.ubwc = &sc7280_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc7280_mdp),
-	.mdp = sc7280_mdp,
-	.ctl_count = ARRAY_SIZE(sc7280_ctl),
-	.ctl = sc7280_ctl,
-	.sspp_count = ARRAY_SIZE(sc7280_sspp),
-	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
-	.mixer_count = ARRAY_SIZE(sc7280_lm),
-	.mixer = sc7280_lm,
-	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-	.pingpong = sc7280_pp,
-	.intf_count = ARRAY_SIZE(sc7280_intf),
-	.intf = sc7280_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.perf = &sc7280_perf_data,
-	.mdss_irqs = IRQ_SC7280_MASK,
-};
-
 static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.ubwc = &qcm2290_ubwc_cfg,
@@ -2340,6 +2198,8 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
 
+#include "catalog/dpu_7_2_sc7280.h"
+
 #include "catalog/dpu_8_0_sc8280xp.h"
 #include "catalog/dpu_8_1_sm8450.h"
 
-- 
2.39.2

