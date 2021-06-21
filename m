Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405E3AE9D9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD1C6E090;
	Mon, 21 Jun 2021 13:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9914D6E081;
 Mon, 21 Jun 2021 13:14:58 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gn32so1325486ejc.2;
 Mon, 21 Jun 2021 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=g9KkfTDVm23JtZIvLIP9VLFqfjPUY5iB/GbhgG8cLMM=;
 b=vTy8A+9nafnuDunjIDd4Kw5i54e18ysZG8ACwZUsHC3jhZQ5ykmqodZANlff/9K/l5
 xHhB0j621x7dOKN0Js5v6xmOR+9bGcKIzX1sMSHtdYntVzjJTDTq0b2h8d/tKdYf7Gvo
 k7F3zfdIojg1Pok3rAfeh3wNfoluqLAIL5V+mz0QCAO2VUfdzsxgqA+KsI1OSsWJuPqD
 rHVp1803xMdQIOgP93s94eLvEq4dUTZzjmFj/LzxNr8OpSrqJXFyQx0kLafAyvh9MDt5
 XNOzTKXk4cMGy32mArPZljWNUMxkZTOEPfSZIdmH35JOjaGXmEAhTGONM/gAc50yWADx
 1UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=g9KkfTDVm23JtZIvLIP9VLFqfjPUY5iB/GbhgG8cLMM=;
 b=VVt6riBqpbDxBWEtqyO//k2+fIIluQN5KMfkB/p9MwiopwHaYL87EmEyWD/QA50XOd
 9471KepBjeZAOkuIkjri9WCvqmQt5MWHvK9ep3SBk/y3K2PXyH92vBeLpg1HKpYPyZoB
 dNiIKrsTmk4GkcqlRfBiQRgVLMDTS30P2yrEzFUfC3IeKoHHZpcvDt7JzfpT27jdKCXU
 GBZjzfVaepigGaVHnHwTuILDfk1mxUp8bHPqV+aWc9aDknLCT4d+RiujIwq+EAwxblw6
 moKOQz5lcWUeHn00yP8RAWC7+NuUmK7xNKjBFnCGDpJb5VlasrrK53949Bbt6QAE+4tO
 W70Q==
X-Gm-Message-State: AOAM530eXNd+TCyVf5DvUSGzkwkwKwff2mDQtMneDtm8/sL5LzF+fXGJ
 GLUdqnwu6XgTmmhjyecJHfOxqL7jpug=
X-Google-Smtp-Source: ABdhPJw7UOpkpVETkGgcEQ+88p7i7WZ6TCsGVEAzQBQYJbhzRbQ040X/+rhkp86UGkPgHVKCFhvTqg==
X-Received: by 2002:a17:906:fcad:: with SMTP id
 qw13mr7684542ejb.209.1624281297327; 
 Mon, 21 Jun 2021 06:14:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:aae5:6e05:c:d69?
 ([2a02:908:1252:fb60:aae5:6e05:c:d69])
 by smtp.gmail.com with ESMTPSA id q9sm10702070edv.31.2021.06.21.06.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 06:14:56 -0700 (PDT)
