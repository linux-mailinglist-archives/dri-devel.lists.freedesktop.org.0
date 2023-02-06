Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9E68C5C6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 19:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0AF10E9EC;
	Mon,  6 Feb 2023 18:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BF310E9EC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 18:30:42 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id mc11so36764862ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 10:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/jYmi9IvnFIypy0mds4wMWCZZJQWX6LaMpS3CK15Nck=;
 b=meb3gpgNV8yB3mS6e4DHFRab1mSjoBU1gs/uHV8RbeJ9ixwvDP3EFdHrl5gakVyEXs
 el94qLuYPpmldddxpgwWxG9Z3edGYOVQkE0BcwE0EvanV6ZGm9GsEoE1uZF0V4B5GabJ
 sLlRy5R+CjUVYLEpAXny8VmNeiJi9g3s3yWm5+wZwODLewLy+3iBxUayAmqR5WZDUSo5
 gLJCOIKNizbpMkjTNGHLGejUlOlfBw5jTeO1MAv7WDwm21EYgARwg08KJDPiYKYnn2Kl
 mHW590FmluZhKrOhCZ3jPQaovHMwSojFwlfGSG+9r2js9ihTfpxs4oEM4QmDvfQpyvRP
 neTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/jYmi9IvnFIypy0mds4wMWCZZJQWX6LaMpS3CK15Nck=;
 b=d/HrfrA8Bm3vnpzTSLYLB1sVgiWKjTR1KdQkjRxx+jyI/LIn+nyMOHskQXLLnA/gqs
 XayNZSX+IJ2n+ph7/yZxCaCXtE6mreTN2h0wN5dCgy9FK6DRSL9hdYVKvpNKb+q/DTI2
 EGWRezB3vSOSkKxuJkw76P6xzPSbp+uEr6i9000+sgbPhp2h0ASNUCjtLNCAPNIfLNBO
 xSF2DrvqZDKjHAtCPueMKX64jr6rnzhBypp/uRhZkAyhyOQcTv/w01Vu+mh/AQue+d2n
 Wu77wzvlOC9wRL0oRgIh9Ed5pwzJAZVByj/jmiwp+2hLf45xXMgp7GsrpGaslGJHgmOW
 NP2Q==
X-Gm-Message-State: AO0yUKWM51N9EgIHoQJ/6ymVqb/WVa7S8Y/Brcld8RtOmepQ+hm5M697
 lSBxcIs4pxnzO17BxfPIPlR75g==
X-Google-Smtp-Source: AK7set9h7k+5/mLKiqGh8P5Hj7oMyP9YAgx1ZMwdMQ1pClIoToN8Rko8Eh30kdGfwAF1NAkOZG3vcA==
X-Received: by 2002:a17:907:9706:b0:878:4c4e:1c6a with SMTP id
 jg6-20020a170907970600b008784c4e1c6amr421164ejc.3.1675708240771; 
 Mon, 06 Feb 2023 10:30:40 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 ui4-20020a170907c90400b0087848a5daf5sm5837441ejc.225.2023.02.06.10.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:30:40 -0800 (PST)
Message-ID: <b5592c00-87ff-dcf7-7342-56c4c593fc42@linaro.org>
Date: Mon, 6 Feb 2023 19:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU
 GPUs
Content-Language: en-US
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
 <20230126151618.225127-7-konrad.dybcio@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230126151618.225127-7-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26.01.2023 16:16, Konrad Dybcio wrote:
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
Welp, as-is, this breaks devfreq on GPUs with a GMU.. Will fix..

Konrad
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 817599766329..c85ae3845a4e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1047,6 +1047,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	const char *gpu_name;
>  	u32 speedbin;
>  
> +	/* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
> +	devm_pm_opp_set_clkname(dev, "core");
> +
>  	adreno_gpu->funcs = funcs;
>  	adreno_gpu->info = adreno_info(config->rev);
>  	adreno_gpu->gmem = adreno_gpu->info->gmem;
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index e27dbf12b5e8..ea70c1c32d94 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>  		gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
>  		mutex_unlock(&df->lock);
>  	} else {
> -		clk_set_rate(gpu->core_clk, *freq);
> +		dev_pm_opp_set_rate(dev, *freq);
>  	}
>  
>  	dev_pm_opp_put(opp);
