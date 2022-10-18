Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394B602F9F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 17:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F267A10E26E;
	Tue, 18 Oct 2022 15:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C918110E26E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 15:26:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78CE38B9;
 Tue, 18 Oct 2022 17:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1666106763;
 bh=q90qjFQrFpXyZay+tSSg6S6/iwmkFzScg5yKQO+Re5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xkh9LQI71Na+RBcGsTWYCWgP5Mp+QAZ57uEZXLA37JOXOUU69QIEqa37P1YPOFUww
 yqj9v6qyQmYtR4tMfpZI49ZuYhjU5oeDpZnVL0iaFWXMdvm3x1BDiripUdZTKqHPTS
 1kmo3oW8OvWVXfU/8bSWJWxbBVr85SmrQe9VAsf0=
Date: Tue, 18 Oct 2022 18:25:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH] drm: Remove drm_mode_config::fb_base
Message-ID: <Y07FczacRk6mJ9kN@pendragon.ideasonboard.com>
References: <20221018131754.351957-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221018131754.351957-1-zack@kde.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Flora Cui <flora.cui@amd.com>, Tomohito Esaki <etom@igel.co.jp>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Guchun Chen <guchun.chen@amd.com>, Bernard Zhao <bernard@vivo.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Leo Li <sunpeng.li@amd.com>,
 Chen Feng <puck.chen@hisilicon.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Leslie Shi <Yuliang.Shi@amd.com>, Evan Quan <evan.quan@amd.com>,
 Sean Paul <sean@poorly.run>, Tomi Valkeinen <tomba@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Roman Li <roman.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack,

Thank you for the patch.

