Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840B352B98
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 16:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACD56E10D;
	Fri,  2 Apr 2021 14:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AE06E0DB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 14:50:04 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id z136so5561904iof.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=l0HqcwAEcAzaa2RK+pZE6jtYY7XOgt5sS3E2spUn1Rk=;
 b=Kmgr8cnyHkBCjw6d098vCcVagqVkv5JmDU91epU9ZWO7suSGeKnYW7wRpQBgsU6Kbs
 bnC+FC9X9QMvN9rLnz4RSFfLGWy5STRsjKuf79o0DSdeBWwe22pySANiq314cu5fHMsT
 LwlwRpJetf/3zwEbAAVcYSDBorIDUqEzt963OIKC9cjeW1e5f/iuxmTORJJiwtFhByU/
 qDsDk4atEjJxiQaMqqmKjyBomzu8Vp1NXy0A/9nlO7/WGT9hnhIjfe1whBYjBBd6rWwk
 /m8hrKnQDZT8IrRWrCv5bP7k0gu0lNtpu2yRbt9WN2SqVKz1J5cqLkBPhE+aqq2HAojn
 OFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=l0HqcwAEcAzaa2RK+pZE6jtYY7XOgt5sS3E2spUn1Rk=;
 b=WVy1JhrBQcS2tIR53+hO7OyQaZS/hnwi/8LDHCoXRxOaC4ppjM/ToOi/fQ62wEvm3W
 LcagZfyA1Zs3Z3Rz9nF7/uvn1wONOSzwLl8zU3Sh0IP97SePi2IqYbjwyshjzq7KE8ox
 GtVDK/WUJOwSoOcHCaPTKypELVIW3iZHx15uj567P8riX2pBIfa51rTU+nw5iuGY9I9/
 7CBqKYV3Q3X1HvkgPuFEV9R3P+NQ+v8dTvaXXFE5rVaDw26hMuYRP/5AGtcv9RQMsQNQ
 HnuSt5zua1MXfPQtRBr0opL0+F6PM97ZTHSHR3+27uIioYzjzqLKFAp7aMlkgQN2xEWr
 STfQ==
X-Gm-Message-State: AOAM531mSXdOOmI5V2F3aqnW/bLKRI89zQIWrARB/3rSkhWdCviw5Svy
 l/96UPy+x8gr8Ux5jA3S3KA7DQ==
X-Google-Smtp-Source: ABdhPJyuvuBtNPl+yzzZ5Hm9a08vW6pett3RP0OPcCwvzWTKuV1JGe7ZTwSlG04ahbRO6oSo90Wecw==
X-Received: by 2002:a6b:e20a:: with SMTP id z10mr10979620ioc.99.1617375004119; 
 Fri, 02 Apr 2021 07:50:04 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id y15sm3987161ilv.70.2021.04.02.07.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 07:50:03 -0700 (PDT)
Date: Fri, 2 Apr 2021 08:50:01 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Fix a5xx/a6xx timestamps
Message-ID: <20210402145001.n7upxwvyub2tyavz@cosmicpenguin.net>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Eric Anholt <eric@anholt.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
References: <20210325012358.1759770-1-robdclark@gmail.com>
 <20210325012358.1759770-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325012358.1759770-2-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 06:23:52PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> They were reading a counter that was configured to ALWAYS_COUNT (ie.
> cycles that the GPU is doing something) rather than ALWAYS_ON.  This
> isn't the thing that userspace is looking for.

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index a5af223eaf50..bb82fcd9df81 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1241,8 +1241,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  
>  static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  {
> -	*value = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_CP_0_LO,
> -		REG_A5XX_RBBM_PERFCTR_CP_0_HI);
> +	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
> +		REG_A5XX_RBBM_ALWAYSON_COUNTER_HI);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 130661898546..59718c304488 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1173,8 +1173,8 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  	/* Force the GPU power on so we can read this register */
>  	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>  
> -	*value = gpu_read64(gpu, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
> -		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
> +	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> +		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
>  
>  	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>  	return 0;
> -- 
> 2.29.2
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
