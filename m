Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84601D19E4
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 17:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EEF6E894;
	Wed, 13 May 2020 15:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD546E894
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 15:49:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j5so40267wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uxE6iRqmTXrmG6Avsu+mCL6dtVsYTbbixIEwWSXPjUU=;
 b=MTQs+hyN8FhuxhV2DAiCVd63t/ur1OB5tTgxUJvvbUij/LO8MzfQVH2xQh3775DZZE
 mZOOx2wi6528MNqNRXxRN4R9d8HG9n0hD8EwZNAMCWzHEPGJWOuQh2RLIoEGSjUwUQYD
 LWmn4jCNLBmAeP8Z1EIYYTdzGm93xDFFBG8FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uxE6iRqmTXrmG6Avsu+mCL6dtVsYTbbixIEwWSXPjUU=;
 b=drEwiw3X0Z2o/ijkn2WQF2UaSA2STpJdf91DC4Vy4OfzBrk8CSERPvKBjkXuGvGPM8
 m7Mz2XjONCN45WY8eDNOyMKBHkPGu0NQTRLfKBrh/lMMs4Y/a4udbgGGz6ggUP9jqiCZ
 LR4y7F3eW9oOe/Wr+lKLjgI8qoT/MLpm1+Qytwa88gId79X8aOpuDXtfRrqazkJIxTmc
 KYYwXKRGuCFiDqMhTAWLXMp8Bl7fznAX5I3VtQETkrsNkICemUGT/8NPA9JqEcNSNFm/
 ZntK599bXdSX1NA4NTarmwwA5NM3nV4HhVwpNfoPU7N04OrptXWid2Hmv8em4jXCS+s/
 l4hw==
X-Gm-Message-State: AGi0PubucJsUGl49/smTkD7djkC6AXiZ9CSeMse9Rv0ARLq9UVVGmvS8
 ovrfljqeQLxlMIkSOUiQ7lywW8zbnk4=
X-Google-Smtp-Source: APiQypJ/Br4Q5SdPYRmLsS48+wJGiGwdZs2FlEO09W/U+8nFaoMb95EblZWRqOJ1DTMT+tRqPJe+5w==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr19905289wrt.322.1589384996047; 
 Wed, 13 May 2020 08:49:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r9sm19230094wmg.47.2020.05.13.08.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 08:49:55 -0700 (PDT)
Date: Wed, 13 May 2020 17:49:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/udl: Use GEM vmap/mmap function from SHMEM helpers
Message-ID: <20200513154953.GL206103@phenom.ffwll.local>
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

So I remember the problem again I think ... on some x86 gpu drivers
(*cough* i915 on specific chipsets) you get an uncached dma-buf.

Which means if you set up a cached mapping, you get corruption.

But if the shmem helpers to correctly forward _all_ calls to the dma-buf
functions of the exporter, this works. I've tried to clean up that a bit
with my patch series that I just posted this week, to make sure there's no
bugs like that.

I think once we have that fully sorted, we could land this and be happy.
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
