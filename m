Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F32EC3B0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 20:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5E089BC2;
	Wed,  6 Jan 2021 19:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1D689BC2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 19:08:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d26so3351132wrb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jan 2021 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4KW/gQds2UZRxF+0UsRPVqfC4ctbeb1eJIOWPKMrFE8=;
 b=iB3TV8muZwiqAKxLfBO3/oCj9PsnKnYi6UaqZZz7Od+gtJx8VXU5c9t0klmdUEHTN9
 QX0jcCxfLutPuS/NhlvuwtdyTfG5G4qlkzUKymDs2h46B7yLttWvu23gCWI1/Fwj3uug
 oUNged6QUcehKqcDWUv9Z7m36+5X42Te61MuR7Sba0cY3k318YK5yiAjWPtCy4+rXlRH
 qbAnQP5rGL4Jv9mIrs/dU141j9n26/WijEFrdS/z23rIfxOkyZjEOn3tc+PyRrXK3a4T
 Tir+VsfLMLYY4h5f6oPWlvnyiNFxGH4+R3gMYtcpWl26r9ZHTA+R+RzrHOgVVmOrODLo
 0jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4KW/gQds2UZRxF+0UsRPVqfC4ctbeb1eJIOWPKMrFE8=;
 b=tFKxLtazy3rPo6xJ3xIcr7ix6Q8TsOQiZmEBvK8nQ+rLYpvI0YIFz/HKBb2yzkcpGB
 rTvak4zgtGggLLlHO/DVjbL0HEojeSUtTGqshh47g9EOQQFGFo+v0W0Y6FVcvJlIM2tC
 euPRNSY75MZQ2jJSmqaIHoCHKonys/VmTdWZCXyKFbTapBgJ+mgeQTHwNO2Eruh2dwgX
 lIXQHsp5Lrz8IBdwl8c22y6KJDuti1xr5vedGS4uCNno1qXNWwwjGMaISf2bHDQrt551
 hKRc4mUbiQtZ0Y2CL8FcA8sjt+QTfTfOBwFnYC67un0bj5WcwoVQccaYgFCewDD8Vtz5
 dEMw==
X-Gm-Message-State: AOAM530LPiY+iAxWAFzEh+Pf1ZaFJMKKaKGoxCV8AEMMNpPorp8U+0AV
 bCplTTX+5aY/LIcrMrRzAhE=
X-Google-Smtp-Source: ABdhPJxqDVvoG7sS9GxjtrxYAXVTSWj6J6tHvXydOq5YxY/RFEojUdg7myUuMoi1LnHmB143pp6iyA==
X-Received: by 2002:adf:8185:: with SMTP id 5mr5452525wra.44.1609960119753;
 Wed, 06 Jan 2021 11:08:39 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id n17sm4002270wmc.33.2021.01.06.11.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 11:08:39 -0800 (PST)
Date: Wed, 6 Jan 2021 16:08:32 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V3] drm/vkms: Decouple config data for configfs
Message-ID: <20210106190832.7fmwzohejkdohtck@smtp.gmail.com>
References: <20210105145958.r5q553i6ji7fru6l@adolin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105145958.r5q553i6ji7fru6l@adolin>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/05, Sumera Priyadarsini wrote:
> Currently, data for the device instance is held by vkms_device.
> Add a separate type, vkms_config to contain configuration details
> for the device and various modes to be later used by configfs.
> This config data stays constant once the device is created.
> 
> Accordingly, add vkms_create and vkms_destroy to initialize/destroy
> device through configfs. Currently, they are being called from vkms_init
> and vkms_exit, but will be evoked from configfs later on. When configfs
> is added, device configuration will be tracked by configfs and only vkms
> device lifetime will be handled by vkms_init and vkms_exit functions.
> 
> Modify usage of enable_cursor feature to reflect the changes in
> relevant files.
> 
> Add enable_writeback_connector feature to vkms_config type.
> 
> Co-developed-by: Daniel Vetter <danvet.vetter@ffwl.ch>
> Signed-off-by: Daniel Vetter <danvet.vetter@ffwl.ch>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> 
> ---
> Changes in v2:
> - add Co-developed-by tag
> 
> Changes in v3:
> - correct usage of Co-developed by tag(Melissa)
> - add enable_writeback_feature(Melissa)
> - modify commit message(Melissa)
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c    | 45 ++++++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_drv.h    | 12 ++++++--
>  drivers/gpu/drm/vkms/vkms_output.c | 13 +++++----
>  3 files changed, 54 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index aef29393b811..fab964900dce 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -34,12 +34,16 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> -static struct vkms_device *vkms_device;
> +static struct vkms_config *default_config;
>  
> -bool enable_cursor = true;
> +static bool enable_cursor = true;
>  module_param_named(enable_cursor, enable_cursor, bool, 0444);
>  MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
>  
> +static bool enable_writeback_connector = true;
> +module_param_named(enable_writeback_connector, enable_writeback_connector, bool, 0444);
> +MODULE_PARM_DESC(enable_writeback_connector, "Enable/Disable writeback connector support");
> +
Even though the limit is now 100 characteres, I consider 'enable_writeback'
enough here. I think removing this _connector suffix doesn't affect the
undestanding and also save some space to avoid break lines in the future

