Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E80436D047C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06D810E2B4;
	Thu, 30 Mar 2023 12:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C911F10E2B4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:19:48 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id q16so24235927lfe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680178787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=96WvWkg2BPVlLnrwpIXBQm/+u3106/+lc38qdaKzxvw=;
 b=ApVOL/1V6qm82QikkbHqARvAmSyW1ok2a5y2XwIg/q65p2j2Mz1TOLngT/qxZot5fV
 1sYSNVc+meVHph/c8MCyBXyIO6LZF2ljhJVmtIbpUt/bKs7sZRsAZ4fC60mchF7/07au
 YVDkxZXzCIb4cVmosHW/SjtQm+dQDoHImDPa/n7iJ8zBdPIccX8P3ZVtiGFIi9kj5Al/
 i+KnX4QqiUI9Uci0PpbXZTJ+D39Pjv7ItBqRk/+p4XSJ+i3Nbgjfc9V8bc/+88X1bdii
 m/uis702bIfW1uOVhhf3WxIaHLToi3hrTXWnA9pKcFOXVAZjbMs4N21JfzLWgDa7mQ7a
 dSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=96WvWkg2BPVlLnrwpIXBQm/+u3106/+lc38qdaKzxvw=;
 b=O+HLasy3M/MK0/RHF+ozYcgqBN4aFYD3jRSV8tj1ZKcJI+LTm91XZJDOwN9qd9ClFv
 15tT+lpgrYi8WXF+wEw0s3fyMgqYEhP9L1DuQdkbNJQjzovBhE9ozDPhVV3tPTLIpoS5
 KQB4tVZx9DPvXMWAG/7bT22FUPHzfibKvBHeWBLyniN6AlyaNI3g3kUyLnJGx32ie3WZ
 RWcKvwuK99gxDwZ24lDz188nLizJpz+jiInQzoROumqBVZhIi3pM1aM0RcXII1r6TN75
 ORzSvdzK3yWI+oWtZTJ6nX12dZAOYp+M7ezUeB5qJG1RKdzn/7WY3N5pflDne8EHx50E
 sg4Q==
X-Gm-Message-State: AAQBX9dbCvBCk+05l/yQlLOG9jo9TP7XQyFkvbZL01q/j9WvKxjrpxv0
 bCIN9V/me9wPhmjObW4wDwDguw==
X-Google-Smtp-Source: AKy350axXC30NsfuHezX3NM0jq9Z4HFdRCL98D+wQ8SoQE1jJGIpKZbGi2w10Arf0rIzurCdp8Ioyw==
X-Received: by 2002:ac2:44ba:0:b0:4db:3e1a:fc7 with SMTP id
 c26-20020ac244ba000000b004db3e1a0fc7mr6707948lfm.31.1680178786848; 
 Thu, 30 Mar 2023 05:19:46 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05651238a700b004b4b600c093sm5851412lft.92.2023.03.30.05.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:19:46 -0700 (PDT)
