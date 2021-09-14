Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62940B58E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 19:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD6589C9D;
	Tue, 14 Sep 2021 17:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B4189C9D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 17:04:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d6so21359289wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 10:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=s6NBKR7y7iR6nyMoIHrWCanthQm5/nplOlRlK5HkjxQ=;
 b=Eu2o4mosQzMA4qcdoIqmvS5dtfrxnUBmvXP+vlCuK9h7Tku1NUnXMFwfrI2Kby4v36
 6r2SN1eTzfpK+dm1b3QGzU1WqA8SYV71YO974fWKLjvVOdCbcSDqIcvjD7Lt0QVDYyzo
 tiPXOaEj9JcwfpeKaaZlRZm0KpSxZ/3rKzJN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s6NBKR7y7iR6nyMoIHrWCanthQm5/nplOlRlK5HkjxQ=;
 b=ntYUFuKgSsJ6M6QNEUBEV2jzPoZIRV+cZLd8uMxU9Kp/TRpC2oKu6jIbhNfoxpTQQ5
 YkFnMzkGl9zp3cvWaWDWndwaL04y+EwmHTV4fnZYIwFAgl4YWA4PzSdWJvgmqrU3RYmk
 7CTpf1VUCiDEHe/j93Pgo4nGQF8wj+cfXCtGSpMamapiYU0aEnv3smAGNeadD9JoYWEA
 rexqJHKCFCKtor02jlZZy/j1OnqE+ym2MEE0kS70MMDI9nz2UHHiD9qtbuv2RpdbbGR5
 N5Xr3npTXDughQspgM8tRObOERxoWZJfKjW6uX/stFwE5KpK0lTMojbR8vHk1bVVeLdJ
 uprQ==
X-Gm-Message-State: AOAM530U41mZRBr/4EBy7QpJ/+WB8MDR9Jio5gwnDbppGv1OzOz35uBD
 hApQufn9hEZwzYQq6nvtq/70dg==
X-Google-Smtp-Source: ABdhPJxm577Xn3MWr5qE/TxMJiVDmxQj0Go43zigyz9oIMcdgFVXnaqOY3josuoGrx90jJYkMC7fTw==
X-Received: by 2002:a5d:6590:: with SMTP id q16mr245393wru.52.1631639073700;
 Tue, 14 Sep 2021 10:04:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w14sm2269192wro.8.2021.09.14.10.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 10:04:32 -0700 (PDT)
Date: Tue, 14 Sep 2021 19:04:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, daniel@ffwll.ch
Subject: Re: [PATCH 01/14] dma-buf: add dma_resv_for_each_fence_unlocked
Message-ID: <YUDWHw19iUMfFr7K@phenom.ffwll.local>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 10, 2021 at 10:26:42AM +0200, Christian König wrote:
> Abstract the complexity of iterating over all the fences
> in a dma_resv object.
> 
> The new loop handles the whole RCU and retry dance and
> returns only fences where we can be sure we grabbed the
> right one.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 84fbe60629e3..213a9b7251ca 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
>  
> +/**
> + * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
> + * @obj: the dma_resv object
> + * @cursor: cursor to record the current position
> + * @all_fences: true returns also the shared fences
> + * @first: if we should start over
> + *
> + * Return all the fences in the dma_resv object which are not yet signaled.
> + * The returned fence has an extra local reference so will stay alive.
> + * If a concurrent modify is detected the whole iterator is started over again.
> + */
> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> +					 struct dma_resv_cursor *cursor,
> +					 bool all_fences, bool first)
> +{
> +	struct dma_fence *fence = NULL;
> +
> +	do {
> +		/* Drop the reference from the previous round */
> +		dma_fence_put(fence);
> +
> +		cursor->is_first = first;
> +		if (first) {
> +			cursor->seq = read_seqcount_begin(&obj->seq);
> +			cursor->index = -1;
> +			cursor->fences = dma_resv_shared_list(obj);
> +			cursor->is_exclusive = true;
> +
> +			fence = dma_resv_excl_fence(obj);
> +			if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +					      &fence->flags))
> +				fence = NULL;
> +		} else {
> +			fence = NULL;
> +		}
> +
> +		if (fence) {
> +			fence = dma_fence_get_rcu(fence);
> +		} else if (all_fences && cursor->fences) {
> +			struct dma_resv_list *fences = cursor->fences;
> +
> +			cursor->is_exclusive = false;
> +			while (++cursor->index < fences->shared_count) {
> +				fence = rcu_dereference(fences->shared[
> +							cursor->index]);
> +				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +					      &fence->flags))
> +					break;
> +			}
> +			if (cursor->index < fences->shared_count)
> +				fence = dma_fence_get_rcu(fence);
> +			else
> +				fence = NULL;
> +		}
> +
> +		/* For the eventually next round */
> +		first = true;
> +	} while (read_seqcount_retry(&obj->seq, cursor->seq));
> +
> +	return fence;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
> +
>  /**
>   * dma_resv_copy_fences - Copy all fences from src to dst.
>   * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 9100dd3dc21f..f5b91c292ee0 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -149,6 +149,39 @@ struct dma_resv {
>  	struct dma_resv_list __rcu *fence;
>  };
>  
> +/**
> + * struct dma_resv_cursor - current position into the dma_resv fences
> + * @seq: sequence number to check
> + * @index: index into the shared fences
> + * @shared: the shared fences
> + * @is_first: true if this is the first returned fence
> + * @is_exclusive: if the current fence is the exclusive one
> + */
> +struct dma_resv_cursor {
> +	unsigned int seq;
> +	unsigned int index;
> +	struct dma_resv_list *fences;
> +	bool is_first;
> +	bool is_exclusive;
> +};

A bit a bikeshed, but I think I'd be nice to align this with the other
iterators we have, e.g. for the drm_connector list.

So struct dma_resv_fence_iter, dma_resv_fence_iter_begin/next/end().

Also I think the for_each macro must not include begin/end calls. If we
include that then it saves 2 lines of code at the cost of a pile of
awkward bugs because people break; out of the loop or return early  (only
continue is safe) and we leak a fence. Or worse.

Explicit begin/end is much more robust at a very marginal cost imo.

Otherwise I think this fence iterator is a solid concept that yeah we
should roll out everywhere.
-Daniel

> +
> +/**
> + * dma_resv_for_each_fence_unlocked - fence iterator
> + * @obj: a dma_resv object pointer
> + * @cursor: a struct dma_resv_cursor pointer
> + * @all_fences: true if all fences should be returned
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object without holding the
> + * dma_resv::lock. The RCU read side lock must be hold when using this, but can
> + * be dropped and re-taken as necessary inside the loop. @all_fences controls
> + * if the shared fences are returned as well.
> + */
> +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
> +	for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
> +	     fence; dma_fence_put(fence),				    \
> +	     fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
> +
>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>  
> @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> +					 struct dma_resv_cursor *cursor,
> +					 bool first, bool all_fences);
>  int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>  			unsigned *pshared_count, struct dma_fence ***pshared);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
