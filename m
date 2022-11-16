Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E9462B63E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7A910E44F;
	Wed, 16 Nov 2022 09:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D2810E44D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:18:12 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s24so21004512ljs.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 01:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9787m7sNwrUp07FYZx+PV+4XFaTRbc5nJMW5nG96GCo=;
 b=q4LI5GbZErq8d7MIN4Y1zBCNU0B1eEgwrKNqQGRuEZnJ65vMnNjLjSHgyRZuHh0QTo
 Y6hC+isLRWnHC9HgxWILajTd8lbF6fOK5A0E7PzkjQiW9zcypdRwRA6bA8o+bzBd9qdk
 DbQ2qwDIZu/m3vII+1A8sFwR9cTpmAT3lzdYW0iZIobJTNZ92iCAzeGn0FjNo8Uu4Kvl
 ObMnaz7rSkclUt3zGcZHRSUDTPzT5LXQdFFs3fv5LZB0ZAVrlMo9XRAu3NShuIAnW4Al
 8rYwNevAa4I6PuFNa94ggXuwwG2el19hbUhf/cWDKBtW//eq9BlExX/bBPtK33zSYCKA
 EoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9787m7sNwrUp07FYZx+PV+4XFaTRbc5nJMW5nG96GCo=;
 b=chRVzgZB7JDbfen2f06dvEQ3/KAQQcWdVG5mHAHuIO7r2JAGD+YCTkJrghaEtdrt2f
 Kplvjeb8wWJaymCtJCsJZQTAylwbyR/PydEuHye8MpON5GiwVRT92zxbkJhnPmG4I46J
 v+538hAdUBToU8jWEWPIiHE++cuXOp6E/6jSXKRZbItCAVMt9o/9OK7a0YsvdvfHiuvs
 t0FpXP9fSle5wLePpMw10/iahzjp7gdbU6noqzRepBLy2hxIZa+HmS/CdXwgaN06R0jC
 hA9Ua1oNs8ao9jPkSxaSpKAnPwH7KC0inZfX3h7sY65c2pfsCLGp6gSi0tFBB/e0r+4t
 pmeQ==
X-Gm-Message-State: ANoB5pkzQew4KRvlUemsJEDYx01Z5tE0v0T0Y0U1lj78w5v1RA+taw8q
 O8mYAfr7Au9rlf3zWRkDBj2Y1A==
X-Google-Smtp-Source: AA0mqf4L8wGVSeGXrBJ5/SCFGIJNhzIRZtGETrXnUGqOYVCnEnTRldcx5RwXWZdolSH+rmVVACdSYw==
X-Received: by 2002:a2e:54f:0:b0:26f:a90a:fd82 with SMTP id
 76-20020a2e054f000000b0026fa90afd82mr7883753ljf.248.1668590291007; 
 Wed, 16 Nov 2022 01:18:11 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a05651c048d00b0026fc79fd67dsm2904881ljc.74.2022.11.16.01.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 01:18:10 -0800 (PST)
Message-ID: <65ab13cb-93ae-eb71-531a-79cf99c7fcdd@linaro.org>
Date: Wed, 16 Nov 2022 12:18:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
 <e53520b4-65da-d183-c3bf-65dc16c59358@linaro.org>
 <c23b1bc2-6477-a125-7ad9-11dfec6fed55@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c23b1bc2-6477-a125-7ad9-11dfec6fed55@quicinc.com>
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

On 16/11/2022 11:30, Abhinav Kumar wrote:
> 
> 
> On 11/16/2022 12:19 AM, Dmitry Baryshkov wrote:
>> On 16/11/2022 10:50, Abhinav Kumar wrote:
>>>
>>>
>>> On 11/4/2022 6:03 AM, Dmitry Baryshkov wrote:
>>>> On sm8450 a register block was removed from MDP TOP. Accessing it 
>>>> during
>>>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>>>> these registers during snapshot.
>>>>
>>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> I am confused with both the ordering and the split of this patch.
>>>
>>> You have defined DPU_MDP_PERIPH_0_REMOVED in the catalog header file 
>>> in this patch but used it in the next.
>>>
>>> But you also have code in this patch which relies on setting of this 
>>> bit.
>>>
>>> So if this patch is taken without the next, it will still crash.
>>
>> It will not crash if this patch is taken without the next one. Without 
>> the next patch the DPU driver will not match and bind against the 
>> qcom,sm8450-dpu device.
> 
> Ah okay, I just now saw that you have the compatible change also in the 
> next patch.
> 
>>
>> So, the ordering is quite logical from my point of view:
>> - add support for all the features required for the device
>> - add the device compat string & catalog entry
>>
>>>
>>> Rather, you should combine the define part of this patch to the next 
>>> patch in the series 
>>> https://patchwork.freedesktop.org/patch/510114/?series=108883&rev=3 , 
>>> then move that one in front of this patch.
>>
>> No. This way we'll have a state (after adding the next patch) when the 
>> sm8450 support is enabled, but the top-hole is not handled, leading to 
>> a crash.
>>
> 
> What if you split the compatible to a separate patch like what SM8350 did.
> 
> https://patchwork.freedesktop.org/patch/511659/?series=110924&rev=1
> 
> So, we have hw catalog changes ---> snapshot fix ---> add the compatible.

I don't see any good reason to do this. Adding a define without backing 
implementation is a bad idea in my opinion.

Regarding splitting the hw_catalog and compat. I have always considered 
the hw catalog entry as of_device_id.data. In other words, a devices' 
match data, which makes a little sense without compat entry.

With the current approach each patch is atomic, it changes single point 
or adds a single feature, etc.

> 
> That will make both of us happy?
> 
>>>
>>> So that its much more coherent that you defined 
>>> DPU_MDP_PERIPH_0_REMOVED both in the catalog header and used it in 
>>> the catalog.c file and the in the next change you used the caps to 
>>> avoid touching that register.
>>
>> I'd say it's rather strange way. When I see a define/feature addition, 
>> I'd prefer to seethe implementation too.
>>
>>> Regarding the TOP hole itself, I need one day to investigate this. I 
>>> am waiting for permissions to the documentation.
>>>
>>> If i cannot get access by the time you have re-ordered this, I will 
>>> ack this once the reorder is done within a day.
>>
>>
>> For the reference: [1]
>>
>> [1] 
>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/commit/f9ff8af5b640147f3651c23551c60f81f62874b1
>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> index 38aa38ab1568..4730f8268f2a 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> @@ -92,6 +92,7 @@ enum {
>>>>       DPU_MDP_UBWC_1_0,
>>>>       DPU_MDP_UBWC_1_5,
>>>>       DPU_MDP_AUDIO_SELECT,
>>>> +    DPU_MDP_PERIPH_0_REMOVED,
>>>>       DPU_MDP_MAX
>>>>   };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index f3660cd14f4f..95d8765c1c53 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>>>> msm_disp_state *disp_state, struct msm_k
>>>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>>>> +    if (dpu_kms->hw_mdp->caps->features & 
>>>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 
>>>> 0x3a8,
>>>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
>>>> +    } else {
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>>> +    }
>>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>>   }
>>

-- 
With best wishes
Dmitry

