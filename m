Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74147A85003
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D08010E056;
	Thu, 10 Apr 2025 23:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="EcebvaGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D0510E056
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:18:18 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-72c172f1de1so862458a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 16:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1744327097; x=1744931897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m7o4HeYX6WaTzlmeSSi8f1bY+Yduv9PPLmTbKfWmhP8=;
 b=EcebvaGE43fXUYskwdk6W/Yb0VpWI6hNRlwqGpT9nAvZGED8/+wNdKRAnuS1f4wJda
 plIVjQFGQGa+CBbigabuMa/lL838UOglGWG87SS4Bi050H/yBucD/62vC8mJDegutqme
 mTFxoQk2tiwnKzCjCvXW+Nkml34aGGjKVYdTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744327097; x=1744931897;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7o4HeYX6WaTzlmeSSi8f1bY+Yduv9PPLmTbKfWmhP8=;
 b=Z/ts2+dTd8MF97EBjuNQwKR8mMKRQj09H5HtjIZcbs02ZbFKuuZHqRDR7FSFlQNXqM
 AFsRG+yH0Leu0D+igEP408fWZs7xgT8wVtsuJ9ycAsnX5t2/xQxHiQB7XgdgEWDZ+7V8
 vb74q8PTgQESbA++U3G70elC5C+rTiqj6a8ir61Osm/oYYDtJdcwh6bWoeRGrI+cfeVA
 Ffxo2kfeBHQVKTxiPxt0v4Z9vj4RpBtfxjlWA0u17zu4dWPdikSXRprR0Gnxg0YqF4oh
 w/i+MZF+acfslGRw9bjwRgBSHwhbeDpGSiqbaQSqGOdo00GjvaEW/mlZxIhVbRcKq4ZM
 mXHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2yVJdwi04legIxo3ZOpwKWvRFeLrKb+VhSXEeCME/GrhmAly/NHONrkX6B9c5tp+UQ6+riS1z6bc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6t717CEDKPkmqLIjgiBOdpH4avuetmR+eyq2lINBH5ssLQCXg
 Y43anUtVnFlAU19bCLpNHj1IkDm715V+ow0QMeC7RkQfqJ9XOVJm8cJCwL0Unw==
X-Gm-Gg: ASbGncvo9HcnwBGcRdFlQo8GGqjpwTnuEJYXPw5cjqG9lMz4yhbdnvYdN7I1TXdqRgp
 NygBWCgSK3ZsJ5w/RsiBE2HB8b7hzVUp6OIR7DDUwR0h0rPm/VhY3h8N48px5Ylu4CfnRebOnZV
 0GGDXTL4k9FP7pADVvLWcmS3OELqEIXn9R8vJohhwEzWkALp7VWXvU4HFHBjL699JHBYSxCfbYT
 sMXgR+svDFOYstDGVqe1GcQ0bPQEmm7Yb86H3nd77d0fc0bx9SOI9qBYajfAxjWWpbFVl99F+aL
 rP0QLZiNmC+Wktdqy/CpTT4adpKUCr1eXoX+yXMqXjs1edcbdY7TTI4J2XrekBsVRndczs6FyPx
 038UtIA==
X-Google-Smtp-Source: AGHT+IGbC1wsXw85uBmxjF2pv7CAg5OJIEjP2v8z4t87oHOK0L+nIyxOYnnH3/Hujsd1goBYc15ccQ==
X-Received: by 2002:a05:6830:6812:b0:72a:13cf:4aa0 with SMTP id
 46e09a7af769-72e8633ccf2mr535609a34.15.1744327097191; 
 Thu, 10 Apr 2025 16:18:17 -0700 (PDT)
Received: from [10.211.247.102] ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72e73d8d3bbsm733795a34.33.2025.04.10.16.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 16:18:16 -0700 (PDT)
Message-ID: <545081b9-84df-4ccf-bb9c-052c0bd0e5de@broadcom.com>
Date: Thu, 10 Apr 2025 16:18:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/vmwgfx: Update last_read_seqno under the fence
 lock
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com
References: <20250410195508.233367-1-ian.forbes@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20250410195508.233367-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8
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

