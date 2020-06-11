Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA421F6CDA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 19:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909F76E186;
	Thu, 11 Jun 2020 17:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48546E186
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 17:33:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h5so7042490wrc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 10:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fk2YZ/uOoYVKf9kHPxPlRDqxvftrcDBSBDDIX2x7/E4=;
 b=hcaGKyqU9wvRf7LSOxqX/OQbRmUqLp1QOV6ETLCz1jbBgc80TA8DN/a6Qzx+xuRVM0
 gZWDLtexoH3r26AQcYvNt93BhAjn9CDY/WAlpBv8YDX3GxDiQ6l3j3lT05bcSUStzFMH
 pYyRHjBfXqucb/qgEB1NRkAfsnMTASsCX5sfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fk2YZ/uOoYVKf9kHPxPlRDqxvftrcDBSBDDIX2x7/E4=;
 b=sBwTQgfwD+ZGmLsoWlxhBtJDqC0FqJ8eN6+YfIiwC/xLMOJT9V+dJU9FlVDTxL0zTW
 PvTI7sLWN2UeElGcKV36Z8yEOtS2JM6/Kp6fKWNFezc/+BdgqLEXmxTQIy9AJXY76VZs
 i43pJZRT5Nh5YmChia4hLRXS9g5kJwP7NwbTFStGAVVxWl7P4XDTnfxyHY41M5UvO73z
 RqSXvDQ9je4KVMaBhu5mK7weulx6Gm9bvAE2pur2/QVd+FcmYP4odnr+3MXhc+AZo6Um
 Tk7UIlaW1ug0VPwnXshA7rbEc8ovUYo5OeKRGtkVXIfIgKVhBBhtTaCVJBOOZD0tuVu4
 +oYQ==
X-Gm-Message-State: AOAM530i8hhYgqexB1Oc/SVFgdFeKlQ1zkByu0d95/WjfCl3yFqDcXsB
 8j782FTUDf+t++CiJ8WAq5tnI+J/HwY=
X-Google-Smtp-Source: ABdhPJzzrdutfzAsQwkfNUiaEhNxKNF7O6Yf+UU/EseJaxUollHlutEcnlxiVKTHmqgYLK1CRGvtlw==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr10425066wrq.259.1591896796336; 
 Thu, 11 Jun 2020 10:33:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b14sm4955780wmj.47.2020.06.11.10.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 10:33:15 -0700 (PDT)
Date: Thu, 11 Jun 2020 19:33:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/ast: Use per-device logging macros
Message-ID: <20200611173313.GG20149@phenom.ffwll.local>
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611082809.7838-4-tzimmermann@suse.de>
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

