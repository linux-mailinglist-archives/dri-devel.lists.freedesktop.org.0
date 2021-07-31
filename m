Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79903DC7A8
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 20:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5984C6E8DA;
	Sat, 31 Jul 2021 18:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49D26E8DA
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 18:26:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id e9368fa8-f22c-11eb-8d1a-0050568cd888;
 Sat, 31 Jul 2021 18:27:07 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3B35D194B48;
 Sat, 31 Jul 2021 20:27:12 +0200 (CEST)
Date: Sat, 31 Jul 2021 20:26:47 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Alistair Francis <alistair@alistair23.me>
Cc: robh+dt@kernel.org, thierry.reding@gmail.com, krzk@kernel.org,
 shawnguo@kernel.org, daniel@0x0f.com, linux@rempel-privat.de,
 kuninori.morimoto.gx@renesas.com, max.Merchel@tq-group.com,
 geert+renesas@glider.be, airlied@linux.ie, daniel@ffwll.ch,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alistair23@gmail.com,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5] drm/panel: Add support for E Ink VB3300-KCA
Message-ID: <YQWV54S1nkJdcgce@ravnborg.org>
References: <20210730121310.131-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730121310.131-1-alistair@alistair23.me>
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

Hi Alistair,

On Fri, Jul 30, 2021 at 10:13:10PM +1000, Alistair Francis wrote:
> Add support for the 10.3" E Ink panel described at:
> https://www.eink.com/product.html?type=productdetail&id=7
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> v5:
>  - Add .connector_type

I missed this revision before sending my last mail.
I tried to apply this patch but every patch confliced due to other
changes since the kernel this is based on.

I need you to generate a new patch on top of drm-misc-next,
or as an alternative on top of linux-next.
You are in a much better position to do this right than I am.

Sorry for the troubles!

	Sam

> 
>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c          | 30 +++++++++++++++++++
>  3 files changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index b3797ba2698b..799e20222551 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -128,6 +128,8 @@ properties:
>          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>        - edt,etm0700g0dh6
>        - edt,etm0700g0edh6
> +        # E Ink VB3300-KCA
> +      - eink,vb3300-kca
>          # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
>        - evervision,vgg804821
>          # Foxlink Group 5" WVGA TFT LCD panel
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 71da86e7b3a2..31745c45dd92 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -339,6 +339,8 @@ patternProperties:
>      description: eGalax_eMPIA Technology Inc
>    "^einfochips,.*":
>      description: Einfochips
> +  "^eink,.*":
> +    description: E Ink Corporation
>    "^elan,.*":
>      description: Elan Microelectronic Corp.
>    "^element14,.*":
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 21939d4352cf..90d96091f09f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2046,6 +2046,33 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  };
>  
> +static const struct display_timing eink_vb3300_kca_timing = {
> +	.pixelclock = { 40000000, 40000000, 40000000 },
> +	.hactive = { 334, 334, 334 },
> +	.hfront_porch = { 1, 1, 1 },
> +	.hback_porch = { 1, 1, 1 },
> +	.hsync_len = { 1, 1, 1 },
> +	.vactive = { 1405, 1405, 1405 },
> +	.vfront_porch = { 1, 1, 1 },
> +	.vback_porch = { 1, 1, 1 },
> +	.vsync_len = { 1, 1, 1 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
> +};
> +
> +static const struct panel_desc eink_vb3300_kca = {
> +	.timings = &eink_vb3300_kca_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 157,
> +		.height = 209,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct display_timing evervision_vgg804821_timing = {
>  	.pixelclock = { 27600000, 33300000, 50000000 },
>  	.hactive = { 800, 800, 800 },
> @@ -4350,6 +4377,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "edt,etm0700g0edh6",
>  		.data = &edt_etm0700g0bdh6,
> +	}, {
> +		.compatible = "eink,vb3300-kca",
> +		.data = &eink_vb3300_kca,
>  	}, {
>  		.compatible = "evervision,vgg804821",
>  		.data = &evervision_vgg804821,
> -- 
> 2.31.1
