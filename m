Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E61D3025
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F3B6EB38;
	Thu, 14 May 2020 12:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43BA6EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:44:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k12so30146248wmj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c1n27MIMqU90QvW8GHnumZETZ1fo/AOxbkyDg8zNLwI=;
 b=W1wPo/FphenBKBdPHMeGuSunwh+OOsa0FOmWjqU06VwYrkQyab3OrPKz95WbqNtuKR
 uuSaaSEU4BOusKjPfLVIKGBNMFM+GcpBzwBtaVvHDiCmKsdMwGhVAKE84PVEwAyzqkQp
 OdQNaVLvoSZli+IaaxhrTgJGq6t4W16jRDyZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c1n27MIMqU90QvW8GHnumZETZ1fo/AOxbkyDg8zNLwI=;
 b=tjLufe2TKnvETsbPcHNcn2EAP0E2sQJ6WyfaTfM6hXxiDFO9v+2vJd+hDc9zU6VIgH
 RCf/lYN50NZrVBjPK3Ernfc5y3c6bA3dhrryfdEOqPnZ4FCohc/HrSj225W/OPZCjxdX
 tUr37ma9pdiQXcYpsF5wzXICDwrMzliQnb3baQh/1Meb0+5jPy/dhjyToo7t8F7IL1/w
 X85qj79jivpEFjGSnNgKJWtJ3yy2IZgUmXVQVuAo/eB8Jh6l87cGjth27VGkZsDfHZMT
 HZkO+j2OenkLflezFnBzn5huTKEtLvCel1qGj2F0DpOQq/rd2W6CkNMYMLcUzkoQV1bG
 exag==
X-Gm-Message-State: AGi0PuZTG0l2iCp26JZNaVPpPHp+0xN+ylEoRK3ALheegYuxoL7J2Fru
 EJipE4aPbiYZvIu7KOOiaeqYfg==
X-Google-Smtp-Source: APiQypKhAzY2xx57NgUGeY6mvAFHnXGPNIPzbLg1Qaz48IKTDnLIBotl9D/Vur75v199ygYS/OWdfA==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr23700994wml.75.1589460262386; 
 Thu, 14 May 2020 05:44:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f123sm27235819wmf.44.2020.05.14.05.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:44:21 -0700 (PDT)
Date: Thu, 14 May 2020 14:44:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/udl: Use GEM vmap/mmap function from SHMEM helpers
Message-ID: <20200514124419.GW206103@phenom.ffwll.local>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513150312.21421-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: sam@ravnborg.org, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 05:03:12PM +0200, Thomas Zimmermann wrote:
> The udl driver contains an implementation of GEM vmap and mmap
> operations that is identical to the common SHMEM helper; except
> that udl's code does not support writecombine mappings.
> 
> Convert udl to regular SHMEM helper functions. There's no reason
> to have udl behave differently from all other SHMEM drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Since I'm not sure how patch 1 works in this series I think keeping the
udl_driver_gem_create_object but just let it set the map_cached = true; is
all we need?
-Daniel

