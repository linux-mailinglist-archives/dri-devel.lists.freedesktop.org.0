Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB3FA388CD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC80D10E53B;
	Mon, 17 Feb 2025 16:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jieILGkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EC910E53B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:08:55 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso49748945e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739808534; x=1740413334; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GTyX/n7RsOt5tb8xr9K3LdJvUk6okpjAk1qMtkdAS2I=;
 b=jieILGkzvgQuZens2MdbBZE6GciVbBFcqXBn1FraVOzymz1qypTRlEwmoPax/5a1FZ
 FUDv/dpKE0HZfRSlSc2Kb9VGiAiMNW0/O92UhFZcSQe0mX7julLdTT3FjhrrKT4ltS9+
 hyWQ2lt6Md/ToQfgcrgqgGcnt+VnHSsaEPKik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739808534; x=1740413334;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GTyX/n7RsOt5tb8xr9K3LdJvUk6okpjAk1qMtkdAS2I=;
 b=YqEZZIte6TPADU6tx4gx/b3mv2seAYomNLrCEdSYdWd/JlrTtm2x6q50KnRQZhalTx
 yjV8y6/+A2TQjd3m97RfeUquVaP5qmJo2NoTuAf5WQjlAyIfALMMIVG00I328jpYV3Ix
 zTu/t0BOZp2Np52MO2/4pxr/x+aKKuawrB/EgPTfvjR6ePZftXDbJVSauSnQKbrMXUBv
 ThKJs+XZgOxrkJj6j3vUzen0c4B4c3FXS39MVnqlFlFip9AVTZxSVvGkkb0XPlqDX1cb
 41fGg/KR8OGoYOoYgundchFsTcPoyYu3LSLe9VimCDwtXQ1MVLPS1X2f7kpWsUGBoUIn
 sjkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBzTNGvrCwfnRbWfLVfn8SdKqShvqzHGBv/2Sdj30UBfMakIp+oOCeDNmciJCQ15JxAFhjFGo8BRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO+c6W+9Dk+8GNadIFN+SLlhTmG1rayh9kH3ox14Mc6JwbestL
 SWJRxZPx+yKNP9VmUT7dO9asGQQTAHaXajO857HAsqNnagswuFGW89QA32hADA8=
X-Gm-Gg: ASbGncuaIk183ZeOuFzh16BZ44fRBk0CydbZ+roaM3pmuOxfOiVd2xoYukfs5nqbSaj
 bzwdAQZS9daCx3fNmJ3/0Mwrgmb5rSTrsK+Sd3wkBASymdOTcqsi1Yk1kDfRK4/69vCpIwKiNjV
 pUJYDfERJ6XAS5+VjB6zajYRN9T7ae0KEreliy4oEfl04ePBmbIqaBc/d+k/jpjt3M5Tl24BUOV
 /iNOqlcwPA+i4hPvTVKjf4Bd7VbrjIwhPIrruaZB/jcQq+51K0yoUkhH83IUhKV1QjJLosxyG9T
 VaCn/PP7L0umzWKGiywxUP0m4Nk=
X-Google-Smtp-Source: AGHT+IHHWRJ59zvQG+4eZoc+8l1InJA6uGE93rXsYApIwLbabBqPxJcso2ZsQ64zsKfbIzCOQb2HOA==
X-Received: by 2002:a05:600c:4450:b0:439:916a:b3db with SMTP id
 5b1f17b1804b1-439916ab5bdmr8896785e9.6.1739808533777; 
 Mon, 17 Feb 2025 08:08:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccef7sm12871986f8f.31.2025.02.17.08.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:08:53 -0800 (PST)
Date: Mon, 17 Feb 2025 17:08:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/4] dma-buf/dma-fence: remove unnecessary callbacks
Message-ID: <Z7NfExCVMagNI5Z3@phenom.ffwll.local>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211163109.12200-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Feb 11, 2025 at 05:31:07PM +0100, Christian König wrote:
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

Ok I got really confused here for a moment, but checks all out.

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
> index f5905d67dedb..849280ae79a9 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -173,20 +173,6 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
>  	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
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
> @@ -208,8 +194,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
>  	.get_timeline_name = timeline_fence_get_timeline_name,
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
> index e230af0d123f..8778e2d758da 100644
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
