Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF5275C26
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC4F6E9D8;
	Wed, 23 Sep 2020 15:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66D6E9D8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:40:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so537762wmm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZvRCu4xq/XpXZfRDmRkieW+sYh/BNWUShOiHDUnJU1Y=;
 b=ElcW9xQMkKYF4pzEIinF1tjW0fAaL9VE1vYiRSE+U9ODDFPY04E9Depx84Kp6wfddH
 Y9ejPx0W3dr7DKKBnKhNDlBgEKkosJGjQxZWJczUR78X7hJ/rLkmjGJ50rR9m2dpXYT3
 geylqdplgigF16d7/iWhPm5TYlcw0iv67gIWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZvRCu4xq/XpXZfRDmRkieW+sYh/BNWUShOiHDUnJU1Y=;
 b=dmhy/QU+2ZYTSonMMBYdCPaOSk0fS8pS2fnJzjIDA9YHF2MuimuVnYlFaw/5kwXGcw
 estFuT1Y396QkXH/DDXDZ3NFJ47DZtBot1b2vtl+f3GDMfYv4FhTOCZZaZAn46uF6MbF
 lKvOGQ/0yqsHpjmsRZo1v0pPJNOulNDelDHH++O6isOZT+fv3xkB7GB9+G83hB3DPrgH
 Z/eziQmz6iDZ0s5osVAQhSfoVSGb4+4OTpq1n45WyLXFjS3a1gm5ZU1DR9dHdG3M//7l
 1I79v4YyvVB487NO6drAHNXw//6IrhoBgASlGNbZkkfeIGJXLDkpnwpI3u9/ehwzZ1wH
 T9ug==
X-Gm-Message-State: AOAM531KRsNUTYge5GgvAZPoOUXEdmtyHvQcaX78gnkugFQXSg3RcpEK
 QwLs4j2f4C4V2tikTccefZaKmQ==
X-Google-Smtp-Source: ABdhPJzY0GcVVIb8F2DamcTNuCG2znED6WIzaG6kwLYeFiZyCSHGloO9cP8SwFEHkkHZ/0PGIxaaTA==
X-Received: by 2002:a05:600c:20c:: with SMTP id 12mr210235wmi.40.1600875611941; 
 Wed, 23 Sep 2020 08:40:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p1sm10572138wma.0.2020.09.23.08.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:40:11 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:40:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/3] dma-buf: Use struct dma_buf_map in
 dma_buf_vunmap() interfaces
Message-ID: <20200923154008.GU438822@phenom.ffwll.local>
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923123205.30671-4-tzimmermann@suse.de>
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
Cc: christian.koenig@amd.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, kraxel@redhat.com, tfiga@chromium.org,
 sam@ravnborg.org, m.szyprowski@samsung.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, jonathanh@nvidia.com, matthew.auld@intel.com,
 linux+etnaviv@armlinux.org.uk, labbott@redhat.com, linux-media@vger.kernel.org,
 pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 thomas.hellstrom@intel.com, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, mchehab@kernel.org, lmark@codeaurora.org,
 afd@ti.com, kyungmin.park@samsung.com, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 02:32:05PM +0200, Thomas Zimmermann wrote:
