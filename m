Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00C14208D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2020 23:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF606E509;
	Sun, 19 Jan 2020 22:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BFE6E509
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 22:47:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A1DB72001E;
 Sun, 19 Jan 2020 23:47:17 +0100 (CET)
Date: Sun, 19 Jan 2020 23:47:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v3 2/3] drm/panel: simple: add display timings for logic
 technologies displays
Message-ID: <20200119224716.GA4703@ravnborg.org>
References: <20200119220204.208751-1-marcel@ziswiler.com>
 <20200119220204.208751-2-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200119220204.208751-2-marcel@ziswiler.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=m8ToADvmAAAA:8
 a=k76NmfXvAAAA:8 a=Wn22GMglRkWWUr5S2SgA:9 a=zCx_ZXCi2UNGHBA6:21
 a=zq0-TRRFe72ZQw1h:21 a=CjuIK1q_8ugA:10 a=kCrBFHLFDAq2jDEeoMj9:22
 a=xklTzJp5TIrWR6y8xC-k:22 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: devicetree@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 j.bauer@endrich.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Philippe Schenker <philippe.schenker@toradex.com>, info@logictechno.com,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marcel.

On Sun, Jan 19, 2020 at 11:02:03PM +0100, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Add display timings for the following 3 display panels manufactured by
> Logic Technologies Limited:
> 
> - LT161010-2NHC e.g. as found in the Toradex Capacitive Touch Display
>   7" Parallel [1]
> - LT161010-2NHR e.g. as found in the Toradex Resistive Touch Display 7"
>   Parallel [2]
> - LT170410-2WHC e.g. as found in the Toradex Capacitive Touch Display
>   10.1" LVDS [3]
> 
> Those panels may also be distributed by Endrich Bauelemente Vertriebs
> GmbH [4].
> 
> [1] https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
> [2] https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
> [3] https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
> [4] https://www.endrich.com/isi50_isi30_tft-displays/lt170410-1whc_isi30
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Philippe Schenker <philippe.schenker@toradex.com>
> 
> ---
> 
> Changes in v3:
> - Fix typo in pixelclock frequency for lt170410_2whc as recently
>   discovered by Philippe.
> 
> Changes in v2:
> - Added Philippe's reviewed-by.
> 
>  drivers/gpu/drm/panel/panel-simple.c | 65 ++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d6f77bc494c7..4140e0faff06 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2107,6 +2107,62 @@ static const struct panel_desc lg_lp129qe = {
>  	},
>  };
>  
> +static const struct display_timing logictechno_lt161010_2nh_timing = {
> +	.pixelclock = { 26400000, 33300000, 46800000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 16, 210, 354 },
> +	.hback_porch = { 46, 46, 46 },
> +	.hsync_len = { 1, 20, 40 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 7, 22, 147 },
> +	.vback_porch = { 23, 23, 23 },
> +	.vsync_len = { 1, 10, 20 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc logictechno_lt161010_2nh = {
> +	.timings = &logictechno_lt161010_2nh_timing,
> +	.num_timings = 1,
> +	.size = {
> +		.width = 154,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +};
connector_type needs to be specified for all panels.
This is something we have added recently and is today mandatory
for new panel-simple panels.

Also please re-order so we add bindings before we driver support for the panels.
This makes checkpatch (and me) more happy.

Ohh, and bonus points for using display_timing and specifying min,typ,max values.

	Sam

> +
> +static const struct display_timing logictechno_lt170410_2whc_timing = {
> +	.pixelclock = { 68900000, 71100000, 73400000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 23, 60, 71 },
> +	.hback_porch = { 23, 60, 71 },
> +	.hsync_len = { 15, 40, 47 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 5, 7, 10 },
> +	.vback_porch = { 5, 7, 10 },
> +	.vsync_len = { 6, 9, 12 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc logictechno_lt170410_2whc = {
> +	.timings = &logictechno_lt170410_2whc_timing,
> +	.num_timings = 1,
> +	.size = {
> +		.width = 217,
> +		.height = 136,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +};
> +
>  static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
>  	.clock = 30400,
>  	.hdisplay = 800,
> @@ -3417,6 +3473,15 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "logicpd,type28",
>  		.data = &logicpd_type_28,
> +	}, {
> +		.compatible = "logictechno,lt161010-2nhc",
> +		.data = &logictechno_lt161010_2nh,
> +	}, {
> +		.compatible = "logictechno,lt161010-2nhr",
> +		.data = &logictechno_lt161010_2nh,
> +	}, {
> +		.compatible = "logictechno,lt170410-2whc",
> +		.data = &logictechno_lt170410_2whc,
>  	}, {
>  		.compatible = "mitsubishi,aa070mc01-ca1",
>  		.data = &mitsubishi_aa070mc01,
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
