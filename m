Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF94624BC5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 21:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30C910E105;
	Thu, 10 Nov 2022 20:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A48E10E105
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 20:28:21 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id x21so2239553ljg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 12:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sd9YOa98jTIDGnNoAp2N24NxIMGU6LQKL4kGMhofZN8=;
 b=aJz+sgQqS/24bjUmgjwjEKfkanziTrN8PgcLoslW40Mt9RT3dOdGlM3s7i7BQjOBur
 YFn4PQLjQckQ6rOfkKmDeGcMg/WjE82ABnKJSEvGyWrWrLWh36bm23CwGmS6Z7pEB2GP
 e4Pg64fwB/7efulqWTZVqbp9F/tM0kKklj0+WMiL20gUG+d1ku0RLkJeuTbBdSyPvf+4
 H9qS2UTmJ4+huBuxI5F/cX2+s2f6mHTeI68kF3oogjobF9G70NhzI5WbtEQzPRONFTHs
 SYa/41jKKT7t6pgUjOu66mGCfY4BgChGCaTugRoFpbPbMXTiQUCBzpKnwy9hw1MhJUQX
 GS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sd9YOa98jTIDGnNoAp2N24NxIMGU6LQKL4kGMhofZN8=;
 b=UeB4IgS4r49B8CtT6ChXfLzL7dSXRlqst11Bv1OHNpeJNgSYvz/B4vMswPg4NQTLQO
 pEZA9LjqGyRSnuG/2owB/z+2hJRX2OkRjBJqDgfLZNPhEx/tRIiqCoqv/cRh9U+0X/EC
 ubacQB2Gp7BEp4XY/VmKqVGXEcJvkfc1sC6XHSKNgwwGiGy1U69PoK2LWKFLhNbRlu5G
 tus3ydqJYoV0j437f5K4nac9z7aOWVG4AUIVzNpiqrry74k+aRD/QYvxt7r3WAuP3/Ez
 z6t1SlGsp7HkpLNM6RbskoXUf8y0RDE/QIVXRnUXBONVmfeXNEvjFRLvZDtzwm0hjpoh
 T/cA==
X-Gm-Message-State: ACrzQf3fpSkbiUYI6s4GjIEG0SqUkDt8iYJJ/fdghml2iBpYm0y1Ua62
 sc+6XAP68ducbOtipSbVE7RMmg==
X-Google-Smtp-Source: AMsMyM7T6B7QKw+xW4apR9Cn3zi9ueQCGkpBoppy+5oFE8mV3RD0E+wT+JQTCbqK8ade+2Du8t8xPw==
X-Received: by 2002:a2e:80c4:0:b0:277:fa0:d500 with SMTP id
 r4-20020a2e80c4000000b002770fa0d500mr9170257ljg.51.1668112099609; 
 Thu, 10 Nov 2022 12:28:19 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05651220c200b00499bf7605afsm10183lfr.143.2022.11.10.12.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 12:28:19 -0800 (PST)
Message-ID: <fc7a4a61-75e2-2111-39f5-7c7103f1c6dd@linaro.org>
Date: Thu, 10 Nov 2022 23:28:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 7/8] drm/msm/dpu: add support for SM8450
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-8-dmitry.baryshkov@linaro.org>
 <d171b737-0d46-df31-05ad-c35593d8dbf5@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d171b737-0d46-df31-05ad-c35593d8dbf5@somainline.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 17:12, Konrad Dybcio wrote:
> 
> On 04/11/2022 14:03, Dmitry Baryshkov wrote:
>> Add definitions for the display hardware used on Qualcomm SM8450
>> platform.
>>
>> Tested-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> 
> Konrad
> 
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>   4 files changed, 229 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 1ce237e18506..3934d8976833 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -124,6 +124,15 @@
>>                 BIT(MDP_AD4_0_INTR) | \
>>                 BIT(MDP_AD4_1_INTR))
>> +#define IRQ_SM8450_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> +             BIT(MDP_INTF0_7xxx_INTR) | \
>> +             BIT(MDP_INTF1_7xxx_INTR) | \
>> +             BIT(MDP_INTF2_7xxx_INTR) | \
>> +             BIT(MDP_INTF3_7xxx_INTR) | \
>> +             0)
>> +
>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>                BIT(DPU_WB_UBWC) | \
>>                BIT(DPU_WB_YUV_CONFIG) | \
>> @@ -367,6 +376,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
>>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>> +static const struct dpu_caps sm8450_dpu_caps = {
>> +    .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +    .max_mixer_blendstages = 0xb,
>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>> +    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>> +    .ubwc_version = DPU_HW_UBWC_VER_40,
>> +    .has_src_split = true,
>> +    .has_dim_layer = true,
>> +    .has_idle_pc = true,
>> +    .has_3d_merge = true,
>> +    .max_linewidth = 5120,
>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
>>   static const struct dpu_caps sc7280_dpu_caps = {
>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>       .max_mixer_blendstages = 0x7,
>> @@ -504,6 +527,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>>       },
>>   };
>> +static const struct dpu_mdp_cfg sm8450_mdp[] = {
>> +    {
>> +    .name = "top_0", .id = MDP_TOP,
>> +    .base = 0x0, .len = 0x494,
>> +    .features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>> +    .highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> 
> I think it's about time we handle the two-memory-configs situation..
> 
> In my opinion, a dt property would be sane (just like downstream does 
> it), as it's
> 
> *really really really* unlikely that the same SKU would be shipped with 
> 2 different memory gens.

As it's really unlikely, I think we can drop the TODO comment completely 
until we phase a device with different memory type. WDYT?

-- 
With best wishes
Dmitry

