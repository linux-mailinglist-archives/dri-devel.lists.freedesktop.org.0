Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B063492B4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5CD6ED23;
	Thu, 25 Mar 2021 13:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC136ED23
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:06:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F2A9560;
 Thu, 25 Mar 2021 14:06:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616677593;
 bh=zyD87Hn+HLk3ohniAT8LyCOMOPd0duWdLkzlHytc2cI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pOmY6XK/bMh1qaDIDAvHG6k2STVvYL1q6b5tw5eeMD6gprFOtpw7WVwpn78SvQmrE
 JGwdwULQla15C5S8IX2Qp5PnvFTvfcMh8EM6QJUyFGpgDWTaszryuMst/XeLI2G+QL
 QiOZwWsto6rwa5BgziN24UQCw/O/77QRwH7meOJM=
Date: Thu, 25 Mar 2021 15:05:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] [v2] drivers: gpu: drm: Remove duplicate declaration
Message-ID: <YFyKriqHBgtWiX2q@pendragon.ideasonboard.com>
References: <20210325111028.864628-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325111028.864628-1-wanjiabing@vivo.com>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, kael_w@yeah.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wan,

Thank you for the patch.

On Thu, Mar 25, 2021 at 07:10:24PM +0800, Wan Jiabing wrote:
> struct dss_device has been declared. Remove the duplicate.
> And sort these forward declarations alphabetically.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, I assume you'll handle this patch, please let me know if you don't
plan to do so.

> ---
> Changelog:
> v2:
> - Sort forward declarations alphabetically.
> ---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index a40abeafd2e9..040d5a3e33d6 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -48,16 +48,15 @@
>  #define DISPC_IRQ_ACBIAS_COUNT_STAT3	(1 << 29)
>  #define DISPC_IRQ_FRAMEDONE3		(1 << 30)
>  
> -struct dss_device;
> -struct omap_drm_private;
> -struct omap_dss_device;
>  struct dispc_device;
> +struct drm_connector;
>  struct dss_device;
>  struct dss_lcd_mgr_config;
> +struct hdmi_avi_infoframe;
> +struct omap_drm_private;
> +struct omap_dss_device;
>  struct snd_aes_iec958;
>  struct snd_cea_861_aud_if;
> -struct hdmi_avi_infoframe;
> -struct drm_connector;
>  
>  enum omap_display_type {
>  	OMAP_DISPLAY_TYPE_NONE		= 0,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
