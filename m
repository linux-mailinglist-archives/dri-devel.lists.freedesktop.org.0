Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37E54337F4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 16:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9864E6EA8E;
	Tue, 19 Oct 2021 14:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA446EA8E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:02:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i12so47850064wrb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=qcZPXHneJ4LmI4c2/WT4alze3Z0wmZBTDnwmisEp4nU=;
 b=npvQVM69xSh8AwNE5XoPPVf6CFXpcFUmm66j1MuzJfpAXOSDa2Cu0H+sRgJryJNZpc
 1LSoLGqShhYOHFDSTL3G/asoSWQNVDch0MnbcVRN8rixY3LR32PyGSl46cn9XqKAsDUV
 yxj3l5wr5RDZJ107PkqM3tUqMMscACfvKU8VKLjWz6OXuxffs7rabv74Gf4jZXNKdX8C
 jY0E5BWmt1d8/z11OBrpEZnpGuwl+tkkpBJ3gc3Y9IKNwPDny7H0pBCEVHAIrSzRayws
 /sBBpFIsNazU43byA3GJeDmLBe7yg/atG70GLKbILhLBG0LuwLXdUQXAINn8kpEJZIeR
 lPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qcZPXHneJ4LmI4c2/WT4alze3Z0wmZBTDnwmisEp4nU=;
 b=YL1RekloC8kizHHcQ5HoPiQ0g1Ew4RW0dLOOXYD3aVe6vCOaTO41OsW/H2jgIp0V0y
 dG9FwbR4XgXRepiKvHoBNrlA1OqOQnPrWFKJEzirfBQx4DFPd+6fDxiE58kT8CnDX33c
 ydD32NIkEJRHaMi7mlMi0KVYe/tzyRqQN6YuYgKnHJG2JaYGsvFBcaDYGa1Watetl2ut
 1Y6rhCeFr7p3/N1YpPBihrNX4BXDJxvjHRlyBthcs8/zFBK1lbfsI2SrJui7Fq9ntDcF
 6g7b8GJ/LqTGJKXUa6H05B1DA/pfBSTH/xsdC5NvScGPGUZhBX40kk5iDiJzwmOwXi/2
 YW1g==
X-Gm-Message-State: AOAM533zb8ncmanNd54i4Qqpl6gfejV+LVqnLMsp4u/I1lHFFMadVwYA
 tiy1ohGf+BuOOmEzoxfq2fowamDAzLa8
X-Google-Smtp-Source: ABdhPJwWzhdHc7uj+A4KH1r8rZ8tmuyMN1XN7SG/nuLT5CqlS8LA2upjOiomzlseL9vXPb3fr4aqLQ==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr45976625wry.374.1634652125847; 
 Tue, 19 Oct 2021 07:02:05 -0700 (PDT)
Received: from ?IPv6:2a02:810b:f40:4200:c0be:9a16:558c:2838?
 ([2a02:810b:f40:4200:c0be:9a16:558c:2838])
 by smtp.gmail.com with ESMTPSA id x21sm2269499wmc.14.2021.10.19.07.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 07:02:05 -0700 (PDT)
Subject: Re: drm/rockchip: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, hjc@rock-chips.com,
 heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org
References: <20210624095502.8945-1-tzimmermann@suse.de>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <7e0c55c3-604f-6948-fce2-a7c1df17a4a5@gmail.com>
Date: Tue, 19 Oct 2021 16:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210624095502.8945-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 24.06.21 um 11:55 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> The respective rockchip functions are being removed. The file_operations
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().

Also

     Tested-by: Alex Bee <knaerzche@gmail.com>

on RK3188/RK3066, i.e. on SoCs w/o IOMMU for vop.

Could someone pick this up for review/merging?

Thanks,

