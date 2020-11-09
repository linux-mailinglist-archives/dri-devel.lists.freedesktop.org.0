Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76BF2AB656
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE9989919;
	Mon,  9 Nov 2020 11:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CA989919
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:16:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1C03B2B;
 Mon,  9 Nov 2020 12:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604920606;
 bh=29no4bJHGKquWNGhM39BN9pSSKpkZJcY9FVEFgvsPl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WaUQU2SF88JaB9FMaF+77CQEOK0bFITXV8K9ajN/EylAjm6JCDCyoijd4j+SOfz5u
 boGxY+jVue4APKgR0trwAl1NMknNhcY/cS74At8UzwvoFDvlzU2KMUDjVTHfMbR6wa
 FGRIbTG+4VZihlcbe3Njqa82RTkSdCDzblgEze4g=
Date: Mon, 9 Nov 2020 13:16:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 54/56] drm/omap: drop unused owner field
Message-ID: <20201109111641.GY6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-55-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-55-tomi.valkeinen@ti.com>
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
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:31PM +0200, Tomi Valkeinen wrote:
> dssdev->owner is set, but never used. We can drop the field.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dpi.c     | 1 -
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 1 -
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c   | 1 -
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c   | 1 -
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 2 --
>  drivers/gpu/drm/omapdrm/dss/sdi.c     | 1 -
>  drivers/gpu/drm/omapdrm/dss/venc.c    | 1 -
>  7 files changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
> index 1d2992daef40..030f997eccd0 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dpi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
> @@ -641,7 +641,6 @@ static int dpi_init_output_port(struct dpi_data *dpi, struct device_node *port)
>  	out->type = OMAP_DISPLAY_TYPE_DPI;
>  	out->dispc_channel = dpi_get_channel(dpi);
>  	out->of_port = port_num;
> -	out->owner = THIS_MODULE;
>  
>  	r = omapdss_device_init_output(out, &dpi->bridge);
>  	if (r < 0) {
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 76e4f607d8cf..22718a771d6d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -5443,7 +5443,6 @@ static int dsi_init_output(struct dsi_data *dsi)
>  	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
>  	out->dispc_channel = dsi_get_channel(dsi);
>  	out->dsi_ops = &dsi_ops;
> -	out->owner = THIS_MODULE;
>  	out->of_port = 0;
>  	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
>  		       | DRM_BUS_FLAG_DE_HIGH
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index a14fbf06cb30..13701571d59b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -707,7 +707,6 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
>  	out->type = OMAP_DISPLAY_TYPE_HDMI;
>  	out->name = "hdmi.0";
>  	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
> -	out->owner = THIS_MODULE;
>  	out->of_port = 0;
>  
>  	r = omapdss_device_init_output(out, &hdmi->bridge);
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> index b738d9750686..5d627caf90f2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -681,7 +681,6 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
>  	out->type = OMAP_DISPLAY_TYPE_HDMI;
>  	out->name = "hdmi.0";
>  	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
> -	out->owner = THIS_MODULE;
>  	out->of_port = 0;
>  
>  	r = omapdss_device_init_output(out, &hdmi->bridge);
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 90e41c635e45..4442e49ffc5c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -263,8 +263,6 @@ struct omapdss_dsi_ops {
>  struct omap_dss_device {
>  	struct device *dev;
>  
> -	struct module *owner;
> -
>  	struct dss_device *dss;
>  	struct drm_bridge *bridge;
>  	struct drm_bridge *next_bridge;
> diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
> index 033fd30074b0..35827b4487bd 100644
> --- a/drivers/gpu/drm/omapdrm/dss/sdi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
> @@ -314,7 +314,6 @@ static int sdi_init_output(struct sdi_device *sdi)
>  	out->dispc_channel = OMAP_DSS_CHANNEL_LCD;
>  	/* We have SDI only on OMAP3, where it's on port 1 */
>  	out->of_port = 1;
> -	out->owner = THIS_MODULE;
>  	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	/* 15.5.9.1.2 */
>  		       | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
> index 6e418a0f7572..8ecffe5bbd29 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -730,7 +730,6 @@ static int venc_init_output(struct venc_device *venc)
>  	out->type = OMAP_DISPLAY_TYPE_VENC;
>  	out->name = "venc.0";
>  	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
> -	out->owner = THIS_MODULE;
>  	out->of_port = 0;
>  
>  	r = omapdss_device_init_output(out, &venc->bridge);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
