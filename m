Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF01307B5
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 12:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC8F89F2E;
	Sun,  5 Jan 2020 11:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D389F2E
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 11:31:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EC42D20052;
 Sun,  5 Jan 2020 12:31:04 +0100 (CET)
Date: Sun, 5 Jan 2020 12:31:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v7 4/8] drm/panel: support for auo,kd101n80-45na wuxga
 dsi video mode panel
Message-ID: <20200105113103.GA16043@ravnborg.org>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
 <20191012030720.27127-5-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191012030720.27127-5-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=Hn34YwpbHf-pG3iUBb8A:9 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao.

A few comments in the following.

	Sam

On Sat, Oct 12, 2019 at 11:07:16AM +0800, Jitao Shi wrote:
> Auo,kd101n80-45na's connector is same as boe,tv101wum-nl6.
> The most codes can be reuse.
> So auo,kd101n80-45na and boe,tv101wum-nl6 use one driver file.
> Add the different parts in driver data.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  6 +-
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 86 ++++++++++++++++---
>  2 files changed, 75 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index afcadb3585fb..0e887c978796 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -19,13 +19,13 @@ config DRM_PANEL_ARM_VERSATILE
>  	  in the Versatile family syscon registers.
>  
>  config DRM_PANEL_BOE_TV101WUM_NL6
> -	tristate "BOE TV101WUM 1200x1920 panel"
> +	tristate "BOE TV101WUM and AUO KD101N80 45NA 1200x1920 panel"
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	help
> -	  Say Y here if you want to support for BOE TV101WUM WUXGA PANEL
> -	  DSI Video Mode panel
> +	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
> +	  45NA WUXGA PANEL DSI Video Mode panel
>  
>  config DRM_PANEL_LVDS
>  	tristate "Generic LVDS panel driver"
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index af68236ea0e8..e6457f87bc61 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -35,6 +35,7 @@ struct panel_desc {
>  	enum mipi_dsi_pixel_format format;
>  	const struct panel_init_cmd *init_cmds;
>  	unsigned int lanes;
> +	bool discharge_on_disable;
>  };
>  
>  struct boe_panel {
> @@ -372,6 +373,15 @@ static const struct panel_init_cmd boe_init_cmd[] = {
>  	{},
>  };
>  
> +static const struct panel_init_cmd auo_kd101n80_45na_init_cmd[] = {
> +	_INIT_DELAY_CMD(24),
> +	_INIT_DCS_CMD(0x11),
> +	_INIT_DELAY_CMD(120),
> +	_INIT_DCS_CMD(0x29),
> +	_INIT_DELAY_CMD(120),
> +	{},
> +};
> +
>  static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
>  {
>  	return container_of(panel, struct boe_panel, base);
> @@ -452,20 +462,30 @@ static int boe_panel_unprepare(struct drm_panel *panel)
>  	if (!boe->prepared)
>  		return 0;
>  
> -	ret = boe_panel_off(boe);
> -	if (ret < 0) {
> -		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
> -		return ret;
> +	if (boe->desc->discharge_on_disable) {
> +		msleep(150);
> +		regulator_disable(boe->avee);
> +		regulator_disable(boe->avdd);
> +		usleep_range(5000, 7000);
> +		gpiod_set_value(boe->enable_gpio, 0);
> +		usleep_range(5000, 7000);
> +		regulator_disable(boe->pp1800);

The panel is not put into sleep mode in this case.
(Done by boe_panel_off() - which is not the most descriptive name for
that function).
If this is on purpose then consider adding a comment.


> +	} else {
> +		ret = boe_panel_off(boe);
> +		if (ret < 0) {
> +			dev_err(panel->dev, "failed to set panel off: %d\n",
> +				ret);
> +			return ret;
> +		}
> +		msleep(150);
> +		gpiod_set_value(boe->enable_gpio, 0);
> +		usleep_range(500, 1000);
> +		regulator_disable(boe->avee);
> +		regulator_disable(boe->avdd);
> +		usleep_range(5000, 7000);
> +		regulator_disable(boe->pp1800);
>  	}
>  
> -	msleep(150);
> -	gpiod_set_value(boe->enable_gpio, 0);
> -	usleep_range(500, 1000);
> -	regulator_disable(boe->avee);
> -	regulator_disable(boe->avdd);
> -	usleep_range(5000, 7000);
> -	regulator_disable(boe->pp1800);
> -
>  	boe->prepared = false;
>  
>  	return 0;
> @@ -495,10 +515,14 @@ static int boe_panel_prepare(struct drm_panel *panel)
>  	if (ret < 0)
>  		goto poweroffavdd;
>  
> -	msleep(100);
> +	usleep_range(5000, 10000);
>  
>  	gpiod_set_value(boe->enable_gpio, 1);
> -	usleep_range(10000, 12000);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(boe->enable_gpio, 0);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(boe->enable_gpio, 1);
> +	usleep_range(6000, 10000);

This looks like a geneeral change.
Consider pushing to the initial commit.
>  
>  	ret = boe_panel_init(boe);
>  	if (ret < 0) {
> @@ -530,6 +554,8 @@ static int boe_panel_enable(struct drm_panel *panel)
>  	if (boe->enabled)
>  		return 0;
>  
> +	msleep(130);
> +
>  	ret = backlight_enable(boe->backlight);
>  	if (ret) {
>  		dev_err(panel->dev, "Failed to enable backlight %d\n",
> @@ -567,6 +593,35 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
>  	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>  		      MIPI_DSI_MODE_LPM,
>  	.init_cmds = boe_init_cmd,
> +	.discharge_on_disable = false,
> +};
> +
> +static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
> +	.clock = 157000,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 80,
> +	.hsync_end = 1200 + 80 + 24,
> +	.htotal = 1200 + 80 + 24 + 36,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 16,
> +	.vsync_end = 1920 + 16 + 4,
> +	.vtotal = 1920 + 16 + 4 + 16,
> +	.vrefresh = 60,
> +};
> +
> +static const struct panel_desc auo_kd101n80_45na_desc = {
> +	.modes = &auo_kd101n80_45na_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 135,
> +		.height_mm = 216,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init_cmds = auo_kd101n80_45na_init_cmd,
> +	.discharge_on_disable = true,
>  };
>  
>  static int boe_panel_get_modes(struct drm_panel *panel)
> @@ -693,6 +748,9 @@ static const struct of_device_id boe_of_match[] = {
>  	{ .compatible = "boe,tv101wum-nl6",
>  	  .data = &boe_tv101wum_nl6_desc
>  	},
> +	{ .compatible = "auo,kd101n80-45na",
> +	  .data = &auo_kd101n80_45na_desc
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, boe_of_match);
> -- 
> 2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
