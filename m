Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C221B258916
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41AE6E5CD;
	Tue,  1 Sep 2020 07:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5E6E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 19:15:24 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g72so6680918qke.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WcaixiuXt8LTwPUxV7+AZSN5V2CQLT9SZI84GSoT30M=;
 b=Xb8gTq3/k7PJ5ZGyeYCfFKlKn1cK1F4mtnbxdpeDJdJqta2SF9GSqR0ma0VllMd5rS
 cMsgyuM+sWkplUEQgaAGSacuwqQVUni7FNqrL+OWoyLW4aamY1Bqnnvie6wClGTxQfCQ
 Y+vwSBqBD9rY5xMk0inzEk4hA0+HNaPapYKYujAcH8qVF9Pyir1FFNjx0d4vNdkNPxeF
 cmOmFVqeNDd+EXNelHrOYLWOkop/iaCdCZ9sEvTczGWyTlzfes91dDcrLBIEGsvKf+jB
 xrO3PcHSN4EIyWUcsXS/VCLxoFdLQ1gP1wfzvydiQ9QDS2eTsH7X/2PZpSp7rMaxZkp3
 rkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WcaixiuXt8LTwPUxV7+AZSN5V2CQLT9SZI84GSoT30M=;
 b=YWII2IN/pmeZk7eHWNqwRHuooF74aQuWd9Vw1KVh3Lan1byrLWafbdb9rBvJTMKSEH
 DIFFglUffSRVXUJ9YgqoGv+Rr6A/jX2QHqivFfrlj0amGiBwoGmQt0CU2TaQ9IDCWiju
 ezvtXP5BmdP4cZDCfiSdN8d/aQhHpb2xmhF3iIn+yNiVmCvaRe9a1DpqVVIjRX4Jmmfq
 Yso/MZ1n/Dv/Q+jSN32imW5LgV1u7L10ATLiQbucmkAYv9u4E8Awke8WJBG/gFCQMHEo
 EA1lyRh3+nbqjK/jjJJQkPVpP0LVuQhhE7Y/m9+AlRTzAHORrmKW46inBjXz79/Gmuli
 RQ0A==
X-Gm-Message-State: AOAM5330/KD2Knk7wGlSG6oVh7KHny31AmPGNpAZhAfLWqlwTbTgDv36
 0X6/Vkp89rCqPbSTdhQ5EfPoNA==
X-Google-Smtp-Source: ABdhPJwL0r1V9OZQo4EGNIs5rIFBKlK+b4rvkRJBLN4m5WAWtD9jIrF7LXZpqYUGvX0pYph7TrtBIg==
X-Received: by 2002:a05:620a:24cc:: with SMTP id
 m12mr2880275qkn.159.1598901323263; 
 Mon, 31 Aug 2020 12:15:23 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
 by smtp.gmail.com with ESMTPSA id b47sm11796332qta.20.2020.08.31.12.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 12:15:22 -0700 (PDT)
Date: Mon, 31 Aug 2020 19:15:21 +0000
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v6 2/2] drm: panel: Add novatek nt36672a panel driver
Message-ID: <20200831191521.GD468@uller>
References: <20200831130251.19769-1-sumit.semwal@linaro.org>
 <20200831130251.19769-3-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831130251.19769-3-sumit.semwal@linaro.org>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
 Benni Steini <bennisteinir@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 31 Aug 13:02 UTC 2020, Sumit Semwal wrote:

