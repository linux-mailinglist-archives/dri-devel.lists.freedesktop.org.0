Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163524389D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210CF6E9A9;
	Thu, 13 Aug 2020 10:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5336E9A2;
 Thu, 13 Aug 2020 10:33:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74E77AF30;
 Thu, 13 Aug 2020 10:33:26 +0000 (UTC)
Subject: Re: [PATCH 20/20] drm: Remove obsolete GEM and PRIME callbacks from
 struct drm_driver
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-21-tzimmermann@suse.de>
 <20200813101659.GA752979@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b9943bf0-8a7d-96b3-c5f3-1e940d524efb@suse.de>
Date: Thu, 13 Aug 2020 12:33:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813101659.GA752979@ravnborg.org>
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
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, krzk@kernel.org, emil.velikov@collabora.com,
 abdiel.janulgue@linux.intel.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 michal.simek@xilinx.com, miaoqinglang@huawei.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, tomi.valkeinen@ti.com, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, marek.olsak@amd.com, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 rodrigosiqueiramelo@gmail.com, hyun.kwon@xilinx.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 kgene@kernel.org, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============1440187736=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1440187736==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9y9KMsxjjShQF8iXyEFXxsTSVMHBOxC7u"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9y9KMsxjjShQF8iXyEFXxsTSVMHBOxC7u
Content-Type: multipart/mixed; boundary="0fRH42pD71PFUBQdjrec5q0Fp6owMu0hv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 thierry.reding@gmail.com, krzk@kernel.org, emil.velikov@collabora.com,
 abdiel.janulgue@linux.intel.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 tomi.valkeinen@ti.com, linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 bskeggs@redhat.com, xen-devel@lists.xenproject.org, miaoqinglang@huawei.com,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 hyun.kwon@xilinx.com, rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, chris@chris-wilson.co.uk, kyungmin.park@samsung.com,
 nirmoy.das@amd.com, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Message-ID: <b9943bf0-8a7d-96b3-c5f3-1e940d524efb@suse.de>
Subject: Re: [PATCH 20/20] drm: Remove obsolete GEM and PRIME callbacks from
 struct drm_driver
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-21-tzimmermann@suse.de>
 <20200813101659.GA752979@ravnborg.org>
In-Reply-To: <20200813101659.GA752979@ravnborg.org>

--0fRH42pD71PFUBQdjrec5q0Fp6owMu0hv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 12:16 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Thu, Aug 13, 2020 at 10:36:44AM +0200, Thomas Zimmermann wrote:
>> Several GEM and PRIME callbacks have been deprecated in favor of
>> per-instance GEM object functions. Remove the callbacks as they are
>> now unused. The only exception is .gem_prime_mmap, which is still
>> in use by several drivers.
>>
>> What is also gone is gem_vm_ops in struct drm_driver. All drivers now
>> use struct drm_gem_object_funcs.vm_ops instead.
>>
>> While at it, the patch also improves error handling around calls
>> to .free and .get_sg_table callbacks.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> After this following entry in todo.rst is done?
>=20
> "
> struct drm_gem_object_funcs
> ---------------------------
>=20
> GEM objects can now have a function table instead of having the callbac=
ks on the
> DRM driver struct. This is now the preferred way and drivers can be mov=
ed over.

This should only say that .gem_prime_mmap() is left in struct
drm_drivers for conversion.

>=20
> We also need a 2nd version of the CMA define that doesn't require the
> vmapping to be present (different hook for prime importing). Plus this =
needs to
> be rolled out to all drivers using their own implementations, too.
> "

This sounds like it got fixed in the recent CMA clean-up series. There
are CMA initializer macros for drivers with and without vmap. I have to
take a closer look, but I think it can be removed.

Thanks for bringing this up.

Best regards
Thomas

>=20
> If yes, then delete it too.
>=20
> 	Sam
>=20
>> ---
>>  drivers/gpu/drm/drm_gem.c            | 35 +++---------
>>  drivers/gpu/drm/drm_gem_cma_helper.c |  6 +-
>>  drivers/gpu/drm/drm_prime.c          | 17 +++---
>>  include/drm/drm_drv.h                | 85 ++-------------------------=
-
>>  4 files changed, 23 insertions(+), 120 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 19d73868490e..96945bed8291 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -247,12 +247,9 @@ drm_gem_object_release_handle(int id, void *ptr, =
void *data)
>>  {
>>  	struct drm_file *file_priv =3D data;
>>  	struct drm_gem_object *obj =3D ptr;
>> -	struct drm_device *dev =3D obj->dev;
>> =20
>>  	if (obj->funcs && obj->funcs->close)
>>  		obj->funcs->close(obj, file_priv);
>> -	else if (dev->driver->gem_close_object)
>> -		dev->driver->gem_close_object(obj, file_priv);
>> =20
>>  	drm_gem_remove_prime_handles(obj, file_priv);
>>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>> @@ -407,10 +404,6 @@ drm_gem_handle_create_tail(struct drm_file *file_=
priv,
>>  		ret =3D obj->funcs->open(obj, file_priv);
>>  		if (ret)
>>  			goto err_revoke;
>> -	} else if (dev->driver->gem_open_object) {
>> -		ret =3D dev->driver->gem_open_object(obj, file_priv);
>> -		if (ret)
>> -			goto err_revoke;
>>  	}
>> =20
>>  	*handlep =3D handle;
>> @@ -982,12 +975,11 @@ drm_gem_object_free(struct kref *kref)
>>  {
>>  	struct drm_gem_object *obj =3D
>>  		container_of(kref, struct drm_gem_object, refcount);
>> -	struct drm_device *dev =3D obj->dev;
>> =20
>> -	if (obj->funcs)
>> -		obj->funcs->free(obj);
>> -	else if (dev->driver->gem_free_object_unlocked)
>> -		dev->driver->gem_free_object_unlocked(obj);
>> +	if (drm_WARN_ON_ONCE(obj->dev, !obj->funcs || !obj->funcs->free))
>> +		return;
>> +
>> +	obj->funcs->free(obj);
>>  }
>>  EXPORT_SYMBOL(drm_gem_object_free);
>> =20
>> @@ -1049,9 +1041,9 @@ EXPORT_SYMBOL(drm_gem_vm_close);
>>   * @obj_size: the object size to be mapped, in bytes
>>   * @vma: VMA for the area to be mapped
>>   *
>> - * Set up the VMA to prepare mapping of the GEM object using the gem_=
vm_ops
>> - * provided by the driver. Depending on their requirements, drivers c=
an either
>> - * provide a fault handler in their gem_vm_ops (in which case any acc=
esses to
>> + * Set up the VMA to prepare mapping of the GEM object using the GEM =
object's
>> + * vm_ops. Depending on their requirements, GEM objects can either
>> + * provide a fault handler in their vm_ops (in which case any accesse=
s to
>>   * the object will be trapped, to perform migration, GTT binding, sur=
face
>>   * register allocation, or performance monitoring), or mmap the buffe=
r memory
>>   * synchronously after calling drm_gem_mmap_obj.
>> @@ -1065,12 +1057,11 @@ EXPORT_SYMBOL(drm_gem_vm_close);
>>   * callers must verify access restrictions before calling this helper=
=2E
>>   *
>>   * Return 0 or success or -EINVAL if the object size is smaller than =
the VMA
>> - * size, or if no gem_vm_ops are provided.
>> + * size, or if no vm_ops are provided.
>>   */
>>  int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_si=
ze,
>>  		     struct vm_area_struct *vma)
>>  {
>> -	struct drm_device *dev =3D obj->dev;
>>  	int ret;
>> =20
>>  	/* Check for valid size. */
>> @@ -1095,8 +1086,6 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj,=
 unsigned long obj_size,
>>  	} else {
>>  		if (obj->funcs && obj->funcs->vm_ops)
>>  			vma->vm_ops =3D obj->funcs->vm_ops;
>> -		else if (dev->driver->gem_vm_ops)
>> -			vma->vm_ops =3D dev->driver->gem_vm_ops;
>>  		else {
>>  			drm_gem_object_put(obj);
>>  			return -EINVAL;
>> @@ -1206,8 +1195,6 @@ int drm_gem_pin(struct drm_gem_object *obj)
>>  {
>>  	if (obj->funcs && obj->funcs->pin)
>>  		return obj->funcs->pin(obj);
>> -	else if (obj->dev->driver->gem_prime_pin)
>> -		return obj->dev->driver->gem_prime_pin(obj);
>>  	else
>>  		return 0;
>>  }
>> @@ -1216,8 +1203,6 @@ void drm_gem_unpin(struct drm_gem_object *obj)
>>  {
>>  	if (obj->funcs && obj->funcs->unpin)
>>  		obj->funcs->unpin(obj);
>> -	else if (obj->dev->driver->gem_prime_unpin)
>> -		obj->dev->driver->gem_prime_unpin(obj);
>>  }
>> =20
>>  void *drm_gem_vmap(struct drm_gem_object *obj)
>> @@ -1226,8 +1211,6 @@ void *drm_gem_vmap(struct drm_gem_object *obj)
>> =20
>>  	if (obj->funcs && obj->funcs->vmap)
>>  		vaddr =3D obj->funcs->vmap(obj);
>> -	else if (obj->dev->driver->gem_prime_vmap)
>> -		vaddr =3D obj->dev->driver->gem_prime_vmap(obj);
>>  	else
>>  		vaddr =3D ERR_PTR(-EOPNOTSUPP);
>> =20
>> @@ -1244,8 +1227,6 @@ void drm_gem_vunmap(struct drm_gem_object *obj, =
void *vaddr)
>> =20
>>  	if (obj->funcs && obj->funcs->vunmap)
>>  		obj->funcs->vunmap(obj, vaddr);
>> -	else if (obj->dev->driver->gem_prime_vunmap)
>> -		obj->dev->driver->gem_prime_vunmap(obj, vaddr);
>>  }
>> =20
>>  /**
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/dr=
m_gem_cma_helper.c
>> index 822edeadbab3..209202257cc2 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -419,7 +419,7 @@ EXPORT_SYMBOL(drm_gem_cma_print_info);
>>   *
>>   * This function exports a scatter/gather table suitable for PRIME us=
age by
>>   * calling the standard DMA mapping API. Drivers using the CMA helper=
s should
>> - * set this as their &drm_driver.gem_prime_get_sg_table callback.
>> + * set this as their &drm_gem_object_funcs.get_sg_table callback.
>>   *
>>   * Returns:
>>   * A pointer to the scatter/gather table of pinned pages or NULL on f=
ailure.
>> @@ -542,7 +542,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
>>   * virtual address space. Since the CMA buffers are already mapped in=
to the
>>   * kernel virtual address space this simply returns the cached virtua=
l
>>   * address. Drivers using the CMA helpers should set this as their DR=
M
>> - * driver's &drm_driver.gem_prime_vmap callback.
>> + * driver's &drm_gem_object_funcs.vmap callback.
>>   *
>>   * Returns:
>>   * The kernel virtual address of the CMA GEM object's backing store.
>> @@ -564,7 +564,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
>>   * This function removes a buffer exported via DRM PRIME from the ker=
nel's
>>   * virtual address space. This is a no-op because CMA buffers cannot =
be
>>   * unmapped from kernel space. Drivers using the CMA helpers should s=
et this
>> - * as their &drm_driver.gem_prime_vunmap callback.
>> + * as their &drm_gem_object_funcs.vunmap callback.
>>   */
>>  void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr=
)
>>  {
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c=

>> index 1693aa7c14b5..9a87639e7008 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -386,10 +386,6 @@ static struct dma_buf *export_and_register_object=
(struct drm_device *dev,
>> =20
>>  	if (obj->funcs && obj->funcs->export)
>>  		dmabuf =3D obj->funcs->export(obj, flags);
>> -	else if (dev->driver->gem_prime_export)
>> -		dmabuf =3D dev->driver->gem_prime_export(obj, flags);
>> -	else
>> -		dmabuf =3D drm_gem_prime_export(obj, flags);
>>  	if (IS_ERR(dmabuf)) {
>>  		/* normally the created dma-buf takes ownership of the ref,
>>  		 * but if that fails then drop the ref
>> @@ -419,7 +415,7 @@ static struct dma_buf *export_and_register_object(=
struct drm_device *dev,
>>   * This is the PRIME export function which must be used mandatorily b=
y GEM
>>   * drivers to ensure correct lifetime management of the underlying GE=
M object.
>>   * The actual exporting from GEM object to a dma-buf is done through =
the
>> - * &drm_driver.gem_prime_export driver callback.
>> + * &drm_gem_object_funcs.export callback.
>>   */
>>  int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>  			       struct drm_file *file_priv, uint32_t handle,
>> @@ -616,15 +612,18 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_=
buf_attachment *attach,
>>  				     enum dma_data_direction dir)
>>  {
>>  	struct drm_gem_object *obj =3D attach->dmabuf->priv;
>> -	struct sg_table *sgt;
>> +	struct sg_table *sgt =3D NULL;
>> =20
>>  	if (WARN_ON(dir =3D=3D DMA_NONE))
>>  		return ERR_PTR(-EINVAL);
>> =20
>> -	if (obj->funcs)
>> +	if (obj->funcs && obj->funcs->get_sg_table)
>>  		sgt =3D obj->funcs->get_sg_table(obj);
>> -	else
>> -		sgt =3D obj->dev->driver->gem_prime_get_sg_table(obj);
>> +
>> +	if (!sgt)
>> +		return ERR_PTR(-EINVAL);
>> +	else if (IS_ERR(sgt))
>> +		return sgt;
>> =20
>>  	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
>>  			      DMA_ATTR_SKIP_CPU_SYNC)) {
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 7116abc1a04e..8b325bf6cef4 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -36,10 +36,12 @@ struct drm_file;
>>  struct drm_gem_object;
>>  struct drm_master;
>>  struct drm_minor;
>> +struct dma_buf;
>>  struct dma_buf_attachment;
>>  struct drm_display_mode;
>>  struct drm_mode_create_dumb;
>>  struct drm_printer;
>> +struct sg_table;
>> =20
>>  /**
>>   * enum drm_driver_feature - feature flags
>> @@ -327,32 +329,6 @@ struct drm_driver {
>>  	 */
>>  	void (*debugfs_init)(struct drm_minor *minor);
>> =20
>> -	/**
>> -	 * @gem_free_object_unlocked: deconstructor for drm_gem_objects
>> -	 *
>> -	 * This is deprecated and should not be used by new drivers. Use
>> -	 * &drm_gem_object_funcs.free instead.
>> -	 */
>> -	void (*gem_free_object_unlocked) (struct drm_gem_object *obj);
>> -
>> -	/**
>> -	 * @gem_open_object:
>> -	 *
>> -	 * This callback is deprecated in favour of &drm_gem_object_funcs.op=
en.
>> -	 *
>> -	 * Driver hook called upon gem handle creation
>> -	 */
>> -	int (*gem_open_object) (struct drm_gem_object *, struct drm_file *);=

>> -
>> -	/**
>> -	 * @gem_close_object:
>> -	 *
>> -	 * This callback is deprecated in favour of &drm_gem_object_funcs.cl=
ose.
>> -	 *
>> -	 * Driver hook called upon gem handle release
>> -	 */
>> -	void (*gem_close_object) (struct drm_gem_object *, struct drm_file *=
);
>> -
>>  	/**
>>  	 * @gem_create_object: constructor for gem objects
>>  	 *
>> @@ -361,6 +337,7 @@ struct drm_driver {
>>  	 */
>>  	struct drm_gem_object *(*gem_create_object)(struct drm_device *dev,
>>  						    size_t size);
>> +
>>  	/**
>>  	 * @prime_handle_to_fd:
>>  	 *
>> @@ -383,14 +360,7 @@ struct drm_driver {
>>  	 */
>>  	int (*prime_fd_to_handle)(struct drm_device *dev, struct drm_file *f=
ile_priv,
>>  				int prime_fd, uint32_t *handle);
>> -	/**
>> -	 * @gem_prime_export:
>> -	 *
>> -	 * Export hook for GEM drivers. Deprecated in favour of
>> -	 * &drm_gem_object_funcs.export.
>> -	 */
>> -	struct dma_buf * (*gem_prime_export)(struct drm_gem_object *obj,
>> -					     int flags);
>> +
>>  	/**
>>  	 * @gem_prime_import:
>>  	 *
>> @@ -400,29 +370,6 @@ struct drm_driver {
>>  	 */
>>  	struct drm_gem_object * (*gem_prime_import)(struct drm_device *dev,
>>  				struct dma_buf *dma_buf);
>> -
>> -	/**
>> -	 * @gem_prime_pin:
>> -	 *
>> -	 * Deprecated hook in favour of &drm_gem_object_funcs.pin.
>> -	 */
>> -	int (*gem_prime_pin)(struct drm_gem_object *obj);
>> -
>> -	/**
>> -	 * @gem_prime_unpin:
>> -	 *
>> -	 * Deprecated hook in favour of &drm_gem_object_funcs.unpin.
>> -	 */
>> -	void (*gem_prime_unpin)(struct drm_gem_object *obj);
>> -
>> -
>> -	/**
>> -	 * @gem_prime_get_sg_table:
>> -	 *
>> -	 * Deprecated hook in favour of &drm_gem_object_funcs.get_sg_table.
>> -	 */
>> -	struct sg_table *(*gem_prime_get_sg_table)(struct drm_gem_object *ob=
j);
>> -
>>  	/**
>>  	 * @gem_prime_import_sg_table:
>>  	 *
>> @@ -433,22 +380,6 @@ struct drm_driver {
>>  				struct drm_device *dev,
>>  				struct dma_buf_attachment *attach,
>>  				struct sg_table *sgt);
>> -	/**
>> -	 * @gem_prime_vmap:
>> -	 *
>> -	 * Deprecated vmap hook for GEM drivers. Please use
>> -	 * &drm_gem_object_funcs.vmap instead.
>> -	 */
>> -	void *(*gem_prime_vmap)(struct drm_gem_object *obj);
>> -
>> -	/**
>> -	 * @gem_prime_vunmap:
>> -	 *
>> -	 * Deprecated vunmap hook for GEM drivers. Please use
>> -	 * &drm_gem_object_funcs.vunmap instead.
>> -	 */
>> -	void (*gem_prime_vunmap)(struct drm_gem_object *obj, void *vaddr);
>> -
>>  	/**
>>  	 * @gem_prime_mmap:
>>  	 *
>> @@ -523,14 +454,6 @@ struct drm_driver {
>>  			    struct drm_device *dev,
>>  			    uint32_t handle);
>> =20
>> -	/**
>> -	 * @gem_vm_ops: Driver private ops for this object
>> -	 *
>> -	 * For GEM drivers this is deprecated in favour of
>> -	 * &drm_gem_object_funcs.vm_ops.
>> -	 */
>> -	const struct vm_operations_struct *gem_vm_ops;
>> -
>>  	/** @major: driver major number */
>>  	int major;
>>  	/** @minor: driver minor number */
>> --=20
>> 2.28.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0fRH42pD71PFUBQdjrec5q0Fp6owMu0hv--

--9y9KMsxjjShQF8iXyEFXxsTSVMHBOxC7u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl81Ft8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiM1lQf9G9wo3YjMP/60DuchnFCPn0Yb5R0r
tQmou0fH68UXoP3fvghSWnMAy0Ioltew8tR3r+LZvtNfsI3JjjmJdjVEf8j3gq6/
bkKIJm58WHGgjKpKVQSu4hD9+XY+eCVYb9C5wsi+HXsTf1iGL822wqXotd8EkTwJ
0AP8ZNUm+DmPW0V0CiGoI/3s+fC+DqmLwTi2csS5IcjnCmL2ot/3T7rfXKl+GIj9
928lvTdGm9lSHKdz9KlIwvcg99ukw5pi0T/7gz862uKhW51iKP46D446aLSPIChy
UcAV9X14vIV1CKnmT97ngL1tMCICslKg3voVXTqcVsCkUYAiCqVBTZEnAg==
=urNW
-----END PGP SIGNATURE-----

--9y9KMsxjjShQF8iXyEFXxsTSVMHBOxC7u--

--===============1440187736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1440187736==--
