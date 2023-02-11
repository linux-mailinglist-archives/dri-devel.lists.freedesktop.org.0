Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC07F692D16
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11C110EE5D;
	Sat, 11 Feb 2023 02:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AFC10ECE9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:13 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id sa10so20154041ejc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/odtgRC8gXVQFcVKJhLAyE/oCb0t1DJ/C0YFfe8wKQ=;
 b=OCGB2eywTztkh+PDzkuBsVkiZkHzFQAAYWfuHYJMnCqrOIK+ve/uSMy4io84YPDmWO
 BQur761Nl51+036LTBbzkYuM7k3kxsKQPeSFtDbddR6Z2dCYZYMVsP5h5aBm8w8AKPy3
 wANQvTO0wkWGFKbiF9LcxaOpS7PHiK5spen3cIdDDA5FvQs5j2GYnC++u+16PJzkFrRC
 SKBMpVIoxkwQqyw6EMmQEFbr6+5fYJLm5OpKcyX0AWuA9dQqiJf2Itk64wfxeIlnogbs
 hZSmxtTGBl29yQTuH5I4XM+kkb3kGJNnL5EgplLRYlzP9ZogIM9lihFd+oqXdVsJ+8KI
 yeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/odtgRC8gXVQFcVKJhLAyE/oCb0t1DJ/C0YFfe8wKQ=;
 b=qABJT2VZrqL67FxLJy9zXxiUazrOeimWZzqnYYw65MduboBn1Ncp3dr1Xr1LPUyMj6
 TTjh90GeduwVGgBj1VyVcXz0+jOGfPKTrgbp3hKgKD0SoL8U4Mlv7UnSq9i3D6i2zn3k
 VKrfv+zcUw0eo7r7hijwh2Y0Qs8pnibQQy0Y9gNEC4t1CFkNuUHTAKmIXt+29FJV3HH8
 x8h2Aozhdgi3/4BntDoUk8u61JmPAkIQJdyHVFjXNHb5JbzzJ1t/g98cniBwN0AY9LYd
 YnNgQmkLaiRM5t3YIeUldbhY93BseQgRO2tYX7FgFD+RWpsBc6BTzBnnRrT2xuW6r/4g
 l2fw==
X-Gm-Message-State: AO0yUKXH0WRu/3Y1tM9GJmPk743kumOzP9T0+nxlC5ZJ9rQNm+O+0URP
 PDSauwGxXr3AeuyCm4efbuTL7g==
X-Google-Smtp-Source: AK7set91rTDZfyiFq0E/4w01yGWR/tzZxypJdz79J7VAtWqk6PgTZmmNFfdQPXTCJRDvrLVtuHBGBg==
X-Received: by 2002:a17:906:af6a:b0:88a:7408:384c with SMTP id
 os10-20020a170906af6a00b0088a7408384cmr16424382ejb.47.1676081471781; 
 Fri, 10 Feb 2023 18:11:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 16/43] drm/msm/dpu: split SDM845 catalog entry to the separate
 file
Date: Sat, 11 Feb 2023 04:10:26 +0200
Message-Id: <20230211021053.1078648-17-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 203 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 208 +-----------------
 2 files changed, 204 insertions(+), 207 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
new file mode 100644
index 000000000000..cca9f58ec95c
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_4_0_SDM845_H
+#define _DPU_4_0_SDM845_H
+
+static const struct dpu_caps sdm845_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
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
+static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.highest_bank_bit = 0x2,
+};
+
+static const struct dpu_mdp_cfg sdm845_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x45c,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_ctl_cfg sdm845_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0xe4,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x1200, .len = 0xe4,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x1400, .len = 0xe4,
+	.features = 0,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x1600, .len = 0xe4,
+	.features = 0,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x1800, .len = 0xe4,
+	.features = 0,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+};
+
+static const struct dpu_sspp_cfg sdm845_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
+		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
+		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
+		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
+		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
+static const struct dpu_lm_cfg sdm845_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
+	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
+	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+};
+
+static const struct dpu_pingpong_cfg sdm845_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
+};
+
+static const struct dpu_dsc_cfg sdm845_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
+	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
+};
+
+static const struct dpu_intf_cfg sdm845_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+};
+
+static const struct dpu_perf_cfg sdm845_perf_data = {
+	.max_bw_low = 6800000,
+	.max_bw_high = 6800000,
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
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sdm845_qos_linear),
+		.entries = sdm845_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sdm845_qos_macrotile),
+		.entries = sdm845_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sdm845_qos_nrt),
+		.entries = sdm845_qos_nrt
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
+static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
+	.caps = &sdm845_dpu_caps,
+	.ubwc = &sdm845_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sdm845_mdp),
+	.mdp = sdm845_mdp,
+	.ctl_count = ARRAY_SIZE(sdm845_ctl),
+	.ctl = sdm845_ctl,
+	.sspp_count = ARRAY_SIZE(sdm845_sspp),
+	.sspp = sdm845_sspp,
+	.mixer_count = ARRAY_SIZE(sdm845_lm),
+	.mixer = sdm845_lm,
+	.pingpong_count = ARRAY_SIZE(sdm845_pp),
+	.pingpong = sdm845_pp,
+	.dsc_count = ARRAY_SIZE(sdm845_dsc),
+	.dsc = sdm845_dsc,
+	.intf_count = ARRAY_SIZE(sdm845_intf),
+	.intf = sdm845_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sdm845_regdma,
+	.perf = &sdm845_perf_data,
+	.mdss_irqs = IRQ_SDM845_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8b5819e066bf..c4d735472b09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -297,90 +297,6 @@ static const uint32_t wb2_formats[] = {
 	DRM_FORMAT_XBGR4444,
 };
 
