Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2EA275BE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D88210E695;
	Tue,  4 Feb 2025 15:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ZG+2bKJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939E710E695
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:23:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so67474135e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 07:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738682580; x=1739287380;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uHPzkNUrpAio+U5bG1xs4+WPUC/pQ8D7HaWPlsKB46g=;
 b=ZG+2bKJaDEa8Kfcovk4eKgMII6iqX8e+G4pn8d65Xrp255d98UFRSNFifqtcrRW2Fd
 RPp5B2hA54+updB1Lm5lDDN0m3gl0K3TqzzHvdrIS8wAjnaxOs+CDwGQiA8GJ52U5fP5
 s9t5p16jMq54Aym/wtHOtTmTwc7dEgJPeVC9ItD032DFG7z9dwIwBk37R3cHi7RyrHur
 sxNX13tr37yNGgHE7lZ62QE4DfbQ/dobsg3XHCvR2q8c3eG2gMzjmTe80bI9mfCQEhRr
 eGWkQXWJ7dvMHkTMAWRg41uxxk4apbDx4vvTNS8F2UUtrSEv5+dUVEvjWzxVcj1Tzoch
 4HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738682580; x=1739287380;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uHPzkNUrpAio+U5bG1xs4+WPUC/pQ8D7HaWPlsKB46g=;
 b=kASmsBKoKpmD/BcdN53aTOzXcskbSRh06R7gOuwivHtMcA6E5adHpN29j5WUcN14mG
 +Npdn4euNxlHdFxzzyJHlwn3Og9A8ftiF4+vu7keHonyc44dYgtLCqcmjzO6B/F8lpdc
 Ex9NDsJ13x42/HkhtibFNrfxHWegP+rhf30rC5/5SLp87Mecj1EHe5rQ3DRwS8e6YKOI
 zA1ukcWzpCpioMcJeCdQdSItzp79rzkRFqVmjftvSwKy7O9bNasWRTzdxzeLd0oSq2sg
 e01LMtjeyounYIRu9DD5dQgr+s/3yz0DiuMtwTAjNJqZkVlve79MTOSo+he1XTryOjBy
 wwjA==
X-Gm-Message-State: AOJu0Yxx5GnCtXnpqzYm8veWtZBEBFXusFogaeQR0oygSdbnKWh8r/Gr
 tZneN1Yi2N82vmsgNCsLSPllcY2p6Ut+OctrIRnhr78N3ufa5JELLEQO6LVtOrw=
X-Gm-Gg: ASbGncsiTgOwejIg40HhwMleTybCGs/37lIsF9C18RQ7eAZoJI6xjHnRRN/jRoeqn2Q
 GOI7MdBAqP+NybJnaCDKN6q72sUsB0gsdhdiTsaDnq4NTsxyIMJ/U9dD4yU1EnzLKpSpx9w4mIt
 BMOLMZb1TPnNbzeSOjTd31qqH5sofalquXHYHpyKrC/8PjLTtngPcx4wFLc7IbcX31aOHAXLu+a
 Y8rZ0SKPfZiZVt8LKygkcmrK7s/eQexkeXpa3uQmsGG6mCP2YGiyYerbeSysC+qEfw4ae6MoFzO
 yPgFqqE5kN0GO8lucDBwhUeSN3SpvhU=
X-Google-Smtp-Source: AGHT+IEntKLHr8j1sa+aY2Ls+kNA4qbxjue7cUKL+PfzPTcK+ezljDd4qdj5+6d5zwUZ+43zkQB0bw==
X-Received: by 2002:a05:600c:3c82:b0:430:57e8:3c7e with SMTP id
 5b1f17b1804b1-438dc4251f2mr231551085e9.28.1738682578837; 
 Tue, 04 Feb 2025 07:22:58 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5492sm16239592f8f.73.2025.02.04.07.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:22:58 -0800 (PST)
Message-ID: <cc3444d8-a354-4332-93e7-0b1a70d3c4ac@ursulin.net>
Date: Tue, 4 Feb 2025 15:22:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] drm/sched: cleanup gpu_scheduler trace events
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
 <20250131110328.706695-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250131110328.706695-5-pierre-eric.pelloux-prayer@amd.com>
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


