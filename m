Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5916D91D3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5FB10EB2E;
	Thu,  6 Apr 2023 08:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E81A10EB2E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:40:06 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-502208f7cb3so102632a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680770403;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y3SR5g993gE0jwFV3/gL39Q2ly/8K2VYBDk+BWXiReo=;
 b=RjT3vLh/mu8GkN42AX8zB3gIqJQQrLwQAyir2BLesfuByZEVg4BP/e5a3av/U1X0Gw
 BDtlML7HzLAuIsHRTg+Y3ya4Uv/brH35xC47HqL/2pwmXwNIzTA70gTsL9ks6NFAko9l
 EqO7oQMqP59SV93LbsymwsGkOOEcoM8j7INrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680770403;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3SR5g993gE0jwFV3/gL39Q2ly/8K2VYBDk+BWXiReo=;
 b=Sus6SpyyrGbjVywd3a25TZ6JlM+EKqekz2yDacV+uX0KfyVeT6LFK1SWd1FGT2frlJ
 QirOZJmAI/KlU61sCqL+NfsoSvFLqDqs4Hq1a+nGnOilSDM0/07Wi5rZalpSlXZoT29i
 nyGbXl2qUnEZ0N125v++L3h36kw7dvnpn08W3DGRK77rAb9q+jUx+DyM1+D5q6Ley3R/
 +L9Zsx24G9GXDQo1r6ovK2PE5obMEAAhwACXEHNry7NvJePJWsVRhiztFHEs4NqIptgc
 xuxiMlKrXoF1HlttESka9YbDTz5NR506mK6ao1DHXl+p1hCXt/2vAVxo98PP8q+KGOuM
 FmfQ==
X-Gm-Message-State: AAQBX9fdhPDz3Du92XKHll2gB1AcIMzi5zgBfk4ATSbthPNL4k6q0+lJ
 Uvgh8vWtO7j0P+qwKPZS1697OA==
X-Google-Smtp-Source: AKy350a9UAvh2U4QREiedEqkVswYHGlRUdD9HP2yQbBn9dNEpR331UtpqTm0AXBi9vj4TnRoCikEbw==
X-Received: by 2002:a05:6402:2811:b0:502:465:28e1 with SMTP id
 h17-20020a056402281100b00502046528e1mr5580318ede.0.1680770402822; 
 Thu, 06 Apr 2023 01:40:02 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 w17-20020a1709062f9100b009331450d04esm506262eji.178.2023.04.06.01.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:40:02 -0700 (PDT)
Date: Thu, 6 Apr 2023 10:40:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 9/9] video/aperture: Provide a VGA helper for gma500
 and internal use
Message-ID: <ZC6FYK6nbF2HOIAa@phenom.ffwll.local>
References: <20230406083240.14031-1-tzimmermann@suse.de>
 <20230406083240.14031-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406083240.14031-10-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 10:32:40AM +0200, Thomas Zimmermann wrote:
> The hardware for gma500 is different from the rest, as it uses stolen
> framebuffer memory that is not available via PCI BAR. The regular PCI
> removal helper cannot detect the framebuffer, while the non-PCI helper
> misses possible conflicting VGA devices (i.e., a framebuffer or text
> console).
> 
> Gma500 therefore calls both helpers to catch all cases. It's confusing
> as it implies that there's something about the PCI device that requires
> ownership management. The relationship between the PCI device and the
> VGA devices is non-obvious. At worst, readers might assume that calling
> two functions for clearing aperture ownership is a bug in the driver.
> 
> Hence, move the PCI removal helper's code for VGA functionality into
> a separate function and call this function from gma500. Documents the
> purpose of each call to aperture helpers. The change contains comments
> and example code form the discussion at [1].
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.kernel.org/project/dri-devel/patch/20230404201842.567344-1-daniel.vetter@ffwll.ch/ # 1

