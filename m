Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF012C8163
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052AF6E43B;
	Mon, 30 Nov 2020 09:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423066E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:50:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 924F197E;
 Mon, 30 Nov 2020 10:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606729853;
 bh=jgGcxDrGgvJfwj7QC6mhQ6E7qBS/ynmMBNEswr5RBiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jGAwx6bvSAt5aaqXjEgRqm7BUV3XQ5sphFyxcEG6bRySBY/xH2tIql+jPyt+hBxxA
 VeRSVMxmOmm5jVwOkduDZXZS9RBAyqxkUAw3j2uxmdSQtmGJCOc/fR4i/GdhTZV2Rp
 xhSSnIJ9QgLBCeukt1Gur039Z1+MsJR3Aj/wWBDI=
Date: Mon, 30 Nov 2020 11:50:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 55/80] drm/panel: panel-dsi-cm: use
 MIPI_DCS_GET_ERROR_COUNT_ON_DSI
Message-ID: <20201130095045.GG4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-56-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-56-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:13PM +0200, Tomi Valkeinen wrote:
> Use the common MIPI_DCS_GET_ERROR_COUNT_ON_DSI define instead of
> driver's own.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index 35a0c7da1974..cb0d27a38555 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -27,7 +27,6 @@
>  #include <video/of_display_timing.h>
>  #include <video/videomode.h>
>  
> -#define DCS_READ_NUM_ERRORS	0x05
>  #define DCS_GET_ID1		0xda
>  #define DCS_GET_ID2		0xdb
>  #define DCS_GET_ID3		0xdc
> @@ -225,7 +224,7 @@ static ssize_t num_dsi_errors_show(struct device *dev,
>  	mutex_lock(&ddata->lock);
>  
>  	if (ddata->enabled)
> -		r = dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS, &errors);
> +		r = dsicm_dcs_read_1(ddata, MIPI_DCS_GET_ERROR_COUNT_ON_DSI, &errors);
>  
>  	mutex_unlock(&ddata->lock);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
