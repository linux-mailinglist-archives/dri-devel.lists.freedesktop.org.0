Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326C7AC545
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 23:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ECC10E008;
	Sat, 23 Sep 2023 21:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA2110E008
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 21:49:16 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5041bb9ce51so6468204e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695505754; x=1696110554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zd/p7hUaMy9wUcuQk7nxrnkcy0U5hwCj34ONz3ZwYQE=;
 b=kyZj3b9TKES5H6rGmO2jfhNpp3pOSHudegRRf6AuZebVz16kz9YinyJL/qJqPLMuv/
 6qqYEWGbafAkq3dqvn7HeEEy0JYgA4uQ56uNp0zC+XACTLv28k2vvsadIJK6jH/RQOhB
 dr2+8IOqvMViBN6qEcQRH1HBY4qrDDJFrZNKZxtwaLFtRsBIysG7wOS97O9XSL1xgE6F
 s+OgYCXhYZ+1bvkgIaxuvdM09IvN9HstWmhTwyWtxRyhkW29kVwtfIeJYzc7sSWF+F4u
 +C7UtpXzEZO5QCDD1XM+mH+kOiHzdqVP9cPOSORm1muGN7g8lEhA3JAxNrNOOyrRMCxR
 UyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695505754; x=1696110554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zd/p7hUaMy9wUcuQk7nxrnkcy0U5hwCj34ONz3ZwYQE=;
 b=p4U5b2K9SxCchZuE8TGZna+XFqx7xb2W4sbqwesAyr2C3r552MvhMRigiLkLxpit8t
 y1hY/Py3LKXwFTTmRQlnQqKN7ZjyhIAkaJ4nBkFTLjFbDTAuiZD2soIVkmArx8ab4iGC
 KSdVZKXpIhW9CLHdEjFvnS4K9joNHFGjjPZcSh/JrIEwk5+/zAwAzqWXiHGSPnqoJ0Hc
 yAbuoj7aqO5pEKvErZxYMEbm3N7749PTFBUp82i3k3mzdqFwBbIHemZz6b047DQr01fR
 3VREUoSBLi/fAhF2uBXHiX9sVJBbegjRFzYw5hQzNMdbYaCtmR73E6xcgvKMsp0cmpA8
 RNlg==
X-Gm-Message-State: AOJu0YwTyHR/Ui8FAZdWDBsdzDiT5yK1UHl6zf2neRgnP40sy82Q+Uo2
 3rUthPEg/piwNj6KGUYpSCRc9w==
X-Google-Smtp-Source: AGHT+IFTq5RWvHXcYWeZUNROsQs5qqaQ0lOB5ghYa/PQMQ3+8Rl18GjDmxrRgyWrrYi6ax0yecQEZg==
X-Received: by 2002:a19:770c:0:b0:503:3281:2ffd with SMTP id
 s12-20020a19770c000000b0050332812ffdmr2006072lfc.41.1695505754294; 
 Sat, 23 Sep 2023 14:49:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a19520c000000b004fe0760354bsm1196590lfb.275.2023.09.23.14.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 14:49:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFC PATCH 1/3] drm/msm/dpu: add support for MSM8953
Date: Sun, 24 Sep 2023 00:49:10 +0300
Message-Id: <20230923214912.1095024-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
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