On 31/01/2025 11:03, Pierre-Eric Pelloux-Prayer wrote:
> A fence uniquely identify a job, so this commits updates the places
> where a kernel pointer was used as an identifier by:
> 
>     "fence=%llu:%llu"
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 41 +++++++++++--------
>   1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index c4ec28540656..3cdd8d8f8021 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>   	    TP_ARGS(sched_job, entity),
>   	    TP_STRUCT__entry(
> -			     __field(struct drm_sched_entity *, entity)
> -			     __field(struct dma_fence *, fence)
> -			     __string(name, sched_job->sched->name)
>   			     __field(uint64_t, id)
> +			     __string(name, sched_job->sched->name)
>   			     __field(u32, job_count)
>   			     __field(int, hw_job_count)
>   			     __string(dev, dev_name(sched_job->sched->dev))
> +			     __field(uint64_t, fence_context)
> +			     __field(uint64_t, fence_seqno)
>   			     ),
>   
>   	    TP_fast_assign(
> -			   __entry->entity = entity;
>   			   __entry->id = sched_job->id;
> -			   __entry->fence = &sched_job->s_fence->finished;
>   			   __assign_str(name);
>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>   			   __entry->hw_job_count = atomic_read(
>   				   &sched_job->sched->credit_count);
>   			   __assign_str(dev);
> +			   __entry->fence_context = sched_job->s_fence->finished.context;
> +			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> +
>   			   ),
> -	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
> -		      __get_str(dev), __entry->entity, __entry->id,
> -		      __entry->fence, __get_str(name),
> +	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
> +		      __get_str(dev), __entry->id,
> +		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
>   		      __entry->job_count, __entry->hw_job_count)
>   );
>   
> @@ -75,37 +76,41 @@ TRACE_EVENT(drm_sched_process_job,
>   	    TP_PROTO(struct drm_sched_fence *fence),
>   	    TP_ARGS(fence),
>   	    TP_STRUCT__entry(
> -		    __field(struct dma_fence *, fence)
> +		    __field(uint64_t, fence_context)
> +		    __field(uint64_t, fence_seqno)
>   		    ),
>   
>   	    TP_fast_assign(
> -		    __entry->fence = &fence->finished;
> +		    __entry->fence_context = fence->finished.context;
> +		    __entry->fence_seqno = fence->finished.seqno;
>   		    ),
> -	    TP_printk("fence=%p signaled", __entry->fence)
> +	    TP_printk("fence=%llu:%llu signaled",
> +		      __entry->fence_context, __entry->fence_seqno)

Any chance to rename this tracepoint while changing things around? For 
me "process" is not intuitive to what stage it refers so maybe a set of 
tracepoints like:

drm_sched_job_(wait_)dependenc(y|ies) - more on this in the next patch
drm_sched_job_queue
drm_sched_job_run
drm_sched_job_done

So the naming is standardised.

>   );
>   
>   TRACE_EVENT(drm_sched_job_wait_dep,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
>   	    TP_ARGS(sched_job, fence),
>   	    TP_STRUCT__entry(
> -			     __string(name, sched_job->sched->name)
> +			     __field(uint64_t, fence_context)
> +			     __field(uint64_t, fence_seqno)
>   			     __field(uint64_t, id)
>   			     __field(struct dma_fence *, fence)
>   			     __field(uint64_t, ctx)
> -			     __field(unsigned, seqno)
> +			     __field(uint64_t, seqno)
>   			     ),
>   
>   	    TP_fast_assign(
> -			   __assign_str(name);
> +			   __entry->fence_context = sched_job->s_fence->finished.context;
> +			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>   			   __entry->id = sched_job->id;
>   			   __entry->fence = fence;
>   			   __entry->ctx = fence->context;
>   			   __entry->seqno = fence->seqno;
>   			   ),
> -	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
> -		      __get_str(name), __entry->id,
> -		      __entry->fence, __entry->ctx,
> -		      __entry->seqno)
> +	    TP_printk("fence=%llu:%llu, id=%llu, dependencies:{fence=%llu:%llu}",

Will dependencies ever become a list here? Just wondering if plural and 
curlies bring anything of value, or if it would be more readable as 
"fence=%llu:%llu, id=%llu, dependency=%llu:%llu".

Regards,

Tvrtko

> +		      __entry->fence_context, __entry->fence_seqno, __entry->id,
> +		      __entry->ctx, __entry->seqno)
>   );
>   
>   #endif
