Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55B26DA8C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 13:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D598D6E142;
	Thu, 17 Sep 2020 11:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517A46E142
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:42:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d4so1643639wmd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=E4xWlrXweruHlaAxgSevk7wBVFJ7f+2b4AClFBSKPeY=;
 b=YLSsJm8exuvfODWOb53dhcrD7GGg5Q8BlD3XFoZNiHE84krwWMRq7yDQJUoi2nl4UW
 fUV3XL4FIEDsQpcIZBRGCSTSArVU08ObjC5ouh46zp6HVKmx5E6uqvWqND/V4Va0+uhO
 PogPk0yJ+clLQ/XBjt6vWlbY7Zi6Q7nIzEZH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=E4xWlrXweruHlaAxgSevk7wBVFJ7f+2b4AClFBSKPeY=;
 b=MU6SGJwlL2/9KpA0DcK6XPr9eQtfefG83QpbyMca4ZQrpJBFOGq7yDHnNqL9ryJI3b
 kSJb7vMyh9K17iP8Xv4t2GZyBfQ/3PzMqUknxxemW2Gu6Wn8TTKxw5jy3FEE959RAkVA
 wjhnUcnwS5skTnAeZnkQx66Q5dAU1/RrgWVnIhrhmOxNAut4lygytvAwD2kV+TdUtk2h
 55/x8M3T/ul110vLMdrQNgYVgW7ACqd1Zc6OGe3AWWmroZK3gaEblpAochgnURxBbEnx
 OfHIIgUPfiGm2Mo2Q+57MQb73r5Hnclornj0ACOJ6eACvZt45RRy9l9EQzSG6kpXDqZU
 RveA==
X-Gm-Message-State: AOAM531nC2serEC8H1WhspF78zClGUDulFurY7wVYuSWI0vY/3O5Wnh1
 v6PGkCAPkxSzvCPqWdROeeYYtQ==
X-Google-Smtp-Source: ABdhPJyYywPki1icujqAvyzUeaAkpap1JWVOubPRx4Fm1O4x0JVl+OGMqSGvVFmKJIBN1rLrcIFpoQ==
X-Received: by 2002:a05:600c:2189:: with SMTP id
 e9mr9511533wme.8.1600342977995; 
 Thu, 17 Sep 2020 04:42:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a20sm10363039wmm.40.2020.09.17.04.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:42:57 -0700 (PDT)
Date: Thu, 17 Sep 2020 13:42:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: remove superflous extern attribute from funcs
Message-ID: <20200917114255.GV438822@phenom.ffwll.local>
References: <20200917094837.2787-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917094837.2787-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 11:48:37AM +0200, Christian K=F6nig wrote:
> Extern is the default attribute for functions anyway.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/ttm/ttm_execbuf_util.h | 19 ++++++++-----------
>  include/drm/ttm/ttm_memory.h       | 25 ++++++++++++-------------
>  2 files changed, 20 insertions(+), 24 deletions(-)
> =

> diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_exe=
cbuf_util.h
> index 5a19843bb80d..a99d7fdf2964 100644
> --- a/include/drm/ttm/ttm_execbuf_util.h
> +++ b/include/drm/ttm/ttm_execbuf_util.h
> @@ -58,9 +58,8 @@ struct ttm_validate_buffer {
>   * Undoes all buffer validation reservations for bos pointed to by
>   * the list entries.
>   */
> -
> -extern void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
> -				       struct list_head *list);
> +void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
> +				struct list_head *list);
>  =

>  /**
>   * function ttm_eu_reserve_buffers
> @@ -96,10 +95,9 @@ extern void ttm_eu_backoff_reservation(struct ww_acqui=
re_ctx *ticket,
>   * ttm_eu_fence_buffer_objects() when command submission is complete or
>   * has failed.
>   */
> -
> -extern int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
> -				  struct list_head *list, bool intr,
> -				  struct list_head *dups);
> +int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
> +			   struct list_head *list, bool intr,
> +			   struct list_head *dups);
>  =

>  /**
>   * function ttm_eu_fence_buffer_objects.
> @@ -113,9 +111,8 @@ extern int ttm_eu_reserve_buffers(struct ww_acquire_c=
tx *ticket,
>   * It also unreserves all buffers, putting them on lru lists.
>   *
>   */
> -
> -extern void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
> -					struct list_head *list,
> -					struct dma_fence *fence);
> +void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
> +				 struct list_head *list,
> +				 struct dma_fence *fence);
>  =

>  #endif
> diff --git a/include/drm/ttm/ttm_memory.h b/include/drm/ttm/ttm_memory.h
> index 2d468d7c94e6..c1f167881e33 100644
> --- a/include/drm/ttm/ttm_memory.h
> +++ b/include/drm/ttm/ttm_memory.h
> @@ -79,18 +79,17 @@ extern struct ttm_mem_global {
>  #endif
>  } ttm_mem_glob;
>  =

> -extern int ttm_mem_global_init(struct ttm_mem_global *glob);
> -extern void ttm_mem_global_release(struct ttm_mem_global *glob);
> -extern int ttm_mem_global_alloc(struct ttm_mem_global *glob, uint64_t me=
mory,
> +int ttm_mem_global_init(struct ttm_mem_global *glob);
> +void ttm_mem_global_release(struct ttm_mem_global *glob);
> +int ttm_mem_global_alloc(struct ttm_mem_global *glob, uint64_t memory,
> +			 struct ttm_operation_ctx *ctx);
> +void ttm_mem_global_free(struct ttm_mem_global *glob, uint64_t amount);
> +int ttm_mem_global_alloc_page(struct ttm_mem_global *glob,
> +			      struct page *page, uint64_t size,
> +			      struct ttm_operation_ctx *ctx);
> +void ttm_mem_global_free_page(struct ttm_mem_global *glob,
> +			      struct page *page, uint64_t size);
> +size_t ttm_round_pot(size_t size);
> +bool ttm_check_under_lowerlimit(struct ttm_mem_global *glob, uint64_t nu=
m_pages,
>  				struct ttm_operation_ctx *ctx);
> -extern void ttm_mem_global_free(struct ttm_mem_global *glob,
> -				uint64_t amount);
> -extern int ttm_mem_global_alloc_page(struct ttm_mem_global *glob,
> -				     struct page *page, uint64_t size,
> -				     struct ttm_operation_ctx *ctx);
> -extern void ttm_mem_global_free_page(struct ttm_mem_global *glob,
> -				     struct page *page, uint64_t size);
> -extern size_t ttm_round_pot(size_t size);
> -extern bool ttm_check_under_lowerlimit(struct ttm_mem_global *glob,
> -			uint64_t num_pages, struct ttm_operation_ctx *ctx);
>  #endif
> -- =

> 2.17.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
