Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 605AA8BCB2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 17:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001276E190;
	Tue, 13 Aug 2019 15:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C596E17D;
 Tue, 13 Aug 2019 15:11:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v19so1770642wmj.5;
 Tue, 13 Aug 2019 08:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tp5uld9lfHh18m7fY/6QUhAxi+QJxhfd3CiVIG0MbmA=;
 b=UavDRegB2XA4ohJj6kjzcosLJLMbLJjLy+zb74ZDCTZUsajyZOEjsRrOSNXSSb3lON
 Cwa+THPy373WrWgYRxeXhk8mBzpHVq5ycz62WzeC+wOw2CkhPzRgM1aIG6o179oDD7Jp
 rB84Jne5eHnMFnQwRtwLZGlCRYYbMDsWUSHmYYCeGZPto2i5zuNaZm6VmGxz+YbADR/i
 weQfj3okoLIqShVidJllbPnR/5SU2EuLLjwqFgJ49zmhYLmkSXV9U5B4TwS57UBgzyB0
 y6XUuBVkeVV1+MnU9FTIYKG+IA5RXuS+x8QOMThp0zhyOirSJx6ofiNusNUJls/D8HYP
 w5RQ==
X-Gm-Message-State: APjAAAUinC43mYHEUMj0/dhi89Lu8TdI0daFvyFa4Iu8SY/4Ryf0aR7U
 A2W+fo3r7Ld0P2a5AgXUA6g=
X-Google-Smtp-Source: APXvYqy/KouDtl6mZwDMbXzYElgl7L4QUaHFAyZlbCtmk8uXlg3ZDrDK6TRLbbn4BMnSxDY6fwWAEQ==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr3491360wmj.133.1565709078621; 
 Tue, 13 Aug 2019 08:11:18 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id k124sm3839100wmk.47.2019.08.13.08.11.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 08:11:16 -0700 (PDT)
Date: Tue, 13 Aug 2019 17:11:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v6 08/17] drm/ttm: use gem vma_node
Message-ID: <20190813151115.GA29955@ulmo>
References: <20190805140119.7337-1-kraxel@redhat.com>
 <20190805140119.7337-9-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190805140119.7337-9-kraxel@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tp5uld9lfHh18m7fY/6QUhAxi+QJxhfd3CiVIG0MbmA=;
 b=SvKOy3G5pJS3mk1jeffqIzNAczI/Ay18RBtKMOh1OQQzWPahTziS+4cY+C3TooFhli
 TCP9ULVfdPyKrndaF23rY7fIsC/hZFzlfxXEIe2YjD1Hlik1x4I7oG9Z59wd6otHTKEo
 nzsrLUK8egIfMI4RKMePtWuA+vkZTG7MfDPCgOWj+oYAla2TGgx1BlCtKqAn8jXVX4Zq
 JpPL1gFVVB2XiavP8k5O9G7wUyihZcDTKAaeo2jPQVeW83UnNxNXJjq0VN4Eb3Bd1WrK
 LXoCC1+9rSTyCI+6BF961bkiwsX/On9jTyJ8Fg19e8RPfTtMweR84vbba4/XR3cjYF2d
 /IUA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, thomas@shipmail.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 tzimmermann@suse.de, ckoenig.leichtzumerken@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1378422347=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1378422347==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 04:01:10PM +0200, Gerd Hoffmann wrote:
> Drop vma_node from ttm_buffer_object, use the gem struct
> (base.vma_node) instead.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 2 +-
>  drivers/gpu/drm/qxl/qxl_object.h           | 2 +-
>  drivers/gpu/drm/radeon/radeon_object.h     | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h       | 2 +-
>  include/drm/ttm/ttm_bo_api.h               | 4 ----
>  drivers/gpu/drm/drm_gem_vram_helper.c      | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c  | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c      | 2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c               | 8 ++++----
>  drivers/gpu/drm/ttm/ttm_bo_util.c          | 2 +-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c            | 9 +++++----
>  drivers/gpu/drm/virtio/virtgpu_prime.c     | 3 ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 4 ++--
>  14 files changed, 21 insertions(+), 27 deletions(-)

Hi Gerd,

