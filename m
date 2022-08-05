Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71258AD49
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 17:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252FFB725E;
	Fri,  5 Aug 2022 15:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F92BB7AD7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 15:39:07 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id a2so2136733qkk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 08:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=XWdKJtSiozQ70DGJ4SJK+YBLTsE+4EZxsOCD/tHtlh4=;
 b=YCw1bWibZwOXQSuvoLpFd2Z+DE3sgK7sZam5PuffvnQnjLEC1p1qD74U4m3w4pDD48
 DP5aCA2hPGIOXbfURa88lZtX56fJ1h9jfZKVqNZO0mq3w3EhWk7pOgvqquvsuv0xa3Gm
 FH4Ddzl06ZKB/F9HUsDgjikWzkMioEnXOxAipXsW82j0xsqUYVVsQH/gTkFS87fwoPy2
 pwkbdENXHvG4i/Kyh9vzi+XjEVNxUh8iJYFG+u5/GsTrEOxQqAWgI0aF/DuWzfP252O0
 1LT6CeWmUop6NxesrCcNySFa4ubexV5XppbAylrO6OgZzbHZHxyFm7Wct5Mjay4Cidzu
 uzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=XWdKJtSiozQ70DGJ4SJK+YBLTsE+4EZxsOCD/tHtlh4=;
 b=2MJJeRbLxqtO4XwrDi3/oCJ4vVbN6Hq+vuPiNcNOw3KxgPWrdcC168/qWcLVrHnnNM
 sIKhuWaynoj0kWbTl0lQVpV4/TBsEciXS6zXhyGwoFCsYqGdHpBT6vjgp1UrH36XdlOd
 e2kswNAqYLfQGGICTIQzQAlK14xSFk3KZkCWvkxLagKCrateibDxBj6HqwgOyGQMFoai
 +3SsY8wNkDe6vkYh6x7ilLs2KJs0JFO6Hl5WGkWcSFLwZhNBqyCtW4YSuHl4cAihDet0
 66exuN9p4Ktx39fkQjhzbA0JRSGvcgDFgBxiXej9f1sgnsxSfaIz1LPfby5P8eXGi3Q7
 ijrA==
X-Gm-Message-State: ACgBeo3cTb79jS59kwSthdlqiAS7q+n/d5V35OEioVI7VFHFQgYA8ZOn
 xlHylPbptXObZqoUl/dhRjodaw==
X-Google-Smtp-Source: AA6agR51ei6GurEs0M9DhatE2fGKS708lYmr02CZNRVsHvRIoEDyFNJJzI1xU07ESj7aI0aSsyiguA==
X-Received: by 2002:a05:620a:1986:b0:6b8:6cef:6cc with SMTP id
 bm6-20020a05620a198600b006b86cef06ccmr5774035qkb.482.1659713946048; 
 Fri, 05 Aug 2022 08:39:06 -0700 (PDT)
Received: from localhost (48.230.85.34.bc.googleusercontent.com.
 [34.85.230.48]) by smtp.gmail.com with ESMTPSA id
 z7-20020ac87ca7000000b00304fc3d144esm2810269qtv.1.2022.08.05.08.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 08:39:05 -0700 (PDT)
Date: Fri, 5 Aug 2022 15:39:05 +0000
From: Sean Paul <sean@poorly.run>
To: Jim Shargo <jshargo@chromium.org>
Subject: Re: [PATCH 1/5] drm/vkms: Merge default_config and device
Message-ID: <Yu05mVn6qyShEykr@art_vandelay>
References: <20220722213214.1377835-1-jshargo@chromium.org>
 <20220722213214.1377835-2-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722213214.1377835-2-jshargo@chromium.org>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 jshargo@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:32:09PM -0400, Jim Shargo wrote:
> This is a small refactor to make ConfigFS support easier.
> 
> vkms_config is now a member of vkms_device and we now store a top-level
> reference to vkms_device.
> 
> This should be a no-op refactor.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c    | 58 +++++++++---------------------
>  drivers/gpu/drm/vkms/vkms_drv.h    |  5 ++-
>  drivers/gpu/drm/vkms/vkms_output.c |  6 ++--
>  3 files changed, 22 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 0ffe5f0e33f7..81ed9417e511 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -37,7 +37,7 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> -static struct vkms_config *default_config;
> +static struct vkms_device *vkms_device;

I think this should be stored in the platform device data on registration as
opposed to a global.

