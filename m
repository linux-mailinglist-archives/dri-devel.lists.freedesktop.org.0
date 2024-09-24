Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48449843F8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA9E10E6C9;
	Tue, 24 Sep 2024 10:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="lPWR98Qs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E838E10E6C9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:47:21 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c43003a667so7525373a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 03:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727174840; x=1727779640; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=b9AAZawLb6FaRJnOrXyKiH/jOlbBCezL8WJNXf16Qig=;
 b=lPWR98QsVkRrezPElH8/aMqZAg+EQU1OuCfVeZ4N94y8K5XwDV+LHldu7myxmGmCxl
 36cs0UUV25ydm2lPdrx6Na5xjqvdc55yTi32XSXz9vhKRVjSqXzYajN+AnK4DcRNudeD
 E7a6pWHb3tR+c38wS31+LkQcnixCTW8hYyCk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727174840; x=1727779640;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b9AAZawLb6FaRJnOrXyKiH/jOlbBCezL8WJNXf16Qig=;
 b=h2wjrLTHjTPZoVf6SXIVuQQpdFT8CLeL1isAG6mgr+12fFZPc9ZoFXGpAtQVsFRKZd
 ZaOn4Rn9SxMCOIpov7LJs0t3HUI2dzZmEEqiVOr8JwNNIXta15TaM/LaLMDbP8RKPXdz
 levALpF5hiIqw/rCQsSo7io2grry6rrbU+tRhXPlSUurwOWCsafH7yNodUYAlMZo6d5B
 1Tnrqd7JhVXistKsfPoYdPo7DYi2vVKIn+CqcFSvScA9RcppS5W+vd8o4uw8GIMe1KnM
 XR0wyuv7PS8Rd6FFcXCp5M/K8WkYCP22aQwcWh++0ZQdbLdqtZCrAR3j3EzKMgCKY+ym
 0MGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHsXWZ2CcQNPANNc76GqKzqGqsGeij635QozhHECbRX8IFRt4pys+Ar2gYD8zRvfEhyRVZRAVV+8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztsaQRJ9hHpBomvYrRObj4JVDq4hrsEbmTB549p4F6wAhaAuCz
 tb2/kBUhZFv+m1sPFNcqt5L4pfgEMgpjHB//oAFRcPABwkuaslIxVTefYSd6uOY=
X-Google-Smtp-Source: AGHT+IF0W+3rb+Ngl+ZJbRG42J4AQJXxigROwpY5FCSbwoWAG3Z/e/Carit9idFj1WPL1j8KnzOx5A==
X-Received: by 2002:a17:907:7e8b:b0:a86:789f:c756 with SMTP id
 a640c23a62f3a-a90d50fd4aamr1610614066b.53.1727174840220; 
 Tue, 24 Sep 2024 03:47:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f8440sm68735266b.182.2024.09.24.03.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:47:19 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:47:18 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, daniel@ffwll.ch, tursulin@ursulin.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/2] dma-buf/dma-fence: add wrappers for driver and
 timeline name
Message-ID: <ZvKYtr9G12F6QNV0@phenom.ffwll.local>
References: <20240918115513.2716-1-christian.koenig@amd.com>
 <20240918115513.2716-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918115513.2716-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Wed, Sep 18, 2024 at 01:55:13PM +0200, Christian König wrote:
