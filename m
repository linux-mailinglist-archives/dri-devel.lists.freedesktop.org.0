Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134791C58C3
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AB36E5BB;
	Tue,  5 May 2020 14:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDAF6E5C1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 14:18:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y4so2726264wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HZxEkrAK08n4CSM48wActTdCrNpm7aS6hU4TZJhvOto=;
 b=DSXDDKc4RIqW1vaUgM5y0/vth/jcNb7NsDTbrjZYcB3GQR5YEONXiL85xCX0ceu4w/
 cS2uUlPc7i66wAUW14mcW//s66FvLuVgKZ5iwXMNmLUnaknpQX4alBlXiVwxzjvY04R4
 gqKE15czr4+zwfr2jS2xfuCu4KtEOO7L3p/lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HZxEkrAK08n4CSM48wActTdCrNpm7aS6hU4TZJhvOto=;
 b=Rpzc05qSbtbRgi4r5/w9C5vidLcOVHPGfXexA+XXG/ndyNnir1TEZfpCO0RHRFLC2j
 FqoBn07ScVXtNw74C+WQLSslBhAmJwP5CJI6JIgY1vWTVlHBCWOwAn2+FmE3JlSmMMtG
 IdmpUaWKU46On4rbICYA+NMxvKGy9nTzdTLQXrqRyt7g08j7B6LMSdSucyBAs3yKAiw6
 ChauUP5J8e4WdekfT3TNZKNCCiXEEtEI1QTSU7yLDyCfpQL7CHvU+ZQtayQMVvgyGpCq
 uXqrnSAbfrVdOoXYmLk8mc+tHOqjGY8KDP29tVd2q5B7qU3jsatC8EQdkC223XpFGLMs
 Uf2w==
X-Gm-Message-State: AGi0Pubk9Pa9ZQWtyfY3UQQMqaqCZ/ab9Q2N9bxmIbc+GCn7R32FeUOI
 E06pfS91EP/lERQ8eFe3a38xvg==
X-Google-Smtp-Source: APiQypJN+bSYcMhP01HYNbMTHkPWULNqylvYoIt8vIduo34jsmMnDxWrl7E+Nxc/aGTLCFET8DhwAA==
X-Received: by 2002:adf:ab57:: with SMTP id r23mr4319909wrc.180.1588688302865; 
 Tue, 05 May 2020 07:18:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z16sm3787109wrl.0.2020.05.05.07.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:18:22 -0700 (PDT)
Date: Tue, 5 May 2020 16:18:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/5] drm/mgag200: Embed DRM device instance in struct
 mga_device
Message-ID: <20200505141820.GU10381@phenom.ffwll.local>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095649.25814-6-tzimmermann@suse.de>
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

