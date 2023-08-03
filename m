Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DD276FAEF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3DE10E698;
	Fri,  4 Aug 2023 07:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3010E108;
 Thu,  3 Aug 2023 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=/Fv6//zYQ8hHhjfzP+mBDrRjyPegam4EZOiBSMo8WDI=; 
 t=1691093336;x=1691183336; 
 b=z3e3HTsWtrOHrwZhF9TAZjPqF6EmIeM6EMlB9Qytz8q3FZ1EKSYDHDFaQxC6bGIEVgEQb8kuVE9TZutgljN32IaHiArwryJpBbYC7+P5vvzZsKWlv7llY31gHKQOstSWga6Jp104W6qwpwFkj3wqkIFMzzfPn31N7uW7vy8tH3I=;
Received: from [10.12.4.30] (port=37854 helo=smtp55.i.mail.ru)
 by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1qReIZ-00HFEd-PE; Thu, 03 Aug 2023 22:47:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=/Fv6//zYQ8hHhjfzP+mBDrRjyPegam4EZOiBSMo8WDI=; t=1691092071; x=1691182071; 
 b=akZd9QNCIQLv0DZu/oOBI8z9NaDOOmhvjpOOS2K8WUbgl1JONcgOPiBCrGOj6Dnw+nwib5JDag0
 ZdyYenWSKH6vmqpfPjjZnw4DAO011kO+W9sINKVEGVhXL2AmGChLOOVyjsREL6xMLNedL1hivijVH
 xvczhA3rkEZIUnjrS3g=;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1qReIP-000Y8b-0U; Thu, 03 Aug 2023 22:47:41 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 konrad.dybcio@linaro.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 andersson@kernel.org, quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com,
 quic_rmccann@quicinc.com, quic_jesszhan@quicinc.com, liushixin2@huawei.com
