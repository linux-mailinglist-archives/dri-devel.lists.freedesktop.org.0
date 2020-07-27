Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F177822EA0B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 12:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2431689CF5;
	Mon, 27 Jul 2020 10:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB5289AC6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:30:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c80so13675385wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=W8AaadcPCs4BGQBmS4Hqqno1D/OMdbD8nHHofUmZYxE=;
 b=TmFU2z56oXsOh4kk7NypxArgsiKaCpfintbb4Q0mxB7JHcIP8JeP/ZHz8gh8IFKzfd
 q9pLRVMIVaK2rWWy5T8YI+Sa4lRrmKsVZgAmf337e8xpiSCVCeia1agrDnH+srtatPap
 DtbF2MGe04fWoJ+cn9GtbLilT1tMslzuFwyWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=W8AaadcPCs4BGQBmS4Hqqno1D/OMdbD8nHHofUmZYxE=;
 b=l0C1macF0F4tB7oURkQ2AxYhnb/m75G3obhzwgqwm6YIpoI3Sy+Y7l+b79vY/bwsa2
 NcSU7LlGZUVOPpPOsoyBWVOE1gWd0BFghcLDau4D1YJ4JDr/OLSdo70Gy0shSyeWbphS
 CrGvpHP7i/lxYnTKJSm+8Ynk4gDR9PLTcn8X6IUyzuV2J23eDQX+QnXJ1o6l0I1vY9iJ
 h4c2vZk03ydsN/2Q6cSWxHNLOFfS+BFUvhx7mnqezfkoYDpbE31sVg8deSJ948sND8jn
 acj5Kbbk1ncpL2wSkvYQuvRCnGRrngqwMolxJCPLwLodJ0O2UHzLS2PPQCor3qyIAtDk
 aR0Q==
X-Gm-Message-State: AOAM5306rd4HXD5I/UVzB3Sn3YyCQMkfpmDGQvwK3qeGm6HTiCSmwKQj
 7k5VRWpnDx5MAiwoVRsrX8ypSg==
X-Google-Smtp-Source: ABdhPJzay1HdUIAq7vWiJ7cBxl1DLeXjPzLwYlksO/66E/iJMTPjNhE6TgOLqt0p+b83zNtUnSF8tQ==
X-Received: by 2002:a7b:c40a:: with SMTP id k10mr2835726wmi.127.1595845803398; 
 Mon, 27 Jul 2020 03:30:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c25sm17015949wml.46.2020.07.27.03.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 03:30:02 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:30:00 +0200
From: daniel@ffwll.ch
To: 
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/9] drm/radeon: stop implementing init_mem_type
Message-ID: <20200727103000.GR6419@phenom.ffwll.local>
References: <20200723151621.3536-1-christian.koenig@amd.com>
 <20200723151621.3536-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723151621.3536-3-christian.koenig@amd.com>
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

On Thu, Jul 23, 2020 at 05:16:15PM +0200, Christian K=F6nig wrote:
> Instead just initialize the memory type parameters
> before calling ttm_bo_init_mm.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Hm what's the motivation here? I do agree that the init_mem_type callback
is rather midlayer-y (having a per-type cast in a callback is a very clear
signal something with the layering is all busted). So removing this sounds
like a good idea, but not really following why just for radeon? Or simply
wip?
-Daniel



> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 70 ++++++++++++++---------------
>  1 file changed, 35 insertions(+), 35 deletions(-)
> =

> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 9aba18a143e7..b0b59c553785 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -69,43 +69,43 @@ struct radeon_device *radeon_get_rdev(struct ttm_bo_d=
evice *bdev)
>  static int radeon_init_mem_type(struct ttm_bo_device *bdev, uint32_t typ=
e,
>  				struct ttm_mem_type_manager *man)
>  {
> -	struct radeon_device *rdev;
> +	return 0;
> +}
>  =

> -	rdev =3D radeon_get_rdev(bdev);
> +static int radeon_ttm_init_vram(struct radeon_device *rdev)
> +{
> +	struct ttm_mem_type_manager *man =3D &rdev->mman.bdev.man[TTM_PL_VRAM];
>  =

> -	switch (type) {
> -	case TTM_PL_SYSTEM:
> -		/* System memory */
> -		break;
> -	case TTM_PL_TT:
> -		man->func =3D &ttm_bo_manager_func;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->use_tt =3D true;
> +	man->func =3D &ttm_bo_manager_func;
> +	man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> +	man->default_caching =3D TTM_PL_FLAG_WC;
> +
> +	return ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_VRAM,
> +			      rdev->mc.real_vram_size >> PAGE_SHIFT);
> +}
> +
> +static int radeon_ttm_init_gtt(struct radeon_device *rdev)
> +{
> +	struct ttm_mem_type_manager *man =3D &rdev->mman.bdev.man[TTM_PL_TT];
> +
> +	man->func =3D &ttm_bo_manager_func;
> +	man->available_caching =3D TTM_PL_MASK_CACHING;
> +	man->default_caching =3D TTM_PL_FLAG_CACHED;
> +	man->use_tt =3D true;
>  #if IS_ENABLED(CONFIG_AGP)
> -		if (rdev->flags & RADEON_IS_AGP) {
> -			if (!rdev->ddev->agp) {
> -				DRM_ERROR("AGP is not enabled for memory type %u\n",
> -					  (unsigned)type);
> -				return -EINVAL;
> -			}
> -			man->available_caching =3D TTM_PL_FLAG_UNCACHED |
> -						 TTM_PL_FLAG_WC;
> -			man->default_caching =3D TTM_PL_FLAG_WC;
> +	if (rdev->flags & RADEON_IS_AGP) {
> +		if (!rdev->ddev->agp) {
> +			DRM_ERROR("AGP is not enabled\n");
> +			return -EINVAL;
>  		}
> -#endif
> -		break;
> -	case TTM_PL_VRAM:
> -		/* "On-card" video ram */
> -		man->func =3D &ttm_bo_manager_func;
> -		man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> +		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
> +					 TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
> -		break;
> -	default:
> -		DRM_ERROR("Unsupported memory type %u\n", (unsigned)type);
> -		return -EINVAL;
>  	}
> -	return 0;
> +#endif
> +
> +	return ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_TT,
> +			      rdev->mc.gtt_size >> PAGE_SHIFT);
>  }
>  =

>  static void radeon_evict_flags(struct ttm_buffer_object *bo,
> @@ -778,8 +778,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
>  		return r;
>  	}
>  	rdev->mman.initialized =3D true;
> -	r =3D ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_VRAM,
> -				rdev->mc.real_vram_size >> PAGE_SHIFT);
> +
> +	r =3D radeon_ttm_init_vram(rdev);
>  	if (r) {
>  		DRM_ERROR("Failed initializing VRAM heap.\n");
>  		return r;
> @@ -804,8 +804,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
>  	}
>  	DRM_INFO("radeon: %uM of VRAM memory ready\n",
>  		 (unsigned) (rdev->mc.real_vram_size / (1024 * 1024)));
> -	r =3D ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_TT,
> -				rdev->mc.gtt_size >> PAGE_SHIFT);
> +
> +	r =3D radeon_ttm_init_gtt(rdev);
>  	if (r) {
>  		DRM_ERROR("Failed initializing GTT heap.\n");
>  		return r;
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
