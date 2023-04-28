Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538F6F17AA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACDC10ED1F;
	Fri, 28 Apr 2023 12:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F0910ED02
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:24:51 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94f6c285d22so1855113966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682684689; x=1685276689;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q3bSao3dIZoa2P7axrw3LC5ax3R0t4aXyUSCE/k2fx0=;
 b=hNoVP1s2EzPBTmSV7px5DfkOZBqeNBXHMNN2cqR9fS17u3XRJg3pbzdUCwEHVxyLOA
 +Gy2BR4VLzzuLUrNyeDsuDYCIohyASa/0eD94XO5vnVOwT/DK3d5q0wPYWPu/HfHtLd8
 bZmRyhe7h9AnA4GgnLhwEsU0jPS2N4KtwCuPjI3MsF9bWvM6agYp+wzpLbk/9rsTeo9/
 stVLxwIAhj+xCNHp2/mWNi/2JcHiTCQvMXTD5FcCkOesCyH+bpDI7Q2vmnCsMrGA9Bk1
 3TNe3N8nPgX9ORJJc2O+OmY6fqtdkFKNoEPhUDBWOo68c2xtFJRnQXkuwrtI/JQ3JcgZ
 m8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682684689; x=1685276689;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3bSao3dIZoa2P7axrw3LC5ax3R0t4aXyUSCE/k2fx0=;
 b=QKToYxegofoulVQ+HckK9E4IxXuI/3HNvOwl8qQjgs5298Mcub6+ANsrohkCvosqu+
 qerp9SkWnwK/MeA4kQxz9CM6+LDPNd0UtS/2PPqN3hI7Z2B8mzegcChJ6JN+Ryc0r0EM
 2jCc39ATw/FnrQubSl/e8tQQp2EsOrc0xjioT05Rh2CD5NDe48wdVbJOPbYEhbgq3LYt
 +HSfiPq+No8tqFqyBOXA8bmkdf0oDg81xCgBPvKU7LB5vtzNVXyjoD6MeuBR7qhjEgGl
 PKD3HWSc3/4LCdRZHXruiQJwkmd6m5mApmBWk9AGmC5GDk3taRu70MT3IlToABojStNs
 L4LA==
X-Gm-Message-State: AC+VfDw0lRifBuifC8tFiyoOku9sM9qtZ1/YXbRKrBz4GvfWK5qbyzQb
 rkiYs1XVW8GkOevY7dw7ElLDQg==
X-Google-Smtp-Source: ACHHUZ77IOZK63RmVT8TpDfpoFZAJAjx69P/jqEggrfGcqWpRilr9vvnEpGwCjb2+M/FqeNTEFkqmw==
X-Received: by 2002:a17:906:5d09:b0:94e:ea07:4b87 with SMTP id
 g9-20020a1709065d0900b0094eea074b87mr4788932ejt.27.1682684689278; 
 Fri, 28 Apr 2023 05:24:49 -0700 (PDT)
Received: from [172.23.4.26] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 my17-20020a1709065a5100b0095728081944sm9873225ejc.146.2023.04.28.05.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:24:48 -0700 (PDT)
Message-ID: <7b67a1cb-0c3e-22be-a104-c10407dad5a7@linaro.org>
Date: Fri, 28 Apr 2023 13:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[...]


