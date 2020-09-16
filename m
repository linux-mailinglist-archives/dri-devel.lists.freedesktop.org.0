Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C434B26C290
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 14:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E356E9B8;
	Wed, 16 Sep 2020 12:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394D56E9BA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 12:12:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t10so6703988wrv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 05:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=itNXmFdMkNkQp3lHL/OJ5AcdmW1+okFU4aWmXEltLlc=;
 b=M6hUrq8QnZbt+aKfTDSq26HEyFNrYuP2HAJiDkomFv+4HnnSNSvxvmkLmUlxzgR8Oh
 z0/j8eOzaBLylUfbjVkzUk131lj0C5XE1wCJw6QjqeXtlr67LuBEJeHd84dnajE3kg89
 QpGbTiaFpSq+a+louYXz3VWxqRqBXNIpOtTr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=itNXmFdMkNkQp3lHL/OJ5AcdmW1+okFU4aWmXEltLlc=;
 b=tYM/ytD8lpIAEX/Ol4RbCmfplGVwAkb2I+tyZo0rcQwOQXsY6UZslSGptQGB47bPmF
 mBtZRUdZEzH3TnAw7NqwwmaK5K8shuPYb2z3z8r0ptvuDuYdc5Yr46bSYUz6DDrH7sBb
 Vlq8vIaWDgF1XWffVCUq6q+v4LGGDdzpwLJZJCCM+H9BJ/9TrPsJen9t+1PNNDjJaRF+
 dJs7zPggmUExHUHIKaoFA4QmlBiG/TGTOPyN6w7UX9fVeu5IPdGkm4Xll81ggf6gscxp
 r+sF1F2o8FuQ/GmgNxkPyCO2XNoSpHo52CLQYmUaoBGNbg5zAid6uwYwE52yuveXMnQx
 OOig==
X-Gm-Message-State: AOAM5338umA3J+5pfIqltNWCosdWhhriCSSCTweS94LiEI/n3AVpprXl
 koPRp5n2ENTw/PqRriCS7cbquw==
X-Google-Smtp-Source: ABdhPJxhqPDuFIdXZ7UpAyfPvyJzXM7skKWYcYO2TLvYTOFJkwo2eTLqSfF4H8O0ExKKcPyVPZjC1Q==
X-Received: by 2002:a5d:574a:: with SMTP id q10mr4163098wrw.127.1600258351712; 
 Wed, 16 Sep 2020 05:12:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm32021991wrv.94.2020.09.16.05.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:12:30 -0700 (PDT)
Date: Wed, 16 Sep 2020 14:12:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 21/21] drm: Remove obsolete GEM and PRIME callbacks
 from struct drm_driver
Message-ID: <20200916121227.GP438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-22-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-22-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 tomi.valkeinen@ti.com, linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 bskeggs@redhat.com, xen-devel@lists.xenproject.org, miaoqinglang@huawei.com,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, linux-arm-msm@vger.kernel.org,
 marek.olsak@amd.com, tianci.yin@amd.com, etnaviv@lists.freedesktop.org,
 hdegoede@redhat.com, linux-mediatek@lists.infradead.org,
 rodrigo.vivi@intel.com, matthias.bgg@gmail.com, evan.quan@amd.com,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 tvrtko.ursulin@linux.intel.com, amd-gfx@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, hyun.kwon@xilinx.com,
 rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 chris@chris-wilson.co.uk, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 04:59:58PM +0200, Thomas Zimmermann wrote:
