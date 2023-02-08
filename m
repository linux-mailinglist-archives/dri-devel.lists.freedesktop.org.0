Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3868FBA5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 00:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9967B10E8CD;
	Wed,  8 Feb 2023 23:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251CF10E8CE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 23:53:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id hx15so1603724ejc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 15:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RGFYSe+lCpuLr32fByWA40ax8ngty74aLtckl5GmUDI=;
 b=vaQIk8+AXeU+o5qN0ZWGO2zXEduYapWGW06VJNhmes7EVs4vVx9ax55GbExw0hjbVJ
 KGhCQLruhEsUVtNB0MjQlM9rayCmakayyg5tWhob2E803sVxKp+meA2cRB+ggO6Ey4/o
 KUanDXNLtsVyT6kbrJnulHMPGj8jaCYNVdbTa5fR0NpF76emcVpzSidBLxkjuMgM9eKK
 5vtAKrjWBRr4m5cnK7LJFxv4MPTIhHHKTu2bFQ4csv10o6sp9T6p4eR2cyZ6ui12DCyF
 yvudqpSopywa2lnDKk27j30T2E7a48uE4Yh4jNeFIkdB9vpFL4d/gdAmrr9qT1WUPDpl
 2hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RGFYSe+lCpuLr32fByWA40ax8ngty74aLtckl5GmUDI=;
 b=T+vJDO5SMO5xq7vlDbqK5Xx82f1Nt0IY2FK2mXU78wGKwF03CUFb8i0ebijo5vXy9e
 bdJC0hslcAOo/xmBqjHJfe872SiG6aDlAlV+vP8thIsdTu//bgN5IXpI7FxiSjTVRm03
 g7lSFxOWlLzfRnL7aYu3P1oJK5XHpuiXJemIoC+Qh4Wf4cwjXyL8xdDZ3Pz3FV0andty
 1v7NnTN7SxsDSLI4gGAZvfamt+0e38VewjO8+wRcOTFX9vtWLjLK0vogJFgmLyoEJIwk
 kkcd87S5EreKvOO3iMRb6L7FCNLvpKfqmBPFr09QsJfBZNMTErgaua4NS7QjuFYEVXG7
 Uk0w==
X-Gm-Message-State: AO0yUKUjqPRMMCt82NuVVsmMFC/2QQ+iQH7tN2ga0RwdYzD3I14fnh6h
 5+rpH1B6orlHncIltyxKSx9+mA==
X-Google-Smtp-Source: AK7set/oCDrZo8uJY/JxPxoDUQg+BiR0tAusXdeNr3KdvhzrT8IDEGV4gYkBq9YzIp/MhnHqgiNziw==
X-Received: by 2002:a17:907:98e8:b0:8af:2fa1:619e with SMTP id
 ke8-20020a17090798e800b008af2fa1619emr976285ejc.18.1675900409671; 
 Wed, 08 Feb 2023 15:53:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 by8-20020a170906a2c800b0088b93bfa777sm104632ejb.149.2023.02.08.15.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 15:53:29 -0800 (PST)
Message-ID: <a3f401da-a439-83ac-6b59-872b5793ec74@linaro.org>
Date: Thu, 9 Feb 2023 01:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw
 catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
 <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
 <3754a9a9-8b64-62ae-0b0d-f379debefa16@linaro.org>
 <ddb0de30-9e29-f6f0-028c-48530bee4a6b@quicinc.com>
 <42e6237d-9fae-0679-1354-7df74594a9db@linaro.org>
 <d89a1735-4351-a9b5-c6e3-d0d05af9d283@quicinc.com>
 <6d171f4b-9a49-ea90-8cf3-518bea0964b3@linaro.org>
 <edc1aab6-b38f-c0ec-9339-01117d037ebf@quicinc.com>
 <5d482d65-858f-7c6c-1f93-dabc6e2f4be9@linaro.org>
 <616460ed-2385-cefb-5bb5-491fa42f1e54@quicinc.com>
 <CAA8EJpqEq4Wirj0SmxcJYbiw0taUmbLpC8RYFCzkBfsPxc-aZA@mail.gmail.com>
 <42cd459a-2c44-eeb3-ff6f-daac54ae467d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <42cd459a-2c44-eeb3-ff6f-daac54ae467d@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2023 02:36, Abhinav Kumar wrote:
