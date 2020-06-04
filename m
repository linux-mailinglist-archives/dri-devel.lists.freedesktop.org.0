Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C51EEB95
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 22:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80146E5B9;
	Thu,  4 Jun 2020 20:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C96A6E5B9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 20:11:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E5BE420025;
 Thu,  4 Jun 2020 22:11:15 +0200 (CEST)
Date: Thu, 4 Jun 2020 22:11:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: simple: Set connector type for DSI panels
Message-ID: <20200604201114.GC94913@ravnborg.org>
References: <20200602171240.2785-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602171240.2785-1-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=e5mUnYsNAAAA:8
 a=aVwLl-KtqhqBGUZS3N8A:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 08:12:40PM +0300, Laurent Pinchart wrote:
> None of the DSI panels set the connector_type in their panel_desc
> descriptor. As they are all guaranteed to be DSI panels, that's an easy
> fix, set the connector type to DRM_MODE_CONNECTOR_DSI.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, applied.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b6ecd1552132..b86b52bfece7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4082,6 +4082,7 @@ static const struct panel_desc_dsi auo_b080uan01 = {
>  			.width = 108,
>  			.height = 272,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
>  	.format = MIPI_DSI_FMT_RGB888,
> @@ -4110,6 +4111,7 @@ static const struct panel_desc_dsi boe_tv080wum_nl0 = {
>  			.width = 107,
>  			.height = 172,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO |
>  		 MIPI_DSI_MODE_VIDEO_BURST |
> @@ -4140,6 +4142,7 @@ static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
>  			.width = 94,
>  			.height = 151,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
>  	.format = MIPI_DSI_FMT_RGB888,
> @@ -4168,6 +4171,7 @@ static const struct panel_desc_dsi lg_lh500wx1_sd03 = {
>  			.width = 62,
>  			.height = 110,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO,
>  	.format = MIPI_DSI_FMT_RGB888,
> @@ -4196,6 +4200,7 @@ static const struct panel_desc_dsi panasonic_vvx10f004b00 = {
>  			.width = 217,
>  			.height = 136,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>  		 MIPI_DSI_CLOCK_NON_CONTINUOUS,
> @@ -4225,6 +4230,7 @@ static const struct panel_desc_dsi lg_acx467akm_7 = {
>  			.width = 62,
>  			.height = 110,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = 0,
>  	.format = MIPI_DSI_FMT_RGB888,
> @@ -4254,6 +4260,7 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
>  			.width = 217,
>  			.height = 136,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>  		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
