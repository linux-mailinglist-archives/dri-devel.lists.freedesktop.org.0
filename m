Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1EC2F2C40
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 11:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72BD6E1A4;
	Tue, 12 Jan 2021 10:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1086E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 10:08:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id q75so1531819wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 02:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v2mt446N8NK3Z4hVhx7wan+9dSWmCpE+8A3GRJUn+6A=;
 b=QfRz6EpvLTAtQQqGqjsNr/+cKu/b7xw5uygbt5vp//RNF/HRwZbSuf8cI5X4t+swyt
 VejsBchkl7g19m4peRdyfGzVFdEocepT8YIWdxw0mryQMAlogWWLYMWtla2UZOsOjnHd
 4y+2armQ74upwN2enX2Kig6SYjkBzx8g9n64zl2ynfLpwyFQsHGWjfdOTZnRKYdrSPGW
 QVMT7qnftyIomFiFuky69g1WpeiSZprHyYqoTZzkDoI/3oj0yWRUOxMLqcPR96lFt8i3
 j0E5jXQ0Ru56gf47ys8RWufAOrDVVgKb13SiX96eJFsPkpnt15SHL0n5f6NRniuYl2m9
 ZWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v2mt446N8NK3Z4hVhx7wan+9dSWmCpE+8A3GRJUn+6A=;
 b=LuabMv+Gby/I0b1spM+trS3awf+xygk1QN99WkmIM5EbX0fZ6ItKCq4D9jJWVlWGFq
 auBznYnACqwys5l1uZ6J2Ka/ibtmYzu6/WUrP589GeGFcDC7tJK0BKsdmGNyQSLGnR68
 FfOlPxkCD0MIQmZbbMPx2kxCR4SkghBJUKLga0s5XngdSVfTFBJehQYLtDfV5zrnzS2f
 kax4UfpMVKncCjCyAMIj8IdoXxTN8u1icpuSE3pGGignTjC394XdOMMP43kQLnLTi6ud
 FKB7jfNhiuKxxFm9LZSxBMk+Ma7ewWeb+R42hIb7ug5+/DSC8E3zN9iGGYaV8hf0svIF
 G/9A==
X-Gm-Message-State: AOAM532dkV8AcDVvhpCqK/Dpahqvz/x7xEDfJYhfY5AGmvBhjfPUVK4H
 qI6MK8+HDHO3aF73XY98CwRjAFZaBgfL2Q==
X-Google-Smtp-Source: ABdhPJwxzR6Kcp0fXKel6Ld0yttofevJnXbclu+fNE4WQ2QfdNTv6SzAqJRvkC0pT6YSkMOUzemk1g==
X-Received: by 2002:a1c:7703:: with SMTP id t3mr2751447wmi.47.1610446101069;
 Tue, 12 Jan 2021 02:08:21 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id e15sm3469632wrg.72.2021.01.12.02.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 02:08:20 -0800 (PST)
Date: Tue, 12 Jan 2021 07:08:13 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V5 1/3] drm/vkms: Add vkms_config type
Message-ID: <20210112100813.xci2u33tcbyb3cna@smtp.gmail.com>
References: <cover.1610391685.git.sylphrenadin@gmail.com>
 <a090ad29b826185df30f80c66932dd2173d7b060.1610391685.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a090ad29b826185df30f80c66932dd2173d7b060.1610391685.git.sylphrenadin@gmail.com>
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

On 01/12, Sumera Priyadarsini wrote:
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
> Co-developed-by: Daniel Vetter <danvet.vetter@ffwl.ch>
> Signed-off-by: Daniel Vetter <danvet.vetter@ffwl.ch>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c    | 40 ++++++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_drv.h    | 12 +++++++--
>  drivers/gpu/drm/vkms/vkms_output.c |  4 +--
>  3 files changed, 44 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index aef29393b811..6b33975a5cb2 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -34,9 +34,9 @@
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
> @@ -122,10 +122,11 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
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
> @@ -143,6 +144,8 @@ static int __init vkms_init(void)
>  		goto out_devres;
>  	}
>  	vkms_device->platform = pdev;
> +	vkms_device->config = config;
> +	config->dev = vkms_device;
>  
>  	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>  					   DMA_BIT_MASK(64));
> @@ -179,21 +182,42 @@ static int __init vkms_init(void)
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
> index 5ed91ff08cb3..6a27bd8875f2 100644
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
> @@ -82,10 +80,19 @@ struct vkms_output {
>  	spinlock_t composer_lock;
>  };
>  
> +struct vkms_device;
> +
> +struct vkms_config {
> +	bool cursor;
> +	/* only set when instantiated */
> +	struct vkms_device *dev;
> +};
> +
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
>  	struct vkms_output output;
> +	const struct vkms_config *config;
>  };
>  
>  #define drm_crtc_to_vkms_output(target) \
> @@ -124,3 +131,4 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
>  
>  #endif /* _VKMS_DRV_H_ */
> +
There is an extra line here

Apart from that, looks good to me.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 4a1848b0318f..8f3ffb28b9d1 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -46,7 +46,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	if (enable_cursor) {
> +	if (vkmsdev->config->cursor) {
>  		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
>  		if (IS_ERR(cursor)) {
>  			ret = PTR_ERR(cursor);
> @@ -98,7 +98,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
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