Experimental support for MSM8953, which has MDP5 v1.16. It looks like
trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
etc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_1_16_msm8953.h  | 221 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  12 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 235 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
new file mode 100644
index 000000000000..6944bfa4568a
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DPU_1_16_MSM8953_H
+#define _DPU_1_16_MSM8953_H
+
+static const struct dpu_caps msm8953_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
+	.pixel_ram_size = 40 * 1024,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg msm8953_mdp[] = {
+	{
+		.name = "top_0",
+		.base = 0x0, .len = 0x454,
+		.features = BIT(DPU_MDP_VSYNC_SEL),
+		.clk_ctrls = {
+			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
+			[DPU_CLK_CTRL_RGB1] = { .reg_off = 0x2b4, .bit_off = 4 },
+			[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+			[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
+		},
+	},
+};
+
+static const struct dpu_ctl_cfg msm8953_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+};
+
+static const struct dpu_sspp_cfg msm8953_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x150,
+		.features = VIG_MSM8953_MASK,
+		.sblk = &dpu_vig_sblk_qseed2,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_4", .id = SSPP_RGB0,
+		.base = 0x14000, .len = 0x150,
+		.features = RGB_MSM8953_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB0,
+	}, {
+		.name = "sspp_5", .id = SSPP_RGB1,
+		.base = 0x16000, .len = 0x150,
+		.features = RGB_MSM8953_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB1,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x150,
+		.features = DMA_MSM8953_MASK | BIT(DPU_SSPP_CURSOR),
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 2,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	},
+};
+
+static const struct dpu_lm_cfg msm8953_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+	},
+};
+
+static const struct dpu_pingpong_cfg msm8953_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x70800, .len = 0xd4,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
+	},
+};
+
+static const struct dpu_dspp_cfg msm8953_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	},
+};
+
+static const struct dpu_intf_cfg msm8953_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x268,
+		.type = INTF_NONE,
+		.prog_fetch_lines_worst_case = 14,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x268,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 14,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x268,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 14,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = -1,
+	},
+};
+
+static const struct dpu_perf_cfg msm8953_perf_data = {
+	.max_bw_low = 3400000,
+	.max_bw_high = 3400000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 0, /* No LLCC on this SoC */
+	.min_dram_ib = 800000,
+	.undersized_prefill_lines = 2,
+	.xtra_prefill_lines = 2,
+	.dest_scale_prefill_lines = 3,
+	.macrotile_prefill_lines = 4,
+	.yuv_nv12_prefill_lines = 8,
+	.linear_prefill_lines = 1,
+	.downscaling_prefill_lines = 1,
+	.amortizable_threshold = 25,
+	.min_prefill_lines = 14,
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
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version msm8953_mdss_ver = {
+	.core_major_ver = 1,
+	.core_minor_ver = 16,
+};
+
+const struct dpu_mdss_cfg dpu_msm8953_cfg = {
+	.mdss_ver = &msm8953_mdss_ver,
+	.caps = &msm8953_dpu_caps,
+	.mdp = msm8953_mdp,
+	.ctl_count = ARRAY_SIZE(msm8953_ctl),
+	.ctl = msm8953_ctl,
+	.sspp_count = ARRAY_SIZE(msm8953_sspp),
+	.sspp = msm8953_sspp,
+	.mixer_count = ARRAY_SIZE(msm8953_lm),
+	.mixer = msm8953_lm,
+	.dspp_count = ARRAY_SIZE(msm8953_dspp),
+	.dspp = msm8953_dspp,
+	.pingpong_count = ARRAY_SIZE(msm8953_pp),
+	.pingpong = msm8953_pp,
+	.intf_count = ARRAY_SIZE(msm8953_intf),
+	.intf = msm8953_intf,
+	.vbif_count = ARRAY_SIZE(msm8996_vbif),
+	.vbif = msm8996_vbif,
+	.perf = &msm8953_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5446a86308bf..20e31115e26d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,6 +21,11 @@
 	(VIG_BASE_MASK | \
 	BIT(DPU_SSPP_CSC_10BIT))
 
+#define VIG_MSM8953_MASK \
+	(BIT(DPU_SSPP_QOS) |\
+	 BIT(DPU_SSPP_SCALER_QSEED2) |\
+	 BIT(DPU_SSPP_CSC))
+
 #define VIG_MSM8996_MASK \
 	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_CDP) |\
 	 BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_SCALER_QSEED2) |\
@@ -37,6 +42,9 @@
 
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
+#define DMA_MSM8953_MASK \
+	(BIT(DPU_SSPP_QOS))
+
 #define DMA_MSM8996_MASK \
 	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_CDP))
 
@@ -71,6 +79,9 @@
 #define DMA_CURSOR_MSM8998_MASK \
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
+#define RGB_MSM8953_MASK \
+	(BIT(DPU_SSPP_QOS))
+
 #define RGB_MSM8996_MASK \
 	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_CDP) |\
 	 BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_SCALER_RGB))
@@ -705,6 +716,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
  *************************************************************/
 
 #include "catalog/dpu_1_7_msm8996.h"
+#include "catalog/dpu_1_16_msm8953.h"
 
 #include "catalog/dpu_3_0_msm8998.h"
 #include "catalog/dpu_3_2_sdm660.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8c3c6cd2a186..58891a19d2b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -822,6 +822,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 };
 
+extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm630_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 288458dcf234..5099618bfe11 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1415,6 +1415,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },
 	{ .compatible = "qcom,msm8996-mdp5", .data = &dpu_msm8996_cfg, },
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
 	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
-- 
2.39.2

