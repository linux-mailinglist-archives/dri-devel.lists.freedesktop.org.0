Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C7E579481
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 09:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E15F112C66;
	Tue, 19 Jul 2022 07:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE60112C5A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=C4F4WGBewy3IFDuXIs+84+5dLcBG0y+XHqQ3xY3zFrQ=;
 b=Px3xu8ZigB4DJj7DUssvr2bKp8MMUZFAyRrbsCkotYIugU39khbYbvecCSLoNC85qLIftP0JmBj6e
 VpKfrUoKtu6DaP6DuAVjoco3A+29rh5cW+noOc1giCdOvk/APBRAZqjBguA7Cj4DafnTmZPmBK+8HW
 7yrtcnWEsR8lbETeZhzYi/fhPrMDv3d9Y+iG47kR6OcqoTxnXRHc9Bad32pc69Gtv9m76GqD9dQvxg
 6Q0kmiuRxpiwyVH/jAIcCZGTkcisP60p37qOmpmd7Ysu8MPmBRZlPxNwd2+hI2A5GZcJl/GMidobvC
 qAQc7/Wvs4yYzqMRe2HHHI6s7hPYwrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=C4F4WGBewy3IFDuXIs+84+5dLcBG0y+XHqQ3xY3zFrQ=;
 b=0yhUG6sd7RShnC5L10c/b5jT0Yz3VVlgimcOQNk1D2CgVkhfspt4YccUBQ3XiM1spIkndM/cOks9G
 jXSSiOfCA==
X-HalOne-Cookie: c967bcf06dec7844145b72c8c1af2837e0281fa7
X-HalOne-ID: 2028499c-0737-11ed-823f-d0431ea8bb10
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 2028499c-0737-11ed-823f-d0431ea8bb10;
 Tue, 19 Jul 2022 07:48:06 +0000 (UTC)
Date: Tue, 19 Jul 2022 09:48:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 4/4] drm: panel: Add lg sw43408 panel driver
Message-ID: <YtZhtH/dhc2J7urb@ravnborg.org>
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-5-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718213051.1475108-5-caleb@connolly.tech>
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
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Caleb,

On Mon, Jul 18, 2022 at 10:30:51PM +0100, Caleb Connolly wrote:
> From: Sumit Semwal <sumit.semwal@linaro.org>
> 
> LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel, used in some Pixel3
> phones.

Thanks for submitting this.

When reading the code it is obvious that this was based on an older
panel and there is a few things to improve to get it on on same level as
the other panel drivers today.

I will comment in the following.

	Sam

> 
> Whatever init sequence we have for this panel isn't capable of
> initialising it completely, toggling the reset gpio ever causes the
> panel to die. Until this is resolved we avoid resetting the panel. The
> disable/unprepare functions only put the panel to sleep mode and
> disable the backlight.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> [vinod: Add DSC support]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> [caleb: cleanup and support turning off the panel]
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  MAINTAINERS                              |   8 +
>  drivers/gpu/drm/panel/Kconfig            |  11 +
>  drivers/gpu/drm/panel/Makefile           |   1 +
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 586 +++++++++++++++++++++++
>  4 files changed, 606 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43408.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f679152bdbad..8a2b954ad140 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6376,6 +6376,14 @@ S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/i810/
>  F:	include/uapi/drm/i810_drm.h
>  
> +DRM DRIVER FOR LG SW43408 PANELS
> +M:	Sumit Semwal <sumit.semwal@linaro.org>
> +M:	Caleb Connolly <caleb@connolly.tech>
> +S:	Maintained
m +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/lg,sw43408-panel.txt
> +F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
> +
>  DRM DRIVER FOR LVDS PANELS
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 38799effd00a..706b112794b9 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -256,6 +256,17 @@ config DRM_PANEL_LEADTEK_LTK500HD1829
>  	  24 bit RGB per pixel. It provides a MIPI DSI interface to
>  	  the host and has a built-in LED backlight.
>  
> +config DRM_PANEL_LG_SW43408
> +	tristate "LG SW43408 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for LG sw43408 panel.
> +	  The panel has a 1080x2160 resolution and uses
> +	  24 bit RGB per pixel. It provides a MIPI DSI interface to
> +	  the host and has a built-in LED backlight.
> +

