Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7931170D532
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D27D10E3F6;
	Tue, 23 May 2023 07:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005BB10E3D7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:36:28 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f00c33c3d6so8198130e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684827386; x=1687419386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9La4sGEJe5HmpPd6FZ7vn4+m3N10OzWDYqTd4KQ/tQ=;
 b=jmd2F8D5KtGSNr4jXhvATnja2wpCZNCZPwp6HCHtKD1Omzvb2v2OZcRXHINSqhE4hX
 oSlYuN2xCk/9Z3voOm9DFdaWEtTzlRP18p6UO7wMrM/i3nXsY3Nso/Qe/69FeqlyGtha
 btVFMuhul2orqWcTlaXqqbRu14dRbhBDi8up5kC3E0gFT/pH3YdVq/mzSfhS/F5AIoZj
 09bfiI36ChfB9Ixc+5dwBPU8dYzZ8HITn37PiQj351NfycE+LPAHgG9R+Vt0QqHKxvwW
 deZqQA0qIRZbLBrYPKOzK5xaPcHFOi2PG83heLlkqEd9urg6fOrxc2Xlh3SG2BvZ9H+c
 ysPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684827386; x=1687419386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9La4sGEJe5HmpPd6FZ7vn4+m3N10OzWDYqTd4KQ/tQ=;
 b=FKTyshWTgU60sG4PqBuf4jMnntaJgsPhrwtXgXXnOwYdU7HFTPb/oy2E7rHsXhGdkX
 3hqrMLKk/AJuk7aHfc/YrzgHo6kwlhM4yyY1+grQ1BJ5gVv5URQrIjoBZ0ASmpf4lNcP
 bIGnq3yxjghJShwgG6EEF0CLd9m4yqNFbBZcCEM/wKOT7csBdbEG47ow7ipG2Na5R6FV
 tKovSECfmVwhYslm7ZcJbRHPm/bccKGdztghqueOAjfWd7fv8gGtCCxF+v8WduMEFfzj
 WDsK14BjTplLL+bQIu2ISmI3eZh48I2hFjAb/003mPzJJIQqC0XFLXN172fBsC02vsBN
 giXw==
X-Gm-Message-State: AC+VfDyZjRYOfSOsg0NrUJUbsXLMW99deZU82v0ZLrTS04/UXJO0ZI4i
 eNDR8RjVUxEZhfnCVf/H6QfRUA==
X-Google-Smtp-Source: ACHHUZ7CXNfkkV1tu2tyedG+fPG2YYBkoektCWA2BDxQzRMqP86Vg0+xB8N3ZqLZy4qaLfbAaCKLwQ==
X-Received: by 2002:a05:6512:25a:b0:4eb:c85:bdc2 with SMTP id
 b26-20020a056512025a00b004eb0c85bdc2mr4144232lfo.2.1684827385776; 
 Tue, 23 May 2023 00:36:25 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 d27-20020ac24c9b000000b004f00d3d9df9sm1244373lfl.188.2023.05.23.00.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 00:36:25 -0700 (PDT)
Message-ID: <430fa0ca-7e6b-4052-efe8-569079a24259@linaro.org>
Date: Tue, 23 May 2023 09:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 06/12] drm/msm/dpu: Add SM6350 support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v4-6-68e7e25d70e1@linaro.org>
 <16059762-e026-5970-1dac-b45f79d85bb8@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <16059762-e026-5970-1dac-b45f79d85bb8@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.05.2023 17:44, Dmitry Baryshkov wrote:
