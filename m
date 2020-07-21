Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22A6227BAC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED29089AE6;
	Tue, 21 Jul 2020 09:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8C789AE6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:26:05 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q15so2100717wmj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZvEUJccfuDv54N/o9pzUZ+hADm7Ppg9AGOdgFTOR1FA=;
 b=cThLU11opZJRaHI9RqlfB3kVzrdKUyAHN9MlXqC6fUjUrvAtHmpUcAjGePVM71fDk/
 daRXW5Pb4GK6hdDaCY+Q4NdsDkbECqBz1R9KcQNBjxFvVKbDKW6KrL3RN9lUJM9btXYR
 HHulXzAYUzzNe4lWMG0HoXR0PrDlMofBr2e9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZvEUJccfuDv54N/o9pzUZ+hADm7Ppg9AGOdgFTOR1FA=;
 b=DX9TuSdPijMfFzV/3O0JTf6Cw+8CG3dk34SfEZSn9YESMTj5QF60d3pJ3g327NVhfL
 UTO89BoGc+FiE1RReVl4LHKc8czyVVHsVC8NYYgiVtEk7Oe9MqXDV7lrF0DeHOO4Appl
 DHj5Oi0Gc8YXzytA6fzMJISYzovLUWenQmiRiqRqGGrZhsq+0DvvD81eq2ey6gefelCA
 PGZDR1yael7alPhc6jEPIYwmptAHi/4qrCVawTSif1kuNfJOrnE8a8oIYRJDyX8face2
 nxHd3WtoLFN5DYFTaWSS2Mh/gNB/HJgXtSgVhlCyOl6uO51EKTnTQGzxdNaR1A9YyUr6
 D5CA==
X-Gm-Message-State: AOAM532UApNVsD+0lgw0pJOqv/S9+wgPuNKDO989KoEGqC45OSQb3SNu
 TuQj2HW8SkX0sbccpW+9f31Fng==
X-Google-Smtp-Source: ABdhPJzyYiQZ5f3V6dMkfjr7SD4lpNoJ4odOP7c49HULumRG8USUYcZm8mrdSMnfe/BOqG5F6MwHLQ==
X-Received: by 2002:a1c:5a41:: with SMTP id o62mr3264490wmb.16.1595323564466; 
 Tue, 21 Jul 2020 02:26:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 133sm2998414wme.5.2020.07.21.02.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:26:03 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:26:02 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 07/11] drm/vmwgfx: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Message-ID: <20200721092602.GF6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-7-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-7-christian.koenig@amd.com>
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

On Tue, Jul 21, 2020 at 09:32:41AM +0200, Christian K=F6nig wrote:
> The driver doesn't expose any not-mapable memory resources.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_buffer.c
> index 6bea7548aee0..1d78187eaba6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -742,15 +742,13 @@ static int vmw_init_mem_type(struct ttm_bo_device *=
bdev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &vmw_thp_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED | TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -762,7 +760,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *bd=
ev, uint32_t type,
>  		 *  slots as well as the bo size.
>  		 */
>  		man->func =3D &vmw_gmrid_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -789,7 +786,6 @@ static int vmw_verify_access(struct ttm_buffer_object=
 *bo, struct file *filp)
>  =

>  static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm=
_mem_reg *mem)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
>  	struct vmw_private *dev_priv =3D container_of(bdev, struct vmw_private,=
 bdev);
>  =

>  	mem->bus.addr =3D NULL;
> @@ -797,8 +793,7 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_devic=
e *bdev, struct ttm_mem_reg
>  	mem->bus.offset =3D 0;
>  	mem->bus.size =3D mem->num_pages << PAGE_SHIFT;
>  	mem->bus.base =3D 0;
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
> -		return -EINVAL;
> +
>  	switch (mem->mem_type) {
>  	case TTM_PL_SYSTEM:
>  	case VMW_PL_GMR:
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
