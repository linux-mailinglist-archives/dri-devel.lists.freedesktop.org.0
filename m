Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1426E9F9D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 01:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A642C10ED37;
	Thu, 20 Apr 2023 23:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7C10ED35
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 23:06:12 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2a8c28158e2so9568361fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 16:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682031970; x=1684623970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Iq3P9LE2lLhVt7f0u42TddEKoLH7a0Mo91959oUrXY=;
 b=MSUuyzE1l0JSGB22q7YCm0jM+ATI0FSNv3+pj6bX0Yimb2C8ImIsw+sWUbq5DU8dQj
 CRnz+mDBxCRwKj6t27knj/8xo6RXxy8+Eh7QDEhaPrFgn9QnJaCDwiM+TigKWpzJHpno
 MjjuxVLm4WJfxYZJR1pCBExFjE/A+5DR61xcXo4zMGeEY2zw6My8oU/FyOCMSNcX27Uc
 nShL8BOZXE/fT2XhY6eI1oq0Pdnfqf7g28zmGzqyKn/TMty4i49z4gkdUZ8yYIsRYRde
 n/tDNuAxdf1h9nweN4Jf0NIWo7IQ1JBCQMDCyToZ6E30Tl+NZYFwWkADH2yEqRD563md
 FS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682031970; x=1684623970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Iq3P9LE2lLhVt7f0u42TddEKoLH7a0Mo91959oUrXY=;
 b=V06lmQ3xAFWntrGCfEfJE9dXDNTRzgxxs4s3noKHe6AdpWPLm+/VX9CPKTFu3PEdXz
 jCODwQYqJ/M1JWq0brnXsesng9ClheT50rW8MKXIONneKfSIpwKAGDpr5WTf3cd3vYtP
 MsJSg9toPZZyD5g/xsJH/YaoGDlYcXRfLLt7WgsooDR9hBpx7i90OCovZE1fgfaF7y2D
 3AqGLlrscdEB1AGQSikvxSVKOwbrEf36meE4k+cS1DfQBnMOSVkyTjMDxLFrkX84r7zo
 nY9lKx8EAdgUrnBuK+7wa5uMQ6dQlAayVxaK/PGujGrjpr8Qk6ImoLDEp0kIIej3a6YM
 FWRA==
X-Gm-Message-State: AAQBX9eQPnq3BXaidEIvFop2SlpFlMfMD3yHioYy27sLiBZmZMsTT1nl
 bXNu+COoFSVn8YGI+iZJrr9Dtw==
X-Google-Smtp-Source: AKy350bBt5BpmEoHdXQlHN5nG8w1r3s7EbZzdzHBf3j9om/J/hqNCq4f0ttFD2Pu87UTVWGfIqsibg==
X-Received: by 2002:a2e:950f:0:b0:2a8:b7e9:82ee with SMTP id
 f15-20020a2e950f000000b002a8b7e982eemr100903ljh.1.1682031970055; 
 Thu, 20 Apr 2023 16:06:10 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a2e9b4f000000b00290b375a068sm405102ljj.39.2023.04.20.16.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 16:06:09 -0700 (PDT)
Message-ID: <4e7fec48-fdf9-b2d0-b4f6-128e22924ff2@linaro.org>
Date: Fri, 21 Apr 2023 02:06:09 +0300
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
 <fd2f43eb-aa10-eaf4-62f8-945a3152a28a@linaro.org>
 <4da9bd19-9403-812e-4554-847b18df78c9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4da9bd19-9403-812e-4554-847b18df78c9@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 02:05, Konrad Dybcio wrote:
> 
> 
> On 21.04.2023 00:41, Dmitry Baryshkov wrote:
>> On 21/04/2023 01:31, Konrad Dybcio wrote:
>>> Add SM6350 support to the DPU1 driver to enable display output.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
> [...]
> 
>>> +
>>> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
>>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>>> +         sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>>> +         sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>>> +         sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>>
>> DPU_CLK_CTRL_DMA0

This is DPU_CLK_CTRL_DMA1, I made a typo

>>
>>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>>> +         sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>>
>> DPU_CLK_CTRL_DMA2
> _DMA1?
> 

And this is DMA2, I was correct.


> 
>>
>>
>>> +};
>>> +
> 
>>> +static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
>>> +    {.fl = 0, .lut = 0x0011223344556677 },
>>> +    {.fl = 0, .lut = 0x0011223445566777 },
>>
>> Do we need two equal entries here?
> Hmm.. looks like the SDE driver dropped the fill level
> logic in 4.19 times and that might have thrown me off
> when porting this Since the [0] entry has what looks
> like a lower LUT value, should I give it .fl=1?
> 
> 
>>
>> Also please push the qos to the dpu_hw_catalog.c, I want to take another look at these structures and it is easier if all of them are beneath one's eyes.
> Will do.
> 
>>
>>> +};
>>> +
>>> +static const struct dpu_perf_cfg sm6350_perf_data = {
>>> +    .max_bw_low = 4200000,
>>> +    .max_bw_high = 5100000,
>>> +    .min_core_ib = 2500000,
>>> +    .min_llcc_ib = 0,
>>> +    .min_dram_ib = 1600000,
>>> +    .min_prefill_lines = 35,
>>> +    /* TODO: confirm danger_lut_tbl */
>>> +    .danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
> [...]
> 
> 
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -320,6 +320,8 @@ enum dpu_qos_lut_usage {
>>>        DPU_QOS_LUT_USAGE_LINEAR,
>>>        DPU_QOS_LUT_USAGE_MACROTILE,
>>>        DPU_QOS_LUT_USAGE_NRT,
>>> +    DPU_QOS_LUT_USAGE_CWB,
>>> +    DPU_QOS_LUT_USAGE_MACROTILE_QSEED,
>>
>> This should probably be removed. It would be nice to clean these things up, but not as a part of sm6350.
> Well, I won't be able to fill in the danger LUT table otherwise!
> 
> Konrad
>>
>>>        DPU_QOS_LUT_USAGE_MAX,
>>>    };
>>>    @@ -880,6 +882,7 @@ extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>>> +extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 0e7a68714e9e..46be7ad8d615 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1286,6 +1286,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>>        { .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
>>>        { .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>>>        { .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>>> +    { .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>>>        { .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>>>        { .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>>>        { .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
>>>
>>

-- 
With best wishes
Dmitry