On Tue, May 05, 2020 at 11:56:49AM +0200, Thomas Zimmermann wrote:
> As it is best practice now, the DRM device instance is now embedded in
> struct mga_device. All references to dev_private have been removed.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_cursor.c |  6 +++---
>  drivers/gpu/drm/mgag200/mgag200_drv.c    |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.h    |  4 ++--
>  drivers/gpu/drm/mgag200/mgag200_main.c   | 16 ++++++----------
>  drivers/gpu/drm/mgag200/mgag200_mode.c   |  4 ++--
>  drivers/gpu/drm/mgag200/mgag200_ttm.c    |  4 ++--
>  6 files changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> index aebc9ce43d551..e3c717c0cffc0 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -15,7 +15,7 @@ static bool warn_palette = true;
>  static int mgag200_cursor_update(struct mga_device *mdev, void *dst, void *src,
>  				 unsigned int width, unsigned int height)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  	unsigned int i, row, col;
>  	uint32_t colour_set[16];
>  	uint32_t *next_space = &colour_set[0];
> @@ -119,7 +119,7 @@ static void mgag200_cursor_set_base(struct mga_device *mdev, u64 address)
>  static int mgag200_show_cursor(struct mga_device *mdev, void *src,
>  			       unsigned int width, unsigned int height)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  	struct drm_gem_vram_object *gbo;
>  	void *dst;
>  	s64 off;
> @@ -196,7 +196,7 @@ static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
>  
>  int mgag200_cursor_init(struct mga_device *mdev)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  	size_t ncursors = ARRAY_SIZE(mdev->cursor.gbo);
>  	size_t size;
>  	int ret;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index ad12c1b7c66cc..fc0775694c097 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -71,7 +71,7 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		goto err_pci_disable_device;
>  
> -	dev = mdev->dev;
> +	dev = &mdev->base;
>  
>  	ret = drm_dev_register(dev, ent->driver_data);
>  	if (ret)
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 1ce0386669ffa..fb2797d6ff690 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -96,7 +96,7 @@
>  
>  #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
>  #define to_mga_connector(x) container_of(x, struct mga_connector, base)
> -#define to_mga_device(x) ((struct mga_device *)(x)->dev_private)
> +#define to_mga_device(x) container_of(x, struct mga_device, base)
>  
>  struct mga_crtc {
>  	struct drm_crtc base;
> @@ -153,7 +153,7 @@ enum mga_type {
>  #define IS_G200_SE(mdev) (mdev->type == G200_SE_A || mdev->type == G200_SE_B)
>  
>  struct mga_device {
> -	struct drm_device		*dev;
> +	struct drm_device		base;
>  	unsigned long			flags;
>  
>  	resource_size_t			rmmio_base;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index 070ff1f433df2..ca3ed463c2d41 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -67,7 +67,7 @@ static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
>  /* Map the framebuffer from the card and configure the core */
>  static int mga_vram_init(struct mga_device *mdev)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  	void __iomem *mem;
>  
>  	/* BAR 0 is VRAM */
> @@ -100,14 +100,12 @@ static int mga_vram_init(struct mga_device *mdev)
>  int mgag200_device_init(struct mga_device *mdev, struct drm_driver *drv,
>  			struct pci_dev *pdev, unsigned long flags)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  	int ret, option;
>  
> -	dev = drm_dev_alloc(drv, &pdev->dev);
> -	if (IS_ERR(dev))
> -		return PTR_ERR(dev);
> -	dev->dev_private = (void *)mdev;
> -	mdev->dev = dev;
> +	ret = drm_dev_init(dev, drv, &pdev->dev);

You devm_kzalloc this structure in the previous patch. That's kinda less
correct than what we have now ... I think this patch and the previous one
are needless detour, and straight going to embedding and
devm_drm_dev_alloc like I've done e.g. in

commit cd8294540776f7986b7cf658a3579d576853610c
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed Apr 15 09:40:30 2020 +0200

    drm/aspeed: Use devm_drm_dev_alloc

Then clean up all the fallout later on (i.e. switch over to mga_device and
away from drm_device, heck even the to_mag_device pointer upcasting you
can all do afterwards).

The intermediate stages all have tricky rules for what exactly can and
can't be done, for no real gain, so here a massively split patch series
imo just increases the risks you break something somewhere.

Cheers, Daniel

> +	if (ret)
> +		return ret;
>  
>  	dev->pdev = pdev;
>  	pci_set_drvdata(pdev, dev);
> @@ -185,17 +183,15 @@ int mgag200_device_init(struct mga_device *mdev, struct drm_driver *drv,
>  err_drm_dev_put:
>  	drm_dev_put(dev);
>  err_mm:
> -	dev->dev_private = NULL;
>  	return ret;
>  }
>  
>  void mgag200_device_fini(struct mga_device *mdev)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  
>  	mgag200_modeset_fini(mdev);
>  	drm_mode_config_cleanup(dev);
>  	mgag200_cursor_fini(mdev);
>  	mgag200_mm_fini(mdev);
> -	dev->dev_private = NULL;
>  }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index aaa73b29b04f0..eb58742026adf 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1433,7 +1433,7 @@ static const struct drm_crtc_helper_funcs mga_helper_funcs = {
>  /* CRTC setup */
>  static void mga_crtc_init(struct mga_device *mdev)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  	struct mga_crtc *mga_crtc;
>  
>  	mga_crtc = kzalloc(sizeof(struct mga_crtc) +
> @@ -1618,7 +1618,7 @@ static struct drm_connector *mga_vga_init(struct drm_device *dev)
>  
>  int mgag200_modeset_init(struct mga_device *mdev)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  	struct drm_encoder *encoder = &mdev->encoder;
>  	struct drm_connector *connector;
>  	int ret;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_ttm.c
> index e89657630ea71..86a582490bb67 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
> @@ -34,7 +34,7 @@ int mgag200_mm_init(struct mga_device *mdev)
>  {
>  	struct drm_vram_mm *vmm;
>  	int ret;
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  
>  	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
>  				       mdev->mc.vram_size);
> @@ -57,7 +57,7 @@ int mgag200_mm_init(struct mga_device *mdev)
>  
>  void mgag200_mm_fini(struct mga_device *mdev)
>  {
> -	struct drm_device *dev = mdev->dev;
> +	struct drm_device *dev = &mdev->base;
>  
>  	mdev->vram_fb_available = 0;
>  
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