-/*************************************************************
- * DPU sub blocks config
- *************************************************************/
-/* DPU top level caps */
-static const struct dpu_caps sdm845_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
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
-static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.highest_bank_bit = 0x2,
-};
-
-static const struct dpu_mdp_cfg sdm845_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x45C,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
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
-			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
-			.reg_off = 0x2C4, .bit_off = 8},
-	},
-};
-
-/*************************************************************
- * CTL sub blocks config
- *************************************************************/
-static const struct dpu_ctl_cfg sdm845_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0xE4,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0xE4,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0xE4,
-	.features = 0,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x1600, .len = 0xE4,
-	.features = 0,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x1800, .len = 0xE4,
-	.features = 0,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
-	},
-};
-
 /*************************************************************
  * SSPP sub blocks config
  *************************************************************/
@@ -480,25 +396,6 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
 	.clk_ctrl = _clkctrl \
 	}
 
-static const struct dpu_sspp_cfg sdm845_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
-		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
-		sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
-		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
-		sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
-};
-
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
 				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
 
@@ -599,21 +496,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-static const struct dpu_lm_cfg sdm845_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
-	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-};
-
 /* SC7180 */
 
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
@@ -713,21 +595,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.intr_rdptr = _rdptr, \
 	}
 
-static const struct dpu_pingpong_cfg sdm845_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
-};
-
 /*************************************************************
  * MERGE_3D sub blocks config
  *************************************************************/
@@ -749,13 +616,6 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	.features = _features, \
 	}
 
-static const struct dpu_dsc_cfg sdm845_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
-};
-
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -771,13 +631,6 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
 	}
 
-static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-};
-
 /*************************************************************
  * Writeback blocks config
  *************************************************************/
@@ -1000,70 +853,11 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 	{.fl = 0, .lut = 0x0},
 };
 
-static const struct dpu_perf_cfg sdm845_perf_data = {
-	.max_bw_low = 6800000,
-	.max_bw_high = 6800000,
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
-	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xf, 0xffff, 0x0},
-	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
-	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sdm845_qos_linear),
-		.entries = sdm845_qos_linear
-		},
-		{.nentry = ARRAY_SIZE(sdm845_qos_macrotile),
-		.entries = sdm845_qos_macrotile
-		},
-		{.nentry = ARRAY_SIZE(sdm845_qos_nrt),
-		.entries = sdm845_qos_nrt
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
 /*************************************************************
  * Hardware catalog
  *************************************************************/
 
-static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
-	.caps = &sdm845_dpu_caps,
-	.ubwc = &sdm845_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sdm845_mdp),
-	.mdp = sdm845_mdp,
-	.ctl_count = ARRAY_SIZE(sdm845_ctl),
-	.ctl = sdm845_ctl,
-	.sspp_count = ARRAY_SIZE(sdm845_sspp),
-	.sspp = sdm845_sspp,
-	.mixer_count = ARRAY_SIZE(sdm845_lm),
-	.mixer = sdm845_lm,
-	.pingpong_count = ARRAY_SIZE(sdm845_pp),
-	.pingpong = sdm845_pp,
-	.dsc_count = ARRAY_SIZE(sdm845_dsc),
-	.dsc = sdm845_dsc,
-	.intf_count = ARRAY_SIZE(sdm845_intf),
-	.intf = sdm845_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
-	.perf = &sdm845_perf_data,
-	.mdss_irqs = IRQ_SDM845_MASK,
-};
+#include "catalog/dpu_4_0_sdm845.h"
 
 #include "catalog/dpu_3_0_msm8998.h"
 
-- 
2.39.1

