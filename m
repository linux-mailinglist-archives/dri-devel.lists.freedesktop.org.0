Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD69A9ADC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8239D10E5ED;
	Tue, 22 Oct 2024 07:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="exyDNaON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A9E10E2F7;
 Tue, 22 Oct 2024 07:22:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43158625112so52036995e9.3; 
 Tue, 22 Oct 2024 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729581748; x=1730186548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1075N6EGx5cGX8UdqJNi9Z9bX7D4dEepvGzP5+3JAHo=;
 b=exyDNaONq7tprVuu/vFZCk3DVXiFKxvnhhR9c4jq8CaicFyInpQ+u2uHpXVirb2JG3
 rpUEQLq5JoOj9ep+Nz3/CRqqUiwXbL4p5IH+ehYiW9QPtnvuL0aW/I7S8bozd/9DgPwa
 tDuo8iuPlflSLcLaddexWp5M1AFSM8Qepl+dtmqgDKly929y2xec8iH2RQOcWeGblpkG
 GdhIxWW+JHLectNEqnbKi8WXrsT1r36dSnCv87/TLi6dKJSdN4CCBnx14Q5XCJvDwrmu
 ld+yqqGHdQO56roXoF0acBhSDecpDh5RC6bXp+CqsFlF6vsjxsHaNaMJfOX8UZHBUOpA
 igDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729581748; x=1730186548;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1075N6EGx5cGX8UdqJNi9Z9bX7D4dEepvGzP5+3JAHo=;
 b=LpqCmLCFevoGpCT/Hpy+m5AGxj8F+fkXmhH0TFP7mZt0vlTpyZLQCdWAOMmzVDkJ76
 k7zsfl6aGfVmslZYu9pLNF+NQvSA9cmOEWFk1EEynk8Dd0Kp1mO3h+1B/k/kH7pL9mDt
 lsUi1r0QO39dks6k3yzyn/wNkuGngAfg21z53/NmWzDWiCqiXtMqDqTsIwdAjTINeXH0
 R+6WCfE20bkcSGacAQe1RltNQug/zJY3mtfOGEEa0b8NPuTAuhuNfykSUR1fn9e6/D/g
 OZeu2ohWOzQIdUesfy/FZ1yBlfBPC5dzvn+C9+iWwFwzyoglUP0K3iOkYcPhGmqQSohi
 BxsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSSMFnNjLHFniK6Yo+4aWH1TanZQtKmGG+D0Eu+wwv+78qQpVVH+vS13gnsKXwH/VdSnB4h98M@lists.freedesktop.org,
 AJvYcCVmYND1v2s2WjiINvnvnV2HQnJgM5kI9OUqxkaB4vT7YzGF/8iVCjHcQ3cHtIy6LP1Srf3MqBldujXQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOM1psS1OZ3uJQyl8/l24WEEPw+VWughRPsq72vdaKVE3hvl8M
 f0jH1+Niwq3RCSZsKV/f/R99xVi166+IWcdPveaemepW1N4h/l3w
X-Google-Smtp-Source: AGHT+IHSDQDm0RPzCuK6NQX7aqtIGn9s0fQItFGjye0NsjqXxWPXpWVpcXApKAKvoZZ6/krwMTa9yg==
X-Received: by 2002:a05:600c:674a:b0:431:54f3:11af with SMTP id
 5b1f17b1804b1-431616ad566mr99508045e9.31.1729581748242; 
 Tue, 22 Oct 2024 00:22:28 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57fbe8sm78462885e9.18.2024.10.22.00.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 00:22:27 -0700 (PDT)
Message-ID: <06fec703-4e0b-475e-84cd-c7a270deec82@gmail.com>
Date: Tue, 22 Oct 2024 09:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/amdgpu: stop tracking visible memory stats
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, christian.koenig@amd.com,
 tvrtko.ursulin@igalia.com
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-4-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20241018133308.889-4-Yunxiang.Li@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.10.24 um 15:33 schrieb Yunxiang Li:
> Since on modern systems all of vram can be made visible anyways, to
> simplify the new implementation, drops tracking how much memory is
> visible for now. If this is really needed we can add it back on top of
> the new implementation, or just report all the BOs as visible.
>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  6 ------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 10 ----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h     | 11 ++++++++++-
>   4 files changed, 12 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 8281dd45faaa0..7a9573958d87c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -103,16 +103,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   		   stats[TTM_PL_SYSTEM].drm.resident/1024UL);
>   
>   	/* Amdgpu specific memory accounting keys: */
> -	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
> -		   stats[TTM_PL_VRAM].visible/1024UL);
>   	drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
>   		   stats[TTM_PL_VRAM].evicted/1024UL);
> -	drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
> -		   stats[TTM_PL_VRAM].evicted_visible/1024UL);
>   	drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
>   		   stats[TTM_PL_VRAM].requested/1024UL);
> -	drm_printf(p, "amd-requested-visible-vram:\t%llu KiB\n",
> -		   stats[TTM_PL_VRAM].requested_visible/1024UL);
>   	drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
>   		   stats[TTM_PL_TT].requested/1024UL);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 2a53e72f3964f..2436b7c9ad12b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -40,6 +40,7 @@
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
>   #include "amdgpu_vram_mgr.h"
> +#include "amdgpu_vm.h"
>   
>   /**
>    * DOC: amdgpu_object
> @@ -1235,23 +1236,14 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>   			stats[type].drm.active += size;
>   		else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
>   			stats[type].drm.purgeable += size;
> -
> -		if (type == TTM_PL_VRAM && amdgpu_res_cpu_visible(adev, res))
> -			stats[type].visible += size;
>   	}
>   
>   	/* amdgpu specific stats: */
>   
>   	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
>   		stats[TTM_PL_VRAM].requested += size;
> -		if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
> -			stats[TTM_PL_VRAM].requested_visible += size;
> -
> -		if (type != TTM_PL_VRAM) {
> +		if (type != TTM_PL_VRAM)
>   			stats[TTM_PL_VRAM].evicted += size;
> -			if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
> -				stats[TTM_PL_VRAM].evicted_visible += size;
> -		}
>   	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
>   		stats[TTM_PL_TT].requested += size;
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index a5653f474f85c..be6769852ece4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -139,16 +139,6 @@ struct amdgpu_bo_vm {
>   	struct amdgpu_vm_bo_base        entries[];
>   };
>   
> -struct amdgpu_mem_stats {
> -	struct drm_memory_stats drm;
> -
> -	uint64_t visible;
> -	uint64_t evicted;
> -	uint64_t evicted_visible;
> -	uint64_t requested;
> -	uint64_t requested_visible;
> -};
> -
>   static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
>   {
>   	return container_of(tbo, struct amdgpu_bo, tbo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 428f7379bd759..6a1b344e15e1b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -42,7 +42,6 @@ struct amdgpu_bo_va;
>   struct amdgpu_job;
>   struct amdgpu_bo_list_entry;
>   struct amdgpu_bo_vm;
> -struct amdgpu_mem_stats;
>   
>   /*
>    * GPUVM handling
> @@ -322,6 +321,16 @@ struct amdgpu_vm_fault_info {
>   	unsigned int	vmhub;
>   };
>   
> +struct amdgpu_mem_stats {
> +	struct drm_memory_stats drm;
> +
> +	/* buffers that requested this placement */
> +	uint64_t requested;
> +	/* buffers that requested this placement
> +	 * but are currently evicted */
> +	uint64_t evicted;
> +};
> +
>   struct amdgpu_vm {
>   	/* tree of virtual addresses mapped */
>   	struct rb_root_cached	va;

