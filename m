Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ACE2A6A02
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 17:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9564089E2A;
	Wed,  4 Nov 2020 16:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5AD89E2A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:40:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so2920941wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ogM1mc3E22jjR/jVNjC6qqfeD/Jog1ZDdBC/6JnGSc0=;
 b=GNQBwNu7E9DGw11yVqD51d4b61QIdJRSjDu0MOQp2QuIzcrjBc5bezM9MPaCc1DSzt
 2lMxiF7VkH9K5g5rfLpnVgU9kxZ9Uby7Fbu7gvEaabbBBP7fHknms44CWWbmmHdfcETt
 Kn8IA21/zGrFesFuG+xoRfV7XoJU6z6dpI304=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ogM1mc3E22jjR/jVNjC6qqfeD/Jog1ZDdBC/6JnGSc0=;
 b=gQ+S3BsO4dGgAD+bvO3Y4RTrROvhfAGuGw9lLRSmbA/W2acZwPa/3/OOb4mliCqIob
 bLBhLrw169KQdNdtQx+BlksvTQQ2SjSj8rAdkXvs6XKg11kYdT8PhDFjzHyrSXup/pMb
 VbFcgXkGIi2DyQ46XhUA8dNdb7kBy+/uD2px/73+ywCnQg/cmyrSntiHmLrW1T/egWI6
 aL0h6u4TIDGw+bNUz+5Z2wa1B6yTwmK+3G+nvppptyWDcdgDGVFZRihD7VmxJVBjW+X9
 RWTRV8xijJksMJwJymoAImVkO1gY7sy2+tizwcDluKGlp/VWgfCOIm//58IRxZh9rTFR
 Nv0A==
X-Gm-Message-State: AOAM532Z1pBdvyUPv0HJ4Il19MOC/hHdwRbMlcNuDM969uoNO644frL9
 awCaQxeuTuXzTNNccqyZ3z3xKQ==
X-Google-Smtp-Source: ABdhPJzZHuGaMU2WakW/CHUoJAqWPWk7NHh4IVToDzCoHxH2BzAZVtiqyWQF0jDDMZimDLPLnND6cA==
X-Received: by 2002:a1c:dd41:: with SMTP id u62mr5343179wmg.78.1604508015390; 
 Wed, 04 Nov 2020 08:40:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c2sm2962925wmf.47.2020.11.04.08.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:40:14 -0800 (PST)
Date: Wed, 4 Nov 2020 17:40:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/4] drm/prime: document that use the page array is
 deprecated v3
Message-ID: <20201104164012.GO401619@phenom.ffwll.local>
References: <20201104130024.264974-1-christian.koenig@amd.com>
 <20201104130024.264974-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104130024.264974-4-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 02:00:24PM +0100, Christian K=F6nig wrote:
> We have reoccurring requests on this so better document that
> this approach doesn't work and dma_buf_mmap() needs to be used instead.
> =

> v2: split it into two functions
> v3: rebased on latest changes
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  9 ++-
>  drivers/gpu/drm/drm_prime.c                 | 64 +++++++++++++--------
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c      |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c               |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c        |  5 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c          |  3 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c         |  9 ++-
>  drivers/gpu/drm/vgem/vgem_drv.c             |  3 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c     |  4 +-
>  include/drm/drm_prime.h                     |  7 ++-
>  11 files changed, 60 insertions(+), 51 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index d6781b479839..b151c28de978 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1036,8 +1036,8 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_=
device *bdev,
>  		goto release_sg;
>  =

>  	/* convert SG to linear array of pages and dma addresses */
> -	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
> -					 ttm->num_pages);
> +	drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
> +				       ttm->num_pages);
>  =

>  	return 0;
>  =

> @@ -1382,9 +1382,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_dev=
ice *bdev,
>  			ttm->sg =3D sgt;
>  		}
>  =

> -		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
> -						 gtt->ttm.dma_address,
> -						 ttm->num_pages);
> +		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
> +					       ttm->num_pages);
>  		return 0;
>  	}
>  =

> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index a7b61c2d9190..d181a5de101b 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -984,44 +984,58 @@ struct drm_gem_object *drm_gem_prime_import(struct =
drm_device *dev,
>  EXPORT_SYMBOL(drm_gem_prime_import);
>  =

>  /**
> - * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page ar=
ray
> + * drm_prime_sg_to_page_array - convert an sg table into a page array
>   * @sgt: scatter-gather table to convert
> - * @pages: optional array of page pointers to store the page array in
> - * @addrs: optional array to store the dma bus address of each page
> + * @pages: array of page pointers to store the pages in
> + * @max_entries: size of the passed-in array
> + *
> + * Exports an sg table into an array of pages.
> + *
> + * This function is deprecated and strongly discouraged to be used.
> + * The page array is only useful for page faults and those can corrupt f=
ields
> + * in the struct page if they are not handled by the exporting driver.

I think this should have a

"Use dma_buf_mmap() to redirect userspace memory mappings to the exporter,
and dma_buf_vmap() and dma_buf_vunmap() for cpu access."

> + */
> +int __deprecated drm_prime_sg_to_page_array(struct sg_table *sgt,

The __deprecated here does nothing I think, and in headers it's frowned
upon because it just causes warnings no one fixes anyway.

Otherwise lgtm, and it pretty much means that if we can cut these drivers
over to gem shmem helpers, then problems should be all solved, since I
fixed the helpers already.

With the nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +					    struct page **pages,
> +					    int max_entries)
> +{
> +	struct sg_page_iter page_iter;
> +	struct page **p =3D pages;
> +
> +	for_each_sgtable_page(sgt, &page_iter, 0) {
> +		if (WARN_ON(p - pages >=3D max_entries))
> +			return -1;
> +		*p++ =3D sg_page_iter_page(&page_iter);
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_prime_sg_to_page_array);
> +
> +/**
> + * drm_prime_sg_to_dma_addr_array - convert an sg table into a dma addr =
array
> + * @sgt: scatter-gather table to convert
> + * @addrs: array to store the dma bus address of each page
>   * @max_entries: size of both the passed-in arrays
>   *
> - * Exports an sg table into an array of pages and addresses. This is cur=
rently
> - * required by the TTM driver in order to do correct fault handling.
> + * Exports an sg table into an array of addresses.
>   *
> - * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
> + * Drivers should use this in their &drm_driver.gem_prime_import_sg_table
>   * implementation.
>   */
> -int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page *=
*pages,
> -				     dma_addr_t *addrs, int max_entries)
> +int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *add=
rs,
> +				   int max_entries)
>  {
>  	struct sg_dma_page_iter dma_iter;
> -	struct sg_page_iter page_iter;
> -	struct page **p =3D pages;
>  	dma_addr_t *a =3D addrs;
>  =

> -	if (pages) {
> -		for_each_sgtable_page(sgt, &page_iter, 0) {
> -			if (WARN_ON(p - pages >=3D max_entries))
> -				return -1;
> -			*p++ =3D sg_page_iter_page(&page_iter);
> -		}
> -	}
> -	if (addrs) {
> -		for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
> -			if (WARN_ON(a - addrs >=3D max_entries))
> -				return -1;
> -			*a++ =3D sg_page_iter_dma_address(&dma_iter);
> -		}
> +	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
> +		if (WARN_ON(a - addrs >=3D max_entries))
> +			return -1;
> +		*a++ =3D sg_page_iter_dma_address(&dma_iter);
>  	}
> -
>  	return 0;
>  }
> -EXPORT_SYMBOL(drm_prime_sg_to_page_addr_arrays);
> +EXPORT_SYMBOL(drm_prime_sg_to_dma_addr_array);
>  =

