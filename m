Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F63D2C25
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 20:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FC06E9C2;
	Thu, 22 Jul 2021 18:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993C86E9C2;
 Thu, 22 Jul 2021 18:50:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2F9B91FF22;
 Thu, 22 Jul 2021 18:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626979849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jJI+31ci7r1q0OQHFi1jl4OFf+E9PTKis00dnNRTDOg=;
 b=0N6KmGo8CXPbdt2nRZ9xKLHlj/IEhDyyQ+CMa7vzNDpUhozQDZxg3D2qqhmP/uGV8Izl4n
 P4jStK0DbGbxYdnQZwwTZ6ZLFzjO6yQizAt6cJGWfou+CPPPw3PTodAbbtIQ4rlf6kbcl+
 cUIjo0HdT9DVLDWkwmXGLb8JbcFgV2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626979849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jJI+31ci7r1q0OQHFi1jl4OFf+E9PTKis00dnNRTDOg=;
 b=qdTnSucGzDVrhCMdvf0vG6UOlah9dI3CKfgUYGXywXDMJOmtGBu9FjFzUTNJ9i4LWrOBB4
 eLrwbc9VWTaZY3AA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DFDAF139A1;
 Thu, 22 Jul 2021 18:50:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id PKL6NAi++WAJRQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Jul 2021 18:50:48 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-5-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 4/4] drm/vgem: use shmem helpers
Message-ID: <583f682a-bc0b-54a0-442d-487a500bcb1c@suse.de>
Date: Thu, 22 Jul 2021 20:50:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713205153.1896059-5-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rBZIBvXy5E3CQe97YItKWT1KenSj8fVei"
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rBZIBvXy5E3CQe97YItKWT1KenSj8fVei
Content-Type: multipart/mixed; boundary="ynjEkjb46i9ZYfFzgP0qTUdGgXnpBgHyN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 John Stultz <john.stultz@linaro.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Melissa Wen <melissa.srw@gmail.com>, Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <583f682a-bc0b-54a0-442d-487a500bcb1c@suse.de>
Subject: Re: [PATCH v4 4/4] drm/vgem: use shmem helpers
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20210713205153.1896059-5-daniel.vetter@ffwll.ch>

--ynjEkjb46i9ZYfFzgP0qTUdGgXnpBgHyN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.07.21 um 22:51 schrieb Daniel Vetter:
> Aside from deleting lots of code the real motivation here is to switch
> the mmap over to VM_PFNMAP, to be more consistent with what real gpu
> drivers do. They're all VM_PFNMP, which means get_user_pages doesn't
> work, and even if you try and there's a struct page behind that,
> touching it and mucking around with its refcount can upset drivers
> real bad.
>=20
> v2: Review from Thomas:
> - sort #include
> - drop more dead code that I didn't spot somehow
>=20
> v3: select DRM_GEM_SHMEM_HELPER to make it build (intel-gfx-ci)
>=20
> v4: I got tricked by 0cf2ef46c6c0 ("drm/shmem-helper: Use cached
> mappings by default"), and we need WC in vgem because vgem doesn't
> have explicit begin/end cpu access ioctls.
>=20
> Also add a comment why exactly vgem has to use wc.
>=20
> v5: Don't set obj->base.funcs, it will default to drm_gem_shmem_funcs
> (Thomas)
>=20
> v6: vgem also needs an MMU for remapping
>=20
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/Kconfig         |   5 +-
>   drivers/gpu/drm/vgem/vgem_drv.c | 315 ++-----------------------------=
-
>   2 files changed, 15 insertions(+), 305 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 314eefa39892..28f7d2006e8b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -272,7 +272,8 @@ source "drivers/gpu/drm/kmb/Kconfig"
>  =20
>   config DRM_VGEM
>   	tristate "Virtual GEM provider"
> -	depends on DRM
> +	depends on DRM && MMU
> +	select DRM_GEM_SHMEM_HELPER
>   	help
>   	  Choose this option to get a virtual graphics memory manager,
>   	  as used by Mesa's software renderer for enhanced performance.
> @@ -280,7 +281,7 @@ config DRM_VGEM
>  =20
>   config DRM_VKMS
>   	tristate "Virtual KMS (EXPERIMENTAL)"
> -	depends on DRM
> +	depends on DRM && MMU
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_SHMEM_HELPER
>   	select CRC32
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vge=
m_drv.c
> index bf38a7e319d1..ba410ba6b7f7 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -38,6 +38,7 @@
>  =20
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
> +#include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_prime.h>
> @@ -50,87 +51,11 @@
>   #define DRIVER_MAJOR	1
>   #define DRIVER_MINOR	0
>  =20
> -static const struct drm_gem_object_funcs vgem_gem_object_funcs;
> -
>   static struct vgem_device {
>   	struct drm_device drm;
>   	struct platform_device *platform;
>   } *vgem_device;
>  =20
> -static void vgem_gem_free_object(struct drm_gem_object *obj)
> -{
> -	struct drm_vgem_gem_object *vgem_obj =3D to_vgem_bo(obj);
> -
> -	kvfree(vgem_obj->pages);
> -	mutex_destroy(&vgem_obj->pages_lock);
> -
> -	if (obj->import_attach)
> -		drm_prime_gem_destroy(obj, vgem_obj->table);
> -
> -	drm_gem_object_release(obj);
> -	kfree(vgem_obj);
> -}
> -
> -static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
> -{
> -	struct vm_area_struct *vma =3D vmf->vma;
> -	struct drm_vgem_gem_object *obj =3D vma->vm_private_data;
> -	/* We don't use vmf->pgoff since that has the fake offset */
> -	unsigned long vaddr =3D vmf->address;
> -	vm_fault_t ret =3D VM_FAULT_SIGBUS;
> -	loff_t num_pages;
> -	pgoff_t page_offset;
> -	page_offset =3D (vaddr - vma->vm_start) >> PAGE_SHIFT;
> -
> -	num_pages =3D DIV_ROUND_UP(obj->base.size, PAGE_SIZE);
> -
> -	if (page_offset >=3D num_pages)
> -		return VM_FAULT_SIGBUS;
> -
> -	mutex_lock(&obj->pages_lock);
> -	if (obj->pages) {
> -		get_page(obj->pages[page_offset]);
> -		vmf->page =3D obj->pages[page_offset];
> -		ret =3D 0;
> -	}
> -	mutex_unlock(&obj->pages_lock);
> -	if (ret) {
> -		struct page *page;
> -
> -		page =3D shmem_read_mapping_page(
> -					file_inode(obj->base.filp)->i_mapping,
> -					page_offset);
> -		if (!IS_ERR(page)) {
> -			vmf->page =3D page;
> -			ret =3D 0;
> -		} else switch (PTR_ERR(page)) {
> -			case -ENOSPC:
> -			case -ENOMEM:
> -				ret =3D VM_FAULT_OOM;
> -				break;
> -			case -EBUSY:
> -				ret =3D VM_FAULT_RETRY;
> -				break;
> -			case -EFAULT:
> -			case -EINVAL:
> -				ret =3D VM_FAULT_SIGBUS;
> -				break;
> -			default:
> -				WARN_ON(PTR_ERR(page));
> -				ret =3D VM_FAULT_SIGBUS;
> -				break;
> -		}
> -
> -	}
> -	return ret;
> -}
> -
> -static const struct vm_operations_struct vgem_gem_vm_ops =3D {
> -	.fault =3D vgem_gem_fault,
> -	.open =3D drm_gem_vm_open,
> -	.close =3D drm_gem_vm_close,
> -};
> -
>   static int vgem_open(struct drm_device *dev, struct drm_file *file)
>   {
>   	struct vgem_file *vfile;
> @@ -159,81 +84,6 @@ static void vgem_postclose(struct drm_device *dev, =
struct drm_file *file)
>   	kfree(vfile);
>   }
>  =20
> -static struct drm_vgem_gem_object *__vgem_gem_create(struct drm_device=
 *dev,
> -						unsigned long size)
> -{
> -	struct drm_vgem_gem_object *obj;
> -	int ret;
> -
> -	obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> -	if (!obj)
> -		return ERR_PTR(-ENOMEM);
> -
> -	obj->base.funcs =3D &vgem_gem_object_funcs;
> -
> -	ret =3D drm_gem_object_init(dev, &obj->base, roundup(size, PAGE_SIZE)=
);
> -	if (ret) {
> -		kfree(obj);
> -		return ERR_PTR(ret);
> -	}
> -
> -	mutex_init(&obj->pages_lock);
> -
> -	return obj;
> -}
> -
> -static void __vgem_gem_destroy(struct drm_vgem_gem_object *obj)
> -{
> -	drm_gem_object_release(&obj->base);
> -	kfree(obj);
> -}
> -
> -static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
> -					      struct drm_file *file,
> -					      unsigned int *handle,
> -					      unsigned long size)
> -{
> -	struct drm_vgem_gem_object *obj;
> -	int ret;
> -
> -	obj =3D __vgem_gem_create(dev, size);
> -	if (IS_ERR(obj))
> -		return ERR_CAST(obj);
> -
> -	ret =3D drm_gem_handle_create(file, &obj->base, handle);
> -	if (ret) {
> -		drm_gem_object_put(&obj->base);
> -		return ERR_PTR(ret);
> -	}
> -
> -	return &obj->base;
> -}
> -
> -static int vgem_gem_dumb_create(struct drm_file *file, struct drm_devi=
ce *dev,
> -				struct drm_mode_create_dumb *args)
> -{
> -	struct drm_gem_object *gem_object;
> -	u64 pitch, size;
> -
> -	pitch =3D args->width * DIV_ROUND_UP(args->bpp, 8);
> -	size =3D args->height * pitch;
> -	if (size =3D=3D 0)
> -		return -EINVAL;
> -
> -	gem_object =3D vgem_gem_create(dev, file, &args->handle, size);
> -	if (IS_ERR(gem_object))
> -		return PTR_ERR(gem_object);
> -
> -	args->size =3D gem_object->size;
> -	args->pitch =3D pitch;
> -
> -	drm_gem_object_put(gem_object);
> -
> -	DRM_DEBUG("Created object of size %llu\n", args->size);
> -
> -	return 0;
> -}
> -
>   static struct drm_ioctl_desc vgem_ioctls[] =3D {
>   	DRM_IOCTL_DEF_DRV(VGEM_FENCE_ATTACH, vgem_fence_attach_ioctl, DRM_RE=
NDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL, vgem_fence_signal_ioctl, DRM_RE=
NDER_ALLOW),
> @@ -266,159 +116,23 @@ static const struct file_operations vgem_driver_=
fops =3D {
>   	.release	=3D drm_release,
>   };
>  =20
> -static struct page **vgem_pin_pages(struct drm_vgem_gem_object *bo)
> -{
> -	mutex_lock(&bo->pages_lock);
> -	if (bo->pages_pin_count++ =3D=3D 0) {
> -		struct page **pages;
> -
> -		pages =3D drm_gem_get_pages(&bo->base);
> -		if (IS_ERR(pages)) {
> -			bo->pages_pin_count--;
> -			mutex_unlock(&bo->pages_lock);
> -			return pages;
> -		}
> -
> -		bo->pages =3D pages;
> -	}
> -	mutex_unlock(&bo->pages_lock);
> -
> -	return bo->pages;
> -}
> -
> -static void vgem_unpin_pages(struct drm_vgem_gem_object *bo)
> +static struct drm_gem_object *vgem_gem_create_object(struct drm_device=
 *dev, size_t size)
>   {
> -	mutex_lock(&bo->pages_lock);
> -	if (--bo->pages_pin_count =3D=3D 0) {
> -		drm_gem_put_pages(&bo->base, bo->pages, true, true);
> -		bo->pages =3D NULL;
> -	}
> -	mutex_unlock(&bo->pages_lock);
> -}
> +	struct drm_gem_shmem_object *obj;
>  =20
> -static int vgem_prime_pin(struct drm_gem_object *obj)
> -{
> -	struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> -	long n_pages =3D obj->size >> PAGE_SHIFT;
> -	struct page **pages;
> -
> -	pages =3D vgem_pin_pages(bo);
> -	if (IS_ERR(pages))
> -		return PTR_ERR(pages);
> +	obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return NULL;
>  =20
> -	/* Flush the object from the CPU cache so that importers can rely
> -	 * on coherent indirect access via the exported dma-address.
> +	/*
> +	 * vgem doesn't have any begin/end cpu access ioctls, therefore must =
use
> +	 * coherent memory or dma-buf sharing just wont work.
>   	 */
> -	drm_clflush_pages(pages, n_pages);

Instead of shoehorning GEM SHMEM to get caching right (patch 2) have you =

considered to set your own GEM funcs object for vgem. All function=20
pointers would point to SHMEM functions, except for pin, which would be
drm_gem_shmem_pin() + drm_clflush_pages(). If this works, I think it=20
would be much preferable to the current patch 2. You can override the=20
default GEM functions from within vgem_gem_create_object().

Best regards
Thomas


> -
> -	return 0;
> -}
> -
> -static void vgem_prime_unpin(struct drm_gem_object *obj)
> -{
> -	struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> -
> -	vgem_unpin_pages(bo);
> -}
> -
> -static struct sg_table *vgem_prime_get_sg_table(struct drm_gem_object =
*obj)
> -{
> -	struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> -
> -	return drm_prime_pages_to_sg(obj->dev, bo->pages, bo->base.size >> PA=
GE_SHIFT);
> -}
> -
> -static struct drm_gem_object* vgem_prime_import(struct drm_device *dev=
,
> -						struct dma_buf *dma_buf)
> -{
> -	struct vgem_device *vgem =3D container_of(dev, typeof(*vgem), drm);
> -
> -	return drm_gem_prime_import_dev(dev, dma_buf, &vgem->platform->dev);
> -}
> -
> -static struct drm_gem_object *vgem_prime_import_sg_table(struct drm_de=
vice *dev,
> -			struct dma_buf_attachment *attach, struct sg_table *sg)
> -{
> -	struct drm_vgem_gem_object *obj;
> -	int npages;
> -
> -	obj =3D __vgem_gem_create(dev, attach->dmabuf->size);
> -	if (IS_ERR(obj))
> -		return ERR_CAST(obj);
> -
> -	npages =3D PAGE_ALIGN(attach->dmabuf->size) / PAGE_SIZE;
> -
> -	obj->table =3D sg;
> -	obj->pages =3D kvmalloc_array(npages, sizeof(struct page *), GFP_KERN=
EL);
> -	if (!obj->pages) {
> -		__vgem_gem_destroy(obj);
> -		return ERR_PTR(-ENOMEM);
> -	}
> +	obj->map_wc =3D true;
>  =20
> -	obj->pages_pin_count++; /* perma-pinned */
> -	drm_prime_sg_to_page_array(obj->table, obj->pages, npages);
>   	return &obj->base;
>   }
>  =20
> -static int vgem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_=
map *map)
> -{
> -	struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> -	long n_pages =3D obj->size >> PAGE_SHIFT;
> -	struct page **pages;
> -	void *vaddr;
> -
> -	pages =3D vgem_pin_pages(bo);
> -	if (IS_ERR(pages))
> -		return PTR_ERR(pages);
> -
> -	vaddr =3D vmap(pages, n_pages, 0, pgprot_writecombine(PAGE_KERNEL));
> -	if (!vaddr)
> -		return -ENOMEM;
> -	dma_buf_map_set_vaddr(map, vaddr);
> -
> -	return 0;
> -}
> -
> -static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_b=
uf_map *map)
> -{
> -	struct drm_vgem_gem_object *bo =3D to_vgem_bo(obj);
> -
> -	vunmap(map->vaddr);
> -	vgem_unpin_pages(bo);
> -}
> -
> -static int vgem_prime_mmap(struct drm_gem_object *obj,
> -			   struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	if (obj->size < vma->vm_end - vma->vm_start)
> -		return -EINVAL;
> -
> -	if (!obj->filp)
> -		return -ENODEV;
> -
> -	ret =3D call_mmap(obj->filp, vma);
> -	if (ret)
> -		return ret;
> -
> -	vma_set_file(vma, obj->filp);
> -	vma->vm_flags |=3D VM_DONTEXPAND | VM_DONTDUMP;
> -	vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_fl=
ags));
> -
> -	return 0;
> -}
> -
> -static const struct drm_gem_object_funcs vgem_gem_object_funcs =3D {
> -	.free =3D vgem_gem_free_object,
> -	.pin =3D vgem_prime_pin,
> -	.unpin =3D vgem_prime_unpin,
> -	.get_sg_table =3D vgem_prime_get_sg_table,
> -	.vmap =3D vgem_prime_vmap,
> -	.vunmap =3D vgem_prime_vunmap,
> -	.vm_ops =3D &vgem_gem_vm_ops,
> -};
> -
>   static const struct drm_driver vgem_driver =3D {
>   	.driver_features		=3D DRIVER_GEM | DRIVER_RENDER,
>   	.open				=3D vgem_open,
> @@ -427,13 +141,8 @@ static const struct drm_driver vgem_driver =3D {
>   	.num_ioctls 			=3D ARRAY_SIZE(vgem_ioctls),
>   	.fops				=3D &vgem_driver_fops,
>  =20
> -	.dumb_create			=3D vgem_gem_dumb_create,
> -
> -	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
> -	.gem_prime_import =3D vgem_prime_import,
> -	.gem_prime_import_sg_table =3D vgem_prime_import_sg_table,
> -	.gem_prime_mmap =3D vgem_prime_mmap,
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.gem_create_object		=3D vgem_gem_create_object,
>  =20
>   	.name	=3D DRIVER_NAME,
>   	.desc	=3D DRIVER_DESC,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ynjEkjb46i9ZYfFzgP0qTUdGgXnpBgHyN--

--rBZIBvXy5E3CQe97YItKWT1KenSj8fVei
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD5vggFAwAAAAAACgkQlh/E3EQov+CP
GhAA0GphBZjcg3ST235TVnZGESAA8H5mH7qXgF0YHY0qhmXzwliMiXEyPy8lAU98TD8T1xSFBGOZ
vu5zDDQkezKVjxbwz6Rvos7tK0zENnIn+rw6bQJVq92WeOomFYDh2fRZXmx2jSWZV9Mg48TVDYYK
a/PkVB1wKPBj5+Rp+k76RmvZSR9lCoJdyUKV/g+p6l8t/ORW+6Y5IbnBco+oiAOhf9ZK2ypc8c05
ubvEDCfYlWlXWT5KP8U+btGglSZnkPxu8THWiw4xS5/XsHA7lLpL+yqauKPK8C5SVvNDbq04ONCc
r/pjABrxuFLDKzxp3id0Oy8O7RN33ZcQ+RAKP4jufeMh6AhAixUNdOhjLOoUpLD2Y5jiSB2R75TD
hweHmLXtRUYgL2BovmsiZ5Ub3fSB3Vodd7PwWRV3UonZtHjzFztXn+tYs/PbbGv5IG8FiPkVvXoF
GAZJ7NiCcbMtdXC4JKtBglw7fJyD+Sg5p5Mu3DxUK+kau2Qi5sAP1JeafHayITw5fhyMNgl3XpE6
4BfVUaTuLMXiHHjHH7goACdrQfK+YRtH4WQETDXz/i6tMgK/8nibSwrEsndHe4wnedlBAZ8aw7e8
kmYyl281Lit1TTjDqH4lfL2aDecpD6yCZ11uB4WIL1TKLp5s4wc6sMdy8Z0pXVVD9QeMkgynkVUq
i+w=
=wmub
-----END PGP SIGNATURE-----

--rBZIBvXy5E3CQe97YItKWT1KenSj8fVei--
