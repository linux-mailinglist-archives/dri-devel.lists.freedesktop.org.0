Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12E83423AF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 18:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6C76EA64;
	Fri, 19 Mar 2021 17:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E04C6EA64
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 17:52:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j18so9970301wra.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VnITPwiLrs7uBsWiTNoe0pSs7GaSKYi/Eq2/dCiQhiQ=;
 b=TqOF4ZCgrkuwRtFWvBL6YydLQvUCL48euFg1A9VL6cOkpDZhaZSlwxFceKb3NJUfDF
 YyNQQ8XuU/GZAuMuPTbE5n2ucra6N7lU5/TSJUxWh8Md7NEn+Eg6ge3qhqGnck2PeF3c
 DGlKgfqhdxZaHgH4btTrlQu5oAqylJ4TWuutg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VnITPwiLrs7uBsWiTNoe0pSs7GaSKYi/Eq2/dCiQhiQ=;
 b=kxaD8uhfSB3Hiv1+/zaiCPGyTCg6Cf1/aRYDJQi+Tz+Put9e4R9ooGWH5nzypuSDWD
 faDeQC4YjIz9jRQaY3ZXvhcWK/eWdUkhLW1tPRFQCYjJ7kgW4a9OCKqu9s4ggxMKHLMh
 j8fJlXZuHHs8wabHe2+S4WbXooD57x02AVRRsweSi7/SIh1vw5ub3b1Q4y/u/CRS5w8t
 nBeSNwEsMlxFh1Ha7cPYbpJRa3E4mPhaTb5u5x1lWDrktV1+01MvYmMSnybJGjY3Ep+7
 RWroEY1f8Mpr2XGhvWKpfLFuvTXwOoSCtlKD8Xgi3430/H98zheabZRJQMF2qk3OVvoe
 Xt7g==
X-Gm-Message-State: AOAM530pne4ucm/lcSRH+/1RvJpBhZblFIrBC0DhGRWheQvOIsVk5OFx
 1n2HjijlWzuHt/XGmvmK0w9JL5K7TkqhyZSZ
X-Google-Smtp-Source: ABdhPJyKhjd1TvLDdn9WLGmf01oJs5J3mm4FKIYxCYmQ2hGM9TN8O6qzCv5a4cQW0aUl83L6Odttwg==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr5803938wru.401.1616176343003; 
 Fri, 19 Mar 2021 10:52:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y16sm9145707wrh.3.2021.03.19.10.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 10:52:22 -0700 (PDT)
Date: Fri, 19 Mar 2021 18:52:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFTk1GSaUDI3wcWt@phenom.ffwll.local>
References: <20210319140857.2262-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319140857.2262-1-christian.koenig@amd.com>
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
Cc: Leo.Liu@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 03:08:57PM +0100, Christian K=F6nig wrote:
> Don't print a warning when we fail to allocate a page for swapping things=
 out.
> =

> Also rely on memalloc_nofs_save/memalloc_nofs_restore instead of GFP_NOFS.

Uh this part doesn't make sense. Especially since you only do it for the
debugfs file, not in general. Which means you've just completely broken
the shrinker.

If this is just to paper over the seq_printf doing the wrong allocations,
then just move that out from under the fs_reclaim_acquire/release part.

__GFP_NOWARN should be there indeed I think.
-Daniel

> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_tt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 2f0833c98d2c..86fa3e82dacc 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -369,7 +369,7 @@ static unsigned long ttm_tt_shrinker_scan(struct shri=
nker *shrink,
>  	};
>  	int ret;
>  =

> -	ret =3D ttm_bo_swapout(&ctx, GFP_NOFS);
> +	ret =3D ttm_bo_swapout(&ctx, GFP_KERNEL | __GFP_NOWARN);
>  	return ret < 0 ? SHRINK_EMPTY : ret;
>  }
>  =

> @@ -389,10 +389,13 @@ static unsigned long ttm_tt_shrinker_count(struct s=
hrinker *shrink,
>  static int ttm_tt_debugfs_shrink_show(struct seq_file *m, void *data)
>  {
>  	struct shrink_control sc =3D { .gfp_mask =3D GFP_KERNEL };
> +	unsigned int flags;
>  =

>  	fs_reclaim_acquire(GFP_KERNEL);
> +	flags =3D memalloc_nofs_save();
>  	seq_printf(m, "%lu/%lu\n", ttm_tt_shrinker_count(&mm_shrinker, &sc),
>  		   ttm_tt_shrinker_scan(&mm_shrinker, &sc));
> +	memalloc_nofs_restore(flags);
>  	fs_reclaim_release(GFP_KERNEL);
>  =

>  	return 0;
> -- =

> 2.25.1
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
