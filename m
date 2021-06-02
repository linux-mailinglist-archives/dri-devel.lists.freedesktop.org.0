Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD3639939B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 21:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A326EE4F;
	Wed,  2 Jun 2021 19:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BA36EE4F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 19:35:29 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q5so3437991wrs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 12:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=K7N8MhJSPUEAtj3Y+TrLv0noK7r5l2LqG6bCmU1+PME=;
 b=FrufczjsCvhO+ry6JJQliDhq2dR46uHyVTOMD0wOcLNFTh+qe5rGjqrbfIpGP+ioiF
 RYETmrIiuO6TIxFRBQ2Uf9NyoY6oK7HF8bz/4PSdxK6XJQfTgwQ3JiSCx5z8sxJtwszk
 Fsqpd3vPrGGulF5agLgRzBK0nF9WFPH56B/lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K7N8MhJSPUEAtj3Y+TrLv0noK7r5l2LqG6bCmU1+PME=;
 b=aCW7ItmAgQs2PIbtWtF8XSbzapqPUyN2ijP6BHhAL+zhxus+ktLMjFFW6p/vAPduef
 8yKsUE5aUO9zgtfy6HyLfYWyPBXEmSyaLXb1j1VVJ+KpblwbPFlfAkfk9FQ2/OHqT6Bf
 0RKkAb1lK+pSrDwLDniTdwwsK/clWPPqu7bP19vBFLJop0P9tHTCFBHxiX/rc5S3goag
 wvjPRG1j9tRMvJOEw0WmHqNzKcGLzmR8Cbv/ZXE3LRiBSqOKsrEgIsGVFVWgzOJ/LgTe
 pWr59jyzIm3kAwiQckBxyJwjoB/AXvgEaNN6ikE9+cMSgBgxOGqIFWRhsomQPKQojRx9
 JePA==
X-Gm-Message-State: AOAM5324trGRgovGqY9HCJrGXgLfPm0tiUPopUZGmlu7Kz45DDQ1F7Mi
 Zi77VnZ9xY+c9bZLXxpp2aivFw==
X-Google-Smtp-Source: ABdhPJx1l/W5vimat08YSVfV0mJwBx/MSwmsCJiPC6MmTzRrOSodyI1TzdES0s3Bnbc/bFoCl8y+4w==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr17998868wru.338.1622662528600; 
 Wed, 02 Jun 2021 12:35:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o3sm909197wrm.78.2021.06.02.12.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 12:35:28 -0700 (PDT)
Date: Wed, 2 Jun 2021 21:35:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: fix inconsistent debug print v2
Message-ID: <YLfdfkK0JFVaa2b5@phenom.ffwll.local>
References: <20210602140359.272601-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602140359.272601-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 04:03:58PM +0200, Christian König wrote:
> Drop the whole rcu handling since we are holding the resv lock anyway.
> 
> v2: drop all rcu handling instead.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-buf.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index eadd1eaa2fb5..ee04fb442015 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1349,15 +1349,14 @@ EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> -	int ret;
>  	struct dma_buf *buf_obj;
>  	struct dma_buf_attachment *attach_obj;
>  	struct dma_resv *robj;
>  	struct dma_resv_list *fobj;
>  	struct dma_fence *fence;
> -	unsigned seq;
>  	int count = 0, attach_count, shared_count, i;
>  	size_t size = 0;
> +	int ret;
>  
>  	ret = mutex_lock_interruptible(&db_list.lock);
>  
> @@ -1383,33 +1382,25 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  				buf_obj->name ?: "");
>  
>  		robj = buf_obj->resv;
> -		while (true) {
> -			seq = read_seqcount_begin(&robj->seq);
> -			rcu_read_lock();
> -			fobj = rcu_dereference(robj->fence);
> -			shared_count = fobj ? fobj->shared_count : 0;
> -			fence = rcu_dereference(robj->fence_excl);
> -			if (!read_seqcount_retry(&robj->seq, seq))
> -				break;
> -			rcu_read_unlock();
> -		}
> -
> +		fence = rcu_dereference_protected(robj->fence_excl,
> +						  dma_resv_held(robj));
>  		if (fence)
>  			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
>  				   fence->ops->get_driver_name(fence),
>  				   fence->ops->get_timeline_name(fence),
>  				   dma_fence_is_signaled(fence) ? "" : "un");
> +
> +		fobj = rcu_dereference_protected(robj->fence,
> +						 dma_resv_held(robj));
> +		shared_count = fobj ? fobj->shared_count : 0;
>  		for (i = 0; i < shared_count; i++) {
> -			fence = rcu_dereference(fobj->shared[i]);
> -			if (!dma_fence_get_rcu(fence))
> -				continue;
> +			fence = rcu_dereference_protected(fobj->shared[i],
> +							  dma_resv_held(robj));
>  			seq_printf(s, "\tShared fence: %s %s %ssignalled\n",
>  				   fence->ops->get_driver_name(fence),
>  				   fence->ops->get_timeline_name(fence),
>  				   dma_fence_is_signaled(fence) ? "" : "un");
> -			dma_fence_put(fence);
>  		}
> -		rcu_read_unlock();
>  
>  		seq_puts(s, "\tAttached Devices:\n");
>  		attach_count = 0;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