>  /**
>   * drm_prime_gem_destroy - helper to clean up a PRIME-imported GEM object
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gem_prime.c
> index 135fbff6fecf..8c04b8e8054c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -133,8 +133,7 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_ta=
ble(struct drm_device *dev,
>  		goto fail;
>  	}
>  =

> -	ret =3D drm_prime_sg_to_page_addr_arrays(sgt, etnaviv_obj->pages,
> -					       NULL, npages);
> +	ret =3D drm_prime_sg_to_page_array(sgt, etnaviv_obj->pages, npages);
>  	if (ret)
>  		goto fail;
>  =

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index cdd1a6e61564..339854338f7e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -258,7 +258,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj)
>  	if (!mtk_gem->pages)
>  		goto out;
>  =

> -	drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npages);
> +	drm_prime_sg_to_page_array(sgt, mtk_gem->pages, npages);
>  =

>  	mtk_gem->kvaddr =3D vmap(mtk_gem->pages, npages, VM_MAP,
>  			       pgprot_writecombine(PAGE_KERNEL));
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 311721ceee50..f995cb02b63d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1180,7 +1180,7 @@ struct drm_gem_object *msm_gem_import(struct drm_de=
vice *dev,
>  		goto fail;
>  	}
>  =

> -	ret =3D drm_prime_sg_to_page_addr_arrays(sgt, msm_obj->pages, NULL, npa=
ges);
> +	ret =3D drm_prime_sg_to_page_array(sgt, msm_obj->pages, npages);
>  	if (ret) {
>  		mutex_unlock(&msm_obj->lock);
>  		goto fail;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index c1847cf87952..615f6abbd3a9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1317,9 +1317,8 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
>  		return 0;
>  =

>  	if (slave && ttm->sg) {
> -		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
> -						 ttm_dma->dma_address,
> -						 ttm->num_pages);
> +		drm_prime_sg_to_dma_addr_array(ttm->sg, ttm_dma->dma_address,
> +					       ttm->num_pages);
>  		return 0;
>  	}
>  =

> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm=
/omap_gem.c
> index f063f5a04fb0..3adf23042d9d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -1323,8 +1323,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct d=
rm_device *dev, size_t size,
>  		}
>  =

>  		omap_obj->pages =3D pages;
> -		ret =3D drm_prime_sg_to_page_addr_arrays(sgt, pages, NULL,
> -						       npages);
> +		ret =3D drm_prime_sg_to_page_array(sgt, pages, npages);
>  		if (ret) {
>  			omap_gem_free_object(obj);
>  			obj =3D ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index f41fcee35f70..750d1bae9f1f 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -494,8 +494,8 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_de=
vice *bdev, struct ttm_tt *
>  	if (r)
>  		goto release_sg;
>  =

> -	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
> -					 ttm->num_pages);
> +	drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
> +				       ttm->num_pages);
>  =

>  	return 0;
>  =

> @@ -673,9 +673,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_devic=
e *bdev,
>  	}
>  =

>  	if (slave && ttm->sg) {
> -		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
> -						 gtt->ttm.dma_address,
> -						 ttm->num_pages);
> +		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
> +					       ttm->num_pages);
>  		return 0;
>  	}
>  =

> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_=
drv.c
> index ea0eecae5153..e505e5a291b3 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -356,8 +356,7 @@ static struct drm_gem_object *vgem_prime_import_sg_ta=
ble(struct drm_device *dev,
>  	}
>  =

>  	obj->pages_pin_count++; /* perma-pinned */
> -	drm_prime_sg_to_page_addr_arrays(obj->table, obj->pages, NULL,
> -					npages);
> +	drm_prime_sg_to_page_array(obj->table, obj->pages, npages);
>  	return &obj->base;
>  }
>  =

> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xe=
n/xen_drm_front_gem.c
> index 4f34ef34ba60..c937ef4e437e 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -220,8 +220,8 @@ xen_drm_front_gem_import_sg_table(struct drm_device *=
dev,
>  =

>  	xen_obj->sgt_imported =3D sgt;
>  =

> -	ret =3D drm_prime_sg_to_page_addr_arrays(sgt, xen_obj->pages,
> -					       NULL, xen_obj->num_pages);
> +	ret =3D drm_prime_sg_to_page_array(sgt, xen_obj->pages,
> +					 xen_obj->num_pages);
>  	if (ret < 0)
>  		return ERR_PTR(ret);
>  =

> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 0991a47a1567..54f2c58305d2 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -105,8 +105,9 @@ struct drm_gem_object *drm_gem_prime_import(struct dr=
m_device *dev,
>  =

>  void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *=
sg);
>  =

> -int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page *=
*pages,
> -				     dma_addr_t *addrs, int max_pages);
> -
> +int drm_prime_sg_to_page_array(struct sg_table *sgt, struct page **pages,
> +			       int max_pages);
> +int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *add=
rs,
> +				   int max_pages);
>  =

>  #endif /* __DRM_PRIME_H__ */
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
