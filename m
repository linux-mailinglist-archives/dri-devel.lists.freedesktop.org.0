Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5051C0B2
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62B310E191;
	Thu,  5 May 2022 13:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374C510E180
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 13:29:23 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j6so8709169ejc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ui21piTZ0ApfGLe6rSNYF+vmLdIPcNpHB647yaNJAEA=;
 b=GUYSMOZfibAtHewRxv7NXvJfooeNyLie4/C/2WhzfE1nZb66wcOaxp+lICUXVBORYe
 topja/IRIvJeuJTYG3rs0ab7/us7cJ5gwWYgW2ms4wIGyHjiP1g79yloC/utlJWo6cW/
 kBpNUgOtkT4bJPg5gjRorgiC9a2Opu0cDeSQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ui21piTZ0ApfGLe6rSNYF+vmLdIPcNpHB647yaNJAEA=;
 b=LRSkE3kLJ2lM5DSKksVhuQNAvs2UJazqkruTYOvbIygQiosJlNm2TlW4bu6i8npwdN
 qbef6a1KUtd+KGzzekZZfA7q7aisgqK8sIKcHoT1GZ6VheLvPLJ/ydrEow4pzVqQH8yA
 6sov4r36FbNF/3pc678njF/+ESSvKbLgKsBkNSot8rICJTYPBJ/5ki+cylEULKjFGain
 RvuqODNklmKpG1mlscXePc4OVLD55QW9YnTEl+pdWSbOy5Y6VfXK2BYFqOdk4uVcgDiy
 SNuuRpxmk893JEDrQkPaPLgrjpjehGxCKtZb4woW+9v9uqAbX60qcEClMuMtG7Y2Mcml
 uyqw==
X-Gm-Message-State: AOAM5327RPF4IvkGWWPry4RVqnamxxBl7wSW3qiMvw8hFltxdjD7wq5O
 Sw9B1tLlpimvgPS91Kat1+/n5fx8L1Cb/g==
X-Google-Smtp-Source: ABdhPJwRHjykKqfmXvKBcfez+gqf/TcR5Uph1IH55dlRwflfrsGd9ZGWVMc2tb/Xq5lMPmwUta9buA==
X-Received: by 2002:a17:907:7282:b0:6ef:f412:f7c4 with SMTP id
 dt2-20020a170907728200b006eff412f7c4mr25973036ejc.258.1651757361694; 
 Thu, 05 May 2022 06:29:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170906938a00b006f3ef214e68sm770067ejx.206.2022.05.05.06.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 06:29:21 -0700 (PDT)
Date: Thu, 5 May 2022 15:29:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest
Message-ID: <YnPRL7ndeh9z01mW@phenom.ffwll.local>
References: <20220504122256.1654-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504122256.1654-1-christian.koenig@amd.com>
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

On Wed, May 04, 2022 at 02:22:52PM +0200, Christian König wrote:
> The selftests, fix the error handling, remove unused functions and stop
> leaking memory in failed tests.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/st-dma-fence-unwrap.c | 40 +++++++++++----------------
>  1 file changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 039f016b57be..59628add93f5 100644
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
> @@ -113,7 +106,6 @@ static int sanitycheck(void *arg)
>  	if (!chain)
>  		return -ENOMEM;
>  
> -	dma_fence_signal(f);
>  	dma_fence_put(chain);
>  	return err;
>  }
> @@ -154,10 +146,10 @@ static int unwrap_array(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
> +	dma_fence_put(f1);
> +	dma_fence_put(f2);

I'm completely lost on why you add these _put() calls? The reference we
create all get transferred over to the container object, and that takes
care of releasing them.

The other bits with error handling and code cleanup all look good, and
dropping dma_fence_signal calls also makes sense. But this one I don't
get.
-Daniel

>  	dma_fence_put(array);
> -	return 0;
> +	return err;
>  }
>  
>  static int unwrap_chain(void *arg)
> @@ -196,10 +188,10 @@ static int unwrap_chain(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
> +	dma_fence_put(f1);
> +	dma_fence_put(f2);
>  	dma_fence_put(chain);
> -	return 0;
> +	return err;
>  }
>  
>  static int unwrap_chain_array(void *arg)
> @@ -242,10 +234,10 @@ static int unwrap_chain_array(void *arg)
>  		err = -EINVAL;
>  	}
>  
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
> +	dma_fence_put(f1);
> +	dma_fence_put(f2);
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
