Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BB04F5E6D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44E010E0CF;
	Wed,  6 Apr 2022 13:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA1910E0CF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 13:00:57 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id bg10so4128753ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CTVwFcuPlU62mklPZVVhhdEBtoqHYr+MxSweLYPJ5vc=;
 b=Mz9/DQ8xlFkL6N5RQr2nHyLI10IjIp95F1ObEE0e3/rFTV9BSHbv26E4p3R/qX5FSF
 apcXsNyiHhgLOHkbfF74DSu+CEkeloqVEIOSVQ6bEvEez971mY2jYtUKx31jRk2tUA10
 OTXZl1LvTNE5rYXsdeIktH9ixvTHzt2AOjbls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CTVwFcuPlU62mklPZVVhhdEBtoqHYr+MxSweLYPJ5vc=;
 b=e7Mg4uoKW9a1lt1LEj0TeTHK2Xd/ZHlKVo7KVASOOnkT6wr6ACpM1RUOI9ozau6ZgS
 kIt8lPQJ7eER7bQZP6btBlX2QcV3UwXRJ+kcck9BqKmRLDkbrceYvWwNM8TjTgSWXiR/
 5V6XAWfcMiFSvW8xMITTL53YiqZN4gzd0RtNlQsBv8IWLdLoEfT5CV3tHqFrwaFtNsot
 NpH4kc1rEISItax1DKkdYbQB5t6oZlDof/h0ew2hK/5q6UawVwLbVTBCsdfQbrJS4i86
 /uZ4Fi61TqCZSv4H37HC0ecPg+EWibA9ZQXCUldPpd77T4v4Lh0RHrRQ0IxHXA/q7A5L
 uJCQ==
X-Gm-Message-State: AOAM532VLZ3/Dwodz8f3rnDnL3l1/jC9ThhNPZT0NPBjA+xJYxqiBN1A
 wqaZeKWP6uhVk3t3czkiCR8ZdoEsqj4gONT9GN4=
X-Google-Smtp-Source: ABdhPJy5WtCMQMNz9apCLERrSKbqt+9uKNaGlPaH9zCkIq/5LvORaKJI2odS6FCGeOfCSiQcxXk89w==
X-Received: by 2002:a17:907:c02:b0:6df:fb64:2770 with SMTP id
 ga2-20020a1709070c0200b006dffb642770mr8443109ejc.221.1649250055724; 
 Wed, 06 Apr 2022 06:00:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 dn4-20020a17090794c400b006dbec4f4acbsm6621244ejc.6.2022.04.06.06.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 06:00:54 -0700 (PDT)
Date: Wed, 6 Apr 2022 15:00:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 16/16] dma-buf: drop seq count based update
Message-ID: <Yk2PBcG1MAMFpaUV@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-17-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-17-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 09:51:32AM +0200, Christian König wrote:
> This should be possible now since we don't have the distinction
> between exclusive and shared fences any more.
> 
> The only possible pitfall is that a dma_fence would be reused during the
> RCU grace period, but even that could be handled with a single extra check.