> As discussed with Sima we want dma_fence objects to be able to outlive
> their backend ops. Because of this timeline and driver name shouldn't
> be queried any more after the fence has signaled.
> 
> Add wrappers around the two queries and only return an empty string
> if the fence was already signaled. There is still an obvious race
> between signaling and querying the values, but that can only be
> closed if we rework the locking as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c                 | 39 ++++++++++++++++++---
>  drivers/dma-buf/sync_file.c                 |  8 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_requests.c |  4 +--
>  drivers/gpu/drm/i915/i915_request.c         |  2 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c        |  4 +--
>  include/linux/dma-fence.h                   |  2 ++
>  include/trace/events/dma_fence.h            |  4 +--
>  8 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 0393a9bba3a8..d82f6c9ac018 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -538,8 +538,8 @@ void dma_fence_release(struct kref *kref)
>  	if (WARN(!list_empty(&fence->cb_list) &&
>  		 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags),
>  		 "Fence %s:%s:%llx:%llx released with pending signals!\n",
> -		 fence->ops->get_driver_name(fence),
> -		 fence->ops->get_timeline_name(fence),
> +		 dma_fence_driver_name(fence),
> +		 dma_fence_timeline_name(fence),
>  		 fence->context, fence->seqno)) {
>  		unsigned long flags;
>  
> @@ -973,6 +973,37 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>  }
>  EXPORT_SYMBOL(dma_fence_set_deadline);
>  
> +/**
> + * dma_fence_driver_name - return the driver name for a fence
> + * @fence:	the fence to query the driver name on
> + *
> + * Returns the driver name or empty string if the fence is already signaled.
> + */
> +const char *dma_fence_driver_name(struct dma_fence *fence)
> +{

I think a /* FIXME: blatantly racy, but better than nothig */ here and
below would be good, just to make sure we don't forget. With that:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>



> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return "";
> +
> +	return fence->ops->get_driver_name(fence);
> +}
> +EXPORT_SYMBOL(dma_fence_driver_name);
> +
> +/**
> + * dma_fence_timeline_name - return the name of the fence context
> + * @fence:	the fence to query the context on
> + *
> + * Returns the name of the context this fence belongs to or empty string if the
> + * fence is already signaled.
> + */
> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> +{
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return "";
> +
> +	return fence->ops->get_timeline_name(fence);
> +}
> +EXPORT_SYMBOL(dma_fence_timeline_name);
> +
>  /**
>   * dma_fence_describe - Dump fence description into seq_file
>   * @fence: the fence to describe
> @@ -983,8 +1014,8 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
>  	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> -		   fence->ops->get_driver_name(fence),
> -		   fence->ops->get_timeline_name(fence), fence->seqno,
> +		   dma_fence_driver_name(fence),
> +		   dma_fence_timeline_name(fence), fence->seqno,
>  		   dma_fence_is_signaled(fence) ? "" : "un");
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index d9b1c1b2a72b..212df4b849fe 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -137,8 +137,8 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>  		struct dma_fence *fence = sync_file->fence;
>  
>  		snprintf(buf, len, "%s-%s%llu-%lld",
> -			 fence->ops->get_driver_name(fence),
> -			 fence->ops->get_timeline_name(fence),
> +			 dma_fence_driver_name(fence),
> +			 dma_fence_timeline_name(fence),
>  			 fence->context,
>  			 fence->seqno);
>  	}
> @@ -262,9 +262,9 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
>  static int sync_fill_fence_info(struct dma_fence *fence,
>  				 struct sync_fence_info *info)
>  {
> -	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
> +	strscpy(info->obj_name, dma_fence_timeline_name(fence),
>  		sizeof(info->obj_name));
> -	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
> +	strscpy(info->driver_name, dma_fence_driver_name(fence),
>  		sizeof(info->driver_name));
>  
>  	info->status = dma_fence_get_status(fence);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 383fce40d4dd..224a40e03b36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -33,7 +33,7 @@
>  #define TRACE_INCLUDE_FILE amdgpu_trace
>  
>  #define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
> -	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
> +	dma_fence_timeline_name(&job->base.s_fence->finished)
>  
>  TRACE_EVENT(amdgpu_device_rreg,
>  	    TP_PROTO(unsigned did, uint32_t reg, uint32_t value),
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index d1a382dfaa1d..ae3557ed6c1e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -252,8 +252,8 @@ void intel_gt_watchdog_work(struct work_struct *work)
>  			struct dma_fence *f = &rq->fence;
>  
>  			pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
> -				  f->ops->get_driver_name(f),
> -				  f->ops->get_timeline_name(f),
> +				  dma_fence_driver_name(f),
> +				  dma_fence_timeline_name(f),
>  				  f->seqno);
>  			i915_request_cancel(rq, -EINTR);
>  		}
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 519e096c607c..aaec28fd4864 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -2184,7 +2184,7 @@ void i915_request_show(struct drm_printer *m,
>  		       const char *prefix,
>  		       int indent)
>  {
> -	const char *name = rq->fence.ops->get_timeline_name((struct dma_fence *)&rq->fence);
> +	const char *name = dma_fence_timeline_name((struct dma_fence *)&rq->fence);
>  	char buf[80] = "";
>  	int x = 0;
>  
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 8a9aad523eec..b805ce8b8ab8 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -435,8 +435,8 @@ static void timer_i915_sw_fence_wake(struct timer_list *t)
>  		return;
>  
>  	pr_notice("Asynchronous wait on fence %s:%s:%llx timed out (hint:%ps)\n",
> -		  cb->dma->ops->get_driver_name(cb->dma),
> -		  cb->dma->ops->get_timeline_name(cb->dma),
> +		  dma_fence_driver_name(cb->dma),
> +		  dma_fence_timeline_name(cb->dma),
>  		  cb->dma->seqno,
>  		  i915_sw_fence_debug_hint(fence));
>  
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index cf91cae6e30f..4b0634e42a36 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -264,6 +264,8 @@ void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  
>  void dma_fence_release(struct kref *kref);
>  void dma_fence_free(struct dma_fence *fence);
> +const char *dma_fence_driver_name(struct dma_fence *fence);
> +const char *dma_fence_timeline_name(struct dma_fence *fence);
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>  
>  /**
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index a4de3df8500b..84c83074ee81 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -16,8 +16,8 @@ DECLARE_EVENT_CLASS(dma_fence,
>  	TP_ARGS(fence),
>  
>  	TP_STRUCT__entry(
> -		__string(driver, fence->ops->get_driver_name(fence))
> -		__string(timeline, fence->ops->get_timeline_name(fence))
> +		__string(driver, dma_fence_driver_name(fence))
> +		__string(timeline, dma_fence_timeline_name(fence))
>  		__field(unsigned int, context)
>  		__field(unsigned int, seqno)
>  	),
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