I'm still not clued in on why we need this, but I also don't think it's
terrible, so ...

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 48 ++++++++++++++++++--------
>  drivers/video/aperture.c         | 58 ++++++++++++++++++++++----------
>  include/linux/aperture.h         |  7 ++++
>  3 files changed, 81 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 4bb06a89e48d..f50a9a58a2db 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -7,6 +7,7 @@
>   *
>   **************************************************************************/
>  
> +#include <linux/aperture.h>
>  #include <linux/cpu.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
> @@ -19,7 +20,6 @@
>  #include <acpi/video.h>
>  
>  #include <drm/drm.h>
> -#include <drm/drm_aperture.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_ioctl.h>
> @@ -414,25 +414,45 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>  	return ret;
>  }
>  
> -static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +/*
> + * Hardware for gma500 is a hybrid device, which both acts as a PCI
> + * device (for legacy vga functionality) but also more like an
> + * integrated display on a SoC where the framebuffer simply
> + * resides in main memory and not in a special PCI bar (that
> + * internally redirects to a stolen range of main memory) like all
> + * other integrated PCI display devices have.
> + *
> + * To catch all cases we need to remove conflicting firmware devices
> + * for the stolen system memory and for the VGA functionality. As we
> + * currently cannot easily find the framebuffer's location in stolen
> + * memory, we remove all framebuffers here.
> + *
> + * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then
> + *       we might be able to read the framebuffer range from the
> + *       device.
> + */
> +static int gma_remove_conflicting_framebuffers(struct pci_dev *pdev,
> +					       const struct drm_driver *req_driver)
>  {
> -	struct drm_psb_private *dev_priv;
> -	struct drm_device *dev;
> +	resource_size_t base = 0;
> +	resource_size_t size = U32_MAX; /* 4 GiB HW limit */
> +	const char *name = req_driver->name;
>  	int ret;
>  
> -	/*
> -	 * We cannot yet easily find the framebuffer's location in memory. So
> -	 * remove all framebuffers here. Note that we still want the pci special
> -	 * handling to kick out vgacon.
> -	 *
> -	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
> -	 *       might be able to read the framebuffer range from the device.
> -	 */
> -	ret = drm_aperture_remove_framebuffers(&driver);
> +	ret = aperture_remove_conflicting_devices(base, size, name);
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
> +	return __aperture_remove_legacy_vga_devices(pdev);
> +}
> +
> +static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +{
> +	struct drm_psb_private *dev_priv;
> +	struct drm_device *dev;
> +	int ret;
> +
> +	ret = gma_remove_conflicting_framebuffers(pdev, &driver);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> index e4091688b5eb..2824345e87ef 100644
> --- a/drivers/video/aperture.c
> +++ b/drivers/video/aperture.c
> @@ -301,6 +301,37 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
>  }
>  EXPORT_SYMBOL(aperture_remove_conflicting_devices);
>  
> +/**
> + * __aperture_remove_legacy_vga_devices - remove legacy VGA devices of a PCI devices
> + * @pdev: PCI device
> + *
> + * This function removes VGA devices provided by @pdev, such as a VGA
> + * framebuffer or a console. This is useful if you have a VGA-compatible
> + * PCI graphics device with framebuffers in non-BAR locations. Drivers
> + * should acquire ownership of those memory areas and afterwards call
> + * this helper to release remaining VGA devices.
> + *
> + * If your hardware has its framebuffers accessible via PCI BARS, use
> + * aperture_remove_conflicting_pci_devices() instead. The function will
> + * release any VGA devices automatically.
> + *
> + * WARNING: Apparently we must remove graphics drivers before calling
> + *          this helper. Otherwise the vga fbdev driver falls over if
> + *          we have vgacon configured.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise
> + */
> +int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
> +{
> +	/* VGA framebuffer */
> +	aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
> +
> +	/* VGA textmode console */
> +	return vga_remove_vgacon(pdev);
> +}
> +EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
> +
>  /**
>   * aperture_remove_conflicting_pci_devices - remove existing framebuffers for PCI devices
>   * @pdev: PCI device
> @@ -317,7 +348,7 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
>  {
>  	bool primary = false;
>  	resource_size_t base, size;
> -	int bar, ret;
> +	int bar, ret = 0;
>  
>  	if (pdev == vga_default_device())
>  		primary = true;
> @@ -334,24 +365,15 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
>  		aperture_detach_devices(base, size);
>  	}
>  
> -	if (primary) {
> -		/*
> -		 * If this is the primary adapter, there could be a VGA device
> -		 * that consumes the VGA framebuffer I/O range. Remove this
> -		 * device as well.
> -		 */
> -		aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
> -
> -		/*
> -		 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> -		 * otherwise the vga fbdev driver falls over.
> -		 */
> -		ret = vga_remove_vgacon(pdev);
> -		if (ret)
> -			return ret;
> -	}
> +	/*
> +	 * If this is the primary adapter, there could be a VGA device
> +	 * that consumes the VGA framebuffer I/O range. Remove this
> +	 * device as well.
> +	 */
> +	if (primary)
> +		ret = __aperture_remove_legacy_vga_devices(pdev);
>  
> -	return 0;
> +	return ret;
>  
>  }
>  EXPORT_SYMBOL(aperture_remove_conflicting_pci_devices);
> diff --git a/include/linux/aperture.h b/include/linux/aperture.h
> index 7248727753be..1a9a88b11584 100644
> --- a/include/linux/aperture.h
> +++ b/include/linux/aperture.h
> @@ -16,6 +16,8 @@ int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
>  int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
>  					const char *name);
>  
> +int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev);
> +
>  int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
>  #else
>  static inline int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
> @@ -31,6 +33,11 @@ static inline int aperture_remove_conflicting_devices(resource_size_t base, reso
>  	return 0;
>  }
>  
> +static inline int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
> +{
> +	return 0;
> +}
> +
>  static inline int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
>  {
>  	return 0;
> -- 
> 2.40.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