> ---
>  drivers/gpu/drm/udl/Makefile  |   2 +-
>  drivers/gpu/drm/udl/udl_drv.c |   3 -
>  drivers/gpu/drm/udl/udl_drv.h |   3 -
>  drivers/gpu/drm/udl/udl_gem.c | 106 ----------------------------------
>  4 files changed, 1 insertion(+), 113 deletions(-)
>  delete mode 100644 drivers/gpu/drm/udl/udl_gem.c
> 
> diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
> index b50179bb4de06..24d61f61d7db2 100644
> --- a/drivers/gpu/drm/udl/Makefile
> +++ b/drivers/gpu/drm/udl/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -udl-y := udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_transfer.o udl_gem.o
> +udl-y := udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_transfer.o
>  
>  obj-$(CONFIG_DRM_UDL) := udl.o
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index d1aa50fd6d65a..cf5b679bf58bb 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -37,9 +37,6 @@ DEFINE_DRM_GEM_FOPS(udl_driver_fops);
>  static struct drm_driver driver = {
>  	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>  
> -	/* gem hooks */
> -	.gem_create_object = udl_driver_gem_create_object,
> -
>  	.fops = &udl_driver_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
>  
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index 2642f94a63fc8..b1461f30780bc 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -81,9 +81,6 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
>  		     const char *front, char **urb_buf_ptr,
>  		     u32 byte_offset, u32 device_byte_offset, u32 byte_width);
>  
> -struct drm_gem_object *udl_driver_gem_create_object(struct drm_device *dev,
> -						    size_t size);
> -
>  int udl_drop_usb(struct drm_device *dev);
>  
>  #define CMD_WRITE_RAW8   "\xAF\x60" /**< 8 bit raw write command. */
> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_gem.c
> deleted file mode 100644
> index b6e26f98aa0af..0000000000000
> --- a/drivers/gpu/drm/udl/udl_gem.c
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2012 Red Hat
> - */
> -
> -#include <linux/dma-buf.h>
> -#include <linux/vmalloc.h>
> -
> -#include <drm/drm_drv.h>
> -#include <drm/drm_gem_shmem_helper.h>
> -#include <drm/drm_mode.h>
> -#include <drm/drm_prime.h>
> -
> -#include "udl_drv.h"
> -
> -/*
> - * GEM object funcs
> - */
> -
> -static int udl_gem_object_mmap(struct drm_gem_object *obj,
> -			       struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	ret = drm_gem_shmem_mmap(obj, vma);
> -	if (ret)
> -		return ret;
> -
> -	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> -	if (obj->import_attach)
> -		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> -	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> -
> -	return 0;
> -}
> -
> -static void *udl_gem_object_vmap(struct drm_gem_object *obj)
> -{
> -	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> -	int ret;
> -
> -	ret = mutex_lock_interruptible(&shmem->vmap_lock);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	if (shmem->vmap_use_count++ > 0)
> -		goto out;
> -
> -	ret = drm_gem_shmem_get_pages(shmem);
> -	if (ret)
> -		goto err_zero_use;
> -
> -	if (obj->import_attach)
> -		shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
> -	else
> -		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
> -				    VM_MAP, PAGE_KERNEL);
> -
> -	if (!shmem->vaddr) {
> -		DRM_DEBUG_KMS("Failed to vmap pages\n");
> -		ret = -ENOMEM;
> -		goto err_put_pages;
> -	}
> -
> -out:
> -	mutex_unlock(&shmem->vmap_lock);
> -	return shmem->vaddr;
> -
> -err_put_pages:
> -	drm_gem_shmem_put_pages(shmem);
> -err_zero_use:
> -	shmem->vmap_use_count = 0;
> -	mutex_unlock(&shmem->vmap_lock);
> -	return ERR_PTR(ret);
> -}
> -
> -static const struct drm_gem_object_funcs udl_gem_object_funcs = {
> -	.free = drm_gem_shmem_free_object,
> -	.print_info = drm_gem_shmem_print_info,
> -	.pin = drm_gem_shmem_pin,
> -	.unpin = drm_gem_shmem_unpin,
> -	.get_sg_table = drm_gem_shmem_get_sg_table,
> -	.vmap = udl_gem_object_vmap,
> -	.vunmap = drm_gem_shmem_vunmap,
> -	.mmap = udl_gem_object_mmap,
> -};
> -
> -/*
> - * Helpers for struct drm_driver
> - */
> -
> -struct drm_gem_object *udl_driver_gem_create_object(struct drm_device *dev,
> -						    size_t size)
> -{
> -	struct drm_gem_shmem_object *shmem;
> -	struct drm_gem_object *obj;
> -
> -	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
> -	if (!shmem)
> -		return NULL;
> -
> -	obj = &shmem->base;
> -	obj->funcs = &udl_gem_object_funcs;
> -
> -	return obj;
> -}
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
