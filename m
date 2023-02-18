Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A6569B98B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 12:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1422610E1EF;
	Sat, 18 Feb 2023 11:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A19F10E170
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 11:04:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id s7so547581lfc.11
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 03:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oXuh68GV1v7/hPtd7U1EjUQCELSSpW0ycnpWQTsoA5k=;
 b=YhXjaug3sThqcQ+BBifoo+urG2JwvSOFIynT+E9T6PVraeePN2I3dXP63Sww7UtS+U
 AYPETuvRDxUuP7qmx3pKjMkqhffAAmfleV8cwhapjAoI1YOENe9LsfmMsdjSzFvpra8Q
 UxFuuP545jmyn/ogBlH/WH04oU+PWbLyvSmRj7HM8n7dP+JB9/SpuO1P0m+bkiEmMxZN
 5eOSPYk2XjCKEfI2XfUP/eBGjyKMuVJ5WiaPAbZBfrv0qReXC3L98MU3N/x6t3tAycS4
 zLJdRmQfgYlBAuKkqBqQ/dDromI9b4+f/DmoA+vjHY5MHoE6ZFkzz6vmNg8HAEp0WxSf
 fcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oXuh68GV1v7/hPtd7U1EjUQCELSSpW0ycnpWQTsoA5k=;
 b=g2l0gNzn5pi7Ct8Btc0XPvDH7ZMc64ZWZ+TpZHVjFUzIIhAkl98Z9kVSGiNOFtJ0MG
 OrrnkUkB3cP6FUGZVD7THWMIJFDPAE0OzG5xgFvXnJKsApdxTmBc6/AdbbXk4i+8RviB
 RLQpQeq6GaAhmCo64xH3DT9Uue7Z+Da6s+Z9QvvBHayqHdbeLLYX3APVg2ksNsyqZaNv
 6E5V274mbvEEObrmPO+oN5hK7nSJXc1Gwx+cwcwKlLqhCunLTXKWJEB4WldOrKWpuNky
 xSztOmfb0hP++kHRR2uSmbwfSvrqe3K+/dt0R4uotTCP444nA42LKN24qKPCy+pWv9lz
 YVew==
X-Gm-Message-State: AO0yUKUK+RNEY5p1GIa0b6xtcPpEVQ9R1/ijIHPJLgHZa6cAjW5URW/g
 s2SOOKzqIG+pOcbZfoU7fF1S9g==
X-Google-Smtp-Source: AK7set+anSNYEJwtdsETWW6Zi4WqCdH3ljEBlwUdS0tMcpV2KgQp4MYL2/zu9eIGNbS0P2YDc7hmWQ==
X-Received: by 2002:ac2:447a:0:b0:4dc:4cb6:6752 with SMTP id
 y26-20020ac2447a000000b004dc4cb66752mr2384113lfl.52.1676718287327; 
 Sat, 18 Feb 2023 03:04:47 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a19a403000000b004d869c1861esm948374lfc.192.2023.02.18.03.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 03:04:46 -0800 (PST)
Message-ID: <82c84ba4-ca33-3ce0-fe86-efedfce04cda@linaro.org>
Date: Sat, 18 Feb 2023 12:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU
 GPUs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-7-konrad.dybcio@linaro.org>
 <2e129fd6-d4e5-a955-5355-3ca71166fb33@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2e129fd6-d4e5-a955-5355-3ca71166fb33@linaro.org>
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



On 17.02.2023 22:07, Dmitry Baryshkov wrote:
> On 14/02/2023 19:31, Konrad Dybcio wrote:
>> Currently we only utilize the OPP table connected to the GPU for
>> getting (available) frequencies. We do however need to scale the
>> voltage rail(s) accordingly to ensure that we aren't trying to
>> run the GPU at 1GHz with a VDD_LOW vote, as that would result in
>> an otherwise inexplainable hang.
>>
>> Tell the OPP framework that we want to scale the "core" clock
>> and swap out the clk_set_rate to a dev_pm_opp_set_rate in
>> msm_devfreq_target() to enable usage of required-opps and by
>> extension proper voltage level/corner scaling.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
>>   drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index ce6b76c45b6f..15e405e4f977 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -1047,6 +1047,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>       const char *gpu_name;
>>       u32 speedbin;
>>   +    /* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
>> +    if (!IS_ERR(devm_clk_get(dev, "core")))
>> +        devm_pm_opp_set_clkname(dev, "core");
> 
> Can we instead move a call to a6xx_set_supported_hw() / check_speed_bin after the adreno_gpu_init() ? It will call msm_gpu_init, which in turn sets gpu->core_clk.
> 
> Ideally you can call devm_pm_opp_set_clkname() from that function.


Or maybe completely drop gpu->core_clk and always use devm_pm_opp_set_clk_rate().
That would break non-OPP targets, last of which were probably added N=big years ago..
I'm not sure these would still work, as I think we've got rid of some ugly
clock getters that were looking for both "core" and "core_clk" etc.

See 8db0b6c7b636376789e356d861c3c6c35dcb6913 for what seems to be the most recent
example of non-OPP.

IMX51/53 also have no OPP tables and are using the (AFAIK) now-defunct _clk-suffixed
clock-names.

I'd be more than happy to rip out some of this legacy code and convert it
to something modern like OPP, but I'm not sure you guys would like it considering
the breakage on (arguably ancient and borderline retired) platforms.

This patch as-is "only" breaks non-OPP a5xx & a6xx (as they have .gpu_busy defined),
of which there are none..

> 
>> +
>>       adreno_gpu->funcs = funcs;
>>       adreno_gpu->info = adreno_info(config->rev);
>>       adreno_gpu->gmem = adreno_gpu->info->gmem;
>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>> index e27dbf12b5e8..ea70c1c32d94 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>>           gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
>>           mutex_unlock(&df->lock);
>>       } else {
>> -        clk_set_rate(gpu->core_clk, *freq);
>> +        dev_pm_opp_set_rate(dev, *freq);
> 
> This is not enough, there are calls to clk_set_rate(gpu->core_clk) in msm_gpu.c which are called from the suspend/resume path.
Right, good catch.

Konrad
> 
>>       }
>>         dev_pm_opp_put(opp);
> 
