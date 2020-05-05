Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE71C583C
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B746E351;
	Tue,  5 May 2020 14:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9436E351
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 14:09:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k12so2454425wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ieSP7DSxlyUF4qGRGu/YdyIDGCWP02pGQHcHUhzUDiI=;
 b=Nid52IudA9NrX/1/WG5zQzTDIV1rqy6gorG1BXfHiQq3xLcGhXS7mYlD3/Q4VmvXnz
 JEvM+AE/3+L9SF46lJfYn836yKa8D+k2WygV2MCe/V8PxFDvOhWyxfgX9YJUmDxpOiAg
 Xlv2QIEwwoWZiuKIde/du3nZES52Xx/PNC+98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ieSP7DSxlyUF4qGRGu/YdyIDGCWP02pGQHcHUhzUDiI=;
 b=g+jwqI7aYjnXNWu2oQjZgkMfQpklj9q+oy9ndEHBdkQyJmaNeDMAHhH7EezkCUSZ+I
 Gz4mWn/LGMfGUcxI8Ef94kvNVMaM5gaZsw3LZFshi6ZTBWWgXvtqtDpzAUyiM4OshRnd
 KdQQm/wsT2OrB/2P79ps5nGQV0WRAY5/donLN1BUJ2VPp6HI9DCeaMUF9pM0p5dMxeT2
 JEZuxJ8mVVtVHztwUGvV+z+ESlR6a3G0+/R/hRsYVRfngRz8vAGB1i9R99vYG/OVOL/c
 BXhdn0aRm0x6KoP6XyRJqbrXm4wGlqJKv05P2NnlmiivMlsgBCLLWAztl+OP5Vzr9lVz
 vXrg==
X-Gm-Message-State: AGi0PuYvatGci6qJCdT7nX75oeCHtaPucKqs93glqm6VO522SFnR3+e1
 2In5YdNaSdFeWUhOP5yzRHLkTQ==
X-Google-Smtp-Source: APiQypKzYQO63Yvqam8V0s5EVWeHmlKFjodOoNTOxMr9BGwjt8GORwnPmy0WlNIVCSZYQ/Z4R2b9dQ==
X-Received: by 2002:a05:600c:c9:: with SMTP id u9mr3473411wmm.15.1588687774538; 
 Tue, 05 May 2020 07:09:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h10sm3470018wrv.29.2020.05.05.07.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:09:32 -0700 (PDT)
Date: Tue, 5 May 2020 16:09:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/5] drm/mgag200: Remove several references to struct
 mga_device.dev
