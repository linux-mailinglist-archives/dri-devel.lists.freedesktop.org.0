Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3B2E0B03
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F586E875;
	Tue, 22 Dec 2020 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394E96E875
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:43:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q18so14591185wrn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CasKwMx9CHfVmSvFtXgypDqmUg4QDC7lWN0bpr0DK3M=;
 b=ClsIEnvNBw3HD3vlOjHXZmy5KQ94hlRa/GjcAtJsAZqqK9bRujnPP6GQ8WH0643yl8
 241FkhEJpRTJ6D/B7IhA5EQTBMyoLXjTk2qCHA5BgfDo55ZqcGWKp6xmTKZpZ3PiuDbj
 K9DIhnccwwDZ3/LLnlT81cROHu1Wv+I29IkuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CasKwMx9CHfVmSvFtXgypDqmUg4QDC7lWN0bpr0DK3M=;
 b=iwZR4xVU3rTyrPlQo2jmXYFAfvXOX7VgPgcKftnyu9h6euZSqu26xnVPeTsDsjk61g
 ++sLo4B8GikXX1Jrikk51TNDoJmaX1upB7SLtzAgw5/Ed40wtwHtKqKhS2DJMyis0tP2
 XERgQ26BJiLIBEf9GQRuWHM95UNOZXthkfpPJV+WstUDe/S6rBG7VUf9TluuGwofI2Ih
 X8QrUrAhZzgQNiAT7C3j3+2DKRX7/ZLpt6/0mQV+5Pzmx7Hq0GO2rFxyR/S8m2jvDe9b
 ZVvLOpzAq2ur3p4YjoeMvfXokL4t5Qu0xPp4pWhFKfXTKV0xnhQBXj6kLycmy5w9tyhH
 D9uw==
X-Gm-Message-State: AOAM533Nl1RzPbCYRkAafagg2CPKMXCitHIBvsz+nnFsZt/jVoh33zAl
 rTz7GB0P03I1VCotMjB/W7A/YQ==
X-Google-Smtp-Source: ABdhPJzv1x3wEYxJ3chp+f/LiDjTmHG0NshDOFwVjD248kTUvejRVUfk/SYbO7yu91gVBTNyO3xAvA==
X-Received: by 2002:adf:c454:: with SMTP id a20mr24168369wrg.314.1608644595919; 
 Tue, 22 Dec 2020 05:43:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l11sm31757851wrt.23.2020.12.22.05.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 05:43:15 -0800 (PST)
Date: Tue, 22 Dec 2020 14:43:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/4] drm/ttm: add debugfs entry to test pool shrinker
Message-ID: <X+H38fhQIDIuBjLW@phenom.ffwll.local>
References: <20201218175538.1364-1-christian.koenig@amd.com>
 <20201218175538.1364-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218175538.1364-3-christian.koenig@amd.com>
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

On Fri, Dec 18, 2020 at 06:55:37PM +0100, Christian K=F6nig wrote:
> Useful for testing.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 50 ++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 18 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 1d61e8fc0e81..1cdacd58753a 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -529,6 +529,28 @@ void ttm_pool_fini(struct ttm_pool *pool)
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
> @@ -633,29 +655,19 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct =
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
> +	struct shrink_control sc =3D { .gfp_mask =3D GFP_KERNEL };
>  =

> -	do
> -		num_freed +=3D ttm_pool_shrink();
> -	while (!num_freed && atomic_long_read(&allocated_pages));

Need to wrap this in fs_reclaim_acquire/release(), otherwise lockdep won't
connect the dots and the dedicated testing interface here isn't very
useful.

Also this is a bit a confusing interface, I'd expect the show function to
do the counting, and then the write function would try to write shrink as
many objects as requests with the _scan function.

Both should be annotated with fs_reclaim_acquire/release.

> +	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(&mm_shrinker, &sc),
> +		   ttm_pool_shrinker_scan(&mm_shrinker, &sc));
>  =

> -	return num_freed;
> +	return 0;
>  }
> +DEFINE_SHOW_ATTRIBUTE(ttm_pool_debugfs_shrink);
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
> @@ -688,6 +700,8 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  #ifdef CONFIG_DEBUG_FS
>  	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
>  			    &ttm_pool_debugfs_globals_fops);
> +	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
> +			    &ttm_pool_debugfs_shrink_fops);

I think an interface per pool would make more sense for dedicated testing.
I'm kinda wondering whether we shouldn't do this in mm/ for all shrinkers
by default, it's really quite neat for being able to test stuff.
-Daniel

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
