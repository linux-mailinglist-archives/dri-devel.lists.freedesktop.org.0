Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5334BAE04
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 01:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF8510E8CD;
	Fri, 18 Feb 2022 00:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6AD10E8CD
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 00:13:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p22so2288224lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OP5QK+CcrWBVeRF/jSxS+WC/kWaYTAIsiPiOXeHxvRk=;
 b=nEa3AFKSSUtqCtrcCJ1xMGF5xOWTsu2Nk3FsOCdEaSALGalQkqZl0eQveyfDqxpqMs
 HgXvOzQTcBfksSsivZ7nTg33m3/zavkeQaQSy1mc+hwCwzTvjQ4ryWMW9BG286zs9Fuh
 vEomEfhJOT4d0VkQcAg31d0cEqnDIs7OqCv2+0N/Q3Unu1EKskkwoEYNMlFxQ+wpcCXP
 yujPmy+vJG7C3lQkCrhMF7kL0J640u/2iRbeJ0Xbs8MI9P0B2ZEOIcEfyEQSNcoCWIbU
 ibp0IF89KGg5SEz7JG3dglsRuW+oFIPtiV/LHep5v5sUQ1iY4Mz8NGoglU2spOMnutYY
 d05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OP5QK+CcrWBVeRF/jSxS+WC/kWaYTAIsiPiOXeHxvRk=;
 b=eNQ1CL9cv3HuqLL5TIg9jqVlpU1XvxSqT08AVtL2aQaYPrFqiQmXgUvkWl/NQxH+Bj
 F92vPQmxElAQDhRKS2qj0KHjlp0H9lT/7Xni2ObDTbzELm3spFNjO5gEd1Z4PMKqGeik
 vJrPSWJ1eC7q9pmRzM97v5B3sPSI9Q7EthgV78crdn1/Maomb23wMLCN9SteyUPujT2C
 KCP0yoqr6OWDQH04PnEu40noUB2VYYCKL2/l01iW6pYTQ2n59BI0Au/hDshylKj26maJ
 EioeE2HjBeMdsmliAXaprQYPph4VHvy/hbV8qeY3t6hlEWs15m1D/wYQQzdoknijRpzX
 OqlA==
X-Gm-Message-State: AOAM5329SBJT/Vyhtg9AqQYS+4iqFc7Wg0g7KbrNAe2GiSs6hta86EwC
 dLw1JFtIh4kFYXcP/Rv2u8Ua/g==
X-Google-Smtp-Source: ABdhPJwIwVUM8NHjVSRJYbPdyQyNlD/oM0bEd7VesWIW4JJWuC6XwHWeRi4rE95xYsEjV4TqcaYqmQ==
X-Received: by 2002:a05:6512:4017:b0:443:b9ee:2a3d with SMTP id
 br23-20020a056512401700b00443b9ee2a3dmr311042lfb.593.1645143185318; 
 Thu, 17 Feb 2022 16:13:05 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t30sm96285lfp.222.2022.02.17.16.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 16:13:04 -0800 (PST)
Message-ID: <9c010dcf-94e4-247b-3233-27320a646812@linaro.org>
Date: Fri, 18 Feb 2022 03:13:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
 <20220215043353.1256754-2-bjorn.andersson@linaro.org>
 <be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com>
 <Ygvisfhi0SY6XdAz@builder.lan>
 <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
 <CAA8EJprCaiPW=Kk0B69RNNwAk0xcqaxQA031sfR0ky+BfzcWKQ@mail.gmail.com>
 <ceb861e5-b1c8-d33e-c0b0-bea0b4cc0b66@quicinc.com>
 <CAA8EJppj+OBPVUgvefO38zp1RHpJw5pL0-4DCkgn3iAcPH-ptA@mail.gmail.com>
 <d0cac12e-7c03-2ba3-fb8d-aee09b72a1b1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d0cac12e-7c03-2ba3-fb8d-aee09b72a1b1@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/02/2022 04:34, Abhinav Kumar wrote:
