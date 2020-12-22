Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 827562E0AEB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC406E874;
	Tue, 22 Dec 2020 13:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F666E874
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:36:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d26so14523652wrb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kPFv3xDMdumAjRureCvUprT5OYHxF7qzWqV14nEyvfE=;
 b=OuTaDtXPACkbpnrNfuGcS95+udq9RPDLWxMUIteBZRPzjkfartVMAqdxuvVH6xS51q
 zy8mOHErGQGcQ+MFkzmExtTEt3BpGQgpX/YSa+QqBBlkG0RvG5Yg0kL3RaZh22zzFIzB
 3aFPjJViQg69x/3+gqbxSZ4QIvl6h8zkRARs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kPFv3xDMdumAjRureCvUprT5OYHxF7qzWqV14nEyvfE=;
 b=Em9G/XMRju1CqnVbfiSJRt7iprVOYRHjqM6kgaoOMyfK0BF0vk7krvzHEgSgCL8JOx
 L5XQjngFbEEyXmLoyGU67/fiYMs3UhOKhBNQ7MGFz4B/cqrtBmIKHi/PMlJHwi6kFVkv
 g74ZjtQeMNdI4U2+4Jz2q2OxP/0qCslhI5kw9yizUxaSUNENWm9wRV+TMYbkJmKhuyVs
 ogBDVqmz3+mtddIQLqONUDmjmz8yMuXOsO1mw0KTcVhJ93rV1bfkvShUtRE0ARTzF2sg
 emmJWZ8znMfP3lbr5yJFacal02pGLkJIy2CLxFCBswcMUaujt+NcV1OppAIM7+4ig3xr
 j86Q==
X-Gm-Message-State: AOAM530Qbu7UQNCQScVgcQPV5Ud4pwwqizwFr3DKYFGJglfuQJq2zJDP
 GlqbwHMbzzPybzL1QUOZauWD2Q==
X-Google-Smtp-Source: ABdhPJwv/clWxHJH44E1NyWkAC6g8UlEoRuStZHgIU8jTFvqpmyvNdGQk1oKpgG8ludYB3Wp1a4IwQ==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr17742334wrw.249.1608644184654; 
 Tue, 22 Dec 2020 05:36:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y13sm26810659wrl.63.2020.12.22.05.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 05:36:24 -0800 (PST)
Date: Tue, 22 Dec 2020 14:36:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/4] drm/ttm: add a debugfs file for the global page pools
Message-ID: <X+H2VjBi9eunvglO@phenom.ffwll.local>
References: <20201218175538.1364-1-christian.koenig@amd.com>
 <20201218175538.1364-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218175538.1364-2-christian.koenig@amd.com>
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

On Fri, Dec 18, 2020 at 06:55:36PM +0100, Christian K=F6nig wrote:
> Instead of printing this on the per device pool.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Hm shouldn't we remove this from radeon/amdgpu too and drop the
EXPORT_SYMBOL for ttm_pool_debugfs? I'm kinda confused why we still have
both ...
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
