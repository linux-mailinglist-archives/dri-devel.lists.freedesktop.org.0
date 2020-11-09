Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB352AB5CA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A4589428;
	Mon,  9 Nov 2020 11:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE028898E4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:05:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67647B2B;
 Mon,  9 Nov 2020 12:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604919920;
 bh=tdFpQi0p3bCo+B/lrNtcTVZ2O5tTAfaVyITiCcu1u5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gO0ceIxHoueI443gwMNL22a3702nrXv2E9FrVmScY1ZBPB9ssTk8HOzHJ0ImyjVW1
 YS96aavb73sM94o6tLUzS1aZ/srHXPLfRcQgKWWty4Jrbkq5DDUA7Idx8jaeMUt5vw
 En3A5PnQYgWk7FgsBB62gGSfKDg9VBv88jcJJb/4=
Date: Mon, 9 Nov 2020 13:05:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 46/56] drm/omap: drop empty omap_encoder helper
 functions
Message-ID: <20201109110517.GQ6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-47-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-47-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:23PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Cleanup empty functions for encoder enable, disable and atomic check.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/omap_encoder.c | 28 --------------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> index 5f5fa01240a7..e24411fb9dac 100644
> --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> @@ -113,36 +113,8 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
>  	dss_mgr_set_timings(output, &vm);
>  }
>  
> -static void omap_encoder_disable(struct drm_encoder *encoder)
> -{
> -	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
> -	struct omap_dss_device *dssdev = omap_encoder->output;
> -	struct drm_device *dev = encoder->dev;
> -
> -	dev_dbg(dev->dev, "disable(%s)\n", dssdev->name);
> -}
> -
> -static void omap_encoder_enable(struct drm_encoder *encoder)
> -{
> -	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
> -	struct omap_dss_device *dssdev = omap_encoder->output;
> -	struct drm_device *dev = encoder->dev;
> -
> -	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
> -}
> -
> -static int omap_encoder_atomic_check(struct drm_encoder *encoder,
> -				     struct drm_crtc_state *crtc_state,
> -				     struct drm_connector_state *conn_state)
> -{
> -	return 0;
> -}
> -
>  static const struct drm_encoder_helper_funcs omap_encoder_helper_funcs = {
>  	.mode_set = omap_encoder_mode_set,
> -	.disable = omap_encoder_disable,
> -	.enable = omap_encoder_enable,
> -	.atomic_check = omap_encoder_atomic_check,
>  };
>  
>  /* initialize encoder */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