Message-ID: <8670c929-3266-e4b0-6be6-acc9b71a2e52@linaro.org>
Date: Thu, 30 Mar 2023 14:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,30/50] drm/msm/dpu: split SDM845 catalog entry to the
 separate file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-31-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-31-dmitry.baryshkov@linaro.org>
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
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 203 +++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 208 +-----------------
>  2 files changed, 204 insertions(+), 207 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> new file mode 100644
> index 000000000000..739a301afcb4
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -0,0 +1,203 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_4_0_SDM845_H
> +#define _DPU_4_0_SDM845_H
> +
> +static const struct dpu_caps sdm845_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
> +static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.highest_bank_bit = 0x2,
> +};
> +
> +static const struct dpu_mdp_cfg sdm845_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x45c,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sdm845_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0xe4,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0xe4,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0xe4,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0xe4,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x1800, .len = 0xe4,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sdm845_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +};
> +
> +static const struct dpu_lm_cfg sdm845_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
> +	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
> +	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> +};
> +
> +static const struct dpu_pingpong_cfg sdm845_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +};
> +
> +static const struct dpu_dsc_cfg sdm845_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
> +};
> +
> +static const struct dpu_intf_cfg sdm845_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +};
> +
> +static const struct dpu_perf_cfg sdm845_perf_data = {
> +	.max_bw_low = 6800000,
> +	.max_bw_high = 6800000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 800000,
> +	.undersized_prefill_lines = 2,
> +	.xtra_prefill_lines = 2,
> +	.dest_scale_prefill_lines = 3,
> +	.macrotile_prefill_lines = 4,
> +	.yuv_nv12_prefill_lines = 8,
> +	.linear_prefill_lines = 1,
> +	.downscaling_prefill_lines = 1,
> +	.amortizable_threshold = 25,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sdm845_qos_linear),
> +		.entries = sdm845_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sdm845_qos_macrotile),
> +		.entries = sdm845_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sdm845_qos_nrt),
> +		.entries = sdm845_qos_nrt
> +		},
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
> +	.caps = &sdm845_dpu_caps,
> +	.ubwc = &sdm845_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> +	.mdp = sdm845_mdp,
> +	.ctl_count = ARRAY_SIZE(sdm845_ctl),
> +	.ctl = sdm845_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> +	.sspp = sdm845_sspp,
> +	.mixer_count = ARRAY_SIZE(sdm845_lm),
> +	.mixer = sdm845_lm,
> +	.pingpong_count = ARRAY_SIZE(sdm845_pp),
> +	.pingpong = sdm845_pp,
> +	.dsc_count = ARRAY_SIZE(sdm845_dsc),
> +	.dsc = sdm845_dsc,
> +	.intf_count = ARRAY_SIZE(sdm845_intf),
> +	.intf = sdm845_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sdm845_regdma,
> +	.perf = &sdm845_perf_data,
> +	.mdss_irqs = IRQ_SDM845_MASK,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b40e9f0f8e8a..82a1d18cbaa3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -294,90 +294,6 @@ static const uint32_t wb2_formats[] = {
>  	DRM_FORMAT_XBGR4444,
>  };
>  
> -/*************************************************************
> - * DPU sub blocks config
> - *************************************************************/
> -/* DPU top level caps */
> -static const struct dpu_caps sdm845_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 0xb,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> -	.has_src_split = true,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.has_3d_merge = true,
> -	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> -	.max_vdeci_exp = MAX_VERT_DECIMATION,
> -};
> -
> -static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
> -	.ubwc_version = DPU_HW_UBWC_VER_20,
> -	.highest_bank_bit = 0x2,
> -};
> -
> -static const struct dpu_mdp_cfg sdm845_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x45C,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -			.reg_off = 0x2AC, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -			.reg_off = 0x2B4, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -			.reg_off = 0x2BC, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -			.reg_off = 0x2C4, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -			.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> -			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
> -			.reg_off = 0x2C4, .bit_off = 8},
> -	},
> -};
> -
> -/*************************************************************
> - * CTL sub blocks config
> - *************************************************************/
> -static const struct dpu_ctl_cfg sdm845_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x1000, .len = 0xE4,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -	{
> -	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x1200, .len = 0xE4,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> -	},
> -	{
> -	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x1400, .len = 0xE4,
> -	.features = 0,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> -	},
> -	{
> -	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x1600, .len = 0xE4,
> -	.features = 0,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> -	},
> -	{
> -	.name = "ctl_4", .id = CTL_4,
> -	.base = 0x1800, .len = 0xE4,
> -	.features = 0,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> -	},
> -};
> -
>  /*************************************************************
>   * SSPP sub blocks config
>   *************************************************************/
> @@ -477,25 +393,6 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>  	.clk_ctrl = _clkctrl \
>  	}
>  
> -static const struct dpu_sspp_cfg sdm845_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_SDM845_MASK,
> -		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_SDM845_MASK,
> -		sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_SDM845_MASK,
> -		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_SDM845_MASK,
> -		sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -};
> -
>  static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
>  				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
>  
> @@ -596,21 +493,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	},
>  };
>  
> -static const struct dpu_lm_cfg sdm845_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
> -	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
> -	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> -};
> -
>  /* SC7180 */
>  
>  static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
> @@ -710,21 +592,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.intr_rdptr = _rdptr, \
>  	}
>  
> -static const struct dpu_pingpong_cfg sdm845_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -};
> -
>  /*************************************************************
>   * MERGE_3D sub blocks config
>   *************************************************************/
> @@ -746,13 +613,6 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
>  	.features = _features, \
>  	}
>  
> -static const struct dpu_dsc_cfg sdm845_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
> -};
> -
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> @@ -768,13 +628,6 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
>  	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
>  	}
>  
> -static const struct dpu_intf_cfg sdm845_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -};
> -
>  /*************************************************************
>   * Writeback blocks config
>   *************************************************************/
> @@ -997,70 +850,11 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  	{.fl = 0, .lut = 0x0},
>  };
>  
> -static const struct dpu_perf_cfg sdm845_perf_data = {
> -	.max_bw_low = 6800000,
> -	.max_bw_high = 6800000,
> -	.min_core_ib = 2400000,
> -	.min_llcc_ib = 800000,
> -	.min_dram_ib = 800000,
> -	.undersized_prefill_lines = 2,
> -	.xtra_prefill_lines = 2,
> -	.dest_scale_prefill_lines = 3,
> -	.macrotile_prefill_lines = 4,
> -	.yuv_nv12_prefill_lines = 8,
> -	.linear_prefill_lines = 1,
> -	.downscaling_prefill_lines = 1,
> -	.amortizable_threshold = 25,
> -	.min_prefill_lines = 24,
> -	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> -	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
> -	.qos_lut_tbl = {
> -		{.nentry = ARRAY_SIZE(sdm845_qos_linear),
> -		.entries = sdm845_qos_linear
> -		},
> -		{.nentry = ARRAY_SIZE(sdm845_qos_macrotile),
> -		.entries = sdm845_qos_macrotile
> -		},
> -		{.nentry = ARRAY_SIZE(sdm845_qos_nrt),
> -		.entries = sdm845_qos_nrt
> -		},
> -	},
> -	.cdp_cfg = {
> -		{.rd_enable = 1, .wr_enable = 1},
> -		{.rd_enable = 1, .wr_enable = 0}
> -	},
> -	.clk_inefficiency_factor = 105,
> -	.bw_inefficiency_factor = 120,
> -};
> -
>  /*************************************************************
>   * Hardware catalog
>   *************************************************************/
>  
> -static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
> -	.caps = &sdm845_dpu_caps,
> -	.ubwc = &sdm845_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> -	.mdp = sdm845_mdp,
> -	.ctl_count = ARRAY_SIZE(sdm845_ctl),
> -	.ctl = sdm845_ctl,
> -	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> -	.sspp = sdm845_sspp,
> -	.mixer_count = ARRAY_SIZE(sdm845_lm),
> -	.mixer = sdm845_lm,
> -	.pingpong_count = ARRAY_SIZE(sdm845_pp),
> -	.pingpong = sdm845_pp,
> -	.dsc_count = ARRAY_SIZE(sdm845_dsc),
> -	.dsc = sdm845_dsc,
> -	.intf_count = ARRAY_SIZE(sdm845_intf),
> -	.intf = sdm845_intf,
> -	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sdm845_regdma,
> -	.perf = &sdm845_perf_data,
> -	.mdss_irqs = IRQ_SDM845_MASK,
> -};
> +#include "catalog/dpu_4_0_sdm845.h"
>  
>  #include "catalog/dpu_3_0_msm8998.h"
>  
