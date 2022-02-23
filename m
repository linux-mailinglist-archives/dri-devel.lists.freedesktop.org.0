Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130A4C0A04
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 04:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767DB10E3F8;
	Wed, 23 Feb 2022 03:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A82210E3F8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 03:11:31 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 29so12932743ljv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 19:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O0U/79EjLtUrpYJBtUzSqOjzMDezOuNDhWownL6VLv0=;
 b=YhceP4vMLZwowYK0g+xVT8qDOHotKWjiYCknA/tqJsbaR2OCsrpR7XrBUEfYM9CMzb
 CGlkgVhBaph2Vi6vLpTuaiKlDEv7r79u4WAL/puFusvG0VVSN+BsV6QJmMW7sLqOc+zT
 vL1/aBbzU1LJ6N/LXaspVmo4+tL2MyhG6LvRsomH+gpT9XEySRYD3i6v1vCW2vSZLxj+
 OHm6d/wKGdaq9D2OMf1jMgierxH3vzhO/G6H8bmhfoKHDKSzmYJipOfma81LlXNnG3aC
 wF8EmkZW+c0eiqC67yX/NQK8g0F+RVsdWPiJ5R9LUTsfqLymTyTPRPoykhqssON8c93t
 CgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O0U/79EjLtUrpYJBtUzSqOjzMDezOuNDhWownL6VLv0=;
 b=AyV5R5UT67guraVT/u7Z3O05gLdunZqUgPZxzgdsuuaD/IJ5z8py+m3Ni4QphRDwTC
 smVKj+9kFZzF4z5kWz1ewjbMcT4nLydPd7inKt6Fdptq7elgslBNXEietiG9+uNeLKHt
 ZGQnN8nzAzuE4gTgrAtl1R3gEOikn8wR8I31iIpRAxgXdnuimsrUt2hdxbnrols7ooUl
 /coxlqcBiAxTksJwH3A53hne0+2IGG8VqDAoJaJajsGU15XnzgcXwYBpLPD38FaY7JQG
 j4NLNiLhk7SS6XPBzjT0NaQ6K9TvHEKdVeZppr4T7lMsuy9L9CgyOnqF56S8/24y8J51
 Bvng==
X-Gm-Message-State: AOAM531Iv9jAaRDmkhxQTJ9c+qfInbPH9dcNvY2tuJOgMugEXDgj9CyQ
 d4Q5A1y1Tu3V3JK0rmWuuDHRDg==
X-Google-Smtp-Source: ABdhPJxOawgiicXBd03JJbBfMaaHtv4v26OmN6NlFSWWnE5H+9tb28Xe+ocBCmmRqjy2yQQ+xmbniw==
X-Received: by 2002:a2e:7009:0:b0:244:d483:b2b1 with SMTP id
 l9-20020a2e7009000000b00244d483b2b1mr20644597ljc.308.1645585889812; 
 Tue, 22 Feb 2022 19:11:29 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y27sm1954570ljd.33.2022.02.22.19.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 19:11:29 -0800 (PST)
Message-ID: <6f1225ea-d889-9cf8-3a3d-181e319bd453@linaro.org>
Date: Wed, 23 Feb 2022 06:11:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/msm/gpu: Fix crash on devices without devfreq support
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220219183310.557435-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220219183310.557435-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Anders Roxell <anders.roxell@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/02/2022 21:33, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Avoid going down devfreq paths on devices where devfreq is not
> initialized.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 9bf319be11f6..26a3669a97b3 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -83,12 +83,17 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
>   static void msm_devfreq_boost_work(struct kthread_work *work);
>   static void msm_devfreq_idle_work(struct kthread_work *work);
>   
> +static bool has_devfreq(struct msm_gpu *gpu)
> +{
> +	return !!gpu->funcs->gpu_busy;

I see that devfreq init will be skipped if gpu_busy is NULL.
Can we use gpu->devfreq instead of this condition?

I noticed that you have replaced some of gpu->devfreq checks with 
has_devreq() calls. Is there any difference?

> +}
> +
>   void msm_devfreq_init(struct msm_gpu *gpu)
>   {
>   	struct msm_gpu_devfreq *df = &gpu->devfreq;
>   
>   	/* We need target support to do devfreq */
> -	if (!gpu->funcs->gpu_busy)
> +	if (!has_devfreq(gpu))
>   		return;
>   
>   	dev_pm_qos_add_request(&gpu->pdev->dev, &df->idle_freq,
> @@ -149,6 +154,9 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
>   {
>   	struct msm_gpu_devfreq *df = &gpu->devfreq;
>   
> +	if (!has_devfreq(gpu))
> +		return;
> +
>   	devfreq_cooling_unregister(gpu->cooling);
>   	dev_pm_qos_remove_request(&df->boost_freq);
>   	dev_pm_qos_remove_request(&df->idle_freq);
> @@ -156,16 +164,24 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
>   
>   void msm_devfreq_resume(struct msm_gpu *gpu)
>   {
> -	gpu->devfreq.busy_cycles = 0;
> -	gpu->devfreq.time = ktime_get();
> +	struct msm_gpu_devfreq *df = &gpu->devfreq;
>   
> -	devfreq_resume_device(gpu->devfreq.devfreq);
> +	if (!has_devfreq(gpu))
> +		return;
> +
> +	df->busy_cycles = 0;
> +	df->time = ktime_get();
> +
> +	devfreq_resume_device(df->devfreq);
>   }
>   
>   void msm_devfreq_suspend(struct msm_gpu *gpu)
>   {
>   	struct msm_gpu_devfreq *df = &gpu->devfreq;
>   
> +	if (!has_devfreq(gpu))
> +		return;
> +
>   	devfreq_suspend_device(df->devfreq);
>   
>   	cancel_idle_work(df);
> @@ -185,6 +201,9 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
>   	struct msm_gpu_devfreq *df = &gpu->devfreq;
>   	uint64_t freq;
>   
> +	if (!has_devfreq(gpu))
> +		return;
> +
>   	freq = get_freq(gpu);
>   	freq *= factor;
>   
> @@ -207,7 +226,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>   	struct devfreq_dev_status status;
>   	unsigned int idle_time;
>   
> -	if (!df->devfreq)
> +	if (!has_devfreq(gpu))
>   		return;
>   
>   	/*
> @@ -253,7 +272,7 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>   {
>   	struct msm_gpu_devfreq *df = &gpu->devfreq;
>   
> -	if (!df->devfreq)
> +	if (!has_devfreq(gpu))
>   		return;
>   
>   	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),


-- 
With best wishes
Dmitry
