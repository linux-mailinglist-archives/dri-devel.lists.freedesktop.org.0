Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F250F6D5199
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 21:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCCC10E55E;
	Mon,  3 Apr 2023 19:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8F10E1D4;
 Mon,  3 Apr 2023 19:51:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m2so30547494wrh.6;
 Mon, 03 Apr 2023 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680551505;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fioQNohwX9BTxlT/dtSumMlyrKJb8LsjyTFUtd1tZQY=;
 b=LMIZwM5TflokAIPaanA2n4WwgIY2V4oJl58w9gh1oJ4bn05WY6RyKQT1qK3SJmzOLN
 pSrOV/ZmUnaQldierPsDpgBmhVoIcLUesR0ns0dgPkHyyrfVVHk8q9p46QXvrVNOfVEe
 JY4yP4DzwYQF628ZZ1pN1P0rg+mIU8uCDGgOdiMc9rq0TLk0QQvVO7Vyer1woI8dUUdV
 +H6/moOHhvvgaI0suRrdk+OJEj4Uma+a6wlV28PyrBWUXNFxFescU3quPq6g065du4X2
 4oSirneO5LY8sB2EvOdFQf92zHrncCC82KRV7tUEtTgKleoWEQ6tAqz3mSBt99EVyCYo
 2I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680551505;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fioQNohwX9BTxlT/dtSumMlyrKJb8LsjyTFUtd1tZQY=;
 b=m/brb/t7WWCcLYS+Hjt4P1xKdHYjbIfwfIly/phJXzk/dKKf7GglJqDqs1qim072BT
 rPFnv11icZG24UjQ8ZiEHtiq/2ED4bl+gDjpCeixeCKEy9m3TrzJri21g82ieS+c9638
 IRHvBPiXBT+ntOfPQvivpEdO1/2Z74B08LUpmrIscpmOq87+IIcamUt+W8rv9zoRAdr7
 7k1Jp1aNAvOdxr7SJhJqUOWznCwI9j2ZMFrJ7Bq69AYrq77mLzZG8lD22w7DFg1KuCBb
 89JuP5dEnTqDFvspE1w48nkfxjIACXl93G/dZOD94RBtowzhEyX1WHC9wrNxG0wCBv0/
 m08A==
X-Gm-Message-State: AAQBX9cEXm7geNIk5Ypm50XbLwe1mFO1XHvDWhIPJmXXYcxzwkAA835s
 207vtMECdaJhg5W/dgBa+ltiNzbPD61bNg==
X-Google-Smtp-Source: AKy350b5aVRUDSJX1LfB53PFzgN81/pZ3qhaGgo7IxllMi5XkhBoMsyfNrLEQ/vu50hBFovbSTd1xQ==
X-Received: by 2002:a5d:4574:0:b0:2ca:5c9a:a548 with SMTP id
 a20-20020a5d4574000000b002ca5c9aa548mr27444248wrc.60.1680551504907; 
 Mon, 03 Apr 2023 12:51:44 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:5bee:83b9:6744:169d?
 ([2a02:908:1256:79a0:5bee:83b9:6744:169d])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003ee610d1ce9sm20589285wms.34.2023.04.03.12.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 12:51:44 -0700 (PDT)
Message-ID: <b029e8e0-f879-bc06-4605-89de70c0466c@gmail.com>
Date: Mon, 3 Apr 2023 21:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 1/4] drm/scheduler: Add DRM_SCHED_PRIORITY_VERY_HIGH
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230403194058.25958-1-joshua@froggi.es>
 <20230403194058.25958-2-joshua@froggi.es>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230403194058.25958-2-joshua@froggi.es>
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

Am 03.04.23 um 21:40 schrieb Joshua Ashton:
> This allows AMDGPU scheduler priority above normal to be expressed
> using the DRM_SCHED_PRIORITY enum.

That was rejected before, I just don't remember why exactly. Need to dig 
that up again.

Christian.

>
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
>   drivers/gpu/drm/msm/msm_gpu.h           | 2 +-
>   include/drm/gpu_scheduler.h             | 1 +
>   3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index d2139ac12159..8ec255091c4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -79,7 +79,7 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
>   		return DRM_SCHED_PRIORITY_HIGH;
>   
>   	case AMDGPU_CTX_PRIORITY_VERY_HIGH:
> -		return DRM_SCHED_PRIORITY_HIGH;
> +		return DRM_SCHED_PRIORITY_VERY_HIGH;
>   
>   	/* This should not happen as we sanitized userspace provided priority
>   	 * already, WARN if this happens.
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index fc1c0d8611a8..e3495712b236 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -336,7 +336,7 @@ struct msm_gpu_perfcntr {
>    * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
>    * cases, so we don't use it (no need for kernel generated jobs).
>    */
> -#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_VERY_HIGH - DRM_SCHED_PRIORITY_MIN)
>   
>   /**
>    * struct msm_file_private - per-drm_file context
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9935d1e2ff69..a62071660602 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -55,6 +55,7 @@ enum drm_sched_priority {
>   	DRM_SCHED_PRIORITY_MIN,
>   	DRM_SCHED_PRIORITY_NORMAL,
>   	DRM_SCHED_PRIORITY_HIGH,
> +	DRM_SCHED_PRIORITY_VERY_HIGH,
>   	DRM_SCHED_PRIORITY_KERNEL,
>   
>   	DRM_SCHED_PRIORITY_COUNT,

