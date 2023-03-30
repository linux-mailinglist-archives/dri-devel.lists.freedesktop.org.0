Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F286D0365
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07B410E1FA;
	Thu, 30 Mar 2023 11:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ED710E255
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:39:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id c9so13685385lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680176342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1kPk/VhV4NHAmUkP6QZOIoVadM8s2vLlHZ58S8BhK9c=;
 b=WqY/ZEnBjj4/QyQZXpXS2kQKTzR4JEEhoxJPJqvs9hxfX8pbCWIxDBtJZWesTTggHx
 UaLDp4uq/x23dj9aaOyzeiNFiEVvigPSRHEb++TzugYKNbdQhs0Jo+JHJTvL4cxjfkGM
 qYxmi99C9hSzDfztBRKgnAZARjhXUX1hrgIbV0LjBosc6qjceOLBMUOdXReHPGLsyJeA
 y6CYqer3432YDpwURheKs8zdprzgfNpxact5VAQ75ipGyK8TtCFX9sj8SMRZ7ryGLNXT
 lo31iE0cmUrL5c7E2ACYHCe8UDiW0lfFmdmM72AGzmAGL1lIrcKAF9rrHXnGw7D9bNG1
 G4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680176342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1kPk/VhV4NHAmUkP6QZOIoVadM8s2vLlHZ58S8BhK9c=;
 b=mYDcIseeKZkov36ZgSYT3ktfpL3roTT/BGTC1jjxaIWqsVVFKPPjMtwSEdZ6JzXHCQ
 BZSo3Puaq/biBHI48yhUGdWNzgMfYNe8GSKQQMdpHBK9eAYD9OXX2p0Q0eb/mkwLjwLP
 2Nk2We+jhbeGg8UoygHLnyna1mHv4D7jwqOdn0Cvw9aTDNFAgdSd8X2fhyTEdOwBOCpY
 Jivu7UlUNrTrQZQoaP86Da5JgKhlluE09Z0ntnRWExJy6OlQEsza627C0wb37ibx7XKu
 R6Pj464wde3o1WHZ/QOn1gN59fDCgX24UKbDEl2iz46wBC8BbWFDgq9worY4jKKF8otM
 fmSQ==
X-Gm-Message-State: AAQBX9eB2/tauj7Sag1uXwS+/MSkLPEtxn4w8T7a7cWg7FhPgVNrJPBp
 r1aSMHTPwOnmJVQfNw/gm4oHGw==
X-Google-Smtp-Source: AKy350aUxnoO6iFjBe2sj9R3Od4BT6rlN029WsMkg4fxiCuiwTstrgLwlpp9G1KJZVoh6dPorw5iIw==
X-Received: by 2002:ac2:4c83:0:b0:4e8:4412:1d95 with SMTP id
 d3-20020ac24c83000000b004e844121d95mr7003615lfl.29.1680176341837; 
 Thu, 30 Mar 2023 04:39:01 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 m30-20020ac24ade000000b004eaf55936eesm3548277lfp.233.2023.03.30.04.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:39:01 -0700 (PDT)
Message-ID: <5a09246f-69d1-c430-2ac5-8ac7d4b72324@linaro.org>
Date: Thu, 30 Mar 2023 13:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,20/50] drm/msm/dpu: split SC8280XP catalog entry to the
 separate file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-21-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-21-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 196 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 189 +----------------
