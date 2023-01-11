Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC0F666017
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1E810E788;
	Wed, 11 Jan 2023 16:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F6210E78A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 16:13:18 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bs20so15570642wrb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 08:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4tVJhfTIyc5vReDClUBt/3dxlqBgyDw2QgPOLyqwRik=;
 b=dm8f8aHPIRx8/z81cz0pRrz/dpAHCx/Fc2gCumiiWvPZuxK1BwHXajozBy5LrSTaYh
 mUDfFmGAvXgO4Ubc7gdANCnaiVe/DtmhcSzba0D4sYtd0gx5Wapw2bVETXCm00R6v0E3
 6UqIRm6MCJ3F5Ws9Lff/vMPQtGFtvFRqpNnAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tVJhfTIyc5vReDClUBt/3dxlqBgyDw2QgPOLyqwRik=;
 b=OPv2FAOYoCeCNcWQTC1fntsLNYsaUFcsEMxIuHEDd1HyN1CN27Q3FIsYMhruL5+mUJ
 LHhjh/jHPnu1+lS/1qYgjjGPNWVz4u/aCaW+K/0VzHyIgf1WeL2e5dA6yvmsjLNgTEFJ
 2nL3uxy+pTXmBHeLG6bcRaTsQWDT4cCptrZmiyHvyKnDLQfMGq8EPwZ+UEVMmWJv5CTT
 p+OiVEN9dEC2tWTkZIGlhk/rRjvarziZZmLEoA+49umGmZqUFgq/GcoCRrCFWpKQRAIM
 JhTL45FJ9Vok1cwXkFcFGzY9Ni8R1ocmYq8fPkHBv3iVVloRik70Oe6ahzOdaB3fZn1k
 fOkw==
X-Gm-Message-State: AFqh2kqm/f1/CIs+Oa32YLCwN4kTyh5h6XYqW6gxYUjxzZ+PR0oDnrmV
 AC09MbZ/2l3C7wIQOWD366z0lw==
X-Google-Smtp-Source: AMrXdXsmC/LDfukdzJFUPvV8ugsW7RGIg2kEd45SaKN/idR5EiDr8HSO8HP0TwhQ+uYITeQbVY6uZg==
X-Received: by 2002:a5d:4587:0:b0:27f:a81:b819 with SMTP id
 p7-20020a5d4587000000b0027f0a81b819mr41569885wrq.22.1673453596843; 
 Wed, 11 Jan 2023 08:13:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d488b000000b002bc7e5a1171sm7297802wrq.116.2023.01.11.08.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 08:13:15 -0800 (PST)
Date: Wed, 11 Jan 2023 17:13:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Set framebuffer for vga-switcheroo clients
Message-ID: <Y77gGZpCNXgXE5Ff@phenom.ffwll.local>
References: <20230111153813.16051-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111153813.16051-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 04:38:13PM +0100, Thomas Zimmermann wrote:
> Set the framebuffer info for drivers that support VGA switcheroo. Only
> affects the amdgpu driver, which uses VGA switcheroo and generic fbdev
> emulation. For other drivers, this does nothing.
> 
> Amdgpu's lastclose helper called vga_switcheroo_process_delayed_switch().
> But as amdgpu uses generic fbdev emulation, it's better to call the helper
> from drm_lastclose(), after the kernel client's screen has been restored.
> So all drivers and clients can benefit. Radeon and nouveau with modernized
> fbdev code are possible candidates.
> 
> There was an earlier patchset to do something similar. [1]
> 
> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/amd-gfx/20221020143603.563929-1-alexander.deucher@amd.com/ # 1

Indeed, vga_switcheroo_client_fb_set is a no-op if no client is registered
on that pdev.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

t-b/ack from amd would be still good I think (or maybe they'll pick this
one up so it goes through their CI).
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 12 ------------
>  drivers/gpu/drm/drm_fb_helper.c         |  8 ++++++++
>  drivers/gpu/drm/drm_file.c              |  3 +++
>  5 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 63c921c55fb9..7120b9b6e580 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1330,7 +1330,6 @@ extern const int amdgpu_max_kms_ioctl;
>  
>  int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
>  void amdgpu_driver_unload_kms(struct drm_device *dev);
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>  void amdgpu_driver_postclose_kms(struct drm_device *dev,
>  				 struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index ebc6e6cbe2ab..02d636f781a2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2784,7 +2784,6 @@ static const struct drm_driver amdgpu_kms_driver = {
>  	    DRIVER_SYNCOBJ_TIMELINE,
>  	.open = amdgpu_driver_open_kms,
>  	.postclose = amdgpu_driver_postclose_kms,
> -	.lastclose = amdgpu_driver_lastclose_kms,
>  	.ioctls = amdgpu_ioctls_kms,
>  	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>  	.dumb_create = amdgpu_mode_dumb_create,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 7aa7e52ca784..886739576d3d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1104,18 +1104,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>  /*
>   * Outdated mess for old drm with Xorg being in charge (void function now).
>   */
> -/**
> - * amdgpu_driver_lastclose_kms - drm callback for last close
> - *
> - * @dev: drm dev pointer
> - *
> - * Switch vga_switcheroo state after last close (all asics).
> - */
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> -{
> -	drm_fb_helper_lastclose(dev);
> -	vga_switcheroo_process_delayed_switch();
> -}
>  
>  /**
>   * amdgpu_driver_open_kms - drm callback for open
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 427631706128..5e445c61252d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -30,7 +30,9 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/console.h>
> +#include <linux/pci.h>
>  #include <linux/sysrq.h>
> +#include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_drv.h>
> @@ -1940,6 +1942,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  					 int preferred_bpp)
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
> +	struct drm_device *dev = fb_helper->dev;
>  	struct drm_fb_helper_surface_size sizes;
>  	int ret;
>  
> @@ -1961,6 +1964,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  		return ret;
>  
>  	strcpy(fb_helper->fb->comm, "[fbcon]");
> +
> +	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
> +	if (dev_is_pci(dev->dev))
> +		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index a51ff8cee049..314c309db9a3 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>  #include <linux/poll.h>
>  #include <linux/slab.h>
> +#include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_client.h>
>  #include <drm/drm_drv.h>
> @@ -460,6 +461,8 @@ void drm_lastclose(struct drm_device * dev)
>  		drm_legacy_dev_reinit(dev);
>  
>  	drm_client_dev_restore(dev);
> +
> +	vga_switcheroo_process_delayed_switch();
>  }
>  
>  /**
> -- 
> 2.39.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
