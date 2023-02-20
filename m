Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F569C857
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 11:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F34310E644;
	Mon, 20 Feb 2023 10:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDD610E644
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 10:12:38 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a26so2188252lfk.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 02:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yUwOEcP/9DVBcxe0bKGyfVyvNVdmcwpphO5iPjcAR2Y=;
 b=M8OCDBRQNiFgCz8B++bKSbGyIe/Sc8R3/kF/tjGPKh2+7uvCbrlTkduOD00JHqQbV9
 FIBj0A73WTq3yJsNIzu1O0eBT9TLbhW3zyn7LRAVUvjYIYimUP9TcKRLky6oGDNO9Y3H
 lwavTIFxRfhAUZE/gaSmb3um6h/qanP55kyNI+f8Tcr6MwNnOfTXvAUvVO1urZXSxSrX
 xGvjmObFw2ZdIE6RDQm7DyHjX49ib8WNwOfXKQt30Kuo8VZgg/ltzOdOxbumtDOf/Qv3
 DGCJ/8WX0EJzKFgEU5dtoUOwx6uAcd8JjOvjz89d3FvCPlL5zPovy8vWUgbO3k7yxCJ7
 XeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yUwOEcP/9DVBcxe0bKGyfVyvNVdmcwpphO5iPjcAR2Y=;
 b=fkNBiGSPargBIPkpUZtMR4HJHFlLIqQeIWrzSj1X8FvVjLOjpP1+gey5ZniCY2Orbz
 5DHdvf59kNtAS2zqzvR8ZK3wjAS7DM2rS1lRNiXQ5C0Wp5QtXivi0cEkYVFlApu+vbC2
 oNsfmi0gNnC+/w6fH5WZ7n5gYDCG5ZpTGBUaXETwS54nvXVbnFI1NpqoPEoKg9Q1B3yo
 kqZq8G8FSeZiSzPrB/ZRXgwKIxH5MfM20CNNC7k+5Ty6koVp/JcTot8JEUG8iDsc0rfx
 sXuvOD6PepHFHDmPQqc0gHqi/ZPJ/p/YmEmwLmSe87l4qZX9YzJG/V0DsUpCZgpKt6/A
 Izug==
X-Gm-Message-State: AO0yUKX6e+mnAone98P/dJLA5GbTgEMR7Z3lLsIHAddWumMVIrIIPIi4
 eDG2kz0qbsgFHLtlM5vOAvZTSA==
X-Google-Smtp-Source: AK7set9Eb3oSF53U5AMIrSTg/gwDN6c/gEjlLGQp0XUv4sLxp7wlqjIlD5IraSspSok/CSPFUn5Vsg==
X-Received: by 2002:a19:ae07:0:b0:4cc:b784:c47e with SMTP id
 f7-20020a19ae07000000b004ccb784c47emr296664lfc.62.1676887956482; 
 Mon, 20 Feb 2023 02:12:36 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 u15-20020ac24c2f000000b004db4ec844c8sm71941lfq.235.2023.02.20.02.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 02:12:36 -0800 (PST)
Message-ID: <de1ceb35-0b9b-b99d-49f4-f93cc8332032@linaro.org>
Date: Mon, 20 Feb 2023 11:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU
 GPUs
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-7-konrad.dybcio@linaro.org>
 <2e129fd6-d4e5-a955-5355-3ca71166fb33@linaro.org>
 <82c84ba4-ca33-3ce0-fe86-efedfce04cda@linaro.org>
 <170ee26d-8904-0829-f92e-4ea6678b08eb@linaro.org>
 <cc7a9cce-cd12-0f35-d8f7-933b64bbb34d@linaro.org>