>  
>  static bool enable_cursor = true;
>  module_param_named(enable_cursor, enable_cursor, bool, 0444);
> @@ -91,13 +91,9 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  
>  static int vkms_config_show(struct seq_file *m, void *data)
>  {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> -	struct drm_device *dev = node->minor->dev;
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> -
> -	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
> -	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
> -	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> +	seq_printf(m, "writeback=%d\n", vkms_device->config.writeback);
> +	seq_printf(m, "cursor=%d\n", vkms_device->config.cursor);
> +	seq_printf(m, "overlay=%d\n", vkms_device->config.overlay);
>  
>  	return 0;
>  }
> @@ -158,11 +154,10 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	return vkms_output_init(vkmsdev, 0);
>  }
>  
> -static int vkms_create(struct vkms_config *config)
> +static int vkms_create(void)
>  {
>  	int ret;
>  	struct platform_device *pdev;
> -	struct vkms_device *vkms_device;
>  
>  	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
>  	if (IS_ERR(pdev))
> @@ -179,9 +174,11 @@ static int vkms_create(struct vkms_config *config)
>  		ret = PTR_ERR(vkms_device);
>  		goto out_devres;
>  	}
> +	

In order to avoid the vkms_device global you would call platform_set_drvdata()
here and use platform_get_drvdata() to retrieve it elsewhere.

>  	vkms_device->platform = pdev;
> -	vkms_device->config = config;
> -	config->dev = vkms_device;
> +	vkms_device->config.cursor = enable_cursor;
> +	vkms_device->config.writeback = enable_writeback;
> +	vkms_device->config.overlay = enable_overlay;
>  
>  	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>  					   DMA_BIT_MASK(64));
> @@ -207,6 +204,8 @@ static int vkms_create(struct vkms_config *config)
>  
>  	drm_fbdev_generic_setup(&vkms_device->drm, 0);
>  
> +	vkms_device->initialized = true;
> +

Do we really need this? If so, is there a race between this and the check in vkms_exit(), or do you get serialization for free from module init/exit?

>  	return 0;
>  
>  out_devres:
> @@ -218,46 +217,23 @@ static int vkms_create(struct vkms_config *config)
>  
>  static int __init vkms_init(void)
>  {
> -	struct vkms_config *config;
> -
> -	config = kmalloc(sizeof(*config), GFP_KERNEL);
> -	if (!config)
> -		return -ENOMEM;
> -
> -	default_config = config;
> -
> -	config->cursor = enable_cursor;
> -	config->writeback = enable_writeback;
> -	config->overlay = enable_overlay;
> -
> -	return vkms_create(config);
> +	return vkms_create();
>  }
>  
> -static void vkms_destroy(struct vkms_config *config)
> +static void __exit vkms_exit(void)
>  {
>  	struct platform_device *pdev;
>  
> -	if (!config->dev) {
> -		DRM_INFO("vkms_device is NULL.\n");
> +	if (!vkms_device || !vkms_device->initialized) {
>  		return;
>  	}
>  
> -	pdev = config->dev->platform;
> +	pdev = vkms_device->platform;
>  
> -	drm_dev_unregister(&config->dev->drm);
> -	drm_atomic_helper_shutdown(&config->dev->drm);
> +	drm_dev_unregister(&vkms_device->drm);
> +	drm_atomic_helper_shutdown(&vkms_device->drm);
>  	devres_release_group(&pdev->dev, NULL);
>  	platform_device_unregister(pdev);
> -
> -	config->dev = NULL;
> -}
> -
> -static void __exit vkms_exit(void)
> -{
> -	if (default_config->dev)
> -		vkms_destroy(default_config);
> -
> -	kfree(default_config);
>  }
>  
>  module_init(vkms_init);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 91e63b12f60f..c7ebc4ee6b14 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -99,15 +99,14 @@ struct vkms_config {
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
> -	/* only set when instantiated */
> -	struct vkms_device *dev;
>  };
>  
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
>  	struct vkms_output output;
> -	const struct vkms_config *config;
> +	struct vkms_config config;
> +	bool initialized;
>  };
>  
>  #define drm_crtc_to_vkms_output(target) \
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index ba0e82ae549a..d0061c82003a 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -63,7 +63,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	if (vkmsdev->config->overlay) {
> +	if (vkmsdev->config.overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
>  			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
>  			if (ret)
> @@ -71,7 +71,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		}
>  	}
>  
> -	if (vkmsdev->config->cursor) {
> +	if (vkmsdev->config.cursor) {
>  		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
>  		if (IS_ERR(cursor))
>  			return PTR_ERR(cursor);
> @@ -103,7 +103,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		goto err_attach;
>  	}
>  
> -	if (vkmsdev->config->writeback) {
> +	if (vkmsdev->config.writeback) {
>  		writeback = vkms_enable_writeback_connector(vkmsdev);
>  		if (writeback)
>  			DRM_ERROR("Failed to init writeback connector\n");
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
