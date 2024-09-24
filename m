Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C289843EC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3358210E25D;
	Tue, 24 Sep 2024 10:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Cd/M8hRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F25A10E6D6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:44:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c255e3c327so5356932a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727174670; x=1727779470; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hg57tMMy0blYSuezkQiHoCi7dn58SQLwrksj0aFKAtU=;
 b=Cd/M8hRkccjgj9fY2RN2gsuZjUmbGTAcK3hWjM/JHascYAt4Dq++RhYU2Hn3xI/eDT
 83RlB73bqXrQoQsEDyDW9/D+s1bTHxJLSuc6kCPVpDRc0q2CGsFtk2Mr10D91YUKJom5
 8TNOcBCNHSQyAphOJbvsq8Xswxrwd2tNo7gKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727174670; x=1727779470;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hg57tMMy0blYSuezkQiHoCi7dn58SQLwrksj0aFKAtU=;
 b=B2J2TuQwxUYot2nNQ/SZO4BjmauWXe0iOiU7GvbmypgrgO9kk6YyHvfEnkcNIY7kzD
 HoDxe4lTClVcItzI/NkFeCz8z14Kq2ZGJsvb7Z39waZ1sWgC63+tfeOyusLR9djyFChP
 YPjszV73U7v47GmvJb1kpKK7f8dWApMIwN2WU/tTr9b7cHdLlRfZVZENLVW5ETx0ASta
 Jac/WGK19HA4deEk35PMeAs6Iro6RGK2PUZgub/r3jrgAR0VerLMqWtJr9kAOytLRT2Q
 EnbMTOUypuGJswhlVDJqu55uPyH464+So1RUg3peig5tBsAH3wbWFOxNZ516WBZh+XbE
 I4mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVTLFGQWycAEfhdLA/O7R7wkx4AKUO+JYCC908QdLdmN0lpGhV147t/1j4WMp5JQ1UQggMZ4DNnvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1f56Y6GNeuvtOeg2XDX42og7HM/fjJHsTq1ip3tAXLuVSKkb2
 Z3HCoCmezCvqCpFe+Yls/VHRD1ClLWgZdHxZc7UbW/2DoeRYW3bQcizMbYkxZMc=
X-Google-Smtp-Source: AGHT+IFsbAPQtvwlsECTfv5o6GbOlmX9+qawAUAtHMx47dRNmzL6e4E6m9ePldWVdx0t67RittQL/w==
X-Received: by 2002:a17:907:9282:b0:a7a:af5d:f312 with SMTP id
 a640c23a62f3a-a90d514a9b4mr1367037666b.46.1727174670064; 
 Tue, 24 Sep 2024 03:44:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3479fsm69803366b.39.2024.09.24.03.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:44:29 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:44:27 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, daniel@ffwll.ch, tursulin@ursulin.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/2] dma-buf/dma-fence: remove unnecessary callbacks
Message-ID: <ZvKYC1WPOhQpjw94@phenom.ffwll.local>
References: <20240918115513.2716-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918115513.2716-1-christian.koenig@amd.com>
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

