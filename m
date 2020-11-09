Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61E2AB5DC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C46898F0;
	Mon,  9 Nov 2020 11:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757B6898F0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:05:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07D19B2B;
 Mon,  9 Nov 2020 12:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604919957;
 bh=yR+FJS+EMGk55NqrMdnRZsoI0hJ4UY8G3wXckFU05Tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W6RF530D51FYa/PE3WYHj6tsEwnjCbWWJRxXSt/4AnBw3sgx3QlN9r9tDbGtslvox
 eWNfDSd61pmkgTKBBRkT9onpS6sjY4Y5UlRRQciuhlIwkh1aX+S/01x+fQnsAhcVUO
 OeMBgnfEo5XlZ7ertRvhqRIdupEzLuo9mb8eniWQ=
Date: Mon, 9 Nov 2020 13:05:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 47/56] drm/omap: drop DSS ops_flags
Message-ID: <20201109110553.GR6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-48-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-48-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:03:24PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The omapdss device's ops_flags field is no longer
> used and can be dropped.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 9 ---------
>  drivers/gpu/drm/omapdrm/dss/venc.c    | 1 -
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 1f02d3e406dc..916c55101629 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -279,14 +279,6 @@ struct omap_dss_device_ops {
>  	const struct omapdss_dsi_ops dsi;
>  };
>  
> -/**
> - * enum omap_dss_device_ops_flag - Indicates which device ops are supported
> - * @OMAP_DSS_DEVICE_OP_MODES: The device supports reading modes
> - */
> -enum omap_dss_device_ops_flag {
> -	OMAP_DSS_DEVICE_OP_MODES = BIT(3),
> -};
> -
>  struct omap_dss_device {
>  	struct device *dev;
>  
> @@ -315,7 +307,6 @@ struct omap_dss_device {
>  	const char *name;
>  
>  	const struct omap_dss_device_ops *ops;
> -	unsigned long ops_flags;
>  	u32 bus_flags;
>  
>  	/* OMAP DSS output specific fields */
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
> index 5c027c81760f..6e418a0f7572 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -732,7 +732,6 @@ static int venc_init_output(struct venc_device *venc)
>  	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
>  	out->owner = THIS_MODULE;
>  	out->of_port = 0;
> -	out->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
>  
>  	r = omapdss_device_init_output(out, &venc->bridge);
>  	if (r < 0) {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