On Thu, Jun 11, 2020 at 10:28:09AM +0200, Thomas Zimmermann wrote:
> Converts the ast driver to drm_info() and drm_err(). No functional
> changes are made.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I didn't check whether it compiles, but looks all good to me.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> ---
>  drivers/gpu/drm/ast/ast_main.c | 34 +++++++++++++++++-----------------
>  drivers/gpu/drm/ast/ast_mode.c |  8 ++++----
>  drivers/gpu/drm/ast/ast_post.c |  2 +-
>  drivers/gpu/drm/ast/ast_ttm.c  |  2 +-
>  4 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index a2ef3d9077671..9063fdc9e8852 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -79,7 +79,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
>  					scu_rev)) {
>  		/* We do, disable P2A access */
>  		ast->config_mode = ast_use_dt;
> -		DRM_INFO("Using device-tree for configuration\n");
> +		drm_info(dev, "Using device-tree for configuration\n");
>  		return;
>  	}
>  
> @@ -101,7 +101,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
>  			/* P2A works, grab silicon revision */
>  			ast->config_mode = ast_use_p2a;
>  
> -			DRM_INFO("Using P2A bridge for configuration\n");
> +			drm_info(dev, "Using P2A bridge for configuration\n");
>  
>  			/* Read SCU7c (silicon revision register) */
>  			ast_write32(ast, 0xf004, 0x1e6e0000);
> @@ -112,7 +112,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
>  	}
>  
>  	/* We have a P2A bridge but it's disabled */
> -	DRM_INFO("P2A bridge disabled, using default configuration\n");
> +	drm_info(dev, "P2A bridge disabled, using default configuration\n");
>  }
>  
>  static int ast_detect_chip(struct drm_device *dev, bool *need_post)
> @@ -128,7 +128,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>  	 */
>  	if (!ast_is_vga_enabled(dev)) {
>  		ast_enable_vga(dev);
> -		DRM_INFO("VGA not enabled on entry, requesting chip POST\n");
> +		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
>  		*need_post = true;
>  	} else
>  		*need_post = false;
> @@ -144,36 +144,36 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>  	/* Identify chipset */
>  	if (dev->pdev->revision >= 0x40) {
>  		ast->chip = AST2500;
> -		DRM_INFO("AST 2500 detected\n");
> +		drm_info(dev, "AST 2500 detected\n");
>  	} else if (dev->pdev->revision >= 0x30) {
>  		ast->chip = AST2400;
> -		DRM_INFO("AST 2400 detected\n");
> +		drm_info(dev, "AST 2400 detected\n");
>  	} else if (dev->pdev->revision >= 0x20) {
>  		ast->chip = AST2300;
> -		DRM_INFO("AST 2300 detected\n");
> +		drm_info(dev, "AST 2300 detected\n");
>  	} else if (dev->pdev->revision >= 0x10) {
>  		switch (scu_rev & 0x0300) {
>  		case 0x0200:
>  			ast->chip = AST1100;
> -			DRM_INFO("AST 1100 detected\n");
> +			drm_info(dev, "AST 1100 detected\n");
>  			break;
>  		case 0x0100:
>  			ast->chip = AST2200;
> -			DRM_INFO("AST 2200 detected\n");
> +			drm_info(dev, "AST 2200 detected\n");
>  			break;
>  		case 0x0000:
>  			ast->chip = AST2150;
> -			DRM_INFO("AST 2150 detected\n");
> +			drm_info(dev, "AST 2150 detected\n");
>  			break;
>  		default:
>  			ast->chip = AST2100;
> -			DRM_INFO("AST 2100 detected\n");
> +			drm_info(dev, "AST 2100 detected\n");
>  			break;
>  		}
>  		ast->vga2_clone = false;
>  	} else {
>  		ast->chip = AST2000;
> -		DRM_INFO("AST 2000 detected\n");
> +		drm_info(dev, "AST 2000 detected\n");
>  	}
>  
>  	/* Check if we support wide screen */
> @@ -248,13 +248,13 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>  	/* Print stuff for diagnostic purposes */
>  	switch(ast->tx_chip_type) {
>  	case AST_TX_SIL164:
> -		DRM_INFO("Using Sil164 TMDS transmitter\n");
> +		drm_info(dev, "Using Sil164 TMDS transmitter\n");
>  		break;
>  	case AST_TX_DP501:
> -		DRM_INFO("Using DP501 DisplayPort transmitter\n");
> +		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
>  		break;
>  	default:
> -		DRM_INFO("Analog VGA only\n");
> +		drm_info(dev, "Analog VGA only\n");
>  	}
>  	return 0;
>  }
> @@ -443,7 +443,7 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
>  	 * and higher).
>  	 */
>  	if (!(pci_resource_flags(dev->pdev, 2) & IORESOURCE_IO)) {
> -		DRM_INFO("platform has no IO space, trying MMIO\n");
> +		drm_info(dev, "platform has no IO space, trying MMIO\n");
>  		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
>  	}
>  
> @@ -465,7 +465,7 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
>  	if (ret)
>  		goto out_free;
>  	ast->vram_size = ast_get_vram_info(dev);
> -	DRM_INFO("dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
> +	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
>  		 ast->mclk, ast->dram_type,
>  		 ast->dram_bus_width, ast->vram_size);
>  
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 10211751182da..ff789f2db9fc8 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1104,7 +1104,7 @@ static int ast_connector_init(struct drm_device *dev)
>  	connector = &ast_connector->base;
>  	ast_connector->i2c = ast_i2c_create(dev);
>  	if (!ast_connector->i2c)
> -		DRM_ERROR("failed to add ddc bus for connector\n");
> +		drm_err(dev, "failed to add ddc bus for connector\n");
>  
>  	drm_connector_init_with_ddc(dev, connector,
>  				    &ast_connector_funcs,
> @@ -1188,7 +1188,7 @@ int ast_mode_init(struct drm_device *dev)
>  				       ARRAY_SIZE(ast_primary_plane_formats),
>  				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>  	if (ret) {
> -		DRM_ERROR("ast: drm_universal_plane_init() failed: %d\n", ret);
> +		drm_err(dev, "ast: drm_universal_plane_init() failed: %d\n", ret);
>  		return ret;
>  	}
>  	drm_plane_helper_add(&ast->primary_plane,
> @@ -1200,7 +1200,7 @@ int ast_mode_init(struct drm_device *dev)
>  				       ARRAY_SIZE(ast_cursor_plane_formats),
>  				       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
>  	if (ret) {
> -		DRM_ERROR("drm_universal_plane_failed(): %d\n", ret);
> +		drm_err(dev, "drm_universal_plane_failed(): %d\n", ret);
>  		return ret;
>  	}
>  	drm_plane_helper_add(&ast->cursor_plane,
> @@ -1322,7 +1322,7 @@ static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
>  	i2c->bit.getscl = get_clock;
>  	ret = i2c_bit_add_bus(&i2c->adapter);
>  	if (ret) {
> -		DRM_ERROR("Failed to register bit i2c\n");
> +		drm_err(dev, "Failed to register bit i2c\n");
>  		goto out_free;
>  	}
>  
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 226e1290227ad..c043fe7175530 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2067,7 +2067,7 @@ void ast_post_chip_2500(struct drm_device *dev)
>  		}
>  
>  		if (!ast_dram_init_2500(ast))
> -			DRM_ERROR("DRAM init failed !\n");
> +			drm_err(dev, "DRAM init failed !\n");
>  
>  		temp = ast_mindwm(ast, 0x1e6e2040);
>  		ast_moutdwm(ast, 0x1e6e2040, temp | 0x40);
> diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_ttm.c
> index fad34106083a8..9c3788a4c1c54 100644
> --- a/drivers/gpu/drm/ast/ast_ttm.c
> +++ b/drivers/gpu/drm/ast/ast_ttm.c
> @@ -44,7 +44,7 @@ int ast_mm_init(struct ast_private *ast)
>  		ast->vram_size);
>  	if (IS_ERR(vmm)) {
>  		ret = PTR_ERR(vmm);
> -		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
> +		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
>  		return ret;
>  	}
>  
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
