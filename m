Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604AB6FA678
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 12:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54510E1EB;
	Mon,  8 May 2023 10:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7E10E1EB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 10:19:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f13dafd5dcso4755758e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683541189; x=1686133189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fx4GgDu8Dkg44mO4d5IPpyj3XYjpmsEYd11wgXVHt5o=;
 b=OLuaf/mGJREw4AD+ni/OW6EhhL913vhZTEdLbuUfydNI2qeUnnGkTaWTJH3Q8ABNna
 EAJTof0fSxxwYRUS69JPiOnjOcJU0cVT+YLoWvXOnaSQYsPsGwjEqGms750QSxmyfJcz
 qACLT76XMHOYd1PBXORZbJNKqpFaxD0jRKcMgvatiwzlyXlDhr6Odd7HORjSl6Ch2mz3
 N4gnqz4VquFYEuPp+kgGGf0Lto+go1gLe9IjVPcdgWom1osbnGZRIuRSGsioNjrgDvLJ
 RksgIUS7NKBQh3ot5+IOqhHDZsfaOIPVUpb754xzt1bE+P+ZmdKFZxc8TZ6l2vaP5rqj
 iCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683541189; x=1686133189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fx4GgDu8Dkg44mO4d5IPpyj3XYjpmsEYd11wgXVHt5o=;
 b=iPv8XZVMeRmKtFIbKC+t16rTvzCY+wD9w1eTf6YEdFoppgT/TEuadKztdvOhGDeMrC
 h5S0Hsh4ohCWvPHga6T8IApLRlSSk+0PgWkCQIuCWcTGF76bJWUlTQtWudBb1W4dlH4L
 /J09gNYFwsX+agevZm4wNJd4q4JDyGpzqspAm9N1xsk5zmlp5mI0PLTczdUt38nWpo/B
 /fcO5pqeOwtiCBSn1yMFuQAoJCstTkogEL7w5ZfOio4ACiSWoMO/nRw7MlP5WO08hMYF
 UYjgPTXj2343kFmsjNo4Ag9BMZ8iWwa1nJihhagkS3g+egxC0wxex0j1TqxBu0yKFcy7
 fchA==
X-Gm-Message-State: AC+VfDygPaAUo7U51p/v/wmdDcO24AwFgHUlcJH9+tBw5pWcgefir+uG
 19XH5842vwt37uFTn2sIM5SG5w==
X-Google-Smtp-Source: ACHHUZ7yINTzYwnaX7dpAIeK0GpIBuoM91ixacy8bLIfuZ1oSbgC4vzSbi6IHos2d7aK70RjDUpHCA==
X-Received: by 2002:ac2:5d65:0:b0:4d8:8ad1:a05f with SMTP id
 h5-20020ac25d65000000b004d88ad1a05fmr2704763lft.48.1683541189555; 
 Mon, 08 May 2023 03:19:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l25-20020ac25559000000b004edc0fc3c35sm1251217lfk.5.2023.05.08.03.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:19:49 -0700 (PDT)
Message-ID: <d2bd30be-4d40-c301-464d-476dd07ad930@linaro.org>
Date: Mon, 8 May 2023 13:19:48 +0300
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
 <4216540c-75b2-c08b-0147-d86632b493c0@linaro.org>
 <5ce4038f-2cf6-a3d4-89e8-fc8b085b508c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5ce4038f-2cf6-a3d4-89e8-fc8b085b508c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/05/2023 11:43, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 22:02, Dmitry Baryshkov wrote:
