Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDFD2FB692
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 15:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7D46E33F;
	Tue, 19 Jan 2021 14:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196A96E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 14:02:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 6so12564309wri.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 06:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0f8tGYf+J4VdhT9bo37Eb7rA/qGTowJG/5+fOYGtP2M=;
 b=alTpGceNA1F5BzEzYLEjP3O3NIv5KFJVmvuIthoXQGREAQr2PwvMwzhwhFa7cKBzO/
 NMi5sI6LtjDcZQfLfGrE0f2XP9Cag5bxWoPt5lqkaXm9rCR9/zYh6gTsgLvmGcpIBogc
 sUAenojU1elXc5RLk9xPKDLsNqp8nFQwnepag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0f8tGYf+J4VdhT9bo37Eb7rA/qGTowJG/5+fOYGtP2M=;
 b=qhppEUR5yjWUqmxf+TPB1lyratWxwVuKl8CZFUFz1fSaoYlZSbjIaPt6LBhQVn9CCV
 yQvjLT0LULr/H6OEMqstdZw+9E1Hs9nrv+gSfxm67ERFqbm6g/y0OLTelgne2IGvK4xZ
 QW68vFyYtnMhl4uBr+sntiJR0wuoZJ9ljgfOSw0jphFMtOY3C3Iq1KXQemWYlcSwnnCf
 KqXNsMVkTjhPU6RTKc4Dn8gbgnXoETaAYu2h0TFoLEC0UFUCSphGtP79uzKYegmIjsMe
 JbgUkkxR3cActr5IUJ8/T7ZIoE8nvwB3bnx9p/1nOqzPMf/Y8DfUAJJZTxF57QczDlpp
 r6HA==
X-Gm-Message-State: AOAM530aiGZQMlPVLXINM+z+H8G81tDbXcCvxEHCbLMt82IjPp/VVbMR
 Tt0Rh07tgR4GaaJSksh57OSgan0i9vAYvg==
X-Google-Smtp-Source: ABdhPJzP73KTGjXjNyO74YGzWrBMNimL6gSFFQMOu+yL0drT4gn4y5UXDrxNJ2WUMAXgBmqTSVezzw==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr4586412wru.332.1611064973782; 
 Tue, 19 Jan 2021 06:02:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b7sm34813425wru.33.2021.01.19.06.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:02:53 -0800 (PST)
Date: Tue, 19 Jan 2021 15:02:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/4] drm/ttm: add a debugfs file for the global page pools
Message-ID: <YAbmi4h86TnV3yjR@phenom.ffwll.local>
References: <20210119121821.2320-1-christian.koenig@amd.com>
 <20210119121821.2320-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119121821.2320-2-christian.koenig@amd.com>
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

On Tue, Jan 19, 2021 at 01:18:19PM +0100, Christian K=F6nig wrote:
> Instead of printing this on the per device pool.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

btw I think ttm should also set up the per-bdev debugfs stuff, feels silly
having that boilerplate. Same for the per-ttm_manager thing we have I
think.
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 70 ++++++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 20 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 7b2f60616750..1d61e8fc0e81 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -42,6 +42,8 @@
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_tt.h>
>  =

> +#include "ttm_module.h"
> +
>  /**
>   * struct ttm_pool_dma - Helper object for coherent DMA mappings
>   *
> @@ -543,6 +545,17 @@ static unsigned int ttm_pool_type_count(struct ttm_p=
ool_type *pt)
>  	return count;
>  }
>  =

> +/* Print a nice header for the order */
> +static void ttm_pool_debugfs_header(struct seq_file *m)
> +{
> +	unsigned int i;
> +
> +	seq_puts(m, "\t ");
> +	for (i =3D 0; i < MAX_ORDER; ++i)
> +		seq_printf(m, " ---%2u---", i);
> +	seq_puts(m, "\n");
> +}
> +
>  /* Dump information about the different pool types */
>  static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>  				    struct seq_file *m)
> @@ -554,6 +567,35 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_=
type *pt,
>  	seq_puts(m, "\n");
>  }
>  =

> +/* Dump the total amount of allocated pages */
> +static void ttm_pool_debugfs_footer(struct seq_file *m)
> +{
> +	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
> +		   atomic_long_read(&allocated_pages), page_pool_size);
> +}
> +
> +/* Dump the information for the global pools */
> +static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
> +{
> +	ttm_pool_debugfs_header(m);
> +
> +	spin_lock(&shrinker_lock);
> +	seq_puts(m, "wc\t:");
> +	ttm_pool_debugfs_orders(global_write_combined, m);
> +	seq_puts(m, "uc\t:");
> +	ttm_pool_debugfs_orders(global_uncached, m);
> +	seq_puts(m, "wc 32\t:");
> +	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
> +	seq_puts(m, "uc 32\t:");
> +	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> +	spin_unlock(&shrinker_lock);
> +
> +	ttm_pool_debugfs_footer(m);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(ttm_pool_debugfs_globals);
> +
>  /**
>   * ttm_pool_debugfs - Debugfs dump function for a pool
>   *
> @@ -566,23 +608,9 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct s=
eq_file *m)
>  {
>  	unsigned int i;
>  =

> -	spin_lock(&shrinker_lock);
> -
> -	seq_puts(m, "\t ");
> -	for (i =3D 0; i < MAX_ORDER; ++i)
> -		seq_printf(m, " ---%2u---", i);
> -	seq_puts(m, "\n");
> -
> -	seq_puts(m, "wc\t:");
> -	ttm_pool_debugfs_orders(global_write_combined, m);
> -	seq_puts(m, "uc\t:");
> -	ttm_pool_debugfs_orders(global_uncached, m);
> -
> -	seq_puts(m, "wc 32\t:");
> -	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
> -	seq_puts(m, "uc 32\t:");
> -	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> +	ttm_pool_debugfs_header(m);
>  =

> +	spin_lock(&shrinker_lock);
>  	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>  		seq_puts(m, "DMA ");
>  		switch (i) {
> @@ -598,12 +626,9 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct s=
eq_file *m)
>  		}
>  		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
>  	}
> -
> -	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
> -		   atomic_long_read(&allocated_pages), page_pool_size);
> -
>  	spin_unlock(&shrinker_lock);
>  =

> +	ttm_pool_debugfs_footer(m);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_pool_debugfs);
> @@ -660,6 +685,11 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  				   ttm_uncached, i);
>  	}
>  =

> +#ifdef CONFIG_DEBUG_FS
> +	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
> +			    &ttm_pool_debugfs_globals_fops);
> +#endif
> +
>  	mm_shrinker.count_objects =3D ttm_pool_shrinker_count;
>  	mm_shrinker.scan_objects =3D ttm_pool_shrinker_scan;
>  	mm_shrinker.seeks =3D 1;
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
