Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5326C208
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 13:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA64B6E9A8;
	Wed, 16 Sep 2020 11:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3CC6E99D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 11:21:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x23so2382044wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mUOAFu1Sstz+Y84HDrSYqg/SYf7AQiwgyxkdfcX2QWQ=;
 b=dNYt3KSmP2zoajuEOcpSRwKjslSpbjWRZP10ZdmvUDBODfNwzvcZciCjx0cVSGnRP/
 JUZRa+hP31+BJN/M1t7m9Ls/tiT5od6BnRGoXiiAJTdUcoTfR5J6SoK2kCHBNgd6JM9c
 NsxYbB5nxATvUhunbEGd6bVQp6IDhaI5uBozM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mUOAFu1Sstz+Y84HDrSYqg/SYf7AQiwgyxkdfcX2QWQ=;
 b=pV+2h3KcnNq6HQOQgzdCjd7l3W+7RRz3KfP8WlHkgbt0jjWzQQ3fHxwHv63KmVq2xs
 u2rLO4BmlTP5L6N4rT8rNWzQAgO/mjonjKWD2U7lOCjYj8Tut7NbZ9jqU9mNGfYaWUIT
 MeRciVdXrUq5bVI8ex9L/wkx5peIsd/VpD5yu91QARWPTzGAR3GnjHDEbKPFzuDMpnH2
 hGlBGy7MgX0ZEMcAzxX2LJy0JPd9cjzlDsRfsBVIa9V29vJxX6IvT8N0N55TDn1FGN28
 /zXvTpoGVG1JgQBuiW7c55rL9ZChsj3oDPR8O75PkOrz7rlFv7TndIr4ZO0JQedXGjpf
 SMFA==
X-Gm-Message-State: AOAM531E7QQH/0/5xnGeOC0BhnlJbQYHoN0vKV7XHo8GWjAKysiSX8Gu
 aj5rSFHhN3lV2cZDdmzss8KIiw==
X-Google-Smtp-Source: ABdhPJxN4KFdG0OXvpCuI3UQDQSjm9d9naSAnHnzOZnbaecNO0ofucAiEdpaLFF0vBOBWzg3E9jOYA==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr4127600wmm.2.1600255301791; 
 Wed, 16 Sep 2020 04:21:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q186sm4894705wma.45.2020.09.16.04.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 04:21:40 -0700 (PDT)
Date: Wed, 16 Sep 2020 13:21:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/21] drm/etnaviv: Introduce GEM object functions
Message-ID: <20200916112136.GG438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-4-tzimmermann@suse.de>
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

On Tue, Sep 15, 2020 at 04:59:40PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in etnaviv. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 13 -------------
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h |  1 -
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 19 ++++++++++++++++++-
>  3 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index a9a3afaef9a1..aa270b79e585 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -468,12 +468,6 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>  	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>  };
>  
> -static const struct vm_operations_struct vm_ops = {
> -	.fault = etnaviv_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static const struct file_operations fops = {
>  	.owner              = THIS_MODULE,
>  	.open               = drm_open,
> @@ -490,16 +484,9 @@ static struct drm_driver etnaviv_drm_driver = {
>  	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
>  	.open               = etnaviv_open,
>  	.postclose           = etnaviv_postclose,
> -	.gem_free_object_unlocked = etnaviv_gem_free_object,
> -	.gem_vm_ops         = &vm_ops,
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin      = etnaviv_gem_prime_pin,
> -	.gem_prime_unpin    = etnaviv_gem_prime_unpin,
> -	.gem_prime_get_sg_table = etnaviv_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
> -	.gem_prime_vmap     = etnaviv_gem_prime_vmap,
> -	.gem_prime_vunmap   = etnaviv_gem_prime_vunmap,
>  	.gem_prime_mmap     = etnaviv_gem_prime_mmap,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init       = etnaviv_debugfs_init,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index 4d8dc9236e5f..914f0867ff71 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -49,7 +49,6 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		struct drm_file *file);
>  
>  int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf);
>  int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
>  struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index ea19f1d27275..312e9d58d5a7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -171,7 +171,7 @@ int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  	return obj->ops->mmap(obj, vma);
>  }
>  
> -vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -561,6 +561,22 @@ void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
>  	mutex_unlock(&priv->gem_lock);
>  }
>  
> +static const struct vm_operations_struct vm_ops = {
> +	.fault = etnaviv_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
> +	.free = etnaviv_gem_free_object,
> +	.pin = etnaviv_gem_prime_pin,
> +	.unpin = etnaviv_gem_prime_unpin,
> +	.get_sg_table = etnaviv_gem_prime_get_sg_table,
> +	.vmap = etnaviv_gem_prime_vmap,
> +	.vunmap = etnaviv_gem_prime_vunmap,
> +	.vm_ops = &vm_ops,
> +};

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>  	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>  {
> @@ -595,6 +611,7 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>  	INIT_LIST_HEAD(&etnaviv_obj->vram_list);
>  
>  	*obj = &etnaviv_obj->base;
> +	(*obj)->funcs = &etnaviv_gem_object_funcs;
>  
>  	return 0;
>  }
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
