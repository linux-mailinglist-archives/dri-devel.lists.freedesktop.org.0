Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C71B8775
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 17:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DE26E29A;
	Sat, 25 Apr 2020 15:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02096E29A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 15:44:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AB86A20089;
 Sat, 25 Apr 2020 17:43:58 +0200 (CEST)
Date: Sat, 25 Apr 2020 17:43:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] panel: simple: Add BOE NV133FHM-N61
Message-ID: <20200425154357.GJ32235@ravnborg.org>
References: <20200420215742.1927498-1-bjorn.andersson@linaro.org>
 <20200420215742.1927498-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420215742.1927498-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=ZHUanIRT7T1iIWuw79kA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 02:57:42PM -0700, Bjorn Andersson wrote:
> The BOE NV133FHM-N61 panel is a 13.3" 1920x1080 eDP panel, add support
> for it in panel-simple.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

While applying I fixed so boe_nv133fhm_n61 is defined before boe_nv140fhmn49.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3ad828eaefe1..5b92583bccdf 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1124,6 +1124,36 @@ static const struct panel_desc boe_nv140fhmn49 = {
>  	.connector_type = DRM_MODE_CONNECTOR_eDP,
>  };
>  
> +static const struct drm_display_mode boe_nv133fhm_n61_modes = {
> +	.clock = 147840,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 48,
> +	.hsync_end = 1920 + 48 + 32,
> +	.htotal = 1920 + 48 + 32 + 200,
> +	.vdisplay = 1080,
> +	.vsync_start = 1080 + 3,
> +	.vsync_end = 1080 + 3 + 6,
> +	.vtotal = 1080 + 3 + 6 + 31,
> +	.vrefresh = 60,
> +};
> +
> +static const struct panel_desc boe_nv133fhm_n61 = {
> +	.modes = &boe_nv133fhm_n61_modes,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 300,
> +		.height = 187,
> +	},
> +	.delay = {
> +		.hpd_absent_delay = 200,
> +		.unprepare = 500,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
> +	.connector_type = DRM_MODE_CONNECTOR_eDP,
> +};
> +
>  static const struct drm_display_mode cdtech_s043wq26h_ct7_mode = {
>  	.clock = 9000,
>  	.hdisplay = 480,
> @@ -3478,6 +3508,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "boe,nv101wxmn51",
>  		.data = &boe_nv101wxmn51,
> +	}, {
> +		.compatible = "boe,nv133fhm-n61",
> +		.data = &boe_nv133fhm_n61,
>  	}, {
>  		.compatible = "boe,nv140fhmn49",
>  		.data = &boe_nv140fhmn49,
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
