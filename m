Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0452AB235
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0CD894C1;
	Mon,  9 Nov 2020 08:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77B1894C1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:10:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46E72B2B;
 Mon,  9 Nov 2020 09:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604909421;
 bh=PZP1TENW/bWXLV9kzd8X0zuGpseuJt2ASzL6VnVr07U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OfZxQVAP38lMiRKBv7jFttEJruV9cgdr6R4Mqy1hWI6PIOCWLLpUnk8/K2gKIZddi
 7EVoFN4uYu/sGJns4vlXeiW7m2vrehvbhiwgB7iGVp5XdtdhWMNMZDR1MNx9Lwsr7P
 AWBhHMpenvXk87rwFgGcJOmc1NfegAUyQnMWLdl0=
Date: Mon, 9 Nov 2020 10:10:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 08/56] drm/omap: dsi: unexport specific data transfer
 functions
Message-ID: <20201109081017.GD6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-9-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-9-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:02:45PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> After converting all DSI drivers, unexport the specific transfer
> functions.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 12 ------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 20 --------------------
>  2 files changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 59a62d1d41cb..2270730b16db 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4949,18 +4949,6 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.release_vc = dsi_release_vc,
>  
>  		.transfer = omap_dsi_transfer,
> -
> -		.dcs_write = dsi_vc_dcs_write,
> -		.dcs_write_nosync = dsi_vc_dcs_write_nosync,
> -		.dcs_read = dsi_vc_dcs_read,
> -
> -		.gen_write = dsi_vc_generic_write,
> -		.gen_write_nosync = dsi_vc_generic_write_nosync,
> -		.gen_read = dsi_vc_generic_read,
> -
> -		.bta_sync = dsi_vc_send_bta_sync,
> -
> -		.set_max_rx_packet_size = dsi_vc_set_max_rx_packet_size,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 654618e5a4e5..9ead877cb24c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -310,26 +310,6 @@ struct omapdss_dsi_ops {
>  	/* data transfer */
>  	ssize_t (*transfer)(struct omap_dss_device *dssdev,
>  			    const struct mipi_dsi_msg *msg);
> -
> -	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *data, int len);
> -	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *data, int len);
> -	int (*dcs_read)(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
> -			u8 *data, int len);
> -
> -	int (*gen_write)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *data, int len);
> -	int (*gen_write_nosync)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *data, int len);
> -	int (*gen_read)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *reqdata, int reqlen,
> -			u8 *data, int len);
> -
> -	int (*bta_sync)(struct omap_dss_device *dssdev, int channel);
> -
> -	int (*set_max_rx_packet_size)(struct omap_dss_device *dssdev,
> -			int channel, u16 plen);
>  };
>  
>  struct omap_dss_device_ops {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
