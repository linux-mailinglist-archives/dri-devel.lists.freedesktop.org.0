Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C61F6CB8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 19:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E07F6E901;
	Thu, 11 Jun 2020 17:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FA46E901
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 17:24:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y20so5810205wmi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IaWR460YTecBL++GLEcSk2fwPss9ZVGpLusysBNAWiI=;
 b=Rd3T1h82junLczP400T99VUY1XC8yOskg9OhtIjn8ZSH3Yt/qpmZ1iq2gfpTV1NgGZ
 Py9yW/VZxrzC8C5wsJAhG27qNERU005R3k3AgQOxYB3m+0LfPSdl6N0qzYDyu7A/TrMr
 2XVhiYwamE97kr0rt07wyqkN4IORbvQ2PwfyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IaWR460YTecBL++GLEcSk2fwPss9ZVGpLusysBNAWiI=;
 b=Bh9lm3lTXUfdYaSdydXyQmnWExUj7TN5fVghQYOYcXuvSmojB5lrzuv4o55LbjzF5H
 Zsi9On7I7CV5qWGDrLaJ/WNlvgXA1PpOjNgESTqwxDagBHAPtPVY3RQCPL2T2s1XcFbj
 RiematVqFosOKiAKeLcPcX3FUvuTQvnITRvOq37i9Ie6jnHRD7yzBVISP+3awR+swB0D
 xb0J+h+tpIqujsyMet4gzgqjv2is2pwADG2NFz2YzdvwV75Rp8z//nVwq3ijr+tiqa5S
 fK2KdVsTysVWQoB1tgHP64cy0S002IOEBianNngyplK0hJjbFrQNJaZmJsskxviIQvTC
 JC6w==
X-Gm-Message-State: AOAM530tQICZ2yV0CHLY/lF7O9YzVwN2O6SCkZGgA+ZgiO34tw/D5V1A
 /n2jK72iGInH59xZksMjMmeGVg==
X-Google-Smtp-Source: ABdhPJwCsAGsRIsOURBXC2qfBk5D/qOI31BiirjxcrhWpi5rvtHhI8Hvp/BLk1xZMHrQaOpqXPKhXA==
X-Received: by 2002:a05:600c:21c2:: with SMTP id
 x2mr9259714wmj.33.1591896291275; 
 Thu, 11 Jun 2020 10:24:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm6018330wro.26.2020.06.11.10.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 10:24:50 -0700 (PDT)
