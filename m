Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFAD91785B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 07:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B9010E775;
	Wed, 26 Jun 2024 05:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vj/LXfZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B7010E2A1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 05:51:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 072A373E;
 Wed, 26 Jun 2024 07:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1719381067;
 bh=MHp/zhusMFMz7uCcBaQsQqttODzjyCKr/GtDgI6hQkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vj/LXfZO2Tl3iAaaoMh7OLzFFO1HNUdCnhr9a+k0O1OxFMxd9kj+Kun2tDEc21lZA
 4/cp5SoG2Lu0ylCPfGluEO48cOmD4mfO4mog4ieRbpnbvWqi0Spo1E7Y1a/YXa+WB2
 O225teShT5kSQQxCl4+jpEBd+OMWJ32gGXvfVWUw=
Date: Wed, 26 Jun 2024 08:51:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Message-ID: <20240626055108.GA10453@pendragon.ideasonboard.com>
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Prabhakar,

Thank you for the patch.

On Tue, Jun 25, 2024 at 01:32:44PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> All the RZ/G2L DU specific components are located under the rz-du folder,
> so it makes sense to move the RZ/G2L MIPI DSI driver there instead of
> keeping it in the rcar-du folder. This change improves the organization
> and modularity of the driver configuration by grouping related settings together.

I was thinking the same the other day. Thanks for beating me at sending
a patch :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Do you or Biju has committer rights to drm-misc to push this patch ?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/Kconfig                   | 8 --------
>  drivers/gpu/drm/renesas/rcar-du/Makefile                  | 2 --
>  drivers/gpu/drm/renesas/rz-du/Kconfig                     | 8 ++++++++
>  drivers/gpu/drm/renesas/rz-du/Makefile                    | 2 ++
>  .../gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c   | 0
>  .../drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h  | 0
>  6 files changed, 10 insertions(+), 10 deletions(-)
>  rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c (100%)
>  rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h (100%)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> index 53c356aed5d5..39af73cf2092 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -60,14 +60,6 @@ config DRM_RCAR_MIPI_DSI
>  	select DRM_MIPI_DSI
>  	select RESET_CONTROLLER
>  
> -config DRM_RZG2L_MIPI_DSI
> -	tristate "RZ/G2L MIPI DSI Encoder Support"
> -	depends on DRM && DRM_BRIDGE && OF
> -	depends on ARCH_RENESAS || COMPILE_TEST
> -	select DRM_MIPI_DSI
> -	help
> -	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
> -
>  config DRM_RCAR_VSP
>  	bool "R-Car DU VSP Compositor Support" if ARM
>  	default y if ARM64
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Makefile b/drivers/gpu/drm/renesas/rcar-du/Makefile
> index b8f2c82651d9..6f132325c8b7 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rcar-du/Makefile
> @@ -14,5 +14,3 @@ obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
>  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
> -
> -obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 5f0db2c5fee6..8ec14271ebba 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -10,3 +10,11 @@ config DRM_RZG2L_DU
>  	help
>  	  Choose this option if you have an RZ/G2L alike chipset.
>  	  If M is selected the module will be called rzg2l-du-drm.
> +
> +config DRM_RZG2L_MIPI_DSI
> +	tristate "RZ/G2L MIPI DSI Encoder Support"
> +	depends on DRM && DRM_BRIDGE && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select DRM_MIPI_DSI
> +	help
> +	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
> diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
> index 663b82a2577f..2987900ea6b6 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> @@ -6,3 +6,5 @@ rzg2l-du-drm-y := rzg2l_du_crtc.o \
>  
>  rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
>  obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
> +
> +obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> similarity index 100%
> rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> similarity index 100%
> rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h
> rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h

-- 
Regards,

Laurent Pinchart
