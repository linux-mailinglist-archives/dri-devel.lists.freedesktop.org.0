Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271440F91D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 15:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FFA6E938;
	Fri, 17 Sep 2021 13:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19126E831
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 13:27:58 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u18so13453653wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ydYKoiCNR3tMjjohPoLG71dfg1oFq7e8AHlz1xRvboQ=;
 b=JjytxfUOVOPcH5ae10RPCHTOVconKwB6exJIpXgIIGqKVfMisOV/TwEz/tq8a157Mc
 0PBTn70B7Zaa2RW/UyTpQIfN44GJDg1aXcp+mgk/Neu9ZQ5Hf3MbJQJHrLUndwD0MH5W
 j6sDgAaNi1l1wYn3lLSVSYV3z4YgmeFzob+0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ydYKoiCNR3tMjjohPoLG71dfg1oFq7e8AHlz1xRvboQ=;
 b=HjumpiikjZ8LkyMojCuBM3xEVqjwYz01J9ptMg4BEGNp6ZUN1CivVdDZ2BdWJRWeiX
 fiJ6rzHBevuJgX5CN9lXahOoiLkvGSuNme3BtuegwIIKYwNV/wSEgMAzcWorEDmfV0B3
 tIBt3h2Ev6gyf6JzcSdTGF4/dqT9KvoXc8k1BCxrRSvKg2ocLLueV94bcInJOhp+oMtv
 qJc5tUwGGNBav55bVJ9D3Nck2TjTM6aNxdkDeVxpMWE8JB1isRp/y7WuT5b8u6jHoKeU
 koQXSAPGivXq/aVyJhjKri1Ryx4lEZWY3wHLNhGpzuMJt1U2EmzHjqCn0IZVJZqBkfqY
 8G3A==
X-Gm-Message-State: AOAM5327iBmLIJeN1SyaWINPRjnzaIEs30yxUkXIgwTdfgOugjcya55u
 9O0HkHo+OH6EIkQLvs3T6xOXIA==
X-Google-Smtp-Source: ABdhPJws1UiT6nLT/MqN2CRCSbuZJqdCwhF/fbAiECfsfkqu3Fsh+RcLGFhuEHbB21SUZTO0LDf8aw==
X-Received: by 2002:adf:a31a:: with SMTP id c26mr12348812wrb.307.1631885277433; 
 Fri, 17 Sep 2021 06:27:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g22sm9836723wmp.39.2021.09.17.06.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 06:27:56 -0700 (PDT)
Date: Fri, 17 Sep 2021 15:27:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: Re: [PATCH 02/26] dma-buf: add dma_resv_for_each_fence
Message-ID: <YUSX2+WP45XYmD2r@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-3-christian.koenig@amd.com>
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

On Fri, Sep 17, 2021 at 02:34:49PM +0200, Christian König wrote:
> A simpler version of the iterator to be used when the dma_resv object is
> locked.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 33 +++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   | 17 +++++++++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 3e77cad2c9d4..a3c79a99fb44 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -384,6 +384,39 @@ struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
>  }
>  EXPORT_SYMBOL_GPL(dma_resv_iter_walk_unlocked);
>  
> +/**
> + * dma_resv_iter_walk - walk over fences in a dma_resv obj
> + * @cursor: cursor to record the current position
> + * @first: if we should start over
> + *
> + * Return all the fences in the dma_resv object while holding the
> + * dma_resv::lock.
> + */
> +struct dma_fence *dma_resv_iter_walk(struct dma_resv_iter *cursor, bool first)
> +{
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->is_first = first;
> +	if (first) {
> +		struct dma_fence *fence;
> +
> +		cursor->index = -1;
> +		cursor->fences = dma_resv_shared_list(cursor->obj);
> +
> +		fence = dma_resv_excl_fence(cursor->obj);
> +		if (fence)
> +			return fence;
> +	}

I think you can still use the shared iter_begin/end functions even with my
suggestions for patch 1, but would mean changes here too.

> +
> +	if (!cursor->all_fences || !cursor->fences ||
> +	    ++cursor->index >= cursor->fences->shared_count)
> +		return NULL;
> +
> +	return rcu_dereference_protected(cursor->fences->shared[cursor->index],
> +					 dma_resv_held(cursor->obj));
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_walk);
> +
>  /**
>   * dma_resv_copy_fences - Copy all fences from src to dst.
>   * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 693d16117153..8c968f8c9d33 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -179,6 +179,7 @@ struct dma_resv_iter {
>  
>  struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
>  					      bool first);
> +struct dma_fence *dma_resv_iter_walk(struct dma_resv_iter *cursor, bool first);
>  
>  /**
>   * dma_resv_iter_begin - initialize a dma_resv_iter object
> @@ -233,6 +234,22 @@ static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
>  	for (fence = dma_resv_iter_walk_unlocked(cursor, true);		\
>  	     fence; fence = dma_resv_iter_walk_unlocked(cursor, false))
>  
> +/**
> + * dma_resv_for_each_fence - fence iterator
> + * @cursor: a struct dma_resv_iter pointer
> + * @obj: a dma_resv object pointer
> + * @all_fences: true if all fences should be returned
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object while holding the
> + * dma_resv::lock. @all_fences controls if the shared fences are returned as

&dma_resv.lock is how you reference struct members in kerneldoc. I think
you had this also in patch 1.

> + * well. The cursor initialisation is part of the iterator.

Please also link to the iter_begin/end functions here.

Aside from doc nits and obviously changes due to changes in patch 1 (if we
do them), this looks good.
-Daniel

> + */
> +#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
> +	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
> +	     fence = dma_resv_iter_walk(cursor, true); fence;	\
> +	     fence = dma_resv_iter_walk(cursor, false))
> +
>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
