Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3191926C69B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 19:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86426EA7D;
	Wed, 16 Sep 2020 17:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324246EA74;
 Wed, 16 Sep 2020 17:55:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFF0AAE19;
 Wed, 16 Sep 2020 17:56:05 +0000 (UTC)
Subject: Re: [PATCH v2 21/21] drm: Remove obsolete GEM and PRIME callbacks
 from struct drm_driver
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-22-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7018b84a-fab6-4277-955b-10871be17204@suse.de>
Date: Wed, 16 Sep 2020 19:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915145958.19993-22-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0528779642=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0528779642==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="umftTVGoa0aaj4GhYFHJO71SoAj84TIWH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--umftTVGoa0aaj4GhYFHJO71SoAj84TIWH
Content-Type: multipart/mixed; boundary="m89X5vDo3Gs337cvkcHa9sq2YNWBTsfA3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <7018b84a-fab6-4277-955b-10871be17204@suse.de>
Subject: Re: [PATCH v2 21/21] drm: Remove obsolete GEM and PRIME callbacks
 from struct drm_driver
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-22-tzimmermann@suse.de>
In-Reply-To: <20200915145958.19993-22-tzimmermann@suse.de>

--m89X5vDo3Gs337cvkcHa9sq2YNWBTsfA3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 15.09.20 um 16:59 schrieb Thomas Zimmermann:
> Several GEM and PRIME callbacks have been deprecated in favor of
> per-instance GEM object functions. Remove the callbacks as they are
> now unused. The only exception is .gem_prime_mmap, which is still
> in use by several drivers.
>=20
> What is also gone is gem_vm_ops in struct drm_driver. All drivers now
> use struct drm_gem_object_funcs.vm_ops instead.
>=20
> While at it, the patch also improves error handling around calls
> to .free and .get_sg_table callbacks.
>=20
> v2:
> 	* update related TODO item (Sam)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/gpu/todo.rst           |  7 +--
>  drivers/gpu/drm/drm_gem.c            | 35 +++---------
>  drivers/gpu/drm/drm_gem_cma_helper.c |  6 +-
>  drivers/gpu/drm/drm_prime.c          | 17 +++---
>  include/drm/drm_drv.h                | 85 ++--------------------------=

>  5 files changed, 25 insertions(+), 125 deletions(-)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index b0ea17da8ff6..0fc6bc222392 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -289,11 +289,8 @@ struct drm_gem_object_funcs
>  ---------------------------
> =20
>  GEM objects can now have a function table instead of having the callba=
cks on the
> -DRM driver struct. This is now the preferred way and drivers can be mo=
ved over.
> -
> -We also need a 2nd version of the CMA define that doesn't require the
> -vmapping to be present (different hook for prime importing). Plus this=
 needs to
> -be rolled out to all drivers using their own implementations, too.
> +DRM driver struct. This is now the preferred way. Callbacks in drivers=
 have been
