Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2326DD65
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722976EC17;
	Thu, 17 Sep 2020 14:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAC06E290;
 Thu, 17 Sep 2020 14:01:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a9so2188261wmm.2;
 Thu, 17 Sep 2020 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lBUrIOfg3+mq8ad85tbb7EImBFZIDC/tVRBXQ4hE1ik=;
 b=DNZiBZAKqypMSqQJoyD2IPrVpqiI3ikdcnRtqSUtglPbT/8APSdwaP78S9dCceWhaB
 CUFzh+i3SYFxQjgJQYQXA+eAyv74bC7KPueFL/Gfi5sPNtWoyu6oeH0LQkpIWYJSX21y
 rV7VkyxfFYten7MOhzm3Bz7i04GYai5m0PJD8/+pat7mIsmnFKD4UKKCCUMZ01zZFTbO
 PKJYwiwHEuO6KO353OHy/LaLG0eDM48NEvTlWgc4GQY7VXvipXO0S4rEEhbCyvprEr3R
 BIuNCJjy1NTGULEvR1fAoX12DfpViAnvzecyOpIl9S6AtbE1NSwC4GsSGoUx0L019NSL
 oeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lBUrIOfg3+mq8ad85tbb7EImBFZIDC/tVRBXQ4hE1ik=;
 b=NbZFwZV05Gcfe6hLL6STlm/2ehiyQ6RZ9PVThNJ/uIVUFT46NvEA1aEGWhIJ+TOwpH
 NmQVlzkJvRCSwcn4J4QDhWL5hXpH1N50c7H9q56wfKvDG99XYFvsRuX290zRteKRVyHd
 zKfqDpX69CYEJA20V1DyvQgpNDQkBSfayhsmQ/oilPM5E8qxTejwY/+dMmV4U9IVOg4I
 Ohdp1/KhZYB2SdiY+ejP84C7XP87N+6uBrMKlq6EVvyUu8C9ZdqLac1Sp++9wm2WBp+v
 /9oujqCU6za1QL/zAruyTvPDJi30BltY3wtwgo19BNh7MTKNt7WVaHjC+6+Ovb8MRqqb
 Gfeg==
X-Gm-Message-State: AOAM533AXcNXQW7ApH+6IAjksQgjdtk09Gipq/dgQ8OQ7Ii8X6T29Bbj
 Sn52e46T7ouiCjlCKAsNMaQ=
X-Google-Smtp-Source: ABdhPJwVFsi9VyC5N2zDyjQYYSf7iQdzkgcW/plJduCk7Y3eMkitDq4/6m+bqkSKVjF1esIZWne4iA==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr10119624wmf.20.1600351318328; 
 Thu, 17 Sep 2020 07:01:58 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id z14sm37316830wrh.14.2020.09.17.07.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:01:57 -0700 (PDT)
Date: Thu, 17 Sep 2020 11:01:48 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 16/21] drm/vgem: Introduce GEM object functions
Message-ID: <20200917140148.orpdihcctrr5upxg@smtp.gmail.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-17-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-17-tzimmermann@suse.de>
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

Hi Thomas,

On 09/15, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in vgem. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks here again.

This drv file is little tumultuous to me.
I mean, I took a while to sort functions in my head.

However, finally, I got it, and the change looks good.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index cb884c890065..fa54a6d1403d 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -50,6 +50,8 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> +static const struct drm_gem_object_funcs vgem_gem_object_funcs;
> +
>  static struct vgem_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> @@ -167,6 +169,8 @@ static struct drm_vgem_gem_object *__vgem_gem_create(struct drm_device *dev,
>  	if (!obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	obj->base.funcs = &vgem_gem_object_funcs;
> +
>  	ret = drm_gem_object_init(dev, &obj->base, roundup(size, PAGE_SIZE));
>  	if (ret) {
>  		kfree(obj);
> @@ -401,12 +405,20 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
>  	return 0;
>  }
>  
> +static const struct drm_gem_object_funcs vgem_gem_object_funcs = {
> +	.free = vgem_gem_free_object,
> +	.pin = vgem_prime_pin,
> +	.unpin = vgem_prime_unpin,
> +	.get_sg_table = vgem_prime_get_sg_table,
> +	.vmap = vgem_prime_vmap,
> +	.vunmap = vgem_prime_vunmap,
> +	.vm_ops = &vgem_gem_vm_ops,
> +};
> +
>  static struct drm_driver vgem_driver = {
>  	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
>  	.open				= vgem_open,
>  	.postclose			= vgem_postclose,
> -	.gem_free_object_unlocked	= vgem_gem_free_object,
> -	.gem_vm_ops			= &vgem_gem_vm_ops,
>  	.ioctls				= vgem_ioctls,
>  	.num_ioctls 			= ARRAY_SIZE(vgem_ioctls),
>  	.fops				= &vgem_driver_fops,
> @@ -415,13 +427,8 @@ static struct drm_driver vgem_driver = {
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin = vgem_prime_pin,
> -	.gem_prime_unpin = vgem_prime_unpin,
>  	.gem_prime_import = vgem_prime_import,
>  	.gem_prime_import_sg_table = vgem_prime_import_sg_table,
> -	.gem_prime_get_sg_table = vgem_prime_get_sg_table,
> -	.gem_prime_vmap = vgem_prime_vmap,
> -	.gem_prime_vunmap = vgem_prime_vunmap,
>  	.gem_prime_mmap = vgem_prime_mmap,
>  
>  	.name	= DRIVER_NAME,
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
