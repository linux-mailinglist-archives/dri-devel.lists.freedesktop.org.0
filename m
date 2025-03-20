Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91DA6A3FD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17610E5CE;
	Thu, 20 Mar 2025 10:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="wj6wcG2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5419010E5CE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:46:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso4126975e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 03:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1742467582; x=1743072382;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e3cXA/fw5AX+Yiya/bhG01AqbPdp8l/PoT8LT6FJXhM=;
 b=wj6wcG2d77zffpyZQ3LHFi7HCSnpcPIIj0WdRAeLfPjEnas9kEYugct8SjAh8uqnUA
 EKs1JDEmm3fPDerCEEowdJrzhIao2a0itH/O4xXrhriq7PFCmI/bHi2naQagFSMTKGtd
 5YviU1iddXY1/SZAPh9QVBxKp/58XDbSVLClEaNBx20i+c/MVECyll0MfAi9fjf8gHcd
 2Ole1qoBAnK7bfz55n51sgEcRlHfkXvnfrTGGd4lyhqCehv6RkDdrhP4vNxhzt+vagEg
 9VPbhtktuKJEmC9sK/KOURKVKhGxSUWYVZzHq3HzSeyRJY9yqDTGHWSp/lElc6STHow0
 crTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742467582; x=1743072382;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3cXA/fw5AX+Yiya/bhG01AqbPdp8l/PoT8LT6FJXhM=;
 b=H/hjqMZNvNQchY6z2lJJjrICodLLjEiBTh2xmjQ/E4EKU4KDXFoCz0oVTkQdO6V1Lo
 RVZ2Lo+B6uo9shfL30C/tmHUhnbWKc3v/CKZO8vknEHTSywCtNUYgW6GRfjid2x2Cfc1
 y/ZataEw6NcQJnZhd7GBkyFEYzvRXL0ZBJF5fyr0FIFh8/gSgnq+HIdFPLyboHRQJ3cT
 y+Xym0Sug4lFkzvt5lFIEWeDqgb1l4lwBYVKZyuCEiyRbZXmC/HVT8kBSc5q4NqcoosP
 suopIXm9PJgY5TzOJ79nlrI9y+fGVC8+qZNLRwMNrflMmEWR2TCn9h7/BRnhjAuLdeaq
 ppyQ==
X-Gm-Message-State: AOJu0YxOnarrg5XyzQqqFpLeOSrWZ/UbVMpOELoW0WNytqHTC7SyPHsD
 I1il6oVZhncjCi9UK/NDPujT9spJYnOav9p6Ovvg155/zxuVWx/l8F7qX/Xm6uQ=
X-Gm-Gg: ASbGncvkn/KruQO6Fsv9pTAjZfZzPaDSkyl5Jb7TSeBWiygrm45p4FStPCiw7uK1/z0
 E6E02zPlEfsnrcQik1napjtGqnlsRui9Mgg5u1RjBFE4hs827oOQ4Y+MFthv4nlLfQCkVCORuit
 hLghzRR7bMjK4g4cv97UV9gPJljumeYCtFRgp7Yp775TyDRxoBIincRF3DHRgysinzfHxzVeuuN
 iD8iZxMyZcBYLwX1L4/k+9Srn1lL1+7tTbblS2c/1mLBp0Y/OOeRhyOdA3eJnLmK8RuIJCiIkG6
 PLQQSGteYmF0eiI534eccTFTCZyzLujX84mx/Www1cG3sT/AgE45eohckuQ1sHMSzL6TJA4=
X-Google-Smtp-Source: AGHT+IFzjv7gOhxIlYKzki//MDgxLr1bbaSAQ8+4rCN5g/EX04DUqqsl6qwUqnLiDJXhDadlRoad7Q==
X-Received: by 2002:a05:600c:4f86:b0:43c:f616:f08 with SMTP id
 5b1f17b1804b1-43d4378b1bbmr53529905e9.8.1742467581376; 
 Thu, 20 Mar 2025 03:46:21 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f47c60sm44302855e9.13.2025.03.20.03.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:46:20 -0700 (PDT)
Message-ID: <f3670689-8b10-4665-aa1a-e54e1503b54e@ursulin.net>
Date: Thu, 20 Mar 2025 10:46:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] drm/sched: cleanup gpu_scheduler trace events
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
 <20250320095818.40622-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250320095818.40622-5-pierre-eric.pelloux-prayer@amd.com>
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
> A fence uniquely identify a job, so this commits updates the places
> where a kernel pointer was used as an identifier by:
> 
>     "fence=%llu:%llu"
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 45 ++++++++++---------
>   1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 713df3516a17..21a85ee59066 100644
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
> +			     __field(u64, fence_context)
> +			     __field(u64, fence_seqno)
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

You add this blank line only to remove in the following patch.

Otherwise LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

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
> @@ -75,37 +76,39 @@ TRACE_EVENT(drm_sched_process_job,
>   	    TP_PROTO(struct drm_sched_fence *fence),
>   	    TP_ARGS(fence),
>   	    TP_STRUCT__entry(
> -		    __field(struct dma_fence *, fence)
> +		    __field(u64, fence_context)
> +		    __field(u64, fence_seqno)
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
>   );
>   
>   TRACE_EVENT(drm_sched_job_wait_dep,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
>   	    TP_ARGS(sched_job, fence),
>   	    TP_STRUCT__entry(
> -			     __string(name, sched_job->sched->name)
> +			     __field(u64, fence_context)
> +			     __field(u64, fence_seqno)
>   			     __field(uint64_t, id)
> -			     __field(struct dma_fence *, fence)
> -			     __field(uint64_t, ctx)
> -			     __field(unsigned, seqno)
> +			     __field(u64, ctx)
> +			     __field(u64, seqno)
>   			     ),
>   
>   	    TP_fast_assign(
> -			   __assign_str(name);
> +			   __entry->fence_context = sched_job->s_fence->finished.context;
> +			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>   			   __entry->id = sched_job->id;
> -			   __entry->fence = fence;
>   			   __entry->ctx = fence->context;
>   			   __entry->seqno = fence->seqno;
>   			   ),
> -	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
> -		      __get_str(name), __entry->id,
> -		      __entry->fence, __entry->ctx,
> -		      __entry->seqno)
> +	    TP_printk("fence=%llu:%llu, id=%llu depends on unsignalled fence=%llu:%llu",
> +		      __entry->fence_context, __entry->fence_seqno, __entry->id,
> +		      __entry->ctx, __entry->seqno)
>   );
>   
>   #endif /* _GPU_SCHED_TRACE_H_ */