Subject: [PATCH 2/2] drm/msm/dpu: Add SM7150 support
Date: Thu,  3 Aug 2023 22:47:24 +0300
Message-ID: <20230803194724.154591-3-danila@jiaxyga.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803194724.154591-1-danila@jiaxyga.com>
References: <20230803194724.154591-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD969E04B5EED670DC86EE92E42F0C271DDDF6A6B73F41FC074182A05F53808504023C2F6D301898F6E0A7C06F167306F4C67F4D113E137A824A8502D4A2F1823D8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CB1C1CF81BFF4FD8EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637525B22DCF689D4638638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E998A34250954F66C2F14F2022333820117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCF77088377309FF52A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735200AC5B80A05675ACDBDFBBEFFF4125B51D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE437C869540D2AB0F269E641683F5DD3FD8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE3E6BDB36F057AC83C302FCEF25BFAB345C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407978DA827A17800CE705056152E029236E2DBA43225CD8A89F1B3F1E879BC1E2F16D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A52409681541621A36C6B9CF6467323EFFF2450E2079F45EA6F87CCE6106E1FC07E67D4AC08A07B9B0251EFD5447B32ED69C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF6A43A44C47494477AF85A435732593FA2067516DC6B94AA84CA6FAE112578A98D4FFD5EE53653998553022043D0BC9A4085C7A0F8E3792FFD9F7E1B811E80DCD8EBEDE01CE1B1DA4C41F94D744909CE4BCAC77546666B612CC0CD5AA9A1B9887EE09F5AAA95A50543082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojcir52QaMQ804yi0SdwB1iA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981B7B6FBA8BC57466699BFA8AA5DFE6DFAFFF4D93F285358E1643683D8C0F3ED1CA3C71A376745D86BBE86167304C7680C3980CE5AAA35C7CD60F22E8815EDE5EAEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4C2CC63398298511D1E4750FD930E01DF28F9632845AEBDC5049FFFDB7839CE9E588CC25E272B312A2D8694833E40EA1B6F9CBB237BCA508A46EA42ECDDC8E1D1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFd3RriuhA+6EboYtJCDiDjPg==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Approved-At: Fri, 04 Aug 2023 07:17:40 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 davidwronek@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, danila@jiaxyga.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add definitions for the display hardware used on the Qualcomm SM7150
platform.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 277 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 280 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
new file mode 100644
index 000000000000..5823879a705a
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -0,0 +1,277 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+#ifndef _DPU_5_2_SM7150_H
+#define _DPU_5_2_SM7150_H
+
+static const struct dpu_caps sm7150_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 4096,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg sm7150_mdp[] = {
+	{
+	.name = "top_0",
+	.base = 0x0, .len = 0x45c,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+	},
+};
+
+static const struct dpu_sspp_cfg sm7150_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x1f0,
+		.features = VIG_SDM845_MASK,
+		.sblk = &sm8250_vig_sblk_0,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x1f0,
+		.features = VIG_SDM845_MASK,
+		.sblk = &sm8250_vig_sblk_1,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG1,
+	}, {
+		.name = "sspp_2", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x1f0,
+		.features = DMA_SDM845_MASK,
+		.sblk = &sdm845_dma_sblk_0,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x1f0,
+		.features = DMA_SDM845_MASK,
+		.sblk = &sdm845_dma_sblk_1,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA1,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x1f0,
+		.features = DMA_CURSOR_SDM845_MASK,
+		.sblk = &sdm845_dma_sblk_2,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA2,
+	},
+};
+
+static const struct dpu_lm_cfg sm7150_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x0, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = 0,
+		.pingpong = PINGPONG_4,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x0, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = 0,
+		.pingpong = PINGPONG_5,
+	},
+};
+
+static const struct dpu_dspp_cfg sm7150_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg sm7150_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_SM8150_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		.intr_rdptr = -1,
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x70800, .len = 0xd4,
+		.features = PINGPONG_SM8150_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+		.intr_rdptr = -1,
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x71000, .len = 0xd4,
+		.features = PINGPONG_SM8150_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+		.intr_rdptr = -1,
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x71800, .len = 0xd4,
+		.features = PINGPONG_SM8150_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+		.intr_rdptr = -1,
+	},
+};
+
+static const struct dpu_merge_3d_cfg sm7150_merge_3d[] = {
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+	},
+};
+
+static const struct dpu_dsc_cfg sm7150_dsc[] = {
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+};
+
+static const struct dpu_wb_cfg sm7150_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+static const struct dpu_perf_cfg sm7150_perf_data = {
+	.max_bw_low = 7100000,
+	.max_bw_high = 7100000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
+		.entries = sm8150_qos_linear
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
+static const struct dpu_mdss_version sm7150_mdss_ver = {
+	.core_major_ver = 5,
+	.core_minor_ver = 2,
+};
+
+const struct dpu_mdss_cfg dpu_sm7150_cfg = {
+	.mdss_ver = &sm7150_mdss_ver,
+	.caps = &sm7150_dpu_caps,
+	.mdp = sm7150_mdp,
+	.ctl_count = ARRAY_SIZE(sm8150_ctl),
+	.ctl = sm8150_ctl,
+	.sspp_count = ARRAY_SIZE(sm7150_sspp),
+	.sspp = sm7150_sspp,
+	.mixer_count = ARRAY_SIZE(sm7150_lm),
+	.mixer = sm7150_lm,
+	.dspp_count = ARRAY_SIZE(sm7150_dspp),
+	.dspp = sm7150_dspp,
+	.pingpong_count = ARRAY_SIZE(sm7150_pp),
+	.pingpong = sm7150_pp,
+	.merge_3d_count = ARRAY_SIZE(sm7150_merge_3d),
+	.merge_3d = sm7150_merge_3d,
+	.dsc_count = ARRAY_SIZE(sm7150_dsc),
+	.dsc = sm7150_dsc,
+	.intf_count = ARRAY_SIZE(sm8150_intf),
+	.intf = sm8150_intf,
+	.wb_count = ARRAY_SIZE(sm7150_wb),
+	.wb = sm7150_wb,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sm7150_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ce369eeffa7d..fea1253cab0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -658,6 +658,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_5_0_sm8150.h"
 #include "catalog/dpu_5_1_sc8180x.h"
+#include "catalog/dpu_5_2_sm7150.h"
 #include "catalog/dpu_5_4_sm6125.h"
 
 #include "catalog/dpu_6_0_sm8250.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6c9634209e9f..86b354ef45e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -833,6 +833,7 @@ extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8150_cfg;
 extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
+extern const struct dpu_mdss_cfg dpu_sm7150_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
 extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
 extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa6ba2cf4b84..50ec008b7d56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1371,6 +1371,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sm6125-dpu", .data = &dpu_sm6125_cfg, },
 	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
 	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
+	{ .compatible = "qcom,sm7150-dpu", .data = &dpu_sm7150_cfg, },
 	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
 	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
 	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
-- 
2.41.0

