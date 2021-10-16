Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA8430394
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 18:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0237C6E446;
	Sat, 16 Oct 2021 16:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D8F6E442
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 16:09:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so5598657wms.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 09:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YwrD7acOnOmUz8kuzOsdw05t0ErwSAGixf9d/VE1/Tg=;
 b=zMcWvhGfKX1dbtPtzdAyYPn3nIZhS1uqiQ8m6NhzvTzDv/8odNazih8Jtp1DhIKBFl
 SLu7C3cO67L7z6JfbKvHnMFNCMEr+CfRLzngfbV4s+b9j8WncaC7czFZMlPAr/VRNdKf
 btl5Agc6fd7LEp7LRpfK1CzXPu9y62l7Y2PacqExVQKNchEEp8CqqbPyN1ruSk0FZ4ab
 JhuY7rmhu00oK9EiDfEyu4MPMtxs4XyPmHirSImAfiowVfEE33/194wm71w/Pc/nzUSR
 XB65/S3+Qm5XFJQfaNFFzeHutQWNeOs4WLLZ4vNP6qLSh6pm36JXy2HD3xhz64VWVawO
 i/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YwrD7acOnOmUz8kuzOsdw05t0ErwSAGixf9d/VE1/Tg=;
 b=SgBhi1EWJm6Y3jfNmOhCTaGs51qTAy+nbE6Oxo6kCdyNx2ZQhnsGZuvVN1wzDlaLeu
 pyHdZMBq/DdVoXx+N4479LDuRz3QdwmWnOV1RpFcYH0CpuEwmm9ZDCbghrT7uMY83hCq
 VmlRKTxWj2l3i/U3C1CA0T0x+w7ow2oXzypfCRVb0BmcANEX/WYHuxK73rGQOjwFT2bT
 xl3Z+D486xR6wnNnDgnkNkuOs5ngydyDOyElMJI5o0di0mMm6305lRGzdbUYHEi5pOpb
 kQcwswMiaHSii+SOszEAPk27f9FmuMBeE83/QBeKQBTu7Y5/1AfiElSrAtZkvgyXDwmQ
 mbHA==
X-Gm-Message-State: AOAM533D41SCskP8bG6FPzXh5WyHsd+HZqT7at1XCs63o/nqJWlJqbUU
 pdLBYERyc3X4uS4ADbamaBg4Tw==
X-Google-Smtp-Source: ABdhPJwi/rrSzXlVlH1Tk5NoyfM+ZKFQY/2OeC/C/rVDmiC2Txrtbl2kzlCG5czTNBYQ/5oBB2Cx+w==
X-Received: by 2002:a05:600c:1c10:: with SMTP id
 j16mr19481180wms.28.1634400541218; 
 Sat, 16 Oct 2021 09:09:01 -0700 (PDT)
Received: from [192.168.0.30]
 (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
 by smtp.gmail.com with ESMTPSA id z1sm7731018wrt.94.2021.10.16.09.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Oct 2021 09:09:00 -0700 (PDT)
Message-ID: <0b15a2b6-1fd1-1e52-4896-e588272b25d3@linaro.org>
Date: Sat, 16 Oct 2021 17:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] drm/msm/devfreq: Add 1ms delay before clamping freq
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark
 <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20210927230455.1066297-1-robdclark@gmail.com>
 <vFWu4k2fr7YZdUamZdttf2XTTm05kYAza_JI_jGvD28ZV19dUqZmoWkqsf3Bgw_kAbQj87uGiMS0F0O7wtXtEw==@protonmail.internalid>
 <20210927230455.1066297-2-robdclark@gmail.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20210927230455.1066297-2-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/09/2021 00:04, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a short delay before clamping to idle frequency on active->idle
