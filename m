Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C1316911B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 18:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177566E96C;
	Sat, 22 Feb 2020 17:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0BD6E96C
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 17:58:04 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so5006073wmb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mEAPOBdltrhXgr7x5xeYfy30vkVOQGhKa3P7L+Xgvco=;
 b=a8aAmus33dA6EYTorcPSsECq1FY/rXaSUDcC3umB38ZbOEg/76d3cEPOYSDvG1R/ox
 86OD/YvDi+Zj9bb+HVKIqf9lQlBnIw5wJIee34TslvxtLd1mdjslrP3nDLh4T9hd+Hnp
 8pi/3CG8/N1t6+te5A7inzUqMtwVIJ+4Njgh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mEAPOBdltrhXgr7x5xeYfy30vkVOQGhKa3P7L+Xgvco=;
 b=TUMIjLmFiH3htgcT+R2YRBqQ8Z2reAZCKEQz9lZHzDFJ/wCwhz799S9iAM2jmW5JKM
 Ipi1LKZbtLJ7xyCMBhUYDWnUQSKKX7/k6j1Jfygt8uabOY6K1pw9CgSqpYZfNJ2UCTaw
 YiM8lJSo54CzzAbPbkhv+RGjjymURZ7h8e3UmfVwWyWBET1qZE7w0KABsc+lQP08MFT3
 NB7tyyjtXc62pGsaK5ceePsYuCbr375NJp83DtK1kYam8jG4bFw9Tq9G68A17XWRvDvg
 NR2HJsVwpE4HRghPguAAyxxDzeBGRE0Po6dEH76cVZPvzoOYhoGqpTE4yNuUDSHJLUJV
 FBXw==
X-Gm-Message-State: APjAAAVO7bhsHjIACRtanwk8pVH/JtFxwWK/N/ZNrrg8Twu7oY+rUvDs
 bLXOP7iYnbfK7mOWZR+ms7KNTQ==
X-Google-Smtp-Source: APXvYqxr55BRhrUbtoyJRJrXLzgTq+7F7sX3dhjcNBNE1I6veWGjKfngsR5fpBNpa2rzN39S5suTVw==
X-Received: by 2002:a05:600c:218a:: with SMTP id
 e10mr11084257wme.6.1582394282925; 
 Sat, 22 Feb 2020 09:58:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w1sm9851996wro.72.2020.02.22.09.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 09:58:02 -0800 (PST)
Date: Sat, 22 Feb 2020 18:58:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFC 1/3] drm: Move legacy device list out of drm_driver
Message-ID: <20200222175800.GJ2363188@phenom.ffwll.local>
References: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200222152430.2984-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222152430.2984-2-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 05:24:28PM +0200, Laurent Pinchart wrote:
> The drm_driver structure contains a single field (legacy_dev_list) that
> is modified by the DRM core, used to store a linked list of legacy DRM
> devices associated with the driver. In order to make the structure
> const, move the field out to a global variable. This requires locking
> access to the global where the local field didn't require serialization,
> but this only affects legacy drivers, and isn't in any hot path.
> 
> While at it, compile-out the legacy_dev_list field when DRM_LEGACY isn't
> defined.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_pci.c | 30 ++++++++++++++++++++++--------
>  include/drm/drm_device.h  |  2 ++
>  include/drm/drm_drv.h     |  2 --
>  3 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index c6bb98729a26..44805ac3177c 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -24,6 +24,8 @@
>  
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  
> @@ -36,6 +38,12 @@
>  #include "drm_internal.h"
>  #include "drm_legacy.h"
>  
> +#ifdef CONFIG_DRM_LEGACY
> +/* List of devices hanging off drivers with stealth attach. */
> +static LIST_HEAD(legacy_dev_list);
> +static DEFINE_MUTEX(legacy_dev_list_lock);
> +#endif
> +
>  /**
>   * drm_pci_alloc - Allocate a PCI consistent memory block, for DMA.
>   * @dev: DRM device
> @@ -236,10 +244,13 @@ int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
>  	if (ret)
>  		goto err_agp;
>  
> -	/* No locking needed since shadow-attach is single-threaded since it may
> -	 * only be called from the per-driver module init hook. */
> -	if (drm_core_check_feature(dev, DRIVER_LEGACY))
> -		list_add_tail(&dev->legacy_dev_list, &driver->legacy_dev_list);
> +#ifdef CONFIG_DRM_LEGACY
> +	if (drm_core_check_feature(dev, DRIVER_LEGACY)) {
> +		mutex_lock(&legacy_dev_list_lock);
> +		list_add_tail(&dev->legacy_dev_list, &legacy_dev_list);
> +		mutex_unlock(&legacy_dev_list_lock);
> +	}
> +#endif
>  
>  	return 0;
>  
> @@ -275,7 +286,6 @@ int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
>  		return -EINVAL;
>  
>  	/* If not using KMS, fall back to stealth mode manual scanning. */
> -	INIT_LIST_HEAD(&driver->legacy_dev_list);
>  	for (i = 0; pdriver->id_table[i].vendor != 0; i++) {
>  		pid = &pdriver->id_table[i];
>  
> @@ -317,11 +327,15 @@ void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
>  	if (!(driver->driver_features & DRIVER_LEGACY)) {
>  		WARN_ON(1);
>  	} else {
> -		list_for_each_entry_safe(dev, tmp, &driver->legacy_dev_list,
> +		mutex_lock(&legacy_dev_list_lock);
> +		list_for_each_entry_safe(dev, tmp, &legacy_dev_list,
>  					 legacy_dev_list) {
> -			list_del(&dev->legacy_dev_list);
> -			drm_put_dev(dev);
> +			if (dev->driver == driver) {
> +				list_del(&dev->legacy_dev_list);
> +				drm_put_dev(dev);

I checked whether this would result in any issues with the new mutex_lock,
but with the legacy model there's no hotunplug or anything like that, so
we never need to remove ourselves from this list coming from the other
direction. We just oops :-)

> +			}
>  		}
> +		mutex_unlock(&legacy_dev_list_lock);
>  	}
>  	DRM_INFO("Module unloaded\n");
>  }
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index bb60a949f416..215b3472c773 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -51,12 +51,14 @@ enum switch_power_state {
>   * may contain multiple heads.
>   */
>  struct drm_device {
> +#ifdef CONFIG_DRM_LEGACY
>  	/**
>  	 * @legacy_dev_list:
>  	 *
>  	 * List of devices per driver for stealth attach cleanup
>  	 */
>  	struct list_head legacy_dev_list;
> +#endif

We have a CONFIG_DRM_LEGACY dungeon already at the end of this struct, can
you pls move it there? Also drop the kerneldoc comment, we want to hide
this for good :-)

With that tiny bikeshed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	/** @if_version: Highest interface version set */
>  	int if_version;
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 97109df5beac..7dcf3b7bb5e6 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -601,8 +601,6 @@ struct drm_driver {
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */
>  
> -	/* List of devices hanging off this driver with stealth attach. */
> -	struct list_head legacy_dev_list;
>  	int (*firstopen) (struct drm_device *);
>  	void (*preclose) (struct drm_device *, struct drm_file *file_priv);
>  	int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
