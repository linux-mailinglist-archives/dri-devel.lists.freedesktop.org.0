Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B396B288EBE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 18:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDAE6ED3D;
	Fri,  9 Oct 2020 16:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FFD6ED3D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 16:24:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y12so5543341wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=8A9JRNiHu6JNwMmochbxtTllf1xc/YR7bJPHBj6HZC4=;
 b=I6CumvnuIAkhA36z8zFnx630UJjLpBoLMT8plEkX9/qH7tSx/yqdeC5/tETeteyHzv
 LNaxb2Nwp7xj9hWALC7XpiM6HsSS4aHuOA8AY+E0/AIoKnjbCJ4MgFGItNN0yPA6D+1U
 2GEHJy3T49qS37RelOiD/hpVfLV1msWKB+6ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=8A9JRNiHu6JNwMmochbxtTllf1xc/YR7bJPHBj6HZC4=;
 b=R6xVwHPQl+MwvYEu6/9RHgnaQcWmuXpGCOAYf+2vqlPfAloLc7Y441voNz+W9Rkg4s
 A/fVOrWrj+5O4XpkfoAWos6IMFb32WW/0KKygmNvZL2/UpEeNx6oABEhWUu/RrPyx4Nk
 UXVk4Imxh+orv0TEDKhBt86dzfZCjLQBSHqWcWhm9C3XQmFIL63Zt/32VleS1iIp8p+n
 95Rp3zgm2uDN9WByFD7HapWpSQ8MrURwUwtp3LF/tQGjbbqGImcQTy2sEvUu+t3KJd+T
 frQROdvFOO4RjKnzkdxLXneFWmSdbJ00iWuSCsa/nyMsj5wIGvaL9Gh+vFZRx2NoEITy
 xttQ==
X-Gm-Message-State: AOAM531W8ONec0ad2ySoeVrgX6pWXyTP0P3eUYhX64d0RsKZGzqGWfmF
 +KdHvywhY4cbKjHPIORcxFySrw==
X-Google-Smtp-Source: ABdhPJzJ/E+dwPZ+qB2asDHJ4sUfbuVsUqXDSKeZekHXhRZqUh+hlziY6Yu/svpmF7pjjCgTY1Joww==
X-Received: by 2002:a5d:6a0a:: with SMTP id m10mr7217354wru.189.1602260687177; 
 Fri, 09 Oct 2020 09:24:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g83sm12224145wmf.15.2020.10.09.09.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 09:24:46 -0700 (PDT)
Date: Fri, 9 Oct 2020 18:24:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 6/6] drm/prime: document that use the page array is
 deprecated v2
Message-ID: <20201009162444.GO438822@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
 airlied@redhat.com, akpm@linux-foundation.org,
 sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
 jgg@ziepe.ca
References: <20201009150342.1979-1-christian.koenig@amd.com>
 <20201009150342.1979-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009150342.1979-6-christian.koenig@amd.com>
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
Cc: jgg@ziepe.ca, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, willy@infradead.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 05:03:42PM +0200, Christian K=F6nig wrote:
> We have reoccurring requests on this so better document that
> this approach doesn't work and dma_buf_mmap() needs to be used instead.
> =

> v2: split it into two functions
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Patches 3-5:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

This one looks good, but you have it on a strange baseline. This doesn't
contain the sg walking fixes from Marek, so reintroduces the bugs.
Probably need to request a backmerge chain, first of -rc8 into drm-next,
and then that into drm-misc-next.

Everything else in here lgtm.
-Daniel



> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  9 ++-
>  drivers/gpu/drm/drm_prime.c                 | 67 +++++++++++++++------
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  3 +-
>  drivers/gpu/drm/msm/msm_gem.c               |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c        |  5 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c         |  9 ++-
>  drivers/gpu/drm/vgem/vgem_drv.c             |  3 +-
>  drivers/gpu/drm/vkms/vkms_gem.c             |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c     |  4 +-
>  include/drm/drm_prime.h                     |  7 ++-
>  10 files changed, 69 insertions(+), 42 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index ac463e706b19..6a65490de391 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1011,8 +1011,8 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_=
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

> @@ -1345,9 +1345,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_dev=
ice *bdev,
>  			ttm->sg =3D sgt;
>  		}
>  =