> 
> 
> On 2/15/2022 4:20 PM, Dmitry Baryshkov wrote:
>> On Tue, 15 Feb 2022 at 23:21, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>> On 2/15/2022 10:42 AM, Dmitry Baryshkov wrote:
>>>> On Tue, 15 Feb 2022 at 20:42, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>> On 2/15/2022 9:28 AM, Bjorn Andersson wrote:
>>>>>> On Tue 15 Feb 11:14 CST 2022, Abhinav Kumar wrote:
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 2/14/2022 8:33 PM, Bjorn Andersson wrote:
>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>
>>>>>>>> Add SC8180x to the hardware catalog, for initial support for the
>>>>>>>> platform. Due to limitations in the DP driver only one of the 
>>>>>>>> four DP
>>>>>>>> interfaces is left enabled.
>>>>>>>>
>>>>>>>> The SC8180x platform supports the newly added DPU_INTF_WIDEBUS 
>>>>>>>> flag and
>>>>>>>> the Windows-on-Snapdragon bootloader leaves the widebus bit set, 
>>>>>>>> so this
>>>>>>>> is flagged appropriately to ensure widebus is disabled - for now.
>>>>>>>>
>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>>> [bjorn: Reworked intf and irq definitions]
>>>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> Changes since v1:
>>>>>>>> - Dropped widebus flag
>>>>>>>>
>>>>>>>>      .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 129 
>>>>>>>> ++++++++++++++++++
>>>>>>>>      .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>>>>>>>      drivers/gpu/drm/msm/msm_drv.c                 |   1 +
>>>>>>>>      4 files changed, 132 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>> index aa75991903a6..7ac0fe32df49 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>> @@ -90,6 +90,17 @@
>>>>>>>>                        BIT(MDP_INTF3_INTR) | \
>>>>>>>>                        BIT(MDP_INTF4_INTR))
>>>>>>>> +#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>>>>>> +                     BIT(MDP_SSPP_TOP0_INTR2) | \
>>>>>>>> +                     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>>>>>> +                     BIT(MDP_INTF0_INTR) | \
>>>>>>>> +                     BIT(MDP_INTF1_INTR) | \
>>>>>>>> +                     BIT(MDP_INTF2_INTR) | \
>>>>>>>> +                     BIT(MDP_INTF3_INTR) | \
>>>>>>>> +                     BIT(MDP_INTF4_INTR) | \
>>>>>>>> +                     BIT(MDP_INTF5_INTR) | \
>>>>>>>> +                     BIT(MDP_AD4_0_INTR) | \
>>>>>>>> +                     BIT(MDP_AD4_1_INTR))
>>>>>>>>      #define DEFAULT_PIXEL_RAM_SIZE           (50 * 1024)
>>>>>>>>      #define DEFAULT_DPU_LINE_WIDTH           2048
>>>>>>>> @@ -225,6 +236,22 @@ static const struct dpu_caps 
>>>>>>>> sm8150_dpu_caps = {
>>>>>>>>       .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>>>>      };
>>>>>>>> +static const struct dpu_caps sc8180x_dpu_caps = {
>>>>>>>> +   .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>>>>> +   .max_mixer_blendstages = 0xb,
>>>>>>>> +   .qseed_type = DPU_SSPP_SCALER_QSEED3,
>>>>>>>> +   .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>>>>>>>> +   .ubwc_version = DPU_HW_UBWC_VER_30,
>>>>>>>> +   .has_src_split = true,
>>>>>>>> +   .has_dim_layer = true,
>>>>>>>> +   .has_idle_pc = true,
>>>>>>>> +   .has_3d_merge = true,
>>>>>>>> +   .max_linewidth = 4096,
>>>>>>>> +   .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>>> +   .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>>> +   .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>      static const struct dpu_caps sm8250_dpu_caps = {
>>>>>>>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>>>>>       .max_mixer_blendstages = 0xb,
>>>>>>>> @@ -293,6 +320,31 @@ static const struct dpu_mdp_cfg 
>>>>>>>> sc7180_mdp[] = {
>>>>>>>>       },
>>>>>>>>      };
>>>>>>>> +static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>>>>>>>> +   {
>>>>>>>> +   .name = "top_0", .id = MDP_TOP,
>>>>>>>> +   .base = 0x0, .len = 0x45C,
>>>>>>>> +   .features = 0,
>>>>>>>> +   .highest_bank_bit = 0x3,
>>>>>>>> +   .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>>>>>>>> +                   .reg_off = 0x2AC, .bit_off = 0},
>>>>>>>> +   .clk_ctrls[DPU_CLK_CTRL_VIG1] = {
>>>>>>>> +                   .reg_off = 0x2B4, .bit_off = 0},
>>>>>>>> +   .clk_ctrls[DPU_CLK_CTRL_VIG2] = {
>>>>>>>> +                   .reg_off = 0x2BC, .bit_off = 0},
>>>>>>>> +   .clk_ctrls[DPU_CLK_CTRL_VIG3] = {
>>>>>>>> +                   .reg_off = 0x2C4, .bit_off = 0},
>>>>>>>> +   .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>>>>>>>> +                   .reg_off = 0x2AC, .bit_off = 8},
>>>>>>>> +   .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>>>>>>>> +                   .reg_off = 0x2B4, .bit_off = 8},
>>>>>>>> +   .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
>>>>>>>> +                   .reg_off = 0x2BC, .bit_off = 8},
>>>>>>>> +   .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
>>>>>>>> +                   .reg_off = 0x2C4, .bit_off = 8},
>>>>>>>> +   },
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>      static const struct dpu_mdp_cfg sm8250_mdp[] = {
>>>>>>>>       {
>>>>>>>>       .name = "top_0", .id = MDP_TOP,
>>>>>>>> @@ -861,6 +913,16 @@ static const struct dpu_intf_cfg 
>>>>>>>> sc7280_intf[] = {
>>>>>>>>       INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, 
>>>>>>>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 
>>>>>>>> 22, 23),
>>>>>>>>      };
>>>>>>>> +static const struct dpu_intf_cfg sc8180x_intf[] = {
>>>>>>>> +   INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 
>>>>>>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 
>>>>>>>> 24, 25),
>>>>>>>> +   INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
>>>>>>>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>>>>>>> +   INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, 
>>>>>>>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>>>>>>>> +   /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy 
>>>>>>>> index until this is supported */
>>>>>>>> +   INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, 
>>>>>>>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>>>>>>> +   INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 
>>>>>>>> MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 
>>>>>>>> 20, 21),
>>>>>>>> +   INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 
>>>>>>>> MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 
>>>>>>>> 22, 23),
>>>>>>>
>>>>>>> This is a continued discussion from
>>>>>>> https://patchwork.freedesktop.org/patch/474179/.
>>>>>>>
>>>>>>> Shouldnt INTF_5 be marked as INTF_eDP?
>>>>>>>
>>>>>>
>>>>>> Might be, I didn't even know we had an INTF_EDP define...
>>>>>>
>>>>>> Is there any reason to distinguish DP and EDP in the DPU?  I see 
>>>>>> sc7280
>>>>>> doesn't distinguish the DP and EDP interfaces.
>>>>>>
>>>>>> Regards,
>>>>>> Bjorn
>>>>>>
>>>>>
>>>>> Like I have mentioned in the other patch, I think we have enough
>>>>> confusion between eDP and DP with the common driver. Since DPU does 
>>>>> have
>>>>> separate interfaces I think we should fix that.
>>>>>
>>>>> Regarding sc7280 using INTF_DP, I synced up with Sankeerth. He 
>>>>> referred
>>>>> to your change
>>>>> https://patchwork.freedesktop.org/patch/457776/?series=92992&rev=5 
>>>>> as it
>>>>> was posted earlier and ended up using the same INTF_DP macro. So its
>>>>> turning out to be a cyclical error.
>>>>>
>>>>> I think we should fix both.
>>>>
>>>> So, what is the value for DPU to distinguish between eDP and DP 
>>>> interfaces?
>>>> Would we get anything except the (intf_type == INTF_EDP || intf_type
>>>> == INTF_DP) instead of (intf_type == INTF_DP) in all the cases where
>>>> the type is checked?
>>>
>>> There are only two places currently where I am seeing this OR condition
>>> between INTF_DP and INTF_eDP. I do not have an example to give you today
>>> of where we would need to distinguish eDP and DP but I cannot guarantee
>>> we will not have such a case.
>>>
>>>> (thus leading us to cases when someone would forget to add INTF_EDP
>>>> next to INTF_DP)
>>>>
>>>> Also, if we are switching from INTF_DP to INTF_EDP, should we stop
>>>> using end-to-end numbering (like MSM_DP_CONTROLLER_2 for INTF_5) and
>>>> add a separate numbering scheme for INTF_EDP?
>>>>
>>> We should change the controller ID to match what it actually is.
>>>
>>> Now that you pointed this out, this looks even more confusing to me to
>>> say that  MSM_DP_CONTROLLER_2 is actually a EDP controller because
>>> fundamentally and even hardware block wise they are different.
>>
>> So, do we split msm_priv->dp too? It's indexed using
>> MSM_DP_CONTROLLER_n entries.
>> Do we want to teach drm/msm/dp code that there are priv->dp[] and
>> priv->edp arrays?
> 
> ok so now priv->dp and priv->edp arrays are also in the picture here :)
> 
> Actually all these questions should have probably come when we were 
> figuring out how best to re-use eDP and DP driver.
> 
> Either way atleast, its good we are documenting all these questions on 
> this thread so that anyone can refer this to know what all was missed 
> out :)
> 
> priv->dp is of type msm_dp. When re-using DP driver for eDP and since
> struct msm_dp is the shared struct between dpu and the msm/dp, I get 
> your point of re-using MSM_DP_CONTROLLER_* as thats being use to index.
> 
> So MSM_DP_CONTROLLER_* is more of an index into the DP driver and not 
> really a hardware indexing scheme.
> 
> If we split into two arrays, we need more changes to dpu_encoder too.
> 
> Too instrusive a change at this point, even though probably correct.
> 
> But are you seeing more changes required even if we just change INTF_DP 
> to INTF_eDP for the eDP entries? What are the challenges there?
> 
>>
>>> Why do we want to keep building something on top of this confusing
>>> terminology knowing that it can be corrected when its fairly in the
>>> development stage rather than realizing later it will break.
>>>
>>> We have only been discussing that eDP and DP are treated equally in the
>>> DPU code and hence why do we need to distinguish.
>>>
>>> As per current code yes, but I cannot and probably noone else can
>>> guarantee that in future there can be cases were we want to distinguish
>>> the two for something.
>>
>> Me too. For now I see INTF_DP as a useful abstraction for 'the
>> interface that's handled by drm/msm/dp and shares common timing
>> requirements'.
> 
> struct msm_dp is the useful abstraction already for drm/msm/dp.
> Not INTF_DP.
> 
>>
>> At this moment I estimate that splitting it properly into INTF_DP and
>> INTF_EDP can bring more troubles than possible future cases.
> 
> Can you please elaborate why changing INTF_DP to INTF_eDP is more 
> trouble if we leave the MSM_DP_CONTROLLER_* intact?
> 
>> If at some point we were to distinguish DP and eDP usecases of
>> INTF_DP, I would suggest adding is_embedded property rather than
>> splitting away INTF_EDP.
>>
> 
> Can you please elaborate on this is_embedded idea?

If we need to distinguish DP and eDP behind the INTF_DP we can 
explicitly ask msm_dp_is_embedded_dp().

> 
>> It's good to think about future cases and expansions.
>> But it's too easy to create a monstruosos constructs supporting all
>> possible features that no one can understand, grok and maintain.
>> Been there, created several of them, refactored others.
>>
>> Let me throw in yet-another-possible-if: if at some point the hardware
>> supported iDP using the same DP block, would you split INTF_iDP? >
>>> Thats the overally consensus within our team.
>>>
>>> So if this going to work smoothly by just fixing two entries in the hw
>>> catalog I would rather do that now rather than realizing this down the
>>> line again just to save usage of one more enum.
>>>
>>>> With all that in mind I'd suggest to:
>>>> - use INTF_DP for both DP and new eDP interfaces
>>>> - remove INTF_EDP usage from the dpu1 driver
>>>> - add a note that INTF_EDP corresponds to older eDP blocks (found on 
>>>> 8x74/8x84)



-- 
With best wishes
Dmitry