>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>  
>  static void vkms_release(struct drm_device *dev)
> @@ -122,10 +126,11 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	return vkms_output_init(vkmsdev, 0);
>  }
>  
> -static int __init vkms_init(void)
> +static int vkms_create(struct vkms_config *config)
>  {
>  	int ret;
>  	struct platform_device *pdev;
> +	struct vkms_device *vkms_device;
>  
>  	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
>  	if (IS_ERR(pdev))
> @@ -143,6 +148,8 @@ static int __init vkms_init(void)
>  		goto out_devres;
>  	}
>  	vkms_device->platform = pdev;
> +	vkms_device->config = config;
> +	config->dev = vkms_device;
>  
>  	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>  					   DMA_BIT_MASK(64));
> @@ -179,21 +186,43 @@ static int __init vkms_init(void)
>  	return ret;
>  }
>  
> -static void __exit vkms_exit(void)
> +static int __init vkms_init(void)
> +{
> +	struct vkms_config *config = kmalloc(sizeof(*config), GFP_KERNEL);
> +
> +	default_config = config;
> +
> +	config->cursor = enable_cursor;
> +	config->writeback = enable_writeback_connector;
> +
> +	return vkms_create(config);
> +}
> +
> +static void vkms_destroy(struct vkms_config *config)
>  {
>  	struct platform_device *pdev;
>  
> -	if (!vkms_device) {
> +	if (!config->dev) {
>  		DRM_INFO("vkms_device is NULL.\n");
>  		return;
>  	}
>  
> -	pdev = vkms_device->platform;
> +	pdev = config->dev->platform;
>  
> -	drm_dev_unregister(&vkms_device->drm);
> -	drm_atomic_helper_shutdown(&vkms_device->drm);
> +	drm_dev_unregister(&config->dev->drm);
> +	drm_atomic_helper_shutdown(&config->dev->drm);
>  	devres_release_group(&pdev->dev, NULL);
>  	platform_device_unregister(pdev);
> +
> +	config->dev = NULL;
> +}
> +
> +static void __exit vkms_exit(void)
> +{
> +	if (default_config->dev)
> +		vkms_destroy(default_config);
> +
> +	kfree(default_config);
>  }
>  
>  module_init(vkms_init);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5ed91ff08cb3..caa1fafb6ca7 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -19,8 +19,6 @@
>  #define XRES_MAX  8192
>  #define YRES_MAX  8192
>  
> -extern bool enable_cursor;
> -
>  struct vkms_composer {
>  	struct drm_framebuffer fb;
>  	struct drm_rect src, dst;
> @@ -82,10 +80,18 @@ struct vkms_output {
>  	spinlock_t composer_lock;
>  };
>  
> +struct vkms_device;
> +struct vkms_config {
> +	bool writeback;
> +	bool cursor;
> +	/* only set when instantiated */
> +	struct vkms_device *dev;
> +};
Still in time, checkpatch complains here:
CHECK: Please use a blank line after function/struct/union/enum declarations

>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
>  	struct vkms_output output;
> +	const struct vkms_config *config;
>  };
>  
>  #define drm_crtc_to_vkms_output(target) \
> @@ -123,4 +129,4 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
>  
> -#endif /* _VKMS_DRV_H_ */
> +#endif /* _VKMS_DRV_H_ */
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 4a1848b0318f..f5f6f15c362c 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -41,12 +41,13 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	struct drm_crtc *crtc = &output->crtc;
>  	struct drm_plane *primary, *cursor = NULL;
>  	int ret;
> +	int writeback;
>  
>  	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	if (enable_cursor) {
> +	if (vkmsdev->config->cursor) {
>  		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
>  		if (IS_ERR(cursor)) {
>  			ret = PTR_ERR(cursor);
> @@ -80,9 +81,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		goto err_attach;
>  	}
>  
> -	ret = vkms_enable_writeback_connector(vkmsdev);
> -	if (ret)
> -		DRM_ERROR("Failed to init writeback connector\n");
> +	if (vkmsdev->config->writeback) {
> +		writeback = vkms_enable_writeback_connector(vkmsdev);
> +		if (writeback)
> +			DRM_ERROR("Failed to init writeback connector\n");
> +	}

I would recommend the changes related to module options come in a second
patch of a patch series. I mean, a patchset with (1) decoupling configs
from device and (2) conversions.

besides that, lgtm.

but maybe Daniel has additional/other recommendations to share...
>  
>  	drm_mode_config_reset(dev);
>  
> @@ -98,7 +101,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	drm_crtc_cleanup(crtc);
>  
>  err_crtc:
> -	if (enable_cursor)
> +	if (vkmsdev->config->cursor)
>  		drm_plane_cleanup(cursor);
>  
>  err_cursor:
> -- 
> 2.25.1
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