>> +
>> +static const struct dpu_caps sm6350_dpu_caps = {
>> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +	.max_mixer_blendstages = 0x7,
>> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> I thought it was QSEED3LITE, but doesn't really matter as both are
> handled similarly.  It'll anyway change when I resubmit:
>
> https://lore.kernel.org/linux-arm-msm/20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org/T/#u
>
> which should hardcode the register value directly, making this field
> superfluous.

Okay, so I'll just resubmit as-is, I suppose?

[...]


>> +static const struct dpu_lm_cfg sm6350_lm[] = {
>> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>> +		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>> +		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
> These two entries are indented with two tabs and have one character too
> many to align with the opening parenthesis on the previous line.  Can we
> please settle on a single style, as this commit mostly uses tabs+spaces
> to align with the opening parenthesis?
>
> Dmitry vouched for `cino=(0` (when in unclosed parenthesis, align next
> line with zero extra characters to the opening parenthesis), but I find
> double tabs more convenient as it doesn't require reindenting when
> changing the name of the macro (which happened too often in my INTF TE
> series).

sure, let's go with that Dmitry suggested!

Konrad

>
>> +};
>> +
>> +static const struct dpu_dspp_cfg sm6350_dspp[] = {
>> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +		 &sm8150_dspp_sblk),
>> +};
>> +
>> +static struct dpu_pingpong_cfg sm6350_pp[] = {
>> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> +	       -1),
>> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>> +	       -1),
> Glad to see no TE2 here, we just removed it from all of DPU >= 5.0.0
> instead of >= 7.0.0 in [1] as downstream DTS turned out to be wrong.
>
> [1]: https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-2-27ce1a5ab5c6@somainline.org/
>
> - Marijn
>
>> +};
>> +
>> +static const struct dpu_intf_cfg sm6350_intf[] = {
>> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2c0, INTF_DP, 0, 35, INTF_SC7180_MASK,
>> +		 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>> +		 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK,
>> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>> +};
>> +
>> +static const struct dpu_vbif_cfg sm6350_vbif[] = {
>> +	{
>> +	.name = "vbif_0", .id = VBIF_RT,
>> +	.base = 0, .len = 0x1044,
>> +	.features = BIT(DPU_VBIF_QOS_REMAP),
>> +	.xin_halt_timeout = 0x4000,
>> +	.qos_rt_tbl = {
>> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
>> +		.priority_lvl = sdm845_rt_pri_lvl,
>> +	},
>> +	.qos_nrt_tbl = {
>> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
>> +		.priority_lvl = sdm845_nrt_pri_lvl,
>> +	},
>> +	.memtype_count = 14,
>> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
>> +	},
>> +};
>> +
>> +static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
>> +	{.fl = 0, .lut = 0x0011223344556677 },
>> +	{.fl = 0, .lut = 0x0011223445566777 },
>> +};
>> +
>> +static const struct dpu_perf_cfg sm6350_perf_data = {
>> +	.max_bw_low = 4200000,
>> +	.max_bw_high = 5100000,
>> +	.min_core_ib = 2500000,
>> +	.min_llcc_ib = 0,
>> +	.min_dram_ib = 1600000,
>> +	.min_prefill_lines = 35,
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
>> +const struct dpu_mdss_cfg dpu_sm6350_cfg = {
>> +	.caps = &sm6350_dpu_caps,
>> +	.ubwc = &sm6350_ubwc_cfg,
>> +	.mdp_count = ARRAY_SIZE(sm6350_mdp),
>> +	.mdp = sm6350_mdp,
>> +	.ctl_count = ARRAY_SIZE(sm6350_ctl),
>> +	.ctl = sm6350_ctl,
>> +	.sspp_count = ARRAY_SIZE(sm6350_sspp),
>> +	.sspp = sm6350_sspp,
>> +	.mixer_count = ARRAY_SIZE(sm6350_lm),
>> +	.mixer = sm6350_lm,
>> +	.dspp_count = ARRAY_SIZE(sm6350_dspp),
>> +	.dspp = sm6350_dspp,
>> +	.pingpong_count = ARRAY_SIZE(sm6350_pp),
>> +	.pingpong = sm6350_pp,
>> +	.intf_count = ARRAY_SIZE(sm6350_intf),
>> +	.intf = sm6350_intf,
>> +	.vbif_count = ARRAY_SIZE(sm6350_vbif),
>> +	.vbif = sm6350_vbif,
>> +	.reg_dma_count = 1,
>> +	.dma_cfg = &sm8250_regdma,
>> +	.perf = &sm6350_perf_data,
>> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
>> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> +		     BIT(MDP_INTF0_INTR) | \
>> +		     BIT(MDP_INTF1_INTR)
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index db558a9ae36e..52750b592b36 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -806,6 +806,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>>  #include "catalog/dpu_6_0_sm8250.h"
>>  #include "catalog/dpu_6_2_sc7180.h"
>>  #include "catalog/dpu_6_3_sm6115.h"
>> +#include "catalog/dpu_6_4_sm6350.h"
>>  #include "catalog/dpu_6_5_qcm2290.h"
>>  
>>  #include "catalog/dpu_7_0_sm8350.h"
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 756bff1d2185..f9611bd75e02 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -320,6 +320,8 @@ enum dpu_qos_lut_usage {
>>  	DPU_QOS_LUT_USAGE_LINEAR,
>>  	DPU_QOS_LUT_USAGE_MACROTILE,
>>  	DPU_QOS_LUT_USAGE_NRT,
>> +	DPU_QOS_LUT_USAGE_CWB,
>> +	DPU_QOS_LUT_USAGE_MACROTILE_QSEED,
>>  	DPU_QOS_LUT_USAGE_MAX,
>>  };
>>  
>> @@ -880,6 +882,7 @@ extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>> +extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>>  extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 0e7a68714e9e..46be7ad8d615 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1286,6 +1286,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>  	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
>>  	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>>  	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>> +	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>>  	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>>  	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>>  	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
>>
>> -- 
>> 2.40.0
>>
