Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A146792F1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 09:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA37810E628;
	Tue, 24 Jan 2023 08:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2B210E627
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 08:22:23 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id mp20so36858846ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=10CFxTlQsV2XT/FA+pa10z3fXpM8LP41xyVcTJcDSbM=;
 b=rIf/epmMvDHt2OqFdmt5UTHyNAFyuGyvx237eSawrAnCjQP6M5Mpe2pfnrArbj8m4P
 a/zFgYaTSwOrVfdxSO0mla3xE/XqJo/FoN79U7tzRr+AR1mZDQWr97OT5IWHu9Gq+VtZ
 UaSwiFXtpOqsdPwdF22/J2LlucXwfqsAEcP9gZJ7GJQ/MJ++ApydwgZWS/JfACFZdLpj
 E8NDtMMlIAMQAxdvtYfUUXRoFshfmkhI23Ewxe3q7tEBv335kWUeXhHQ7O7/oo8Iote1
 110sSzj0aoNMcEYhereObZtmNcQ5Ax9XSkm/OlX5IWOnU8T2XraabcVDnH3ECAVWQsvU
 Q88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=10CFxTlQsV2XT/FA+pa10z3fXpM8LP41xyVcTJcDSbM=;
 b=3pbxbnkCAGCArTvq57vBAvZJouk2UwJMmaVOja3D1Gmq7DCMYH7swoykZCNW8L9Itb
 vqiBZnEXSNv6Lwq3K4Yf3YZ8syfObutCXnWh3G9bIwBQdNNoVx7LIZodGTVk7StgWiy8
 2+rjvy1IjekMAPJ7RcGgGS6MFYtnOviAt2VKliX69CCaoDvdkTtKGBw7aKIoREks9eJ+
 2hjJyzDWbFPbnV5NbRlneXRsO0IX0LLFhXfrIkBeAlcibFni4sSiPNz/v8ieCj5C0BtH
 Ut1B8upZ0aX1um+RB3WgnNfQ01p0zRXL4rGejzb3P9I1lsEVI/gtK6qxvtvaOJAFs6oG
 pPJw==
X-Gm-Message-State: AFqh2kqhPDRBqAZP/B853+97QEbsDOHWiqvHgskeIz9+hX6YVqoxM2W9
 X7nAsyfFTYFo0vT24loWctG9BQ==
X-Google-Smtp-Source: AMrXdXu8qeykb/OtKDqIq4jlljRZv3PAlD8LiOkswhtGg/G0ePbb3FjNHUcpRu2B66eYlbiqvkBIyw==
X-Received: by 2002:a17:907:d506:b0:7c0:be4d:46d6 with SMTP id
 wb6-20020a170907d50600b007c0be4d46d6mr32195352ejc.59.1674548542198; 
 Tue, 24 Jan 2023 00:22:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a056402139500b0049c2b02bad4sm715477edv.88.2023.01.24.00.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 00:22:21 -0800 (PST)
Message-ID: <df8a130f-2020-833c-d4f1-088c1fd7e5ef@linaro.org>
Date: Tue, 24 Jan 2023 10:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/dpu: disable features unsupported by QCM2290
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230123071145.3056242-1-dmitry.baryshkov@linaro.org>
 <ecec7adb-a1ab-ba38-c38a-26f23f81cf68@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ecec7adb-a1ab-ba38-c38a-26f23f81cf68@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/01/2023 03:32, Abhinav Kumar wrote:
> 
> 
> On 1/22/2023 11:11 PM, Dmitry Baryshkov wrote:
>> QCM2290 doesn't seem to support reg-dma, smart-dma, UBWC, CDP, exclusion
>> rectangles and CSC. Drop corresponding features being incorrectly
>> enabled for qcm2290.
>>
> 
> Can you please point me to which vendor DT you are referring to for this?
> 
> CSC is supported on the VIG SSPPs from what I can see.

https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi

No CSC, smart-dma, excl-rect, CDP, etc.

> QCM2290 should be using the same MDP version as 6115 from the HW version.

It is 6.3 vs 6.5 if I remember correctly.

> 
> 
>> Cc: Loic Poulain <loic.poulain@linaro.org>
>> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
>>   1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 289fb11f99d1..1c3ffa922794 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -12,10 +12,14 @@
>>   #include "dpu_hw_catalog.h"
>>   #include "dpu_kms.h"
>> -#define VIG_MASK \
>> +#define VIG_BASE_MASK \
>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>> +    BIT(DPU_SSPP_TS_PREFILL))
>> +
>> +#define VIG_MASK \
>> +    (VIG_BASE_MASK | \
>>       BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
>> -    BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
>> +    BIT(DPU_SSPP_EXCL_RECT))
>>   #define VIG_MSM8998_MASK \
>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>> @@ -29,7 +33,7 @@
>>   #define VIG_SM8250_MASK \
>>       (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>> -#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>> +#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>   #define DMA_MSM8998_MASK \
>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>> @@ -50,6 +54,10 @@
>>   #define DMA_CURSOR_MSM8998_MASK \
>>       (DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
>> +#define DMA_QCM2290_MASK \
>> +    (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>> +    BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1))
>> +
>>   #define MIXER_MSM8998_MASK \
>>       (BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
>> @@ -316,8 +324,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
>>   static const struct dpu_caps qcm2290_dpu_caps = {
>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>       .max_mixer_blendstages = 0x4,
>> -    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
>> -    .ubwc_version = DPU_HW_UBWC_VER_20,
>>       .has_dim_layer = true,
>>       .has_idle_pc = true,
>>       .max_linewidth = 2160,
>> @@ -1384,7 +1390,7 @@ static const struct dpu_sspp_sub_blks 
>> qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>>   static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>>       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
>>            qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_QCM2290_MASK,
>>            qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>   };
>> @@ -2836,8 +2842,6 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg 
>> = {
>>       .intf = qcm2290_intf,
>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>       .vbif = sdm845_vbif,
>> -    .reg_dma_count = 1,
>> -    .dma_cfg = &sdm845_regdma,
>>       .perf = &qcm2290_perf_data,
>>       .mdss_irqs = IRQ_SC7180_MASK,
>>   };

-- 
With best wishes
Dmitry