On 4/10/25 12:55, Ian Forbes wrote:
> There was a possible race in vmw_update_seqno. Because of this race it
> was possible for last_read_seqno to go backwards. Remove this function
> and replace it with vmw_update_fences which now sets and returns the
> last_read_seqno while holding the fence lock. This serialization via the
> fence lock ensures that last_read_seqno is monotonic again.
> 
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c     |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  3 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 18 +++++++++---------
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.h   |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_irq.c     | 12 +-----------
>  6 files changed, 13 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> index dd4ca6a9c690..8fe02131a6c4 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> @@ -544,7 +544,7 @@ int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
>  	cmd_fence = (struct svga_fifo_cmd_fence *) fm;
>  	cmd_fence->fence = *seqno;
>  	vmw_cmd_commit_flush(dev_priv, bytes);
> -	vmw_update_seqno(dev_priv);
> +	vmw_fences_update(dev_priv->fman);
>  
>  out_err:
>  	return ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 594af8eb04c6..6d4a68f0ae37 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1006,7 +1006,6 @@ extern int vmw_fallback_wait(struct vmw_private *dev_priv,
>  			     uint32_t seqno,
>  			     bool interruptible,
>  			     unsigned long timeout);
> -extern void vmw_update_seqno(struct vmw_private *dev_priv);
>  extern void vmw_seqno_waiter_add(struct vmw_private *dev_priv);
>  extern void vmw_seqno_waiter_remove(struct vmw_private *dev_priv);
>  extern void vmw_goal_waiter_add(struct vmw_private *dev_priv);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index e831e324e737..90ce5372343b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3878,8 +3878,7 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
>  
>  		fence_rep.handle = fence_handle;
>  		fence_rep.seqno = fence->base.seqno;
> -		vmw_update_seqno(dev_priv);
> -		fence_rep.passed_seqno = dev_priv->last_read_seqno;
> +		fence_rep.passed_seqno = vmw_fences_update(dev_priv->fman);
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> index 588d50ababf6..9d1465558839 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -172,7 +172,7 @@ vmwgfx_wait_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  	wake_up_process(wait->task);
>  }
>  
> -static void __vmw_fences_update(struct vmw_fence_manager *fman);
> +static u32 __vmw_fences_update(struct vmw_fence_manager *fman);
>  
>  static long vmw_fence_wait(struct dma_fence *f, bool intr, signed long timeout)
>  {
> @@ -457,7 +457,7 @@ static bool vmw_fence_goal_check_locked(struct vmw_fence_obj *fence)
>  	return true;
>  }
>  
> -static void __vmw_fences_update(struct vmw_fence_manager *fman)
> +static u32 __vmw_fences_update(struct vmw_fence_manager *fman)
>  {
>  	struct vmw_fence_obj *fence, *next_fence;
>  	struct list_head action_list;
> @@ -495,13 +495,16 @@ static void __vmw_fences_update(struct vmw_fence_manager *fman)
>  
>  	if (!list_empty(&fman->cleanup_list))
>  		(void) schedule_work(&fman->work);
> +	return (fman->dev_priv->last_read_seqno = seqno);
>  }
>  
> -void vmw_fences_update(struct vmw_fence_manager *fman)
> +u32 vmw_fences_update(struct vmw_fence_manager *fman)
>  {
> +	u32 seqno;
>  	spin_lock(&fman->lock);
> -	__vmw_fences_update(fman);
> +	seqno = __vmw_fences_update(fman);
>  	spin_unlock(&fman->lock);
> +	return seqno;
>  }
>  
>  bool vmw_fence_obj_signaled(struct vmw_fence_obj *fence)
> @@ -778,7 +781,6 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device *dev, void *data,
>  		(struct drm_vmw_fence_signaled_arg *) data;
>  	struct ttm_base_object *base;
>  	struct vmw_fence_obj *fence;
> -	struct vmw_fence_manager *fman;
>  	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
>  	struct vmw_private *dev_priv = vmw_priv(dev);
>  
> @@ -787,14 +789,12 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device *dev, void *data,
>  		return PTR_ERR(base);
>  
>  	fence = &(container_of(base, struct vmw_user_fence, base)->fence);
> -	fman = fman_from_fence(fence);
>  
>  	arg->signaled = vmw_fence_obj_signaled(fence);
>  
>  	arg->signaled_flags = arg->flags;
> -	spin_lock(&fman->lock);
> -	arg->passed_seqno = dev_priv->last_read_seqno;
> -	spin_unlock(&fman->lock);
> +	arg->passed_seqno = READ_ONCE(dev_priv->last_read_seqno);
> +

Why are is the spinlock being removed here? As far as I understand it, READ_ONCE() will prevent
compiler optimizations that might change how the variable is read, but we would still need the
lock to synchronize access at runtime, since we are using that lock for write access when invoking
__vmw_fences_update(). Also, if we are using the spinlock, doesn't that make READ_ONCE() redundant?

>  
>  	ttm_base_object_unref(&base);
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
> index a7eee579c76a..10264dab5f6a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
> @@ -86,7 +86,7 @@ vmw_fence_obj_reference(struct vmw_fence_obj *fence)
>  	return fence;
>  }
>  
> -extern void vmw_fences_update(struct vmw_fence_manager *fman);
> +u32 vmw_fences_update(struct vmw_fence_manager *fman);
>  
>  extern bool vmw_fence_obj_signaled(struct vmw_fence_obj *fence);
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
> index 086e69a130d4..548ef2f86508 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
> @@ -123,16 +123,6 @@ static bool vmw_fifo_idle(struct vmw_private *dev_priv, uint32_t seqno)
>  	return (vmw_read(dev_priv, SVGA_REG_BUSY) == 0);
>  }
>  
> -void vmw_update_seqno(struct vmw_private *dev_priv)
> -{
> -	uint32_t seqno = vmw_fence_read(dev_priv);
> -
> -	if (dev_priv->last_read_seqno != seqno) {
> -		dev_priv->last_read_seqno = seqno;
> -		vmw_fences_update(dev_priv->fman);
> -	}
> -}
> -
>  bool vmw_seqno_passed(struct vmw_private *dev_priv,
>  			 uint32_t seqno)
>  {
> @@ -141,7 +131,7 @@ bool vmw_seqno_passed(struct vmw_private *dev_priv,
>  	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
>  		return true;
>  
> -	vmw_update_seqno(dev_priv);
> +	vmw_fences_update(dev_priv->fman);
>  	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
>  		return true;
>  


-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