> transition.  It takes ~0.5ms to increase the freq again on the next
> idle->active transition, so this helps avoid extra freq transitions
> on workloads that bounce between CPU and GPU.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Note that this sort of re-introduces the theoretical race solved
> by [1].. but that should not be a problem with something along the
> lines of [2].
> 
> [1] https://patchwork.freedesktop.org/patch/455910/?series=95111&rev=1
> [2] https://patchwork.freedesktop.org/patch/455928/?series=95119&rev=1
> 
>   drivers/gpu/drm/msm/msm_gpu.h         |  7 +++++
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 38 +++++++++++++++++++++------
>   2 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 32a859307e81..2fcb6c195865 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -120,6 +120,13 @@ struct msm_gpu_devfreq {
>   	 * it is inactive.
>   	 */
>   	unsigned long idle_freq;
> +
> +	/**
> +	 * idle_work:
> +	 *
> +	 * Used to delay clamping to idle freq on active->idle transition.
> +	 */
> +	struct msm_hrtimer_work idle_work;
>   };
> 
>   struct msm_gpu {
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 15b64f35c0f6..36e1930ee26d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -96,8 +96,12 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
>   	.get_cur_freq = msm_devfreq_get_cur_freq,
>   };
> 
> +static void msm_devfreq_idle_work(struct kthread_work *work);
> +
>   void msm_devfreq_init(struct msm_gpu *gpu)
>   {
> +	struct msm_gpu_devfreq *df = &gpu->devfreq;
> +
>   	/* We need target support to do devfreq */
>   	if (!gpu->funcs->gpu_busy)
>   		return;
> @@ -113,25 +117,27 @@ void msm_devfreq_init(struct msm_gpu *gpu)
>   	msm_devfreq_profile.freq_table = NULL;
>   	msm_devfreq_profile.max_state = 0;
> 
> -	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
> +	df->devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
>   			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
>   			NULL);
> 
> -	if (IS_ERR(gpu->devfreq.devfreq)) {
> +	if (IS_ERR(df->devfreq)) {
>   		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> -		gpu->devfreq.devfreq = NULL;
> +		df->devfreq = NULL;
>   		return;
>   	}
> 
> -	devfreq_suspend_device(gpu->devfreq.devfreq);
> +	devfreq_suspend_device(df->devfreq);
> 
> -	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> -			gpu->devfreq.devfreq);
> +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node, df->devfreq);
>   	if (IS_ERR(gpu->cooling)) {
>   		DRM_DEV_ERROR(&gpu->pdev->dev,
>   				"Couldn't register GPU cooling device\n");
>   		gpu->cooling = NULL;
>   	}
> +
> +	msm_hrtimer_work_init(&df->idle_work, gpu->worker, msm_devfreq_idle_work,
> +			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>   }
> 
>   void msm_devfreq_cleanup(struct msm_gpu *gpu)
> @@ -179,6 +185,11 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>   	unsigned int idle_time;
>   	unsigned long target_freq = df->idle_freq;
> 
> +	/*
> +	 * Cancel any pending transition to idle frequency:
> +	 */
> +	hrtimer_cancel(&df->idle_work.timer);
> +
>   	/*
>   	 * Hold devfreq lock to synchronize with get_dev_status()/
>   	 * target() callbacks
> @@ -209,9 +220,12 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>   	mutex_unlock(&df->devfreq->lock);
>   }
> 
> -void msm_devfreq_idle(struct msm_gpu *gpu)
> +
> +static void msm_devfreq_idle_work(struct kthread_work *work)
>   {
> -	struct msm_gpu_devfreq *df = &gpu->devfreq;
> +	struct msm_gpu_devfreq *df = container_of(work,
> +			struct msm_gpu_devfreq, idle_work.work);
> +	struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
>   	unsigned long idle_freq, target_freq = 0;
> 
>   	/*
> @@ -229,3 +243,11 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> 
>   	mutex_unlock(&df->devfreq->lock);
>   }
> +
> +void msm_devfreq_idle(struct msm_gpu *gpu)
> +{
> +	struct msm_gpu_devfreq *df = &gpu->devfreq;
> +
> +	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> +			       HRTIMER_MODE_ABS);
> +}
> --
> 2.31.1
> 

Hi Rob,

I tested this patch on the OnePlus 6, with it I'm still able to reproduce the crash introduced by
("drm/msm: Devfreq tuning").

Adjusting the delay from 1ms to 5ms seems to help, at least from some very basic testing.

Perhaps the increased power reliability of the external power supply on dev boards is helping to mask the issue (hence 
why it's harder to reproduce on db845c).

-- 
Kind Regards,
Caleb (they/them)
