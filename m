Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4120CD90
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 11:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF68189CA2;
	Mon, 29 Jun 2020 09:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D192289CA2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 09:27:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k6so15809723wrn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LSyMQLHXALePh+IULE3EEcaYo04mNclyOCFduokjzuE=;
 b=Mu4r0vmX2KDx3qWxWmRpIpO6b03IwowLtqbL3Br5GO22a4gBYO6od3AiA7prlBwO8O
 kWLYD2DOh94u17OSJh6He+SJ+jCAeAmWjQ/mRyeeKRJd7Rv2jH849nbiYdOMCeglmPNu
 hklsm11TyOxiK+IcNVrcIW7nMApx7Nx24yANM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LSyMQLHXALePh+IULE3EEcaYo04mNclyOCFduokjzuE=;
 b=nDRthrxRN5uaU2e2ps8q+iLI4e7VMIVQz7or4+FH/GjcNnVSCRP2KcNHrV0Bk+nclF
 LhvS37SsjOzmIy1JuBCfrN5nGHe8D2h9dHA8sHcUcPW4TFvb204StTiU0tuwtnYFGsay
 KeozTo0kRIb9jIoTHdTsZm9vVAffSyU9jZFZIKjfGcmWL0+AeulhY7I4GYaaMWzKflO5
 sYt5PeNSPzZQkvCSiz71O64PV1rU/UzY1j4pOKpIUpORe24cb75PPa4CZ3JIU/i7HFKz
 9zU/YzCK8wREjEoDDiwB3CHI2s79DQn/Zq9uQngHuBT5lzMp24feMVzrTuodVAuNjFR8
 kxKw==
X-Gm-Message-State: AOAM5304m3XrhFT3bdcgJgrQJLaExhVk++7Cr2lUCq3xv0ai9wlX4C99
 r1yLhZh20rRHmi/lnSKvVJ4Ujw==
X-Google-Smtp-Source: ABdhPJyyW25EIt1EPxmQG+IoDubFyDo8S+A3heMR+m7g0FWI/ag1lfMEOt+J5qaGf3r+X3+02Ytz3w==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr16286111wro.154.1593422864449; 
 Mon, 29 Jun 2020 02:27:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f16sm28358909wmh.27.2020.06.29.02.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:27:43 -0700 (PDT)
Date: Mon, 29 Jun 2020 11:27:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/9] drm: Add infrastructure for platform devices
Message-ID: <20200629092741.GR3278063@phenom.ffwll.local>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625120011.16168-9-tzimmermann@suse.de>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 02:00:10PM +0200, Thomas Zimmermann wrote:
> Platform devices might operate on firmware framebuffers, such as VESA or
> EFI. Before a native driver for the graphics hardware can take over the
> device, it has to remove any platform driver that operates on the firmware
> framebuffer. Platform helpers provide the infrastructure for platform
> drivers to acquire firmware framebuffers, and for native drivers to remove
> them lateron.
> 
> It works similar to the related fbdev mechanism. During initialization, the
> platform driver acquires the firmware framebuffer's I/O memory and provides
> a callback to be removed. The native driver later uses this inforamtion to
> remove any platform driver for it's framebuffer I/O memory.
> 
> The platform helper's removal code is integrated into the existing code for
> removing conflicting fraembuffers, so native drivers use it automatically.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I have some ideas for how to do this a notch cleaner in the next patch.
Maybe best to discuss the actual implmenentation stuff there.

Aside from that usual nits:
- kerneldoc for these please, pulled into drm-kms.rst.
- naming isn't super ocd with drm_platform.c but that prefix not used, but
  I also don't have better ideas.
- I think the functions from drm_fb_helper.h for removing other
  framebuffers should be moved here, and function name prefix adjusted
  acoordingly

I'm wondering about the locking and deadlock potential here, is lockdep
all happy with this?

Cheers, Daniel

