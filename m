Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343133E0EE2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 09:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A8B89F53;
	Thu,  5 Aug 2021 07:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D692789E1D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 05:44:47 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mBWBQ-0001es-OB; Thu, 05 Aug 2021 07:44:44 +0200
Subject: Re: [PATCH v1 2/2] drm/panel: simple: add LOGIC Technologies
 LTTD800480070-L6WH-RT
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?Q?S=c3=b8ren_Ander?=
 =?UTF-8?Q?sen?= <san@skov.dk>, Sam Ravnborg <sam@ravnborg.org>
References: <20210805043702.24715-1-o.rempel@pengutronix.de>
 <20210805043702.24715-2-o.rempel@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <a72ad0e5-fb60-e19b-710e-7afbcb157f4f@pengutronix.de>
Date: Thu, 5 Aug 2021 07:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805043702.24715-2-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 05 Aug 2021 07:06:58 +0000
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

Hello Oleksi,

On 05.08.21 06:37, Oleksij Rempel wrote:
> From: Søren Andersen <san@skov.dk>
> 
> Add support for the LOGIC Technologies, Inc LTTD800480070-L6WH-RT
> 
> Co-Developed-by: Søren Andersen <san@skov.dk>
> Co-Developed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Søren Andersen <san@skov.dk>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index fda79a986d12..e5213a610ae9 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2967,6 +2967,37 @@ static const struct panel_desc logictechno_lt170410_2whc = {
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> +static const struct drm_display_mode logictechno_lttd800480070_l6wh_rt_mode = {
> +	.clock = 33000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 154,
> +	.hsync_end = 800 + 154 + 3,
> +	.htotal = 800 + 154 + 3 + 43,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 47,
> +	.vsync_end = 480 + 47 + 3,
> +	.vtotal = 480 + 47 + 3 + 20,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc logictechno_lttd800480070_l6wh_rt = {
> +	.modes = &logictechno_lttd800480070_l6wh_rt_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 154,
> +		.height = 86,
> +	},
> +	.delay = {
> +		.prepare = 45,
> +		.enable = 100,
> +		.disable = 100,
> +		.unprepare = 45
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,

This lacks a .connector_type. I think recent kernels warn about that?

Cheers,
Ahmad

> +};
> +
>  static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
>  	.clock = 30400,
>  	.hdisplay = 800,
> @@ -4492,6 +4523,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "logictechno,lt170410-2whc",
>  		.data = &logictechno_lt170410_2whc,
> +	}, {
> +		.compatible = "logictechno,lttd800480070-l6wh-rt",
> +		.data = &logictechno_lttd800480070_l6wh_rt,
>  	}, {
>  		.compatible = "mitsubishi,aa070mc01-ca1",
>  		.data = &mitsubishi_aa070mc01,
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