On Tue, Oct 18, 2022 at 09:17:45AM -0400, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> The fb_base in struct drm_mode_config has been unused for a long time.
> Some drivers set it and some don't leading to a very confusing state
> where the variable can't be relied upon, because there's no indication
> as to which driver sets it and which doesn't.
> 
> The only usage of fb_base is internal to two drivers so instead of trying
> to force it into all the drivers to get it into a coherent state
> completely remove it.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 2 --
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            | 2 --
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            | 2 --
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             | 1 -
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             | 2 --
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
>  drivers/gpu/drm/ast/ast_mode.c                    | 1 -
>  drivers/gpu/drm/gma500/framebuffer.c              | 6 +++---
>  drivers/gpu/drm/gma500/psb_drv.h                  | 1 +
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 1 -
>  drivers/gpu/drm/mgag200/mgag200_mode.c            | 1 -
>  drivers/gpu/drm/msm/msm_fbdev.c                   | 2 --
>  drivers/gpu/drm/nouveau/nouveau_display.c         | 1 -
>  drivers/gpu/drm/nouveau/nv04_fbcon.c              | 6 ++++--
>  drivers/gpu/drm/omapdrm/omap_fbdev.c              | 2 --
>  drivers/gpu/drm/qxl/qxl_display.c                 | 2 --
>  drivers/gpu/drm/radeon/radeon_display.c           | 2 --
>  drivers/gpu/drm/radeon/radeon_fb.c                | 1 -
>  drivers/gpu/drm/tegra/fb.c                        | 1 -
>  drivers/gpu/drm/tiny/bochs.c                      | 1 -
>  include/drm/drm_mode_config.h                     | 2 --
>  21 files changed, 8 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index f4b5301ea2a0..09dec2561adf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -498,8 +498,6 @@ static int amdgpu_vkms_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>  	r = amdgpu_display_modeset_create_props(adev);
>  	if (r)
>  		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 288fce7dc0ed..05051d5d2ec3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2800,8 +2800,6 @@ static int dce_v10_0_sw_init(void *handle)
>  
>  	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>  
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>  	r = amdgpu_display_modeset_create_props(adev);
>  	if (r)
>  		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index cbe5250b31cb..c928bc9eb202 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2918,8 +2918,6 @@ static int dce_v11_0_sw_init(void *handle)
>  
>  	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>  
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>  	r = amdgpu_display_modeset_create_props(adev);
>  	if (r)
>  		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index b1c44fab074f..62315fd5a05f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2675,7 +2675,6 @@ static int dce_v6_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
>  	if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index a22b45c92792..87d5e4c21cb3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2701,8 +2701,6 @@ static int dce_v8_0_sw_init(void *handle)
>  
>  	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>  
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>  	r = amdgpu_display_modeset_create_props(adev);
>  	if (r)
>  		return r;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c053cb79cd06..0db2a88cd4d7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3816,8 +3816,6 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>  	/* indicates support for immediate flip */
>  	adev_to_drm(adev)->mode_config.async_page_flip = true;
>  
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>  	if (!state)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 4355754d69b5..1a01208d53d9 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1778,7 +1778,6 @@ int ast_mode_config_init(struct ast_private *ast)
>  	dev->mode_config.min_width = 0;
>  	dev->mode_config.min_height = 0;
>  	dev->mode_config.preferred_depth = 24;
> -	dev->mode_config.fb_base = pci_resource_start(pdev, 0);
>  
>  	if (ast->chip == AST2100 ||
>  	    ast->chip == AST2200 ||
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index aa3ecf771fd3..5f502a0048ab 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -286,7 +286,7 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
>  
>  	info->fbops = &psbfb_unaccel_ops;
>  
> -	info->fix.smem_start = dev->mode_config.fb_base;
> +	info->fix.smem_start = dev_priv->fb_base;
>  	info->fix.smem_len = size;
>  	info->fix.ywrapstep = 0;
>  	info->fix.ypanstep = 0;
> @@ -296,7 +296,7 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
>  	info->screen_size = size;
>  
>  	if (dev_priv->gtt.stolen_size) {
> -		info->apertures->ranges[0].base = dev->mode_config.fb_base;
> +		info->apertures->ranges[0].base = dev_priv->fb_base;
>  		info->apertures->ranges[0].size = dev_priv->gtt.stolen_size;
>  	}
>  
> @@ -527,7 +527,7 @@ void psb_modeset_init(struct drm_device *dev)
>  
>  	/* set memory base */
>  	/* Oaktrail and Poulsbo should use BAR 2*/
> -	pci_read_config_dword(pdev, PSB_BSM, (u32 *)&(dev->mode_config.fb_base));
> +	pci_read_config_dword(pdev, PSB_BSM, (u32 *)&(dev_priv->fb_base));
>  
>  	/* num pipes is 2 for PSB but 1 for Mrst */
>  	for (i = 0; i < dev_priv->num_pipe; i++)
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index ae544b69fc47..a5df6d2f2cab 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -523,6 +523,7 @@ struct drm_psb_private {
>  	uint32_t blc_adj2;
>  
>  	struct drm_fb_helper *fb_helper;
> +	resource_size_t fb_base;
>  
>  	bool dsr_enable;
>  	u32 dsr_fb_update;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index fe4269c5aa0a..2293038755c5 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -105,7 +105,6 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>  	dev->mode_config.max_width = 1920;
>  	dev->mode_config.max_height = 1200;
>  
> -	dev->mode_config.fb_base = priv->fb_base;

It think You can also drop the fb_base field from hibmc_drm_private in
drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h. There may be more code
that could be removed in this driver, the fb_map field seems unused as
well. I would also drop fb_size and use pci_resource_len() directly when
calling drmm_vram_helper_init().

>  	dev->mode_config.preferred_depth = 32;
>  	dev->mode_config.prefer_shadow = 1;
>  
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 758629da95d9..0a5aaf78172a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -824,7 +824,6 @@ int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_avail
>  	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
>  	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
>  	dev->mode_config.preferred_depth = 24;
> -	dev->mode_config.fb_base = mdev->vram_res->start;
>  	dev->mode_config.funcs = &mgag200_mode_config_funcs;
>  	dev->mode_config.helper_private = &mgag200_mode_config_helper_funcs;
>  
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 46168eccfac4..b373e3000320 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -109,8 +109,6 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
>  
>  	drm_fb_helper_fill_info(fbi, helper, sizes);
>  
> -	dev->mode_config.fb_base = paddr;
> -
>  	fbi->screen_base = msm_gem_get_vaddr(bo);
>  	if (IS_ERR(fbi->screen_base)) {
>  		ret = PTR_ERR(fbi->screen_base);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index a2f5df568ca5..928fdfa8e8e5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -672,7 +672,6 @@ nouveau_display_create(struct drm_device *dev)
>  	drm_mode_create_dvi_i_properties(dev);
>  
>  	dev->mode_config.funcs = &nouveau_mode_config_funcs;
> -	dev->mode_config.fb_base = device->func->resource_addr(device, 1);
>  
>  	dev->mode_config.min_width = 0;
>  	dev->mode_config.min_height = 0;
> diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
> index 92f3fb6765ab..c30b8dacd86b 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
> @@ -137,6 +137,8 @@ nv04_fbcon_accel_init(struct fb_info *info)
>  	struct nouveau_channel *chan = drm->channel;
>  	struct nvif_device *device = &drm->client.device;
>  	struct nvif_push *push = chan->chan.push;
> +	struct nvkm_device *nvkm_device = nvxx_device(&drm->client.device);
> +	resource_size_t fb_base = nvkm_device->func->resource_addr(nvkm_device, 1);
>  	int surface_fmt, pattern_fmt, rect_fmt;
>  	int ret;
>  
> @@ -210,8 +212,8 @@ nv04_fbcon_accel_init(struct fb_info *info)
>  			       0x0188, chan->vram.handle);
>  	PUSH_NVSQ(push, NV042, 0x0300, surface_fmt,
>  			       0x0304, info->fix.line_length | (info->fix.line_length << 16),
> -			       0x0308, info->fix.smem_start - dev->mode_config.fb_base,
> -			       0x030c, info->fix.smem_start - dev->mode_config.fb_base);
> +			       0x0308, info->fix.smem_start - fb_base,
> +			       0x030c, info->fix.smem_start - fb_base);
>  
>  	PUSH_NVSQ(push, NV043, 0x0000, nfbdev->rop.handle);
>  	PUSH_NVSQ(push, NV043, 0x0300, 0x55);
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 40706c5aad7b..ed67dd25794c 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -177,8 +177,6 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>  
>  	drm_fb_helper_fill_info(fbi, helper, sizes);
>  
> -	dev->mode_config.fb_base = dma_addr;
> -
>  	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);
>  	fbi->screen_size = fbdev->bo->size;
>  	fbi->fix.smem_start = dma_addr;
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index a152a7c6db21..6492a70e3c39 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1261,8 +1261,6 @@ int qxl_modeset_init(struct qxl_device *qdev)
>  	qdev->ddev.mode_config.max_width = 8192;
>  	qdev->ddev.mode_config.max_height = 8192;
>  
> -	qdev->ddev.mode_config.fb_base = qdev->vram_base;
> -
>  	drm_mode_create_suggested_offset_properties(&qdev->ddev);
>  	qxl_mode_create_hotplug_mode_update_property(qdev);
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index ca5598ae8bfc..9bed1a6cb163 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1604,8 +1604,6 @@ int radeon_modeset_init(struct radeon_device *rdev)
>  
>  	rdev->ddev->mode_config.fb_modifiers_not_supported = true;
>  
> -	rdev->ddev->mode_config.fb_base = rdev->mc.aper_base;
> -
>  	ret = radeon_modeset_create_props(rdev);
>  	if (ret) {
>  		return ret;
> diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
> index 6ccea51d4072..df33e3a87c92 100644
> --- a/drivers/gpu/drm/radeon/radeon_fb.c
> +++ b/drivers/gpu/drm/radeon/radeon_fb.c
> @@ -276,7 +276,6 @@ static int radeonfb_create(struct drm_fb_helper *helper,
>  	drm_fb_helper_fill_info(info, &rfbdev->helper, sizes);
>  
>  	/* setup aperture base/size for vesafb takeover */
> -	info->apertures->ranges[0].base = rdev->ddev->mode_config.fb_base;

I think this still needs to be initialized, from rdev->mc.aper_base most
likely.

>  	info->apertures->ranges[0].size = rdev->mc.aper_size;
>  
>  	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 9291209154a7..bce71c0ccc9e 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -280,7 +280,6 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  		}
>  	}
>  
> -	drm->mode_config.fb_base = (resource_size_t)bo->iova;
>  	info->screen_base = (void __iomem *)bo->vaddr + offset;
>  	info->screen_size = size;
>  	info->fix.smem_start = (unsigned long)(bo->iova + offset);
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index a51262289aef..04682f831544 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -543,7 +543,6 @@ static int bochs_kms_init(struct bochs_device *bochs)
>  	bochs->dev->mode_config.max_width = 8192;
>  	bochs->dev->mode_config.max_height = 8192;
>  
> -	bochs->dev->mode_config.fb_base = bochs->fb_base;
>  	bochs->dev->mode_config.preferred_depth = 24;
>  	bochs->dev->mode_config.prefer_shadow = 0;
>  	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 6b5e01295348..5362702fffe1 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -345,7 +345,6 @@ struct drm_mode_config_funcs {
>   * @max_width: maximum fb pixel width on this device
>   * @max_height: maximum fb pixel height on this device
>   * @funcs: core driver provided mode setting functions
> - * @fb_base: base address of the framebuffer
>   * @poll_enabled: track polling support for this device
>   * @poll_running: track polling status for this device
>   * @delayed_event: track delayed poll uevent deliver for this device
> @@ -542,7 +541,6 @@ struct drm_mode_config {
>  	int min_width, min_height;
>  	int max_width, max_height;
>  	const struct drm_mode_config_funcs *funcs;
> -	resource_size_t fb_base;
>  
>  	/* output poll support */
>  	bool poll_enabled;

-- 
Regards,

Laurent Pinchart
