Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1022EA0E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 12:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA7B89D4B;
	Mon, 27 Jul 2020 10:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8729189D46
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:30:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 88so14326442wrh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 03:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LsNHG1/GhLJMTVH18Ztnj0Fsv2V2mze0l5kAdE8XMK4=;
 b=hXFqEFMtyAybTMDemsyU6Fu/f5PnSNYeztGNEzs2YWMIQK4D9iIxr3+mR4Y8COUBaB
 UCJ/1REoOlRkX2feXXnImzDbSenJHFQV/BKaAwjhT5rBlYtI7vqAU3jb+gbD+2ROwDZD
 Q1jDPApw5yMdCp6ObZm0Xh5EGLUsp3Hzj1bMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LsNHG1/GhLJMTVH18Ztnj0Fsv2V2mze0l5kAdE8XMK4=;
 b=ImqhlBoxNd74wBjY4PzwevCRe9iBjRGwQhnUCGB7qz4EPUezJv58LToiVh1bxzKznb
 9nW8wYMYa9LfV88V5ldNbCvZneqZOryVZMPqOi1rNtZt7qAt4dtWlTzHdZvkjdrkq8y0
 ZHc7pfF7lk72lfDBbOqhRtCzw/Srjc+W4qAXfIKOTkR63AN9LCkc/G511fOqopSHztEn
 KVvqA1/Ka+xdIQ7LTWj1gYqltBiVP3hAdlb+bZdWSzZQ2zeae9zZqtv9WV0cBgkiO+AF
 +zo1dO5Uqc4wgevBVKlTIO09/bD6i1dDeQFgMMre9v//7PkzcdWsQv8PWW3H/l2ZqKvh
 q9CQ==
X-Gm-Message-State: AOAM531aaTzs4WbHIqLcgyIyvc2bwk8Iq7xismA8DzufEafYef0foPnM
 xHIRVK4v9MM1kGChcUs2uE0/oRpvcwE=
X-Google-Smtp-Source: ABdhPJxYfoTf3BTZKQaR+4sdsImFSno4MBBYfc1YaQHtN85JOwkHuWfO0+5jZExQKCp1MRcqBWh2wg==
X-Received: by 2002:adf:de09:: with SMTP id b9mr7083323wrm.409.1595845857982; 
 Mon, 27 Jul 2020 03:30:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 68sm12385693wra.39.2020.07.27.03.30.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 03:30:57 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:30:55 +0200
From: daniel@ffwll.ch
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/9] drm/radeon: stop implementing init_mem_type
Message-ID: <20200727103055.GS6419@phenom.ffwll.local>
References: <20200723151621.3536-1-christian.koenig@amd.com>
 <20200723151621.3536-3-christian.koenig@amd.com>
 <20200727103000.GR6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727103000.GR6419@phenom.ffwll.local>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 12:30:00PM +0200, daniel@ffwll.ch wrote:
> On Thu, Jul 23, 2020 at 05:16:15PM +0200, Christian K=F6nig wrote:
> > Instead just initialize the memory type parameters
> > before calling ttm_bo_init_mm.
> > =

> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> =

> Hm what's the motivation here? I do agree that the init_mem_type callback
> is rather midlayer-y (having a per-type cast in a callback is a very clear
> signal something with the layering is all busted). So removing this sounds
> like a good idea, but not really following why just for radeon? Or simply
> wip?

nvm, I've seen the next series :-) And Alex already r-b'ed it.
-Daniel
> =

> =

> =

> > ---
> >  drivers/gpu/drm/radeon/radeon_ttm.c | 70 ++++++++++++++---------------
> >  1 file changed, 35 insertions(+), 35 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> > index 9aba18a143e7..b0b59c553785 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -69,43 +69,43 @@ struct radeon_device *radeon_get_rdev(struct ttm_bo=
_device *bdev)
> >  static int radeon_init_mem_type(struct ttm_bo_device *bdev, uint32_t t=
ype,
> >  				struct ttm_mem_type_manager *man)
> >  {
> > -	struct radeon_device *rdev;
> > +	return 0;
> > +}
> >  =

