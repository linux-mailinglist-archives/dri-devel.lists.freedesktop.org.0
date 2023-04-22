Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234B6EB90C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 14:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AFC10E14B;
	Sat, 22 Apr 2023 12:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE08010E14B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 12:08:11 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so11613383e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682165287; x=1684757287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9GDmJNueG7xvHJSuyd9rLemP2UP6fJ5kCNsM0oZLf0c=;
 b=epzCGo4BQwPSgU50raaRrSMsXncJ7bFElplNuEIhpEZ5+F5BmKvGfrRJNj1v9eaTZu
 QI3GdJaBLJBy/fu+cvNFMQ9OTvXh6s3UX+cC2lYDoJRgbpLLhMkIVaQMxLS1iOIOZjcs
 Q9dESVfprMP29DW3YnSLCo7Qi5knCZjRza48d7Wfhhk/bpT8R5ED5pR/9Ic/L4/h4Yh7
 7DwcpkhK7tifJbIB7H/dSS3NBa12IFq6KihU7B5EO793E2CJviAaFxIxBFMd02V+PX0G
 nCiu/UEGNvDEwIYnnOt9Dtwr0IKWhEZFuhKrCwtcju9vQE+tNvhZi7sMvp9HKDYkzuv8
 y47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682165287; x=1684757287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9GDmJNueG7xvHJSuyd9rLemP2UP6fJ5kCNsM0oZLf0c=;
 b=fExO/suPvrl/m+mg6t/CyEf04qgU4tl30PidtW6niQKKlw6LjAls5ujzqzbGHE8WTw
 DBn99669DmSOXJ5gpUZP5EQ32oTPt3lJwUegUhQ2sIB2NrZQHzt8RAdfiquGGKR5DDy5
 g2b9IeOSWiJc5W9xtIPbsvhEEJVsS9kmo/P8aDoUcCJc0ZWj677SyXUfSAusa2qzDmCL
 HEYnVRdiMHfGBXTuTr2JCRy9zxhVsFwMWsGGs9dIHwy9mWOl+q7kI2Ec9rhbVJ8kmNio
 699KroZEezgQMwGW3/tbgv02IVCFqYDAMCHJ1brhEdDjTgV0cqtVRRnptQCVph9XXtpl
 st9w==
X-Gm-Message-State: AAQBX9f6YKIKEAC6w6ZM70jkZFBU1uXBkC83Sq5pWERHcbKvI+dJ592+
 nOxwnTDA2BqTRih0PjeuOZKtvw==
X-Google-Smtp-Source: AKy350bNif2HJSh87Q2TpGjJVY2xiHP1kdIyebhnG4o3vq5xgwlttjmpYH8xHwzuXWyGEQ0gp5kaoA==
X-Received: by 2002:a05:6512:3e16:b0:4eb:41ac:e33 with SMTP id
 i22-20020a0565123e1600b004eb41ac0e33mr3781242lfv.19.1682165287653; 
 Sat, 22 Apr 2023 05:08:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac254a7000000b004efe73ee01fsm200108lfk.306.2023.04.22.05.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 05:08:07 -0700 (PDT)
Message-ID: <cbafc6fd-58db-91f5-b453-4b45ba80ee4d@linaro.org>
Date: Sat, 22 Apr 2023 14:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/2] DPU1 GC1.8 wiring-up
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
 <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
 <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
 <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
 <6a335df7-ff0b-098a-feec-45714159df04@linaro.org>
 <b134d09c-55fa-7879-80ff-900e39c20c3d@quicinc.com>
 <0f469b3c-5f0f-e027-8a9f-d1233169c04a@linaro.org>
 <57pxyxwluu33z4lpij5gx7biwfo5pbhdalhhxflw7esi5n3vts@qhjb7ldnz3wb>
 <0bba90c1-01be-a76e-df12-2328b84f7298@linaro.org>
 <b6d56e50-fb5b-1d59-7b39-a3ca2a0a8d83@quicinc.com>
 <1f7bb81a-d38c-725a-9ee1-89efe2950b1d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1f7bb81a-d38c-725a-9ee1-89efe2950b1d@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.04.2023 00:35, Dmitry Baryshkov wrote:
> On 22/04/2023 01:34, Abhinav Kumar wrote:
>>
>>
>> On 4/20/2023 3:52 PM, Dmitry Baryshkov wrote:
>>> On 20/04/2023 22:56, Marijn Suijten wrote:
>>>> On 2023-04-20 22:51:22, Dmitry Baryshkov wrote:
>>>>> On 20/04/2023 22:47, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 4/20/2023 11:01 AM, Dmitry Baryshkov wrote:
>>>>>>> On 20/04/2023 04:36, Konrad Dybcio wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 20.04.2023 03:28, Abhinav Kumar wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
>>>>>>>>>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
>>>>>>>>>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>>>>>>>>>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
>>>>>>>>>>>> more, but none of them are supported upstream.
>>>>>>>>>>>>
>>>>>>>>>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
>>>>>>>>>>>
>>>>>>>>>>> Does this mean that we will see gamma_lut support soon?
>>>>>>>>>> No promises, my plate is not even full, it's beyond overflowing! :P
>>>>>>>>>>
>>>>>>>>>> Konrad
>>>>>>>>>
>>>>>>>>> So I think I wrote about this before during the catalog rework/fixes
>>>>>>>>> that the gc registers are not written to / programmed.
>>>>>>>>>
>>>>>>>>> If thats not done, is there any benefit to this series?
>>>>>>>> Completeness and preparation for the code itself, if nothing else?
>>>>>>>
>>>>>>> The usual problem is that if something is not put to use, it quickly
>>>>>>> rots or becomes misused for newer platforms. We have seen this with
>>>>>>> the some of DPU features.
>>>>>>>
>>>>>>> In case of GC (and the freshly defined DPU_DSPP_IGC, but not used) we
>>>>>>> have three options:
>>>>>>> - drop the unused GC from msm8998_sblk.
>>>>>>> - keep things as is, single unused GC entry
>>>>>>> - fill all the sblk with the correct information in hope that it stays
>>>>>>> correct
>>>>>>>
>>>>>>> Each of these options has its own drawbacks. I have slight bias
>>>>>>> towards the last option, to have the information in place (as long as
>>>>>>> it is accurate).
>>>>>>>
>>>>>>
>>>>>> My vote is for (1) . Today, GC is unused and from the discussion here,
>>>>>> there is no concrete plan to add it. If we keep extending an unused
>>>>>> bitmask for all the chipsets including the ones which will get added in
>>>>>> the future in the hope that someday the feature comes, it doesnt sound
>>>>>> like a good idea.
>>>>>>
>>>>>> I would rather do (1), if someone has time.
>>>>>
>>>>> Agree, this was the second item on my preference list. Could you please
>>>>> send this oneliner?
>>>>
>>>> Nit (to make sure we're on the same thought here): I think it's a
>>>> 3-liner: remove it from DSPP_MSM8998_MASK as well as msm8998_dspp_sblk.
>>>>
>>>>>> OR lets stay at (2) till
>>>>>> someone does (1).
>>>>
>>>> I'm personally okay leaving it in place too, with an eye on implementing
>>>> this, IGC, and other blocks at some point if there's a use for it via
>>>> standard DRM properties.
>>>
>>> I took a quick glance. I think it is possible, but not straightforward. But I must admit here, I don't have a full picture regarding different color encodings, ranges and the rest of gamma/degamma API and usage.
>>>
>>
>> I think its easier to remove this now and then add it when we add the support. As discussed, will post this shortly.
>>
>> Otherwise, whenever any new chipset gets added, we will run into the same question of whether to add GC or not.
> 
> Yes, I absolutely agree here.
Sorry for the useless patches, though I guess they were a good
discussion starter..

Konrad
> 
>>
>>>>
>>>>>> When someone implements GC, we can re-use this patch and that time keep
>>>>>> konrad's author rights or co-developed by.
>>>>
>>>> Good to at least know all these SoCs have the same offset and revision.
>>>>
>>>> - Marijn
>>>
> 
