Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89EF69B45B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B308310E483;
	Fri, 17 Feb 2023 21:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A819110E191
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:07:08 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r2so731421ljn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mq8A/0rhG6AT//xrl3XDfAyTm02RPehleIptm7GikgY=;
 b=e49GzX8HDw9zdkwM7WoCelbzMRJRz2croaMGPdRiF3e3fgJ8yxOdUHAUh4WkrHPHqI
 sECDo+ZMmeX8JmqPbsI3+3ygR5ZEQd87mfDzvjq+3zeZN0Xcv2bXmK+os0Oqcorixtkg
 vada4UBhqwM9qTjWoK6UFvtZTonBqrTa1TyQfUPXv9U6vpwZKgDxsNOv+Q+HDoN0wEIY
 Ep5d7BGnccPcvoyV06++PoCNfbrTCt+Gw/cjzmnMasSIdHh1Z1b6SAD+qG64hW0UMxcj
 /DqkGt7RlYKIvCKWXzPU6rNA0azPUBhBzVA1RP2AWzgFpD56+eLZuXlrXWvoUaGW2AaM
 x6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mq8A/0rhG6AT//xrl3XDfAyTm02RPehleIptm7GikgY=;
 b=1Jv6IL+K6ArdzPpt1TvDjgTddk7pknkqjagxDvAQE2G9OmHqTT4qw4tiewB2Qf5RA7
 LVXN7JHbfZKz2ZT4vVgK/TWpCr/3w9l77kHlCaBR5vvI84cF7xDyEwQUEm5MOwHToISB
 1lBv+R7mqEIKW5VocqhMwFLcbHpUWaa8/ayOqkrD1/72cfCTUedovnxoMUWrUSukmag9
 HCUMqQpZy5yWFH9PFSBDRvI7IWFupyP2m3AVT5ro/t3T7Fn3BxV3tphR4xpztEYJd2pu
 yu3aBb4DHdlhnLw0nezsFWB83zD+41lKwoV4UAHdOZPN5ue/HJMkpvacn7h0X4VGQJo5
 Nqkw==
X-Gm-Message-State: AO0yUKUuejmI7YrE0h43ChE/5DKhwa1LjYwmG4/9zxVkfFNPjvpGgF9C
 hu65C3UHvFvH+vVBcLNT1+f+awA0NfkVy43z
X-Google-Smtp-Source: AK7set+1ihJI1tJPL7YWC72NTcvAKd77K2nw/x7vA7elVm22cZ0Z5abkQNG8PKyFHzCotssyjxqbgA==
X-Received: by 2002:a2e:94c9:0:b0:290:7017:7fe3 with SMTP id
 r9-20020a2e94c9000000b0029070177fe3mr827984ljh.50.1676668026854; 
 Fri, 17 Feb 2023 13:07:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t1-20020ac25481000000b004d16263b36bsm777310lfk.111.2023.02.17.13.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:07:06 -0800 (PST)
Message-ID: <2e129fd6-d4e5-a955-5355-3ca71166fb33@linaro.org>
Date: Fri, 17 Feb 2023 23:07:05 +0200
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-7-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> Currently we only utilize the OPP table connected to the GPU for
> getting (available) frequencies. We do however need to scale the
> voltage rail(s) accordingly to ensure that we aren't trying to
> run the GPU at 1GHz with a VDD_LOW vote, as that would result in
> an otherwise inexplainable hang.
> 
> Tell the OPP framework that we want to scale the "core" clock
> and swap out the clk_set_rate to a dev_pm_opp_set_rate in
> msm_devfreq_target() to enable usage of required-opps and by
> extension proper voltage level/corner scaling.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index ce6b76c45b6f..15e405e4f977 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1047,6 +1047,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	const char *gpu_name;
>   	u32 speedbin;
>   
> +	/* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
> +	if (!IS_ERR(devm_clk_get(dev, "core")))
> +		devm_pm_opp_set_clkname(dev, "core");

Can we instead move a call to a6xx_set_supported_hw() / check_speed_bin 
after the adreno_gpu_init() ? It will call msm_gpu_init, which in turn 
sets gpu->core_clk.

Ideally you can call devm_pm_opp_set_clkname() from that function. Or 
maybe completely drop gpu->core_clk and always use 
devm_pm_opp_set_clk_rate().

> +
>   	adreno_gpu->funcs = funcs;
>   	adreno_gpu->info = adreno_info(config->rev);
>   	adreno_gpu->gmem = adreno_gpu->info->gmem;
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index e27dbf12b5e8..ea70c1c32d94 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   		gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
>   		mutex_unlock(&df->lock);
>   	} else {
> -		clk_set_rate(gpu->core_clk, *freq);
> +		dev_pm_opp_set_rate(dev, *freq);

This is not enough, there are calls to clk_set_rate(gpu->core_clk) in 
msm_gpu.c which are called from the suspend/resume path.

>   	}
>   
>   	dev_pm_opp_put(opp);

-- 
With best wishes
Dmitry

