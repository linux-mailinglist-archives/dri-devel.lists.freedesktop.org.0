Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B711EFD7A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 18:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80BA6E946;
	Fri,  5 Jun 2020 16:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D436E456
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 16:22:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q25so9723246wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1moQY1CxNPkQJBWlPDlYe9rY7+avqbs5S/Gr77Ld6pI=;
 b=FVIzRoucO2inS63YAGPXyskJIwLoxRfjL/12C0/DxBjQ8Jf+ZyTg/7Kj9gPhfdQBO8
 LT86cWZMYwynzlaeObB5hpZg13osyQ66Mled4W74Lp9I29Rvqd6bsQpTDAVelqEzXNq1
 P9CBZFvDcddhEJMRUf1iFQrXoAecLR7NjWETk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1moQY1CxNPkQJBWlPDlYe9rY7+avqbs5S/Gr77Ld6pI=;
 b=E6KDoXmqqzSRB6hSJyJfJ/LR11Fhgnj5fjgmjwxtEnoHl4KbPP5h6Q1QgmD8l+leBI
 nTFlfmXwpqI+qTkT6N/PkHDGRC5cPb2CWw95Ylzg8LpJekWhrFuCVvdl22PC+pnC5hdW
 TxJlpkSg9EIjJow8wR60xjzww1FVNfcZCmkYxmnMzzItyLQd3f1FunB9UIhQgcPM43HK
 56HvbU3rzp2y1PPfTjc8Axhi3C3THyXXIBe6fWcSjEer/DI1RkFdVfBuBgXgHcfnvjuv
 MRo7QsnU8deoRaqBhkROrGoMGTVVlLg/mXEMCxgAa1hBKYAX9d2geOamiN9a52MekZ8W
 kvhA==
X-Gm-Message-State: AOAM532lhLc56Si2/pw8gR+4tqRK65EUPGS3RWpJ8+eOXd6pjaXOuwOd
 cPIilpOJru17Shv7jbjpFL9dCA==
X-Google-Smtp-Source: ABdhPJwlV/X4k8rLul4EuPDH8uIG7jz8gqOPZz1Z3upTrJeoT7Pv7zhm2X52uHsOSE5BC5gBxQW7rg==
X-Received: by 2002:a1c:6446:: with SMTP id y67mr3678724wmb.156.1591374152396; 
 Fri, 05 Jun 2020 09:22:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x18sm11437765wmi.35.2020.06.05.09.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 09:22:31 -0700 (PDT)
Date: Fri, 5 Jun 2020 18:22:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/14] drm/mgag200: Switch to managed MM
Message-ID: <20200605162229.GV20149@phenom.ffwll.local>
References: <20200605135803.19811-1-tzimmermann@suse.de>
 <20200605135803.19811-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605135803.19811-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 05, 2020 at 03:57:56PM +0200, Thomas Zimmermann wrote:
> The memory-management code now cleans up automatically as part of
> device destruction.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 -
>  drivers/gpu/drm/mgag200/mgag200_main.c |  5 +----
>  drivers/gpu/drm/mgag200/mgag200_mm.c   | 28 ++++++++++++++------------
>  3 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index cd786ffe319b8..7b6e6827a9a21 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -198,6 +198,5 @@ void mgag200_i2c_destroy(struct mga_i2c_chan *i2c);
>  
>  				/* mgag200_mm.c */
>  int mgag200_mm_init(struct mga_device *mdev);
> -void mgag200_mm_fini(struct mga_device *mdev);
>  
>  #endif				/* __MGAG200_DRV_H__ */
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index e9ad783c2b44d..49bcdfcb40a4e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -57,13 +57,11 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	ret = mgag200_modeset_init(mdev);
>  	if (ret) {
>  		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
> -		goto err_mgag200_mm_fini;
> +		goto err_mm;
>  	}
>  
>  	return 0;
>  
> -err_mgag200_mm_fini:
> -	mgag200_mm_fini(mdev);
>  err_mm:
>  	dev->dev_private = NULL;
>  	return ret;
> @@ -75,6 +73,5 @@ void mgag200_driver_unload(struct drm_device *dev)
>  
>  	if (mdev == NULL)
>  		return;
> -	mgag200_mm_fini(mdev);
>  	dev->dev_private = NULL;
>  }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
> index f56b0456994f4..1b1e5ec5d1ceb 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mm.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
> @@ -28,6 +28,8 @@
>  
>  #include <linux/pci.h>
>  
> +#include <drm/drm_managed.h>
> +
>  #include "mgag200_drv.h"
>  
>  static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
> @@ -73,6 +75,18 @@ static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
>  	return offset - 65536;
>  }
>  
> +static void mgag200_mm_release(struct drm_device *dev, void *ptr)
> +{
> +	struct mga_device *mdev = to_mga_device(dev);
> +
> +	mdev->vram_fb_available = 0;
> +	iounmap(mdev->vram);
> +	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
> +				pci_resource_len(dev->pdev, 0));
> +	arch_phys_wc_del(mdev->fb_mtrr);
> +	mdev->fb_mtrr = 0;
> +}
> +
>  int mgag200_mm_init(struct mga_device *mdev)
>  {
>  	struct drm_device *dev = mdev->dev;
> @@ -104,22 +118,10 @@ int mgag200_mm_init(struct mga_device *mdev)
>  
>  	mdev->vram_fb_available = mdev->mc.vram_size;
>  
> -	return 0;
> +	return drmm_add_action_or_reset(dev, mgag200_mm_release, NULL);
>  
>  err_arch_phys_wc_del:
>  	arch_phys_wc_del(mdev->fb_mtrr);
>  	arch_io_free_memtype_wc(start, len);

Btw I think devm versions of these two would benefit a bunch of drivers in
their cleanup code. devm_ not drmm_ since it's hw resource cleanup. In
case you ever run out of ideas :-)

Cheeres, Daniel

>  	return ret;
>  }
> -
> -void mgag200_mm_fini(struct mga_device *mdev)
> -{
> -	struct drm_device *dev = mdev->dev;
> -
> -	mdev->vram_fb_available = 0;
> -	iounmap(mdev->vram);
> -	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
> -				pci_resource_len(dev->pdev, 0));
> -	arch_phys_wc_del(mdev->fb_mtrr);
> -	mdev->fb_mtrr = 0;
> -}
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
