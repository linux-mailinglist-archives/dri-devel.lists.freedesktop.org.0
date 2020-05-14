Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326C1D2FE8
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236F088052;
	Thu, 14 May 2020 12:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC9A6EB2F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:37:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 50so3821878wrc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w34+yydt15m63oHueozKI43M9FgZpWIQLSp+jJoneNc=;
 b=e9aC+t+1AWn+GBNk8udUi5A57evXgsw+F9q1iHmY3vlD3E8kA43XVDIYnG9V3xm68B
 FCFJ7rvjlbP4UB/TZsijLyVQ1kbajlm/kVuYa547rgf9p0/NvbE8RafbP7P9AZ+p5dPV
 tD334UKBTtHNlnIp6jO8wZRD3W/XOr9Vf2WzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w34+yydt15m63oHueozKI43M9FgZpWIQLSp+jJoneNc=;
 b=BoArusDcq7x2rmCqzqrh/4/ccwLPFQr+r3pw8EESG4Ju/YEzipOB9LjZ7gIVaIay0H
 X/TOKD97NX3MF98TRMuDkALv26AXv8XR2pT+mlP1cwPho8Ws+wICPRMfhTWzqWuKDPKL
 6N145zuiFPEML/KxaYBHOZ1S63d4NRsB35W/+6Cqn/JjgWwy4DbstaSSJ2rOu3KU2G1K
 y/2cFIsVlN5xpHGVU4fqvDTiWI4/8sP2g0NErb0v2m+wp+XeeIwqDy3hflTngnO2gnOG
 4Zy8xr+KXQ+V/I4gNUpaO7QLCfcnESDPf0Pifn8M57JosMxRMgm0G+DCKYVsN4I/AtM8
 XfJA==
X-Gm-Message-State: AOAM532pyeQEX6RG+mVl8Fkzz5uOvKHzooDBBwpiialiHCEmUdep96f5
 45rJ478XKoAvidWVPs9wZ2Ghcwhxo0U=
X-Google-Smtp-Source: ABdhPJwwuh/8AkuSZPZulxuTxYjN+CMuoQTY/ngPdRDVzsewOeGDG8SgR2dLnt8VxV2pX1mnW/MzQQ==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr5022866wrn.190.1589459860755; 
 Thu, 14 May 2020 05:37:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c19sm3973321wrb.89.2020.05.14.05.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:37:40 -0700 (PDT)
Date: Thu, 14 May 2020 14:37:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] fbdev: annotate rivafb/nvidiafb as obsolete
Message-ID: <20200514123738.GU206103@phenom.ffwll.local>
References: <20200513215342.2145495-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513215342.2145495-1-emil.l.velikov@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:53:42PM +0100, Emil Velikov wrote:
> Drivers have not seen any love for years.
> 
> Be that fixes or improvements, or cosmetics like introducing symbolic
> names, style and code-flow polish.
> 
> Seemingly the maintainer has also disappeared years ago :-\
> 
> Considering nouveau supports all that hardware (modulo nv03) just mark
> these as obsolete/broken, referring to nouveau in the help text.
> 
> Cc: Antonino Daplas <adaplas@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>

Makes sense

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  MAINTAINERS                           | 3 +--
>  arch/powerpc/configs/g5_defconfig     | 2 --
>  arch/powerpc/configs/pasemi_defconfig | 2 --
>  arch/powerpc/configs/pmac32_defconfig | 2 --
>  arch/powerpc/configs/ppc6xx_defconfig | 3 ---
>  drivers/video/fbdev/Kconfig           | 6 ++++++
>  6 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 515a81fdb7d6..cc9da9a1e230 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11247,9 +11247,8 @@ F:	include/linux/nubus.h
>  F:	include/uapi/linux/nubus.h
>  
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> -M:	Antonino Daplas <adaplas@gmail.com>
>  L:	linux-fbdev@vger.kernel.org
> -S:	Maintained
> +S:	Obsolete
>  F:	drivers/video/fbdev/riva/
>  F:	drivers/video/fbdev/nvidia/
>  
> diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
> index ceb3c770786f..24225e39662a 100644
> --- a/arch/powerpc/configs/g5_defconfig
> +++ b/arch/powerpc/configs/g5_defconfig
> @@ -130,8 +130,6 @@ CONFIG_FB=y
>  CONFIG_FIRMWARE_EDID=y
>  CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_OF=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_RADEON=y
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
> index c0423b2cf7c0..36b242efae9a 100644
> --- a/arch/powerpc/configs/pasemi_defconfig
> +++ b/arch/powerpc/configs/pasemi_defconfig
> @@ -107,8 +107,6 @@ CONFIG_DRM_RADEON=y
>  CONFIG_FIRMWARE_EDID=y
>  CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_VGA16=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_RADEON=y
>  # CONFIG_LCD_CLASS_DEVICE is not set
>  CONFIG_VGACON_SOFT_SCROLLBACK=y
> diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
> index 50b610b48914..ef4470d44763 100644
> --- a/arch/powerpc/configs/pmac32_defconfig
> +++ b/arch/powerpc/configs/pmac32_defconfig
> @@ -211,8 +211,6 @@ CONFIG_FB_PLATINUM=y
>  CONFIG_FB_VALKYRIE=y
>  CONFIG_FB_CT65550=y
>  CONFIG_FB_IMSTT=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_MATROX=y
>  CONFIG_FB_MATROX_MILLENIUM=y
>  CONFIG_FB_MATROX_MYSTIQUE=y
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index 7c6baf6df139..5b4e26de0bcf 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -752,9 +752,6 @@ CONFIG_FB_OF=y
>  CONFIG_FB_PLATINUM=y
>  CONFIG_FB_VALKYRIE=y
>  CONFIG_FB_CT65550=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
> -CONFIG_FB_RIVA=m
>  CONFIG_FB_MATROX=y
>  CONFIG_FB_MATROX_MILLENIUM=y
>  CONFIG_FB_MATROX_MYSTIQUE=y
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 1b2f5f31fb6f..cad3e4bc5e52 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -868,6 +868,7 @@ config FB_ATMEL
>  
>  config FB_NVIDIA
>  	tristate "nVidia Framebuffer Support"
> +	depends on BROKEN
>  	depends on FB && PCI
>  	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>  	select FB_MODE_HELPERS
> @@ -877,6 +878,8 @@ config FB_NVIDIA
>  	select BITREVERSE
>  	select VGASTATE
>  	help
> +	  Obsolete, use nouveau instead.
> +
>  	  This driver supports graphics boards with the nVidia chips, TNT
>  	  and newer. For very old chipsets, such as the RIVA128, then use
>  	  the rivafb.
> @@ -915,6 +918,7 @@ config FB_NVIDIA_BACKLIGHT
>  
>  config FB_RIVA
>  	tristate "nVidia Riva support"
> +	depends on BROKEN
>  	depends on FB && PCI
>  	select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
>  	select FB_MODE_HELPERS
> @@ -924,6 +928,8 @@ config FB_RIVA
>  	select BITREVERSE
>  	select VGASTATE
>  	help
> +	  Obsolete, use nouveau instead.
> +
>  	  This driver supports graphics boards with the nVidia Riva/Geforce
>  	  chips.
>  	  Say Y if you have such a graphics board.
> -- 
> 2.25.1
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
