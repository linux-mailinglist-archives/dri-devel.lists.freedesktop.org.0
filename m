Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5041624C45
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 21:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D24410E8A8;
	Thu, 10 Nov 2022 20:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D1E10E8A8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 20:59:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g12so5429223lfh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 12:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPzwJ0PuXiUbKvsrJ06WJ6xmWxUxN1THnWmmp4034WE=;
 b=yG6nHVpQuzzFVz6yvEV3w/69bkIvo52BB/na+saBklbvjhNtuO02r0GyEbN8D7bcow
 d06VDwPpbFl6HKu8NCmP0CUrTa8L+iRRoqMNX9qfhXkjhjGATLNssvzfBz1XPmIBIWeV
 zVcHWF09XhIyhJiAwVQnMOYqoOiTyezHDTcXnhel+Puho2O18q7xa+bXnuisG4bCDMH3
 8/v5aBGeDzSgFJMjL7Qz7Ytm9Qt7ACZQArGZVOT/HcX5Mcn+DpuNAzYhoda4uBYoOBUo
 cSbPi4brWxNlDIlUHHn05srt6A3VJgdQwDRqx3B+Dm8NdSJJMNotXKWnGZvUX+k9ixYb
 uPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NPzwJ0PuXiUbKvsrJ06WJ6xmWxUxN1THnWmmp4034WE=;
 b=MWor5LaXDlamAF2RYbMp1qOOkl638VHc4Kcr4/Wo1Rh9g33j1/fHjIy0Ze9Un4A2oP
 XryJPC8t5Y4zc0XaJZjcPYSGT55cBa29gp8eF+hNvbfbV+KYM93gCcDJNtP3JrsHKUpS
 HRs6u1Jf3kxlgaM9YATZlk2K7EaILLAxFzoO5tatmUtNm/+AUiAZArBlOhMmP+hU22vb
 8aaKRgxDQIUpmdGSVIqPrf1HYrsIfU960sxWnvoPMXySpZxxKlMyVehWJch1jFZu4xL4
 t8AMzSzubN0Uebm9TGVi5ZiW9aRSh7voVTiuYcmSl54c+WoIK0FZUVYCa2uLkm4yWyMF
 31tQ==
X-Gm-Message-State: ACrzQf0j45P4udwlFDgf4oz3P2kmC8l4O/eYEv47gcRuzTBsVdfaTVC4
 DIiVXCidRRxiMG7d4x9IOUIshA==
X-Google-Smtp-Source: AMsMyM6cudTLCzjmTVK3yyobzbr2fXsgVAgsu+g4SGinMovjzgJLyG7TkECfmdT/3hOD83nxJvWqNQ==
X-Received: by 2002:a05:6512:782:b0:4a2:70de:3546 with SMTP id
 x2-20020a056512078200b004a270de3546mr1752602lfr.420.1668113984700; 
 Thu, 10 Nov 2022 12:59:44 -0800 (PST)
Received: from [192.168.1.112] (95.49.32.193.neoplus.adsl.tpnet.pl.
 [95.49.32.193]) by smtp.gmail.com with ESMTPSA id
 o14-20020ac24e8e000000b004a93b8508edsm19683lfr.181.2022.11.10.12.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 12:59:44 -0800 (PST)
Message-ID: <5af3bed1-aa2e-3dc7-08f1-eeb39f03903a@linaro.org>
Date: Thu, 10 Nov 2022 21:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 7/8] drm/msm/dpu: add support for SM8450
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-8-dmitry.baryshkov@linaro.org>
 <d171b737-0d46-df31-05ad-c35593d8dbf5@somainline.org>
 <fc7a4a61-75e2-2111-39f5-7c7103f1c6dd@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <fc7a4a61-75e2-2111-39f5-7c7103f1c6dd@linaro.org>
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



On 10/11/2022 21:28, Dmitry Baryshkov wrote:
> On 04/11/2022 17:12, Konrad Dybcio wrote:
>>
>> On 04/11/2022 14:03, Dmitry Baryshkov wrote:
>>> Add definitions for the display hardware used on Qualcomm SM8450
>>> platform.
>>>
>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>
>>
>> Konrad
>>
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>>   4 files changed, 229 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 1ce237e18506..3934d8976833 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -124,6 +124,15 @@
>>>                 BIT(MDP_AD4_0_INTR) | \
>>>                 BIT(MDP_AD4_1_INTR))
>>> +#define IRQ_SM8450_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> +             BIT(MDP_INTF0_7xxx_INTR) | \
>>> +             BIT(MDP_INTF1_7xxx_INTR) | \
>>> +             BIT(MDP_INTF2_7xxx_INTR) | \
>>> +             BIT(MDP_INTF3_7xxx_INTR) | \
>>> +             0)
>>> +
>>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>>                BIT(DPU_WB_UBWC) | \
>>>                BIT(DPU_WB_YUV_CONFIG) | \
>>> @@ -367,6 +376,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
>>>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>   };
>>> +static const struct dpu_caps sm8450_dpu_caps = {
>>> +    .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>> +    .max_mixer_blendstages = 0xb,
>>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>>> +    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>>> +    .ubwc_version = DPU_HW_UBWC_VER_40,
>>> +    .has_src_split = true,
>>> +    .has_dim_layer = true,
>>> +    .has_idle_pc = true,
>>> +    .has_3d_merge = true,
>>> +    .max_linewidth = 5120,
>>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>> +};
>>> +
>>>   static const struct dpu_caps sc7280_dpu_caps = {
>>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>       .max_mixer_blendstages = 0x7,
>>> @@ -504,6 +527,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>>>       },
>>>   };
>>> +static const struct dpu_mdp_cfg sm8450_mdp[] = {
>>> +    {
>>> +    .name = "top_0", .id = MDP_TOP,
>>> +    .base = 0x0, .len = 0x494,
>>> +    .features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>>> +    .highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
>>
>> I think it's about time we handle the two-memory-configs situation..
>>
>> In my opinion, a dt property would be sane (just like downstream does 
>> it), as it's
>>
>> *really really really* unlikely that the same SKU would be shipped 
>> with 2 different memory gens.
> 
> As it's really unlikely, I think we can drop the TODO comment completely 
> until we phase a device with different memory type. WDYT?
It's really unlikely that the same device model (for example Xperia 1 
III) is shipped in 2 memory configurations that would have to be 
discerned dynamically somehow.

It is however very likely that, for example Xiaomi releases a 888 phone 
with LPDDR4X and Sony releases one with LPDDR5. So it's a per-device 
thing, not exactly per-SoC.

Konrad
> 
