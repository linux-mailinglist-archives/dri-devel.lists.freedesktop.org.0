Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58FD1C5813
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BF36E260;
	Tue,  5 May 2020 14:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34A96E260
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 14:05:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g13so2874494wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nLNuSSOz3JpxFG4r0zabGM7iVt2/JsvAVtOygSGlYJI=;
 b=da3xQEv5aVoEIOBoPZezYFYZmT2BTYtL5kbuf8CEA8ntsAlAcYngCvHVxTJE7ZwaTS
 gzjSvScfdlSe1+swECFU8lnWn1voIBXmj5B+u0vX2Nv+cv83hhJsFtuz6YGeVsR/mK1v
 /QujrlnDFyzl1gRuS6JRpj52QOZDrzgECZnuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nLNuSSOz3JpxFG4r0zabGM7iVt2/JsvAVtOygSGlYJI=;
 b=WHP3DuJsPhwB9ZhPvUVYeQ2/TE4XyQKiH52BONp+LIz7mXo1D9WDkEs54dfxc8VODF
 xamN8p9dDrhylGu4Ner7nFbXnz+5Mmf0OnT75wnOn9bM49CurdRf8GxqfMv7uE173OmX
 fBHAUFhSYtVQkvNeMRJuloDzaaeco7VEdi7QhBxTnMWT1pAUcH2rOqZQhVRY6tZemUU9
 slRs707aUznJkjsJe0lOw5fmsv/Bbg78O/1ouvAUfiLuRrpo9mT/YM5XIFNAnSs9VM1c
 L4HCjxDJmq1urQUJS5N3+ybhjfv7pq/qh9iPXGhe1R2cIgI4tOwgXVjQyPEYDNdvduIS
 u5Qg==
X-Gm-Message-State: AGi0PuZHtAPtnAyYiNjyzpfgdVwLXTPFlBk0SY7dd1WnbY98rflfsAu0
 avE1avLGKFm3Bw6PislkqCUBCA==
X-Google-Smtp-Source: APiQypKmpZ58SsOe6tgLXOmt/U58IfI4derFmMjXC9TlR+BLHlc1u/9aEVKs1YxCq4z/F4UZi/D00Q==
X-Received: by 2002:adf:df01:: with SMTP id y1mr3847209wrl.401.1588687536414; 
 Tue, 05 May 2020 07:05:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm3611386wrs.81.2020.05.05.07.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:05:35 -0700 (PDT)
Date: Tue, 5 May 2020 16:05:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/5] drm/mgag200: Integrate init function into load
 function
Message-ID: <20200505140533.GR10381@phenom.ffwll.local>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095649.25814-3-tzimmermann@suse.de>
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

On Tue, May 05, 2020 at 11:56:46AM +0200, Thomas Zimmermann wrote:
> Done to simplify initialization code before embedding the DRM device
> instance in struct mga_device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/mgag200/mgag200_main.c | 67 ++++++++++----------------
>  1 file changed, 26 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index b705b7776d2fc..3830d3f3c9fa2 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -89,12 +89,23 @@ static int mga_vram_init(struct mga_device *mdev)
>  	return 0;
>  }
>  
> -static int mgag200_device_init(struct drm_device *dev,
> -			       uint32_t flags)
> +/*
> + * Functions here will be called by the core once it's bound the driver to
> + * a PCI device
> + */
> +
> +
> +int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  {
> -	struct mga_device *mdev = to_mga_device(dev);
> +	struct mga_device *mdev;
>  	int ret, option;
>  
> +	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
> +	if (mdev == NULL)
> +		return -ENOMEM;
> +	dev->dev_private = (void *)mdev;
> +	mdev->dev = dev;
> +
>  	mdev->flags = mgag200_flags_from_driver_data(flags);
>  	mdev->type = mgag200_type_from_driver_data(flags);
>  
> @@ -110,7 +121,7 @@ static int mgag200_device_init(struct drm_device *dev,
>  
>  	if (!devm_request_mem_region(mdev->dev->dev, mdev->rmmio_base, mdev->rmmio_size,
>  				"mgadrmfb_mmio")) {
> -		DRM_ERROR("can't reserve mmio registers\n");
> +		drm_err(dev, "can't reserve mmio registers\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -121,8 +132,8 @@ static int mgag200_device_init(struct drm_device *dev,
>  	/* stash G200 SE model number for later use */
>  	if (IS_G200_SE(mdev)) {
>  		mdev->unique_rev_id = RREG32(0x1e24);
> -		DRM_DEBUG("G200 SE unique revision id is 0x%x\n",
> -			  mdev->unique_rev_id);
> +		drm_dbg(dev, "G200 SE unique revision id is 0x%x\n",
> +			mdev->unique_rev_id);
>  	}
>  
>  	ret = mga_vram_init(mdev);
> @@ -133,33 +144,9 @@ static int mgag200_device_init(struct drm_device *dev,
>  	mdev->bpp_shifts[1] = 1;
>  	mdev->bpp_shifts[2] = 0;
>  	mdev->bpp_shifts[3] = 2;
> -	return 0;
> -}
>  
> -/*
> - * Functions here will be called by the core once it's bound the driver to
> - * a PCI device
> - */
> -
> -
> -int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
> -{
> -	struct mga_device *mdev;
> -	int r;
> -
> -	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
> -	if (mdev == NULL)
> -		return -ENOMEM;
> -	dev->dev_private = (void *)mdev;
> -	mdev->dev = dev;
> -
> -	r = mgag200_device_init(dev, flags);
> -	if (r) {
> -		dev_err(&dev->pdev->dev, "Fatal error during GPU init: %d\n", r);
> -		return r;
> -	}
> -	r = mgag200_mm_init(mdev);
> -	if (r)
> +	ret = mgag200_mm_init(mdev);
> +	if (ret)
>  		goto err_mm;
>  
>  	drm_mode_config_init(dev);
> @@ -170,16 +157,15 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  		dev->mode_config.preferred_depth = 32;
>  	dev->mode_config.prefer_shadow = 1;
>  
> -	r = mgag200_modeset_init(mdev);
> -	if (r) {
> -		dev_err(&dev->pdev->dev, "Fatal error during modeset init: %d\n", r);
> +	ret = mgag200_modeset_init(mdev);
> +	if (ret) {
> +		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
>  		goto err_modeset;
>  	}
>  
> -	r = mgag200_cursor_init(mdev);
> -	if (r)
> -		dev_warn(&dev->pdev->dev,
> -			"Could not initialize cursors. Not doing hardware cursors.\n");
> +	ret = mgag200_cursor_init(mdev);
> +	if (ret)
> +		drm_err(dev, "Could not initialize cursors. Not doing hardware cursors.\n");
>  
>  	return 0;
>  
> @@ -189,8 +175,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	mgag200_mm_fini(mdev);
>  err_mm:
>  	dev->dev_private = NULL;
> -
> -	return r;
> +	return ret;
>  }
>  
>  void mgag200_driver_unload(struct drm_device *dev)
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