> -		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
> -						 gtt->ttm.dma_address,
> -						 ttm->num_pages);
> +		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
> +					       ttm->num_pages);
>  		ttm_tt_set_populated(ttm);
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 4910c446db83..8b750c074494 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -954,27 +954,25 @@ struct drm_gem_object *drm_gem_prime_import(struct =
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
> - * @max_entries: size of both the passed-in arrays
> + * @pages: array of page pointers to store the pages in
> + * @max_entries: size of the passed-in array
>   *
> - * Exports an sg table into an array of pages and addresses. This is cur=
rently
> - * required by the TTM driver in order to do correct fault handling.
> + * Exports an sg table into an array of pages.
>   *
> - * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
> - * implementation.
> + * This function is deprecated and strongly discouraged to be used.
> + * The page array is only useful for page faults and those can corrupt f=
ields
> + * in the struct page if they are not handled by the exporting driver.
>   */
> -int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page *=
*pages,
> -				     dma_addr_t *addrs, int max_entries)
> +int __deprecated drm_prime_sg_to_page_array(struct sg_table *sgt,
> +					    struct page **pages,
> +					    int max_entries)
>  {
>  	unsigned count;
>  	struct scatterlist *sg;
>  	struct page *page;
>  	u32 page_len, page_index;
> -	dma_addr_t addr;
> -	u32 dma_len, dma_index;
>  =

>  	/*
>  	 * Scatterlist elements contains both pages and DMA addresses, but
> @@ -984,14 +982,11 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_tabl=
e *sgt, struct page **pages,
>  	 * described by the sg_dma_address(sg).
>  	 */
>  	page_index =3D 0;
> -	dma_index =3D 0;
>  	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
>  		page_len =3D sg->length;
>  		page =3D sg_page(sg);
> -		dma_len =3D sg_dma_len(sg);
> -		addr =3D sg_dma_address(sg);
>  =

> -		while (pages && page_len > 0) {
> +		while (page_len > 0) {
>  			if (WARN_ON(page_index >=3D max_entries))
>  				return -1;
>  			pages[page_index] =3D page;
> @@ -999,7 +994,43 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table=
 *sgt, struct page **pages,
>  			page_len -=3D PAGE_SIZE;
>  			page_index++;
>  		}
> -		while (addrs && dma_len > 0) {
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
> + * @max_entries: size of both the passed-in arrays
> + *
> + * Exports an sg table into an array of addresses.
> + *
> + * Drivers should use this in their &drm_driver.gem_prime_import_sg_table

s/should/can/

There's no requirement, if your driver just handles everything as an sgt
there's no conversion needed.

> + * implementation.
> + */
> +int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *add=
rs,
> +				   int max_entries)
> +{
> +	struct scatterlist *sg;
> +	u32 dma_len, dma_index;
> +	dma_addr_t addr;
> +	unsigned count;
> +
> +	/*
> +	 * Scatterlist elements contains both pages and DMA addresses, but
> +	 * one shoud not assume 1:1 relation between them. The sg->length is
> +	 * the size of the physical memory chunk described by the sg->page,
> +	 * while sg_dma_len(sg) is the size of the DMA (IO virtual) chunk
> +	 * described by the sg_dma_address(sg).
> +	 */
> +	dma_index =3D 0;
> +	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
> +		dma_len =3D sg_dma_len(sg);
> +		addr =3D sg_dma_address(sg);
> +
> +		while (dma_len > 0) {
>  			if (WARN_ON(dma_index >=3D max_entries))
>  				return -1;
>  			addrs[dma_index] =3D addr;
> @@ -1010,7 +1041,7 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_tabl=
e *sgt, struct page **pages,
>  	}
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

> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index a71f42870d5e..616b87641740 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1174,7 +1174,7 @@ struct drm_gem_object *msm_gem_import(struct drm_de=
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
> index e378bb491688..835edd74ef59 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1299,9 +1299,8 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
>  		return 0;
>  =

>  	if (slave && ttm->sg) {
> -		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
> -						 ttm_dma->dma_address,
> -						 ttm->num_pages);
> +		drm_prime_sg_to_dma_addr_array(ttm->sg, ttm_dma->dma_address,
> +					       ttm->num_pages);
>  		ttm_tt_set_populated(ttm);
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 4b92cdbcd29b..7997e4564576 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -474,8 +474,8 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_de=
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

> @@ -642,9 +642,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_devic=
e *bdev,
>  	}
>  =

>  	if (slave && ttm->sg) {
> -		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
> -						 gtt->ttm.dma_address,
> -						 ttm->num_pages);
> +		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
> +					       ttm->num_pages);
>  		ttm_tt_set_populated(ttm);
>  		return 0;
>  	}
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

> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_=
gem.c
> index 19a0e260a4df..a2ff21f47101 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -256,6 +256,6 @@ vkms_prime_import_sg_table(struct drm_device *dev,
>  		return ERR_PTR(-ENOMEM);
>  	}
>  =

> -	drm_prime_sg_to_page_addr_arrays(sg, obj->pages, NULL, npages);
> +	drm_prime_sg_to_page_array(sg, obj->pages, npages);
>  	return &obj->gem;
>  }
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xe=
n/xen_drm_front_gem.c
> index f3830a0d1808..f4150ddfc5e2 100644
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
> index 093f760cc131..4bda9ab3a3bb 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -103,8 +103,9 @@ struct drm_gem_object *drm_gem_prime_import(struct dr=
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

> 2.17.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
