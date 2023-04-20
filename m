Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592ED6E9F2A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254110ED1B;
	Thu, 20 Apr 2023 22:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6572F10ED1B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:41:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ec81779f49so954875e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682030481; x=1684622481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dKzJjRIrd3jgGKLcuQIcSUCaCRJwzampJUSF17r/hM0=;
 b=Zp9GtfKFoYoSHyCu0w1SiFyOPpRTF4o68bE5U1f7afnKDvzcBumSBGEtyf1h4+h6EO
 qMzOgFekIVsfEeRCjBis/ZLOPes3Is8clsGd2hlzIueWex4FcZoQ+3iymWh1kjFFI/GV
 IroJTOjzr6IPnpiP7oMCS3QmaAAisXUcRIVOOyyz2DXs29Rzy8sxhXDuMGgbH1GZY65x
 HLadxBseXEIInshTrNSMvfNM6hBzoEIMpQjBf6XEdrTYq2ehy66IZHc8/ZVKYUEoo20C
 wmy2EjQmS7QscrFNkou7UrBedE18EJKQ6Uv5N2RZHRUNiObmpLn31PubSDsKX/klG+Cu
 edFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682030481; x=1684622481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dKzJjRIrd3jgGKLcuQIcSUCaCRJwzampJUSF17r/hM0=;
 b=idElcDJK0VqkuuIPigWKkQ2dsxGgLpIGZVq/o+RjGjVC5OzlLJ6ozjbfhtlEG+a7Xn
 PBmMOYG4M56pnrXl/F/JnHJQNF8jkhD2Ek0Dl9e2BElvq9JA08yUtZpLiVu8eElQ4Is5
 dJ630SHXsoA+IRe91fUeurmA0OHUJW/TgdyEnduh8XuIOaNbJMwMsGwpZDCtH0lLKnhe
 /fg1g1k5Y8RjB1QxEe4HnHU0tUdkBETz98CYd+SSv7V/BB6PQJpqqpoLJYosk3x8T+LQ
 oK5WwvcpajmlF25aNPMYLuAyKlnawgkcarJrBbeaJKwlGMZVfWP5QnS3DDfLn0ZM0ha+
 LWUw==
X-Gm-Message-State: AAQBX9cfDXzKYVN/M7dvE2kmLimIwRx4DU3T0bVXsXZseO0V1Xg8K5Kr
 OY70LlyGrxBEdFKxHgniddIt/g==
X-Google-Smtp-Source: AKy350ZYfFuvwPyi9Y4n98mBjm1xGVQe83U0J9j/OYrGIN6oUnp2ecGp3ysQfSCQ6/zcsYb/k78nyQ==
X-Received: by 2002:a19:f509:0:b0:4ec:8615:304e with SMTP id
 j9-20020a19f509000000b004ec8615304emr828917lfb.32.1682030481547; 
 Thu, 20 Apr 2023 15:41:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a19520a000000b0048a982ad0a8sm355163lfb.23.2023.04.20.15.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:41:21 -0700 (PDT)
Message-ID: <fd2f43eb-aa10-eaf4-62f8-945a3152a28a@linaro.org>
Date: Fri, 21 Apr 2023 01:41:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 01:31, Konrad Dybcio wrote:
> Add SM6350 support to the DPU1 driver to enable display output.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 191 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   3 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 196 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> new file mode 100644
> index 000000000000..687a508cbaa6
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -0,0 +1,191 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef _DPU_6_4_SM6350_H
> +#define _DPU_6_4_SM6350_H
> +
> +static const struct dpu_caps sm6350_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.ubwc_swizzle = 6,
> +	.highest_bank_bit = 1,
> +};
> +
> +static const struct dpu_mdp_cfg sm6350_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sm6350_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),

DPU_CLK_CTRL_DMA0

> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),

DPU_CLK_CTRL_DMA2