In-Reply-To: <cc7a9cce-cd12-0f35-d8f7-933b64bbb34d@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 20.02.2023 10:59, Konrad Dybcio wrote:
> 
> 
> On 18.02.2023 17:47, Dmitry Baryshkov wrote:
>> On 18/02/2023 13:04, Konrad Dybcio wrote:
>>>
>>>
>>> On 17.02.2023 22:07, Dmitry Baryshkov wrote:
>>>> On 14/02/2023 19:31, Konrad Dybcio wrote:
>>>>> Currently we only utilize the OPP table connected to the GPU for
>>>>> getting (available) frequencies. We do however need to scale the
>>>>> voltage rail(s) accordingly to ensure that we aren't trying to
>>>>> run the GPU at 1GHz with a VDD_LOW vote, as that would result in
>>>>> an otherwise inexplainable hang.
>>>>>
>>>>> Tell the OPP framework that we want to scale the "core" clock
>>>>> and swap out the clk_set_rate to a dev_pm_opp_set_rate in
>>>>> msm_devfreq_target() to enable usage of required-opps and by
>>>>> extension proper voltage level/corner scaling.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
>>>>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
>>>>>    2 files changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>> index ce6b76c45b6f..15e405e4f977 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>> @@ -1047,6 +1047,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>>        const char *gpu_name;
>>>>>        u32 speedbin;
>>>>>    +    /* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
>>>>> +    if (!IS_ERR(devm_clk_get(dev, "core")))
>>>>> +        devm_pm_opp_set_clkname(dev, "core");
>>>>
>>>> Can we instead move a call to a6xx_set_supported_hw() / check_speed_bin after the adreno_gpu_init() ? It will call msm_gpu_init, which in turn sets gpu->core_clk.
>>>>
>>>> Ideally you can call devm_pm_opp_set_clkname() from that function.
>>>
>>>
>>>> Or maybe completely drop gpu->core_clk and always use devm_pm_opp_set_clk_rate().
>>> That would break non-OPP targets, last of which were probably added N=big years ago..
>>
>> No. In the lack of OPP tables, dev_pm_opp_clk_set_rate() should behave exactly like the clk_set_rate().
> Not sure if that's what you meant, but if a device lacks OPP,
> devm_pm_opp_set_rate will return -ENODEV.
> 
> If you meant "if we can't find an opp table, behave as if we
> called clk_set_rate", a discussion on #freedreno with robclark
> indicates he'd accept getting rid of non-opp code, provided we
> construct a table if need be, since we have the data required
> to do so ([FMIN=27MHz, FMAX=fast_rate]).
Actually.. that's what happens for gpu-pwrlevels users already..
Well, use>r<, as apq8064 seems to have been the only user of
that upstream, ever..

And for A2XX it looks like it just unconditionally selects 200
MHz..

I think this could be simplified to:

if (opp exists)
    // use opp
else if (adreno_is_a2xx)
    dev_pm_opp_add(dev, 200000000, 0) //device, freq_hz, volt_uV
else if (adreno_is_a320)
    dev_pm_opp_add(dev, 450000000, 0)
else
    // for now the driver sets 200mhz here, but i don't think
    // it's reasonable to keep carrying that behavior for >a2xx
    return -EINVAL


And then we can yank out all clk_set_rate calls just like that!

Konrad
> 
>>
>>> I'm not sure these would still work, as I think we've got rid of some ugly
>>> clock getters that were looking for both "core" and "core_clk" etc.
>>
>> We still support core vs core_clk, see the get_clocks() at msm_gpu.c and then msm_clk_bulk_get_clock(). However we might mimick this function and call devm_pm_opp_set_clkname() with the proper name ("core" or "core_clk").
>>
>>>
>>> See 8db0b6c7b636376789e356d861c3c6c35dcb6913 for what seems to be the most recent
>>> example of non-OPP.
>>>
>>> IMX51/53 also have no OPP tables and are using the (AFAIK) now-defunct _clk-suffixed
>>> clock-names.
>>
>> It works, I tested it during this cycle.
> Oh okay, I had a feeling like that was dropped at one point..
> 
>>
>>>
>>> I'd be more than happy to rip out some of this legacy code and convert it
>>> to something modern like OPP, but I'm not sure you guys would like it considering
>>> the breakage on (arguably ancient and borderline retired) platforms.
>>
>> I think, we should try switching to OPP-for-everybody, granted the promise of dev_pm_opp_set_clk_rate() being backwards compatible with bare clk_set_rate().
> It's not, but as I mentioned, we can easily work around that.
> 
>>
>>>
>>> This patch as-is "only" breaks non-OPP a5xx & a6xx (as they have .gpu_busy defined),
>>> of which there are none..
> ...but we want to get devfreq everywhere and it's a few LoC away..
> 
> Konrad
>>>
>>>>
>>>>> +
>>>>>        adreno_gpu->funcs = funcs;
>>>>>        adreno_gpu->info = adreno_info(config->rev);
>>>>>        adreno_gpu->gmem = adreno_gpu->info->gmem;
>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> index e27dbf12b5e8..ea70c1c32d94 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>>>>>            gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
>>>>>            mutex_unlock(&df->lock);
>>>>>        } else {
>>>>> -        clk_set_rate(gpu->core_clk, *freq);
>>>>> +        dev_pm_opp_set_rate(dev, *freq);
>>>>
>>>> This is not enough, there are calls to clk_set_rate(gpu->core_clk) in msm_gpu.c which are called from the suspend/resume path.
>>> Right, good catch.
>>>
>>> Konrad
>>>>
>>>>>        }
>>>>>          dev_pm_opp_put(opp);
>>>>
>>
