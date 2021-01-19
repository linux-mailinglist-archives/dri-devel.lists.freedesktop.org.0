Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7082FB6BB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 15:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1E889C54;
	Tue, 19 Jan 2021 14:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDB089C54
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 14:07:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 190so16596870wmz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 06:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lzrjL4XCAzP8Ll9Y82bJJtjA1mC2dQjzYOfQMeHToZA=;
 b=JOEZY2HgZpLJvKXf2uzU4B56Fby6WVuuR+6cN8kp5t4UgdCmEmEAh5vt87kT+2er/x
 Ru7+PB05osULOpIZWUHGqttqcMGXo7xiGB0F+XDh9AJQq7QHfbbWFGcMI/EeLjGV1j7l
 3tffikDR6khnPg2rPC5YRplqme9jiAkAf6lh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lzrjL4XCAzP8Ll9Y82bJJtjA1mC2dQjzYOfQMeHToZA=;
 b=R9O7W6ew2hPGlJe9jlRP6FLhV8b0NZr9ZOVAfrpZ0hNkCgwkTtU9r3CJjwiLiQIdly
 n77IBQFS5t46xJPYBVyZSTF3cP5ldxVsYRwy55CZG06XSyfsx6ZqnC6ZX4AyMl7L1EWk
 BAJHYBz4JyPLCYMVFLah33njNHOEibr+SVmSmO0cYNXebYs7je4O9hq1JjmHZZRBd7Z3
 7vGSTMR9wYho6j2hLfNCv9Ie41XIRjejMhycWhuoC7ZXsK4lHmFVOk7oCAi2XgNta9EP
 McRrYLs83RM2zU605Ir4pUh/oNeHDzfHniy5eosNqxI2YixvnLOS6qrwXAiT4E5ldN2j
 WPUA==
X-Gm-Message-State: AOAM532hwTXeLtZTytSFoKW5AlEO4bg0MVCuGtqA0AcIXDm+R8dRdB7J
 2PtE/4Iz3JAoiUmIqAmEsJPuIg==
X-Google-Smtp-Source: ABdhPJwLGbbSOeDVWh0eQIZf2Nkh1YhikbYDZaHetmcG7sIie+YubfvBUQUHKqKpJ/tD7AebGy1hWQ==
X-Received: by 2002:a1c:9c01:: with SMTP id f1mr2932381wme.159.1611065266719; 
 Tue, 19 Jan 2021 06:07:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s6sm36521747wro.79.2021.01.19.06.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:07:45 -0800 (PST)
Date: Tue, 19 Jan 2021 15:07:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/4] drm/ttm: add debugfs entry to test pool shrinker v2
Message-ID: <YAbnsNFlGc/V9EYX@phenom.ffwll.local>
References: <20210119121821.2320-1-christian.koenig@amd.com>
 <20210119121821.2320-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119121821.2320-3-christian.koenig@amd.com>
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
Cc: ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 01:18:20PM +0100, Christian K=F6nig wrote:
> Useful for testing.
> =

> v2: add fs_reclaim_acquire()/_release()
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 53 ++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 18 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 1d61e8fc0e81..98ecb9c9842c 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -33,6 +33,7 @@
>  =

>  #include <linux/module.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/sched/mm.h>
>  =

>  #ifdef CONFIG_X86
>  #include <asm/set_memory.h>
> @@ -529,6 +530,28 @@ void ttm_pool_fini(struct ttm_pool *pool)
>  }
>  EXPORT_SYMBOL(ttm_pool_fini);
>  =

> +/* As long as pages are available make sure to release at least one */
> +static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
> +					    struct shrink_control *sc)
> +{
> +	unsigned long num_freed =3D 0;
> +
> +	do
> +		num_freed +=3D ttm_pool_shrink();
> +	while (!num_freed && atomic_long_read(&allocated_pages));
> +
> +	return num_freed;
> +}
> +
> +/* Return the number of pages available or SHRINK_EMPTY if we have none =
*/
> +static unsigned long ttm_pool_shrinker_count(struct shrinker *shrink,
> +					     struct shrink_control *sc)
> +{
> +	unsigned long num_pages =3D atomic_long_read(&allocated_pages);
> +
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  /* Count the number of pages available in a pool_type */
>  static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
> @@ -633,29 +656,21 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct =
seq_file *m)
>  }
>  EXPORT_SYMBOL(ttm_pool_debugfs);
>  =

> -#endif
> -
> -/* As long as pages are available make sure to release at least one */
> -static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
> -					    struct shrink_control *sc)
> +/* Test the shrinker functions and dump the result */
> +static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>  {
> -	unsigned long num_freed =3D 0;
> +	struct shrink_control sc =3D { .gfp_mask =3D GFP_NOFS };
>  =

> -	do
> -		num_freed +=3D ttm_pool_shrink();
> -	while (!num_freed && atomic_long_read(&allocated_pages));
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(&mm_shrinker, &sc),
> +		   ttm_pool_shrinker_scan(&mm_shrinker, &sc));
> +	fs_reclaim_release(GFP_KERNEL);
>  =

> -	return num_freed;
> +	return 0;
>  }
> +DEFINE_SHOW_ATTRIBUTE(ttm_pool_debugfs_shrink);

Shrinking everything is a bit a hammer, but probably the right size we
need for testing :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  =

> -/* Return the number of pages available or SHRINK_EMPTY if we have none =
*/
> -static unsigned long ttm_pool_shrinker_count(struct shrinker *shrink,
> -					     struct shrink_control *sc)
> -{
> -	unsigned long num_pages =3D atomic_long_read(&allocated_pages);
> -
> -	return num_pages ? num_pages : SHRINK_EMPTY;
> -}
> +#endif
>  =

>  /**
>   * ttm_pool_mgr_init - Initialize globals
> @@ -688,6 +703,8 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  #ifdef CONFIG_DEBUG_FS
>  	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
>  			    &ttm_pool_debugfs_globals_fops);
> +	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
> +			    &ttm_pool_debugfs_shrink_fops);
>  #endif
>  =

>  	mm_shrinker.count_objects =3D ttm_pool_shrinker_count;
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
