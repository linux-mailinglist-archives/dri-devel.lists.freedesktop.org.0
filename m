Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B236B9619E0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 00:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B3F10E10B;
	Tue, 27 Aug 2024 22:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CL1Fg7Ru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA71210E10B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 22:08:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C44E2C5;
 Wed, 28 Aug 2024 00:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724796413;
 bh=GwfBdDDBd2G9bTP7LfsBbSl4ezCPOSNJG5zFgL+kz4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CL1Fg7RuHAgifgypUsKRV5RrpuODBIGnU8pEgfEIjglgGdjwjPheuBOO2nWAj3ymp
 ZTe3mcEQlqbywlBZzXI47E3QNgMxLn6dkIVOt4SAShrM9HyIFd92g/loSNWJf3FKE+
 2QnuaLXivTHVDM9L7mws0ZTG7rnOuvv7mB40NP5I=
Date: Wed, 28 Aug 2024 01:07:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Add Kconfig dependency between
 RZG2L_DU and RZG2L_MIPI_DSI
Message-ID: <20240827220756.GG30398@pendragon.ideasonboard.com>
References: <20240827163727.108405-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827163727.108405-1-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Tue, Aug 27, 2024 at 05:37:24PM +0100, Biju Das wrote:
> Add Kconfig dependency between RZG2L_DU and RZG2L_MIPI_DSI, so that
> DSI module has functional dependency on DU. It is similar way that
> the R-Car MIPI DSI encoder is handled.
> 
> While at it drop ARCH_RENESAS dependency as DRM_RZG2L_DU depend on
> ARCH_RZG2L.
> 
> Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 8ec14271ebba..a9488f873436 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -11,10 +11,15 @@ config DRM_RZG2L_DU
>  	  Choose this option if you have an RZ/G2L alike chipset.
>  	  If M is selected the module will be called rzg2l-du-drm.
>  
> -config DRM_RZG2L_MIPI_DSI
> -	tristate "RZ/G2L MIPI DSI Encoder Support"
> -	depends on DRM && DRM_BRIDGE && OF
> -	depends on ARCH_RENESAS || COMPILE_TEST
> -	select DRM_MIPI_DSI
> +config DRM_RZG2L_USE_MIPI_DSI
> +	bool "RZ/G2L MIPI DSI Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	depends on DRM_RZG2L_DU || COMPILE_TEST
> +	default DRM_RZG2L_DU
>  	help
>  	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
> +
> +config DRM_RZG2L_MIPI_DSI
> +	def_tristate DRM_RZG2L_DU
> +	depends on DRM_RZG2L_USE_MIPI_DSI
> +	select DRM_MIPI_DSI

-- 
Regards,

Laurent Pinchart
