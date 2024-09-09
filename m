Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F414E9716F6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463A110E37E;
	Mon,  9 Sep 2024 11:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CKPNpCqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DE810E37B;
 Mon,  9 Sep 2024 11:33:07 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so21273115e9.3; 
 Mon, 09 Sep 2024 04:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725881586; x=1726486386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1DlM5K73/93Xqq3pXsHbZNFb988cXH9S9D9zFTKzhUY=;
 b=CKPNpCqwoslUIZx6KDFc9AhsS2bPhHKAOIFqXcH889AX7ehgVdAa4MMkF8nUzdDxPj
 l13hYhyC1MmUCfFmshrNsmzlgb6UZIBAnJOolvgU1v6o3nZcuKWANkZiRoC4/ErCFNu6
 TKnQzUPnzKH6UKxf3Np8GzIdJB9TJzJ38D/4R/nS440VpQfBLXP9NFsMKuf+hYgh2Mob
 /XLRN3MPVfs8ji3BYLqb8pR49yUXZOjOUHSRn73EkubAsflV+o67qLzZungkj7s8DEbE
 YfQ5fR+h8z59W+uqOpUexjA/PuHryiPQOH4/0pmqnjrN8S99jSeh4fN57HHMLkLiVDF1
 F2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725881586; x=1726486386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1DlM5K73/93Xqq3pXsHbZNFb988cXH9S9D9zFTKzhUY=;
 b=WST5304VWqApKUDWEcaquBcWa0wr/HvKFXELXJf41fur0od3gqVmsLssvVbyia2ORK
 +1VDxbk1IsxB6jHd7k8b/hjtEssRO2dYT5s8fvNFe/L+ND7kRiEyttS4AUanAY17tAhY
 ebC72UiDpXym+STu1jNLRa6s0gSuRZuGgk4cqDBEj8oqKSY16AR8M3XCrFqTiWHsCTy+
 lAqK/tsuagidvG4S4d5Zq7YNFZWWMKfkkHfwdviwE9peP+fp4+cLIXA4wSK8GG8HUeO1
 edtaE7xhAqkNW+aQIMFRKsFz4dqvfTbHXeUQZ9E55/VYS8BpORZmgIWKJZ04uB9cqN5X
 f25A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdtbF/Q3Csbvs+RChNQ8nKiRmI0hf/c7Wa/3VGcD5xWWyCNtA7Fw7jI+oFCQ+MwBepQ7WhERqs@lists.freedesktop.org,
 AJvYcCXhg6AJbxhjEPUFO0p1sVDwc+8UilDs07yAT21hM6ndqcWxj7+uMx68obn9RD7F2gA3WO6xakT9o26j@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykp2a9m4LeW2xxZVCxjmhCT/6QE5xHBBdYTN36lo9PIe1G+54P
 qQDjrqqCmsI+i2P1cs+DbQCDQ4Mbg/C6bS70XsviO1eYQJIwoZG6
X-Google-Smtp-Source: AGHT+IFL7lxb/ox29rfL6wtx5kb8CqIE8JwV0WeUoTZ68calHjSUsYxA+SMLZEeq7bv3mK/rTaBWRQ==
X-Received: by 2002:a05:600c:3b83:b0:42c:b750:19f3 with SMTP id
 5b1f17b1804b1-42cb7501f19mr22977905e9.0.1725881585147; 
 Mon, 09 Sep 2024 04:33:05 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb21a5csm74450765e9.6.2024.09.09.04.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:33:04 -0700 (PDT)
Message-ID: <4a85cf20-e0b5-4061-90d2-f85d84435f8e@gmail.com>
Date: Mon, 9 Sep 2024 13:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/4] drm/sched: Always increment correct scheduler score
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Nirmoy Das <nirmoy.das@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-4-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240906180618.12180-4-tursulin@igalia.com>
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

Am 06.09.24 um 20:06 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Entities run queue can change during drm_sched_entity_push_job() so make
> sure to update the score consistently.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: d41a39dda140 ("drm/scheduler: improve job distribution with multiple queues")

Good catch, that might explain some of the odd behavior we have seen for 
load balancing.

Reviewed-by: Christian König <christian.koenig@amd.com>

> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.9+
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 62b07ef7630a..2a910c1df072 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -586,7 +586,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	ktime_t submit_ts;
>   
>   	trace_drm_sched_job(sched_job, entity);
> -	atomic_inc(entity->rq->sched->score);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   
>   	/*
> @@ -612,6 +611,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   
>   		rq = entity->rq;
>   
> +		atomic_inc(rq->sched->score);
>   		drm_sched_rq_add_entity(rq, entity);
>   		spin_unlock(&entity->rq_lock);
>   