> On 19/05/2023 20:04, Konrad Dybcio wrote:
>> Add SM6350 support to the DPU1 driver to enable display output.
>>
>> It's worth noting that one entry dpu_qos_lut_entry was trimmed off:
>>
>> {.fl = 0, .lut = 0x0011223344556677 },
>>
>> due to the fact that newer SoCs dropped the .fl (fill level)-based
>> logic and don't provide real values, resulting in all entries but
>> the last one being unused.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 188 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   5 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>   4 files changed, 195 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> new file mode 100644
>> index 000000000000..5d66a194155a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> @@ -0,0 +1,188 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023, Linaro Limited
>> + */
>> +
>> +#ifndef _DPU_6_4_SM6350_H
>> +#define _DPU_6_4_SM6350_H
>> +
>> +static const struct dpu_caps sm6350_dpu_caps = {
>> +    .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +    .max_mixer_blendstages = 0x7,
>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>> +    .has_src_split = true,
>> +    .has_dim_layer = true,
>> +    .has_idle_pc = true,
>> +    .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
>> +static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
>> +    .ubwc_version = DPU_HW_UBWC_VER_20,
>> +    .ubwc_swizzle = 6,
>> +    .highest_bank_bit = 1,
>> +};
>> +
>> +static const struct dpu_mdp_cfg sm6350_mdp[] = {
>> +    {
>> +    .name = "top_0", .id = MDP_TOP,
>> +    .base = 0x0, .len = 0x494,
>> +    .features = 0,
>> +    .clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>> +    .clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
>> +    .clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
>> +    .clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
>> +    .clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>> +    },
>> +};
>> +
>> +static const struct dpu_ctl_cfg sm6350_ctl[] = {
>> +    {
>> +    .name = "ctl_0", .id = CTL_0,
>> +    .base = 0x1000, .len = 0x1dc,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>> +    },
>> +    {
>> +    .name = "ctl_1", .id = CTL_1,
>> +    .base = 0x1200, .len = 0x1dc,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>> +    },
>> +    {
>> +    .name = "ctl_2", .id = CTL_2,
>> +    .base = 0x1400, .len = 0x1dc,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>> +    },
>> +    {
>> +    .name = "ctl_3", .id = CTL_3,
>> +    .base = 0x1600, .len = 0x1dc,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>> +    },
>> +};
>> +
>> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>> +        sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>> +        sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>> +        sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>> +        sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>> +};
>> +
>> +static const struct dpu_lm_cfg sm6350_lm[] = {
>> +    LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>> +        &sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>> +    LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>> +        &sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>> +};
>> +
>> +static const struct dpu_dspp_cfg sm6350_dspp[] = {
>> +    DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +        &sm8150_dspp_sblk),
>> +};
>> +
>> +static struct dpu_pingpong_cfg sm6350_pp[] = {
>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> +        -1),
>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>> +        -1),
>> +};
>> +
>> +static const struct dpu_intf_cfg sm6350_intf[] = {
>> +    INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2c0, INTF_DP, 0, 35, INTF_SC7180_MASK,
> 
> I think the length here should be 0x280, it doesn't have TE block.
Yes that makes sense

> 
>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK,
>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> +        DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +        DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>> +};
>> +
>> +static const struct dpu_vbif_cfg sm6350_vbif[] = {
> 
> Please use sdm845_vbif instead
Ack

Konrad
> 
>> +    {
>> +    .name = "vbif_0", .id = VBIF_RT,
>> +    .base = 0, .len = 0x1044,
>> +    .features = BIT(DPU_VBIF_QOS_REMAP),
>> +    .xin_halt_timeout = 0x4000,
>> +    .qos_rt_tbl = {
>> +        .npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
>> +        .priority_lvl = sdm845_rt_pri_lvl,
>> +    },
>> +    .qos_nrt_tbl = {
>> +        .npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
>> +        .priority_lvl = sdm845_nrt_pri_lvl,
>> +    },
>> +    .memtype_count = 14,
>> +    .memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
>> +    },
>> +};
>> +
>> +static const struct dpu_perf_cfg sm6350_perf_data = {
>> +    .max_bw_low = 4200000,
>> +    .max_bw_high = 5100000,
>> +    .min_core_ib = 2500000,
>> +    .min_llcc_ib = 0,
>> +    .min_dram_ib = 1600000,
>> +    .min_prefill_lines = 35,
>> +    /* TODO: confirm danger_lut_tbl */
>> +    .danger_lut_tbl = {0xffff, 0xffff, 0x0},
>> +    .safe_lut_tbl = {0xff00, 0xff00, 0xffff},
>> +    .qos_lut_tbl = {
>> +        {.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
>> +        .entries = sm6350_qos_linear_macrotile
>> +        },
>> +        {.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
>> +        .entries = sm6350_qos_linear_macrotile
>> +        },
>> +        {.nentry = ARRAY_SIZE(sc7180_qos_nrt),
>> +        .entries = sc7180_qos_nrt
>> +        },
>> +    },
>> +    .cdp_cfg = {
>> +        {.rd_enable = 1, .wr_enable = 1},
>> +        {.rd_enable = 1, .wr_enable = 0}
>> +    },
>> +    .clk_inefficiency_factor = 105,
>> +    .bw_inefficiency_factor = 120,
>> +};
>> +
>> +const struct dpu_mdss_cfg dpu_sm6350_cfg = {
>> +    .caps = &sm6350_dpu_caps,
>> +    .ubwc = &sm6350_ubwc_cfg,
>> +    .mdp_count = ARRAY_SIZE(sm6350_mdp),
>> +    .mdp = sm6350_mdp,
>> +    .ctl_count = ARRAY_SIZE(sm6350_ctl),
>> +    .ctl = sm6350_ctl,
>> +    .sspp_count = ARRAY_SIZE(sm6350_sspp),
>> +    .sspp = sm6350_sspp,
>> +    .mixer_count = ARRAY_SIZE(sm6350_lm),
>> +    .mixer = sm6350_lm,
>> +    .dspp_count = ARRAY_SIZE(sm6350_dspp),
>> +    .dspp = sm6350_dspp,
>> +    .pingpong_count = ARRAY_SIZE(sm6350_pp),
>> +    .pingpong = sm6350_pp,
>> +    .intf_count = ARRAY_SIZE(sm6350_intf),
>> +    .intf = sm6350_intf,
>> +    .vbif_count = ARRAY_SIZE(sm6350_vbif),
>> +    .vbif = sm6350_vbif,
>> +    .reg_dma_count = 1,
>> +    .dma_cfg = &sm8250_regdma,
>> +    .perf = &sm6350_perf_data,
>> +    .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> +             BIT(MDP_INTF0_INTR) | \
>> +             BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR),
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 9daeaccc4f52..5ef1dffc27dc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -748,6 +748,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
>>       {.fl = 0, .lut = 0x0011222222335777},
>>   };
>>   +static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
>> +    {.fl = 0, .lut = 0x0011223445566777 },
>> +};
>> +
>>   static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>>       {.fl = 0, .lut = 0x0011222222223357 },
>>   };
>> @@ -803,6 +807,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>>   #include "catalog/dpu_6_0_sm8250.h"
>>   #include "catalog/dpu_6_2_sc7180.h"
>>   #include "catalog/dpu_6_3_sm6115.h"
>> +#include "catalog/dpu_6_4_sm6350.h"
>>   #include "catalog/dpu_6_5_qcm2290.h"
>>     #include "catalog/dpu_7_0_sm8350.h"
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index e9237321df77..67ff78e7bc99 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -880,6 +880,7 @@ extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>> +extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>>   extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 0e7a68714e9e..46be7ad8d615 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1286,6 +1286,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>       { .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
>>       { .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>>       { .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>> +    { .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>>       { .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>>       { .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>>       { .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
>>
> 