> Novatek NT36672a is a generic DSI IC that drives command and video mode
> panels. Add the driver for it.
> 
> Right now adding support for some Poco F1 phones that have an LCD panel
> from Tianma connected with this IC, with a resolution of 1080x2246 that
> operates in DSI video mode.
> 
> During testing, Benni Steini <bennisteinir@gmail.com> helped us fix
> the reset sequence timing (from 10ms to 20ms), to get the bootanimation
> to work on Android.
> 
> With current AOSP, we need to increase it to 200ms - this seems to be a
> safe high value to avoid a white screen occasionally.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Benni Steini <bennisteinir@gmail.com>
> 
> ---
> v2: increase reset sequence timing to a safe 200ms
> v4: Since "0425662fdf05: drm: Nuke mode->vrefresh", we have to calculate
>     vrefresh on demand. Update for it.
> v5: Fixed review comments from Sam:
>       - rebased on top of drm-misc-next
>            remove return of drm_panel_add()
>            remove drm_panel_detach()
>       - renamed the panel driver file to reflect that this is a novatek
>            nt36672a display driver and not only for tianma panels.
>            Adjusted some internal names also to reflect the same.
>       - corrected changelog to add info about the generic Novatek DSI IC
>       - corrected compatible string accordingly
>       - removed pinctrl
>       - used drm_panel* API for prepare/unprepare/disable/remove
> v6: Fixed few review comments on v5 from Sam:
>       - add dev_err_probe() support
>       - move DRM_* error printing to dev_err()
>       - removed a few unnecessary bits
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-novatek-nt36672a.c    | 740 ++++++++++++++++++
>  4 files changed, 758 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01fb9ee6b951..aeecade2d65f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5619,6 +5619,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/ste,mcde.txt
>  F:	drivers/gpu/drm/mcde/
>  
> +DRM DRIVER FOR TIANMA NT36672A PANELS
> +M:	Sumit Semwal <sumit.semwal@linaro.org>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/tianma,nt36672a-panel.yaml
> +F:	drivers/gpu/drm/panel/panel-tianma-nt36672a.c
> +
>  DRM DRIVER FOR TDFX VIDEO CARDS
>  S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/tdfx/
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 8d97d07c5871..02600f12a063 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -208,6 +208,16 @@ config DRM_PANEL_NOVATEK_NT35510
>  	  around the Novatek NT35510 display controller, such as some
>  	  Hydis panels.
>  
> +config DRM_PANEL_NOVATEK_NT36672A
> +	tristate "Novatek NT36672A DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the panels built
> +	  around the Novatek NT36672A display controller, such as some
> +	  Tianma panels used in a few Xiaomi Poco F1 mobile phone.
> +
>  config DRM_PANEL_NOVATEK_NT39016
>  	tristate "Novatek NT39016 RGB/SPI panel"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 15a4e7752951..4a36eb45f670 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>  obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
>  obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) += panel-olimex-lcd-olinuxino.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> new file mode 100644
> index 000000000000..675e9d52f3c4
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -0,0 +1,740 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2020 Linaro Ltd
> + * Author: Sumit Semwal <sumit.semwal@linaro.org>
> + *
> + * This driver is for the DSI interface to panels using the NT36672A display driver IC
> + * from Novatek.
> + * Currently supported are the Tianma FHD+ panels found in some Xiaomi phones, including
> + * some variants of the Poco F1 phone.
> + *
> + * Panels using the Novatek NT37762A IC should add appropriate configuration per-panel and
> + * use this driver.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct panel_cmd {
> +	size_t len;
> +	const char *data;
> +};
> +
> +#define _INIT_CMD(...) { \
> +	.len = sizeof((char[]){__VA_ARGS__}), \

Afaict all uses of this macro passes 3 parameters, so .len will always
be 3 here.

> +	.data = (char[]){__VA_ARGS__} }
> +
> +static const char * const regulator_names[] = {
> +	"vddio",
> +	"vddpos",
> +	"vddneg",
> +};
> +
> +static unsigned long const regulator_enable_loads[] = {
> +	62000,
> +	100000,
> +	100000
> +};
> +
> +static unsigned long const regulator_disable_loads[] = {
> +	80,
> +	100,
> +	100
> +};
> +
> +struct panel_desc {
> +	const struct drm_display_mode *display_mode;
> +	const char *panel_name;
> +
> +	unsigned int width_mm;
> +	unsigned int height_mm;
> +
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned int lanes;
> +
> +	const struct panel_cmd *on_cmds_1;
> +	const struct panel_cmd *on_cmds_2;
> +
> +	const struct panel_cmd *off_cmds;
> +};
> +
> +struct panel_info {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *link;
> +	const struct panel_desc *desc;
> +
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	bool prepared;
> +};
> +
> +static inline struct panel_info *to_panel_info(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct panel_info, base);
> +}
> +
> +static int send_mipi_cmds(struct drm_panel *panel, const struct panel_cmd *cmds)

This is a quite generic function name, as is all the structs declared above.

> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	unsigned int i = 0;

No need to initialize i.

> +	int err;
> +
> +	if (!cmds)

I don't think can happen, seems overly defensive.

