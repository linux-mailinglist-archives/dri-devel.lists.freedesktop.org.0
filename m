Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF8C98742D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB81310EB2C;
	Thu, 26 Sep 2024 13:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k2UWsHwg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F359810EB2C;
 Thu, 26 Sep 2024 13:07:54 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 864B4169;
 Thu, 26 Sep 2024 15:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1727355986;
 bh=eh67dtCNXV3U8aT3LsVobHpkYFjKFmttr/m5eSCwtWo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k2UWsHwgVA/FPxAsSsH5yKXV6/Jlap+NAeNhsLKp2Ld18XpfXdvM2UrBoVV7YTfPd
 yPtHCt/5LrVagb0iTS9+BHYIZk9pE5HhmlCtxWlNk2espq4cPKZY3kt2UIUbjArUoE
 QA2zLmxe5iQqvbfpE8MOslQJ4r3yUdcZSfsRZk1s=
Message-ID: <a926cc52-fe99-492c-ae36-9388c13b2738@ideasonboard.com>
Date: Thu, 26 Sep 2024 16:07:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 80/80] drm/omapdrm: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240924071734.98201-1-tzimmermann@suse.de>
 <20240924071734.98201-81-tzimmermann@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240924071734.98201-81-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24/09/2024 10:13, Thomas Zimmermann wrote:
> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
> 
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> The omapdrm driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
> 
> v5:
> - select DRM_CLIENT_SELECTION
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/gpu/drm/omapdrm/Kconfig      |   1 +
>   drivers/gpu/drm/omapdrm/omap_drv.c   |   1 +
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 131 ++++++---------------------
>   drivers/gpu/drm/omapdrm/omap_fbdev.h |   8 ++
>   4 files changed, 39 insertions(+), 102 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index fbd9af758581..9d4016bd0f44 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -4,6 +4,7 @@ config DRM_OMAP
>   	depends on MMU
>   	depends on DRM && OF
>   	depends on ARCH_OMAP2PLUS || (COMPILE_TEST && PAGE_SIZE_LESS_THAN_64KB)
> +	select DRM_CLIENT_SELECTION
>   	select DRM_KMS_HELPER
>   	select DRM_DISPLAY_HELPER
>   	select DRM_BRIDGE_CONNECTOR
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index a982378aa141..1796cd20a877 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -647,6 +647,7 @@ static const struct drm_driver omap_drm_driver = {
>   	.gem_prime_import = omap_gem_prime_import,
>   	.dumb_create = omap_gem_dumb_create,
>   	.dumb_map_offset = omap_gem_dumb_map_offset,
> +	OMAP_FBDEV_DRIVER_OPS,
>   	.ioctls = ioctls,
>   	.num_ioctls = DRM_OMAP_NUM_IOCTLS,
>   	.fops = &omapdriver_fops,
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 044e80403c3b..f4bd0c6e3f34 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -6,6 +6,7 @@
>   
>   #include <linux/fb.h>
>   
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_crtc_helper.h>
>   #include <drm/drm_fb_helper.h>
> @@ -124,8 +125,32 @@ static const struct fb_ops omap_fb_ops = {
>   	.fb_destroy	= omap_fbdev_fb_destroy,
>   };
>   
> -static int omap_fbdev_create(struct drm_fb_helper *helper,
> -		struct drm_fb_helper_surface_size *sizes)
> +static int omap_fbdev_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
> +{
> +	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
> +		return 0;
> +
> +	if (helper->fb->funcs->dirty)
> +		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
> +
> +	return 0;
> +}
> +
> +static const struct drm_fb_helper_funcs omap_fbdev_helper_funcs = {
> +	.fb_dirty = omap_fbdev_dirty,
> +};
> +
> +static struct drm_fb_helper *get_fb(struct fb_info *fbi)
> +{
> +	if (!fbi || strcmp(fbi->fix.id, MODULE_NAME)) {
> +		/* these are not the fb's you're looking for */
> +		return NULL;
> +	}
> +	return fbi->par;
> +}
> +
> +int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
> +				  struct drm_fb_helper_surface_size *sizes)
>   {
>   	struct drm_device *dev = helper->dev;
>   	struct omap_drm_private *priv = dev->dev_private;
> @@ -207,6 +232,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   
>   	DBG("fbi=%p, dev=%p", fbi, dev);
>   
> +	helper->funcs = &omap_fbdev_helper_funcs;
>   	helper->fb = fb;
>   
>   	fbi->fbops = &omap_fb_ops;
> @@ -253,94 +279,10 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   	return ret;
>   }
>   
> -static int omap_fbdev_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
> -{
> -	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
> -		return 0;
> -
> -	if (helper->fb->funcs->dirty)
> -		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
> -
> -	return 0;
> -}
> -
> -static const struct drm_fb_helper_funcs omap_fb_helper_funcs = {
> -	.fb_probe = omap_fbdev_create,
> -	.fb_dirty = omap_fbdev_dirty,
> -};
> -
> -static struct drm_fb_helper *get_fb(struct fb_info *fbi)
> -{
> -	if (!fbi || strcmp(fbi->fix.id, MODULE_NAME)) {
> -		/* these are not the fb's you're looking for */
> -		return NULL;
> -	}
> -	return fbi->par;
> -}
> -
> -/*
> - * struct drm_client
> - */
> -
> -static void omap_fbdev_client_unregister(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -
> -	if (fb_helper->info) {
> -		drm_fb_helper_unregister_info(fb_helper);
> -	} else {
> -		drm_client_release(&fb_helper->client);
> -		drm_fb_helper_unprepare(fb_helper);
> -		kfree(fb_helper);
> -	}
> -}
> -
> -static int omap_fbdev_client_restore(struct drm_client_dev *client)
> -{
> -	drm_fb_helper_lastclose(client->dev);
> -
> -	return 0;
> -}
> -
> -static int omap_fbdev_client_hotplug(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -	struct drm_device *dev = client->dev;
> -	int ret;
> -
> -	if (dev->fb_helper)
> -		return drm_fb_helper_hotplug_event(dev->fb_helper);
> -
> -	ret = drm_fb_helper_init(dev, fb_helper);
> -	if (ret)
> -		goto err_drm_err;
> -
> -	ret = drm_fb_helper_initial_config(fb_helper);
> -	if (ret)
> -		goto err_drm_fb_helper_fini;
> -
> -	return 0;
> -
> -err_drm_fb_helper_fini:
> -	drm_fb_helper_fini(fb_helper);
> -err_drm_err:
> -	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
> -	return ret;
> -}
> -
> -static const struct drm_client_funcs omap_fbdev_client_funcs = {
> -	.owner		= THIS_MODULE,
> -	.unregister	= omap_fbdev_client_unregister,
> -	.restore	= omap_fbdev_client_restore,
> -	.hotplug	= omap_fbdev_client_hotplug,
> -};
> -
>   void omap_fbdev_setup(struct drm_device *dev)
>   {
>   	struct omap_drm_private *priv = dev->dev_private;
>   	struct omap_fbdev *fbdev;
> -	struct drm_fb_helper *helper;
> -	int ret;
>   
>   	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
>   	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
> @@ -353,20 +295,5 @@ void omap_fbdev_setup(struct drm_device *dev)
>   
>   	priv->fbdev = fbdev;
>   
> -	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
> -	if (!helper)
> -		return;
> -	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
> -
> -	ret = drm_client_init(dev, &helper->client, "fbdev", &omap_fbdev_client_funcs);
> -	if (ret)
> -		goto err_drm_client_init;
> -
> -	drm_client_register(&helper->client);
> -
> -	return;
> -
> -err_drm_client_init:
> -	drm_fb_helper_unprepare(helper);
> -	kfree(helper);
> +	drm_client_setup(dev, NULL);
>   }
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.h b/drivers/gpu/drm/omapdrm/omap_fbdev.h
> index 74c691a8d45f..283e35b42ada 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.h
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.h
> @@ -10,10 +10,18 @@
>   #define __OMAPDRM_FBDEV_H__
>   
>   struct drm_device;
> +struct drm_fb_helper;
> +struct drm_fb_helper_surface_size;
>   
>   #ifdef CONFIG_DRM_FBDEV_EMULATION
> +int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
> +				  struct drm_fb_helper_surface_size *sizes);
> +#define OMAP_FBDEV_DRIVER_OPS \
> +	.fbdev_probe = omap_fbdev_driver_fbdev_probe
>   void omap_fbdev_setup(struct drm_device *dev);
>   #else
> +#define OMAP_FBDEV_DRIVER_OPS \
> +	.fbdev_probe = NULL
>   static inline void omap_fbdev_setup(struct drm_device *dev)
>   {
>   }