> +};
> +
> +static const struct dpu_lm_cfg sm6350_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
> +};
> +
> +static const struct dpu_dspp_cfg sm6350_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
> +static struct dpu_pingpong_cfg sm6350_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +	       -1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +	       -1),
> +};
> +
> +static const struct dpu_intf_cfg sm6350_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2c0, INTF_DP, 0, 35, INTF_SC7180_MASK,
> +		 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +};
> +
> +static const struct dpu_vbif_cfg sm6350_vbif[] = {
> +	{
> +	.name = "vbif_0", .id = VBIF_RT,
> +	.base = 0, .len = 0x1044,
> +	.features = BIT(DPU_VBIF_QOS_REMAP),
> +	.xin_halt_timeout = 0x4000,
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> +		.priority_lvl = sdm845_rt_pri_lvl,
> +	},
> +	.qos_nrt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
> +		.priority_lvl = sdm845_nrt_pri_lvl,
> +	},
> +	.memtype_count = 14,
> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> +	},
> +};
> +
> +static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
> +	{.fl = 0, .lut = 0x0011223344556677 },
> +	{.fl = 0, .lut = 0x0011223445566777 },

Do we need two equal entries here?

Also please push the qos to the dpu_hw_catalog.c, I want to take another 
look at these structures and it is easier if all of them are beneath 
one's eyes.

> +};
> +
> +static const struct dpu_perf_cfg sm6350_perf_data = {
> +	.max_bw_low = 4200000,
> +	.max_bw_high = 5100000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 35,
> +	/* TODO: confirm danger_lut_tbl */
> +	.danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
> +		.entries = sm6350_qos_linear_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
> +		.entries = sm6350_qos_linear_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
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
> +const struct dpu_mdss_cfg dpu_sm6350_cfg = {
> +	.caps = &sm6350_dpu_caps,
> +	.ubwc = &sm6350_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sm6350_mdp),
> +	.mdp = sm6350_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6350_ctl),
> +	.ctl = sm6350_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6350_sspp),
> +	.sspp = sm6350_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6350_lm),
> +	.mixer = sm6350_lm,
> +	.dspp_count = ARRAY_SIZE(sm6350_dspp),
> +	.dspp = sm6350_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6350_pp),
> +	.pingpong = sm6350_pp,
> +	.intf_count = ARRAY_SIZE(sm6350_intf),
> +	.intf = sm6350_intf,
> +	.vbif_count = ARRAY_SIZE(sm6350_vbif),
> +	.vbif = sm6350_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8250_regdma,
> +	.perf = &sm6350_perf_data,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR)
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index db558a9ae36e..52750b592b36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -806,6 +806,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   #include "catalog/dpu_6_0_sm8250.h"
>   #include "catalog/dpu_6_2_sc7180.h"
>   #include "catalog/dpu_6_3_sm6115.h"
> +#include "catalog/dpu_6_4_sm6350.h"
>   #include "catalog/dpu_6_5_qcm2290.h"
>   
>   #include "catalog/dpu_7_0_sm8350.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 756bff1d2185..f9611bd75e02 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -320,6 +320,8 @@ enum dpu_qos_lut_usage {
>   	DPU_QOS_LUT_USAGE_LINEAR,
>   	DPU_QOS_LUT_USAGE_MACROTILE,
>   	DPU_QOS_LUT_USAGE_NRT,
> +	DPU_QOS_LUT_USAGE_CWB,
> +	DPU_QOS_LUT_USAGE_MACROTILE_QSEED,

This should probably be removed. It would be nice to clean these things 
up, but not as a part of sm6350.

>   	DPU_QOS_LUT_USAGE_MAX,
>   };
>   
> @@ -880,6 +882,7 @@ extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>   extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
> +extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>   extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>   extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0e7a68714e9e..46be7ad8d615 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1286,6 +1286,7 @@ static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
>   	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>   	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
> +	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>   	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>   	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>   	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
> 

-- 
With best wishes
Dmitry