> +		return -EFAULT;
> +
> +	for (i = 0; cmds[i].len != 0; i++) {
> +		const struct panel_cmd *cmd = &cmds[i];
> +
> +		if (cmd->len == 2)

If I'm right about _INIT_CMD, then this will never happen.

> +			err = mipi_dsi_dcs_write(pinfo->link,
> +						 cmd->data[1], NULL, 0);
> +		else
> +			err = mipi_dsi_dcs_write(pinfo->link,
> +						 cmd->data[1], cmd->data + 2,
> +						 cmd->len - 2);

So you're never using cmd->data[0]? Why pass it in _INIT_CMD then?

And if len is always 3, then this would imply that all these are just
single byte writes to data[1].

> +
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int novatek_panel_power_off(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int i, ret = 0;
> +
> +	gpiod_set_value(pinfo->reset_gpio, 0);
> +
> +	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
> +		ret = regulator_set_load(pinfo->supplies[i].consumer,
> +					 regulator_disable_loads[i]);

During regulator_disable() the aggregated load on the regulator will be
recalculated, omitting the contribution of any disabled regulators.

As such the disabled loads are not useful - and you can set the active
load at probe time.

> +		if (ret) {
> +			dev_err(panel->dev, "regulator_set_load failed %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
> +	if (ret)
> +		dev_err(panel->dev, "regulator_bulk_disable failed %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int nt36672a_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int ret;
> +
> +	if (!pinfo->prepared)
> +		return 0;
> +
> +	/* send off cmds */
> +	ret = send_mipi_cmds(panel, pinfo->desc->off_cmds);
> +
> +	if (ret < 0)
> +		dev_err(panel->dev, "failed to send DCS off cmds: %d\n", ret);
> +
> +	ret = mipi_dsi_dcs_set_display_off(pinfo->link);
> +	if (ret < 0)
> +		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
> +
> +	/* 120ms delay required here as per DCS spec */
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
> +	if (ret < 0)
> +		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
> +
> +	/* 0x3C = 60ms delay */
> +	msleep(60);
> +
> +	ret = novatek_panel_power_off(panel);
> +	if (ret < 0)
> +		dev_err(panel->dev, "power_off failed ret = %d\n", ret);
> +
> +	pinfo->prepared = false;
> +
> +	return ret;
> +}
> +
> +static int novatek_panel_power_on(struct panel_info *pinfo)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
> +		ret = regulator_set_load(pinfo->supplies[i].consumer,
> +					 regulator_enable_loads[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * As per downstream kernel, Reset sequence of Tianma FHD panel requires the panel to
> +	 * be out of reset for 10ms, followed by being held in reset for 10ms. But for Android
> +	 * AOSP, we needed to bump it upto 200ms otherwise we get white screen sometimes.
> +	 * FIXME: Try to reduce this 200ms to a lesser value.
> +	 */
> +	gpiod_set_value(pinfo->reset_gpio, 0);
> +	msleep(200);
> +	gpiod_set_value(pinfo->reset_gpio, 1);
> +	msleep(200);
> +
> +	return 0;
> +}
> +
> +static int nt36672a_panel_prepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int err;
> +
> +	if (pinfo->prepared)
> +		return 0;
> +
> +	err = novatek_panel_power_on(pinfo);
> +	if (err < 0)
> +		goto poweroff;
> +
> +	/* send first part of init cmds */
> +	err = send_mipi_cmds(panel, pinfo->desc->on_cmds_1);
> +
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to send DCS Init 1st Code: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	err = mipi_dsi_dcs_exit_sleep_mode(pinfo->link);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	/* 0x46 = 70 ms delay */
> +	msleep(70);
> +
> +	err = mipi_dsi_dcs_set_display_on(pinfo->link);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to Set Display ON: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	/* Send rest of the init cmds */
> +	err = send_mipi_cmds(panel, pinfo->desc->on_cmds_2);
> +
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to send DCS Init 2nd Code: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	msleep(120);
> +
> +	pinfo->prepared = true;
> +
> +	return 0;
> +
> +poweroff:
> +	gpiod_set_value(pinfo->reset_gpio, 1);
> +	return err;
> +}
> +
> +static int nt36672a_panel_get_modes(struct drm_panel *panel,
> +				    struct drm_connector *connector)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	const struct drm_display_mode *m = pinfo->desc->display_mode;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, m);
> +	if (!mode) {
> +		dev_err(panel->dev, "failed to add mode %ux%u@%u\n", m->hdisplay,
> +			m->vdisplay, drm_mode_vrefresh(m));
> +		return -ENOMEM;
> +	}
> +
> +	connector->display_info.width_mm = pinfo->desc->width_mm;
> +	connector->display_info.height_mm = pinfo->desc->height_mm;
> +
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs panel_funcs = {
> +	.unprepare = nt36672a_panel_unprepare,
> +	.prepare = nt36672a_panel_prepare,
> +	.get_modes = nt36672a_panel_get_modes,
> +};
> +
> +static const struct panel_cmd tianma_fhd_video_on_cmds_1[] = {
> +	/* skin enhancement mode */
> +	_INIT_CMD(0x00, 0xFF, 0x22),

Given that these are all the same size, I think you should avoid using a
macro for the initialization.

> +	_INIT_CMD(0x00, 0x00, 0x40),
> +	_INIT_CMD(0x00, 0x01, 0xC0),
> +	_INIT_CMD(0x00, 0x02, 0x40),
> +	_INIT_CMD(0x00, 0x03, 0x40),
> +	_INIT_CMD(0x00, 0x04, 0x40),
> +	_INIT_CMD(0x00, 0x05, 0x40),
> +	_INIT_CMD(0x00, 0x06, 0x40),
> +	_INIT_CMD(0x00, 0x07, 0x40),
> +	_INIT_CMD(0x00, 0x08, 0x40),
> +	_INIT_CMD(0x00, 0x09, 0x40),
> +	_INIT_CMD(0x00, 0x0A, 0x40),
> +	_INIT_CMD(0x00, 0x0B, 0x40),
> +	_INIT_CMD(0x00, 0x0C, 0x40),
> +	_INIT_CMD(0x00, 0x0D, 0x40),
> +	_INIT_CMD(0x00, 0x0E, 0x40),
> +	_INIT_CMD(0x00, 0x0F, 0x40),
> +	_INIT_CMD(0x00, 0x10, 0x40),
> +	_INIT_CMD(0x00, 0x11, 0x50),
> +	_INIT_CMD(0x00, 0x12, 0x60),
> +	_INIT_CMD(0x00, 0x13, 0x70),
> +	_INIT_CMD(0x00, 0x14, 0x58),
> +	_INIT_CMD(0x00, 0x15, 0x68),
> +	_INIT_CMD(0x00, 0x16, 0x78),
> +	_INIT_CMD(0x00, 0x17, 0x77),
> +	_INIT_CMD(0x00, 0x18, 0x39),
> +	_INIT_CMD(0x00, 0x19, 0x2D),
> +	_INIT_CMD(0x00, 0x1A, 0x2E),
> +	_INIT_CMD(0x00, 0x1B, 0x32),
> +	_INIT_CMD(0x00, 0x1C, 0x37),
> +	_INIT_CMD(0x00, 0x1D, 0x3A),
> +	_INIT_CMD(0x00, 0x1E, 0x40),
> +	_INIT_CMD(0x00, 0x1F, 0x40),
> +	_INIT_CMD(0x00, 0x20, 0x40),
> +	_INIT_CMD(0x00, 0x21, 0x40),
> +	_INIT_CMD(0x00, 0x22, 0x40),
> +	_INIT_CMD(0x00, 0x23, 0x40),
> +	_INIT_CMD(0x00, 0x24, 0x40),
> +	_INIT_CMD(0x00, 0x25, 0x40),
> +	_INIT_CMD(0x00, 0x26, 0x40),
> +	_INIT_CMD(0x00, 0x27, 0x40),
> +	_INIT_CMD(0x00, 0x28, 0x40),
> +	_INIT_CMD(0x00, 0x2D, 0x00),
> +	_INIT_CMD(0x00, 0x2F, 0x40),
> +	_INIT_CMD(0x00, 0x30, 0x40),
> +	_INIT_CMD(0x00, 0x31, 0x40),
> +	_INIT_CMD(0x00, 0x32, 0x40),
> +	_INIT_CMD(0x00, 0x33, 0x40),
> +	_INIT_CMD(0x00, 0x34, 0x40),
> +	_INIT_CMD(0x00, 0x35, 0x40),
> +	_INIT_CMD(0x00, 0x36, 0x40),
> +	_INIT_CMD(0x00, 0x37, 0x40),
> +	_INIT_CMD(0x00, 0x38, 0x40),
> +	_INIT_CMD(0x00, 0x39, 0x40),
> +	_INIT_CMD(0x00, 0x3A, 0x40),
> +	_INIT_CMD(0x00, 0x3B, 0x40),
> +	_INIT_CMD(0x00, 0x3D, 0x40),
> +	_INIT_CMD(0x00, 0x3F, 0x40),
> +	_INIT_CMD(0x00, 0x40, 0x40),
> +	_INIT_CMD(0x00, 0x41, 0x40),
> +	_INIT_CMD(0x00, 0x42, 0x40),
> +	_INIT_CMD(0x00, 0x43, 0x40),
> +	_INIT_CMD(0x00, 0x44, 0x40),
> +	_INIT_CMD(0x00, 0x45, 0x40),
> +	_INIT_CMD(0x00, 0x46, 0x40),
> +	_INIT_CMD(0x00, 0x47, 0x40),
> +	_INIT_CMD(0x00, 0x48, 0x40),
> +	_INIT_CMD(0x00, 0x49, 0x40),
> +	_INIT_CMD(0x00, 0x4A, 0x40),
> +	_INIT_CMD(0x00, 0x4B, 0x40),
> +	_INIT_CMD(0x00, 0x4C, 0x40),
> +	_INIT_CMD(0x00, 0x4D, 0x40),
> +	_INIT_CMD(0x00, 0x4E, 0x40),
> +	_INIT_CMD(0x00, 0x4F, 0x40),
> +	_INIT_CMD(0x00, 0x50, 0x40),
> +	_INIT_CMD(0x00, 0x51, 0x40),
> +	_INIT_CMD(0x00, 0x52, 0x40),
> +	_INIT_CMD(0x00, 0x53, 0x01),
> +	_INIT_CMD(0x00, 0x54, 0x01),
> +	_INIT_CMD(0x00, 0x55, 0xFE),
> +	_INIT_CMD(0x00, 0x56, 0x77),
> +	_INIT_CMD(0x00, 0x58, 0xCD),
> +	_INIT_CMD(0x00, 0x59, 0xD0),
> +	_INIT_CMD(0x00, 0x5A, 0xD0),
> +	_INIT_CMD(0x00, 0x5B, 0x50),
> +	_INIT_CMD(0x00, 0x5C, 0x50),
> +	_INIT_CMD(0x00, 0x5D, 0x50),
> +	_INIT_CMD(0x00, 0x5E, 0x50),
> +	_INIT_CMD(0x00, 0x5F, 0x50),
> +	_INIT_CMD(0x00, 0x60, 0x50),
> +	_INIT_CMD(0x00, 0x61, 0x50),
> +	_INIT_CMD(0x00, 0x62, 0x50),
> +	_INIT_CMD(0x00, 0x63, 0x50),
> +	_INIT_CMD(0x00, 0x64, 0x50),
> +	_INIT_CMD(0x00, 0x65, 0x50),
> +	_INIT_CMD(0x00, 0x66, 0x50),
> +	_INIT_CMD(0x00, 0x67, 0x50),
> +	_INIT_CMD(0x00, 0x68, 0x50),
> +	_INIT_CMD(0x00, 0x69, 0x50),
> +	_INIT_CMD(0x00, 0x6A, 0x50),
> +	_INIT_CMD(0x00, 0x6B, 0x50),
> +	_INIT_CMD(0x00, 0x6C, 0x50),
> +	_INIT_CMD(0x00, 0x6D, 0x50),
> +	_INIT_CMD(0x00, 0x6E, 0x50),
> +	_INIT_CMD(0x00, 0x6F, 0x50),
> +	_INIT_CMD(0x00, 0x70, 0x07),
> +	_INIT_CMD(0x00, 0x71, 0x00),
> +	_INIT_CMD(0x00, 0x72, 0x00),
> +	_INIT_CMD(0x00, 0x73, 0x00),
> +	_INIT_CMD(0x00, 0x74, 0x06),
> +	_INIT_CMD(0x00, 0x75, 0x0C),
> +	_INIT_CMD(0x00, 0x76, 0x03),
> +	_INIT_CMD(0x00, 0x77, 0x09),
> +	_INIT_CMD(0x00, 0x78, 0x0F),
> +	_INIT_CMD(0x00, 0x79, 0x68),
> +	_INIT_CMD(0x00, 0x7A, 0x88),
> +	_INIT_CMD(0x00, 0x7C, 0x80),
> +	_INIT_CMD(0x00, 0x7D, 0x80),
> +	_INIT_CMD(0x00, 0x7E, 0x80),
> +	_INIT_CMD(0x00, 0x7F, 0x00),
> +	_INIT_CMD(0x00, 0x80, 0x00),
> +	_INIT_CMD(0x00, 0x81, 0x00),
> +	_INIT_CMD(0x00, 0x83, 0x01),
> +	_INIT_CMD(0x00, 0x84, 0x00),
> +	_INIT_CMD(0x00, 0x85, 0x80),
> +	_INIT_CMD(0x00, 0x86, 0x80),
> +	_INIT_CMD(0x00, 0x87, 0x80),
> +	_INIT_CMD(0x00, 0x88, 0x40),
> +	_INIT_CMD(0x00, 0x89, 0x91),
> +	_INIT_CMD(0x00, 0x8A, 0x98),
> +	_INIT_CMD(0x00, 0x8B, 0x80),
> +	_INIT_CMD(0x00, 0x8C, 0x80),
> +	_INIT_CMD(0x00, 0x8D, 0x80),
> +	_INIT_CMD(0x00, 0x8E, 0x80),
> +	_INIT_CMD(0x00, 0x8F, 0x80),
> +	_INIT_CMD(0x00, 0x90, 0x80),
> +	_INIT_CMD(0x00, 0x91, 0x80),
> +	_INIT_CMD(0x00, 0x92, 0x80),
> +	_INIT_CMD(0x00, 0x93, 0x80),
> +	_INIT_CMD(0x00, 0x94, 0x80),
> +	_INIT_CMD(0x00, 0x95, 0x80),
> +	_INIT_CMD(0x00, 0x96, 0x80),
> +	_INIT_CMD(0x00, 0x97, 0x80),
> +	_INIT_CMD(0x00, 0x98, 0x80),
> +	_INIT_CMD(0x00, 0x99, 0x80),
> +	_INIT_CMD(0x00, 0x9A, 0x80),
> +	_INIT_CMD(0x00, 0x9B, 0x80),
> +	_INIT_CMD(0x00, 0x9C, 0x80),
> +	_INIT_CMD(0x00, 0x9D, 0x80),
> +	_INIT_CMD(0x00, 0x9E, 0x80),
> +	_INIT_CMD(0x00, 0x9F, 0x80),
> +	_INIT_CMD(0x00, 0xA0, 0x8A),
> +	_INIT_CMD(0x00, 0xA2, 0x80),
> +	_INIT_CMD(0x00, 0xA6, 0x80),
> +	_INIT_CMD(0x00, 0xA7, 0x80),
> +	_INIT_CMD(0x00, 0xA9, 0x80),
> +	_INIT_CMD(0x00, 0xAA, 0x80),
> +	_INIT_CMD(0x00, 0xAB, 0x80),
> +	_INIT_CMD(0x00, 0xAC, 0x80),
> +	_INIT_CMD(0x00, 0xAD, 0x80),
> +	_INIT_CMD(0x00, 0xAE, 0x80),
> +	_INIT_CMD(0x00, 0xAF, 0x80),
> +	_INIT_CMD(0x00, 0xB7, 0x76),
> +	_INIT_CMD(0x00, 0xB8, 0x76),
> +	_INIT_CMD(0x00, 0xB9, 0x05),
> +	_INIT_CMD(0x00, 0xBA, 0x0D),
> +	_INIT_CMD(0x00, 0xBB, 0x14),
> +	_INIT_CMD(0x00, 0xBC, 0x0F),
> +	_INIT_CMD(0x00, 0xBD, 0x18),
> +	_INIT_CMD(0x00, 0xBE, 0x1F),
> +	_INIT_CMD(0x00, 0xBF, 0x05),
> +	_INIT_CMD(0x00, 0xC0, 0x0D),
> +	_INIT_CMD(0x00, 0xC1, 0x14),
> +	_INIT_CMD(0x00, 0xC2, 0x03),
> +	_INIT_CMD(0x00, 0xC3, 0x07),
> +	_INIT_CMD(0x00, 0xC4, 0x0A),
> +	_INIT_CMD(0x00, 0xC5, 0xA0),
> +	_INIT_CMD(0x00, 0xC6, 0x55),
> +	_INIT_CMD(0x00, 0xC7, 0xFF),
> +	_INIT_CMD(0x00, 0xC8, 0x39),
> +	_INIT_CMD(0x00, 0xC9, 0x44),
> +	_INIT_CMD(0x00, 0xCA, 0x12),
> +	_INIT_CMD(0x00, 0xCD, 0x80),
> +	_INIT_CMD(0x00, 0xDB, 0x80),
> +	_INIT_CMD(0x00, 0xDC, 0x80),
> +	_INIT_CMD(0x00, 0xDD, 0x80),
> +	_INIT_CMD(0x00, 0xE0, 0x80),
> +	_INIT_CMD(0x00, 0xE1, 0x80),
> +	_INIT_CMD(0x00, 0xE2, 0x80),
> +	_INIT_CMD(0x00, 0xE3, 0x80),
> +	_INIT_CMD(0x00, 0xE4, 0x80),
> +	_INIT_CMD(0x00, 0xE5, 0x40),
> +	_INIT_CMD(0x00, 0xE6, 0x40),
> +	_INIT_CMD(0x00, 0xE7, 0x40),
> +	_INIT_CMD(0x00, 0xE8, 0x40),
> +	_INIT_CMD(0x00, 0xE9, 0x40),
> +	_INIT_CMD(0x00, 0xEA, 0x40),
> +	_INIT_CMD(0x00, 0xEB, 0x40),
> +	_INIT_CMD(0x00, 0xEC, 0x40),
> +	_INIT_CMD(0x00, 0xED, 0x40),
> +	_INIT_CMD(0x00, 0xEE, 0x40),
> +	_INIT_CMD(0x00, 0xEF, 0x40),
> +	_INIT_CMD(0x00, 0xF0, 0x40),
> +	_INIT_CMD(0x00, 0xF1, 0x40),
> +	_INIT_CMD(0x00, 0xF2, 0x40),
> +	_INIT_CMD(0x00, 0xF3, 0x40),
> +	_INIT_CMD(0x00, 0xF4, 0x40),
> +	_INIT_CMD(0x00, 0xF5, 0x40),
> +	_INIT_CMD(0x00, 0xF6, 0x40),
> +	_INIT_CMD(0x00, 0xFB, 0x1),
> +	_INIT_CMD(0x00, 0xFF, 0x23),
> +	_INIT_CMD(0x00, 0xFB, 0x01),
> +	/* dimming enable */
> +	_INIT_CMD(0x00, 0x01, 0x84),
> +	_INIT_CMD(0x00, 0x05, 0x2D),
> +	_INIT_CMD(0x00, 0x06, 0x00),
> +	 /* resolution 1080*2246 */
> +	_INIT_CMD(0x00, 0x11, 0x01),
> +	_INIT_CMD(0x00, 0x12, 0x7B),
> +	_INIT_CMD(0x00, 0x15, 0x6F),
> +	_INIT_CMD(0x00, 0x16, 0x0B),
> +	 /* UI mode */
> +	_INIT_CMD(0x00, 0x29, 0x0A),
> +	_INIT_CMD(0x00, 0x30, 0xFF),
> +	_INIT_CMD(0x00, 0x31, 0xFF),
> +	_INIT_CMD(0x00, 0x32, 0xFF),
> +	_INIT_CMD(0x00, 0x33, 0xFF),
> +	_INIT_CMD(0x00, 0x34, 0xFF),
> +	_INIT_CMD(0x00, 0x35, 0xFF),
> +	_INIT_CMD(0x00, 0x36, 0xFF),
> +	_INIT_CMD(0x00, 0x37, 0xFF),
> +	_INIT_CMD(0x00, 0x38, 0xFC),
> +	_INIT_CMD(0x00, 0x39, 0xF8),
> +	_INIT_CMD(0x00, 0x3A, 0xF4),
> +	_INIT_CMD(0x00, 0x3B, 0xF1),
> +	_INIT_CMD(0x00, 0x3D, 0xEE),
> +	_INIT_CMD(0x00, 0x3F, 0xEB),
> +	_INIT_CMD(0x00, 0x40, 0xE8),
> +	_INIT_CMD(0x00, 0x41, 0xE5),
> +	 /* STILL mode */
> +	_INIT_CMD(0x00, 0x2A, 0x13),
> +	_INIT_CMD(0x00, 0x45, 0xFF),
> +	_INIT_CMD(0x00, 0x46, 0xFF),
> +	_INIT_CMD(0x00, 0x47, 0xFF),
> +	_INIT_CMD(0x00, 0x48, 0xFF),
> +	_INIT_CMD(0x00, 0x49, 0xFF),
> +	_INIT_CMD(0x00, 0x4A, 0xFF),
> +	_INIT_CMD(0x00, 0x4B, 0xFF),
> +	_INIT_CMD(0x00, 0x4C, 0xFF),
> +	_INIT_CMD(0x00, 0x4D, 0xED),
> +	_INIT_CMD(0x00, 0x4E, 0xD5),
> +	_INIT_CMD(0x00, 0x4F, 0xBF),
> +	_INIT_CMD(0x00, 0x50, 0xA6),
> +	_INIT_CMD(0x00, 0x51, 0x96),
> +	_INIT_CMD(0x00, 0x52, 0x86),
> +	_INIT_CMD(0x00, 0x53, 0x76),
> +	_INIT_CMD(0x00, 0x54, 0x66),
> +	 /* MOVING mode */
> +	_INIT_CMD(0x00, 0x2B, 0x0E),
> +	_INIT_CMD(0x00, 0x58, 0xFF),
> +	_INIT_CMD(0x00, 0x59, 0xFF),
> +	_INIT_CMD(0x00, 0x5A, 0xFF),
> +	_INIT_CMD(0x00, 0x5B, 0xFF),
> +	_INIT_CMD(0x00, 0x5C, 0xFF),
> +	_INIT_CMD(0x00, 0x5D, 0xFF),
> +	_INIT_CMD(0x00, 0x5E, 0xFF),
> +	_INIT_CMD(0x00, 0x5F, 0xFF),
> +	_INIT_CMD(0x00, 0x60, 0xF6),
> +	_INIT_CMD(0x00, 0x61, 0xEA),
> +	_INIT_CMD(0x00, 0x62, 0xE1),
> +	_INIT_CMD(0x00, 0x63, 0xD8),
> +	_INIT_CMD(0x00, 0x64, 0xCE),
> +	_INIT_CMD(0x00, 0x65, 0xC3),
> +	_INIT_CMD(0x00, 0x66, 0xBA),
> +	_INIT_CMD(0x00, 0x67, 0xB3),
> +	_INIT_CMD(0x00, 0xFF, 0x25),
> +	_INIT_CMD(0x00, 0xFB, 0x01),
> +	_INIT_CMD(0x00, 0x05, 0x04),
> +	_INIT_CMD(0x00, 0xFF, 0x26),
> +	_INIT_CMD(0x00, 0xFB, 0x01),
> +	_INIT_CMD(0x00, 0x1C, 0xAF),
> +	_INIT_CMD(0x00, 0xFF, 0x10),
> +	_INIT_CMD(0x00, 0xFB, 0x01),
> +	_INIT_CMD(0x00, 0x51, 0xFF),
> +	_INIT_CMD(0x00, 0x53, 0x24),
> +	_INIT_CMD(0x00, 0x55, 0x00),
> +
> +	{},
> +};
> +
> +static const struct panel_cmd tianma_fhd_video_on_cmds_2[] = {
> +	_INIT_CMD(0x00, 0xFF, 0x24),
> +	_INIT_CMD(0x00, 0xFB, 0x01),
> +	_INIT_CMD(0x00, 0xC3, 0x01),
> +	_INIT_CMD(0x00, 0xC4, 0x54),
> +	_INIT_CMD(0x00, 0xFF, 0x10),
> +
> +	{},
> +};
> +
> +static const struct panel_cmd tianma_fhd_video_off_cmds[] = {
> +	_INIT_CMD(0x00, 0xFF, 0x24),
> +	_INIT_CMD(0x00, 0xFB, 0x01),
> +	_INIT_CMD(0x00, 0xC3, 0x01),
> +	_INIT_CMD(0x00, 0xFF, 0x10),
> +
> +	{},
> +};
> +
> +static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
> +	.clock		= 161331,
> +
> +	.hdisplay	= 1080,
> +	.hsync_start	= 1080 + 40,
> +	.hsync_end	= 1080 + 40 + 20,
> +	.htotal		= 1080 + 40 + 20 + 44,
> +
> +	.vdisplay	= 2246,
> +	.vsync_start	= 2246 + 15,
> +	.vsync_end	= 2246 + 15 + 2,
> +	.vtotal		= 2246 + 15 + 2 + 8,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc tianma_fhd_video_panel_desc = {
> +	.display_mode = &tianma_fhd_video_panel_default_mode,
> +
> +	.width_mm = 68,
> +	.height_mm = 136,
> +
> +	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO
> +			| MIPI_DSI_MODE_VIDEO_HSE
> +			| MIPI_DSI_CLOCK_NON_CONTINUOUS
> +			| MIPI_DSI_MODE_VIDEO_BURST,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +	.on_cmds_1 = tianma_fhd_video_on_cmds_1,
> +	.on_cmds_2 = tianma_fhd_video_on_cmds_2,
> +	.off_cmds = tianma_fhd_video_off_cmds
> +};
> +
> +static int panel_add(struct panel_info *pinfo)

These function names could be made less generic.


Unifying the prefixes for the various functions in this driver would
be beneficial imho.

> +{
> +	struct device *dev = &pinfo->link->dev;
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
> +		pinfo->supplies[i].supply = regulator_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
> +				      pinfo->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

Given that you're driving reset low then leave it high in power_on it
seems reset is active low.

So while I expect this to work for you it would make logical sense to
reverse this and make the code in power_on() say "reset enable, wait,
reset disable" - and "reset enable" in power_off().

> +	if (IS_ERR(pinfo->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio),
> +				     "failed to get reset gpio from DT\n");
> +
> +	drm_panel_init(&pinfo->base, dev, &panel_funcs, DRM_MODE_CONNECTOR_DSI);
> +
> +	drm_panel_add(&pinfo->base);
> +
> +	return 0;
> +}
> +
> +static int panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct panel_info *pinfo;
> +	const struct panel_desc *desc;
> +	int err;
> +
> +	pinfo = devm_kzalloc(&dsi->dev, sizeof(*pinfo), GFP_KERNEL);
> +	if (!pinfo)
> +		return -ENOMEM;
> +
> +	desc = of_device_get_match_data(&dsi->dev);
> +	dsi->mode_flags = desc->mode_flags;
> +	dsi->format = desc->format;
> +	dsi->lanes = desc->lanes;
> +	pinfo->desc = desc;
> +	pinfo->link = dsi;
> +
> +	mipi_dsi_set_drvdata(dsi, pinfo);
> +
> +	err = panel_add(pinfo);
> +	if (err < 0)
> +		return err;
> +
> +	return mipi_dsi_attach(dsi);
> +}
> +
> +static int panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
> +	int err;
> +
> +	err = drm_panel_unprepare(&pinfo->base);
> +	if (err < 0)
> +		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
> +
> +	err = drm_panel_disable(&pinfo->base);
> +	if (err < 0)
> +		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
> +
> +	err = mipi_dsi_detach(dsi);
> +	if (err < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
> +
> +	drm_panel_remove(&pinfo->base);
> +
> +	return 0;
> +}
> +
> +static void panel_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
> +
> +	drm_panel_disable(&pinfo->base);
> +	drm_panel_unprepare(&pinfo->base);
> +}
> +
> +static const struct of_device_id tianma_fhd_video_of_match[] = {
> +	{ .compatible = "tianma,fhd-video",
> +	  .data = &tianma_fhd_video_panel_desc

You don't need to line break this.

> +	},
> +	{
> +		/* sentinel */

And you can omit this comment if you avoid the line breaks.

Regards,
Bjorn

> +	}
> +};
> +MODULE_DEVICE_TABLE(of, tianma_fhd_video_of_match);
> +
> +static struct mipi_dsi_driver panel_driver = {
> +	.driver = {
> +		.name = "panel-tianma-nt36672a",
> +		.of_match_table = tianma_fhd_video_of_match,
> +	},
> +	.probe = panel_probe,
> +	.remove = panel_remove,
> +	.shutdown = panel_shutdown,
> +};
> +module_mipi_dsi_driver(panel_driver);
> +
> +MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> +MODULE_DESCRIPTION("NOVATEK NT36672A based MIPI-DSI LCD panel driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
