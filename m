Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD4B22E955
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 11:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD82389CD3;
	Mon, 27 Jul 2020 09:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8096789CD3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 09:42:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f18so14087668wml.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GB/KCEgv7RTHwdN4JDb4SCUn9EWus7FqItaLrwKqD9s=;
 b=jVNZ2aFb+8FORQNqOm34Qh+p7Fqh0FU/7j5UKGuOJ31Tci8B5C+bmqG4UfJ9nSEDQx
 uo5MDIAVMO2Bk0ud97jeTjDRavmQVK2beEEAS/DoZ/6FN5Ova7POItSY7gFpJNo4NwfD
 Se3KGOGTsb0nyBe81nYVLYtOwJtsHR+yTtT9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GB/KCEgv7RTHwdN4JDb4SCUn9EWus7FqItaLrwKqD9s=;
 b=XwhpYaQfESAnRLTCSYmpBN3/oIuEHRAFG8k64JvLKWA6aQapobWGZ5ldwVotzAZK7U
 7KVH/vkCIi7rFYjZbeAK8GVxnEFvOCvZk6N43uyOH/4bmpxl+TlUQchP6+V9VSdcBEBi
 5qyCwltq6uXBc1O4PQouwnMvzPj6DO01zlwAqj47Mao+XQ8gDNyHzDMnSL1HVwfHPmtP
 ayv7ZR66px1wkPJdkdpOZqVG9JIoO2em+zm5/RH4KUz69qBFKMgjkRYn9zb1mXewlvDa
 ogFakkQrsWbe9kxA72jKHk7/IVPh+Ze8HfNn3/pHuD2ToawXS5laLTuG3ewdm9iJrT9A
 aLPQ==
X-Gm-Message-State: AOAM531oVZ2SuG8yVitY8SgqldKrM2b9aT2AOF4MNVt3yXvugMKOZPcK
 u5LUX5AZk0VHV3exFzqpZfaKbA==
X-Google-Smtp-Source: ABdhPJyH2AuyelNCyvhiIks5eV18ZnhipJSRZnhUQ8vsrus8j474XXBdhF+mM4hdjsU2I3Ys+u7sgw==
X-Received: by 2002:a7b:c1c2:: with SMTP id a2mr12625578wmj.74.1595842974086; 
 Mon, 27 Jul 2020 02:42:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c25sm17909855wml.18.2020.07.27.02.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:42:53 -0700 (PDT)
Date: Mon, 27 Jul 2020 11:42:51 +0200
From: daniel@ffwll.ch
To: 
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/ttm: initialize the system domain with defaults
Message-ID: <20200727094251.GO6419@phenom.ffwll.local>
References: <20200723151621.3536-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723151621.3536-1-christian.koenig@amd.com>
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

On Thu, Jul 23, 2020 at 05:16:13PM +0200, Christian K=F6nig wrote:
> Instead of repeating that in each driver.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 3 ---
>  drivers/gpu/drm/drm_gem_vram_helper.c      | 3 ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c       | 3 ---
>  drivers/gpu/drm/qxl/qxl_ttm.c              | 3 ---
>  drivers/gpu/drm/radeon/radeon_ttm.c        | 3 ---
>  drivers/gpu/drm/ttm/ttm_bo.c               | 2 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 --
>  7 files changed, 2 insertions(+), 17 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 0dd5e802091d..e57c49a91b73 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -84,9 +84,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_TT:
>  		/* GTT memory  */
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_=
gem_vram_helper.c
> index 3296ed3df358..be177afdeb9a 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1009,9 +1009,6 @@ static int bo_driver_init_mem_type(struct ttm_bo_de=
vice *bdev, uint32_t type,
>  {
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  		man->func =3D &ttm_bo_manager_func;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 4ccf937df0d0..53af25020bb2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -655,9 +655,6 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, =
uint32_t type,
>  =

>  	switch (type) {
>  	case TTM_PL_SYSTEM:
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 1d8e07b8b19e..e9b8c921c1f0 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -54,9 +54,6 @@ static int qxl_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  	case TTM_PL_PRIV:
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index b474781a0920..b4cb75361577 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -76,9 +76,6 @@ static int radeon_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_TT:
>  		man->func =3D &ttm_bo_manager_func;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 7c02ce784805..1f1f9e463265 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1677,6 +1677,8 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
>  	 * Initialize the system memory buffer type.
>  	 * Other types need to be driver / IOCTL initialized.
>  	 */
> +	bdev->man[TTM_PL_SYSTEM].available_caching =3D TTM_PL_MASK_CACHING;
> +	bdev->man[TTM_PL_SYSTEM].default_caching =3D TTM_PL_FLAG_CACHED;
>  	ret =3D ttm_bo_init_mm(bdev, TTM_PL_SYSTEM, 0);
>  	if (unlikely(ret !=3D 0))
>  		goto out_no_sys;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_buffer.c
> index 1d78187eaba6..00cef1a3a178 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -742,8 +742,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *bd=
ev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->available_caching =3D TTM_PL_FLAG_CACHED;

Above is CACHED, not CACHING, so needs to stay to overwrite the default.
With that fixed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
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
