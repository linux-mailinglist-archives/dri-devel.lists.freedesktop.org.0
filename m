Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF096E9CB1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 21:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F02A10E2E8;
	Thu, 20 Apr 2023 19:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20B210E2E8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 19:51:24 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2a7af0cb2e6so7856481fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 12:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682020283; x=1684612283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/a0xpbCUh8XvBFyvG3Vr8vwGN+W0r6uMQEO9ehg+QV4=;
 b=zBr3TpHqf1AS9j2rsa0zNinD/3EVDw8o66VhW6Cs1x9gQZOqenezbfaXcgGGI+wHd9
 7E2v5qh2QaItjfhTeNhXKUB9yuikZWqg9lrIiTaWWO86IteWxF7PKcSxKhhgpe7hlzIv
 +Ra8UnT08hKJttPIuAkoOFBSBg1+jkqWVeS9dOiQhpUAwB7+kA5rmprYuoaXUuKRGJva
 c/CscWhbir1fbJ8aTrJiFgOGZ9nVf2IFVk3Mg8GiDVk3wL0v4e6NHF04VJ8vZm8Ss/BG
 xPn6mh1eNYUmkFAh1ek0NJ7HQdzf9PHSYa1Yxh/g9At0nlp991N6Z7gaGb3Eu6HoGeer
 x+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682020283; x=1684612283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/a0xpbCUh8XvBFyvG3Vr8vwGN+W0r6uMQEO9ehg+QV4=;
 b=H8pVVMQhI0aHb8rydzPDWNvuEpbr8CZmCj+ghVgOypdRrKBrdg0u/ULEqc5uH0lp33
 cYrv1AEQLFIfEz2oZfgFWV1r3VVGRmDy0KUCcqS91/P30e2GDqgmrXS1ra2HoN+tK0rx
 ME4yJSy+VvS7xDEj1RQ0AcEX1PlxKOceton6UTuONGb6irdaDedOZTlQoOLPnNapkbaQ
 JsH8BhB83AXNqNoU69kQqb2pL3kBdU1Sr2ZPPa0wiOPMtmaIwPclqwZ87KP6tFkU4Zdm
 NqtUAsof/lqaYmhu5vYdfrnScjspBsRXvoYTOjbcmvtKEySIXm966QEN6N+CqqueY+Qr
 zAoA==
X-Gm-Message-State: AAQBX9eoj+CQ8AnBqeb7VYkTHwU2EdjqCFCUi6k5rPu6Pp7vv8w9dHIZ
 l1UpArvopGq589jvNUbiivO9Cg==
X-Google-Smtp-Source: AKy350bJOaN/yiqVcikZK2R1lIXdVY7PZHt7PQe9jzpzreObSOXLbS7TfSQAXyaEMHcVORKfBHdasQ==
X-Received: by 2002:a05:6512:61:b0:4ef:5a59:12f6 with SMTP id
 i1-20020a056512006100b004ef5a5912f6mr17552lfo.16.1682020283052; 
 Thu, 20 Apr 2023 12:51:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l13-20020ac24a8d000000b004eb3b6acfe6sm311735lfp.213.2023.04.20.12.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 12:51:22 -0700 (PDT)
Message-ID: <0f469b3c-5f0f-e027-8a9f-d1233169c04a@linaro.org>
Date: Thu, 20 Apr 2023 22:51:22 +0300
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b134d09c-55fa-7879-80ff-900e39c20c3d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2023 22:47, Abhinav Kumar wrote:
> 
> 
> On 4/20/2023 11:01 AM, Dmitry Baryshkov wrote:
>> On 20/04/2023 04:36, Konrad Dybcio wrote:
>>>
>>>
>>> On 20.04.2023 03:28, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
>>>>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
>>>>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>>>>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
>>>>>>> more, but none of them are supported upstream.
>>>>>>>
>>>>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
>>>>>>
>>>>>> Does this mean that we will see gamma_lut support soon?
>>>>> No promises, my plate is not even full, it's beyond overflowing! :P
>>>>>
>>>>> Konrad
>>>>
>>>> So I think I wrote about this before during the catalog rework/fixes 
>>>> that the gc registers are not written to / programmed.
>>>>
>>>> If thats not done, is there any benefit to this series?
>>> Completeness and preparation for the code itself, if nothing else?
>>
>> The usual problem is that if something is not put to use, it quickly 
>> rots or becomes misused for newer platforms. We have seen this with 
>> the some of DPU features.
>>
>> In case of GC (and the freshly defined DPU_DSPP_IGC, but not used) we 
>> have three options:
>> - drop the unused GC from msm8998_sblk.
>> - keep things as is, single unused GC entry
>> - fill all the sblk with the correct information in hope that it stays 
>> correct
>>
>> Each of these options has its own drawbacks. I have slight bias 
>> towards the last option, to have the information in place (as long as 
>> it is accurate).
>>
> 
> My vote is for (1) . Today, GC is unused and from the discussion here, 
> there is no concrete plan to add it. If we keep extending an unused 
> bitmask for all the chipsets including the ones which will get added in 
> the future in the hope that someday the feature comes, it doesnt sound 
> like a good idea.
> 
> I would rather do (1), if someone has time.

Agree, this was the second item on my preference list. Could you please 
send this oneliner?

> OR lets stay at (2) till 
> someone does (1).
> 
> When someone implements GC, we can re-use this patch and that time keep 
> konrad's author rights or co-developed by.
> 
> 

-- 
With best wishes
Dmitry