Alex.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   | 13 +-----
>   drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  3 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 44 +++++--------------
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |  7 ---
>   4 files changed, 15 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index b730b8d5d949..2e3ab573a817 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -208,16 +208,7 @@ static void rockchip_drm_unbind(struct device *dev)
>   	drm_dev_put(drm_dev);
>   }
>   
> -static const struct file_operations rockchip_drm_driver_fops = {
> -	.owner = THIS_MODULE,
> -	.open = drm_open,
> -	.mmap = rockchip_gem_mmap,
> -	.poll = drm_poll,
> -	.read = drm_read,
> -	.unlocked_ioctl = drm_ioctl,
> -	.compat_ioctl = drm_compat_ioctl,
> -	.release = drm_release,
> -};
> +DEFINE_DRM_GEM_FOPS(rockchip_drm_driver_fops);
>   
>   static const struct drm_driver rockchip_drm_driver = {
>   	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> @@ -226,7 +217,7 @@ static const struct drm_driver rockchip_drm_driver = {
>   	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>   	.gem_prime_import_sg_table	= rockchip_gem_prime_import_sg_table,
> -	.gem_prime_mmap		= rockchip_gem_mmap_buf,
> +	.gem_prime_mmap		= drm_gem_prime_mmap,
>   	.fops			= &rockchip_drm_driver_fops,
>   	.name	= DRIVER_NAME,
>   	.desc	= DRIVER_DESC,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> index 2fdc455c4ad7..d8418dd39d0e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
> +#include <drm/drm_prime.h>
>   #include <drm/drm_probe_helper.h>
>   
>   #include "rockchip_drm_drv.h"
> @@ -24,7 +25,7 @@ static int rockchip_fbdev_mmap(struct fb_info *info,
>   	struct drm_fb_helper *helper = info->par;
>   	struct rockchip_drm_private *private = to_drm_private(helper);
>   
> -	return rockchip_gem_mmap_buf(private->fbdev_bo, vma);
> +	return drm_gem_prime_mmap(private->fbdev_bo, vma);
>   }
>   
>   static const struct fb_ops rockchip_drm_fbdev_ops = {
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 7971f57436dd..63eb73b624aa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -240,12 +240,22 @@ static int rockchip_drm_gem_object_mmap(struct drm_gem_object *obj,
>   	int ret;
>   	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
>   
> +	/*
> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> +	 * whole buffer from the start.
> +	 */
> +	vma->vm_pgoff = 0;
> +
>   	/*
>   	 * We allocated a struct page table for rk_obj, so clear
>   	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
>   	 */
> +	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>   	vma->vm_flags &= ~VM_PFNMAP;
>   
> +	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> +	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> +
>   	if (rk_obj->pages)
>   		ret = rockchip_drm_gem_object_mmap_iommu(obj, vma);
>   	else
> @@ -257,39 +267,6 @@ static int rockchip_drm_gem_object_mmap(struct drm_gem_object *obj,
>   	return ret;
>   }
>   
> -int rockchip_gem_mmap_buf(struct drm_gem_object *obj,
> -			  struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	ret = drm_gem_mmap_obj(obj, obj->size, vma);
> -	if (ret)
> -		return ret;
> -
> -	return rockchip_drm_gem_object_mmap(obj, vma);
> -}
> -
> -/* drm driver mmap file operations */
> -int rockchip_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	struct drm_gem_object *obj;
> -	int ret;
> -
> -	ret = drm_gem_mmap(filp, vma);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> -	 * whole buffer from the start.
> -	 */
> -	vma->vm_pgoff = 0;
> -
> -	obj = vma->vm_private_data;
> -
> -	return rockchip_drm_gem_object_mmap(obj, vma);
> -}
> -
>   static void rockchip_gem_release_object(struct rockchip_gem_object *rk_obj)
>   {
>   	drm_gem_object_release(&rk_obj->base);
> @@ -301,6 +278,7 @@ static const struct drm_gem_object_funcs rockchip_gem_object_funcs = {
>   	.get_sg_table = rockchip_gem_prime_get_sg_table,
>   	.vmap = rockchip_gem_prime_vmap,
>   	.vunmap	= rockchip_gem_prime_vunmap,
> +	.mmap = rockchip_drm_gem_object_mmap,
>   	.vm_ops = &drm_gem_cma_vm_ops,
>   };
>   
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> index 5a70a56cd406..47c1861eece0 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> @@ -34,13 +34,6 @@ rockchip_gem_prime_import_sg_table(struct drm_device *dev,
>   int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>   void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>   
> -/* drm driver mmap file operations */
> -int rockchip_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -
> -/* mmap a gem object to userspace. */
> -int rockchip_gem_mmap_buf(struct drm_gem_object *obj,
> -			  struct vm_area_struct *vma);
> -
>   struct rockchip_gem_object *
>   	rockchip_gem_create_object(struct drm_device *drm, unsigned int size,
>   				   bool alloc_kmap);