At worst this means we wait a bit longer than a perfect snapshot. For
anything where this would have resulted in dependency loops you need to
take the ww_mutex anyway.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c    | 33 ++++++++++++---------------------
>  drivers/dma-buf/st-dma-resv.c |  2 +-
>  include/linux/dma-resv.h      | 12 ------------
>  3 files changed, 13 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 5b64aa554c36..0cce6e4ec946 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -133,7 +133,6 @@ static void dma_resv_list_free(struct dma_resv_list *list)
>  void dma_resv_init(struct dma_resv *obj)
>  {
>  	ww_mutex_init(&obj->lock, &reservation_ww_class);
> -	seqcount_ww_mutex_init(&obj->seq, &obj->lock);

This removes the last user, and I don't think we'll add one. Please also
add a patch to remove the seqcount_ww_mutex stuff and cc locking/rt folks
on this.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	RCU_INIT_POINTER(obj->fences, NULL);
>  }
> @@ -292,28 +291,24 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
>  	fobj = dma_resv_fences_list(obj);
>  	count = fobj->num_fences;
>  
> -	write_seqcount_begin(&obj->seq);
> -
>  	for (i = 0; i < count; ++i) {
>  		enum dma_resv_usage old_usage;
>  
>  		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
>  		if ((old->context == fence->context && old_usage >= usage) ||
> -		    dma_fence_is_signaled(old))
> -			goto replace;
> +		    dma_fence_is_signaled(old)) {
> +			dma_resv_list_set(fobj, i, fence, usage);
> +			dma_fence_put(old);
> +			return;
> +		}
>  	}
>  
>  	BUG_ON(fobj->num_fences >= fobj->max_fences);
> -	old = NULL;
>  	count++;
>  
> -replace:
>  	dma_resv_list_set(fobj, i, fence, usage);
>  	/* pointer update must be visible before we extend the num_fences */
>  	smp_store_mb(fobj->num_fences, count);
> -
> -	write_seqcount_end(&obj->seq);
> -	dma_fence_put(old);
>  }
>  EXPORT_SYMBOL(dma_resv_add_fence);
>  
> @@ -341,7 +336,6 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>  	dma_resv_assert_held(obj);
>  
>  	list = dma_resv_fences_list(obj);
> -	write_seqcount_begin(&obj->seq);
>  	for (i = 0; list && i < list->num_fences; ++i) {
>  		struct dma_fence *old;
>  
> @@ -352,14 +346,12 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>  		dma_resv_list_set(list, i, replacement, usage);
>  		dma_fence_put(old);
>  	}
> -	write_seqcount_end(&obj->seq);
>  }
>  EXPORT_SYMBOL(dma_resv_replace_fences);
>  
>  /* Restart the unlocked iteration by initializing the cursor object. */
>  static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>  {
> -	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
>  	cursor->index = 0;
>  	cursor->num_fences = 0;
>  	cursor->fences = dma_resv_fences_list(cursor->obj);
> @@ -388,8 +380,10 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>  				    cursor->obj, &cursor->fence,
>  				    &cursor->fence_usage);
>  		cursor->fence = dma_fence_get_rcu(cursor->fence);
> -		if (!cursor->fence)
> -			break;
> +		if (!cursor->fence) {
> +			dma_resv_iter_restart_unlocked(cursor);
> +			continue;
> +		}
>  
>  		if (!dma_fence_is_signaled(cursor->fence) &&
>  		    cursor->usage >= cursor->fence_usage)
> @@ -415,7 +409,7 @@ struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
>  	do {
>  		dma_resv_iter_restart_unlocked(cursor);
>  		dma_resv_iter_walk_unlocked(cursor);
> -	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
> +	} while (dma_resv_fences_list(cursor->obj) != cursor->fences);
>  	rcu_read_unlock();
>  
>  	return cursor->fence;
> @@ -438,13 +432,13 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
>  
>  	rcu_read_lock();
>  	cursor->is_restarted = false;
> -	restart = read_seqcount_retry(&cursor->obj->seq, cursor->seq);
> +	restart = dma_resv_fences_list(cursor->obj) != cursor->fences;
>  	do {
>  		if (restart)
>  			dma_resv_iter_restart_unlocked(cursor);
>  		dma_resv_iter_walk_unlocked(cursor);
>  		restart = true;
> -	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
> +	} while (dma_resv_fences_list(cursor->obj) != cursor->fences);
>  	rcu_read_unlock();
>  
>  	return cursor->fence;
> @@ -540,10 +534,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>  	}
>  	dma_resv_iter_end(&cursor);
>  
> -	write_seqcount_begin(&dst->seq);
>  	list = rcu_replace_pointer(dst->fences, list, dma_resv_held(dst));
> -	write_seqcount_end(&dst->seq);
> -
>  	dma_resv_list_free(list);
>  	return 0;
>  }
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index 8ace9e84c845..813779e3c9be 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -217,7 +217,7 @@ static int test_for_each_unlocked(void *arg)
>  		if (r == -ENOENT) {
>  			r = -EINVAL;
>  			/* That should trigger an restart */
> -			cursor.seq--;
> +			cursor.fences = (void*)~0;
>  		} else if (r == -EINVAL) {
>  			r = 0;
>  		}
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 1db759eacc98..c8ccbc94d5d2 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -155,15 +155,6 @@ struct dma_resv {
>  	 */
>  	struct ww_mutex lock;
>  
> -	/**
> -	 * @seq:
> -	 *
> -	 * Sequence count for managing RCU read-side synchronization, allows
> -	 * read-only access to @fences while ensuring we take a consistent
> -	 * snapshot.
> -	 */
> -	seqcount_ww_mutex_t seq;
> -
>  	/**
>  	 * @fences:
>  	 *
> @@ -202,9 +193,6 @@ struct dma_resv_iter {
>  	/** @fence_usage: the usage of the current fence */
>  	enum dma_resv_usage fence_usage;
>  
> -	/** @seq: sequence number to check for modifications */
> -	unsigned int seq;
> -
>  	/** @index: index into the shared fences */
>  	unsigned int index;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
