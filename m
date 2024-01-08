Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCB826EA4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 13:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021CB10E22D;
	Mon,  8 Jan 2024 12:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC9410E22D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 12:45:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d8ccfe921so4224335e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 04:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704717901; x=1705322701; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBJa2A5YTkxMeSOcsc49z8tBQk/+pC1ec7WoDJ0QV8o=;
 b=ZDM/viWlN7j5ABWDNofNWy1Rsahu+Ol5TmIGtmLvnyc5K6VUyzEhszFM+qJH2bt5ZQ
 BUntW+zWsbuHTlYKUfXmj26YMMp3T8vSn6wEKKncYgBRF9NaGzLcEBMXe7omLgLwVuw3
 BrQ2WBMWC0vPgPtc557LZAoN+bYRWXQaMbfaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704717901; x=1705322701;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TBJa2A5YTkxMeSOcsc49z8tBQk/+pC1ec7WoDJ0QV8o=;
 b=DjzY7+d88UVIrTs7MwvPWgFMOzqCUFLtq/EnIBeTxjrWVOmd02vgmWUefR98OCzbmI
 tmtr92vulLKLDohOWlC9FCj3favhF6YVYbR2ab0Nt0BkfHBITCLPycvnOrEPtrmKV6Xo
 LEmMASiADSIEqEr3ItOmeA2mJuDO9DtCwhjSL/JgopVLgTCij70GRd/2foqdy5Vh+c7d
 FIOfMPwvNhyA+NqxFvBWO9wfUXsih+asFAywsPgSQlaBKtIvgDL7GySvwixDHpjSW5vK
 BjQ2rJ1Js+JH+7NZdJYtkKIEqd8n8ntiAJRzStWZxHyMWzkwsVqhEIMQUNhCUo7WliFc
 ZoyA==
X-Gm-Message-State: AOJu0Yw04de7zYsb6IFa/r03G5TPWJzfzzE4qKN5Ri9Sl03BMRefvMqD
 VhGI9UqzWROnTpsGmDKIqBdk38BbeC464w==
X-Google-Smtp-Source: AGHT+IHIfN27EisYOKTqBtvPAbZ3CEHMrWl1qiNA3unzAkqHjgTIdCqwhOCO7PLP0TZOWI7ieWc94A==
X-Received: by 2002:a7b:c8d7:0:b0:40e:4875:1fde with SMTP id
 f23-20020a7bc8d7000000b0040e48751fdemr1032564wml.4.1704717901280; 
 Mon, 08 Jan 2024 04:45:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056000124300b003368c8d120fsm7714971wrx.7.2024.01.08.04.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 04:45:00 -0800 (PST)
Date: Mon, 8 Jan 2024 13:44:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] drm: Clean-up superfluously selecting
 VT_HW_CONSOLE_BINDING
Message-ID: <ZZvuS0FQyKqb0EQ8@phenom.ffwll.local>
Mail-Followup-To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240108121757.14069-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108121757.14069-1-lukas.bulwahn@gmail.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 01:17:57PM +0100, Lukas Bulwahn wrote:
> As config FRAMEBUFFER_CONSOLE already selects VT_HW_CONSOLE_BINDING, there
> is no need for any drm driver to repeat that rule for selecting.
> 
> Remove those duplications of selecting VT_HW_CONSOLE_BINDING.

This is only tree since a5ae331edb02 ("drm: Drop select
FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION") because select isn't
recursive and therefore dependencies had to be replicated. Which means
your patch without the above would result in build failures with
randomized configs.

I've added that clarification to your patch and merged it to
drm-misc-next, thanks.

Cheers, Sima

> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/gpu/drm/ingenic/Kconfig | 1 -
>  drivers/gpu/drm/mcde/Kconfig    | 1 -
>  drivers/gpu/drm/pl111/Kconfig   | 1 -
>  drivers/gpu/drm/tve200/Kconfig  | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
> index b440e0cdc057..3db117c5edd9 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -11,7 +11,6 @@ config DRM_INGENIC
>  	select DRM_GEM_DMA_HELPER
>  	select REGMAP
>  	select REGMAP_MMIO
> -	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
>  	help
>  	  Choose this option for DRM support for the Ingenic SoCs.
>  
> diff --git a/drivers/gpu/drm/mcde/Kconfig b/drivers/gpu/drm/mcde/Kconfig
> index 4f3d68e11bc1..907460b69d4f 100644
> --- a/drivers/gpu/drm/mcde/Kconfig
> +++ b/drivers/gpu/drm/mcde/Kconfig
> @@ -11,7 +11,6 @@ config DRM_MCDE
>  	select DRM_PANEL_BRIDGE
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> -	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
>  	help
>  	  Choose this option for DRM support for the ST-Ericsson MCDE
>  	  Multi-Channel Display Engine.
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index ad24cdf1d992..20fe1d2c0aaf 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -9,7 +9,6 @@ config DRM_PL111
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_BRIDGE
>  	select DRM_PANEL_BRIDGE
> -	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
>  	help
>  	  Choose this option for DRM support for the PL111 CLCD controller.
>  	  If M is selected the module will be called pl111_drm.
> diff --git a/drivers/gpu/drm/tve200/Kconfig b/drivers/gpu/drm/tve200/Kconfig
> index 11e865be81c6..5121fed571a5 100644
> --- a/drivers/gpu/drm/tve200/Kconfig
> +++ b/drivers/gpu/drm/tve200/Kconfig
> @@ -9,7 +9,6 @@ config DRM_TVE200
>  	select DRM_PANEL_BRIDGE
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> -	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
>  	help
>  	  Choose this option for DRM support for the Faraday TV Encoder
>  	  TVE200 Controller.
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
