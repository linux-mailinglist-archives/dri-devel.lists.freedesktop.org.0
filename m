Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7953A16C468
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 15:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC5B6EB0B;
	Tue, 25 Feb 2020 14:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBC86EB0B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 14:53:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A499643F;
 Tue, 25 Feb 2020 15:53:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582642405;
 bh=ot5b8vS8Xbyr8RARRNOMj+IeET1tHlJZ1cxHEkFUO+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LTByP+Hlga3Kkabs4Wr5vp3lzrbU8OjHRNjv065nyihpW9W4VMdsEg5TwBmiVM4tt
 yGlYod/f9m4jOX7S1Omgr2tmP59MLIhHAnh7mBFUovKWKkz18gVFLaA77PIxhu/MVI
 TQkPs4qbGHucnJj6/tCBHHQ2E1TzVelsICE0T/rA=
Date: Tue, 25 Feb 2020 16:53:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 09/56] drm/omap: dsi: unexport specific data transfer
 functions
Message-ID: <20200225145305.GH4764@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-10-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-10-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

Thank you for the patch.

On Tue, Feb 25, 2020 at 12:20:39AM +0100, Sebastian Reichel wrote:
> After converting all DSI drivers, unexport the specific transfer
> functions.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 12 ------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 20 --------------------
>  2 files changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 84e2eb0b51d7..0990777a42f7 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4941,18 +4941,6 @@ static const struct omap_dss_device_ops dsi_ops = {
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
> index ea7bf0970677..787e102eb068 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -309,26 +309,6 @@ struct omapdss_dsi_ops {
>  	/* data transfer */
>  	ssize_t (*transfer)(struct omap_dss_device *dssdev,
>  			const struct mipi_dsi_msg *msg);
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