>  2 files changed, 197 insertions(+), 188 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> new file mode 100644
> index 000000000000..d13ddf63871c
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_8_0_SC8280XP_H
> +#define _DPU_8_0_SC8280XP_H
> +
> +static const struct dpu_caps sc8280xp_dpu_caps = {
> +	.max_mixer_width = 2560,
> +	.max_mixer_blendstages = 11,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
Rebase on /\ removal and the block resizing that's going on in
earlier patches

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 5120,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_40,
> +	.highest_bank_bit = 2,
> +	.ubwc_swizzle = 6,
> +};
> +
> +static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x15000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x16000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x17000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x18000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x19000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +	{
> +	.name = "ctl_5", .id = CTL_5,
> +	.base = 0x1a000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
> +/* FIXME: check block length */
> +static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
> +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> +		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +};
> +
> +static const struct dpu_lm_cfg sc8280xp_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> +};
> +
> +static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
> +	PP_BLK_TE("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
> +	PP_BLK_TE("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
> +	PP_BLK_TE("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> +	PP_BLK_TE("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
> +};
> +
> +/* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
> +static const struct dpu_intf_cfg sc8280xp_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_4", INTF_4, 0x38000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
> +	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
> +	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
> +};
> +
> +static const struct dpu_perf_cfg sc8280xp_perf_data = {
> +	.max_bw_low = 13600000,
> +	.max_bw_high = 18200000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 800000,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
> +		.entries = sc8180x_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc8180x_qos_macrotile),
> +		.entries = sc8180x_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
> +	.caps = &sc8280xp_dpu_caps,
> +	.ubwc = &sc8280xp_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
> +	.mdp = sc8280xp_mdp,
> +	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
> +	.ctl = sc8280xp_ctl,
> +	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),
> +	.sspp = sc8280xp_sspp,
> +	.mixer_count = ARRAY_SIZE(sc8280xp_lm),
> +	.mixer = sc8280xp_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
> +	.pingpong = sc8280xp_pp,
> +	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
> +	.merge_3d = sm8350_merge_3d,
> +	.intf_count = ARRAY_SIZE(sc8280xp_intf),
> +	.intf = sc8280xp_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sc8280xp_regdma,
> +	.perf = &sc8280xp_perf_data,
> +	.mdss_irqs = IRQ_SC8280XP_MASK,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 5e7efcc940c8..637bc85d8a2c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -390,19 +390,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>  	.max_vdeci_exp = MAX_VERT_DECIMATION,
>  };
>  
> -static const struct dpu_caps sc8280xp_dpu_caps = {
> -	.max_mixer_width = 2560,
> -	.max_mixer_blendstages = 11,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> -	.has_src_split = true,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.has_3d_merge = true,
> -	.max_linewidth = 5120,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -};
> -
>  static const struct dpu_caps sm8250_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
> @@ -475,12 +462,6 @@ static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
>  	.highest_bank_bit = 0x3,
>  };
>  
> -static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
> -	.ubwc_version = DPU_HW_UBWC_VER_40,
> -	.highest_bank_bit = 2,
> -	.ubwc_swizzle = 6,
> -};
> -
>  static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_40,
>  	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> @@ -673,23 +654,6 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>  	},
>  };
>  
> -static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20},
> -	},
> -};
> -
>  static const struct dpu_mdp_cfg qcm2290_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -792,45 +756,6 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>  	},
>  };
>  
> -static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x15000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -	{
> -	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x16000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> -	},
> -	{
> -	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x17000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> -	},
> -	{
> -	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x18000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> -	},
> -	{
> -	.name = "ctl_4", .id = CTL_4,
> -	.base = 0x19000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> -	},
> -	{
> -	.name = "ctl_5", .id = CTL_5,
> -	.base = 0x1a000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> -	},
> -};
> -
>  static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> @@ -1177,26 +1102,6 @@ static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
>  static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
>  				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>  
> -/* FIXME: check block length */
> -static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
> -		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> -		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
> -		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
> -		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -};
> -
>  #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
>  	{ \
>  	.maxdwnscale = SSPP_UNITY_SCALE, \
> @@ -1304,17 +1209,6 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
>  		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>  };
>  
> -/* SC8280XP */
> -
> -static const struct dpu_lm_cfg sc8280xp_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> -};
> -
>  /* SM8150 */
>  
>  static const struct dpu_lm_cfg sm8150_lm[] = {
> @@ -1483,21 +1377,6 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
>  	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
>  };
>  
> -static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
> -	PP_BLK_TE("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk_te,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
> -	PP_BLK_TE("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk_te,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
> -	PP_BLK_TE("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk_te,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> -	PP_BLK_TE("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk_te,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
> -};
> -
>  static const struct dpu_pingpong_cfg sm8150_pp[] = {
>  	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -1664,19 +1543,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>  	INTF_BLK("intf_5", INTF_5, 0x6C800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>  };
>  
> -/* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
> -static const struct dpu_intf_cfg sc8280xp_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x38000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> -	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
> -	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
> -	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
> -};
> -
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
>  	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -2094,33 +1960,6 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> -static const struct dpu_perf_cfg sc8280xp_perf_data = {
> -	.max_bw_low = 13600000,
> -	.max_bw_high = 18200000,
> -	.min_core_ib = 2500000,
> -	.min_llcc_ib = 0,
> -	.min_dram_ib = 800000,
> -	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> -	.qos_lut_tbl = {
> -		{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
> -		.entries = sc8180x_qos_linear
> -		},
> -		{.nentry = ARRAY_SIZE(sc8180x_qos_macrotile),
> -		.entries = sc8180x_qos_macrotile
> -		},
> -		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> -		.entries = sc7180_qos_nrt
> -		},
> -		/* TODO: macrotile-qseed is different from macrotile */
> -	},
> -	.cdp_cfg = {
> -		{.rd_enable = 1, .wr_enable = 1},
> -		{.rd_enable = 1, .wr_enable = 0}
> -	},
> -	.clk_inefficiency_factor = 105,
> -	.bw_inefficiency_factor = 120,
> -};
> -
>  static const struct dpu_perf_cfg sm8250_perf_data = {
>  	.max_bw_low = 13700000,
>  	.max_bw_high = 16600000,
> @@ -2386,33 +2225,6 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.mdss_irqs = IRQ_SC8180X_MASK,
>  };
>  
> -static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
> -	.caps = &sc8280xp_dpu_caps,
> -	.ubwc = &sc8280xp_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
> -	.mdp = sc8280xp_mdp,
> -	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
> -	.ctl = sc8280xp_ctl,
> -	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),
> -	.sspp = sc8280xp_sspp,
> -	.mixer_count = ARRAY_SIZE(sc8280xp_lm),
> -	.mixer = sc8280xp_lm,
> -	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> -	.dspp = sm8150_dspp,
> -	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
> -	.pingpong = sc8280xp_pp,
> -	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
> -	.merge_3d = sm8350_merge_3d,
> -	.intf_count = ARRAY_SIZE(sc8280xp_intf),
> -	.intf = sc8280xp_intf,
> -	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sc8280xp_regdma,
> -	.perf = &sc8280xp_perf_data,
> -	.mdss_irqs = IRQ_SC8280XP_MASK,
> -};
> -
>  static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
>  	.caps = &sm8250_dpu_caps,
>  	.ubwc = &sm8250_ubwc_cfg,
> @@ -2517,6 +2329,7 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
>  	.mdss_irqs = IRQ_SC7180_MASK,
>  };
>  
> +#include "catalog/dpu_8_0_sc8280xp.h"
>  #include "catalog/dpu_8_1_sm8450.h"
>  
>  #include "catalog/dpu_9_0_sm8550.h"
