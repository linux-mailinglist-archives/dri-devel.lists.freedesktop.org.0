Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494629E5E9A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 20:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4DA10EF7C;
	Thu,  5 Dec 2024 19:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J5d21sTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD78510EF7C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 19:08:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E4D22B3;
 Thu,  5 Dec 2024 20:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733425708;
 bh=gpyryQqORDmiyuSyg34TV+1Hz4lJ6aOHkXIhXH1UvaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5d21sTyqWYtne2btLeGlY1CvIrEv7DHDVcS364svFlwB9+7EiQNSI6iIBrZ21WyG
 Ob1ml8pP59fUOML9CA0STJECUiKv9HFqhTg7C5UTdUk/BCLRWW9S+u9Ls4sGWMpu5d
 LK4KFPdds/1YnQAkArRQpPPJt0nEjvDPkblkbkiE=
Date: Thu, 5 Dec 2024 21:08:45 +0200
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
Subject: Re: [PATCH v2 07/10] drm/rcar-du: Add support for r8a779h0
Message-ID: <20241205190845.GE21014@pendragon.ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
 <20241205-rcar-gh-dsi-v2-7-42471851df86@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-rcar-gh-dsi-v2-7-42471851df86@ideasonboard.com>
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

On Thu, Dec 05, 2024 at 03:45:02PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add support for r8a779h0. It is very similar to r8a779g0, but has only
> one output.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 18 ++++++++++++++++++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c |  4 +++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index fb719d9aff10..7858e10839f2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -545,6 +545,23 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
>  	.dsi_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
> +	.gen = 4,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_NO_BLENDING,
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
> @@ -571,6 +588,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
>  	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
>  	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
> +	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
>  	{ }
>  };
>  
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> index 0fbf6abbde6e..b9ae6cc43702 100644
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
> 

-- 
Regards,

Laurent Pinchart
