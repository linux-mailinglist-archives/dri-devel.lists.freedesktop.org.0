Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D096E9CDC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 22:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B3610ECD6;
	Thu, 20 Apr 2023 20:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DDB10E0C5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 20:09:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4ec8da7aaf8so836208e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682021354; x=1684613354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M3Y9Il1oqwyiPf5dbbjjrGSxVhkcdbFOHAXUkuBeIj4=;
 b=zxnUBz/XDQ02FR4wGa8lMypLEZQCrNT0gmPf4maNMnbuMNfuSFaPqvxs9d4PUfa7vN
 Bj3V1ZrWP17FJrRl6FDueGniOvbu267cwf6v2e3pJuEPctgNdy6gahF6PuqZoRi4MQKO
 SSposQliOyvlNLX4LPx8ZSBxLjwN+i4pPe6yc3H3vv3lEKNRlwS4NR6g4aV+qppSXPfP
 rKs/iwDmzkhrHb6CWALpgVhQtqWZKZJA2pKpHr5ehUVj1dmdb7mIsp7ZxGiAw8GZnrJi
 qIDZaNPWczBRC+yYJABQAIyYHK5pmcMcXorn9ohRbAcvuDQuhe8YyFf6ro6hTcpBV/vr
 zKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682021354; x=1684613354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M3Y9Il1oqwyiPf5dbbjjrGSxVhkcdbFOHAXUkuBeIj4=;
 b=NWoNUhSgF0XJqSYi+rxkmLSEvCU4DwrawYmwG8Skr8c1tg9UV/qIfOHYdpdolfNzrQ
 M2G1hTDou41ku3KhzkaEgLd7an92n7i2lZcGHOymDCPqcLfJarFXOm7/RCQAVkr9X0lW
 rYbtyo1xerITgbQIkT49tTBDgcoDrOUcr7MnJGablocy1W1cOXVObC+SXKv8EQFGyHhC
 BXpjVPeutkR6I1Q1dd+McYPqrZneREIKXr4Mh115p7Ki9Fs/UKatk4enssC6/x2TVooT
 bhmtQESiBY2Id+iDdHKm9Tnf7MyrowAO3ugBSgPlfXNJlxwSeCUV7zYYwFpF0n2qfJeK
 1n0w==
X-Gm-Message-State: AAQBX9ddUNA4Hynhd2m6aGi9TvzX82FCg4rbsaD0SXvcBzpQz+zU//hH
 SR3aQ50GAj6ISL6WWQFgjguAug==
X-Google-Smtp-Source: AKy350anF3iZ+VdWnOCjhqu7EDNHAFUSTDeDIECpJaTV9PMZ9UMJUEOYkat++z42gxxU67nMXSQZDA==
X-Received: by 2002:ac2:4219:0:b0:4db:3e56:55c8 with SMTP id
 y25-20020ac24219000000b004db3e5655c8mr665153lfh.59.1682021354370; 
 Thu, 20 Apr 2023 13:09:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a19ad46000000b004db51387ad6sm318181lfd.129.2023.04.20.13.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 13:09:13 -0700 (PDT)
Message-ID: <47d32e5e-49ad-3ffa-2862-26b78c9c6a98@linaro.org>
Date: Thu, 20 Apr 2023 23:09:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] DPU1 GC1.8 wiring-up
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
 <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
 <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
 <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
 <6a335df7-ff0b-098a-feec-45714159df04@linaro.org>
 <b134d09c-55fa-7879-80ff-900e39c20c3d@quicinc.com>
 <0f469b3c-5f0f-e027-8a9f-d1233169c04a@linaro.org>
 <951c7bbd-c239-336d-1914-af76f79a69d6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <951c7bbd-c239-336d-1914-af76f79a69d6@quicinc.com>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2023 22:53, Abhinav Kumar wrote:
> 
> 
> On 4/20/2023 12:51 PM, Dmitry Baryshkov wrote:
>> On 20/04/2023 22:47, Abhinav Kumar wrote:
>>>
>>>
>>> On 4/20/2023 11:01 AM, Dmitry Baryshkov wrote:
>>>> On 20/04/2023 04:36, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 20.04.2023 03:28, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
>>>>>>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
>>>>>>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>>>>>>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
>>>>>>>>> more, but none of them are supported upstream.
>>>>>>>>>
>>>>>>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
>>>>>>>>
>>>>>>>> Does this mean that we will see gamma_lut support soon?
>>>>>>> No promises, my plate is not even full, it's beyond overflowing! :P
>>>>>>>
>>>>>>> Konrad
>>>>>>
>>>>>> So I think I wrote about this before during the catalog 
>>>>>> rework/fixes that the gc registers are not written to / programmed.
>>>>>>
>>>>>> If thats not done, is there any benefit to this series?
>>>>> Completeness and preparation for the code itself, if nothing else?
>>>>
>>>> The usual problem is that if something is not put to use, it quickly 
>>>> rots or becomes misused for newer platforms. We have seen this with 
>>>> the some of DPU features.
>>>>
>>>> In case of GC (and the freshly defined DPU_DSPP_IGC, but not used) 
>>>> we have three options:
>>>> - drop the unused GC from msm8998_sblk.
>>>> - keep things as is, single unused GC entry
>>>> - fill all the sblk with the correct information in hope that it 
>>>> stays correct
>>>>
>>>> Each of these options has its own drawbacks. I have slight bias 
>>>> towards the last option, to have the information in place (as long 
>>>> as it is accurate).
>>>>
>>>
>>> My vote is for (1) . Today, GC is unused and from the discussion 
>>> here, there is no concrete plan to add it. If we keep extending an 
>>> unused bitmask for all the chipsets including the ones which will get 
>>> added in the future in the hope that someday the feature comes, it 
>>> doesnt sound like a good idea.
>>>
>>> I would rather do (1), if someone has time.
>>
>> Agree, this was the second item on my preference list. Could you 
>> please send this oneliner?
>>
> 
> Sure, i will send this by tomorrow, but its not a oneliner. Need to get 
> rid of below too:
> 
> 470 struct dpu_dspp_sub_blks {
> 471     struct dpu_pp_blk gc;

Agree.

> 
>>> OR lets stay at (2) till someone does (1).
>>>
>>> When someone implements GC, we can re-use this patch and that time 
>>> keep konrad's author rights or co-developed by.
>>>
>>>
>>

-- 
With best wishes
Dmitry