> +converted, except for struct drm_driver.gem_prime_mmap.
> =20
>  Level: Intermediate
> =20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 19d73868490e..96945bed8291 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -247,12 +247,9 @@ drm_gem_object_release_handle(int id, void *ptr, v=
oid *data)
>  {
>  	struct drm_file *file_priv =3D data;
>  	struct drm_gem_object *obj =3D ptr;
> -	struct drm_device *dev =3D obj->dev;
> =20
>  	if (obj->funcs && obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
> -	else if (dev->driver->gem_close_object)
> -		dev->driver->gem_close_object(obj, file_priv);
> =20
>  	drm_gem_remove_prime_handles(obj, file_priv);
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
> @@ -407,10 +404,6 @@ drm_gem_handle_create_tail(struct drm_file *file_p=
riv,
>  		ret =3D obj->funcs->open(obj, file_priv);
>  		if (ret)
>  			goto err_revoke;
> -	} else if (dev->driver->gem_open_object) {
> -		ret =3D dev->driver->gem_open_object(obj, file_priv);
> -		if (ret)
> -			goto err_revoke;
>  	}
> =20
>  	*handlep =3D handle;
> @@ -982,12 +975,11 @@ drm_gem_object_free(struct kref *kref)
>  {
>  	struct drm_gem_object *obj =3D
>  		container_of(kref, struct drm_gem_object, refcount);
> -	struct drm_device *dev =3D obj->dev;
> =20
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
> =20
> @@ -1049,9 +1041,9 @@ EXPORT_SYMBOL(drm_gem_vm_close);
>   * @obj_size: the object size to be mapped, in bytes
>   * @vma: VMA for the area to be mapped
>   *
> - * Set up the VMA to prepare mapping of the GEM object using the gem_v=
m_ops
> - * provided by the driver. Depending on their requirements, drivers ca=
n either
> - * provide a fault handler in their gem_vm_ops (in which case any acce=
sses to
> + * Set up the VMA to prepare mapping of the GEM object using the GEM o=
bject's
> + * vm_ops. Depending on their requirements, GEM objects can either
> + * provide a fault handler in their vm_ops (in which case any accesses=
 to
>   * the object will be trapped, to perform migration, GTT binding, surf=
ace
>   * register allocation, or performance monitoring), or mmap the buffer=
 memory
>   * synchronously after calling drm_gem_mmap_obj.
> @@ -1065,12 +1057,11 @@ EXPORT_SYMBOL(drm_gem_vm_close);
>   * callers must verify access restrictions before calling this helper.=

>   *
>   * Return 0 or success or -EINVAL if the object size is smaller than t=
he VMA
> - * size, or if no gem_vm_ops are provided.
> + * size, or if no vm_ops are provided.
>   */
>  int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_siz=
e,
>  		     struct vm_area_struct *vma)
>  {
> -	struct drm_device *dev =3D obj->dev;
>  	int ret;
> =20
>  	/* Check for valid size. */
> @@ -1095,8 +1086,6 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, =
unsigned long obj_size,
>  	} else {
>  		if (obj->funcs && obj->funcs->vm_ops)
>  			vma->vm_ops =3D obj->funcs->vm_ops;
> -		else if (dev->driver->gem_vm_ops)
> -			vma->vm_ops =3D dev->driver->gem_vm_ops;
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
> =20
>  void *drm_gem_vmap(struct drm_gem_object *obj)
> @@ -1226,8 +1211,6 @@ void *drm_gem_vmap(struct drm_gem_object *obj)
> =20
>  	if (obj->funcs && obj->funcs->vmap)
>  		vaddr =3D obj->funcs->vmap(obj);
> -	else if (obj->dev->driver->gem_prime_vmap)
> -		vaddr =3D obj->dev->driver->gem_prime_vmap(obj);
>  	else
>  		vaddr =3D ERR_PTR(-EOPNOTSUPP);
> =20
> @@ -1244,8 +1227,6 @@ void drm_gem_vunmap(struct drm_gem_object *obj, v=
oid *vaddr)
> =20
>  	if (obj->funcs && obj->funcs->vunmap)
>  		obj->funcs->vunmap(obj, vaddr);
> -	else if (obj->dev->driver->gem_prime_vunmap)
> -		obj->dev->driver->gem_prime_vunmap(obj, vaddr);
>  }
> =20
>  /**
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm=
_gem_cma_helper.c
> index 822edeadbab3..209202257cc2 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -419,7 +419,7 @@ EXPORT_SYMBOL(drm_gem_cma_print_info);
>   *
>   * This function exports a scatter/gather table suitable for PRIME usa=
ge by
>   * calling the standard DMA mapping API. Drivers using the CMA helpers=
 should
> - * set this as their &drm_driver.gem_prime_get_sg_table callback.
> + * set this as their &drm_gem_object_funcs.get_sg_table callback.
>   *
>   * Returns:
>   * A pointer to the scatter/gather table of pinned pages or NULL on fa=
ilure.
> @@ -542,7 +542,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
>   * virtual address space. Since the CMA buffers are already mapped int=
o the
>   * kernel virtual address space this simply returns the cached virtual=

>   * address. Drivers using the CMA helpers should set this as their DRM=

> - * driver's &drm_driver.gem_prime_vmap callback.
> + * driver's &drm_gem_object_funcs.vmap callback.
>   *
>   * Returns:
>   * The kernel virtual address of the CMA GEM object's backing store.
> @@ -564,7 +564,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
>   * This function removes a buffer exported via DRM PRIME from the kern=
el's
>   * virtual address space. This is a no-op because CMA buffers cannot b=
e
>   * unmapped from kernel space. Drivers using the CMA helpers should se=
t this
> - * as their &drm_driver.gem_prime_vunmap callback.
> + * as their &drm_gem_object_funcs.vunmap callback.
>   */
>  void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)=

>  {
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 8a6a3c99b7d8..1cffb004d3c8 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -386,10 +386,6 @@ static struct dma_buf *export_and_register_object(=
struct drm_device *dev,
> =20
>  	if (obj->funcs && obj->funcs->export)
>  		dmabuf =3D obj->funcs->export(obj, flags);
> -	else if (dev->driver->gem_prime_export)
> -		dmabuf =3D dev->driver->gem_prime_export(obj, flags);

> -	else
> -		dmabuf =3D drm_gem_prime_export(obj, flags);

Oops, these two lines were not supposed to be removed. They'll return in
v3 of the patchset. That will also fix the error report that was posted
by the CI. [1]

Best regards
Thomas

[1]
https://lore.kernel.org/intel-gfx/160018797587.30601.1382075328491651866@=
emeril.freedesktop.org/


>  	if (IS_ERR(dmabuf)) {
>  		/* normally the created dma-buf takes ownership of the ref,
>  		 * but if that fails then drop the ref
> @@ -419,7 +415,7 @@ static struct dma_buf *export_and_register_object(s=
truct drm_device *dev,
>   * This is the PRIME export function which must be used mandatorily by=
 GEM
>   * drivers to ensure correct lifetime management of the underlying GEM=
 object.
>   * The actual exporting from GEM object to a dma-buf is done through t=
he
> - * &drm_driver.gem_prime_export driver callback.
> + * &drm_gem_object_funcs.export callback.
>   */
>  int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>  			       struct drm_file *file_priv, uint32_t handle,
> @@ -616,15 +612,18 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_b=
uf_attachment *attach,
>  				     enum dma_data_direction dir)
>  {
>  	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> -	struct sg_table *sgt;
> +	struct sg_table *sgt =3D NULL;
> =20
>  	if (WARN_ON(dir =3D=3D DMA_NONE))
>  		return ERR_PTR(-EINVAL);
> =20
> -	if (obj->funcs)
> +	if (obj->funcs && obj->funcs->get_sg_table)
>  		sgt =3D obj->funcs->get_sg_table(obj);
> -	else
> -		sgt =3D obj->dev->driver->gem_prime_get_sg_table(obj);
> +
> +	if (!sgt)
> +		return ERR_PTR(-EINVAL);
> +	else if (IS_ERR(sgt))
> +		return sgt;
> =20
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
> =20
>  /**
>   * enum drm_driver_feature - feature flags
> @@ -326,32 +328,6 @@ struct drm_driver {
>  	 */
>  	void (*debugfs_init)(struct drm_minor *minor);
> =20
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
> -	 * This callback is deprecated in favour of &drm_gem_object_funcs.ope=
n.
> -	 *
> -	 * Driver hook called upon gem handle creation
> -	 */
> -	int (*gem_open_object) (struct drm_gem_object *, struct drm_file *);
> -
> -	/**
> -	 * @gem_close_object:
> -	 *
> -	 * This callback is deprecated in favour of &drm_gem_object_funcs.clo=
se.
> -	 *
> -	 * Driver hook called upon gem handle release
> -	 */
> -	void (*gem_close_object) (struct drm_gem_object *, struct drm_file *)=
;
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
>  	int (*prime_fd_to_handle)(struct drm_device *dev, struct drm_file *fi=
le_priv,
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
> -	struct sg_table *(*gem_prime_get_sg_table)(struct drm_gem_object *obj=
);
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
> =20
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
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--m89X5vDo3Gs337cvkcHa9sq2YNWBTsfA3--

--umftTVGoa0aaj4GhYFHJO71SoAj84TIWH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9iUaAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPwlgf+J6YL9QPmb3kAFZqllTCzmUHeS1rj
BAR/r5nmUMeALr/eiCtkqRPD6aDCjubM9SmhukWKXpfEk1xRZFs/s+UQoM5GNyPu
aOLI+0n/LwxsHO+DVQFyWEFWDg4o4ZO1i49W0pokRVVTfs33G6IaBmnw14t4+DN8
hPfaWR666o0WbNtDSluyyK8FdiskAhrGUbLATkbSsrAk6qKThz85Y4ohQjoSBzsu
CSlzaF8SaKtfXUutksWzd0v43ftvs9hzjXupAivZX9w2AujI/jhOieX1ipBXonvR
bjrujNgkck1q2TFf0m4wCx9nGKu62bsAemVHUaD7NqPpUsefJjUiTODQCA==
=/8Kr
-----END PGP SIGNATURE-----

--umftTVGoa0aaj4GhYFHJO71SoAj84TIWH--

--===============0528779642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0528779642==--
