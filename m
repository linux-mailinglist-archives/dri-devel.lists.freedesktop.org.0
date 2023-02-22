Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A569FE9A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 23:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1EB10E047;
	Wed, 22 Feb 2023 22:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3F110E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 22:38:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i9so11851327lfc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 14:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xIHu4nnAPPXUZ21UG6M9ym3VBtbvhwSrggQRQ13jdRg=;
 b=XuJhiC5WJz54qRS5IMRp0Rfwd0Zng5/dmSLo333fzYyWTHXxEgozbnahSbpLRRs5rE
 H5bqQxUGqwE4ZQ16CuQ4aH9wtwJCHyKgmf/WLfoec7ftWA81gei4zGreA88oZmnGAg2e
 PNrD0IyNJ7zJycFUoJdoHdrWt+SFfHz2Dw2Vqv0hpxvRhRQ4oOACxjZzW0lwUeIUYBvp
 FTPDjxLWKxOC8gTYzzHETYFucjej4pGebxorU/699Bm88/GqiQwdZej2TaNf2c5fB+Ij
 X1/cJJxYXlBQvYZ/PLoLfM7ZAyCaXQ8dJvMuYvk4GxrphxQlpfEW34ArZ61gvebDUs6O
 G8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xIHu4nnAPPXUZ21UG6M9ym3VBtbvhwSrggQRQ13jdRg=;
 b=2bylBRwsNLWauOpkfUt2fi8g+FfVJPSg5VuZwxBIOK+hD1HdqhFlprXid2SYZ11z6L
 uO5yWTHbrwmkq5xIeCSb2lYwmhS9Z+X8ap8VtXdxwDiDdibLC9Pp9SQVEOsuLEwpY9os
 edNaq+ewCLZFzqdqyMBej0DLLLKNS2AYy8d+imVyKN7xzIvIixw3kJkAHcyTNf6ZRhjp
 PnpbNjPOcH4yPk7TApJN9mHMIjfZDe8RjmNz49uhTp0KhIriOHn4dwVjeREXPOBqTzCG
 D38PIevFTkpVol5p0bQC+LwW20NdHXhRVq+wyhPKpaOhv9/MRfVniLNkfqRb8o7wLgKi
 yRSA==
X-Gm-Message-State: AO0yUKUe45dAW0MFcaKwedJwirLgKD7T94DmH/V5KlyfKKPFSUXNRzsp
 28ZS3A+APen7Xuyyeeor4TI5bQ==
X-Google-Smtp-Source: AK7set95xsxdrSwWgw6OSNVj+Cw0OKJOfx4BDkdQQZ1WxKxVwOdM7ez2Z2jBQIpDXwgn9WUnh6fDkw==
X-Received: by 2002:ac2:46d8:0:b0:4d5:6583:d2e4 with SMTP id
 p24-20020ac246d8000000b004d56583d2e4mr3275028lfo.29.1677105507634; 
 Wed, 22 Feb 2023 14:38:27 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a056512021c00b004dc4becfcd6sm884888lfo.54.2023.02.22.14.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:38:27 -0800 (PST)
