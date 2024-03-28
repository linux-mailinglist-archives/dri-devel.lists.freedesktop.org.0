Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3F88FC51
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC57010ED89;
	Thu, 28 Mar 2024 10:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8xu/gPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4238510ED89
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711620072; x=1743156072;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mcgtr76Vb76ep/SNPgUTZUywkBNBQtMr1jhXQ9103ak=;
 b=O8xu/gPTyIwncx8lEhq7x3tr1p6XbhSWkBw5lh2OrSFNvy+p3Gw5/kop
 vyjEEPJ5M7VRst/yidDw7B65L3sIBpU6LH6Xf9qhyjJ3f+bS9P6i6Svyw
 MyleqAVefCc81o6vKIV3c6MKr8bwXZwkith+OT6hgeZdyo/8j8Ai/mmlJ
 GnMAgrOtG0r++HcjAj/a9uwDGu/1wbQkMWvXnZ8pr9E7YKnm6ewYcJ3NN
 qYPRBrws6pqLt/iuT9p+6Q4qbhzqKpaRpiS4k3SgOINa/Tjx/aZWH0vqw
 eQguGd3Bl+qDLolM2YJEQHFaKPcwLlwq0S/KiONCwYGdXdr85ay4j99yR Q==;
X-CSE-ConnectionGUID: n/oSusy/Q6aRRFQBlC9Bsg==
X-CSE-MsgGUID: UvU+79LDQpC6OFO1vluirg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17910110"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="17910110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16600067"
Received: from abdulqaf-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.57.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:01:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 07/13] drm: Make drivers depends on DRM_DW_HDMI
In-Reply-To: <20240327-kms-kconfig-helpers-v3-7-eafee11b84b3@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <20240327-kms-kconfig-helpers-v3-7-eafee11b84b3@kernel.org>
Date: Thu, 28 Mar 2024 12:01:05 +0200
Message-ID: <87ttkqfzfi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> DRM_DW_HDMI has a number of dependencies that might not be enabled.
> However, drivers were used to selecting it while not enforcing the
> DRM_DW_HDMI dependencies.
>
> This could result in Kconfig warnings (and further build breakages) such
> as:
>
>   Kconfig warnings: (for reference only)
>      WARNING: unmet direct dependencies detected for DRM_DW_HDMI
>      Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && DRM_DISPLAY_HELPER [=n]
>      Selected by [m]:
>      - DRM_SUN8I_DW_HDMI [=m] && HAS_IOMEM [=y] && DRM_SUN4I [=m]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403262127.kZkttfNz-lkp@intel.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/bridge/imx/Kconfig      | 4 ++--
>  drivers/gpu/drm/imx/ipuv3/Kconfig       | 5 +++--
>  drivers/gpu/drm/ingenic/Kconfig         | 2 +-
>  drivers/gpu/drm/meson/Kconfig           | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/Kconfig | 2 +-
>  drivers/gpu/drm/rockchip/Kconfig        | 2 +-
>  drivers/gpu/drm/sun4i/Kconfig           | 2 +-
>  7 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 5965e8027529..7687ed652df5 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -3,13 +3,13 @@ if ARCH_MXC || COMPILE_TEST
>  config DRM_IMX_LDB_HELPER
>  	tristate
>  
>  config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	tristate "Freescale i.MX8MP HDMI-TX bridge support"
> -	depends on OF
>  	depends on COMMON_CLK
> -	select DRM_DW_HDMI
> +	depends on DRM_DW_HDMI
> +	depends on OF
>  	select DRM_IMX8MP_HDMI_PVI
>  	select PHY_FSL_SAMSUNG_HDMI_PHY
>  	help
>  	  Choose this to enable support for the internal HDMI encoder found
>  	  on the i.MX8MP SoC.
> diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
> index bacf0655ebaf..5d810ac02171 100644
> --- a/drivers/gpu/drm/imx/ipuv3/Kconfig
> +++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
> @@ -33,9 +33,10 @@ config DRM_IMX_LDB
>  	  Choose this to enable the internal LVDS Display Bridge (LDB)
>  	  found on i.MX53 and i.MX6 processors.
>  
>  config DRM_IMX_HDMI
>  	tristate "Freescale i.MX DRM HDMI"
> -	select DRM_DW_HDMI
> -	depends on DRM_IMX && OF
> +	depends on DRM_DW_HDMI
> +	depends on DRM_IMX
> +	depends on OF
>  	help
>  	  Choose this if you want to use HDMI on i.MX6.
> diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
> index 3db117c5edd9..23effeb2ac72 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -25,12 +25,12 @@ config DRM_INGENIC_IPU
>  
>  	  The Image Processing Unit (IPU) will appear as a second primary plane.
>  
>  config DRM_INGENIC_DW_HDMI
>  	tristate "Ingenic specific support for Synopsys DW HDMI"
> +	depends on DRM_DW_HDMI
>  	depends on MACH_JZ4780
> -	select DRM_DW_HDMI
>  	help
>  	  Choose this option to enable Synopsys DesignWare HDMI based driver.
>  	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
>  	  select this option.
>  
> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
> index 615fdd0ce41b..5520b9e3f010 100644
> --- a/drivers/gpu/drm/meson/Kconfig
> +++ b/drivers/gpu/drm/meson/Kconfig
> @@ -11,13 +11,13 @@ config DRM_MESON
>  	select MESON_CANVAS
>  	select CEC_CORE if CEC_NOTIFIER
>  
>  config DRM_MESON_DW_HDMI
>  	tristate "HDMI Synopsys Controller support for Amlogic Meson Display"
> +	depends on DRM_DW_HDMI
>  	depends on DRM_MESON
>  	default y if DRM_MESON
> -	select DRM_DW_HDMI
>  	imply DRM_DW_HDMI_I2S_AUDIO
>  
>  config DRM_MESON_DW_MIPI_DSI
>  	tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
>  	depends on DRM_MESON
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> index 53c356aed5d5..2dc739db2ba3 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -23,12 +23,12 @@ config DRM_RCAR_CMM
>  	depends on DRM_RCAR_USE_CMM
>  
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>  	depends on DRM && OF
> +	depends on DRM_DW_HDMI
>  	depends on DRM_RCAR_DU || COMPILE_TEST
> -	select DRM_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
>  
>  config DRM_RCAR_USE_LVDS
>  	bool "R-Car DU LVDS Encoder Support"
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index 1bf3e2829cd0..0d5260e10f27 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -5,11 +5,10 @@ config DRM_ROCKCHIP
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL
>  	select VIDEOMODE_HELPERS
>  	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> -	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
>  	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
>  	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
>  	select GENERIC_PHY_MIPI_DPHY if ROCKCHIP_DW_MIPI_DSI
>  	select SND_SOC_HDMI_CODEC if ROCKCHIP_CDN_DP && SND_SOC
>  	help
> @@ -55,10 +54,11 @@ config ROCKCHIP_CDN_DP
>  	  RK3399 based SoC, you should select this
>  	  option.
>  
>  config ROCKCHIP_DW_HDMI
>  	bool "Rockchip specific extensions for Synopsys DW HDMI"
> +	depends on DRM_DW_HDMI
>  	help
>  	  This selects support for Rockchip SoC specific extensions
>  	  for the Synopsys DesignWare HDMI driver. If you want to
>  	  enable HDMI on RK3288 or RK3399 based SoC, you should select
>  	  this option.
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index 4741d9f6544c..5b19c7cb7b7e 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -55,12 +55,12 @@ config DRM_SUN6I_DSI
>  	  sun6i_mipi_dsi.
>  
>  config DRM_SUN8I_DW_HDMI
>  	tristate "Support for Allwinner version of DesignWare HDMI"
>  	depends on DRM_SUN4I
> +	depends on DRM_DW_HDMI
>  	default DRM_SUN4I
> -	select DRM_DW_HDMI
>  	help
>  	  Choose this option if you have an Allwinner SoC with the
>  	  DesignWare HDMI controller. SoCs that support HDMI and
>  	  have a Display Engine 2.0 contain this controller. If M is
>  	  selected the module will be called sun8i_dw_hdmi.

-- 
Jani Nikula, Intel