Date: Thu, 11 Jun 2020 19:24:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] drm/ast: Remove unused code paths for AST 1180
Message-ID: <20200611172448.GE20149@phenom.ffwll.local>
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611082809.7838-2-tzimmermann@suse.de>
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
Cc: chen@aspeedtech.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 10:28:07AM +0200, Thomas Zimmermann wrote:
> The ast driver contains code paths for AST 1180 chips. The chip is not
> supported and the rsp code has never been tested. Simplify the driver by
> removing the AST 1180 code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ast/ast_drv.c  |  1 -
>  drivers/gpu/drm/ast/ast_drv.h  |  2 -
>  drivers/gpu/drm/ast/ast_main.c | 89 +++++++++++++++-------------------
>  drivers/gpu/drm/ast/ast_mode.c | 10 +---
>  drivers/gpu/drm/ast/ast_post.c | 10 ++--
>  5 files changed, 43 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index b7ba22dddcad9..83509106f3ba9 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -59,7 +59,6 @@ static struct drm_driver driver;
>  static const struct pci_device_id pciidlist[] = {
>  	AST_VGA_DEVICE(PCI_CHIP_AST2000, NULL),
>  	AST_VGA_DEVICE(PCI_CHIP_AST2100, NULL),
> -	/*	AST_VGA_DEVICE(PCI_CHIP_AST1180, NULL), - don't bind to 1180 for now */
>  	{0, 0, 0},
>  };
>  
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 656d591b154b3..09f2659e29118 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -52,7 +52,6 @@
>  
>  #define PCI_CHIP_AST2000 0x2000
>  #define PCI_CHIP_AST2100 0x2010
> -#define PCI_CHIP_AST1180 0x1180
>  
>  
>  enum ast_chip {
> @@ -64,7 +63,6 @@ enum ast_chip {
>  	AST2300,
>  	AST2400,
>  	AST2500,
> -	AST1180,
>  };
>  
>  enum ast_tx_chip {
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index e5398e3dabe70..f48a9f62368c0 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -142,50 +142,42 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>  	ast_detect_config_mode(dev, &scu_rev);
>  
>  	/* Identify chipset */
> -	if (dev->pdev->device == PCI_CHIP_AST1180) {
> -		ast->chip = AST1100;
> -		DRM_INFO("AST 1180 detected\n");
> -	} else {
> -		if (dev->pdev->revision >= 0x40) {
> -			ast->chip = AST2500;
> -			DRM_INFO("AST 2500 detected\n");
> -		} else if (dev->pdev->revision >= 0x30) {
> -			ast->chip = AST2400;
> -			DRM_INFO("AST 2400 detected\n");
> -		} else if (dev->pdev->revision >= 0x20) {
> -			ast->chip = AST2300;
> -			DRM_INFO("AST 2300 detected\n");
> -		} else if (dev->pdev->revision >= 0x10) {
> -			switch (scu_rev & 0x0300) {
> -			case 0x0200:
> -				ast->chip = AST1100;
> -				DRM_INFO("AST 1100 detected\n");
> -				break;
> -			case 0x0100:
> -				ast->chip = AST2200;
> -				DRM_INFO("AST 2200 detected\n");
> -				break;
> -			case 0x0000:
> -				ast->chip = AST2150;
> -				DRM_INFO("AST 2150 detected\n");
> -				break;
> -			default:
> -				ast->chip = AST2100;
> -				DRM_INFO("AST 2100 detected\n");
> -				break;
> -			}
> -			ast->vga2_clone = false;
> -		} else {
> -			ast->chip = AST2000;
> -			DRM_INFO("AST 2000 detected\n");
> +	if (dev->pdev->revision >= 0x40) {
> +		ast->chip = AST2500;
> +		DRM_INFO("AST 2500 detected\n");
> +	} else if (dev->pdev->revision >= 0x30) {
> +		ast->chip = AST2400;
> +		DRM_INFO("AST 2400 detected\n");
> +	} else if (dev->pdev->revision >= 0x20) {
> +		ast->chip = AST2300;
> +		DRM_INFO("AST 2300 detected\n");
> +	} else if (dev->pdev->revision >= 0x10) {
> +		switch (scu_rev & 0x0300) {
> +		case 0x0200:
> +			ast->chip = AST1100;
> +			DRM_INFO("AST 1100 detected\n");
> +			break;
> +		case 0x0100:
> +			ast->chip = AST2200;
> +			DRM_INFO("AST 2200 detected\n");
> +			break;
> +		case 0x0000:
> +			ast->chip = AST2150;
> +			DRM_INFO("AST 2150 detected\n");
> +			break;
> +		default:
> +			ast->chip = AST2100;
> +			DRM_INFO("AST 2100 detected\n");
> +			break;
>  		}
> +		ast->vga2_clone = false;
> +	} else {
> +		ast->chip = AST2000;
> +		DRM_INFO("AST 2000 detected\n");
>  	}
>  
>  	/* Check if we support wide screen */
>  	switch (ast->chip) {
> -	case AST1180:
> -		ast->support_wide_screen = true;
> -		break;
>  	case AST2000:
>  		ast->support_wide_screen = false;
>  		break;
> @@ -469,15 +461,13 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
>  	if (need_post)
>  		ast_post_gpu(dev);
>  
> -	if (ast->chip != AST1180) {
> -		ret = ast_get_dram_info(dev);
> -		if (ret)
> -			goto out_free;
> -		ast->vram_size = ast_get_vram_info(dev);
> -		DRM_INFO("dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
> -			 ast->mclk, ast->dram_type,
> -			 ast->dram_bus_width, ast->vram_size);
> -	}
> +	ret = ast_get_dram_info(dev);
> +	if (ret)
> +		goto out_free;
> +	ast->vram_size = ast_get_vram_info(dev);
> +	DRM_INFO("dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
> +		 ast->mclk, ast->dram_type,
> +		 ast->dram_bus_width, ast->vram_size);
>  
>  	ret = ast_mm_init(ast);
>  	if (ret)
> @@ -496,8 +486,7 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
>  	    ast->chip == AST2200 ||
>  	    ast->chip == AST2300 ||
>  	    ast->chip == AST2400 ||
> -	    ast->chip == AST2500 ||
> -	    ast->chip == AST1180) {
> +	    ast->chip == AST2500) {
>  		dev->mode_config.max_width = 1920;
>  		dev->mode_config.max_height = 2048;
>  	} else {
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 7d39b858c9f1f..be0e2250708fa 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -768,9 +768,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>  {
>  	struct ast_private *ast = crtc->dev->dev_private;
>  
> -	if (ast->chip == AST1180)
> -		return;
> -
>  	/* TODO: Maybe control display signal generation with
>  	 *       Sync Enable (bit CR17.7).
>  	 */
> @@ -797,11 +794,6 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>  	const struct drm_format_info *format;
>  	bool succ;
>  
> -	if (ast->chip == AST1180) {
> -		DRM_ERROR("AST 1180 modesetting not supported\n");
> -		return -EINVAL;
> -	}
> -
>  	if (!state->enable)
>  		return 0; /* no mode checks if CRTC is being disabled */
>  
> @@ -1043,7 +1035,7 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
>  
>  		if ((ast->chip == AST2100) || (ast->chip == AST2200) ||
>  		    (ast->chip == AST2300) || (ast->chip == AST2400) ||
> -		    (ast->chip == AST2500) || (ast->chip == AST1180)) {
> +		    (ast->chip == AST2500)) {
>  			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
>  				return MODE_OK;
>  
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 2d1b186197432..af0c8ebb009a1 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -58,13 +58,9 @@ bool ast_is_vga_enabled(struct drm_device *dev)
>  	struct ast_private *ast = dev->dev_private;
>  	u8 ch;
>  
> -	if (ast->chip == AST1180) {
> -		/* TODO 1180 */
> -	} else {
> -		ch = ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
> -		return !!(ch & 0x01);
> -	}
> -	return false;
> +	ch = ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
> +
> +	return !!(ch & 0x01);
>  }
>  
>  static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
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
