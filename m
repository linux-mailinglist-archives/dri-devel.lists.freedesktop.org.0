Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE93BACA2
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDAF89C55;
	Sun,  4 Jul 2021 09:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 527 seconds by postgrey-1.36 at gabe;
 Sun, 04 Jul 2021 09:58:07 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856F989C55
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 42CBEFB03;
 Sun,  4 Jul 2021 11:49:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jT-EIZpjtCB; Sun,  4 Jul 2021 11:49:16 +0200 (CEST)
Date: Sun, 4 Jul 2021 11:49:14 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] drm: bridge: nwl-dsi: Drop unused nwl_dsi_plat_clk_config
Message-ID: <YOGEGqN0iMGeEk6g@qwark.sigxcpu.org>
References: <20210704093433.27717-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210704093433.27717-1-jagan@amarulasolutions.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Sun, Jul 04, 2021 at 03:04:33PM +0530, Jagan Teki wrote:
> nwl_dsi_plat_clk_config structure added in below commit but not
> used anywhere in the driver.
> 
> commit <44cfc6233447c> ("drm/bridge: Add NWL MIPI DSI host controller
> support")
> 
> Drop it.

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido

> 
> Cc: Guido Günther <agx@sigxcpu.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 873995f0a741..d7986067eefe 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -48,12 +48,6 @@ enum transfer_direction {
>  #define NWL_DSI_ENDPOINT_LCDIF 0
>  #define NWL_DSI_ENDPOINT_DCSS 1
>  
> -struct nwl_dsi_plat_clk_config {
> -	const char *id;
> -	struct clk *clk;
> -	bool present;
> -};
> -
>  struct nwl_dsi_transfer {
>  	const struct mipi_dsi_msg *msg;
>  	struct mipi_dsi_packet packet;
> -- 
> 2.25.1
> 