> ---
>  drivers/gpu/drm/Kconfig        |   6 ++
>  drivers/gpu/drm/Makefile       |   1 +
>  drivers/gpu/drm/drm_platform.c | 118 +++++++++++++++++++++++++++++++++
>  include/drm/drm_fb_helper.h    |  18 ++++-
>  include/drm/drm_platform.h     |  42 ++++++++++++
>  5 files changed, 184 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/drm_platform.c
>  create mode 100644 include/drm/drm_platform.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index c4fd57d8b717..e9d6892f9d38 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -229,6 +229,12 @@ config DRM_SCHED
>  	tristate
>  	depends on DRM
>  
> +config DRM_PLATFORM_HELPER
> +	bool
> +	depends on DRM
> +	help
> +	  Helpers for DRM platform devices
> +
>  source "drivers/gpu/drm/i2c/Kconfig"
>  
>  source "drivers/gpu/drm/arm/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 2c0e5a7e5953..8ceb21d0770a 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -32,6 +32,7 @@ drm-$(CONFIG_AGP) += drm_agpsupport.o
>  drm-$(CONFIG_PCI) += drm_pci.o
>  drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
> +drm-$(CONFIG_DRM_PLATFORM_HELPER) += drm_platform.o
>  
>  drm_vram_helper-y := drm_gem_vram_helper.o
>  obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
> diff --git a/drivers/gpu/drm/drm_platform.c b/drivers/gpu/drm/drm_platform.c
> new file mode 100644
> index 000000000000..09a2f2a31aa5
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_platform.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_platform.h>
> +
> +static LIST_HEAD(drm_apertures);
> +
> +static DEFINE_MUTEX(drm_apertures_lock);
> +
> +static bool overlap(resource_size_t base1, resource_size_t end1,
> +		    resource_size_t base2, resource_size_t end2)
> +{
> +	return (base1 < end2) && (end1 > base2);
> +}
> +
> +static struct drm_aperture *
> +drm_aperture_acquire(struct drm_device *dev,
> +		     resource_size_t base, resource_size_t size,
> +		     const struct drm_aperture_funcs *funcs)
> +{
> +	size_t end = base + size;
> +	struct list_head *pos;
> +	struct drm_aperture *ap;
> +
> +	mutex_lock(&drm_apertures_lock);
> +
> +	list_for_each(pos, &drm_apertures) {
> +		ap = container_of(pos, struct drm_aperture, lh);
> +		if (overlap(base, end, ap->base, ap->base + ap->size))
> +			return ERR_PTR(-EBUSY);
> +	}
> +
> +	ap = drmm_kzalloc(dev, sizeof(*ap), GFP_KERNEL);
> +	if (!ap)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ap->dev = dev;
> +	ap->base = base;
> +	ap->size = size;
> +	ap->funcs = funcs;
> +	INIT_LIST_HEAD(&ap->lh);
> +
> +	list_add(&ap->lh, &drm_apertures);
> +
> +	mutex_unlock(&drm_apertures_lock);
> +
> +	return ap;
> +}
> +
> +static void drm_aperture_release(struct drm_aperture *ap)
> +{
> +	bool kicked_out = ap->kicked_out;
> +
> +	if (!kicked_out)
> +		mutex_lock(&drm_apertures_lock);
> +
> +	list_del(&ap->lh);
> +	if (ap->funcs->release)
> +		ap->funcs->release(ap);
> +
> +	if (!kicked_out)
> +		mutex_unlock(&drm_apertures_lock);
> +}
> +
> +static void drm_aperture_acquire_release(struct drm_device *dev, void *ptr)
> +{
> +	struct drm_aperture *ap = ptr;
> +
> +	drm_aperture_release(ap);
> +}
> +
> +struct drm_aperture *
> +drmm_aperture_acquire(struct drm_device *dev,
> +		      resource_size_t base, resource_size_t size,
> +		      const struct drm_aperture_funcs *funcs)
> +{
> +	struct drm_aperture *ap;
> +	int ret;
> +
> +	ap = drm_aperture_acquire(dev, base, size, funcs);
> +	if (IS_ERR(ap))
> +		return ap;
> +	ret = drmm_add_action_or_reset(dev, drm_aperture_acquire_release, ap);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return ap;
> +}
> +EXPORT_SYMBOL(drmm_aperture_acquire);
> +
> +void drm_kickout_apertures_at(resource_size_t base, resource_size_t size)
> +{
> +	resource_size_t end = base + size;
> +	struct list_head *pos, *n;
> +
> +	mutex_lock(&drm_apertures_lock);
> +
> +	list_for_each_safe(pos, n, &drm_apertures) {
> +		struct drm_aperture *ap =
> +			container_of(pos, struct drm_aperture, lh);
> +
> +		if (!overlap(base, end, ap->base, ap->base + ap->size))
> +			continue;
> +
> +		ap->kicked_out = true;
> +		if (ap->funcs->kickout)
> +			ap->funcs->kickout(ap);
> +		else
> +			drm_dev_put(ap->dev);
> +	}
> +
> +	mutex_unlock(&drm_apertures_lock);
> +}
> +EXPORT_SYMBOL(drm_kickout_apertures_at);
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 306aa3a60be9..a919b78b1961 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -35,7 +35,9 @@ struct drm_fb_helper;
>  #include <drm/drm_client.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_platform.h>
>  #include <linux/kgdb.h>
> +#include <linux/pci.h>
>  #include <linux/vgaarb.h>
>  
>  enum mode_set_atomic {
> @@ -465,6 +467,11 @@ static inline int
>  drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
>  					      const char *name, bool primary)
>  {
> +	int i;
> +
> +	for (i = 0; i < a->count; ++i)
> +		drm_kickout_apertures_at(a->ranges[i].base, a->ranges[i].size);
> +
>  #if IS_REACHABLE(CONFIG_FB)
>  	return remove_conflicting_framebuffers(a, name, primary);
>  #else
> @@ -487,7 +494,16 @@ static inline int
>  drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
>  						  const char *name)
>  {
> -	int ret = 0;
> +	resource_size_t base, size;
> +	int bar, ret = 0;
> +
> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> +			continue;
> +		base = pci_resource_start(pdev, bar);
> +		size = pci_resource_len(pdev, bar);
> +		drm_kickout_apertures_at(base, size);
> +	}
>  
>  	/*
>  	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> diff --git a/include/drm/drm_platform.h b/include/drm/drm_platform.h
> new file mode 100644
> index 000000000000..475e88ee1fbd
> --- /dev/null
> +++ b/include/drm/drm_platform.h
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +#ifndef _DRM_PLATFORM_H_
> +#define _DRM_PLATFORM_H_
> +
> +#include <linux/list.h>
> +#include <linux/types.h>
> +
> +struct drm_aperture;
> +struct drm_device;
> +
> +struct drm_aperture_funcs {
> +	void (*kickout)(struct drm_aperture *ap);
> +	void (*release)(struct drm_aperture *ap);
> +};
> +
> +struct drm_aperture {
> +	struct drm_device *dev;
> +	resource_size_t base;
> +	resource_size_t size;
> +
> +	const struct drm_aperture_funcs *funcs;
> +
> +	struct list_head lh;
> +	bool kicked_out;
> +};
> +
> +struct drm_aperture *
> +drmm_aperture_acquire(struct drm_device *dev,
> +		      resource_size_t base, resource_size_t size,
> +		      const struct drm_aperture_funcs *funcs);
> +
> +#if defined (CONFIG_DRM_PLATFORM_HELPER)
> +void drm_kickout_apertures_at(resource_size_t base, resource_size_t size);
> +#else
> +static inline void
> +drm_kickout_apertures_at(resource_size_t base, resource_size_t size)
> +{
> +}
> +#endif
> +
> +#endif
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