On Wed, Sep 18, 2024 at 01:55:12PM +0200, Christian König wrote:
> The fence_value_str and timeline_value_str callbacks were just an
> unnecessary abstraction in the SW sync implementation.
> 
> The only caller of those callbacks already knew that the fence in
> questions is a timeline_fence. So print the values directly instead
> of using a redirection.
> 
> Additional to that remove the implementations from virtgpu and vgem.
> As far as I can see those were never used in the first place.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/sw_sync.c              | 16 ----------------
>  drivers/dma-buf/sync_debug.c           | 21 ++-------------------
>  drivers/gpu/drm/vgem/vgem_fence.c      | 15 ---------------
>  drivers/gpu/drm/virtio/virtgpu_fence.c | 16 ----------------
>  include/linux/dma-fence.h              | 21 ---------------------
>  5 files changed, 2 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index c353029789cf..f7ce4c6b8b8e 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -178,20 +178,6 @@ static bool timeline_fence_enable_signaling(struct dma_fence *fence)
>  	return true;
>  }
>  
> -static void timeline_fence_value_str(struct dma_fence *fence,
> -				    char *str, int size)
> -{
> -	snprintf(str, size, "%lld", fence->seqno);
> -}
> -
> -static void timeline_fence_timeline_value_str(struct dma_fence *fence,
> -					     char *str, int size)
> -{
> -	struct sync_timeline *parent = dma_fence_parent(fence);
> -
> -	snprintf(str, size, "%d", parent->value);
> -}
> -
>  static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>  {
>  	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
> @@ -214,8 +200,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
>  	.enable_signaling = timeline_fence_enable_signaling,
>  	.signaled = timeline_fence_signaled,
>  	.release = timeline_fence_release,
> -	.fence_value_str = timeline_fence_value_str,
> -	.timeline_value_str = timeline_fence_timeline_value_str,
>  	.set_deadline = timeline_fence_set_deadline,
>  };
>  
> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> index 237bce21d1e7..270daae7d89a 100644
> --- a/drivers/dma-buf/sync_debug.c
> +++ b/drivers/dma-buf/sync_debug.c
> @@ -82,25 +82,8 @@ static void sync_print_fence(struct seq_file *s,
>  		seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_nsec);
>  	}
>  
> -	if (fence->ops->timeline_value_str &&
> -		fence->ops->fence_value_str) {
> -		char value[64];
> -		bool success;
> -
> -		fence->ops->fence_value_str(fence, value, sizeof(value));
> -		success = strlen(value);
> -
> -		if (success) {
> -			seq_printf(s, ": %s", value);
> -
> -			fence->ops->timeline_value_str(fence, value,
> -						       sizeof(value));
> -
> -			if (strlen(value))
> -				seq_printf(s, " / %s", value);
> -		}
> -	}
> -
> +	seq_printf(s, ": %lld", fence->seqno);
> +	seq_printf(s, " / %d", parent->value);
>  	seq_putc(s, '\n');
>  }
>  
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> index e15754178395..5298d995faa7 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -53,25 +53,10 @@ static void vgem_fence_release(struct dma_fence *base)
>  	dma_fence_free(&fence->base);
>  }
>  
> -static void vgem_fence_value_str(struct dma_fence *fence, char *str, int size)
> -{
> -	snprintf(str, size, "%llu", fence->seqno);
> -}
> -
> -static void vgem_fence_timeline_value_str(struct dma_fence *fence, char *str,
> -					  int size)
> -{
> -	snprintf(str, size, "%llu",
> -		 dma_fence_is_signaled(fence) ? fence->seqno : 0);
> -}
> -
>  static const struct dma_fence_ops vgem_fence_ops = {
>  	.get_driver_name = vgem_fence_get_driver_name,
>  	.get_timeline_name = vgem_fence_get_timeline_name,
>  	.release = vgem_fence_release,
> -
> -	.fence_value_str = vgem_fence_value_str,
> -	.timeline_value_str = vgem_fence_timeline_value_str,
>  };
>  
>  static void vgem_fence_timeout(struct timer_list *t)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
> index f28357dbde35..44c1d8ef3c4d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
> @@ -49,26 +49,10 @@ static bool virtio_gpu_fence_signaled(struct dma_fence *f)
>  	return false;
>  }
>  
> -static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
> -{
> -	snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
> -}
> -
> -static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
> -					  int size)
> -{
> -	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
> -
> -	snprintf(str, size, "%llu",
> -		 (u64)atomic64_read(&fence->drv->last_fence_id));
> -}
> -
>  static const struct dma_fence_ops virtio_gpu_fence_ops = {
>  	.get_driver_name     = virtio_gpu_get_driver_name,
>  	.get_timeline_name   = virtio_gpu_get_timeline_name,
>  	.signaled            = virtio_gpu_fence_signaled,
> -	.fence_value_str     = virtio_gpu_fence_value_str,
> -	.timeline_value_str  = virtio_gpu_timeline_value_str,
>  };
>  
>  struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index e7ad819962e3..cf91cae6e30f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -238,27 +238,6 @@ struct dma_fence_ops {
>  	 */
>  	void (*release)(struct dma_fence *fence);
>  
> -	/**
> -	 * @fence_value_str:
> -	 *
> -	 * Callback to fill in free-form debug info specific to this fence, like
> -	 * the sequence number.
> -	 *
> -	 * This callback is optional.
> -	 */
> -	void (*fence_value_str)(struct dma_fence *fence, char *str, int size);
> -
> -	/**
> -	 * @timeline_value_str:
> -	 *
> -	 * Fills in the current value of the timeline as a string, like the
> -	 * sequence number. Note that the specific fence passed to this function
> -	 * should not matter, drivers should only use it to look up the
> -	 * corresponding timeline structures.
> -	 */
> -	void (*timeline_value_str)(struct dma_fence *fence,
> -				   char *str, int size);
> -
>  	/**
>  	 * @set_deadline:
>  	 *
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
