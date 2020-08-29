Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8546256A3E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 23:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053F96E0A2;
	Sat, 29 Aug 2020 21:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9D56E0A2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 21:05:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 585F9804A4;
 Sat, 29 Aug 2020 23:05:17 +0200 (CEST)
Date: Sat, 29 Aug 2020 23:05:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
Subject: Re: [PATCH] drm/panel: rm67191: Remove CLOCK_NON_CONTINUOUS flag
Message-ID: <20200829210515.GB796939@ravnborg.org>
References: <1598626713-5595-1-git-send-email-robert.chiras@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598626713-5595-1-git-send-email-robert.chiras@oss.nxp.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8AirrxEcAAAA:8 a=frjSGtBwQt7bNrbYrbUA:9
 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 05:58:33PM +0300, Robert Chiras (OSS) wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> The flag MIPI_DSI_CLOCK_NON_CONTINUOUS was wrong used in the DSI driver,
> so it was added to this panel, but not necessary.
> So, remove this flag since it is not needed.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>

Thanks, applied to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> index 23b6208..572547d 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> @@ -552,8 +552,7 @@ static int rad_panel_probe(struct mipi_dsi_device *dsi)
>  	panel->dsi = dsi;
>  
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> -			   MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO;
>  
>  	ret = of_property_read_u32(np, "video-mode", &video_mode);
>  	if (!ret) {
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
