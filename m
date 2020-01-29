Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3614D14F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 20:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CE16F616;
	Wed, 29 Jan 2020 19:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25E36F616
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 19:43:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D9529804E7;
 Wed, 29 Jan 2020 20:43:39 +0100 (CET)
Date: Wed, 29 Jan 2020 20:43:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Add Innolux N133HSE panel support
Message-ID: <20200129194338.GF25273@ravnborg.org>
References: <20200127022057.379140-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127022057.379140-1-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=YpGV6msqAAAA:8
 a=VwQbUJbxAAAA:8 a=6ohNodAXAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=SduOJp3vSp-fuDH-gpAA:9 a=CjuIK1q_8ugA:10 a=7Sa5D-Tva0wx0rmpRu8Y:22
 a=AjGcO6oz07-iQ99wixmX:22 a=0gLUg1G2xj6MhZ7RLP3J:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Sean Cross <xobs@kosagi.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

Thanks for the patch.

On Mon, Jan 27, 2020 at 03:20:57AM +0100, Marek Vasut wrote:
> From: Sean Cross <xobs@kosagi.com>
> 
> The Innolux N133HSE panel is a 13.3" 1920x1080 panel that contains an
> integrated backlight, and connects via eDP.
> 
> It is used in the Kosagi Novena.
> 
> Signed-off-by: Sean Cross <xobs@kosagi.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fabio Estevam <fabio.estevam@freescale.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> To: dri-devel@lists.freedesktop.org
> ---
>  .../display/panel/innolux,n133hse-ea1.txt     |  7 +++++
>  drivers/gpu/drm/panel/panel-simple.c          | 26 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n133hse-ea1.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n133hse-ea1.txt b/Documentation/devicetree/bindings/display/panel/innolux,n133hse-ea1.txt
> new file mode 100644
> index 000000000000..1a886aeedabf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,n133hse-ea1.txt
> @@ -0,0 +1,7 @@
> +Innolux Corporation 13.3" FHD (1920x1080) TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "innolux,n133hse-ea1"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.

For simple panels like this add the compatible to the new file pnale-simple.yaml.
We no longer use individual files for each panel.
You may need to use drm-misc-next to provide a proper patch.


> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index e14c14ac62b5..3dffd2e5af6d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1793,6 +1793,29 @@ static const struct panel_desc innolux_n116bge = {
>  	},
>  };
>  
> +static const struct drm_display_mode innolux_n133hse_ea1_mode = {
> +	.clock = 138500,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 46,
> +	.hsync_end = 1920 + 46 + 30,
> +	.htotal = 1920 + 46 + 30 + 84,
> +	.vdisplay = 1080,
> +	.vsync_start = 1080 + 2,
> +	.vsync_end = 1080 + 2 + 4,
> +	.vtotal = 1080 + 2 + 4 + 26,
> +	.vrefresh = 60,
> +};
> +
> +static const struct panel_desc innolux_n133hse_ea1 = {
> +	.modes = &innolux_n133hse_ea1_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 293,
> +		.height = 165,
> +	},
> +};
> +
As a minimum specify connector_type.
With eDP I assume you do not have min,typ,max figures for timings.
But if you have min.typ,max then please use a display_timings structure
and not a display_mode.

And please consider the .bus_format, .bus_flags and .flags.
We want the data in this file as precise as we can.

	Sam

>  static const struct drm_display_mode innolux_n156bge_l21_mode = {
>  	.clock = 69300,
>  	.hdisplay = 1366,
> @@ -3348,6 +3371,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "innolux,n116bge",
>  		.data = &innolux_n116bge,
> +	}, {
> +		.compatible = "innolux,n133hse-ea1",
> +		.data = &innolux_n133hse_ea1,
>  	}, {
>  		.compatible = "innolux,n156bge-l21",
>  		.data = &innolux_n156bge_l21,
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
