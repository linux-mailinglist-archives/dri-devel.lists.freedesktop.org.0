Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816427AC548
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 23:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E6C10E0AC;
	Sat, 23 Sep 2023 21:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29A410E0A9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 21:49:17 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50435a9f800so4928334e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 14:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695505756; x=1696110556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h3LK/+DDmKxZmHhTwv83jYc61iEDU8Twbs+wLsAAFnY=;
 b=Zvhz4puh+N3SJPZt9WCZsSL9+lYbzhfDd9J3g2VyHEAisJHpRkxbmINFuEWu1IUIx4
 6FiwGfduQkerqUlsr7Sc1QvzVwrncJWrUlayWRYgQqp7l7sJjfFiwtXEpCPM7ngnzE/D
 QtZaYrf9smWxph49sSE65I5CK6KRgzqA3yJzFKGVskNY+GBxJhUuhD/f3fMchHgmT/rc
 rNX0Kl9NCTOJRDKJkd6YTIoyBao1DFoSoB7ijAbbaNmuPsz3S1azLrvZpDonjL4b5Idt
 SWbkHvgsqKn2f+SYIK+B8VTjohu4fOzHlpgFb7/mCcYZj3J1Ojyub6hjwWd60/b3MeF4
 KUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695505756; x=1696110556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3LK/+DDmKxZmHhTwv83jYc61iEDU8Twbs+wLsAAFnY=;
 b=Vv+r2RmBzltqE/Vea8kYWebc30gYpquF9+ts5j/Uo2i4+g7mQpKcR8P/Iy8lJMs2LU
 GtgrA8qCKywRXIdgmv3Qz7Sl2cwdYoTdCRHb8VeQ7mnOnEtrc0FY/qFHRCbuoeDRQ6UT
 T8EWUJU1wNvCfncGs44JE+nZwBuxMpxOkhJz0V0HMdMkhUj0OYQMJwYFZZONcIBsnoCT
 IEIagcO35JcXRaDmH8NyRrWZb5DDHK+xvh/ZbsxPiCjXFUyDCxdCO4fwLQDfsUWJRmBG
 KGa/jfkN7eLx4yOsCNxbO2CvchthWvTG+mu8DfXqL3a5vR3UV68Uv12O8UjN7jivOgg2
 Y2Sg==
X-Gm-Message-State: AOJu0Yy3zf18OZpbSA7yqzOEPfF+loCkd6uAoVccC79C9woBLDcsCROu
 WX87TNN7tvFRAl7DEhOfdWNJQg==
X-Google-Smtp-Source: AGHT+IHN57NOsh6CDjnC6MqQeA8kBDXKxokILFskeyzznTqQNQS++gYrFm+gjpkzsQmn7B+zHkpYTA==
X-Received: by 2002:a05:6512:3a8b:b0:4fb:911b:4e19 with SMTP id
 q11-20020a0565123a8b00b004fb911b4e19mr3335957lfu.35.1695505756096; 
 Sat, 23 Sep 2023 14:49:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a19520c000000b004fe0760354bsm1196590lfb.275.2023.09.23.14.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 14:49:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFC PATCH 3/3] drm/msm/dpu: add support for MSM8917
Date: Sun, 24 Sep 2023 00:49:12 +0300
Message-Id: <20230923214912.1095024-4-dmitry.baryshkov@linaro.org>
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

Experimental support for MSM8917, which has MDP5 v1.15. It looks like
trimmed down version of MSM8937. Even fewer PP, LM and no DSI1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_1_15_msm8917.h  | 190 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 193 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
new file mode 100644
index 000000000000..478066a95a00
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DPU_1_14_MSM8917_H
+#define _DPU_1_14_MSM8917_H
+
+static const struct dpu_caps msm8917_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
+	.pixel_ram_size = 16 * 1024,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg msm8917_mdp[] = {
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
+static const struct dpu_ctl_cfg msm8917_ctl[] = {
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
+static const struct dpu_sspp_cfg msm8917_sspp[] = {
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
+static const struct dpu_lm_cfg msm8917_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.sblk = &msm8998_lm_sblk,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+};
+
+static const struct dpu_pingpong_cfg msm8917_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+	},
+};
+
+static const struct dpu_dspp_cfg msm8917_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	},
+};
+
+static const struct dpu_intf_cfg msm8917_intf[] = {
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x268,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 14,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	},
+};
+
+static const struct dpu_perf_cfg msm8917_perf_data = {
+	.max_bw_low = 1800000,
+	.max_bw_high = 1800000,
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
+	.min_prefill_lines = 21,
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
+static const struct dpu_mdss_version msm8917_mdss_ver = {
+	.core_major_ver = 1,
+	.core_minor_ver = 15,
+};
+
+const struct dpu_mdss_cfg dpu_msm8917_cfg = {
+	.mdss_ver = &msm8917_mdss_ver,
+	.caps = &msm8917_dpu_caps,
+	.mdp = msm8917_mdp,
+	.ctl_count = ARRAY_SIZE(msm8917_ctl),
+	.ctl = msm8917_ctl,
+	.sspp_count = ARRAY_SIZE(msm8917_sspp),
+	.sspp = msm8917_sspp,
+	.mixer_count = ARRAY_SIZE(msm8917_lm),
+	.mixer = msm8917_lm,
+	.dspp_count = ARRAY_SIZE(msm8917_dspp),
+	.dspp = msm8917_dspp,
+	.pingpong_count = ARRAY_SIZE(msm8917_pp),
+	.pingpong = msm8917_pp,
+	.intf_count = ARRAY_SIZE(msm8917_intf),
+	.intf = msm8917_intf,
+	.vbif_count = ARRAY_SIZE(msm8996_vbif),
+	.vbif = msm8996_vbif,
+	.perf = &msm8917_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 392ba30d30b7..822819fcf244 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -717,6 +717,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_1_7_msm8996.h"
 #include "catalog/dpu_1_14_msm8937.h"
+#include "catalog/dpu_1_15_msm8917.h"
 #include "catalog/dpu_1_16_msm8953.h"
 
 #include "catalog/dpu_3_0_msm8998.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a9a12580c8c6..90510653c932 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -822,6 +822,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 };
 
+extern const struct dpu_mdss_cfg dpu_msm8917_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index cebfa6945e9c..f66dd61dfd8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1415,6 +1415,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,msm8917-mdp5", .data = &dpu_msm8917_cfg, },
 	{ .compatible = "qcom,msm8937-mdp5", .data = &dpu_msm8937_cfg, },
 	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },
 	{ .compatible = "qcom,msm8996-mdp5", .data = &dpu_msm8996_cfg, },
-- 
2.39.2

