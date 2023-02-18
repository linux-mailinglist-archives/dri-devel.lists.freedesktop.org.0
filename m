Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662C669BB0C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 17:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE6210E514;
	Sat, 18 Feb 2023 16:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1468010E514
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 16:47:48 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r10so1125139ljd.11
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gRIwjh8WrsGWjWn7axVeyeH9FAGIRGQoBWtwrxs3ajU=;
 b=EUAua//jWcjDpwVjpafTgQD7LfpX1Arg+lyEjVRDEJDoWe7QEkQ0zAeeadb88yGdwX
 l2MuWfiQdxSkwLpjoZSd2vA9XI5rh49iNQl8rUA0faAvYW5Oy+D8iq9mYm/jQXxIe8jh
 t/JMun2iqHWZ4Rg7N/woCBTbBJFyvUXGXTcnQoztzF3Nluw/fcgRHK+lfPirz/YiivF0
 cOz80epj17+hD2llYbOBJLHKU6T5oSpbu7GGhRLAlLNh4xPPCFsq+X2Sz4b8ZNhTLU5i
 NWAXWhjSic2SsOmsbzbm9Dlf7amPdqi7rXJauBXnthOIFgGvXwTi8c3QNv38T24V6rlz
 UnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gRIwjh8WrsGWjWn7axVeyeH9FAGIRGQoBWtwrxs3ajU=;
 b=0fvn4g/1i0IIGmjuvbxE+PeOiENVDFxEnycWxJ2AH0W0oDEVeaOYlTSBFPK6KDYCAc
 LJLBbwGc8yV9iLDY7pHZJm7Ki6MpDpoeCGlIQlSyqH4Unl8bs7Q8aNJk8F3vtwZXnJwZ
 ICdDi7/JjI/uV/nDXTjx9EOdRiLFcYW621nxLaFccS4gFGvVQtxLemCfWVCpar3EU7f1
 xFAaEfGXGfxA2is8EeleUk2hazpqdfnixF8ZZ44NR0kS29cBegjeue0Dk7whbEx0CjbO
 TpN8j/DYuAvhc+IgsplfcTk41Ym4ldckugy1SQmJNDj3ZynS1al9M2J/aJv502CLQd/Z
 2ttA==
X-Gm-Message-State: AO0yUKWMFpNI95p6vio49nzHnLAUT0LjnK23hDPhA0n0nj8eivP7OWFx
 Fy6vpqacLIjXmfibqC/rLbbViw==
X-Google-Smtp-Source: AK7set/OXOH1DDgJWP8lfFHG2KeZXWV1J3P9XC47RH3bLBj9oaU8SVjDgcVzornUiW8DHFyLUs6xTg==
X-Received: by 2002:a2e:83c3:0:b0:293:48b8:dcad with SMTP id
 s3-20020a2e83c3000000b0029348b8dcadmr1417632ljh.0.1676738866081; 
 Sat, 18 Feb 2023 08:47:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05651c10b500b002945d119e09sm950834ljn.8.2023.02.18.08.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 08:47:45 -0800 (PST)
Message-ID: <170ee26d-8904-0829-f92e-4ea6678b08eb@linaro.org>
Date: Sat, 18 Feb 2023 18:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU
 GPUs
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-7-konrad.dybcio@linaro.org>
 <2e129fd6-d4e5-a955-5355-3ca71166fb33@linaro.org>
 <82c84ba4-ca33-3ce0-fe86-efedfce04cda@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <82c84ba4-ca33-3ce0-fe86-efedfce04cda@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2023 13:04, Konrad Dybcio wrote:
> 
> 
> On 17.02.2023 22:07, Dmitry Baryshkov wrote:
>> On 14/02/2023 19:31, Konrad Dybcio wrote:
>>> Currently we only utilize the OPP table connected to the GPU for
>>> getting (available) frequencies. We do however need to scale the
>>> voltage rail(s) accordingly to ensure that we aren't trying to
>>> run the GPU at 1GHz with a VDD_LOW vote, as that would result in
>>> an otherwise inexplainable hang.
>>>
>>> Tell the OPP framework that we want to scale the "core" clock
>>> and swap out the clk_set_rate to a dev_pm_opp_set_rate in
>>> msm_devfreq_target() to enable usage of required-opps and by
>>> extension proper voltage level/corner scaling.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
>>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
>>>    2 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> index ce6b76c45b6f..15e405e4f977 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -1047,6 +1047,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>        const char *gpu_name;
>>>        u32 speedbin;
>>>    +    /* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
>>> +    if (!IS_ERR(devm_clk_get(dev, "core")))
>>> +        devm_pm_opp_set_clkname(dev, "core");
>>
>> Can we instead move a call to a6xx_set_supported_hw() / check_speed_bin after the adreno_gpu_init() ? It will call msm_gpu_init, which in turn sets gpu->core_clk.
>>
>> Ideally you can call devm_pm_opp_set_clkname() from that function.
> 
> 
>> Or maybe completely drop gpu->core_clk and always use devm_pm_opp_set_clk_rate().
> That would break non-OPP targets, last of which were probably added N=big years ago..

No. In the lack of OPP tables, dev_pm_opp_clk_set_rate() should behave 
exactly like the clk_set_rate().

> I'm not sure these would still work, as I think we've got rid of some ugly
> clock getters that were looking for both "core" and "core_clk" etc.

We still support core vs core_clk, see the get_clocks() at msm_gpu.c and 
then msm_clk_bulk_get_clock(). However we might mimick this function and 
call devm_pm_opp_set_clkname() with the proper name ("core" or "core_clk").

> 
> See 8db0b6c7b636376789e356d861c3c6c35dcb6913 for what seems to be the most recent
> example of non-OPP.
> 
> IMX51/53 also have no OPP tables and are using the (AFAIK) now-defunct _clk-suffixed
> clock-names.

It works, I tested it during this cycle.

> 
> I'd be more than happy to rip out some of this legacy code and convert it
> to something modern like OPP, but I'm not sure you guys would like it considering
> the breakage on (arguably ancient and borderline retired) platforms.

I think, we should try switching to OPP-for-everybody, granted the 
promise of dev_pm_opp_set_clk_rate() being backwards compatible with 
bare clk_set_rate().

> 
> This patch as-is "only" breaks non-OPP a5xx & a6xx (as they have .gpu_busy defined),
> of which there are none..
> 
>>
>>> +
>>>        adreno_gpu->funcs = funcs;
>>>        adreno_gpu->info = adreno_info(config->rev);
>>>        adreno_gpu->gmem = adreno_gpu->info->gmem;
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> index e27dbf12b5e8..ea70c1c32d94 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>>>            gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
>>>            mutex_unlock(&df->lock);
>>>        } else {
>>> -        clk_set_rate(gpu->core_clk, *freq);
>>> +        dev_pm_opp_set_rate(dev, *freq);
>>
>> This is not enough, there are calls to clk_set_rate(gpu->core_clk) in msm_gpu.c which are called from the suspend/resume path.
> Right, good catch.
> 
> Konrad
>>
>>>        }
>>>          dev_pm_opp_put(opp);
>>

-- 
With best wishes
Dmitry