Message-ID: <20200505140930.GS10381@phenom.ffwll.local>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095649.25814-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 05, 2020 at 11:56:47AM +0200, Thomas Zimmermann wrote:
> Done in preparation of embedding the DRM device in struct mga_device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Not exactly sure what the goal is, since mga_vga_init still uses
drm_device and not the mdev struct. *shrug*

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> ---
>  drivers/gpu/drm/mgag200/mgag200_main.c | 21 +++++++++++----------
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 17 +++++++++--------
>  2 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index 3830d3f3c9fa2..010b309c01fc4 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -66,25 +66,26 @@ static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
>  /* Map the framebuffer from the card and configure the core */
>  static int mga_vram_init(struct mga_device *mdev)
>  {
> +	struct drm_device *dev = mdev->dev;
>  	void __iomem *mem;
>  
>  	/* BAR 0 is VRAM */
> -	mdev->mc.vram_base = pci_resource_start(mdev->dev->pdev, 0);
> -	mdev->mc.vram_window = pci_resource_len(mdev->dev->pdev, 0);
> +	mdev->mc.vram_base = pci_resource_start(dev->pdev, 0);
> +	mdev->mc.vram_window = pci_resource_len(dev->pdev, 0);
>  
> -	if (!devm_request_mem_region(mdev->dev->dev, mdev->mc.vram_base, mdev->mc.vram_window,
> -				"mgadrmfb_vram")) {
> +	if (!devm_request_mem_region(dev->dev, mdev->mc.vram_base,
> +				     mdev->mc.vram_window, "mgadrmfb_vram")) {
>  		DRM_ERROR("can't reserve VRAM\n");
>  		return -ENXIO;
>  	}
>  
> -	mem = pci_iomap(mdev->dev->pdev, 0, 0);
> +	mem = pci_iomap(dev->pdev, 0, 0);
>  	if (!mem)
>  		return -ENOMEM;
>  
>  	mdev->mc.vram_size = mga_probe_vram(mdev, mem);
>  
> -	pci_iounmap(mdev->dev->pdev, mem);
> +	pci_iounmap(dev->pdev, mem);
>  
>  	return 0;
>  }
> @@ -116,11 +117,11 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	mdev->has_sdram = !(option & (1 << 14));
>  
>  	/* BAR 0 is the framebuffer, BAR 1 contains registers */
> -	mdev->rmmio_base = pci_resource_start(mdev->dev->pdev, 1);
> -	mdev->rmmio_size = pci_resource_len(mdev->dev->pdev, 1);
> +	mdev->rmmio_base = pci_resource_start(dev->pdev, 1);
> +	mdev->rmmio_size = pci_resource_len(dev->pdev, 1);
>  
> -	if (!devm_request_mem_region(mdev->dev->dev, mdev->rmmio_base, mdev->rmmio_size,
> -				"mgadrmfb_mmio")) {
> +	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
> +				     mdev->rmmio_size, "mgadrmfb_mmio")) {
>  		drm_err(dev, "can't reserve mmio registers\n");
>  		return -ENOMEM;
>  	}
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index fa91869c0db52..aaa73b29b04f0 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1433,6 +1433,7 @@ static const struct drm_crtc_helper_funcs mga_helper_funcs = {
>  /* CRTC setup */
>  static void mga_crtc_init(struct mga_device *mdev)
>  {
> +	struct drm_device *dev = mdev->dev;
>  	struct mga_crtc *mga_crtc;
>  
>  	mga_crtc = kzalloc(sizeof(struct mga_crtc) +
> @@ -1442,7 +1443,7 @@ static void mga_crtc_init(struct mga_device *mdev)
>  	if (mga_crtc == NULL)
>  		return;
>  
> -	drm_crtc_init(mdev->dev, &mga_crtc->base, &mga_crtc_funcs);
> +	drm_crtc_init(dev, &mga_crtc->base, &mga_crtc_funcs);
>  
>  	drm_mode_crtc_set_gamma_size(&mga_crtc->base, MGAG200_LUT_SIZE);
>  	mdev->mode_info.crtc = mga_crtc;
> @@ -1617,30 +1618,30 @@ static struct drm_connector *mga_vga_init(struct drm_device *dev)
>  
>  int mgag200_modeset_init(struct mga_device *mdev)
>  {
> +	struct drm_device *dev = mdev->dev;
>  	struct drm_encoder *encoder = &mdev->encoder;
>  	struct drm_connector *connector;
>  	int ret;
>  
>  	mdev->mode_info.mode_config_initialized = true;
>  
> -	mdev->dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> -	mdev->dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
> +	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> +	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
>  
> -	mdev->dev->mode_config.fb_base = mdev->mc.vram_base;
> +	dev->mode_config.fb_base = mdev->mc.vram_base;
>  
>  	mga_crtc_init(mdev);
>  
> -	ret = drm_simple_encoder_init(mdev->dev, encoder,
> -				      DRM_MODE_ENCODER_DAC);
> +	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
>  	if (ret) {
> -		drm_err(mdev->dev,
> +		drm_err(dev,
>  			"drm_simple_encoder_init() failed, error %d\n",
>  			ret);
>  		return ret;
>  	}
>  	encoder->possible_crtcs = 0x1;
>  
> -	connector = mga_vga_init(mdev->dev);
> +	connector = mga_vga_init(dev);
>  	if (!connector) {
>  		DRM_ERROR("mga_vga_init failed\n");
>  		return -1;
> -- 
> 2.26.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
