Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69133150390
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 10:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21056EB87;
	Mon,  3 Feb 2020 09:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D406EB87
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 09:49:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so17076357wrw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 01:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V3gYFkiv45c0tBCl+oDsF5a8UYscoPr+dpqprsPBB7g=;
 b=j9sOd9tqj97FsExzItHKkPS6GuM14qnc7aR2MKuvKKWMLIQALHCxf8++a22IRKPXnh
 cmverEFauYd+Qv6mD6195A5NLFXS/65eV9htyo4k2VhzoVZUgVufOAxzBB+U9qF1RHuj
 9+H2jTUfdhAZmmFeSgNedZVcm6Tf1EfwCPOPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V3gYFkiv45c0tBCl+oDsF5a8UYscoPr+dpqprsPBB7g=;
 b=HOos0XmtCkjgbCv6hKSRLH9TrIytjOC4t1ER9MGT6PTIQxCD6YJePtYEvekyyJ4oGK
 UBNLpvFudoZcbHSP08ihYILWUFXNgtKa7hwvM325GALDrS4YpZjcYA4g/+JmntnQ6J4F
 cvLejR/EPc56hTBmR6FjLp8fey3e2NUAfL2HguGaTMCuwJGHkRu9afIpi0M2SvcamWyA
 m8df3LsRdiN+nnYxUY6JGkTKLGdvBGoiWCh8VwYNMF01T9ZWN/mQTQrYVjtwt8GouCub
 FXEIZdC3VGjWKShwSKMcnprd/1CPCbdQybgUSHVjqu1csiHCFtR2/AB2Uufbflh9zQEu
 8+sg==
X-Gm-Message-State: APjAAAXsNDXjwT1sYPjYC+e/ln+TEiMOYf81J6MCGL3uljz92ZY/YIQ8
 AVP4XnRTolLb1paCcliwBXu5BQ==
X-Google-Smtp-Source: APXvYqy/ihJgyLqixjN1orpXcAOeVQYGu+i1F1ZoKkNsZlo8iT/FUuBegA8uRRh3LHvW2nzBYGqNng==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr14204606wrt.70.1580723373665; 
 Mon, 03 Feb 2020 01:49:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm25180499wrn.34.2020.02.03.01.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 01:49:32 -0800 (PST)
Date: Mon, 3 Feb 2020 10:49:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm/vram: Add helpers to validate a display mode's
 memory requirements
