Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9893BC85C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E9289798;
	Tue,  6 Jul 2021 09:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02D089D02
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:14:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l5so8445380wrv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QQHReVgbAJM94wLZUFz0+eSyiiaxRNfGcxI1kidBsY4=;
 b=EfjHF9NxvF6Q0vKEcHqWXTa8ZY6zIncQI42xcXAk+fOEp61jEumZfjXNZKUtS9oqf0
 ngwBDmZJeNRe2Osj45Dqc42m/r+VV3CNRmyH49P9IZ1GLkjcCffMX3BtSYhsLGYEoK5R
 AEa9IsrMi+WOA9lWvDN8wBuC0W0MNrwsPThnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QQHReVgbAJM94wLZUFz0+eSyiiaxRNfGcxI1kidBsY4=;
 b=olqmQ5+z7k6ObJcX9M4/ZNeLy2hlrM1/F1rYifA9nNseUNqHRBAWQqYt6SGxNaLJwM
 uP2yXouXH+rhy2JS2IDNooIh25wJJBp0ZgkXf023zHnj3Y5pNkwHStnJMNAhqWb42YEc
 wXQFF6bLHMlZobnsCTbxrEbZZC11S7vZ+QZEkazgq4/iRbVXQIYjyfixDA1NdShtFMsm
 XiL3OnGgHn4auzGzvYxJOrqu/y8rAmgC5tEmS+O7kO8FsvkqJKC+5LeNV47lepAjodfz
 XMpDFWimZz5sewpktaoXjT5aW3dPuTUh8OdU6ofZzvRxBdU54YYQ0E1CVNHgsn1pjd/D
 ry2Q==
X-Gm-Message-State: AOAM533tjwRK5kNYgbA9BZUwClJ0ovkHiplNbSZzDu+Tpd55nEWD9LA4
 9KicBGZm22cX90GjhvOXsZcZcA==
X-Google-Smtp-Source: ABdhPJwSH0WZYVAcJqNBugwSnIXzKVbQbP9dXqCscctgGgyl+9X471ZjNkfqSNzJk4xXG2C7o1LPGw==
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr21363505wrr.361.1625562844454; 
 Tue, 06 Jul 2021 02:14:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm13429872wrz.89.2021.07.06.02.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 02:14:04 -0700 (PDT)
Date: Tue, 6 Jul 2021 11:14:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] dma-fence: export dma_fence_might_wait
Message-ID: <YOQe2fdqTzqyyV9L@phenom.ffwll.local>
References: <20210706090559.1589544-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706090559.1589544-1-matthew.auld@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 10:05:58AM +0100, Matthew Auld wrote:
> It might be useful for drivers to annotate a path where hitting the
> actual wait path might be difficult or unlikely through normal testing.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/dma-buf/dma-fence.c | 19 ++++++++++++++++---
>  include/linux/dma-fence.h   |  2 ++
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ce0f5eff575d..f2cd036b5243 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -335,6 +335,21 @@ void __dma_fence_might_wait(void)
>  }
>  #endif
>  
> +/**
> + * dma_fence_might_wait - entering a section which might wait on DMA fence
> + * critical section.
> + *
> + * This is also potentially useful for drivers to call directly, when annotating
> + * a path where hitting the actual wait path might be difficult or unlikely
> + * through normal testing.

Maybe also add a

"See also dma_fence_begin_signalling() and dma_fence_end_signalling."

here and a similar note the these two functions pointing at
dma_fence_might_wait()? I do like to link things together when there's a
group of functions.

With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + */
> +void dma_fence_might_wait(void)
> +{
> +	might_sleep();
> +	__dma_fence_might_wait();
> +}
> +EXPORT_SYMBOL(dma_fence_might_wait);
> +
>  
>  /**
>   * dma_fence_signal_timestamp_locked - signal completion of a fence
> @@ -495,9 +510,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>  	if (WARN_ON(timeout < 0))
>  		return -EINVAL;
>  
> -	might_sleep();
> -
> -	__dma_fence_might_wait();
> +	dma_fence_might_wait();
>  
>  	trace_dma_fence_wait_start(fence);
>  	if (fence->ops->wait)
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c6371..37bf4beed93f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -370,6 +370,8 @@ static inline void dma_fence_end_signalling(bool cookie) {}
>  static inline void __dma_fence_might_wait(void) {}
>  #endif
>  
> +void dma_fence_might_wait(void);
> +
>  int dma_fence_signal(struct dma_fence *fence);
>  int dma_fence_signal_locked(struct dma_fence *fence);
>  int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
> -- 
> 2.26.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