> > -	rdev =3D radeon_get_rdev(bdev);
> > +static int radeon_ttm_init_vram(struct radeon_device *rdev)
> > +{
> > +	struct ttm_mem_type_manager *man =3D &rdev->mman.bdev.man[TTM_PL_VRAM=
];
> >  =

> > -	switch (type) {
> > -	case TTM_PL_SYSTEM:
> > -		/* System memory */
> > -		break;
> > -	case TTM_PL_TT:
> > -		man->func =3D &ttm_bo_manager_func;
> > -		man->available_caching =3D TTM_PL_MASK_CACHING;
> > -		man->default_caching =3D TTM_PL_FLAG_CACHED;
> > -		man->use_tt =3D true;
> > +	man->func =3D &ttm_bo_manager_func;
> > +	man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> > +	man->default_caching =3D TTM_PL_FLAG_WC;
> > +
> > +	return ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_VRAM,
> > +			      rdev->mc.real_vram_size >> PAGE_SHIFT);
> > +}
> > +
> > +static int radeon_ttm_init_gtt(struct radeon_device *rdev)
> > +{
> > +	struct ttm_mem_type_manager *man =3D &rdev->mman.bdev.man[TTM_PL_TT];
> > +
> > +	man->func =3D &ttm_bo_manager_func;
> > +	man->available_caching =3D TTM_PL_MASK_CACHING;
> > +	man->default_caching =3D TTM_PL_FLAG_CACHED;
> > +	man->use_tt =3D true;
> >  #if IS_ENABLED(CONFIG_AGP)
> > -		if (rdev->flags & RADEON_IS_AGP) {
> > -			if (!rdev->ddev->agp) {
> > -				DRM_ERROR("AGP is not enabled for memory type %u\n",
> > -					  (unsigned)type);
> > -				return -EINVAL;
> > -			}
> > -			man->available_caching =3D TTM_PL_FLAG_UNCACHED |
> > -						 TTM_PL_FLAG_WC;
> > -			man->default_caching =3D TTM_PL_FLAG_WC;
> > +	if (rdev->flags & RADEON_IS_AGP) {
> > +		if (!rdev->ddev->agp) {
> > +			DRM_ERROR("AGP is not enabled\n");
> > +			return -EINVAL;
> >  		}
> > -#endif
> > -		break;
> > -	case TTM_PL_VRAM:
> > -		/* "On-card" video ram */
> > -		man->func =3D &ttm_bo_manager_func;
> > -		man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> > +		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
> > +					 TTM_PL_FLAG_WC;
> >  		man->default_caching =3D TTM_PL_FLAG_WC;
> > -		break;
> > -	default:
> > -		DRM_ERROR("Unsupported memory type %u\n", (unsigned)type);
> > -		return -EINVAL;
> >  	}
> > -	return 0;
> > +#endif
> > +
> > +	return ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_TT,
> > +			      rdev->mc.gtt_size >> PAGE_SHIFT);
> >  }
> >  =

> >  static void radeon_evict_flags(struct ttm_buffer_object *bo,
> > @@ -778,8 +778,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
> >  		return r;
> >  	}
> >  	rdev->mman.initialized =3D true;
> > -	r =3D ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_VRAM,
> > -				rdev->mc.real_vram_size >> PAGE_SHIFT);
> > +
> > +	r =3D radeon_ttm_init_vram(rdev);
> >  	if (r) {
> >  		DRM_ERROR("Failed initializing VRAM heap.\n");
> >  		return r;
> > @@ -804,8 +804,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
> >  	}
> >  	DRM_INFO("radeon: %uM of VRAM memory ready\n",
> >  		 (unsigned) (rdev->mc.real_vram_size / (1024 * 1024)));
> > -	r =3D ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_TT,
> > -				rdev->mc.gtt_size >> PAGE_SHIFT);
> > +
> > +	r =3D radeon_ttm_init_gtt(rdev);
> >  	if (r) {
> >  		DRM_ERROR("Failed initializing GTT heap.\n");
> >  		return r;
> > -- =

> > 2.17.1
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
