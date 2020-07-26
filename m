Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1522DC61
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 08:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5866E0D5;
	Sun, 26 Jul 2020 06:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EDC6E0BE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 06:57:47 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3F344804D0;
 Sun, 26 Jul 2020 08:57:45 +0200 (CEST)
Date: Sun, 26 Jul 2020 08:57:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/3] drm/panel: simple: Add DT bindings for Powertip
 PH800480T013
Message-ID: <20200726065743.GB1691925@ravnborg.org>
References: <20200725211335.5717-1-marex@denx.de>
 <20200725211335.5717-3-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725211335.5717-3-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-VAfIpHNAAAA:8 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=nWlI2Sa6hsEHlt7KchYA:9 a=CjuIK1q_8ugA:10
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

Hi Marex

On Sat, Jul 25, 2020 at 11:13:35PM +0200, Marek Vasut wrote:
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
>  drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index af6ea5480c81..6bf6604ca78e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2986,6 +2986,27 @@ static const struct panel_desc pda_91_00156_a0  = {
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
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +};
For new panels we today requires:
- connector_type
- bus_flags
- bus_format

(Assuming this is a DPI connector panel).
We are working on a patch that wll warn for panels missing required
info. Today a lot of panels are missing info so it is easy to find
panels that does not include all relevant info.

	Sam
>  
>  static const struct drm_display_mode qd43003c0_40_mode = {
>  	.clock = 9000,
> @@ -3998,6 +4019,9 @@ static const struct of_device_id platform_of_match[] = {
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