I've been seeing a regression on Nouveau with recent linux-next releases
and git bisect points at this commit as the first bad one. If I revert
it (there's a tiny conflict with a patch that was merged subsequently),
things are back to normal.

I think the reason for this issue is that Nouveau doesn't use GEM
objects for all buffer objects, and even when it uses GEM objects, the
code will not initialize the GEM object until after the buffer objects
and the backing TTM objects have been created.

I tried to fix that by making sure drm_gem_object_init() gets called by
Nouveau before ttm_bo_init(), but the changes are fairly involved and I
was unable to get the GEM reference counting right. I can look into the
proper fix some more, but it might be worth reverting this patch for
now to get Nouveau working again.

Thierry

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.h
> index 645a189d365c..113fb2feb437 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -191,7 +191,7 @@ static inline unsigned amdgpu_bo_gpu_page_alignment(s=
truct amdgpu_bo *bo)
>   */
>  static inline u64 amdgpu_bo_mmap_offset(struct amdgpu_bo *bo)
>  {
> -	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
> +	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
>  }
> =20
>  /**
> diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_o=
bject.h
> index b812d4ae9d0d..8ae54ba7857c 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.h
> +++ b/drivers/gpu/drm/qxl/qxl_object.h
> @@ -60,7 +60,7 @@ static inline unsigned long qxl_bo_size(struct qxl_bo *=
bo)
> =20
>  static inline u64 qxl_bo_mmap_offset(struct qxl_bo *bo)
>  {
> -	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
> +	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
>  }
> =20
>  static inline int qxl_bo_wait(struct qxl_bo *bo, u32 *mem_type,
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/rad=
eon/radeon_object.h
> index 9ffd8215d38a..e5554bf9140e 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -116,7 +116,7 @@ static inline unsigned radeon_bo_gpu_page_alignment(s=
truct radeon_bo *bo)
>   */
>  static inline u64 radeon_bo_mmap_offset(struct radeon_bo *bo)
>  {
> -	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
> +	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
>  }
> =20
>  extern int radeon_bo_wait(struct radeon_bo *bo, u32 *mem_type,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virti=
o/virtgpu_drv.h
> index f4ecea6054ba..e28829661724 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -396,7 +396,7 @@ static inline void virtio_gpu_object_unref(struct vir=
tio_gpu_object **bo)
> =20
>  static inline u64 virtio_gpu_object_mmap_offset(struct virtio_gpu_object=
 *bo)
>  {
> -	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
> +	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
>  }
> =20
>  static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo,
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index fa050f0328ab..7ffc50a3303d 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -152,7 +152,6 @@ struct ttm_tt;
>   * @ddestroy: List head for the delayed destroy list.
>   * @swap: List head for swap LRU list.
>   * @moving: Fence set when BO is moving
> - * @vma_node: Address space manager node.
>   * @offset: The current GPU offset, which can have different meanings
>   * depending on the memory type. For SYSTEM type memory, it should be 0.
>   * @cur_placement: Hint of current placement.
> @@ -219,9 +218,6 @@ struct ttm_buffer_object {
>  	 */
> =20
>  	struct dma_fence *moving;
> -
> -	struct drm_vma_offset_node vma_node;
> -
>  	unsigned priority;
> =20
>  	/**
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_=
gem_vram_helper.c
> index fc13920b3cb4..fd751078bae1 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -168,7 +168,7 @@ EXPORT_SYMBOL(drm_gem_vram_put);
>   */
>  u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
>  {
> -	return drm_vma_node_offset_addr(&gbo->bo.vma_node);
> +	return drm_vma_node_offset_addr(&gbo->bo.base.vma_node);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
> =20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index fc8f5bb73ca8..98afc50162e9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -675,7 +675,7 @@ nouveau_display_dumb_map_offset(struct drm_file *file=
_priv,
>  	gem =3D drm_gem_object_lookup(file_priv, handle);
>  	if (gem) {
>  		struct nouveau_bo *bo =3D nouveau_gem_object(gem);
> -		*poffset =3D drm_vma_node_offset_addr(&bo->bo.vma_node);
> +		*poffset =3D drm_vma_node_offset_addr(&bo->bo.base.vma_node);
>  		drm_gem_object_put_unlocked(gem);
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index 2f484ab7dbca..b1e4852810ed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -240,7 +240,7 @@ nouveau_gem_info(struct drm_file *file_priv, struct d=
rm_gem_object *gem,
>  	}
> =20
>  	rep->size =3D nvbo->bo.mem.num_pages << PAGE_SHIFT;
> -	rep->map_handle =3D drm_vma_node_offset_addr(&nvbo->bo.vma_node);
> +	rep->map_handle =3D drm_vma_node_offset_addr(&nvbo->bo.base.vma_node);
>  	rep->tile_mode =3D nvbo->mode;
>  	rep->tile_flags =3D nvbo->contig ? 0 : NOUVEAU_GEM_TILE_NONCONTIG;
>  	if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_FERMI)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ceff153f7e68..3e0a0cbc410e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -672,7 +672,7 @@ static void ttm_bo_release(struct kref *kref)
>  	struct ttm_bo_device *bdev =3D bo->bdev;
>  	struct ttm_mem_type_manager *man =3D &bdev->man[bo->mem.mem_type];
> =20
> -	drm_vma_offset_remove(&bdev->vma_manager, &bo->vma_node);
> +	drm_vma_offset_remove(&bdev->vma_manager, &bo->base.vma_node);
>  	ttm_mem_io_lock(man, false);
>  	ttm_mem_io_free_vm(bo);
>  	ttm_mem_io_unlock(man);
> @@ -1343,9 +1343,9 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  		 * struct elements we want use regardless.
>  		 */
>  		reservation_object_init(&bo->base._resv);
> +		drm_vma_node_reset(&bo->base.vma_node);
>  	}
>  	atomic_inc(&bo->bdev->glob->bo_count);
> -	drm_vma_node_reset(&bo->vma_node);
> =20
>  	/*
>  	 * For ttm_bo_type_device buffers, allocate
> @@ -1353,7 +1353,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  	 */
>  	if (bo->type =3D=3D ttm_bo_type_device ||
>  	    bo->type =3D=3D ttm_bo_type_sg)
> -		ret =3D drm_vma_offset_add(&bdev->vma_manager, &bo->vma_node,
> +		ret =3D drm_vma_offset_add(&bdev->vma_manager, &bo->base.vma_node,
>  					 bo->mem.num_pages);
> =20
>  	/* passed reservation objects should already be locked,
> @@ -1781,7 +1781,7 @@ void ttm_bo_unmap_virtual_locked(struct ttm_buffer_=
object *bo)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> =20
> -	drm_vma_node_unmap(&bo->vma_node, bdev->dev_mapping);
> +	drm_vma_node_unmap(&bo->base.vma_node, bdev->dev_mapping);
>  	ttm_mem_io_free_vm(bo);
>  }
> =20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 05fbcaf6a3f2..f5009c1b6a9c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -510,7 +510,7 @@ static int ttm_buffer_object_transfer(struct ttm_buff=
er_object *bo,
>  	INIT_LIST_HEAD(&fbo->base.io_reserve_lru);
>  	mutex_init(&fbo->base.wu_mutex);
>  	fbo->base.moving =3D NULL;
> -	drm_vma_node_reset(&fbo->base.vma_node);
> +	drm_vma_node_reset(&fbo->base.base.vma_node);
>  	atomic_set(&fbo->base.cpu_writers, 0);
> =20
>  	kref_init(&fbo->base.list_kref);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo=
_vm.c
> index 6dacff49c1cc..fb6875a789b7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -211,9 +211,9 @@ static vm_fault_t ttm_bo_vm_fault(struct vm_fault *vm=
f)
>  	}
> =20
>  	page_offset =3D ((address - vma->vm_start) >> PAGE_SHIFT) +
> -		vma->vm_pgoff - drm_vma_node_start(&bo->vma_node);
> +		vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
>  	page_last =3D vma_pages(vma) + vma->vm_pgoff -
> -		drm_vma_node_start(&bo->vma_node);
> +		drm_vma_node_start(&bo->base.vma_node);
> =20
>  	if (unlikely(page_offset >=3D bo->num_pages)) {
>  		ret =3D VM_FAULT_SIGBUS;
> @@ -267,7 +267,7 @@ static vm_fault_t ttm_bo_vm_fault(struct vm_fault *vm=
f)
>  			} else if (unlikely(!page)) {
>  				break;
>  			}
> -			page->index =3D drm_vma_node_start(&bo->vma_node) +
> +			page->index =3D drm_vma_node_start(&bo->base.vma_node) +
>  				page_offset;
>  			pfn =3D page_to_pfn(page);
>  		}
> @@ -413,7 +413,8 @@ static struct ttm_buffer_object *ttm_bo_vm_lookup(str=
uct ttm_bo_device *bdev,
> =20
>  	node =3D drm_vma_offset_lookup_locked(&bdev->vma_manager, offset, pages=
);
>  	if (likely(node)) {
> -		bo =3D container_of(node, struct ttm_buffer_object, vma_node);
> +		bo =3D container_of(node, struct ttm_buffer_object,
> +				  base.vma_node);
>  		bo =3D ttm_bo_get_unless_zero(bo);
>  	}
> =20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/vir=
tio/virtgpu_prime.c
> index 8b3b2caf3364..dc642a884b88 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -68,8 +68,5 @@ void virtgpu_gem_prime_vunmap(struct drm_gem_object *ob=
j, void *vaddr)
>  int virtgpu_gem_prime_mmap(struct drm_gem_object *obj,
>  			   struct vm_area_struct *vma)
>  {
> -	struct virtio_gpu_object *bo =3D gem_to_virtio_gpu_obj(obj);
> -
> -	bo->gem_base.vma_node.vm_node.start =3D bo->tbo.vma_node.vm_node.start;
>  	return drm_gem_prime_mmap(obj, vma);
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 315da41a18b4..5739c6c49c99 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -835,7 +835,7 @@ int vmw_bo_alloc_ioctl(struct drm_device *dev, void *=
data,
>  		goto out_no_bo;
> =20
>  	rep->handle =3D handle;
> -	rep->map_handle =3D drm_vma_node_offset_addr(&vbo->base.vma_node);
> +	rep->map_handle =3D drm_vma_node_offset_addr(&vbo->base.base.vma_node);
>  	rep->cur_gmr_id =3D handle;
>  	rep->cur_gmr_offset =3D 0;
> =20
> @@ -1077,7 +1077,7 @@ int vmw_dumb_map_offset(struct drm_file *file_priv,
>  	if (ret !=3D 0)
>  		return -EINVAL;
> =20
> -	*offset =3D drm_vma_node_offset_addr(&out_buf->base.vma_node);
> +	*offset =3D drm_vma_node_offset_addr(&out_buf->base.base.vma_node);
>  	vmw_bo_unreference(&out_buf);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index 219471903bc1..3a6da3b66484 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -1669,7 +1669,7 @@ vmw_gb_surface_define_internal(struct drm_device *d=
ev,
>  	rep->backup_size =3D res->backup_size;
>  	if (res->backup) {
>  		rep->buffer_map_handle =3D
> -			drm_vma_node_offset_addr(&res->backup->base.vma_node);
> +			drm_vma_node_offset_addr(&res->backup->base.base.vma_node);
>  		rep->buffer_size =3D res->backup->base.num_pages * PAGE_SIZE;
>  		rep->buffer_handle =3D backup_handle;
>  	} else {
> @@ -1745,7 +1745,7 @@ vmw_gb_surface_reference_internal(struct drm_device=
 *dev,
>  	rep->crep.backup_size =3D srf->res.backup_size;
>  	rep->crep.buffer_handle =3D backup_handle;
>  	rep->crep.buffer_map_handle =3D
> -		drm_vma_node_offset_addr(&srf->res.backup->base.vma_node);
> +		drm_vma_node_offset_addr(&srf->res.backup->base.base.vma_node);
>  	rep->crep.buffer_size =3D srf->res.backup->base.num_pages * PAGE_SIZE;
> =20
>  	rep->creq.version =3D drm_vmw_gb_surface_v1;
> --=20
> 2.18.1
>=20
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1S0xAACgkQ3SOs138+
s6EgVA//UpqDE4LMXsS9tr5P4hW4aXeIuY1uiNEyYx+15t1vb6jY5soPOlosXy6j
qA4qYVBczFCycwulg3rzITwZo1YpWKgCQGDzwrt9rHLYOH0rGIRkWezlYkiB3TKb
FKTcOioHEuR61wq940Ug9d4mYorSn3APRGh73ftKdsouskrqlBPr17wthobs5cGT
nq4DyEZEQ1ugM+PNbM2Xir8cdoIGvGo4Yx/Se1J3ua357xO3seRsKlW4N9PYqF8y
FyWExIed7iHjSbA4CqHiyD3bswHnyKcPlEcezEWAXdFMfgF2/WwTRzQrG/DjlySp
+FCGq1/S/cPX70ky81OPrO0UOw9Vd/jSy69H37MORQwpmEDFkb3vGxbg9cM1zZEK
URIls38z/VzvGza3ivvs0bkAk0fNvP6vOKFMpV+m0v+y2jS/J85Uqa05ankuYsdL
yBDI54eheOIyMvq3T9MPOpFy4wTz4Ud04PLiEdGJEdwXE2oTYrNyy5v/Ap2PE/Wx
OWzYKa335H4ECZMl/mA2wh47LPiX+W5s3w98q31qbrQm/r3+9/qNQGrdLbUGjFOu
iF7q0E+051KFoW7msmpmsI2puRAiZHIiv2qwP87svcpSa3AYu1JTenxbrwZ6AvlI
5rOgC37SnHumsivOjxMxmlr4NtcEsr4uOETcJRBU8Q4nzA4u4xQ=
=7v7k
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============1378422347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1378422347==--
