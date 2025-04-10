Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5BCA84FBB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 00:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE3F10E030;
	Thu, 10 Apr 2025 22:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gu6dthzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2623910E030
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 22:38:30 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3fe83c8cbdbso380777b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 15:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1744324710; x=1744929510;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d0P2TlwIEf9kPuxNGAbmmgQ1sJXcR7ZE6PZRogbi8YQ=;
 b=gu6dthzLGcMDIKh7vWALgfdmlDooT7dMfRaL4AykQ06i3x8BXS9sPcWMR+QV6mWhub
 BSDaiTKkcuk0b+7rZ8TTJ+R33coUVRp/6eNspppPiyUpb85gEL84kuEeL4fB9HKyi6aA
 336FtY2PRPCPcRdFqUPxI4zxNCe8iuI5cx2Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744324710; x=1744929510;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d0P2TlwIEf9kPuxNGAbmmgQ1sJXcR7ZE6PZRogbi8YQ=;
 b=HREyp2isBzRX7Fw+bm/6x+D8bJ1IJEnzcYcEeL6yO/oEL8+Fg/i6j0ArxWkY1VubLW
 Kt2YQvXBkL0wiqTRVKnN7985qtw3uumRGARoIWBShirTmdmbLCvz6hdQpaxWkZHN6+Vi
 nDvhIfhKePlBbqwjd6fk63DgRZIqantfXG1Ruk+tWtmu7P1HOtLoqBieY0Xqs5IF65tF
 d2895Y3KQ7RLHw9pqD1gpOcZZIeborUnN37MmcORxDlXmc6EP9QI+TfIp6zFRtFPGFBc
 408QA1rhDi43o2e/YTyoA40WHt0c6G5I4cYwTTLBeCNPxVxBzMDLSXkvf7MBctpdxAdL
 ma5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9aIvhewuxYKP3Izr2rIH6WkoRPhAeRprb7bkfkgQOOFS6044wAMUAx4mAqtHkPMZHZaRXvSFhDOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqNwXsEhVrfO99OUGnRJ3o7qbf6S2ovrwvJuDR8bo/9uoB7HdA
 3+hyht7I1PIbb0XSgu1AznxfJj4ve4+Vy6IVDNQub/xUWqpa/wzWEa2ualhxpA==
X-Gm-Gg: ASbGncvqiUY3/b4+7B/WW1d3NrCyfrrh04P1I7cAfozGi6lskpQBOMumSIIn8+rHm19
 U+R69StMM4W0ktJRwiW4ytcoeND+ulXaf+NyVTJIfSnv+koRSnL58psyvlmfC0LnjzSQK9nU6x7
 qLekOyqREqWwoO0QbH9wHYYLoxQZfUUV+4hFgKyee4zrFJ4njZg3tUbheOJNn7zJdNr1dI6apmv
 AiBYuluk4D16jE3ZJb6tp5PGWHjeiHMqfJnJ+wICBNJfDo5F8wGDDnIBSKHZJq3LCPoyJ8GtoDp
 nTkzPe+qz47tI2gZML3AxuITTAWRRlDGCO1kHFYfRDjFlfiTeiAC6MXzr9wuouXczimGkXCAlOF
 Bw7ekgA==
X-Google-Smtp-Source: AGHT+IEMRDnu3JsZ5Oh+YKWXMO2OihdPbNJnBnCRX1S+x+Q0j2KqbjZhaujZ04eVQGUikUJfJ/8YQw==
X-Received: by 2002:a05:6808:1b2a:b0:3f9:8b5b:294c with SMTP id
 5614622812f47-400850e952emr255579b6e.31.1744324709774; 
 Thu, 10 Apr 2025 15:38:29 -0700 (PDT)
Received: from [10.211.247.102] ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-400762d486dsm724884b6e.24.2025.04.10.15.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 15:38:28 -0700 (PDT)
Message-ID: <59b5fdd4-9598-423a-9fa5-174e54228bab@broadcom.com>
Date: Thu, 10 Apr 2025 15:38:58 -0700
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

Should this be WRITE_ONCE(fman->dev_priv->last_read_seqno) = seqno ?

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
