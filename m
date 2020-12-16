Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092122DC224
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF6A6E1B4;
	Wed, 16 Dec 2020 14:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3DC6E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:28:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m5so23347656wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t6r3XSw+JXI5RBju6TAle9tyJcRBeqKGVIPpFlRGQNM=;
 b=f+85OyTITMh8m+uV0Iz79lyYBSUSw0eTyd4KYLKqnUhau27wSDxy1MQYm4a0nd3YOm
 SBhtfOY//L2DcVpRF+Plxf04ntuDuHfLm+YyOc6sGFVS8T0dMT0uyzevHwveeOnvZtwM
 JTgmIXX+7/P8Ormm7TOyAc1LnpuRfodaPcpqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t6r3XSw+JXI5RBju6TAle9tyJcRBeqKGVIPpFlRGQNM=;
 b=t0y1rSaOyfZp4LCFwjb0LQIKLRsSxMrKOGQYj2fEMJmrKywWoqYkb96o/EVS5/P6F7
 RGgGmdNcO7xhTAiE8zt5O3GKaAJmLHjBHgEUcTWLIYwZSvkvTLost7Vd6zoYPjilreQq
 OpSQN40o3aAYSZeMpAFaR7T22W37bI5+9OhFT/uadA25ZxJA0wTJGin8TLPsdd8Fw74k
 osGgngcAYBOtEfrCAJuMWeiwNphi9N0G3xE4rXrTRMH6frp+ciZPLHc3yuk03oeCioY6
 TQ2rce5Ki2UdVUWy3YDyBE+KFlZR2wcNmkxIzyUHT33bg6TfwXeSqFdPCVJWjDCyzQTE
 HxBA==
X-Gm-Message-State: AOAM533CshR2JKR+4T90s/CPHXGt4voasJzLuhUwac3XpvoFtixkd4gx
 rzd8+IWMirQ1gEcDrtvWQENIsA==
X-Google-Smtp-Source: ABdhPJxSqop80t0YY9RhdyhniVMy9B8aAdudgSDXAzc7GqtTX66vqyikS13BlQ5TaJtpluh6bzasnQ==
X-Received: by 2002:a5d:4fcf:: with SMTP id h15mr29743073wrw.323.1608128892956; 
 Wed, 16 Dec 2020 06:28:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o83sm2932403wme.21.2020.12.16.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:28:12 -0800 (PST)
Date: Wed, 16 Dec 2020 15:28:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] drm: Move legacy device list out of drm_driver
Message-ID: <X9oZehBv7WUetmfe@phenom.ffwll.local>
References: <20201215203126.10175-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201215203126.10175-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215203126.10175-2-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Edmund Dea <edmund.j.dea@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 10:31:24PM +0200, Laurent Pinchart wrote:
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
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Hah, I didn't notice my review here, read it again, still looks good :-)
-Daniel

> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> Changes since v1:
> 
> - Move the legacy_dev_list to the end of struct drm_device, in the
>   existing DRM_LEGACY section
> - Drop the kerneldoc comment for legacy_dev_list
> ---
>  drivers/gpu/drm/drm_pci.c | 25 +++++++++++++++++--------
>  include/drm/drm_device.h  | 10 +++-------
>  include/drm/drm_drv.h     |  2 --
>  3 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 6dba4b8ce4fe..dfb138aaccba 100644
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
> @@ -36,6 +38,9 @@
>  #include "drm_legacy.h"
>  
>  #ifdef CONFIG_DRM_LEGACY
> +/* List of devices hanging off drivers with stealth attach. */
> +static LIST_HEAD(legacy_dev_list);
> +static DEFINE_MUTEX(legacy_dev_list_lock);
>  
>  /**
>   * drm_pci_alloc - Allocate a PCI consistent memory block, for DMA.
> @@ -225,10 +230,11 @@ static int drm_get_pci_dev(struct pci_dev *pdev,
>  	if (ret)
>  		goto err_agp;
>  
> -	/* No locking needed since shadow-attach is single-threaded since it may
> -	 * only be called from the per-driver module init hook. */
> -	if (drm_core_check_feature(dev, DRIVER_LEGACY))
> -		list_add_tail(&dev->legacy_dev_list, &driver->legacy_dev_list);
> +	if (drm_core_check_feature(dev, DRIVER_LEGACY)) {
> +		mutex_lock(&legacy_dev_list_lock);
> +		list_add_tail(&dev->legacy_dev_list, &legacy_dev_list);
> +		mutex_unlock(&legacy_dev_list_lock);
> +	}
>  
>  	return 0;
>  
> @@ -261,7 +267,6 @@ int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
>  		return -EINVAL;
>  
>  	/* If not using KMS, fall back to stealth mode manual scanning. */
> -	INIT_LIST_HEAD(&driver->legacy_dev_list);
>  	for (i = 0; pdriver->id_table[i].vendor != 0; i++) {
>  		pid = &pdriver->id_table[i];
>  
> @@ -304,11 +309,15 @@ void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
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
> +			}
>  		}
> +		mutex_unlock(&legacy_dev_list_lock);
>  	}
>  	DRM_INFO("Module unloaded\n");
>  }
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 283a93ce4617..bd5abe7cd48f 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -51,13 +51,6 @@ enum switch_power_state {
>   * may contain multiple heads.
>   */
>  struct drm_device {
> -	/**
> -	 * @legacy_dev_list:
> -	 *
> -	 * List of devices per driver for stealth attach cleanup
> -	 */
> -	struct list_head legacy_dev_list;
> -
>  	/** @if_version: Highest interface version set */
>  	int if_version;
>  
> @@ -336,6 +329,9 @@ struct drm_device {
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> +	/* List of devices per driver for stealth attach cleanup */
> +	struct list_head legacy_dev_list;
> +
>  	/* Context handle management - linked list of context handles */
>  	struct list_head ctxlist;
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 02787319246a..827838e0a97e 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -499,8 +499,6 @@ struct drm_driver {
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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