Subject: Re: [PATCH] drm/radeon: delete useless function return values &
 remove meaningless if(r) check code
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210621130508.29511-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <626348b5-a3c5-4a86-ca9f-ec41cc82044d@gmail.com>
Date: Mon, 21 Jun 2021 15:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621130508.29511-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 21.06.21 um 15:05 schrieb Bernard Zhao:
> Function radeon_fence_driver_init always returns success,
> the function type maybe coule be changed to void.
> This patch first delete the check of the return
> value of the function call radeon_fence_driver_init, then,
> optimise the function declaration and function to void type.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/cik.c          | 4 +---
>   drivers/gpu/drm/radeon/evergreen.c    | 4 +---
>   drivers/gpu/drm/radeon/ni.c           | 4 +---
>   drivers/gpu/drm/radeon/r100.c         | 4 +---
>   drivers/gpu/drm/radeon/r300.c         | 4 +---
>   drivers/gpu/drm/radeon/r420.c         | 5 +----
>   drivers/gpu/drm/radeon/r520.c         | 4 +---
>   drivers/gpu/drm/radeon/r600.c         | 4 +---
>   drivers/gpu/drm/radeon/radeon.h       | 2 +-
>   drivers/gpu/drm/radeon/radeon_fence.c | 5 +----
>   drivers/gpu/drm/radeon/rs400.c        | 4 +---
>   drivers/gpu/drm/radeon/rs600.c        | 4 +---
>   drivers/gpu/drm/radeon/rs690.c        | 4 +---
>   drivers/gpu/drm/radeon/rv515.c        | 4 +---
>   drivers/gpu/drm/radeon/rv770.c        | 4 +---
>   drivers/gpu/drm/radeon/si.c           | 4 +---
>   16 files changed, 16 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 42a8afa839cb..f6cf0b8fdd83 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -8584,9 +8584,7 @@ int cik_init(struct radeon_device *rdev)
>   	radeon_get_clock_info(rdev->ddev);
>   
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   
>   	/* initialize memory controller */
>   	r = cik_mc_init(rdev);
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
> index 8e9e88bf1f43..36a888e1b179 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -5208,9 +5208,7 @@ int evergreen_init(struct radeon_device *rdev)
>   	/* Initialize clocks */
>   	radeon_get_clock_info(rdev->ddev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* initialize AGP */
>   	if (rdev->flags & RADEON_IS_AGP) {
>   		r = radeon_agp_init(rdev);
> diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
> index ab7bd3080217..4a364ca7a1be 100644
> --- a/drivers/gpu/drm/radeon/ni.c
> +++ b/drivers/gpu/drm/radeon/ni.c
> @@ -2375,9 +2375,7 @@ int cayman_init(struct radeon_device *rdev)
>   	/* Initialize clocks */
>   	radeon_get_clock_info(rdev->ddev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* initialize memory controller */
>   	r = evergreen_mc_init(rdev);
>   	if (r)
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index fcfcaec25a9e..aa6800b0e198 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -4056,9 +4056,7 @@ int r100_init(struct radeon_device *rdev)
>   	/* initialize VRAM */
>   	r100_mc_init(rdev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* Memory manager */
>   	r = radeon_bo_init(rdev);
>   	if (r)
> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
> index 92643dfdd8a8..621ff174dff3 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -1549,9 +1549,7 @@ int r300_init(struct radeon_device *rdev)
>   	/* initialize memory controller */
>   	r300_mc_init(rdev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* Memory manager */
>   	r = radeon_bo_init(rdev);
>   	if (r)
> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
> index 1ed4407b91aa..7e6320e8c6a0 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -425,10 +425,7 @@ int r420_init(struct radeon_device *rdev)
>   	r300_mc_init(rdev);
>   	r420_debugfs(rdev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r) {
> -		return r;
> -	}
> +	radeon_fence_driver_init(rdev);
>   	/* Memory manager */
>   	r = radeon_bo_init(rdev);
>   	if (r) {
> diff --git a/drivers/gpu/drm/radeon/r520.c b/drivers/gpu/drm/radeon/r520.c
> index fc78e64ae727..6cbcaa845192 100644
> --- a/drivers/gpu/drm/radeon/r520.c
> +++ b/drivers/gpu/drm/radeon/r520.c
> @@ -299,9 +299,7 @@ int r520_init(struct radeon_device *rdev)
>   	r520_mc_init(rdev);
>   	rv515_debugfs(rdev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* Memory manager */
>   	r = radeon_bo_init(rdev);
>   	if (r)
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> index 7444dc0e0c0e..ca3fcae2adb5 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -3282,9 +3282,7 @@ int r600_init(struct radeon_device *rdev)
>   	/* Initialize clocks */
>   	radeon_get_clock_info(rdev->ddev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	if (rdev->flags & RADEON_IS_AGP) {
>   		r = radeon_agp_init(rdev);
>   		if (r)
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 56ed5634cebe..8a15f490a390 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -384,7 +384,7 @@ struct radeon_fence {
>   };
>   
>   int radeon_fence_driver_start_ring(struct radeon_device *rdev, int ring);
> -int radeon_fence_driver_init(struct radeon_device *rdev);
> +void radeon_fence_driver_init(struct radeon_device *rdev);
>   void radeon_fence_driver_fini(struct radeon_device *rdev);
>   void radeon_fence_driver_force_completion(struct radeon_device *rdev, int ring);
>   int radeon_fence_emit(struct radeon_device *rdev, struct radeon_fence **fence, int ring);
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
> index 0d8ef2368adf..b2ce642ca4fa 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -905,9 +905,8 @@ static void radeon_fence_driver_init_ring(struct radeon_device *rdev, int ring)
>    * Not all asics have all rings, so each asic will only
>    * start the fence driver on the rings it has using
>    * radeon_fence_driver_start_ring().
> - * Returns 0 for success.
>    */
> -int radeon_fence_driver_init(struct radeon_device *rdev)
> +void radeon_fence_driver_init(struct radeon_device *rdev)
>   {
>   	int ring;
>   
> @@ -917,8 +916,6 @@ int radeon_fence_driver_init(struct radeon_device *rdev)
>   	}
>   
>   	radeon_debugfs_fence_init(rdev);
> -
> -	return 0;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
> index 8423bcc3302b..6383f7a34bd8 100644
> --- a/drivers/gpu/drm/radeon/rs400.c
> +++ b/drivers/gpu/drm/radeon/rs400.c
> @@ -555,9 +555,7 @@ int rs400_init(struct radeon_device *rdev)
>   	/* initialize memory controller */
>   	rs400_mc_init(rdev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* Memory manager */
>   	r = radeon_bo_init(rdev);
>   	if (r)
> diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
> index 5bf26058eec0..b2d22e25eee1 100644
> --- a/drivers/gpu/drm/radeon/rs600.c
> +++ b/drivers/gpu/drm/radeon/rs600.c
> @@ -1132,9 +1132,7 @@ int rs600_init(struct radeon_device *rdev)
>   	rs600_mc_init(rdev);
>   	r100_debugfs_rbbm_init(rdev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* Memory manager */
>   	r = radeon_bo_init(rdev);
>   	if (r)
> diff --git a/drivers/gpu/drm/radeon/rs690.c b/drivers/gpu/drm/radeon/rs690.c
> index 7bc302a89232..14fb0819b8c1 100644
> --- a/drivers/gpu/drm/radeon/rs690.c
> +++ b/drivers/gpu/drm/radeon/rs690.c
> @@ -850,9 +850,7 @@ int rs690_init(struct radeon_device *rdev)
>   	rs690_mc_init(rdev);
>   	rv515_debugfs(rdev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* Memory manager */
>   	r = radeon_bo_init(rdev);
>   	if (r)
> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
> index 46a53dd38079..63fb06e8e2d7 100644
> --- a/drivers/gpu/drm/radeon/rv515.c
> +++ b/drivers/gpu/drm/radeon/rv515.c
> @@ -648,9 +648,7 @@ int rv515_init(struct radeon_device *rdev)
>   	rv515_mc_init(rdev);
>   	rv515_debugfs(rdev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* Memory manager */
>   	r = radeon_bo_init(rdev);
>   	if (r)
> diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
> index 88e29ebaad46..74499307285b 100644
> --- a/drivers/gpu/drm/radeon/rv770.c
> +++ b/drivers/gpu/drm/radeon/rv770.c
> @@ -1941,9 +1941,7 @@ int rv770_init(struct radeon_device *rdev)
>   	/* Initialize clocks */
>   	radeon_get_clock_info(rdev->ddev);
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   	/* initialize AGP */
>   	if (rdev->flags & RADEON_IS_AGP) {
>   		r = radeon_agp_init(rdev);
> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> index d0e94b10e4c0..013e44ed0f39 100644
> --- a/drivers/gpu/drm/radeon/si.c
> +++ b/drivers/gpu/drm/radeon/si.c
> @@ -6857,9 +6857,7 @@ int si_init(struct radeon_device *rdev)
>   	radeon_get_clock_info(rdev->ddev);
>   
>   	/* Fence driver */
> -	r = radeon_fence_driver_init(rdev);
> -	if (r)
> -		return r;
> +	radeon_fence_driver_init(rdev);
>   
>   	/* initialize memory controller */
>   	r = si_mc_init(rdev);

