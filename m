Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828A6D719B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2399E10E808;
	Wed,  5 Apr 2023 00:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6BA10E806
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 00:43:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id h11so37585514lfu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 17:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680655417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lOXUD06Ut5gCyISL/ThTXuYokrK5x2lyY3jhfH4LGFw=;
 b=osKqK+rEBrGx0U4IIXp/c+J3Vjs1wXfdXAIGyfS/YsvpESkjU1xxUJNXtZG9U2uhzW
 x9Oz7F+BHYB018Mcx51g+l/rl4Z8f6vTYpzg5GHsDZ5+k85q1y9I3w/PQxN8nnQibmdD
 s+RXLqriElsRX/f8ij+pOFxNPuuEQzIgKM7uzbtiX46wf1Kal4krX2RELgxpsrv+V6UM
 DlfpPLOH44p/Ouo2nkLej0ZhqjZ4SIm2fFMxTfna4HdeGggdDI7oEyym70gcAWcEn/w5
 /b9zH5Ztu+fIOC9q3Ibsen8A/HblAk7BVYgYD+AVH/YIco27IPkjPduyTVoUoMB+USvN
 HQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680655417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lOXUD06Ut5gCyISL/ThTXuYokrK5x2lyY3jhfH4LGFw=;
 b=104NaxQiuPLlGe/1ZcBLGi+6YoVI5Zh4NOqlx1xdKQPYYKlCVAmta66CUCHW9O7dnp
 Jct9OoIXcd9jBcEyRW8TnMrkCiYyqhHBZBWdyVengvdq7oW4UtTju4PEjoJ5vXSZT2Kh
 lni7io4mZdb8EgJT6biL1SLhhN6zG/9/t6NvtWWB2mA2HMuxR55cX5WQHDKNcyGWRt2c
 mDP+hNIq1/NWdtY/WoGXnaC8T3mwALvY14LNZRNWJoybXFtYIw1umZ8jBIEL0ig/jjCQ
 gOZ/Z04pXibfQK9W3rkoDmrW6eS6s5VdxDUpCN4Ysfs3A4HElV3zcK+4pHNJ/9kEAg6B
 u8mw==
X-Gm-Message-State: AAQBX9d5Xwvgp4cXqoUKwNuXsPs/JPVIVjj7qSABAnFfj2HGUMskTq8q
 h/6Y30O8ENiEbeKLilWirNDNfA==
X-Google-Smtp-Source: AKy350ZzP7B/TZjkgO7Ufz8WKL2NHiqzmnCd8jmaAcpv+XHCdRqnu5LrqbdLmCtcMVgap4cNo+5zgg==
X-Received: by 2002:ac2:4250:0:b0:4db:513f:fe2a with SMTP id
 m16-20020ac24250000000b004db513ffe2amr1035499lfl.23.1680655417271; 
 Tue, 04 Apr 2023 17:43:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a19f00f000000b004ddaea30ba6sm2561493lfc.235.2023.04.04.17.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 17:43:36 -0700 (PDT)
Message-ID: <397da2da-2e76-3565-6416-568397cf32c1@linaro.org>
Date: Wed, 5 Apr 2023 03:43:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's
 ctl_0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
 <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
 <6948fe29-af08-9164-4cec-a6564dbb1e1a@linaro.org>
 <6b672c6b-5d89-a89d-d8ff-0cd4ec5b7961@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6b672c6b-5d89-a89d-d8ff-0cd4ec5b7961@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/04/2023 03:39, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 5:33 PM, Dmitry Baryshkov wrote:
>> On 05/04/2023 01:12, Abhinav Kumar wrote:
>>>
>>>
>>> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>>>> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL 
>>>> blocks,
>>>> so switch it to CTL_SC7280_MASK too.
>>>>
>>>> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add 
>>>> support
>>>> for SM8450") had all (relevant at that time) bit spelled individually.
>>>> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
>>>> despite being a mismerge, correctly changed all other CTL entries to 
>>>> use
>>>> CTL_SC7280_MASK, except CTL_0.
>>>>
>>>
>>> I think having it spelled individually is better. If we start using 
>>> one chipset's mask for another, we are again going down the same path 
>>> of this becoming one confused file.
>>>
>>> So, even though I agree that 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 
>>> to hw catalog") corrected the mask to re-use sc7280, with the 
>>> individual catalog file, its better to have it separate and spelled 
>>> individually.
>>>
>>> This change is not heading in the direction of the rest of the series.
>>
>> I didn't create duplicates of all the defines. This is done well in 
>> the style of patch37. I'm not going to add all per-SoC feature masks.
>>
> 
> Yes, I was actually going to comment even on patch 37.
> 
> We are again trying to generalize a CTL's caps based on DPU version, the 
> same mistake which led us down this path.
> 
> So today you have CTL_DPU_0_MASK , CTL_DPU_5_MASK , CTL_DPU_7_MASK  and 
> CTL_DPU_9_MASK and this builds on an assumption that you can get 5 by 
> ORing ACTIVE_CFG with 0.
> 
> +#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | \
> +            BIT(DPU_CTL_ACTIVE_CFG))
> +
> 
> This is again moving towards that problematic pattern.
> 
> Why dont we stick to CTL features individually spelling it then work 
> towards generalizing as we discussed.

Because adding a feature would become a nightmare of touching all the 
platforms?

We discussed not merging on major+LM. Glad, I agreed there. But I don't 
think that we should remove existing defines without good reason. We 
know that they work in the majority of cases.

>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index 6840b22a4159..83f8f83e2b29 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>>>       {
>>>>       .name = "ctl_0", .id = CTL_0,
>>>>       .base = 0x15000, .len = 0x204,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | 
>>>> BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>>>       .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>       },
>>>>       {
>>

-- 
With best wishes
Dmitry

