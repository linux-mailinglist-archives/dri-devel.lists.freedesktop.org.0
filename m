Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D178E370EDB
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 21:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5576E542;
	Sun,  2 May 2021 19:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ABF6E54C
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 19:52:50 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id v13so2359395ilj.8
 for <dri-devel@lists.freedesktop.org>; Sun, 02 May 2021 12:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aGTpjxsB+P65e28HouM+aoaAt8t9TY+h64KoNoOcS7I=;
 b=b0ysKT0ky7gQtDEEutMGvqaR3PR690az+EfxOgNKUGRLfzHBN/Y6V8q8se3XlFUo7m
 EKDsM3m3I0V6lnh6MQbcBUaHAIPPNeggnY5+rtQIqMpwWyxNnHd0Mjk41pYkOsdGWDBK
 F/Y/Z1ttSX66kAi+SIkW3rn1VviDZeXj0f5OfgMcK+VfU+UmxzfQciN9X+YlBQ/7gWOo
 YpNcRIaoJJeUfGJ0w7OTdjbaFMdYTf+4LcudIBCyy4UjcH95s9Dwg0EQgl7egxYDzxRD
 xzt5l37dPA9pbhzQfRWgsVf85u5lhlJx6rGSsNv6xnwVOGENa0y7ByCHzS9mIUoUdr5/
 caMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aGTpjxsB+P65e28HouM+aoaAt8t9TY+h64KoNoOcS7I=;
 b=YtGsDx1QjrtI/noNht+FguaXY7P5v8LugzLL8iB4wVq7oI8ujcUGXxoGY+ac9drYAT
 K3VvrICrOVO23l9aGJDqCqJ35RoLC5TEV5lcgzDsyIOrwbTwiBf5DnR16KuwErA54M6S
 Y+TIupnjqXboMdjdIiMUPxRgtlR3+PLFjt40lwCQeZ0oNRAiPgIwisNKJnPEz5CmPBx+
 sSiD/v6BnTUrMxCpUUooK2GCoOHhewdk6X0X+je49QYBGc5CPEU7TxoQlPVtvUpolkcI
 Qj5mmNd0KQeicdmXJ4NWNHOgpZsmou3i2lagmMCqW5Te2zvTUGIhcdJdW/kSSu0WMgwc
 9oIA==
X-Gm-Message-State: AOAM53112Nvu1baUlfNY2E3E/akf0lA/pT0wYzqdhYoDB9s+J6cR4pRq
 9tHVnF0aPg855K5zL594rrIzxQ==
X-Google-Smtp-Source: ABdhPJzn7QUYkX8E7Cn9wDHl0mWHpPRJCkZiDqHuf1EUVm+rmO/hmo8xqFUIjuIlMJMyP+7/nx5NIQ==
X-Received: by 2002:a92:1a0a:: with SMTP id a10mr13260023ila.195.1619985169640; 
 Sun, 02 May 2021 12:52:49 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id d17sm1422478ilr.81.2021.05.02.12.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 12:52:49 -0700 (PDT)
Date: Sun, 2 May 2021 13:52:46 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/5] drm/msm: replace MSM_BO_UNCACHED with MSM_BO_WC for
 internal objects
Message-ID: <20210502195246.ghx5hm3fksnjonw5@cosmicpenguin.net>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Eric Anholt <eric@anholt.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Lee Jones <lee.jones@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Dave Airlie <airlied@redhat.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bernard Zhao <bernard@vivo.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210423190833.25319-1-jonathan@marek.ca>
 <20210423190833.25319-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423190833.25319-3-jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Emil Velikov <emil.velikov@collabora.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Bernard Zhao <bernard@vivo.com>, Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Sean Paul <sean@poorly.run>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 03:08:18PM -0400, Jonathan Marek wrote:
> msm_gem_get_vaddr() currently always maps as writecombine, so use the right
> flag instead of relying on broken behavior (things don't actually work if
> they are mapped as uncached).

