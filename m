Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533984AEBA1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3D610E4A0;
	Wed,  9 Feb 2022 08:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC9710E4A0;
 Wed,  9 Feb 2022 08:00:19 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id m4so4821090ejb.9;
 Wed, 09 Feb 2022 00:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vinR2HCyGMHNEUr7hl7CiUKxbKR9Ukw8NA+qwieOOYI=;
 b=T5X5+n7/is5bsD13NBeR+YBoJ2NvWl/z0u8p3dFaV401zL7AIpd7s8bdpqXcH9jOSQ
 BAYCJ6wOGOGiIVn+UejwAF/rysDVD+a6otJtoA/JRch/tlfI94A5TxFy5Sblx5DYeLwo
 vMPVR0GaWv8QF8mHp6R+nrDLe4dEa0z4jPM0Tvi+xM01EDsr5q/GYbY8xbUWIn30GJS5
 zoKnAMbYZbeA/X0tGeuQKReKZFgbtQ6jCE+WOmMG9EIoEYsh9KpxYUVBRjgxbdcl0mtg
 q/xVxAryiusTL9L4s/gU1WaxhlEx4xSZJHidb76wXK1EhaDHS/55c3rjwmIVKxgOJCT8
 HArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vinR2HCyGMHNEUr7hl7CiUKxbKR9Ukw8NA+qwieOOYI=;
 b=iMVf/aM53gPK2H9ZPjHbAySLu1yYPxrigtdF4X8hAy8hCY998xQzwGVWCoMTUy5rd4
 YTUKUeksjK61iLetrrGWY/5elBkjImkis4l7rNBb0FGAGfRvp+EYS6rLc6BNTUhuabiO
 zTd/18eqr3E+aqjDIAiaAa0gH7M/HJGrAaEv+/6VI0kUb+iVk5CSnwAur/FVhqa80IP2
 xvSazyzRQzD7sgFW7B8OkEufrPMItFBFclccYWB8jiklnczdzNixIJu3Ob9TdEj3gKOO
 ajNgO1f+gg3HSD5xeBazc4nDDHQaZs3eSqKluI1w07M9SRHnSE+GrXPvtkpL6NNwqlaw
 PMzQ==
X-Gm-Message-State: AOAM530S+opcVbsD7jxkzJWWfy9cC2/UbpqokSicoYPilzGUDC+byEWM
 m4Miu3tvI9UQfFyKRpjyjRSdL5zrfrc=
X-Google-Smtp-Source: ABdhPJxkOPfl3aApbxyRAeG/tQJ9UcvII7MixWm+0rHLjHXP0XgFEtbtAnSBBG140TI1qILiqAHZvA==
X-Received: by 2002:a17:907:7f87:: with SMTP id
 qk7mr861148ejc.746.1644393618234; 
 Wed, 09 Feb 2022 00:00:18 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa?
 ([2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa])
 by smtp.gmail.com with ESMTPSA id p6sm1774373ejf.11.2022.02.09.00.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 00:00:17 -0800 (PST)
Message-ID: <e3731afc-60d9-8709-179c-d919b782603f@gmail.com>
Date: Wed, 9 Feb 2022 09:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 09/11] drm/amdgpu: Move in_gpu_reset into reset_domain
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-10-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220209002320.6077-10-andrey.grodzovsky@amd.com>
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
> We should have a single instance per entrire reset domain.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Suggested-by: Lijo Lazar <lijo.lazar@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 ++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  |  1 +
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 ++--
>   6 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index ddfbcc8fd3d3..b89406b01694 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1056,7 +1056,6 @@ struct amdgpu_device {
>   	bool				in_s4;
>   	bool				in_s0ix;
>   
> -	atomic_t 			in_gpu_reset;
>   	enum pp_mp1_state               mp1_state;
>   	struct amdgpu_doorbell_index doorbell_index;
>   
> @@ -1463,8 +1462,6 @@ static inline bool amdgpu_is_tmz(struct amdgpu_device *adev)
>          return adev->gmc.tmz_enabled;
>   }
>   
> -static inline int amdgpu_in_reset(struct amdgpu_device *adev)
> -{
> -	return atomic_read(&adev->in_gpu_reset);
> -}
> +int amdgpu_in_reset(struct amdgpu_device *adev);
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index dcbb175d336f..e05d7cbefd2c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3554,7 +3554,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	mutex_init(&adev->mn_lock);
>   	mutex_init(&adev->virt.vf_errors.lock);
>   	hash_init(adev->mn_hash);
> -	atomic_set(&adev->in_gpu_reset, 0);
>   	mutex_init(&adev->psp.mutex);
>   	mutex_init(&adev->notifier_lock);
>   
> @@ -4829,7 +4828,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
>   				struct amdgpu_hive_info *hive)
>   {
> -	atomic_set(&adev->in_gpu_reset, 1);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
>   
>   	if (hive) {
>   		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
> @@ -4854,7 +4853,7 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
>   {
>   	amdgpu_vf_error_trans_all(adev);
>   	adev->mp1_state = PP_MP1_STATE_NONE;
> -	atomic_set(&adev->in_gpu_reset, 0);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
>   	up_write(&adev->reset_domain->sem);
>   }
>   
> @@ -5699,6 +5698,11 @@ void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
>   	amdgpu_asic_invalidate_hdp(adev, ring);
>   }
>   
> +int amdgpu_in_reset(struct amdgpu_device *adev)
> +{
> +	return atomic_read(&adev->reset_domain->in_gpu_reset);
> +	}
> +	
>   /**
>    * amdgpu_device_halt() - bring hardware to some kind of halt state
>    *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index c0988c804459..5ab72c3bfbda 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -131,6 +131,7 @@ struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_d
>   
>   	}
>   
> +	atomic_set(&reset_domain->in_gpu_reset, 0);
>   	init_rwsem(&reset_domain->sem);
>   
>   	return reset_domain;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 80f918e87d4f..ea6fc98ea927 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -81,6 +81,7 @@ struct amdgpu_reset_domain {
>   	struct workqueue_struct *wq;
>   	enum amdgpu_reset_domain_type type;
>   	struct rw_semaphore sem;
> +	atomic_t in_gpu_reset;
>   };
>   
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index 4e23c29e665c..b81acf59870c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -259,7 +259,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   	 * otherwise the mailbox msg will be ruined/reseted by
>   	 * the VF FLR.
>   	 */
> -	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
> +	if (atomic_cmpxchg(&adev->reset_domain->in_gpu_reset, 0, 1) != 0)
>   		return;
>   
>   	down_write(&adev->reset_domain->sem);
> @@ -277,7 +277,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   	} while (timeout > 1);
>   
>   flr_done:
> -	atomic_set(&adev->in_gpu_reset, 0);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
>   	up_write(&adev->reset_domain->sem);
>   
>   	/* Trigger recovery for world switch failure if no TDR */
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index f715780f7d20..22c10b97ea81 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -283,7 +283,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   	 * otherwise the mailbox msg will be ruined/reseted by
>   	 * the VF FLR.
>   	 */
> -	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
> +	if (atomic_cmpxchg(&adev->reset_domain->in_gpu_reset, 0, 1) != 0)
>   		return;
>   
>   	down_write(&adev->reset_domain->sem);
> @@ -301,7 +301,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   	} while (timeout > 1);
>   
>   flr_done:
> -	atomic_set(&adev->in_gpu_reset, 0);
> +	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
>   	up_write(&adev->reset_domain->sem);
>   
>   	/* Trigger recovery for world switch failure if no TDR */