> Several GEM and PRIME callbacks have been deprecated in favor of
> per-instance GEM object functions. Remove the callbacks as they are
> now unused. The only exception is .gem_prime_mmap, which is still
> in use by several drivers.
> 
> What is also gone is gem_vm_ops in struct drm_driver. All drivers now
> use struct drm_gem_object_funcs.vm_ops instead.
> 
> While at it, the patch also improves error handling around calls
> to .free and .get_sg_table callbacks.
> 
> v2:
> 	* update related TODO item (Sam)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Nice work!

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst           |  7 +--
>  drivers/gpu/drm/drm_gem.c            | 35 +++---------
>  drivers/gpu/drm/drm_gem_cma_helper.c |  6 +-
>  drivers/gpu/drm/drm_prime.c          | 17 +++---
>  include/drm/drm_drv.h                | 85 ++--------------------------
>  5 files changed, 25 insertions(+), 125 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index b0ea17da8ff6..0fc6bc222392 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -289,11 +289,8 @@ struct drm_gem_object_funcs
>  ---------------------------
>  
>  GEM objects can now have a function table instead of having the callbacks on the
> -DRM driver struct. This is now the preferred way and drivers can be moved over.
> -
> -We also need a 2nd version of the CMA define that doesn't require the
> -vmapping to be present (different hook for prime importing). Plus this needs to
> -be rolled out to all drivers using their own implementations, too.
> +DRM driver struct. This is now the preferred way. Callbacks in drivers have been
> +converted, except for struct drm_driver.gem_prime_mmap.
>  
>  Level: Intermediate
>  
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 19d73868490e..96945bed8291 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -247,12 +247,9 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  {
>  	struct drm_file *file_priv = data;
>  	struct drm_gem_object *obj = ptr;
> -	struct drm_device *dev = obj->dev;
>  
>  	if (obj->funcs && obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
> -	else if (dev->driver->gem_close_object)
> -		dev->driver->gem_close_object(obj, file_priv);
>  
>  	drm_gem_remove_prime_handles(obj, file_priv);
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
> @@ -407,10 +404,6 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  		ret = obj->funcs->open(obj, file_priv);
>  		if (ret)
>  			goto err_revoke;
> -	} else if (dev->driver->gem_open_object) {
> -		ret = dev->driver->gem_open_object(obj, file_priv);
> -		if (ret)
> -			goto err_revoke;
>  	}
>  
>  	*handlep = handle;
> @@ -982,12 +975,11 @@ drm_gem_object_free(struct kref *kref)
>  {
>  	struct drm_gem_object *obj =
>  		container_of(kref, struct drm_gem_object, refcount);
> -	struct drm_device *dev = obj->dev;
>  
> -	if (obj->funcs)
> -		obj->funcs->free(obj);
> -	else if (dev->driver->gem_free_object_unlocked)
> -		dev->driver->gem_free_object_unlocked(obj);
> +	if (drm_WARN_ON_ONCE(obj->dev, !obj->funcs || !obj->funcs->free))
> +		return;
> +
> +	obj->funcs->free(obj);
>  }
>  EXPORT_SYMBOL(drm_gem_object_free);
>  
> @@ -1049,9 +1041,9 @@ EXPORT_SYMBOL(drm_gem_vm_close);
>   * @obj_size: the object size to be mapped, in bytes
>   * @vma: VMA for the area to be mapped
>   *
> - * Set up the VMA to prepare mapping of the GEM object using the gem_vm_ops
> - * provided by the driver. Depending on their requirements, drivers can either
> - * provide a fault handler in their gem_vm_ops (in which case any accesses to
> + * Set up the VMA to prepare mapping of the GEM object using the GEM object's
> + * vm_ops. Depending on their requirements, GEM objects can either
> + * provide a fault handler in their vm_ops (in which case any accesses to
>   * the object will be trapped, to perform migration, GTT binding, surface
>   * register allocation, or performance monitoring), or mmap the buffer memory
>   * synchronously after calling drm_gem_mmap_obj.
> @@ -1065,12 +1057,11 @@ EXPORT_SYMBOL(drm_gem_vm_close);
>   * callers must verify access restrictions before calling this helper.
>   *
>   * Return 0 or success or -EINVAL if the object size is smaller than the VMA
> - * size, or if no gem_vm_ops are provided.
> + * size, or if no vm_ops are provided.
>   */
>  int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>  		     struct vm_area_struct *vma)
>  {
> -	struct drm_device *dev = obj->dev;
>  	int ret;
>  
>  	/* Check for valid size. */
> @@ -1095,8 +1086,6 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>  	} else {
>  		if (obj->funcs && obj->funcs->vm_ops)
>  			vma->vm_ops = obj->funcs->vm_ops;
> -		else if (dev->driver->gem_vm_ops)
> -			vma->vm_ops = dev->driver->gem_vm_ops;
>  		else {
>  			drm_gem_object_put(obj);
>  			return -EINVAL;
> @@ -1206,8 +1195,6 @@ int drm_gem_pin(struct drm_gem_object *obj)
>  {
>  	if (obj->funcs && obj->funcs->pin)
>  		return obj->funcs->pin(obj);
> -	else if (obj->dev->driver->gem_prime_pin)
> -		return obj->dev->driver->gem_prime_pin(obj);
>  	else
>  		return 0;
>  }
> @@ -1216,8 +1203,6 @@ void drm_gem_unpin(struct drm_gem_object *obj)
>  {
>  	if (obj->funcs && obj->funcs->unpin)
>  		obj->funcs->unpin(obj);
> -	else if (obj->dev->driver->gem_prime_unpin)
> -		obj->dev->driver->gem_prime_unpin(obj);
>  }
>  
>  void *drm_gem_vmap(struct drm_gem_object *obj)
> @@ -1226,8 +1211,6 @@ void *drm_gem_vmap(struct drm_gem_object *obj)
>  
>  	if (obj->funcs && obj->funcs->vmap)
>  		vaddr = obj->funcs->vmap(obj);
> -	else if (obj->dev->driver->gem_prime_vmap)
> -		vaddr = obj->dev->driver->gem_prime_vmap(obj);
>  	else
>  		vaddr = ERR_PTR(-EOPNOTSUPP);
>  
> @@ -1244,8 +1227,6 @@ void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
>  
>  	if (obj->funcs && obj->funcs->vunmap)
>  		obj->funcs->vunmap(obj, vaddr);
> -	else if (obj->dev->driver->gem_prime_vunmap)
> -		obj->dev->driver->gem_prime_vunmap(obj, vaddr);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 822edeadbab3..209202257cc2 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -419,7 +419,7 @@ EXPORT_SYMBOL(drm_gem_cma_print_info);
>   *
>   * This function exports a scatter/gather table suitable for PRIME usage by
>   * calling the standard DMA mapping API. Drivers using the CMA helpers should
> - * set this as their &drm_driver.gem_prime_get_sg_table callback.
> + * set this as their &drm_gem_object_funcs.get_sg_table callback.
>   *
>   * Returns:
>   * A pointer to the scatter/gather table of pinned pages or NULL on failure.
> @@ -542,7 +542,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
>   * virtual address space. Since the CMA buffers are already mapped into the
>   * kernel virtual address space this simply returns the cached virtual
>   * address. Drivers using the CMA helpers should set this as their DRM
> - * driver's &drm_driver.gem_prime_vmap callback.
> + * driver's &drm_gem_object_funcs.vmap callback.
>   *
>   * Returns:
>   * The kernel virtual address of the CMA GEM object's backing store.
> @@ -564,7 +564,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
>   * This function removes a buffer exported via DRM PRIME from the kernel's
>   * virtual address space. This is a no-op because CMA buffers cannot be
>   * unmapped from kernel space. Drivers using the CMA helpers should set this
> - * as their &drm_driver.gem_prime_vunmap callback.
> + * as their &drm_gem_object_funcs.vunmap callback.
>   */
>  void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
>  {
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 8a6a3c99b7d8..1cffb004d3c8 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -386,10 +386,6 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>  
>  	if (obj->funcs && obj->funcs->export)
>  		dmabuf = obj->funcs->export(obj, flags);
> -	else if (dev->driver->gem_prime_export)
> -		dmabuf = dev->driver->gem_prime_export(obj, flags);
> -	else
> -		dmabuf = drm_gem_prime_export(obj, flags);
>  	if (IS_ERR(dmabuf)) {
>  		/* normally the created dma-buf takes ownership of the ref,
>  		 * but if that fails then drop the ref
> @@ -419,7 +415,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>   * This is the PRIME export function which must be used mandatorily by GEM
>   * drivers to ensure correct lifetime management of the underlying GEM object.
>   * The actual exporting from GEM object to a dma-buf is done through the
> - * &drm_driver.gem_prime_export driver callback.
> + * &drm_gem_object_funcs.export callback.
>   */
>  int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>  			       struct drm_file *file_priv, uint32_t handle,
> @@ -616,15 +612,18 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
>  				     enum dma_data_direction dir)
>  {
>  	struct drm_gem_object *obj = attach->dmabuf->priv;
> -	struct sg_table *sgt;
> +	struct sg_table *sgt = NULL;
>  
>  	if (WARN_ON(dir == DMA_NONE))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (obj->funcs)
> +	if (obj->funcs && obj->funcs->get_sg_table)
>  		sgt = obj->funcs->get_sg_table(obj);
> -	else
> -		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
> +
> +	if (!sgt)
> +		return ERR_PTR(-EINVAL);
> +	else if (IS_ERR(sgt))
> +		return sgt;
>  
>  	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
>  			      DMA_ATTR_SKIP_CPU_SYNC)) {
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 9b11a2f0babc..240b0eab8018 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -36,10 +36,12 @@ struct drm_file;
>  struct drm_gem_object;
>  struct drm_master;
>  struct drm_minor;
> +struct dma_buf;
>  struct dma_buf_attachment;
>  struct drm_display_mode;
>  struct drm_mode_create_dumb;
>  struct drm_printer;
> +struct sg_table;
>  
>  /**
>   * enum drm_driver_feature - feature flags
> @@ -326,32 +328,6 @@ struct drm_driver {
>  	 */
>  	void (*debugfs_init)(struct drm_minor *minor);
>  
> -	/**
> -	 * @gem_free_object_unlocked: deconstructor for drm_gem_objects
> -	 *
> -	 * This is deprecated and should not be used by new drivers. Use
> -	 * &drm_gem_object_funcs.free instead.
> -	 */
> -	void (*gem_free_object_unlocked) (struct drm_gem_object *obj);
> -
> -	/**
> -	 * @gem_open_object:
> -	 *
> -	 * This callback is deprecated in favour of &drm_gem_object_funcs.open.
> -	 *
> -	 * Driver hook called upon gem handle creation
> -	 */
> -	int (*gem_open_object) (struct drm_gem_object *, struct drm_file *);
> -
> -	/**
> -	 * @gem_close_object:
> -	 *
> -	 * This callback is deprecated in favour of &drm_gem_object_funcs.close.
> -	 *
> -	 * Driver hook called upon gem handle release
> -	 */
> -	void (*gem_close_object) (struct drm_gem_object *, struct drm_file *);
> -
>  	/**
>  	 * @gem_create_object: constructor for gem objects
>  	 *
> @@ -360,6 +336,7 @@ struct drm_driver {
>  	 */
>  	struct drm_gem_object *(*gem_create_object)(struct drm_device *dev,
>  						    size_t size);
> +
>  	/**
>  	 * @prime_handle_to_fd:
>  	 *
> @@ -382,14 +359,7 @@ struct drm_driver {
>  	 */
>  	int (*prime_fd_to_handle)(struct drm_device *dev, struct drm_file *file_priv,
>  				int prime_fd, uint32_t *handle);
> -	/**
> -	 * @gem_prime_export:
> -	 *
> -	 * Export hook for GEM drivers. Deprecated in favour of
> -	 * &drm_gem_object_funcs.export.
> -	 */
> -	struct dma_buf * (*gem_prime_export)(struct drm_gem_object *obj,
> -					     int flags);
> +
>  	/**
>  	 * @gem_prime_import:
>  	 *
> @@ -399,29 +369,6 @@ struct drm_driver {
>  	 */
>  	struct drm_gem_object * (*gem_prime_import)(struct drm_device *dev,
>  				struct dma_buf *dma_buf);
> -
> -	/**
> -	 * @gem_prime_pin:
> -	 *
> -	 * Deprecated hook in favour of &drm_gem_object_funcs.pin.
> -	 */
> -	int (*gem_prime_pin)(struct drm_gem_object *obj);
> -
> -	/**
> -	 * @gem_prime_unpin:
> -	 *
> -	 * Deprecated hook in favour of &drm_gem_object_funcs.unpin.
> -	 */
> -	void (*gem_prime_unpin)(struct drm_gem_object *obj);
> -
> -
> -	/**
> -	 * @gem_prime_get_sg_table:
> -	 *
> -	 * Deprecated hook in favour of &drm_gem_object_funcs.get_sg_table.
> -	 */
> -	struct sg_table *(*gem_prime_get_sg_table)(struct drm_gem_object *obj);
> -
>  	/**
>  	 * @gem_prime_import_sg_table:
>  	 *
> @@ -432,22 +379,6 @@ struct drm_driver {
>  				struct drm_device *dev,
>  				struct dma_buf_attachment *attach,
>  				struct sg_table *sgt);
> -	/**
> -	 * @gem_prime_vmap:
> -	 *
> -	 * Deprecated vmap hook for GEM drivers. Please use
> -	 * &drm_gem_object_funcs.vmap instead.
> -	 */
> -	void *(*gem_prime_vmap)(struct drm_gem_object *obj);
> -
> -	/**
> -	 * @gem_prime_vunmap:
> -	 *
> -	 * Deprecated vunmap hook for GEM drivers. Please use
> -	 * &drm_gem_object_funcs.vunmap instead.
> -	 */
> -	void (*gem_prime_vunmap)(struct drm_gem_object *obj, void *vaddr);
> -
>  	/**
>  	 * @gem_prime_mmap:
>  	 *
> @@ -522,14 +453,6 @@ struct drm_driver {
>  			    struct drm_device *dev,
>  			    uint32_t handle);
>  
> -	/**
> -	 * @gem_vm_ops: Driver private ops for this object
> -	 *
> -	 * For GEM drivers this is deprecated in favour of
> -	 * &drm_gem_object_funcs.vm_ops.
> -	 */
> -	const struct vm_operations_struct *gem_vm_ops;
> -
>  	/** @major: driver major number */
>  	int major;
>  	/** @minor: driver minor number */
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