Hrmpf, the DRM_PANEL_SAMSUNG_LD9040 config entry is not placed in
alphabetic order. Can you move it or put you config optiosn with the
other LG config options?

>  config DRM_PANEL_SAMSUNG_LD9040
>  	tristate "Samsung LD9040 RGB/SPI panel"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 42a7ab54234b..ba26a69b74e7 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
>  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
> +obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> new file mode 100644
> index 000000000000..c7b8ec7b970d
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -0,0 +1,586 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Linaro Ltd
Update to 2022?

> + * Author: Sumit Semwal <sumit.semwal@linaro.org>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct panel_cmd {
> +	size_t len;
> +	const char *data;
> +};
> +
> +#define _INIT_CMD(...)                                                   \
> +	{                                                                \
> +		.len = sizeof((char[]){ __VA_ARGS__ }), .data = (char[]) \
> +		{                                                        \
> +			__VA_ARGS__                                      \
> +		}                                                        \
> +	}
Other panel drivers do:
#define _INIT_DCS_CMD(...) { \
        .type = INIT_DCS_CMD, \
        .len = sizeof((char[]){__VA_ARGS__}), \
        .data = (char[]){__VA_ARGS__} }

See for example panel-boe-tv101wum-nl6.c
This makes the init sequences a tad more readable.


> +
> +static const char *const regulator_names[] = {
> +	"vddi",
> +	"vpnl",
> +};
> +
> +static const unsigned long regulator_enable_loads[] = {
> +	62000,
> +	857000,
> +};
> +
> +static const unsigned long regulator_disable_loads[] = {
> +	80,
> +	0,
> +};
> +
> +struct sw43408_panel {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *link;
This is often named "dsi"

> +
> +	const struct drm_display_mode *mode;
> +	struct backlight_device *backlight;
Unless there are specific needs, use the drm_panel provided backlight.

> +
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static const struct panel_cmd lg_sw43408_on_cmds_1[] = {
> +	_INIT_CMD(0x00, 0x53, 0x0C, 0x30),
> +	_INIT_CMD(0x00, 0x55, 0x00, 0x70, 0xDF, 0x00, 0x70, 0xDF),
> +	_INIT_CMD(0x00, 0xF7, 0x01, 0x49, 0x0C),
> +
> +	{},
> +};
> +
> +static const struct panel_cmd lg_sw43408_on_cmds_2[] = {
> +	_INIT_CMD(0x00, 0xB0, 0xAC),
> +	_INIT_CMD(0x00, 0xCD, 0x00, 0x00, 0x00, 0x19, 0x19, 0x19, 0x19, 0x19,
> +		  0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x16, 0x16),
> +	_INIT_CMD(0x00, 0xCB, 0x80, 0x5C, 0x07, 0x03, 0x28),
> +	_INIT_CMD(0x00, 0xC0, 0x02, 0x02, 0x0F),
> +	_INIT_CMD(0x00, 0xE5, 0x00, 0x3A, 0x00, 0x3A, 0x00, 0x0E, 0x10),
> +	_INIT_CMD(0x00, 0xB5, 0x75, 0x60, 0x2D, 0x5D, 0x80, 0x00, 0x0A, 0x0B,
> +		  0x00, 0x05, 0x0B, 0x00, 0x80, 0x0D, 0x0E, 0x40, 0x00, 0x0C,
> +		  0x00, 0x16, 0x00, 0xB8, 0x00, 0x80, 0x0D, 0x0E, 0x40, 0x00,
> +		  0x0C, 0x00, 0x16, 0x00, 0xB8, 0x00, 0x81, 0x00, 0x03, 0x03,
> +		  0x03, 0x01, 0x01),
> +	_INIT_CMD(0x00, 0x55, 0x04, 0x61, 0xDB, 0x04, 0x70, 0xDB),
> +	_INIT_CMD(0x00, 0xB0, 0xCA),
> +
> +	{},
> +};
> +
> +static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct sw43408_panel, base);
> +}
> +
> +/*
> + * Currently unable to bring up the panel after resetting, must be missing
> + * some init commands somewhere.
> + */
> +static __always_unused int panel_reset(struct sw43408_panel *ctx)
> +{
> +	int ret = 0, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> +		ret = regulator_set_load(ctx->supplies[i].consumer,
> +					 regulator_enable_loads[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> +		ret = regulator_set_load(ctx->supplies[i].consumer,
> +					 regulator_disable_loads[i]);
> +		if (ret) {
> +			DRM_DEV_ERROR(ctx->base.dev,
> +				      "regulator_set_load failed %d\n", ret);
panels do not use DRM_DEV_ERROR() these days. Use dev_err() or pr_err().

> +			return ret;
> +		}
> +	}
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +
> +	return 0;
> +}
> +
> +static int send_mipi_cmds(struct drm_panel *panel, const struct panel_cmd *cmds)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	unsigned int i = 0;
> +	int err;
> +
> +	if (!cmds)
> +		return -EFAULT;
> +
> +	for (i = 0; cmds[i].len != 0; i++) {
> +		const struct panel_cmd *cmd = &cmds[i];
> +
> +		if (cmd->len == 2)
> +			err = mipi_dsi_dcs_write(ctx->link, cmd->data[1], NULL,
> +						 0);
Do not wrap lines like this, up to 100 chars is ok.

There is no use of len == 2 - as there is none with this length. Maybe
error out there is one as this is likely a bug?

> +		else
> +			err = mipi_dsi_dcs_write(ctx->link, cmd->data[1],
> +						 cmd->data + 2, cmd->len - 2);
> +
Consider to use mipi_dsi_dcs_write_buffer

> +		if (err < 0)
> +			return err;
> +
> +		usleep_range((cmd->data[0]) * 1000, (1 + cmd->data[0]) * 1000);
So there is always a usleep_range(0, 1000) after each write - is this
really required?
Also, it is non-obvious that the first byte in the arry is a delay
parameter, this can be done better. See panel-boe-tv101wum-nl6.c as one
example - there may be betters ways to do it.

> +	}
> +
> +	return 0;
> +}
> +
> +static int lg_panel_disable(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +
> +	backlight_disable(ctx->backlight);
> +	ctx->enabled = false;
> +
> +	return 0;
> +}
Let drm_panel handle backlight, then you can drop the disable method.

