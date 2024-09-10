Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB90972C3F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 10:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87BB89B66;
	Tue, 10 Sep 2024 08:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k7m1kSMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA14C89B66;
 Tue, 10 Sep 2024 08:36:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so28747975e9.1; 
 Tue, 10 Sep 2024 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725957410; x=1726562210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cpN/WEheNIpLzBnzCua0NoFTpn2JTngrm5Tw9m8fBVI=;
 b=k7m1kSMIG3dbJXWqtTnDe92V8wItvnQQC1WOdudtwNy2Txz8DbpEscen0uDexJirXh
 ONd57acQkQr3SbA6JvoGq5olHnfkn3Me+jom5csmeXyXNnkZ4fmWV/o72Slm8V5DeGN8
 z/nn5n7IlCp7zi0XISZbziTC+30bjzKQjb1WmLd/PYpow2+MzkEy9jcpWQH0u569lOhG
 E2vHofS23OSczIP0vFx44TXCMei6OWXEucwY9PzgbiLXQLkrgmSAH4ytGNhK1CfVmBhg
 pCR30HgU4pdcX90Y3y2Jfmj4NwYt8PNKMpJofwjQ0sOWlY2WwAIAA1V4M9vv9oxxm9M6
 UEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725957410; x=1726562210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cpN/WEheNIpLzBnzCua0NoFTpn2JTngrm5Tw9m8fBVI=;
 b=vn5lqktPFiGvMfPUGxbU99Tvtld/5N7U0dwTmRW8bIFQ+NjLLDs+KQpBlzOlJA+tRc
 mHOVzJ0IP9GO3Jv2YJsaeXUCswVPVJLh6V8yRTfuZidNK7CN6oPCm9w+6+bLE20P9Tdu
 jmQxgmmKUwQxmPExUs+omfvzXffnzeOYgc3daKphY+SmVjxu8BTO83R9QrdBq9BgF9lW
 I4RRYodohpt9sH5c+T7YSxoOFQPcbQGPlKE2c8CVFnEGtcSlcdImFMJPg43Mdx5mLxnv
 33V0JlLSjL0Uij8L9nOpkjld30kUzkDbySlYqtIKTrIQ1gN/Vb9ujahZpiMAFTof6djH
 vqwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0EGyr/dLOhUF4XthUIpLPnIoMaasC1PMv03TE4Lb6akB3hx8/Xf5+khDrcLb+zaYcrGmDwAs7@lists.freedesktop.org,
 AJvYcCUH6dG82X+D52G/+2DPSOB1Mm5NdoHUxcJW6NjKUSfxY70F0rHpwu2+KaUnmzX88fWMkKcHq8mASKc4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+1HORxzkp/XnSyfV+8EXtMP4W8McO9bMBlewD/6POAE4Mp62T
 QN+0+xrFBkYUNSarYsv93RqbBAaFFkCCGT+1tB0aYFp39d6Zxzo7LPWWfxyH
X-Google-Smtp-Source: AGHT+IGEza4KzA0SCbDz5rRJcUDsb5l7BHojgT+qSPYY8Q3ybsIpKHHCdGg9Zs6DpwzsmdXc7OMOWg==
X-Received: by 2002:a05:600c:5128:b0:42c:b62c:9f36 with SMTP id
 5b1f17b1804b1-42cb62ca18fmr50686715e9.5.1725957409281; 
 Tue, 10 Sep 2024 01:36:49 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8b7f1sm104254975e9.48.2024.09.10.01.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 01:36:48 -0700 (PDT)
Message-ID: <ed9d9aed-eb04-4867-bb7a-9f37a60d5263@gmail.com>
Date: Tue, 10 Sep 2024 10:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/sched: Optimise drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-5-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240909171937.51550-5-tursulin@igalia.com>
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



Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> In FIFO mode We can avoid dropping the lock only to immediately re-acquire
> by adding a new drm_sched_rq_update_fifo_locked() helper.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  5 +++--
>   drivers/gpu/drm/scheduler/sched_main.c   | 21 ++++++++++++++-------
>   include/drm/gpu_scheduler.h              |  1 +
>   3 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 6645a8524699..2da677681291 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -615,10 +615,11 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   
>   		atomic_inc(sched->score);
>   		drm_sched_rq_add_entity(rq, entity);
> -		spin_unlock(&entity->rq_lock);
>   
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			drm_sched_rq_update_fifo(entity, submit_ts);
> +			drm_sched_rq_update_fifo_locked(entity, submit_ts);
> +
> +		spin_unlock(&entity->rq_lock);
>   
>   		drm_sched_wakeup(sched, entity);
>   	}
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..10abbcefe9d8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -163,14 +163,10 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>   	}
>   }
>   
> -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts)
>   {
> -	/*
> -	 * Both locks need to be grabbed, one to protect from entity->rq change
> -	 * for entity from within concurrent drm_sched_entity_select_rq and the
> -	 * other to update the rb tree structure.
> -	 */
> -	spin_lock(&entity->rq_lock);
> +	lockdep_assert_held(&entity->rq_lock);
> +
>   	spin_lock(&entity->rq->lock);
>   
>   	drm_sched_rq_remove_fifo_locked(entity);
> @@ -181,6 +177,17 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>   		      drm_sched_entity_compare_before);
>   
>   	spin_unlock(&entity->rq->lock);
> +}
> +
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> +{
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	spin_lock(&entity->rq_lock);
> +	drm_sched_rq_update_fifo_locked(entity, ts);
>   	spin_unlock(&entity->rq_lock);
>   }

I wonder if we shouldn't change the only other occasion calling this to 
grab the lock manually as well.

Christian.

>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fe8edb917360..a06753987d93 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -594,6 +594,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity);
>   
>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
>   
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,

