Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13A533D7E
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B9810EEE1;
	Wed, 25 May 2022 13:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D223D10EEE1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:16:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z15so6264414wrg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=r0OhdpMnZPonUb1erRhjQmUml1f0IxBmxKrI17luis4=;
 b=h7YbprmnpeIZZ26SVzv/b1EwBpJGobMO7U8PhiUGOcx+QbAx4fWLQF9p7DF2vVKKT5
 UaGN5CSTqqDehflhyxz3PcEPfSWX0X9uraBTDpd881XVMclONRBeDKrSkeKSAN79rmWs
 NzTz+9TFd8bNlJeG4F5/iw7WsPIFCQkVwa7+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r0OhdpMnZPonUb1erRhjQmUml1f0IxBmxKrI17luis4=;
 b=Ei/f3awQqZjne4yhRbMkwQdfP/haL1OHjtG/8iIZjxpfvLNU+1wfTukWXyOsLNlTsL
 iZ12/QwmS5E0/jNKz/QY6Yai4nDyeKFclnt+kMYxjO0PV/ZUUGyp2J3JmYYPCpjQISCV
 UUGD/0IKyD+Iz6pNU95Jl3FPPiQ0+9fMriPO9yqaJY17kaNJQziY6oxQi2ckr3a3/jle
 GO9FI7eHu1BTW432l96+22g6UU9zLc6TKYq7DtGgI6miO8vI11UDOxrev7UZPDaFW5vM
 FabTE47EuWtl65gHdJn+aGIQFDkm55jt4N6MRg4VckYlU6EoPlukcHX2+EEbd2ca0cFG
 nADg==
X-Gm-Message-State: AOAM533xt3vmjDOkdXZxP2SFGsOv/gH0BVmsccOQZzOPyY2bWO6hXk8p
 lZke1zNVuF4E442PHyo1FLaEKw==
X-Google-Smtp-Source: ABdhPJyxy62K0wlO3BgFoV8DWXZZ6jfNIKST1lMDM3VZf3IjnzBY9rODYX2n46PUIakz4u+QXJc+7A==
X-Received: by 2002:a5d:64c5:0:b0:20f:f372:13fd with SMTP id
 f5-20020a5d64c5000000b0020ff37213fdmr6001937wri.302.1653484576365; 
 Wed, 25 May 2022 06:16:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056000168400b0020d02cbbb87sm2213026wrd.16.2022.05.25.06.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 06:16:15 -0700 (PDT)
Date: Wed, 25 May 2022 15:16:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest v2
Message-ID: <Yo4sHQUP8IHdt4Kq@phenom.ffwll.local>
References: <20220506141009.18047-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220506141009.18047-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 04:10:05PM +0200, Christian König wrote:
> The selftests, fix the error handling, remove unused functions and stop
> leaking memory in failed tests.
> 
> v2: fix the memory leak correctly.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I'm still a bit lost on all this (maybe add an explainer why you want to
drop dma_fence_signal() - it's just not necessary for test functionality).

But I think it's at least correct now.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I've seen you've resent it to get intel-gfx-ci to look at it, so assuming
that's all fine I think it's now all reviewed and ready for merging.
-Daniel
> ---
>  drivers/dma-buf/st-dma-fence-unwrap.c | 48 +++++++++++----------------
>  1 file changed, 19 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 039f016b57be..e20c5a7dcfe4 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -4,27 +4,19 @@
>   * Copyright (C) 2022 Advanced Micro Devices, Inc.
>   */
>  
> +#include <linux/dma-fence.h>
> +#include <linux/dma-fence-array.h>
> +#include <linux/dma-fence-chain.h>
>  #include <linux/dma-fence-unwrap.h>
> -#if 0
> -#include <linux/kernel.h>
> -#include <linux/kthread.h>
> -#include <linux/mm.h>
> -#include <linux/sched/signal.h>
> -#include <linux/slab.h>
> -#include <linux/spinlock.h>
> -#include <linux/random.h>
> -#endif
>  
>  #include "selftest.h"
>  
>  #define CHAIN_SZ (4 << 10)
>  
> -static inline struct mock_fence {
> +struct mock_fence {
>  	struct dma_fence base;
>  	spinlock_t lock;
> -} *to_mock_fence(struct dma_fence *f) {
> -	return container_of(f, struct mock_fence, base);
> -}
> +};
>  
>  static const char *mock_name(struct dma_fence *f)
>  {
> @@ -45,7 +37,8 @@ static struct dma_fence *mock_fence(void)
>  		return NULL;
>  
>  	spin_lock_init(&f->lock);
> -	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
> +	dma_fence_init(&f->base, &mock_ops, &f->lock,
> +		       dma_fence_context_alloc(1), 1);
>  
>  	return &f->base;
>  }
> @@ -59,7 +52,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>  
>  	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>  	if (!fences)
> -		return NULL;
> +		goto error_put;
>  
>  	va_start(valist, num_fences);
>  	for (i = 0; i < num_fences; ++i)
> @@ -70,13 +63,17 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>  				       dma_fence_context_alloc(1),
>  				       1, false);
>  	if (!array)
> -		goto cleanup;
> +		goto error_free;
>  	return &array->base;
>  
> -cleanup:
> -	for (i = 0; i < num_fences; ++i)
> -		dma_fence_put(fences[i]);
> +error_free:
>  	kfree(fences);
> +
> +error_put:
> +	va_start(valist, num_fences);
> +	for (i = 0; i < num_fences; ++i)
> +		dma_fence_put(va_arg(valist, typeof(*fences)));
> +	va_end(valist);
>  	return NULL;
>  }
>  
> @@ -113,7 +110,6 @@ static int sanitycheck(void *arg)
>  	if (!chain)
>  		return -ENOMEM;
>  
> -	dma_fence_signal(f);
>  	dma_fence_put(chain);
>  	return err;
>  }
> @@ -154,10 +150,8 @@ static int unwrap_array(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
>  	dma_fence_put(array);
> -	return 0;
> +	return err;
>  }
>  
>  static int unwrap_chain(void *arg)
> @@ -196,10 +190,8 @@ static int unwrap_chain(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
>  	dma_fence_put(chain);
> -	return 0;
> +	return err;
>  }
>  
>  static int unwrap_chain_array(void *arg)
> @@ -242,10 +234,8 @@ static int unwrap_chain_array(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
>  	dma_fence_put(chain);
> -	return 0;
> +	return err;
>  }
>  
>  int dma_fence_unwrap(void)
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