> +
> +/*
> + * We can't currently re-initialise the panel properly after powering off.
> + * This function will be used when this is resolved.
> + */
> +static __always_unused int lg_panel_power_off(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	int i, ret = 0;
> +
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> +		ret = regulator_set_load(ctx->supplies[i].consumer,
> +					 regulator_disable_loads[i]);
> +		if (ret) {
> +			DRM_DEV_ERROR(panel->dev,
> +				      "regulator_set_load failed %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret) {
> +		DRM_DEV_ERROR(panel->dev, "regulator_bulk_disable failed %d\n",
> +			      ret);
> +	}
> +	return ret;
> +}
> +
> +static int lg_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	int ret, i;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = mipi_dsi_dcs_set_display_off(ctx->link);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(panel->dev,
> +			      "set_display_off cmd failed ret = %d\n", ret);
> +	}
> +
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->link);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(panel->dev, "enter_sleep cmd failed ret = %d\n",
> +			      ret);
> +	}
> +
> +	/* Would call panel_power_off() */
And please do so.
If the reset code is not OK then comment it out in power_off(),
but do not duplicate all the regulator handling - it is very confusing
to read.
Same with the other commented out functions.

I did not look at the unprepare code - this will wait until next
iteration of the driver where the power supply stuff is cleaned up.

> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> +		ret = regulator_set_load(ctx->supplies[i].consumer,
> +					 regulator_disable_loads[i]);
> +		if (ret) {
> +			DRM_DEV_ERROR(panel->dev,
> +				      "regulator_set_load failed %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ctx->prepared = false;
> +
> +	return ret;
> +}
> +
> +static int lg_panel_prepare(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	int err, i;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	/* Would call panel_reset() */
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> +		err = regulator_set_load(ctx->supplies[i].consumer,
> +					 regulator_enable_loads[i]);
> +		if (err)
> +			return err;
> +	}
> +
> +	err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (err < 0)
> +		return err;
> +
> +	usleep_range(9000, 10000);
> +
> +	err = mipi_dsi_dcs_write(ctx->link, MIPI_DCS_SET_GAMMA_CURVE,
> +				 (u8[]){ 0x02 }, 1);
> +	if (err < 0) {
> +		DRM_DEV_ERROR(panel->dev, "failed to set gamma curve: %d\n",
> +			      err);
> +		goto poweroff;
> +	}
> +
> +	err = mipi_dsi_dcs_set_tear_on(ctx->link,
> +				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (err < 0) {
> +		DRM_DEV_ERROR(panel->dev, "failed to set tear on: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	err = send_mipi_cmds(panel, &lg_sw43408_on_cmds_1[0]);
> +
> +	if (err < 0) {
> +		DRM_DEV_ERROR(panel->dev,
> +			      "failed to send DCS Init 1st Code: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	err = mipi_dsi_dcs_exit_sleep_mode(ctx->link);
> +	if (err < 0) {
> +		DRM_DEV_ERROR(panel->dev, "failed to exit sleep mode: %d\n",
> +			      err);
> +		goto poweroff;
> +	}
> +
> +	msleep(135);
> +
> +	err = mipi_dsi_dcs_write(ctx->link, MIPI_DSI_COMPRESSION_MODE,
> +				 (u8[]){ 0x11 }, 0);
> +	if (err < 0) {
> +		DRM_DEV_ERROR(panel->dev,
> +			      "failed to set compression mode: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	err = send_mipi_cmds(panel, &lg_sw43408_on_cmds_2[0]);
> +
> +	if (err < 0) {
> +		DRM_DEV_ERROR(panel->dev,
> +			      "failed to send DCS Init 2nd Code: %d\n", err);
> +		goto poweroff;
> +	}
> +
> +	err = mipi_dsi_dcs_set_display_on(ctx->link);
> +	if (err < 0) {
> +		DRM_DEV_ERROR(panel->dev, "failed to Set Display ON: %d\n",
> +			      err);
> +		goto poweroff;
> +	}
> +
> +	msleep(120);
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +
> +poweroff:
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	return err;
> +}
> +
> +static int lg_panel_enable(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	if (ctx->enabled)
> +		return 0;
> +
> +	ret = backlight_enable(ctx->backlight);
> +	if (ret) {
> +		DRM_DEV_ERROR(panel->dev, "Failed to enable backlight %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	if (!panel->dsc) {
> +		DRM_DEV_ERROR(panel->dev, "Can't find DSC\n");
> +		return -ENODEV;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, panel->dsc);
There is nothing in disable about pps_payload - so they are not
symmetrical. Check if this is OK.

> +
> +	ctx->enabled = true;
> +
> +	return 0;
> +}
> +
> +static int lg_panel_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	const struct drm_display_mode *m = ctx->mode;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, m);
> +	if (!mode) {
> +		DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%u\n",
> +			      m->hdisplay, m->vdisplay);
> +		return -ENOMEM;
> +	}
> +
> +	connector->display_info.width_mm = m->width_mm;
> +	connector->display_info.height_mm = m->height_mm;
> +
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static int lg_panel_backlight_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	int ret = 0;
> +	uint16_t brightness;
> +
> +	brightness = (uint16_t)backlight_get_brightness(bl);
> +	/* Brightness is sent in big-endian */
> +	brightness = cpu_to_be16(brightness);
This cpu_to_be16() looks wrong - the mipi_dsi_dcs_set_display_brightness() takes care.


> +
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +	return ret;
> +}
> +
> +static int lg_panel_backlight_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	int ret = 0;
> +	u16 brightness = 0;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	return brightness & 0xff;
The truncation to 8 bit is not needed unless the HW is buggy.
And since the brightness value is not adjusted, there is no need to add
the get_brightness() method, it will just return what was written
earlier anyway. Most panels get away without it.

> +}
> +
> +const struct backlight_ops lg_panel_backlight_ops = {
> +	.update_status = lg_panel_backlight_update_status,
> +	.get_brightness = lg_panel_backlight_get_brightness,
> +};
> +
> +static int lg_panel_backlight_init(struct sw43408_panel *ctx)
> +{
> +	struct device *dev = &ctx->link->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_PLATFORM,
This is not a PLATFORM backlight, RAW it the right choice here.

> +		.brightness = 255,
> +		.max_brightness = 255,
Is 255 the correct max here? Check the HW specs.
> +	};
> +
> +	ctx->backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
> +							ctx->link,
> +							&lg_panel_backlight_ops,
> +							&props);
Use panel->backlight here.

> +
> +	if (IS_ERR(ctx->backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->backlight),
> +				     "Failed to create backlight\n");
> +
> +	return 0;
> +}
> +
> +static const struct drm_panel_funcs panel_funcs = {
> +	.disable = lg_panel_disable,
> +	.unprepare = lg_panel_unprepare,
> +	.prepare = lg_panel_prepare,
> +	.enable = lg_panel_enable,
> +	.get_modes = lg_panel_get_modes,
> +};
> +
> +static const struct drm_display_mode sw43408_default_mode = {
> +	.clock = 152340,
> +
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 20,
> +	.hsync_end = 1080 + 20 + 32,
> +	.htotal = 1080 + 20 + 32 + 20,
> +
> +	.vdisplay = 2160,
> +	.vsync_start = 2160 + 20,
> +	.vsync_end = 2160 + 20 + 4,
> +	.vtotal = 2160 + 20 + 4 + 20,
> +
> +	.width_mm = 62,
> +	.height_mm = 124,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct of_device_id panel_of_match[] = {
> +	{ .compatible = "lg,sw43408", .data = &sw43408_default_mode },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, panel_of_match);
> +
> +static int panel_add(struct sw43408_panel *ctx)
> +{
> +	struct device *dev = &ctx->link->dev;
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
> +		ctx->supplies[i].supply = regulator_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +			      PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
Use dev_err_probe() here.

> +
> +	ret = lg_panel_backlight_init(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_panel_init(&ctx->base, dev, &panel_funcs, DRM_MODE_CONNECTOR_DSI);
Init backlight after panel init.

> +
> +	drm_panel_add(&ctx->base);
> +	return ret;
> +}
> +
> +static int panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct sw43408_panel *ctx;
> +	struct drm_dsc_config *dsc;
> +	int err;
> +
> +	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->mode = of_device_get_match_data(&dsi->dev);
> +	dsi->mode_flags = MIPI_DSI_MODE_LPM;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->lanes = 4;
> +
> +	ctx->link = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	err = panel_add(ctx);
> +	if (err < 0)
> +		return err;
> +
> +	/* The panel is DSC panel only, set the dsc params */
> +	dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
> +	if (!dsc)
> +		return -ENOMEM;
The drm_dsc_config could be embedded in sw43408_panel, so there was not
two allocations to track but with devm_kzalloc this is not a big win.

> +
> +	dsc->dsc_version_major = 0x1;
> +	dsc->dsc_version_minor = 0x1;
> +
> +	dsc->slice_height = 16;
> +	dsc->slice_width = 540;
> +	dsc->slice_count = 1;
> +	dsc->bits_per_component = 8;
> +	dsc->bits_per_pixel = 8;
> +	dsc->block_pred_enable = true;
> +
> +	ctx->base.dsc = dsc;
> +
> +	return mipi_dsi_attach(dsi);
> +}
> +
> +static int panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int err;
> +
> +	err = lg_panel_unprepare(&ctx->base);
> +	if (err < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "failed to unprepare panel: %d\n",
> +			      err);
Use the drm_panel() functions here, do not call your own.
See for example: y030xx067a_remove()

> +
> +	err = lg_panel_disable(&ctx->base);
> +	if (err < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "failed to disable panel: %d\n", err);
> +
> +	err = mipi_dsi_detach(dsi);
> +	if (err < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "failed to detach from DSI host: %d\n",
> +			      err);
mipi_dsi_detach() is needed here.

> +
> +	if (ctx->base.dev)
No need to check, the pointer must be valid.
> +		drm_panel_remove(&ctx->base);
> +
> +	return 0;
> +}
> +
> +static struct mipi_dsi_driver panel_driver = {
> +	.driver = {
> +		.name = "panel-lg-sw43408",
> +		.of_match_table = panel_of_match,
> +	},
> +	.probe = panel_probe,
> +	.remove = panel_remove,
> +};
> +module_mipi_dsi_driver(panel_driver);
> +
> +MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> +MODULE_DESCRIPTION("LG SW436408 MIPI-DSI LED panel");
> +MODULE_LICENSE("GPL");
> -- 
> 2.36.1
