Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D6227BA8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322E86E51C;
	Tue, 21 Jul 2020 09:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C077E6E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:24:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so2096334wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+kFwgEQ0u+QutyN0DraJp+TtaODFGI1C+5smsG/vgAs=;
 b=YmDdQ+ZQ0iCteeZnMpX9Inzq0zuk/bKvOeNDuDHQucgONghKzEpvA9KC5u0yHSQalv
 LwhcK0IH1+okCT7rJqkdz5gbKO17BWRe8ZP79/PnvpF9ZXuvFFNhnZHi1HhRIYITuQnW
 h4jTaLjAJ8e8VnuROL56U+PL6E3ZbwqILrjzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+kFwgEQ0u+QutyN0DraJp+TtaODFGI1C+5smsG/vgAs=;
 b=JJhQuQtGYV8xEv6/aQE4skLcTe1dm3DJIHifH1GAQIf4sgY6sfjtbHhNfcubBuSLqq
 U+JDK1DHgnXHCfZD3vU0x7h3mL7FRwx3uO3GxvrQ5Npn7V4tXuN4A8q81qEwo9lkXoZs
 MFbakl42oAU0B2x96LmVmPZkaV5NVLOn5FXV87GJZU0P1fiRHkZG71B0g16W5lLEjqpy
 CZIrTDvFLts6UgqboSCkToGzA77ecmi0fEr/+ZoLf6wrvsjKrFhyLw2H7IlaUOXSjFG1
 cVLoj9TTYInx7Al/DHZug32rYDWeM0InUcFPotLnp1NXyHXUw6T2Ekh6gfGxRv2OAV7x
 W28g==
X-Gm-Message-State: AOAM532Y0Lca5mm3wGxJdnfybSDEJYwkuvNVxtgrxxHPUABbVzD5Y/Fx
 /pkHE3bpqsV8MM+VO8v0S4hJ9NYnBXg=
X-Google-Smtp-Source: ABdhPJxAhuQ9X9OOkAS6LgR5K5iOjI2MDaSdmv4Q9kMI+ZtKyo3uSJ4+rlzZkyc144oJyheBAIallw==
X-Received: by 2002:a1c:ab84:: with SMTP id u126mr3061993wme.43.1595323490656; 
 Tue, 21 Jul 2020 02:24:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 88sm1408593wrk.43.2020.07.21.02.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:24:50 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:24:48 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 06/11] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Message-ID: <20200721092448.GE6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-6-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 09:32:40AM +0200, Christian K=F6nig wrote:
> The driver doesn't expose any not-mapable memory resources.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> =

> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 54af06df865b..b474781a0920 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -76,7 +76,7 @@ static int radeon_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -84,7 +84,7 @@ static int radeon_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  		man->func =3D &ttm_bo_manager_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  #if IS_ENABLED(CONFIG_AGP)
>  		if (rdev->flags & RADEON_IS_AGP) {
>  			if (!rdev->ddev->agp) {
> @@ -92,8 +92,6 @@ static int radeon_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  					  (unsigned)type);
>  				return -EINVAL;
>  			}
> -			if (!rdev->ddev->agp->cant_use_aperture)
> -				man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;

There is a bunch of agp drivers (alpha, ppc, that kind of stuff) with this
flag set. And radeon.ko did at least once work on these. And your patch to
disable agp only changes the default, it doesn't rip out the code.

So not sure your assumption here is correct.
-Daniel

>  			man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  						 TTM_PL_FLAG_WC;
>  			man->default_caching =3D TTM_PL_FLAG_WC;
> @@ -103,8 +101,7 @@ static int radeon_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED |
> -			     TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
>  		break;
> @@ -394,7 +391,6 @@ static int radeon_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>  =

>  static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct =
ttm_mem_reg *mem)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
>  	struct radeon_device *rdev =3D radeon_get_rdev(bdev);
>  =

>  	mem->bus.addr =3D NULL;
> @@ -402,8 +398,7 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_de=
vice *bdev, struct ttm_mem_
>  	mem->bus.size =3D mem->num_pages << PAGE_SHIFT;
>  	mem->bus.base =3D 0;
>  	mem->bus.is_iomem =3D false;
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
> -		return -EINVAL;
> +
>  	switch (mem->mem_type) {
>  	case TTM_PL_SYSTEM:
>  		/* system memory */
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