> This patch updates dma_buf_vunmap() and dma-buf's vunmap callback to
> use struct dma_buf_map. The interfaces used to receive a buffer address.
> This address is now given in an instance of the structure.
> 
> Users of the functions are updated accordingly. This is only an interface
> change. It is currently expected that dma-buf memory can be accessed with
> system memory load/store operations.
> 
> v2:
> 	* include dma-buf-heaps and i915 selftests (kernel test robot)
> 	* initialize cma_obj before using it in drm_gem_cma_free_object()
> 	  (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-buf.c                     |  8 ++---
>  drivers/dma-buf/heaps/heap-helpers.c          |  2 +-
>  drivers/gpu/drm/drm_gem_cma_helper.c          |  9 +++---
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  3 +-
>  drivers/gpu/drm/drm_prime.c                   |  6 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  5 +--
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  2 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  6 ++--
>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  4 +--
>  drivers/gpu/drm/tegra/gem.c                   |  5 +--
>  .../common/videobuf2/videobuf2-dma-contig.c   |  3 +-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  3 +-
>  .../common/videobuf2/videobuf2-vmalloc.c      |  6 ++--
>  include/drm/drm_prime.h                       |  2 +-
>  include/linux/dma-buf-map.h                   | 32 +++++++++++++++++--
>  include/linux/dma-buf.h                       |  4 +--
>  16 files changed, 66 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 61bd24d21b38..a6ba4d598f0e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1236,21 +1236,21 @@ EXPORT_SYMBOL_GPL(dma_buf_vmap);
>  /**
>   * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
>   * @dmabuf:	[in]	buffer to vunmap
> - * @vaddr:	[in]	vmap to vunmap
> + * @map:	[in]	vmap pointer to vunmap
>   */
> -void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
> +void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>  {
>  	if (WARN_ON(!dmabuf))
>  		return;
>  
>  	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>  	BUG_ON(dmabuf->vmapping_counter == 0);
> -	BUG_ON(!dma_buf_map_is_vaddr(&dmabuf->vmap_ptr, vaddr));
> +	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
>  
>  	mutex_lock(&dmabuf->lock);
>  	if (--dmabuf->vmapping_counter == 0) {
>  		if (dmabuf->ops->vunmap)
> -			dmabuf->ops->vunmap(dmabuf, vaddr);
> +			dmabuf->ops->vunmap(dmabuf, map);
>  		dma_buf_map_clear(&dmabuf->vmap_ptr);
>  	}
>  	mutex_unlock(&dmabuf->lock);
> diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
> index aeb9e100f339..fcf4ce3e2cbb 100644
> --- a/drivers/dma-buf/heaps/heap-helpers.c
> +++ b/drivers/dma-buf/heaps/heap-helpers.c
> @@ -251,7 +251,7 @@ static int dma_heap_dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map
>  	return 0;
>  }
>  
> -static void dma_heap_dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
> +static void dma_heap_dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>  {
>  	struct heap_helper_buffer *buffer = dmabuf->priv;
>  
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 1ece73fd3fe9..1059acdde519 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -175,13 +175,12 @@ drm_gem_cma_create_with_handle(struct drm_file *file_priv,
>   */
>  void drm_gem_cma_free_object(struct drm_gem_object *gem_obj)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> -
> -	cma_obj = to_drm_gem_cma_obj(gem_obj);
> +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem_obj);
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(cma_obj->vaddr);
>  
>  	if (gem_obj->import_attach) {
>  		if (cma_obj->vaddr)
> -			dma_buf_vunmap(gem_obj->import_attach->dmabuf, cma_obj->vaddr);
> +			dma_buf_vunmap(gem_obj->import_attach->dmabuf, &map);
>  		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
>  	} else if (cma_obj->vaddr) {
>  		dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
> @@ -628,7 +627,7 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
>  
>  	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
>  	if (IS_ERR(obj)) {
> -		dma_buf_vunmap(attach->dmabuf, map.vaddr);
> +		dma_buf_vunmap(attach->dmabuf, &map);
>  		return obj;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 6328cfbb828e..fb11df7aced5 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -337,6 +337,7 @@ EXPORT_SYMBOL(drm_gem_shmem_vmap);
>  static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(shmem->vaddr);
>  
>  	if (WARN_ON_ONCE(!shmem->vmap_use_count))
>  		return;
> @@ -345,7 +346,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem)
>  		return;
>  
>  	if (obj->import_attach)
> -		dma_buf_vunmap(obj->import_attach->dmabuf, shmem->vaddr);
> +		dma_buf_vunmap(obj->import_attach->dmabuf, &map);
>  	else
>  		vunmap(shmem->vaddr);
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 2b3fd01867e4..dfa774c303b6 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -687,16 +687,16 @@ EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>  /**
>   * drm_gem_dmabuf_vunmap - dma_buf vunmap implementation for GEM
>   * @dma_buf: buffer to be unmapped
> - * @vaddr: the virtual address of the buffer
> + * @map: the virtual address of the buffer
>   *
>   * Releases a kernel virtual mapping. This can be used as the
>   * &dma_buf_ops.vunmap callback. Calls into &drm_gem_object_funcs.vunmap for device specific handling.
>   */
> -void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
> +void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
>  
> -	drm_gem_vunmap(obj, vaddr);
> +	drm_gem_vunmap(obj, map->vaddr);
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 80a9fc143bbb..135fbff6fecf 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -70,9 +70,10 @@ void etnaviv_gem_prime_unpin(struct drm_gem_object *obj)
>  
>  static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
>  {
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(etnaviv_obj->vaddr);
> +
>  	if (etnaviv_obj->vaddr)
> -		dma_buf_vunmap(etnaviv_obj->base.import_attach->dmabuf,
> -			       etnaviv_obj->vaddr);
> +		dma_buf_vunmap(etnaviv_obj->base.import_attach->dmabuf, &map);
>  
>  	/* Don't drop the pages for imported dmabuf, as they are not
>  	 * ours, just free the array we allocated:
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 6ee8f2cfd8c1..0dd477e56573 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -91,7 +91,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map
>  	return 0;
>  }
>  
> -static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
> +static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
>  
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index f79ebc5329b7..0b4d19729e1f 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -152,7 +152,7 @@ static int igt_dmabuf_import(void *arg)
>  
>  	err = 0;
>  out_dma_map:
> -	dma_buf_vunmap(dmabuf, dma_map);
> +	dma_buf_vunmap(dmabuf, &map);
>  out_obj:
>  	i915_gem_object_put(obj);
>  out_dmabuf:
> @@ -182,7 +182,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>  	}
>  
>  	memset(ptr, 0xc5, PAGE_SIZE);
> -	dma_buf_vunmap(dmabuf, ptr);
> +	dma_buf_vunmap(dmabuf, &map);
>  
>  	obj = to_intel_bo(i915_gem_prime_import(&i915->drm, dmabuf));
>  	if (IS_ERR(obj)) {
> @@ -250,7 +250,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>  	memset(ptr, 0xc5, dmabuf->size);
>  
>  	err = 0;
> -	dma_buf_vunmap(dmabuf, ptr);
> +	dma_buf_vunmap(dmabuf, &map);
>  out:
>  	dma_buf_put(dmabuf);
>  	return err;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> index becd9fb95d58..2855d11c7a51 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
> @@ -74,11 +74,11 @@ static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  	return 0;
>  }
>  
> -static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
> +static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct mock_dmabuf *mock = to_mock(dma_buf);
>  
> -	vm_unmap_ram(vaddr, mock->npages);
> +	vm_unmap_ram(map->vaddr, mock->npages);
>  }
>  
>  static int mock_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 6f04d7855f95..8637bdff189c 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -149,11 +149,12 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
>  static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
>  {
>  	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(addr);
>  
>  	if (obj->vaddr)
>  		return;
>  	else if (obj->gem.import_attach)
> -		dma_buf_vunmap(obj->gem.import_attach->dmabuf, addr);
> +		dma_buf_vunmap(obj->gem.import_attach->dmabuf, &map);
>  	else
>  		vunmap(addr);
>  }
> @@ -648,7 +649,7 @@ static int tegra_gem_prime_vmap(struct dma_buf *buf, struct dma_buf_map *map)
>  	return 0;
>  }
>  
> -static void tegra_gem_prime_vunmap(struct dma_buf *buf, void *vaddr)
> +static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct dma_buf_map *map)
>  {
>  }
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 11428287bdf3..a1eb8279b113 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -648,6 +648,7 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
>  {
>  	struct vb2_dc_buf *buf = mem_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
>  
>  	if (WARN_ON(!buf->db_attach)) {
>  		pr_err("trying to unpin a not attached buffer\n");
> @@ -660,7 +661,7 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
>  	}
>  
>  	if (buf->vaddr) {
> -		dma_buf_vunmap(buf->db_attach->dmabuf, buf->vaddr);
> +		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
>  		buf->vaddr = NULL;
>  	}
>  	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index c51170e9c1b9..d5157e903e27 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -580,6 +580,7 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
>  {
>  	struct vb2_dma_sg_buf *buf = mem_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
>  
>  	if (WARN_ON(!buf->db_attach)) {
>  		pr_err("trying to unpin a not attached buffer\n");
> @@ -592,7 +593,7 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
>  	}
>  
>  	if (buf->vaddr) {
> -		dma_buf_vunmap(buf->db_attach->dmabuf, buf->vaddr);
> +		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
>  		buf->vaddr = NULL;
>  	}
>  	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 7b68e2379c65..11ba0eb1315b 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -390,17 +390,19 @@ static int vb2_vmalloc_map_dmabuf(void *mem_priv)
>  static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
>  {
>  	struct vb2_vmalloc_buf *buf = mem_priv;
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
>  
> -	dma_buf_vunmap(buf->dbuf, buf->vaddr);
> +	dma_buf_vunmap(buf->dbuf, &map);
>  	buf->vaddr = NULL;
>  }
>  
>  static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
>  {
>  	struct vb2_vmalloc_buf *buf = mem_priv;
> +	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buf->vaddr);
>  
>  	if (buf->vaddr)
> -		dma_buf_vunmap(buf->dbuf, buf->vaddr);
> +		dma_buf_vunmap(buf->dbuf, &map);
>  
>  	kfree(buf);
>  }
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 5125f84c28f6..0991a47a1567 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -84,7 +84,7 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>  			   struct sg_table *sgt,
>  			   enum dma_data_direction dir);
>  int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
> -void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
> +void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
>  
>  int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index 6b4f6e0e8b5d..303e1363b221 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -28,6 +28,16 @@ struct dma_buf_map {
>  	bool is_iomem;
>  };
>  
> +/**
> + * DMA_BUF_MAP_INIT_VADDR - Initializes struct dma_buf_map to an address in system memory
> + * @vaddr:	A system-memory address
> + */
> +#define DMA_BUF_MAP_INIT_VADDR(vaddr_) \
> +	{ \
> +		.vaddr = (vaddr_), \
> +		.is_iomem = false, \
> +	}
> +
>  /**
>   * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an address in system memory
>   * @map:	The dma-buf mapping structure
> @@ -41,10 +51,26 @@ static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
>  	map->is_iomem = false;
>  }
>  
> -/* API transition helper */
> -static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map, const void *vaddr)
> +/**
> + * dma_buf_map_is_equal - Compares two dma-buf mapping structures for equality
> + * @lhs:	The dma-buf mapping structure
> + * @rhs:	A dma-buf mapping structure to compare with
> + *
> + * Two dma-buf mapping structures are equal if they both refer to the same type of memory
> + * and to the same address within that memory.
> + *
> + * Returns:
> + * True is both structures are equal, or false otherwise.
> + */
> +static inline bool dma_buf_map_is_equal(const struct dma_buf_map *lhs,
> +					const struct dma_buf_map *rhs)
>  {
> -	return !map->is_iomem && (map->vaddr == vaddr);
> +	if (lhs->is_iomem != rhs->is_iomem)
> +		return false;
> +	else if (lhs->is_iomem)
> +		return lhs->vaddr_iomem == rhs->vaddr_iomem;
> +	else
> +		return lhs->vaddr == rhs->vaddr;
>  }
>  
>  /**
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 7237997cfa38..cf77cc15f4ba 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -267,7 +267,7 @@ struct dma_buf_ops {
>  	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>  
>  	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> -	void (*vunmap)(struct dma_buf *, void *vaddr);
> +	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  };
>  
>  /**
> @@ -504,5 +504,5 @@ int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
>  int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>  		 unsigned long);
>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> -void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr);
> +void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  #endif /* __DMA_BUF_H__ */
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