> 
> 
> On 2/4/2023 4:29 PM, Dmitry Baryshkov wrote:
>> On Sun, 5 Feb 2023 at 01:20, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 2/4/2023 1:08 PM, Dmitry Baryshkov wrote:
>>>> On 04/02/2023 20:35, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 2/4/2023 2:43 AM, Dmitry Baryshkov wrote:
>>>>>> On 04/02/2023 07:10, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/3/2023 8:10 PM, Dmitry Baryshkov wrote:
>>>>>>>> On 04/02/2023 04:43, Abhinav Kumar wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 2/3/2023 6:29 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On 04/02/2023 01:35, Abhinav Kumar wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> Downstream driver uses dpu->caps->smart_dma_rev to update
>>>>>>>>>>>> sspp->cap->features with the bit corresponding to the supported
>>>>>>>>>>>> SmartDMA
>>>>>>>>>>>> version. Upstream driver does not do this, resulting in SSPP
>>>>>>>>>>>> subdriver
>>>>>>>>>>>> not enbaling setup_multirect callback. Add corresponding
>>>>>>>>>>>> SmartDMA SSPP
>>>>>>>>>>>> feature bits to dpu hw catalog.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> While reviewing this patch, I had a first hand experience of how
>>>>>>>>>>> we are reusing SSPP bitmasks for so many chipsets but I think
>>>>>>>>>>> overall you got them right here :)
>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>>>> ---
>>>>>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 
>>>>>>>>>>>> +++++++---
>>>>>>>>>>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>>> index cf053e8f081e..fc818b0273e7 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>>> @@ -21,13 +21,16 @@
>>>>>>>>>>>>        (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>>>>>>>    #define VIG_SDM845_MASK \
>>>>>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3) |\
>>>>>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>>>>>    #define VIG_SC7180_MASK \
>>>>>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED4))
>>>>>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED4) |\
>>>>>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>>>>>    #define VIG_SM8250_MASK \
>>>>>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>>>>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
>>>>>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>>>>>    #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>>>>>>>>>> @@ -42,6 +45,7 @@
>>>>>>>>>>>>    #define DMA_SDM845_MASK \
>>>>>>>>>>>>        (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |
>>>>>>>>>>>> BIT(DPU_SSPP_QOS_8LVL) |\
>>>>>>>>>>>>        BIT(DPU_SSPP_TS_PREFILL) | 
>>>>>>>>>>>> BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>>>>>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
>>>>>>>>>>>>        BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>>>>>>>>>>>>    #define DMA_CURSOR_SDM845_MASK \
>>>>>>>>>>>
>>>>>>>>>>> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other
>>>>>>>>>>> chipsets like 8250, 8450, 8550.
>>>>>>>>>>>
>>>>>>>>>>> At the moment, for visual validation of this series, I only have
>>>>>>>>>>> sc7180/sc7280. We are leaving the rest for CI.
>>>>>>>>>>>
>>>>>>>>>>> Was that an intentional approach?
>>>>>>>>>>>
>>>>>>>>>>> If so, we will need tested-by tags from folks having
>>>>>>>>>>> 8350/8450/8550/sc8280x,qcm2290?
>>>>>>>>>>>
>>>>>>>>>>> I am only owning the visual validation on sc7280 atm.
>>>>>>>>>>
>>>>>>>>>> I'm not quite sure what is your intent here. Are there any SoCs
>>>>>>>>>> after 845 that do not have SmartDMA 2.5? Or do you propose to
>>>>>>>>>> enable SmartDMA only for the chipsets that we can visually test?
>>>>>>>>>> That sounds strange.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Yes I was thinking to enable smartDMA at the moment on chipsets
>>>>>>>>> which we can validate visually that display comes up. But I am not
>>>>>>>>> sure if thats entirely practical.
>>>>>>>>>
>>>>>>>>> But the intent was I just want to make sure basic display does
>>>>>>>>> come up with smartDMA enabled if we are enabling it for all 
>>>>>>>>> chipsets.
>>>>>>>>
>>>>>>>> I don't think it is practical or logical. We don't require
>>>>>>>> validating other changes on all possible chipsets, so what is so
>>>>>>>> different with this one?
>>>>>>>>
>>>>>>>
>>>>>>> Thats because with smartDMA if the programming of stages goes wrong
>>>>>>> we could potentially just see a blank screen. Its not about other
>>>>>>> changes, this change in particular controls enabling a feature.
>>>>>>>
>>>>>>> But thats just my thought. I am not going to request to ensure this
>>>>>>> or block this for this.
>>>>>>>
>>>>>>> You can still have my
>>>>>>>
>>>>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>
>>>>>>> But think of the validations that have to be done before we merge 
>>>>>>> it.
>>>>>>
>>>>>> The usual way: verify as much as feasible and let anybody else
>>>>>> complain during the development cycle.
>>>>>>
>>>>>
>>>>> Well, our perspective is to enable the feature on devices on which you
>>>>> are able to test and not enable then wait for others to complain.
>>>>
>>>> This would not be really practical. There are plenty of people who can
>>>> test things on obscure platforms, but unfortunately far less amount of
>>>> people who tightly follow the development and can track which new
>>>> feature applies to a particular platform. I hope to be able to fix that
>>>> slightly with the hw catalog rework. However enabling features on other
>>>> platforms definitely requires more knowledge than simply testing the
>>>> kernel.
>>>>
>>>>>
>>>>> I did not say test all devices. My point was to enable smartDMA on
>>>>> devices which we are able to test.
>>>>>
>>>>> There are other examples of this, like inline rotation, writeback etc.
>>>>> which are at the moment enabled only on devices which QC or others
>>>>> have tested on.
>>>>
>>>> But at the time it was added, inline rotation 2.0 could only be
>>>> supported on sc7280. Probably we should expand it not to sc8280xp and
>>>> sm8[345]50.
>>>>
>>>> For WB I don't remember which platforms were supported at the moment it
>>>> was added. But it's also worth expanding support to new platforms.
>>>>
>>>> And, as we speak about testing, is there an easy way to setup the plane
>>>> with UBWC format modifier? Also, did the WB support patches land into
>>>> libdrm?
>>>>
>>>
>>> I will check the compositor code and update you on the UWBC format
>>> modifier as I am not too familiar with it.
>>
>> Ideally it would be nice to support ubwc planes in some simple tool,
>> e.g. modetest.
>>
>>>
>>> libdrm always supported virtual encoder
>>> https://github.com/grate-driver/libdrm/blob/master/include/drm/drm_mode.h#L352
>>>
>>> What other support patches are needed? Right now we only use IGT to
>>> validate writeback.
>>
>> I remember there was a patchset to make modeset to support using
>> writeback. What was its fate?
>>
> 
> Once our intern finished his internship, noone could take up the pending 
> review comments after that so its yet to be merged.
> 
> https://patchwork.kernel.org/project/dri-devel/list/?series=667290&archive=both
> 
> Once more item to the to-do list.

Oh. Quite a pity :-(
I hope somebody can pick it up on either of our sides.

> 
>>>
>>>>> So when i said my suggestion was not practical, yes because if you
>>>>> want to go ahead with this change in the current form, you would have
>>>>> to validate all the chipsets as you are enabling smartDMA on all of 
>>>>> them.
>>>>>
>>>>> If you enable smartDMA only on the chipsets you OR others can validate
>>>>> and give Tested-by for like I was planning to do for sc7280, then I am
>>>>> not sure why it doesnt sound logical.
>>>>>
>>>>> But like I said, thats my perspective. I will let you decide as you
>>>>> would know how confident you are with this getting enabled for all
>>>>> chipsets upstream.
>>>>
>>>> I'd say, that once tested on some of the platforms and granted that 
>>>> even
>>>> smalled (qcm2290, sm6115) platforms support smartdma, it will be 
>>>> safe to
>>>> enable smart DMA globablly for every SoC >= sdm845. If I remember
>>>> correctly, msm8998 (and sdm660/630) support smartdma/rect only on DMA
>>>> planes. Is it correct?
>>>>
>>>>
>>> Yes thats right msm8998 supports smartdma only on DMA sspps.
>>
>> Good
>>

-- 
With best wishes
Dmitry