Message-ID: <6ff7aea6-6535-3f54-b8d2-718d9a38a1be@linaro.org>
Date: Thu, 23 Feb 2023 00:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/5] drm/msm/adreno: Use OPP for every GPU generation
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-1-01021425781b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-1-01021425781b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Some older GPUs (namely a2xx with no opp tables at all and a320 with
> downstream-remnants gpu pwrlevels) used not to have OPP tables. They
> both however had just one frequency defined, making it extremely easy
> to construct such an OPP table from within the driver if need be.
> 
> Do so and switch all clk_set_rate calls on core_clk to their OPP
> counterparts.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 94 +++++++++++++++------------------
>   drivers/gpu/drm/msm/msm_gpu.c           |  4 +-
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c   |  2 +-
>   3 files changed, 45 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index ce6b76c45b6f..9b940c0f063f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -922,73 +922,50 @@ void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
>   			ring->id);
>   }
>   
> -/* Get legacy powerlevels from qcom,gpu-pwrlevels and populate the opp table */
> -static int adreno_get_legacy_pwrlevels(struct device *dev)
> -{
> -	struct device_node *child, *node;
> -	int ret;
> -
> -	node = of_get_compatible_child(dev->of_node, "qcom,gpu-pwrlevels");
> -	if (!node) {
> -		DRM_DEV_DEBUG(dev, "Could not find the GPU powerlevels\n");
> -		return -ENXIO;
> -	}
> -
> -	for_each_child_of_node(node, child) {
> -		unsigned int val;
> -
> -		ret = of_property_read_u32(child, "qcom,gpu-freq", &val);
> -		if (ret)
> -			continue;
> -
> -		/*
> -		 * Skip the intentionally bogus clock value found at the bottom
> -		 * of most legacy frequency tables
> -		 */
> -		if (val != 27000000)
> -			dev_pm_opp_add(dev, val, 0);
> -	}
> -
> -	of_node_put(node);
> -
> -	return 0;
> -}
> -
> -static void adreno_get_pwrlevels(struct device *dev,
> +static int adreno_get_pwrlevels(struct device *dev,
>   		struct msm_gpu *gpu)
>   {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	unsigned long freq = ULONG_MAX;
>   	struct dev_pm_opp *opp;
>   	int ret;
>   
>   	gpu->fast_rate = 0;
>   
> -	/* You down with OPP? */
> -	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
> -		ret = adreno_get_legacy_pwrlevels(dev);
> -	else {
> -		ret = devm_pm_opp_of_add_table(dev);
> -		if (ret)
> -			DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
> -	}
> -
> -	if (!ret) {
> +	/* devm_pm_opp_of_add_table may error out but will still create an OPP table */
> +	ret = devm_pm_opp_of_add_table(dev);
> +	if (ret == -ENODEV) {
> +		/* Special cases for ancient hw with ancient DT bindings */
> +		if (adreno_is_a2xx(adreno_gpu)) {
> +			dev_warn(dev, "Unable to find the OPP table. Falling back to 200 MHz.\n");
> +			dev_pm_opp_add(dev, 200000000, 0);
> +			gpu->fast_rate = 200000000;

We can skip setting the fast_rate, dev_pm_opp_find_freq_floor below will 
get it from our freshly generated opp table.

> +		} else if (adreno_is_a320(adreno_gpu)) {
> +			dev_warn(dev, "Unable to find the OPP table. Falling back to 450 MHz.\n");
> +			dev_pm_opp_add(dev, 450000000, 0);
> +			gpu->fast_rate = 450000000;
> +		} else {
> +			DRM_DEV_ERROR(dev, "Unable to find the OPP table\n");
> +			return -ENODEV;
> +		}
> +	} else if (ret) {
> +		DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
> +		return ret;
> +	} else {
>   		/* Find the fastest defined rate */
>   		opp = dev_pm_opp_find_freq_floor(dev, &freq);
> -		if (!IS_ERR(opp)) {
> +
> +		if (IS_ERR(opp))
> +			return PTR_ERR(opp);
> +		else {
>   			gpu->fast_rate = freq;
>   			dev_pm_opp_put(opp);
>   		}
>   	}
>   
> -	if (!gpu->fast_rate) {
> -		dev_warn(dev,
> -			"Could not find a clock rate. Using a reasonable default\n");
> -		/* Pick a suitably safe clock speed for any target */
> -		gpu->fast_rate = 200000000;
> -	}
> -
>   	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
> +
> +	return 0;
>   }
>   
>   int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
> @@ -1046,6 +1023,17 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	struct adreno_rev *rev = &config->rev;
>   	const char *gpu_name;
>   	u32 speedbin;
> +	int ret;
> +
> +	/* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */

I'd rephrase this to '...done before devm_pm_opp_of_add_table(), or 
dev_pm_opp_set_config() will...'. It took me a while to find correct 
limitation.

I wanted to move the code below to msm_gpu_init(), but after digging in 
found that it's not possible.


> +	if (IS_ERR(devm_clk_get(dev, "core"))) {
> +		/*
> +		 * If "core" is absent, go for the legacy clock name.
> +		 * If we got this far in probing, it's a given one of them exists.
> +		 */
> +		devm_pm_opp_set_clkname(dev, "core_clk");
> +	} else
> +		devm_pm_opp_set_clkname(dev, "core");
>   
>   	adreno_gpu->funcs = funcs;
>   	adreno_gpu->info = adreno_info(config->rev);
> @@ -1070,7 +1058,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   
>   	adreno_gpu_config.nr_rings = nr_rings;
>   
> -	adreno_get_pwrlevels(dev, gpu);
> +	ret = adreno_get_pwrlevels(dev, gpu);
> +	if (ret)
> +		return ret;
>   
>   	pm_runtime_set_autosuspend_delay(dev,
>   		adreno_gpu->info->inactive_period);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 380249500325..cdcb00df3f25 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -59,7 +59,7 @@ static int disable_pwrrail(struct msm_gpu *gpu)
>   static int enable_clk(struct msm_gpu *gpu)
>   {
>   	if (gpu->core_clk && gpu->fast_rate)
> -		clk_set_rate(gpu->core_clk, gpu->fast_rate);
> +		dev_pm_opp_set_rate(&gpu->pdev->dev, gpu->fast_rate);
>   
>   	/* Set the RBBM timer rate to 19.2Mhz */
>   	if (gpu->rbbmtimer_clk)
> @@ -78,7 +78,7 @@ static int disable_clk(struct msm_gpu *gpu)
>   	 * will be rounded down to zero anyway so it all works out.
>   	 */
>   	if (gpu->core_clk)
> -		clk_set_rate(gpu->core_clk, 27000000);
> +		dev_pm_opp_set_rate(&gpu->pdev->dev, 27000000);
>   
>   	if (gpu->rbbmtimer_clk)
>   		clk_set_rate(gpu->rbbmtimer_clk, 0);
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
>   	}
>   
>   	dev_pm_opp_put(opp);
> 

-- 
With best wishes
Dmitry

