Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF792355D0
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 09:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAFD6E075;
	Sun,  2 Aug 2020 07:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C463A6E075
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 07:11:47 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E5E1120020;
 Sun,  2 Aug 2020 09:11:45 +0200 (CEST)
Date: Sun, 2 Aug 2020 09:11:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/3] drm/panel: simple: Add Chefree CH101OLHLWH-002 panel
Message-ID: <20200802071144.GB822300@ravnborg.org>
References: <20200728201242.4336-1-marex@denx.de>
 <20200728201242.4336-3-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728201242.4336-3-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=k28S8m6lIBomCeKSdDwA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Tue, Jul 28, 2020 at 10:12:42PM +0200, Marek Vasut wrote:
> Add support for the Chefree CH101OLHLWH-002 10.1" (1280x800)
> color TFT LCD panel, connected over LVDS.
> 
> Timings are taken from the datasheet version P0.5.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
I do not think "To:" is a valid syntax here.
So I changed to "Cc:" in all patches while applying.

Will be pushed out as soon as my builds pass.

	Sam

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 298e3a26d9ee..a8e1f6306923 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1414,6 +1414,36 @@ static const struct panel_desc cdtech_s070wv95_ct16 = {
>  	},
>  };
>  
> +static const struct display_timing chefree_ch101olhlwh_002_timing = {
> +	.pixelclock = { 68900000, 71100000, 73400000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 65, 80, 95 },
> +	.hback_porch = { 64, 79, 94 },
> +	.hsync_len = { 1, 1, 1 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 7, 11, 14 },
> +	.vback_porch = { 7, 11, 14 },
> +	.vsync_len = { 1, 1, 1 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc chefree_ch101olhlwh_002 = {
> +	.timings = &chefree_ch101olhlwh_002_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 135,
> +	},
> +	.delay = {
> +		.enable = 200,
> +		.disable = 200,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>  static const struct drm_display_mode chunghwa_claa070wp03xg_mode = {
>  	.clock = 66770,
>  	.hdisplay = 800,
> @@ -3845,6 +3875,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "cdtech,s070wv95-ct16",
>  		.data = &cdtech_s070wv95_ct16,
> +	}, {
> +		.compatible = "chefree,ch101olhlwh-002",
> +		.data = &chefree_ch101olhlwh_002,
>  	}, {
>  		.compatible = "chunghwa,claa070wp03xg",
>  		.data = &chunghwa_claa070wp03xg,
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
