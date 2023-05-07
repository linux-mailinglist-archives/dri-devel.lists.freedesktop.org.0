Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A803B6F9B41
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5840610E02C;
	Sun,  7 May 2023 20:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3A10E01F
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:02:50 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac88d9edf3so30535141fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683489769; x=1686081769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PQhq52xRNYtqts2gsugzLIYd5kNgCRwD8Uhl0jHSj+g=;
 b=NspMOV3cTCQenr2aybm6qV23DvGXZf4IfJft3qSmCItVDv4jCc1pYxl1tkkMfnLP64
 MKxVD+1F4b3v+jXlsx3RwGMEJX2WDjzWhXr6XteIKF6spuXHQwLX744APPo9REfv3+oA
 NhkuNENtYhPAtQarSgVkQ4G1mS5b1ujnPFAB1limZdzMYQs4ppN1/lpkqmKz4R5oPui+
 8GeAJISRKBlqZ/ZOhhjsTgVddKRUVjMH1zuH6/Ol0xTXC8XnuVqTw3gIVqyQTGh+bz4E
 LvORw2q5PLqkhXXa3fCOAO3Ns6E4W52RhYwRRwjc4fIb2XY0arsAkpkbK/F1nEQ6/Zps
 U9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683489769; x=1686081769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQhq52xRNYtqts2gsugzLIYd5kNgCRwD8Uhl0jHSj+g=;
 b=OivRRsTP664FPkVWoz+5FI5K+WU2vLM+nwXcWz6abqglM1ti0DdG/TCatOVLag1aAk
 JTuAhTWVepU0I1agYOuWZBIszfFVyDoZuby0IVtqSXx4JP6slAMLLGQ1kMKgLLDwzcHS
 BKntniHHyDlQLQ0STx32hUvbD9W2LzzGNPUpm2uVxZE8o+V8c4ghroitJ7ywgLgmEpea
 Op5eHR/H84rB6OUP066coSbo4aoVu//WRTZJMksJcgAuM6VZEZLz4gZJRrK9Mdev/QlD
 tW/NXRLCNKCWhzH567f3ukrZNI+7CAaHD+CLyZgy4OyDkK1cf4RJQDoIDY2UIOqGhPCT
 Wxug==
X-Gm-Message-State: AC+VfDxURubLwYhDRSziu7OCL1F8SORycLoDmz4FhxAnuAA3ZAt9Jwb2
 fs3Q+m+d/N4ghES5ooSQhZCfghGgHHbKTc8PjIE=
X-Google-Smtp-Source: ACHHUZ4co2LDTbe1bUzcD/qXHDSNHJPI4fyZBebjAIOEP453SE+RtJkIZBsDphZfONR0a+q+nP9CMw==
X-Received: by 2002:a2e:9818:0:b0:2a7:b0b4:4fa with SMTP id
 a24-20020a2e9818000000b002a7b0b404famr2255627ljj.12.1683489768828; 
 Sun, 07 May 2023 13:02:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a2e9918000000b002aa39dd9ad3sm919263lji.125.2023.05.07.13.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 13:02:48 -0700 (PDT)
Message-ID: <4216540c-75b2-c08b-0147-d86632b493c0@linaro.org>
Date: Sun, 7 May 2023 23:02:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 08/12] drm/msm/dpu: Add SM6375 support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-8-9837d6b3516d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-8-9837d6b3516d@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2023 00:40, Konrad Dybcio wrote:
> Add basic SM6375 support to the DPU1 driver to enable display output.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 152 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 155 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> new file mode 100644
> index 000000000000..c7f303b0557e
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -0,0 +1,152 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef _DPU_6_9_SM6375_H
> +#define _DPU_6_9_SM6375_H
> +
> +static const struct dpu_caps sm6375_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.ubwc_swizzle = 6,
> +	.highest_bank_bit = 1,
> +};
> +
> +static const struct dpu_mdp_cfg sm6375_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sm6375_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sm6375_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +};
> +
> +static const struct dpu_lm_cfg sm6375_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
> +		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
> +};
> +
> +static const struct dpu_dspp_cfg sm6375_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		&sm8150_dspp_sblk),
> +};
> +
> +static const struct dpu_pingpong_cfg sm6375_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		-1),
> +};
> +
> +static const struct dpu_intf_cfg sm6375_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2c0, INTF_NONE, 0, 0, 0, 0, 0),
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7280_MASK,

If I understand correctly, all 5.x and 6.x DPU also have 
HCTL/DATA_ACTIVE/etc. registers. (I do not know about the sdm845, if it 
has that reg or not). So a proper fix would be to add DPU_DATA_HCTL_EN 
to sc7180 mask rather than upgrading sm6375 to use sc7280 mask.

> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +};
> +
> +static const struct dpu_vbif_cfg sm6375_vbif[] = {
> +	{
> +	.name = "vbif_0", .id = VBIF_RT,
> +	.base = 0, .len = 0x2008,
> +	.features = BIT(DPU_VBIF_QOS_REMAP),
> +	.xin_halt_timeout = 0x4000,
> +	.qos_rp_remap_size = 0x40,
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> +		.priority_lvl = sdm845_rt_pri_lvl,
> +		},
> +	.qos_nrt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
> +		.priority_lvl = sdm845_nrt_pri_lvl,
> +		},
> +	.memtype_count = 14,
> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> +	},
> +};
> +
> +static const struct dpu_perf_cfg sm6375_perf_data = {
> +	.max_bw_low = 5200000,
> +	.max_bw_high = 6200000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0, /* No LLCC on this SoC */
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 24,
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
> +const struct dpu_mdss_cfg dpu_sm6375_cfg = {
> +	.caps = &sm6375_dpu_caps,
> +	.ubwc = &sm6375_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sm6375_mdp),
> +	.mdp = sm6375_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6375_ctl),
> +	.ctl = sm6375_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6375_sspp),
> +	.sspp = sm6375_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6375_lm),
> +	.mixer = sm6375_lm,
> +	.dspp_count = ARRAY_SIZE(sm6375_dspp),
> +	.dspp = sm6375_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6375_pp),
> +	.pingpong = sm6375_pp,
> +	.intf_count = ARRAY_SIZE(sm6375_intf),
> +	.intf = sm6375_intf,
> +	.vbif_count = ARRAY_SIZE(sm6375_vbif),
> +	.vbif = sm6375_vbif,
> +	.perf = &sm6375_perf_data,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR),
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 5ef1dffc27dc..7577572a5ef4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -809,6 +809,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   #include "catalog/dpu_6_3_sm6115.h"
>   #include "catalog/dpu_6_4_sm6350.h"
>   #include "catalog/dpu_6_5_qcm2290.h"
> +#include "catalog/dpu_6_9_sm6375.h"
>   
>   #include "catalog/dpu_7_0_sm8350.h"
>   #include "catalog/dpu_7_2_sc7280.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 56af77353b1e..96a8ec02b5b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -884,6 +884,7 @@ extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>   extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
> +extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>   extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>   extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 46be7ad8d615..980c3c8f8269 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1287,6 +1287,7 @@ static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>   	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>   	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
> +	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
>   	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>   	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>   	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
> 

-- 
With best wishes
Dmitry

