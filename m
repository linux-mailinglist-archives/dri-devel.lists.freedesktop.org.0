Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C139899C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920556EC4E;
	Wed,  2 Jun 2021 12:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350966EC4E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:33:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g18so701445edq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BJeePl5cUfJEBPGSl3E+GKOvoESsrfS0hwpK1cLcFSg=;
 b=ET0cS8aGaIULDC3BOE2BjHeJdAa1Z3AIYRMigpZ2R2uMQn/2YB3XKfVjOaXbTcZHar
 KjhE9UUYHQwOMTx5vndWrOAc634HA6lViOuaI/Z/v1BvOyt8X4vMAbiAfOTWD/OJ5zve
 /KzxD39pEUqJWpUKmUL3j+/5VfDZhgx5ONdXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BJeePl5cUfJEBPGSl3E+GKOvoESsrfS0hwpK1cLcFSg=;
 b=mUt/Ib7iI0K2EDQeVl0qb45QSD8e11u0QzYrSApsBc5Dmv9A+62HtWGUP37QpHyE/D
 lount9E7cu+i20d+u5arpnh/kr59aR19FCp2xPhN6bd2swjv4cvIwK2Q/40hd63zIo6z
 XGDpTBeLdEgr/zL7D6RlPB/OBKEFg14So93V42MAdtu1Y7ekBw9LWAZl+4uRTkkG3tO3
 W5gVQsFeyBEpZCMDATJlB07iuKqNqDNRVrKrnZ/2FmfAu8u3rGe4eo0zHz9DJaredjhv
 5vZG3NFP+YXiZiq6m776ZMGTMHz+Bjk8i4OXSYqwc86PcODSiYXc4iQ/y4/cRwKySgub
 G5Bg==
X-Gm-Message-State: AOAM530LRVwDRA3tZtI0aqdVVVr6V4oh01daDxz0G9QdYNc07gCqur0P
 oMGwKOGRv0hUL5t4DxPlA5SW0Q==
X-Google-Smtp-Source: ABdhPJx+kWulmatwT8az1BiUnJ1aegENH8q30c9cD3tsjgrgOgshOfiJdOjw0sZKna11XmEWFkSmrA==
X-Received: by 2002:aa7:d28a:: with SMTP id w10mr9208886edq.23.1622637206628; 
 Wed, 02 Jun 2021 05:33:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id au11sm4182557ejc.88.2021.06.02.05.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 05:33:25 -0700 (PDT)
Date: Wed, 2 Jun 2021 14:33:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/7] dma-buf: fix inconsistent debug print
Message-ID: <YLd6k+LIHLja07V9@phenom.ffwll.local>
References: <20210602111714.212426-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602111714.212426-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 01:17:08PM +0200, Christian König wrote:
> The code tries to acquire the rcu protected fence list, but then ignores
> individual fences which have been modified while holding the rcu.
> 
> Stop that madness and just note cleanly that the list was concurrently modified.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Yeah it's debugfs, it's better not to be fancy here and if you race you
can just re-grab it all.

What's worse, we do grab the dma_resv_lock, which means no one should be
able to race with us. I think 100% right thing here is actually to drop
the rcu_read_lock too, and switch over to rcu_dereference_protected().

And also drop the seqcount check, that would be a bug. seqcount is only
to get a consistent snapshot of all fences on the read (i.e. protected by
rcu only) section. We hold the write lock with dma_resv_lock here.

Cheers, Daniel

> ---
>  drivers/dma-buf/dma-buf.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index eadd1eaa2fb5..d3b4e370dbc1 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1383,22 +1383,17 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
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
> +		seq = read_seqcount_begin(&robj->seq);
> +		rcu_read_lock();
> +		fence = rcu_dereference(robj->fence_excl);
>  		if (fence)
>  			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
>  				   fence->ops->get_driver_name(fence),
>  				   fence->ops->get_timeline_name(fence),
>  				   dma_fence_is_signaled(fence) ? "" : "un");
> +
> +		fobj = rcu_dereference(robj->fence);
> +		shared_count = fobj ? fobj->shared_count : 0;
>  		for (i = 0; i < shared_count; i++) {
>  			fence = rcu_dereference(fobj->shared[i]);
>  			if (!dma_fence_get_rcu(fence))
> @@ -1410,6 +1405,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  			dma_fence_put(fence);
>  		}
>  		rcu_read_unlock();
> +		if (read_seqcount_retry(&robj->seq, seq))
> +			seq_printf(s, "\tFences concurrently modified\n");
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
