Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D3C9E1664
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270E710E98A;
	Tue,  3 Dec 2024 08:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VCdc/e7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22DA10E989
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:57:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43D808DB;
 Tue,  3 Dec 2024 09:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733216198;
 bh=Wot9tECeNTJDGW798wuJ6PXnm1L2eh64oZqpArwPcKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VCdc/e7my71OuVV7NdYtI3l01iNQg9gM6pODFp04vFCUX3Y94ZUFMqSSAHoEtTdxV
 XUMMR8fIJWcJcrSJsY+0AN7ateLtJf3XnvD2s2NmML0kX7D+YS89LtzhZTJ4fVB40D
 sjrVWg8POplTxPDa3cfBtZ8OYdzhzeJ7O12E2pj0=
Date: Tue, 3 Dec 2024 10:56:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 6/9] drm/rcar-du: Add support for r8a779h0
Message-ID: <20241203085654.GJ10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-6-738ae1a95d2a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-6-738ae1a95d2a@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:40AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add support for r8a779h0. It is very similar to r8a779g0, but has only
> one output.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 19 +++++++++++++++++++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h   |  1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 16 ++++++++++------
>  3 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index fb719d9aff10..afbc74e18cce 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -545,6 +545,24 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
>  	.dsi_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
> +	.gen = 4,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_NO_BLENDING
> +		  | RCAR_DU_FEATURE_NO_DPTSR,
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		/* R8A779H0 has one MIPI DSI output. */
> +		[RCAR_DU_OUTPUT_DSI0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 0,
> +		},
> +	},
> +	.num_rpf = 5,
> +	.dsi_clk_mask = BIT(0),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> @@ -571,6 +589,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
>  	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
>  	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
> +	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
>  	{ }
>  };
>  
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> index 5cfa2bb7ad93..d7004f76f735 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> @@ -32,6 +32,7 @@ struct rcar_du_device;
>  #define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
>  #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
>  #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
> +#define RCAR_DU_FEATURE_NO_DPTSR	BIT(6)  /* V4M does not have DPTSR */

Do we need a quirk ? At first glance it seems the DPTSR register is only
used for DU instances that have two channels, so a check on the number
of channels should be enough ?

>  
>  #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
>  
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> index 2ccd2581f544..132d930670eb 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -107,10 +107,12 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>  		 */
>  		rcrtc = rcdu->crtcs;
>  		num_crtcs = rcdu->num_crtcs;
> -	} else if (rcdu->info->gen >= 3 && rgrp->num_crtcs > 1) {
> +	} else if ((rcdu->info->gen == 3 && rgrp->num_crtcs > 1) ||
> +		   rcdu->info->gen == 4) {
>  		/*
>  		 * On Gen3 dot clocks are setup through per-group registers,
>  		 * only available when the group has two channels.
> +		 * On Gen4 the registers are there for single channel too.
>  		 */
>  		rcrtc = &rcdu->crtcs[rgrp->index * 2];
>  		num_crtcs = rgrp->num_crtcs;
> @@ -185,11 +187,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
>  	rcar_du_group_write(rgrp, DORCR, dorcr);
>  
> -	/* Apply planes to CRTCs association. */
> -	mutex_lock(&rgrp->lock);
> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> -			    rgrp->dptsr_planes);
> -	mutex_unlock(&rgrp->lock);
> +	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_NO_DPTSR)) {
> +		/* Apply planes to CRTCs association. */
> +		mutex_lock(&rgrp->lock);
> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> +				    rgrp->dptsr_planes);
> +		mutex_unlock(&rgrp->lock);
> +	}
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart
