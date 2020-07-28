Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEBF2310CE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 19:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865F36E1BD;
	Tue, 28 Jul 2020 17:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C531F6E124
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 17:24:30 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0FCD4804F6;
 Tue, 28 Jul 2020 19:24:26 +0200 (CEST)
Date: Tue, 28 Jul 2020 19:24:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 3/3] drm/panel: simple: Add DT bindings for Powertip
 PH800480T013
Message-ID: <20200728172425.GA1114934@ravnborg.org>
References: <20200728121246.23304-1-marex@denx.de>
 <20200728121246.23304-3-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728121246.23304-3-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-VAfIpHNAAAA:8 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=KoOJ8eiH_lwS9MUCcoAA:9 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=srlwD-8ojaedGGhPAyx8:22
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 02:12:46PM +0200, Marek Vasut wrote:
> Add support for Powertip PH800480T013 800x480 parallel LCD, this
> one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
> V2: Add bus_flags and connector_type

Hi Marek.

Applied the 3 patches to drm-misc-next.
Fixed subject while applying this patch.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index cb6550d37e85..298e3a26d9ee 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3000,6 +3000,31 @@ static const struct panel_desc pda_91_00156_a0  = {
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>  };
>  
> +static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
> +	.clock = 24750,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 54,
> +	.hsync_end = 800 + 54 + 2,
> +	.htotal = 800 + 54 + 2 + 44,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 49,
> +	.vsync_end = 480 + 49 + 2,
> +	.vtotal = 480 + 49 + 2 + 22,
> +};
> +
> +static const struct panel_desc powertip_ph800480t013_idf02  = {
> +	.modes = &powertip_ph800480t013_idf02_mode,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
>  
>  static const struct drm_display_mode qd43003c0_40_mode = {
>  	.clock = 9000,
> @@ -4012,6 +4037,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "pda,91-00156-a0",
>  		.data = &pda_91_00156_a0,
> +	}, {
> +		.compatible = "powertip,ph800480t013-idf02",
> +		.data = &powertip_ph800480t013_idf02,
>  	}, {
>  		.compatible = "qiaodian,qd43003c0-40",
>  		.data = &qd43003c0_40,
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
