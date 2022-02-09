Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBFD4AEB83
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E76210E42D;
	Wed,  9 Feb 2022 07:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7648710E41F;
 Wed,  9 Feb 2022 07:53:37 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id e7so782250ejn.13;
 Tue, 08 Feb 2022 23:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BaKOJvVfR232M/EG6IKG/02OcNcoREBRhFeRshFQaZ0=;
 b=CD2PY3fBTANpnM894RlfHd6fKm2Y/pEeU7nH6Ciq7GQHboWc50O3pYkIvbNKWAGBGk
 wxF4p+0LDOg2tqM5OFSNgaty+Ft3JcL363FKAwDg0qTlCe9O0W99/sGUgNzi6mTNWBR7
 F5Py7CoLv8YCafDyjTqYh9ZXujHZD28udWF5V5kf4DsrZ2cLiMhcu0qlmJ7OJ3RZbJap
 Q1FczXfpqTZwbWVxA8EeUcVyvwINJbRmz9JO3fxNBGTE9oJ4yOCvDrSubJ3wW8iiy2om
 9Zz9BmQv7OvyjH7i0fHZE4Fmu9n0rpPB2xU/iq+haOu8qhFHfTWEHgSr6o3wuAP/uve4
 SuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BaKOJvVfR232M/EG6IKG/02OcNcoREBRhFeRshFQaZ0=;
 b=BPtqb/AlkB+tVhLJO1H6vwB1UYTxT7IUgcrgy8k4EHVn1SnsFvRNIGM13Gur8a8MGu
 lhlqiXNZfEYznliydzOoszkJX1PQDVwXkhmvJ3oCQMQMqhd+twseh9zSyyQKnGOfIYE7
 EFuLIpEenP8z0SiwNTGXcwX9gefLHNxqs7rEgFD/bFAOMUGaZSxQaErRiBqbDJ1PUOVn
 MihQey1JXdXbjhWlGlvLP6B1VkeZynB3KDykWauAGJVC+OBGhDBUVqj47tmR+HSL0HWH
 udRN7m0SbGBNzDc3ZrkrupbBKMdNygzTV6hwkYfYd2sPQpPqe3kEQeJRrtfVx2jJ69Ny
 wadw==
X-Gm-Message-State: AOAM530TafUWuCoeBZ4ExryY0jCpxlIgzaBLjAFhTls+YoAlRXcj8uMW
 AWw/iGpgwkOEIzMj54y2FUVff9BB6Kc=
X-Google-Smtp-Source: ABdhPJwQXf89TSJLucsthAAgHw2EcZlpkRHTT/2Yje5qZy6XvM2yAjPv6evpgjcpWugbo7iJevzb0A==
X-Received: by 2002:a17:906:6702:: with SMTP id
 a2mr844684ejp.383.1644393215654; 
 Tue, 08 Feb 2022 23:53:35 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa?
 ([2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa])
 by smtp.gmail.com with ESMTPSA id j19sm5683273ejm.111.2022.02.08.23.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 23:53:35 -0800 (PST)
Message-ID: <d82ac1a0-d81d-9861-fc1b-8cc06017a2b5@gmail.com>
Date: Wed, 9 Feb 2022 08:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is
 ready
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-3-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220209002320.6077-3-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
> Before we initialize schedulers we must know which reset
> domain are we in - for single device there iis a single
> domain per device and so single wq per device. For XGMI
> the reset domain spans the entire XGMI hive and so the
> reset wq is per hive.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

One more comment below, with that fixed Reviewed-by: Christian König 
<christian.koenig@amd.com>.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>   3 files changed, 51 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 9704b0e1fd82..00123b0013d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
>   	return r;
>   }
>   
> +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> +{
> +	long timeout;
> +	int r, i;
> +
> +	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> +		struct amdgpu_ring *ring = adev->rings[i];
> +
> +		/* No need to setup the GPU scheduler for rings that don't need it */
> +		if (!ring || ring->no_scheduler)
> +			continue;
> +
> +		switch (ring->funcs->type) {
> +		case AMDGPU_RING_TYPE_GFX:
> +			timeout = adev->gfx_timeout;
> +			break;
> +		case AMDGPU_RING_TYPE_COMPUTE:
> +			timeout = adev->compute_timeout;
> +			break;
> +		case AMDGPU_RING_TYPE_SDMA:
> +			timeout = adev->sdma_timeout;
> +			break;
> +		default:
> +			timeout = adev->video_timeout;
> +			break;
> +		}
> +
> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +				   ring->num_hw_submission, amdgpu_job_hang_limit,
> +				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
> +		if (r) {
> +			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> +				  ring->name);
> +			return r;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +
>   /**
>    * amdgpu_device_ip_init - run init for hardware IPs
>    *
> @@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>   		}
>   	}
>   
> +	r = amdgpu_device_init_schedulers(adev);
> +	if (r)
> +		goto init_failed;
> +
>   	/* Don't init kfd if whole hive need to be reset during init */
>   	if (!adev->gmc.xgmi.pending_reset)
>   		amdgpu_amdkfd_device_init(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 45977a72b5dd..fa302540c69a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   				  atomic_t *sched_score)
>   {
>   	struct amdgpu_device *adev = ring->adev;
> -	long timeout;
> -	int r;
>   
>   	if (!adev)
>   		return -EINVAL;
> @@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   	spin_lock_init(&ring->fence_drv.lock);
>   	ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
>   					 GFP_KERNEL);
> -	if (!ring->fence_drv.fences)
> -		return -ENOMEM;
>   
> -	/* No need to setup the GPU scheduler for rings that don't need it */
> -	if (ring->no_scheduler)
> -		return 0;
> +	ring->num_hw_submission = num_hw_submission;
> +	ring->sched_score = sched_score;

Let's move this into the caller and then use ring->num_hw_submission in 
the fence code as well.

The maximum number of jobs on the ring is not really fence specific.

Regards,
Christian.

>   
> -	switch (ring->funcs->type) {
> -	case AMDGPU_RING_TYPE_GFX:
> -		timeout = adev->gfx_timeout;
> -		break;
> -	case AMDGPU_RING_TYPE_COMPUTE:
> -		timeout = adev->compute_timeout;
> -		break;
> -	case AMDGPU_RING_TYPE_SDMA:
> -		timeout = adev->sdma_timeout;
> -		break;
> -	default:
> -		timeout = adev->video_timeout;
> -		break;
> -	}
> -
> -	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> -			   num_hw_submission, amdgpu_job_hang_limit,
> -			   timeout, NULL, sched_score, ring->name);
> -	if (r) {
> -		DRM_ERROR("Failed to create scheduler on ring %s.\n",
> -			  ring->name);
> -		return r;
> -	}
> +	if (!ring->fence_drv.fences)
> +		return -ENOMEM;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index fae7d185ad0d..7f20ce73a243 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -251,6 +251,8 @@ struct amdgpu_ring {
>   	bool			has_compute_vm_bug;
>   	bool			no_scheduler;
>   	int			hw_prio;
> +	unsigned 		num_hw_submission;
> +	atomic_t		*sched_score;
>   };
>   
>   #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))

