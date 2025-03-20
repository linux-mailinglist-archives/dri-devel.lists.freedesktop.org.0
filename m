Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C71A6A407
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835C910E5D7;
	Thu, 20 Mar 2025 10:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Nti2l/RC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C0410E5D7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:47:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso5145445e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1742467650; x=1743072450;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=foGgFo33VLzIkzjoUbfwPOydEMR+xeWsTRE1WEHeQbI=;
 b=Nti2l/RCvqopMl8cwJOxCvXD2celskBlIWrEjJTWdyrdac/ho7z4xhKXiMriSFCmQm
 ZK8iccYxjIXhl5SaA3KlFz+tG1hUwcI2qWOIM12nNMCn9WK8SicT831Rve7WFNo99+km
 y1amCwUQ1YS4rU6R/9/QZEwfrlSQyu9GfON3roMFMSEPglXd2Gl13SpCoUoHjhvVXc58
 oNtZ30WF4eC3YyWuc3Jk4N9tT+GZgEAzCwushk+3YNiUpSEoKSd8QXAcbxToXnUOjc8v
 nl0WMOOZIH0IMe5wADr2ZYLEw5rw2BNJdMp2l7nuGnRKEy6Q45NI3dvKyKNGqz0/S5TH
 zIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742467650; x=1743072450;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=foGgFo33VLzIkzjoUbfwPOydEMR+xeWsTRE1WEHeQbI=;
 b=CsfdoQdMs6qDhU4x2Fbay5W299swJpNL7PRMsdmFik6XmSwggZRlapGTOzi696Xgi0
 uHEvFdsew38UOaTj3xLwxkFj8sF91d/JNVlhbtiDlrPY9uthu9fX5HZQpjnuUz5UXv+r
 3gFj1xFUDGGhFgJZ7GwtCRtWOKdsg7iZwr/PHIuAosR6LxcPR3g6vsnCRdOKzXnuGvDG
 5F1KgvHD+4Rg2y/SaJ4xHDQywAyF0ob33/OuDXK7MsRXxpMW+eEdmeExYzuy+UlqM/Eq
 ZZIoWrjfSfQaFzTY+eng55ctOwPvIsCnhjcCAgk3PxLVmAIMdBtuWGBcBjkS52toSLTs
 KAqw==
X-Gm-Message-State: AOJu0YxPawHaJmH0CNycn4imN2Gm7UFLybFeUD94QoWxwCSFNJBoSSGK
 II7FZFZ9HvjU9eOXClTV7Fd6xHGtm0x/SD67Bb+Y3FEDYGeMsTdPuamwrMqT598=
X-Gm-Gg: ASbGncvHNY/jRufbX5mVNlDC/D5IXcv/3wIzUXkqZy4WOpRz5bDrprToxUMkIG8RIhV
 o8/s4Fax2U0bkSJk3cFIBv7yM/dBAqmbi7k6Op/nyeGbswqyh4HuufZTGzJFYBmnnLs0A3t3J0z
 ZyhiLilSOSXOVjbYGV0T5JeBsqa9nUWjjV6+BdrORLbXXBYiS5llcI2nksxK07tI20/TYyMlW69
 GQTSsjb4AV5qLcryi8A4vktgHvjR/iCwEs77xSwiQhgH6S4TI9cwc7qTeBdERsxmk9VG6W1wGQr
 S9V13MOQAwDcWk//XOrhwancSuIAJS1GzBSx4RTriTS97GL/HpccZZ5V72hy
X-Google-Smtp-Source: AGHT+IEvHPoPXyg7rfkgM3Y97xOpECmfVdCIe7gAm9tgP99dIaDKMLf19aoDb9oOuJzL8kX1SocWRw==
X-Received: by 2002:a05:600c:5008:b0:43c:f87c:24d3 with SMTP id
 5b1f17b1804b1-43d4381b4b9mr64371575e9.20.1742467649457; 
 Thu, 20 Mar 2025 03:47:29 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df35f7sm23678038f8f.13.2025.03.20.03.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:47:29 -0700 (PDT)
Message-ID: <d4ef3a3b-eed1-4c15-827b-4a34a8a47dc1@ursulin.net>
Date: Thu, 20 Mar 2025 10:47:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] drm/sched: trace dependencies for gpu jobs
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
 <20250320095818.40622-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250320095818.40622-6-pierre-eric.pelloux-prayer@amd.com>
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


On 20/03/2025 09:58, Pierre-Eric Pelloux-Prayer wrote:
> We can't trace dependencies from drm_sched_job_add_dependency
> because when it's called the job's fence is not available yet.
> 
> So instead each dependency is traced individually when
> drm_sched_entity_push_job is used.
> 
> Tracing the dependencies allows tools to analyze the dependencies
> between the jobs (previously it was only possible for fences
> traced by drm_sched_job_wait_dep).
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 24 ++++++++++++++++++-
>   drivers/gpu/drm/scheduler/sched_entity.c      |  8 +++++++
>   2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 21a85ee59066..5d9992ad47d3 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -54,7 +54,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			   __assign_str(dev);
>   			   __entry->fence_context = sched_job->s_fence->finished.context;
>   			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> -
>   			   ),
>   	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
>   		      __get_str(dev), __entry->id,
> @@ -88,6 +87,29 @@ TRACE_EVENT(drm_sched_process_job,
>   		      __entry->fence_context, __entry->fence_seqno)
>   );
>   
> +TRACE_EVENT(drm_sched_job_add_dep,
> +	TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
> +	TP_ARGS(sched_job, fence),
> +	TP_STRUCT__entry(
> +		    __field(u64, fence_context)
> +		    __field(u64, fence_seqno)
> +		    __field(u64, id)
> +		    __field(u64, ctx)
> +		    __field(u64, seqno)
> +		    ),
> +
> +	TP_fast_assign(
> +		    __entry->fence_context = sched_job->s_fence->finished.context;
> +		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> +		    __entry->id = sched_job->id;
> +		    __entry->ctx = fence->context;
> +		    __entry->seqno = fence->seqno;
> +		    ),
> +	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
> +		  __entry->fence_context, __entry->fence_seqno, __entry->id,
> +		  __entry->ctx, __entry->seqno)
> +);
> +
>   TRACE_EVENT(drm_sched_job_wait_dep,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
>   	    TP_ARGS(sched_job, fence),
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a6d2a4722d82..047e42cfb129 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -580,6 +580,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	ktime_t submit_ts;
>   
>   	trace_drm_sched_job(sched_job, entity);
> +
> +	if (trace_drm_sched_job_add_dep_enabled()) {
> +		struct dma_fence *entry;
> +		unsigned long index;
> +
> +		xa_for_each(&sched_job->dependencies, index, entry)
> +			trace_drm_sched_job_add_dep(sched_job, entry);
> +	}
>   	atomic_inc(entity->rq->sched->score);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

