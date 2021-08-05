Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8163E14EE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 14:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CC56EA2D;
	Thu,  5 Aug 2021 12:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9056EA2D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 12:41:31 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mBcgj-0000aH-O7; Thu, 05 Aug 2021 14:41:29 +0200
Subject: Re: [PATCH v2 1/2] drm/panel: simple: add Multi-Innotechnology
 MI1010AIT-1CP1
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20210805111944.13533-1-o.rempel@pengutronix.de>
 <20210805111944.13533-2-o.rempel@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <babc1e28-e3e4-a848-7471-a015f0f54932@pengutronix.de>
Date: Thu, 5 Aug 2021 14:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805111944.13533-2-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.08.21 13:19, Oleksij Rempel wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> The Multi Innotechnology is a 10.1" 1280x800 panel.
> 
> The datasheet did not specify specific values for sync, back, front porch.
> The values are a best guess based on values for similar panels.
> 
> Co-Developed-by: Sam Ravnborg <sam@ravnborg.org>
> Co-Developed-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 1b80290c2b53..58ba26dbf852 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3033,6 +3033,37 @@ static const struct panel_desc mitsubishi_aa070mc01 = {
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  };
>  
> +static const struct display_timing multi_inno_mi1010ait_1cp_timing = {
> +	.pixelclock = { 68900000, 70000000, 73400000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 30, 60, 71 },
> +	.hback_porch = { 30, 60, 71 },
> +	.hsync_len = { 10, 10, 48 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 5, 10, 10 },
> +	.vback_porch = { 5, 10, 10 },
> +	.vsync_len = { 5, 6, 13 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc multi_inno_mi1010ait_1cp = {
> +	.timings = &multi_inno_mi1010ait_1cp_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 136,
> +	},
> +	.delay = {
> +		.enable = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>  static const struct display_timing nec_nl12880bc20_05_timing = {
>  	.pixelclock = { 67000000, 71000000, 75000000 },
>  	.hactive = { 1280, 1280, 1280 },
> @@ -4464,6 +4495,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "mitsubishi,aa070mc01-ca1",
>  		.data = &mitsubishi_aa070mc01,
> +	}, {
> +		.compatible = "multi-inno,mi1010ait-1cp",
> +		.data = &multi_inno_mi1010ait_1cp,
>  	}, {
>  		.compatible = "nec,nl12880bc20-05",
>  		.data = &nec_nl12880bc20_05,
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