Ugh - I can't believe this was stil in there.

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 4 ++--
>  drivers/gpu/drm/msm/adreno/a5xx_power.c     | 2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c   | 4 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     | 2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c          | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index ce13d49e615b..eb0f884eaf30 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -902,7 +902,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  		if (!a5xx_gpu->shadow_bo) {
>  			a5xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>  				sizeof(u32) * gpu->nr_rings,
> -				MSM_BO_UNCACHED | MSM_BO_MAP_PRIV,
> +				MSM_BO_WC | MSM_BO_MAP_PRIV,
>  				gpu->aspace, &a5xx_gpu->shadow_bo,
>  				&a5xx_gpu->shadow_iova);
>  
> @@ -1407,7 +1407,7 @@ static int a5xx_crashdumper_init(struct msm_gpu *gpu,
>  		struct a5xx_crashdumper *dumper)
>  {
>  	dumper->ptr = msm_gem_kernel_new_locked(gpu->dev,
> -		SZ_1M, MSM_BO_UNCACHED, gpu->aspace,
> +		SZ_1M, MSM_BO_WC, gpu->aspace,
>  		&dumper->bo, &dumper->iova);
>  
>  	if (!IS_ERR(dumper->ptr))
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> index c35b06b46fcc..cdb165236a88 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> @@ -363,7 +363,7 @@ void a5xx_gpmu_ucode_init(struct msm_gpu *gpu)
>  	bosize = (cmds_size + (cmds_size / TYPE4_MAX_PAYLOAD) + 1) << 2;
>  
>  	ptr = msm_gem_kernel_new_locked(drm, bosize,
> -		MSM_BO_UNCACHED | MSM_BO_GPU_READONLY, gpu->aspace,
> +		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace,
>  		&a5xx_gpu->gpmu_bo, &a5xx_gpu->gpmu_iova);
>  	if (IS_ERR(ptr))
>  		return;
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index 42eaef7ad7c7..ee72510ff8ce 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -230,7 +230,7 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
>  
>  	ptr = msm_gem_kernel_new(gpu->dev,
>  		A5XX_PREEMPT_RECORD_SIZE + A5XX_PREEMPT_COUNTER_SIZE,
> -		MSM_BO_UNCACHED | MSM_BO_MAP_PRIV, gpu->aspace, &bo, &iova);
> +		MSM_BO_WC | MSM_BO_MAP_PRIV, gpu->aspace, &bo, &iova);
>  
>  	if (IS_ERR(ptr))
>  		return PTR_ERR(ptr);
> @@ -238,7 +238,7 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
>  	/* The buffer to store counters needs to be unprivileged */
>  	counters = msm_gem_kernel_new(gpu->dev,
>  		A5XX_PREEMPT_COUNTER_SIZE,
> -		MSM_BO_UNCACHED, gpu->aspace, &counters_bo, &counters_iova);
> +		MSM_BO_WC, gpu->aspace, &counters_bo, &counters_iova);
>  	if (IS_ERR(counters)) {
>  		msm_gem_kernel_put(bo, gpu->aspace, true);
>  		return PTR_ERR(counters);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5214a15db95f..1716984c68a8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -852,7 +852,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  		if (!a6xx_gpu->shadow_bo) {
>  			a6xx_gpu->shadow = msm_gem_kernel_new_locked(gpu->dev,
>  				sizeof(u32) * gpu->nr_rings,
> -				MSM_BO_UNCACHED | MSM_BO_MAP_PRIV,
> +				MSM_BO_WC | MSM_BO_MAP_PRIV,
>  				gpu->aspace, &a6xx_gpu->shadow_bo,
>  				&a6xx_gpu->shadow_iova);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index c1699b4f9a89..21c49c5b4519 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -113,7 +113,7 @@ static int a6xx_crashdumper_init(struct msm_gpu *gpu,
>  		struct a6xx_crashdumper *dumper)
>  {
>  	dumper->ptr = msm_gem_kernel_new_locked(gpu->dev,
> -		SZ_1M, MSM_BO_UNCACHED, gpu->aspace,
> +		SZ_1M, MSM_BO_WC, gpu->aspace,
>  		&dumper->bo, &dumper->iova);
>  
>  	if (!IS_ERR(dumper->ptr))
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 17f3e45fd5ff..c1332b2459ec 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -391,7 +391,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
>  	void *ptr;
>  
>  	ptr = msm_gem_kernel_new_locked(gpu->dev, fw->size - 4,
> -		MSM_BO_UNCACHED | MSM_BO_GPU_READONLY, gpu->aspace, &bo, iova);
> +		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace, &bo, iova);
>  
>  	if (IS_ERR(ptr))
>  		return ERR_CAST(ptr);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 055cd1c7c9fe..18c80744e331 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1155,7 +1155,7 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size)
>  	uint64_t iova;
>  	u8 *data;
>  
> -	data = msm_gem_kernel_new(dev, size, MSM_BO_UNCACHED,
> +	data = msm_gem_kernel_new(dev, size, MSM_BO_WC,
>  					priv->kms->aspace,
>  					&msm_host->tx_gem_obj, &iova);
>  
> -- 
> 2.26.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
