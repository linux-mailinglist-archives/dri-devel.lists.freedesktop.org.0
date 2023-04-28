Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543546F180A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7830C10ED21;
	Fri, 28 Apr 2023 12:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D81010ED21
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:32:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1950f569eso57122055e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 05:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682685174; x=1685277174;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tet1nMqbv8ZTxtv4oQZ/eBBXMQM+8d+nfve+pUhRWro=;
 b=vAmhf0dBupHKKTCTtC6w821UcC/ElEAWCRNW+nlQwU85SZRSbR47202zqQR+uDZkkf
 F08gw2l6f7B3tgo6j+W3qdzlNAqYRnG6uU7jIM5qRpCCG3PUk1KYgpLMiydN+lqTAbWp
 zdxTyPFfLkbjFwDMhCYOMzKu6dS6vKSGt0Tfl9DHqlcS41tLwD/NdYhtgxRCSLCL1jo/
 V6F4944Q+hyEuXEfXO7PpC8A/QzbQDRI8+Gqwf8q8Gn25z4hSPfixVjFzo0kuSSj3pCM
 ec9YVQbojMsDYNJwJcyUqDr6v5YvWxPG4kDjNc7i5lirJLP26kWEe9PXONj1kim77Xi+
 h4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682685174; x=1685277174;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tet1nMqbv8ZTxtv4oQZ/eBBXMQM+8d+nfve+pUhRWro=;
 b=GPcqzZnfdI5cF7ZXUcCltZskHyKobm0ACfaCy0nG5Wwrx9fNuFtpaTpFdTPaZo+sWj
 eQMQ2bA6Cq7dYJvehuhP6Q9cTswsDV9i+jliH/tIk/YOb0CAzfKw5Jq8Q2se6n37yPea
 hdaDi8c4SR9QKgJjQzyAuq0utsJOSXJgPCnLkrCspYgC7czpppCYgi1GT5Njdyv9L76c
 xplrx1EMUNv65kSLYP3Uh7LXkAMbTn5UjoErzKtqbevs9X5Jp8f7JcP7AFo16km1BqJU
 iouCqmMeP/NyeZmjpLJk6b9wLWKkc3P1h4hVF4oFgEm0WGFWe91cyxmKFlR97O40HEHp
 rnIQ==
X-Gm-Message-State: AC+VfDyS4eHi6bngzd/lpJyKboMWyboWLHgY6EEAHpK9xWQarnSQrm8u
 Y1uVjb1Hub1kxCwm9iStA/m83g==
X-Google-Smtp-Source: ACHHUZ7kqaqHoH0t847df92Ve956AARTVB5G0MCAsuj/g6u4XEhIWpoo9BhgcID/AE5ZRON7rkFAyw==
X-Received: by 2002:a05:600c:2285:b0:3f1:7123:5f82 with SMTP id
 5-20020a05600c228500b003f171235f82mr3819130wmf.12.1682685174171; 
 Fri, 28 Apr 2023 05:32:54 -0700 (PDT)