>> On 06/05/2023 00:40, Konrad Dybcio wrote:
>>> Add basic SM6375 support to the DPU1 driver to enable display output.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 152 +++++++++++++++++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>>    4 files changed, 155 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>>> new file mode 100644
>>> index 000000000000..c7f303b0557e
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>>> @@ -0,0 +1,152 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
>>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2023, Linaro Limited
>>> + */
>>> +
>>> +#ifndef _DPU_6_9_SM6375_H
>>> +#define _DPU_6_9_SM6375_H
>>> +
>>> +static const struct dpu_caps sm6375_dpu_caps = {
>>> +    .max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>>> +    .max_mixer_blendstages = 0x4,
>>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>>> +    .has_dim_layer = true,
>>> +    .has_idle_pc = true,
>>> +    .max_linewidth = 2160,
>>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>> +};
>>> +
>>> +static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
>>> +    .ubwc_version = DPU_HW_UBWC_VER_20,
>>> +    .ubwc_swizzle = 6,
>>> +    .highest_bank_bit = 1,
>>> +};
>>> +
>>> +static const struct dpu_mdp_cfg sm6375_mdp[] = {
>>> +    {
>>> +    .name = "top_0", .id = MDP_TOP,
>>> +    .base = 0x0, .len = 0x494,
>>> +    .features = 0,
>>> +    .clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>>> +    .clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
>>> +    },
>>> +};
>>> +
>>> +static const struct dpu_ctl_cfg sm6375_ctl[] = {
>>> +    {
>>> +    .name = "ctl_0", .id = CTL_0,
>>> +    .base = 0x1000, .len = 0x1dc,
>>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>> +    },
>>> +};
>>> +
>>> +static const struct dpu_sspp_cfg sm6375_sspp[] = {
>>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>>> +        sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>>> +        sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>> +};
>>> +
>>> +static const struct dpu_lm_cfg sm6375_lm[] = {
>>> +    LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
>>> +        &qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
>>> +};
>>> +
>>> +static const struct dpu_dspp_cfg sm6375_dspp[] = {
>>> +    DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>>> +        &sm8150_dspp_sblk),
>>> +};
>>> +
>>> +static const struct dpu_pingpong_cfg sm6375_pp[] = {
>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>> +        -1),
>>> +};
>>> +
>>> +static const struct dpu_intf_cfg sm6375_intf[] = {
>>> +    INTF_BLK("intf_0", INTF_0, 0x00000, 0x2c0, INTF_NONE, 0, 0, 0, 0, 0),
>>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>>
>> If I understand correctly, all 5.x and 6.x DPU also have HCTL/DATA_ACTIVE/etc. registers. (I do not know about the sdm845, if it has that reg or not). So a proper fix would be to add DPU_DATA_HCTL_EN to sc7180 mask rather than upgrading sm6375 to use sc7280 mask.
> They're touched unconditionally on msm-4.14 (8150 /and 7180 I think/ release)

Yes. Verified, they are present since DPU 5.x Could you please adjust 
masks accordingly?

> 
> Konrad
>>
>>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>>> +        DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>>> +};
>>> +
>>> +static const struct dpu_vbif_cfg sm6375_vbif[] = {
>>> +    {
>>> +    .name = "vbif_0", .id = VBIF_RT,
>>> +    .base = 0, .len = 0x2008,
>>> +    .features = BIT(DPU_VBIF_QOS_REMAP),
>>> +    .xin_halt_timeout = 0x4000,
>>> +    .qos_rp_remap_size = 0x40,
>>> +    .qos_rt_tbl = {
>>> +        .npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
>>> +        .priority_lvl = sdm845_rt_pri_lvl,
>>> +        },
>>> +    .qos_nrt_tbl = {
>>> +        .npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
>>> +        .priority_lvl = sdm845_nrt_pri_lvl,
>>> +        },
>>> +    .memtype_count = 14,
>>> +    .memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
>>> +    },
>>> +};
>>> +
>>> +static const struct dpu_perf_cfg sm6375_perf_data = {
>>> +    .max_bw_low = 5200000,
>>> +    .max_bw_high = 6200000,
>>> +    .min_core_ib = 2500000,
>>> +    .min_llcc_ib = 0, /* No LLCC on this SoC */
>>> +    .min_dram_ib = 1600000,
>>> +    .min_prefill_lines = 24,
>>> +    /* TODO: confirm danger_lut_tbl */
>>> +    .danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
>>> +    .qos_lut_tbl = {
>>> +        {.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
>>> +        .entries = sm6350_qos_linear_macrotile
>>> +        },
>>> +        {.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
>>> +        .entries = sm6350_qos_linear_macrotile
>>> +        },
>>> +        {.nentry = ARRAY_SIZE(sc7180_qos_nrt),
>>> +        .entries = sc7180_qos_nrt
>>> +        },
>>> +    },
>>> +    .cdp_cfg = {
>>> +        {.rd_enable = 1, .wr_enable = 1},
>>> +        {.rd_enable = 1, .wr_enable = 0}
>>> +    },
>>> +    .clk_inefficiency_factor = 105,
>>> +    .bw_inefficiency_factor = 120,
>>> +};
>>> +
>>> +const struct dpu_mdss_cfg dpu_sm6375_cfg = {
>>> +    .caps = &sm6375_dpu_caps,
>>> +    .ubwc = &sm6375_ubwc_cfg,
>>> +    .mdp_count = ARRAY_SIZE(sm6375_mdp),
>>> +    .mdp = sm6375_mdp,
>>> +    .ctl_count = ARRAY_SIZE(sm6375_ctl),
>>> +    .ctl = sm6375_ctl,
>>> +    .sspp_count = ARRAY_SIZE(sm6375_sspp),
>>> +    .sspp = sm6375_sspp,
>>> +    .mixer_count = ARRAY_SIZE(sm6375_lm),
>>> +    .mixer = sm6375_lm,
>>> +    .dspp_count = ARRAY_SIZE(sm6375_dspp),
>>> +    .dspp = sm6375_dspp,
>>> +    .pingpong_count = ARRAY_SIZE(sm6375_pp),
>>> +    .pingpong = sm6375_pp,
>>> +    .intf_count = ARRAY_SIZE(sm6375_intf),
>>> +    .intf = sm6375_intf,
>>> +    .vbif_count = ARRAY_SIZE(sm6375_vbif),
>>> +    .vbif = sm6375_vbif,
>>> +    .perf = &sm6375_perf_data,
>>> +    .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> +             BIT(MDP_INTF1_INTR) | \
>>> +             BIT(MDP_INTF1_TEAR_INTR),
>>> +};
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 5ef1dffc27dc..7577572a5ef4 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -809,6 +809,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>>>    #include "catalog/dpu_6_3_sm6115.h"
>>>    #include "catalog/dpu_6_4_sm6350.h"
>>>    #include "catalog/dpu_6_5_qcm2290.h"
>>> +#include "catalog/dpu_6_9_sm6375.h"
>>>      #include "catalog/dpu_7_0_sm8350.h"
>>>    #include "catalog/dpu_7_2_sc7280.h"
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 56af77353b1e..96a8ec02b5b8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -884,6 +884,7 @@ extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>>> +extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 46be7ad8d615..980c3c8f8269 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1287,6 +1287,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>>        { .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>>>        { .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>>>        { .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>>> +    { .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
>>>        { .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>>>        { .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>>>        { .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
>>>
>>

-- 
With best wishes
Dmitry