Message-ID: <20200203094930.GS43062@phenom.ffwll.local>
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200201122744.27165-2-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 01, 2020 at 01:27:41PM +0100, Thomas Zimmermann wrote:
> Devices with low amount of dedicated video memory may not be able
> to use all possible display modes, as the framebuffers may not fit
> into VRAM. The new helper function drm_vram_helper_mode_valid()
> implements a simple test to sort out all display modes that can
> not be used in any case. Drivers should call this function from
> struct drm_mode_config_funcs.mode_valid.
> 
> Calling drm_vram_helper_mode_valid() works best for 32-bit framebuffers;
> drivers with framebuffers of different color depth can use
> drm_vram_helper_mode_valid_internal() instead.
> 
> The functionality was originally implemented by the ast driver, which
> is being converted as well.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_main.c        | 24 +--------
>  drivers/gpu/drm/drm_gem_vram_helper.c | 76 +++++++++++++++++++++++++++
>  include/drm/drm_gem_vram_helper.h     | 14 +++++
>  3 files changed, 91 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index b79f484e9bd2..18a0a4ce00f6 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -388,31 +388,9 @@ static int ast_get_dram_info(struct drm_device *dev)
>  	return 0;
>  }
>  
> -enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
> -						const struct drm_display_mode *mode)
> -{
> -	static const unsigned long max_bpp = 4; /* DRM_FORMAT_XRGBA8888 */
> -
> -	struct ast_private *ast = dev->dev_private;
> -	unsigned long fbsize, fbpages, max_fbpages;
> -
> -	/* To support double buffering, a framebuffer may not
> -	 * consume more than half of the available VRAM.
> -	 */
> -	max_fbpages = (ast->vram_size / 2) >> PAGE_SHIFT;
> -
> -	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
> -	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
> -
> -	if (fbpages > max_fbpages)
> -		return MODE_MEM;
> -
> -	return MODE_OK;
> -}
> -
>  static const struct drm_mode_config_funcs ast_mode_funcs = {
>  	.fb_create = drm_gem_fb_create,
> -	.mode_valid = ast_mode_config_mode_valid,
> +	.mode_valid = drm_vram_helper_mode_valid,
>  	.atomic_check = drm_atomic_helper_check,
>  	.atomic_commit = drm_atomic_helper_commit,
>  };
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index a4863326061a..89aebd500655 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1141,3 +1141,79 @@ void drm_vram_helper_release_mm(struct drm_device *dev)
>  	dev->vram_mm = NULL;
>  }
>  EXPORT_SYMBOL(drm_vram_helper_release_mm);
> +
> +/*
> + * Mode-config helpers
> + */
> +
> +/**
> + * drm_vram_helper_mode_valid_internal - Tests if a display mode's
> + *	framebuffer fits into the available video memory.
> + * @dev:	the DRM device
> + * @mode:	the mode to test
> + * @max_bpp:	the maximum number of bytes per pixel

Does this render correctly? I thought an empty comment line is required
between comments and the free-form paragraphs ... Also usual style (in drm
at least) is that the Returns: block is more towards the end of the text,
and not indented.


> + * Returns:
> + *	MODE_OK the display mode is supported, or an error code of type
> + *	enum drm_mode_status otherwise.
> + *
> + * This function tests if enough video memory is available using the
> + * specified display mode. Atomic modesetting requires importing the
> + * designated framebuffer into video memory before evicting the active
> + * one. Hence, any framebuffer may consume at most half of the available
> + * VRAM. Display modes that require a larger framebuffer can not be used,
> + * even of the CRTC does support them.
> + *
> + * Drivers should call this function from
> + * struct drm_mode_config_funcs.mode_valid. See drm_vram_helper_mode_valid()
> + * for framebuffers that use at most 32-bit color depth.
> + *
> + * Note:
> + *	The function can only test if the display mode is supported in
> + *	general. If you have too many framebuffers pinned to video memory,
> + *	a display mode may still not be usable in practice.
> + */
> +enum drm_mode_status
> +drm_vram_helper_mode_valid_internal(struct drm_device *dev,
> +				    const struct drm_display_mode *mode,
> +				    unsigned long max_bpp)
> +{
> +	struct drm_vram_mm *vmm = dev->vram_mm;
> +	unsigned long fbsize, fbpages, max_fbpages;
> +
> +	if (!dev->vram_mm)

This is a driver bug imo (most likely of enabling hotplug/output detection
before the vram handling is set up), needs to be wrapped in a WARN_ON to
catch this.

> +		return MODE_BAD;
> +
> +	max_fbpages = (vmm->vram_size / 2) >> PAGE_SHIFT;
> +
> +	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
> +	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
> +
> +	if (fbpages > max_fbpages)
> +		return MODE_MEM;
> +
> +	return MODE_OK;
> +}
> +EXPORT_SYMBOL(drm_vram_helper_mode_valid_internal);

Anyway, patch looks good (with the nits addressed one way or the other):

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +
> +/**
> + * drm_vram_helper_mode_valid - Tests if a display mode's
> + *	framebuffer fits into the available video memory.
> + * @dev:	the DRM device
> + * @mode:	the mode to test
> + * Returns:
> + *	MODE_OK the display mode is supported, or an error code of type
> + *	enum drm_mode_status otherwise.
> + *
> + * This function is a variant of drm_vram_helper_mode_valid_internal()
> + * for framebuffers that use at most 32-bit color depth. It can be plugged
> + * directly into struct drm_mode_config_funcs.mode_valid.
> + */
> +enum drm_mode_status
> +drm_vram_helper_mode_valid(struct drm_device *dev,
> +			   const struct drm_display_mode *mode)
> +{
> +	static const unsigned long max_bpp = 4; /* DRM_FORMAT_XRGBA8888 */
> +
> +	return drm_vram_helper_mode_valid_internal(dev, mode, max_bpp);
> +}
> +EXPORT_SYMBOL(drm_vram_helper_mode_valid);
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index 573e9fd109bf..e7d9144c79ad 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -6,6 +6,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_modes.h>
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -205,4 +206,17 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
>  	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
>  void drm_vram_helper_release_mm(struct drm_device *dev);
>  
> +/*
> + * Mode-config helpers
> + */
> +
> +enum drm_mode_status
> +drm_vram_helper_mode_valid_internal(struct drm_device *dev,
> +				    const struct drm_display_mode *mode,
> +				    unsigned long max_bpp);
> +
> +enum drm_mode_status
> +drm_vram_helper_mode_valid(struct drm_device *dev,
> +			   const struct drm_display_mode *mode);
> +
>  #endif
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