Received: from [172.23.4.26] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b003ee9c8cc631sm27936532wms.23.2023.04.28.05.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:32:53 -0700 (PDT)
Message-ID: <70fd25cc-3ad6-80cb-df05-ac9db7a54293@linaro.org>
Date: Fri, 28 Apr 2023 13:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 09/13] drm/msm/dpu: Add SM6375 support
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-9-5def73f50980@linaro.org>
 <rhlkjdphwaqcqgqbac7lue7jwzkjs4iic32jq34qletrcpkss6@hleig3kyot7p>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <rhlkjdphwaqcqgqbac7lue7jwzkjs4iic32jq34qletrcpkss6@hleig3kyot7p>
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/27/23 16:46, Marijn Suijten wrote:
> On 2023-04-21 00:31:18, Konrad Dybcio wrote:
>> Add basic SM6375 support to the DPU1 driver to enable display output.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   5 -
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 152 +++++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  14 ++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>  5 files changed, 168 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> index 687a508cbaa6..d46b43964be6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> @@ -126,11 +126,6 @@ static const struct dpu_vbif_cfg sm6350_vbif[] = {
>>  	},
>>  };
>>  
>> -static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
>> -	{.fl = 0, .lut = 0x0011223344556677 },
>> -	{.fl = 0, .lut = 0x0011223445566777 },
>> -};
>> -
>>  static const struct dpu_perf_cfg sm6350_perf_data = {
>>  	.max_bw_low = 4200000,
>>  	.max_bw_high = 5100000,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> new file mode 100644
>> index 000000000000..19ca0051e072
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> @@ -0,0 +1,152 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023, Linaro Limited
>> + */
>> +
>> +#ifndef _DPU_6_9_SM6375_H
>> +#define _DPU_6_9_SM6375_H
>> +
>> +static const struct dpu_caps sm6375_dpu_caps = {
>> +	.max_mixer_width = 2048,
>> +	.max_mixer_blendstages = 0x4,
>> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
>> +	.has_dim_layer = true,
>> +	.has_idle_pc = true,
>> +	.max_linewidth = 2160,
>> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
>> +static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
>> +	.ubwc_version = DPU_HW_UBWC_VER_20,
>> +	.ubwc_swizzle = 6,
>> +	.highest_bank_bit = 1,
>> +};
>> +
>> +static const struct dpu_mdp_cfg sm6375_mdp[] = {
>> +	{
>> +	.name = "top_0", .id = MDP_TOP,
>> +	.base = 0x0, .len = 0x494,
>> +	.features = 0,
>> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
>> +	},
>> +};
>> +
>> +static const struct dpu_ctl_cfg sm6375_ctl[] = {
>> +	{
>> +	.name = "ctl_0", .id = CTL_0,
>> +	.base = 0x1000, .len = 0x1dc,
>> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>> +	},
>> +};
>> +
>> +static const struct dpu_sspp_cfg sm6375_sspp[] = {
>> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>> +		 sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>> +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> +};
>> +
>> +static const struct dpu_lm_cfg sm6375_lm[] = {
>> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
>> +		&sm6375_lm_sblk, PINGPONG_0, 0, DSPP_0),
> Same indentation nit here as in SM6350.

Ack


>
>> +};
>> +
>> +static const struct dpu_dspp_cfg sm6375_dspp[] = {
>> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +		 &sm8150_dspp_sblk),
>> +};
>> +
>> +static const struct dpu_pingpong_cfg sm6375_pp[] = {
>> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> +	       -1),
>> +};
>> +
>> +static const struct dpu_intf_cfg sm6375_intf[] = {
>> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2c0, INTF_NONE, 0, 0, 0, 0, 0),
>> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>> +};
>> +
>> +static const struct dpu_vbif_cfg sm6375_vbif[] = {
>> +	{
>> +	.name = "vbif_0", .id = VBIF_RT,
>> +	.base = 0, .len = 0x2008,
>> +	.features = BIT(DPU_VBIF_QOS_REMAP),
>> +	.xin_halt_timeout = 0x4000,
>> +	.qos_rp_remap_size = 0x40,
>> +	.qos_rt_tbl = {
>> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
>> +		.priority_lvl = sdm845_rt_pri_lvl,
>> +		},
>> +	.qos_nrt_tbl = {
>> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
>> +		.priority_lvl = sdm845_nrt_pri_lvl,
>> +		},
>> +	.memtype_count = 14,
>> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
>> +	},
>> +};
>> +
>> +static const struct dpu_perf_cfg sm6375_perf_data = {
>> +	.max_bw_low = 5200000,
>> +	.max_bw_high = 6200000,
>> +	.min_core_ib = 2500000,
>> +	.min_llcc_ib = 0, /* No LLCC on this SoC */
>> +	.min_dram_ib = 1600000,
>> +	.min_prefill_lines = 24,
>> +	/* TODO: confirm danger_lut_tbl */
>> +	.danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
>> +	.qos_lut_tbl = {
>> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
>> +		.entries = sm6350_qos_linear_macrotile
>> +		},
>> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
>> +		.entries = sm6350_qos_linear_macrotile
>> +		},
>> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
>> +		.entries = sc7180_qos_nrt
>> +		},
>> +	},
>> +	.cdp_cfg = {
>> +		{.rd_enable = 1, .wr_enable = 1},
>> +		{.rd_enable = 1, .wr_enable = 0}
>> +	},
>> +	.clk_inefficiency_factor = 105,
>> +	.bw_inefficiency_factor = 120,
>> +};
>> +
>> +const struct dpu_mdss_cfg dpu_sm6375_cfg = {
>> +	.caps = &sm6375_dpu_caps,
>> +	.ubwc = &sm6375_ubwc_cfg,
>> +	.mdp_count = ARRAY_SIZE(sm6375_mdp),
>> +	.mdp = sm6375_mdp,
>> +	.ctl_count = ARRAY_SIZE(sm6375_ctl),
>> +	.ctl = sm6375_ctl,
>> +	.sspp_count = ARRAY_SIZE(sm6375_sspp),
>> +	.sspp = sm6375_sspp,
>> +	.mixer_count = ARRAY_SIZE(sm6375_lm),
>> +	.mixer = sm6375_lm,
>> +	.dspp_count = ARRAY_SIZE(sm6375_dspp),
>> +	.dspp = sm6375_dspp,
>> +	.pingpong_count = ARRAY_SIZE(sm6375_pp),
>> +	.pingpong = sm6375_pp,
>> +	.intf_count = ARRAY_SIZE(sm6375_intf),
>> +	.intf = sm6375_intf,
>> +	.vbif_count = ARRAY_SIZE(sm6375_vbif),
>> +	.vbif = sm6375_vbif,
>> +	.perf = &sm6375_perf_data,
>> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
>> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> +		     BIT(MDP_INTF0_INTR) | \
> INTF0 is set to INTF_NONE, no point in turning on the interrupt for it.
>
> https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-1-27ce1a5ab5c6@somainline.org/
>
>> +		     BIT(MDP_INTF1_INTR)
> And you might want to turn on MDP_INTF1_TEAR_INTR (same on SM6350), that
> could explain why INTF TE wasn't working on these SoCs yet.
>
> - Marijn

*sigh*

thanks!

Konrad


>
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 52750b592b36..29516273dd6b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -440,6 +440,14 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>>  	},
>>  };
>>  
>> +static const struct dpu_lm_sub_blks sm6375_lm_sblk = {
>> +	.maxwidth = 2048,
>> +	.maxblendstages = 4, /* excluding base layer */
>> +	.blendstage_base = { /* offsets relative to mixer base */
>> +		0x20, 0x38, 0x50, 0x68
>> +	},
>> +};
>> +
>>  /* QCM2290 */
>>  
>>  static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>> @@ -751,6 +759,11 @@ static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
>>  	{.fl = 0, .lut = 0x0011222222335777},
>>  };
>>  
>> +static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
>> +	{.fl = 0, .lut = 0x0011223344556677 },
>> +	{.fl = 0, .lut = 0x0011223445566777 },
>> +};
>> +
>>  static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>>  	{.fl = 0, .lut = 0x0011222222223357 },
>>  };
>> @@ -808,6 +821,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>>  #include "catalog/dpu_6_3_sm6115.h"
>>  #include "catalog/dpu_6_4_sm6350.h"
>>  #include "catalog/dpu_6_5_qcm2290.h"
>> +#include "catalog/dpu_6_9_sm6375.h"
>>  
>>  #include "catalog/dpu_7_0_sm8350.h"
>>  #include "catalog/dpu_7_2_sc7280.h"
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index f9611bd75e02..b4f193037869 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -884,6 +884,7 @@ extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>>  extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>> +extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 46be7ad8d615..980c3c8f8269 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1287,6 +1287,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>  	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>>  	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>>  	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>> +	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
>>  	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>>  	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>>  	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
>>
>> -- 
>> 2.40.0
>>
