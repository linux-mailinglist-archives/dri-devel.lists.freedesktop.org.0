Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461BA540B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 12:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C1F89B05;
	Mon,  2 Sep 2019 10:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0B189B05
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 10:32:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id y91so3270419ede.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 03:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LplRyjpTzN4QG523C6y5ZzQ9DxB0rDYvpV6qe3xa+F0=;
 b=latEb+LY5bm8lKfe1WkzyDKYZuOGyKF7vBgbCN17ZNhp23i87+AFMKnNGGGqUth0Fy
 9Pl/44n1EQR/fibmQnNDIJOsr5Rlsbek+9dwyKCfeIWZ2ThU58FZ6ryph05P1tCMOOJQ
 t6TigP03M3sCRmMRb3KjW1FtzKbW6duEsZq6k1L6JyZAMfY0lPZyWgO3YCCeLAGtLdyy
 JTAdajHS1Wi6a2n45KC0Wd+Qg7S+cCPnB687LGoefqWFVeTKpF4uvnCinB8qF0jGYEwC
 akMma7zzHbfsQeJYJ2paZEyHJOZw55JrxwtUdVll4F2CnFsT/pN06M6wuHD+PWdV7rRn
 Uf3Q==
X-Gm-Message-State: APjAAAV0lcr8G9ca1U19h6lVAOeqZjCrGhb3m9zgAqsmx2PFLbqijkHD
 rPyx61gLs5e1McGEJIif8iI=
X-Google-Smtp-Source: APXvYqyCm4RhFobyCLpynbzZCDDt/55cW3iWJkEL7CCSKk9tH31u6MPmoESxbACSSGSfGqK6Mw76aw==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr5572880ejd.120.1567420342634; 
 Mon, 02 Sep 2019 03:32:22 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id l20sm502739ejq.68.2019.09.02.03.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 03:32:21 -0700 (PDT)
Date: Mon, 2 Sep 2019 12:32:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Sony ACX424AKP panel
Message-ID: <20190902103219.GB12946@ulmo>
References: <20190902090633.24239-1-linus.walleij@linaro.org>
 <20190902090633.24239-2-linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190902090633.24239-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LplRyjpTzN4QG523C6y5ZzQ9DxB0rDYvpV6qe3xa+F0=;
 b=E9ICqAmbdAQBOYTWWZoyOEAFYawNaiCxwXa77oKAtZUBHGdt/6hyd/Ug73QO7mMlkt
 kepYwMB7nBCMQ3OFmEzH1Bq0kvcjE5VUGRRD3W53TgAoyr5PhwnFjGwGijpFXySjKsn0
 TEEOdg1lzOshxg3jRCvM2xQRI8gYTUDins0dvH29+XmhCdn/kDaXexcaQdRs95jsGZr9
 saKcSgeGGMvXsv6cTaYSJqdWtejKWs0IgYeWsPVSPV6Raz/fXnwbmkRr4MkL0kCy27k8
 7JchPDY+YIVGt/baIHjDz5w7l1Nzxe+RL+htvm6ImhNQ31Hy6uTbrPnqD1PEK07A1oOi
 gYsg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1869879971=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1869879971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 11:06:33AM +0200, Linus Walleij wrote:
> The Sony ACX424AKP is a command/videomode DSI panel for
> mobile devices. It is used on the ST-Ericsson HREF520
> reference design. We support video mode by default, but
> it is possible to switch the panel into command mode
> by using the bool property "dsi-command-mode".
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                |   7 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c | 530 +++++++++++++++++++
>  3 files changed, 538 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-sony-acx424akp.c
>=20
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d9d931aa6e26..435388a874e2 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -275,6 +275,13 @@ config DRM_PANEL_SITRONIX_ST7789V
>  	  Say Y here if you want to enable support for the Sitronix
>  	  ST7789V controller for 240x320 LCD panels
> =20
> +config DRM_PANEL_SONY_ACX424AKP
> +	tristate "Sony ACX424AKP DSI command mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +
>  config DRM_PANEL_TPO_TPG110
>  	tristate "TPO TPG 800x400 panel"
>  	depends on OF && SPI && GPIOLIB
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index fb0cb3aaa9e6..9ed4d853267e 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -28,5 +28,6 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sh=
arp-lq101r1sx01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043t1le01.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) +=3D panel-sitronix-st7701.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) +=3D panel-sitronix-st7789v.o
> +obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) +=3D panel-sony-acx424akp.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) +=3D panel-tpo-tpg110.o
>  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) +=3D panel-truly-nt35597.o
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/d=
rm/panel/panel-sony-acx424akp.c
> new file mode 100644
> index 000000000000..807560d2a8ec
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -0,0 +1,530 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * MIPI-DSI Sony ACX424AKP panel driver. This is a 480x864
> + * AMOLED panel with a command-only DSI interface.
> + *
> + * Copyright (C) Linaro Ltd. 2019
> + * Author: Linus Walleij
> + * Based on code and know-how from Marcus Lorentzon
> + * Copyright (C) ST-Ericsson SA 2010
> + */
> +
> +#include <drm/drm_modes.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <video/mipi_display.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <linux/module.h>
> +#include <linux/backlight.h>
> +
> +/* FIXME: move to <video/mipi_display.h> ? */
> +#define MIPI_DSI_DCS_SET_MDDI 0xAE
> +
> +#define DISPLAY_SONY_ACX424AKP_ID1	0x1b81
> +#define DISPLAY_SONY_ACX424AKP_ID2	0x1a81
> +#define DISPLAY_SONY_ACX424AKP_ID3	0x0080
> +
> +struct acx424akp {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct backlight_device *bl;
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +	u16 id;
> +	bool video_mode;
> +};
> +
> +static const struct drm_display_mode sony_acx424akp_vid_mode =3D {
> +	.clock =3D 330000,
> +	.hdisplay =3D 480,
> +	.hsync_start =3D 480 + 15,
> +	.hsync_end =3D 480 + 15 + 0,
> +	.htotal =3D 480 + 15 + 0 + 15,
> +	.vdisplay =3D 864,
> +	.vsync_start =3D 864 + 14,
> +	.vsync_end =3D 864 + 14 + 1,
> +	.vtotal =3D 864 + 14 + 1 + 11,
> +	.vrefresh =3D 60,
> +	.width_mm =3D 48,
> +	.height_mm =3D 84,
> +	.flags =3D DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +/*
> + * The timings are not very helpful as the display is used in
> + * command mode.
> + */
> +static const struct drm_display_mode sony_acx424akp_cmd_mode =3D {
> +	/* HS clock, (htotal*vtotal*vrefresh)/1000 */
> +	.clock =3D 420160,
> +	.hdisplay =3D 480,
> +	.hsync_start =3D 480 + 154,
> +	.hsync_end =3D 480 + 154 + 16,
> +	.htotal =3D 480 + 154 + 16 + 32,
> +	.vdisplay =3D 864,
> +	.vsync_start =3D 864 + 1,
> +	.vsync_end =3D 864 + 1 + 1,
> +	.vtotal =3D 864 + 1 + 1 + 1,
> +	/*
> +	 * This depends on the clocking HS vs LP rate, this value
> +	 * is calculated as:
> +	 * vrefresh =3D (clock * 1000) / (htotal*vtotal)
> +	 */
> +	.vrefresh =3D 816,

That's a bit odd. My understanding is that command mode can be done in
continuous mode or in non-continuous mode. In continuous mode you would
typically achieve a similar refresh rate as in video mode. For non-
continuous mode you basically have a variable refresh rate.

For continuous mode you probably want 60 Hz here and for VRR there's
probably no sensible value to set this to. In the latter case, I don't
think it makes sense to set anything arbitrary like you have above.
Perhaps better to just set it to 0 as a way of signalling that this is
actually dependent on when the display hardware sends a new frame?

Have you actually run this is command mode? If so, what's the actual
refresh rate? Do you do on-demand updates or do you run in continuous
mode?

> +	.width_mm =3D 48,
> +	.height_mm =3D 84,
> +};
> +
> +static inline struct acx424akp *panel_to_acx424akp(struct drm_panel *pan=
el)
> +{
> +	return container_of(panel, struct acx424akp, panel);
> +}
> +
> +#define FOSC			20 /* 20Mhz */
> +#define SCALE_FACTOR_NS_DIV_MHZ	1000
> +
> +static int acx424akp_set_brightness(struct backlight_device *bl)
> +{
> +	struct acx424akp *acx =3D bl_get_data(bl);
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(acx->dev);
> +	int period_ns =3D 1023;
> +	int duty_ns =3D bl->props.brightness;
> +	u8 pwm_ratio;
> +	u8 pwm_div;
> +	u8 par;
> +	int ret;
> +
> +	/* Calculate the PWM duty cycle in n/256's */
> +	pwm_ratio =3D max(((duty_ns * 256) / period_ns) - 1, 1);
> +	pwm_div =3D max(1,
> +		      ((FOSC * period_ns) / 256) /
> +		      SCALE_FACTOR_NS_DIV_MHZ);
> +
> +	/* Set up PWM dutycycle ONE byte (differs from the standard) */
> +	DRM_DEV_DEBUG(acx->dev, "calculated duty cycle %02x\n", pwm_ratio);
> +	ret =3D mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +				 &pwm_ratio, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to set display PWM ratio (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Sequence to write PWMDIV:
> +	 *	address		data
> +	 *	0xF3		0xAA   CMD2 Unlock
> +	 *	0x00		0x01   Enter CMD2 page 0
> +	 *	0X7D		0x01   No reload MTP of CMD2 P1
> +	 *	0x22		PWMDIV
> +	 *	0x7F		0xAA   CMD2 page 1 lock
> +	 */
> +	par =3D 0xaa;
> +	ret =3D mipi_dsi_dcs_write(dsi, 0xf3, &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to unlock CMD 2 (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	par =3D 0x01;
> +	ret =3D mipi_dsi_dcs_write(dsi, 0x00, &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to enter page 1 (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	par =3D 0x01;
> +	ret =3D mipi_dsi_dcs_write(dsi, 0x7d, &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to disable MTP reload (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	ret =3D mipi_dsi_dcs_write(dsi, 0x22, &pwm_div, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to set PWM divisor (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	par =3D 0xaa;
> +	ret =3D mipi_dsi_dcs_write(dsi, 0x7f, &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to lock CMD 2 (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	/* Enable backlight */
> +	par =3D 0x24;
> +	ret =3D mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				 &par, 1);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to enable display backlight (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops acx424akp_bl_ops =3D {
> +	.update_status =3D acx424akp_set_brightness,
> +};
> +
> +static int acx424akp_read_id(struct acx424akp *acx)
> +{
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(acx->dev);
> +	u8 id1, id2, id3;
> +	u16 val;
> +	size_t len;
> +	int ret;
> +
> +	len =3D 1;
> +
> +	ret =3D mipi_dsi_dcs_read(dsi, 0xda, &id1, len);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not read device ID byte 1\n");
> +		return ret;
> +	}
> +	ret =3D mipi_dsi_dcs_read(dsi, 0xdb, &id2, len);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not read device ID byte 2\n");
> +		return ret;
> +	}
> +	ret =3D mipi_dsi_dcs_read(dsi, 0xdc, &id3, len);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "could not read device ID byte 3\n");
> +		return ret;
> +	}
> +
> +	val =3D (id3 << 8) | id2;

Don't you want to OR in id1 here as well? Seems a bit odd to read it but
then not use it.

> +
> +	switch (val) {
> +	case DISPLAY_SONY_ACX424AKP_ID1:
> +	case DISPLAY_SONY_ACX424AKP_ID2:
> +	case DISPLAY_SONY_ACX424AKP_ID3:
> +		DRM_DEV_INFO(acx->dev, "panel ID: %04x\n", val);
> +		break;
> +	default:
> +		DRM_DEV_ERROR(acx->dev, "unknown panel ID: %04x\n", val);
> +		break;
> +	};
> +	acx->id =3D val;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_power_on(struct acx424akp *acx)
> +{
> +	int ret;
> +
> +	ret =3D regulator_enable(acx->supply);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to enable supply (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Assert RESET */
> +	gpiod_set_value_cansleep(acx->reset_gpio, 1);
> +	udelay(20);
> +	/* De-assert RESET */
> +	gpiod_set_value_cansleep(acx->reset_gpio, 0);
> +	msleep(11);
> +
> +	return 0;
> +}
> +
> +static int acx424akp_prepare(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx =3D panel_to_acx424akp(panel);
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(acx->dev);
> +	const u8 mddi =3D 3;
> +	int ret;
> +
> +	ret =3D acx424akp_power_on(acx);
> +	if (ret)
> +		return ret;
> +
> +	/* Enabe tearing mode: send TE (tearing effect) at VBLANK */
> +	ret =3D mipi_dsi_dcs_set_tear_on(dsi,
> +				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to enable vblank TE (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	/* Set MDDI - doesn't seem to work? */
> +	ret =3D mipi_dsi_dcs_write(dsi, MIPI_DSI_DCS_SET_MDDI,
> +				 &mddi, sizeof(mddi));
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(acx->dev, "failed to set MDDI (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	acx->bl->props.power =3D FB_BLANK_NORMAL;
> +
> +	return 0;
> +}
> +
> +static void acx424akp_power_off(struct acx424akp *acx)
> +{
> +	/* Assert RESET */
> +	gpiod_set_value_cansleep(acx->reset_gpio, 1);
> +	msleep(11);
> +
> +	regulator_disable(acx->supply);
> +}
> +
> +static int acx424akp_unprepare(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx =3D panel_to_acx424akp(panel);
> +
> +	acx424akp_power_off(acx);
> +	acx->bl->props.power =3D FB_BLANK_POWERDOWN;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_enable(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx =3D panel_to_acx424akp(panel);
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(acx->dev);
> +	int ret;
> +
> +	/* Exit sleep mode */
> +	ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to exit sleep mode (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	msleep(140);
> +
> +	ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to turn display on (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	if (acx->video_mode) {
> +		/* In video mode turn peripheral on */
> +		ret =3D mipi_dsi_turn_on_peripheral(dsi);
> +		if (ret) {
> +			dev_err(acx->dev, "failed to turn on peripheral\n");
> +			return ret;
> +		}
> +	}
> +
> +	acx->bl->props.power =3D FB_BLANK_UNBLANK;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_disable(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx =3D panel_to_acx424akp(panel);
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(acx->dev);
> +	u8 par;
> +	int ret;
> +
> +	/* Disable backlight */
> +	par =3D 0x00;
> +	ret =3D mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				 &par, 1);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev,
> +			      "failed to disable display backlight (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	ret =3D mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to turn display off (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	/* Enter sleep mode */
> +	ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret) {
> +		DRM_DEV_ERROR(acx->dev, "failed to enter sleep mode (%d)\n",
> +			      ret);
> +		return ret;
> +	}
> +	msleep(85);
> +
> +	acx->bl->props.power =3D FB_BLANK_NORMAL;
> +
> +	return 0;
> +}
> +
> +static int acx424akp_get_modes(struct drm_panel *panel)
> +{
> +	struct acx424akp *acx =3D panel_to_acx424akp(panel);
> +	struct drm_connector *connector =3D panel->connector;
> +	struct drm_display_mode *mode;
> +
> +	if (acx->video_mode)
> +		mode =3D drm_mode_duplicate(panel->drm,
> +					  &sony_acx424akp_vid_mode);
> +	else
> +		mode =3D drm_mode_duplicate(panel->drm,
> +					  &sony_acx424akp_cmd_mode);
> +	if (!mode) {
> +		DRM_ERROR("bad mode or failed to add mode\n");
> +		return -EINVAL;
> +	}
> +	drm_mode_set_name(mode);
> +	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +
> +	connector->display_info.width_mm =3D mode->width_mm;
> +	connector->display_info.height_mm =3D mode->height_mm;
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1; /* Number of modes */
> +}
> +
> +static const struct drm_panel_funcs acx424akp_drm_funcs =3D {
> +	.disable =3D acx424akp_disable,
> +	.unprepare =3D acx424akp_unprepare,
> +	.prepare =3D acx424akp_prepare,
> +	.enable =3D acx424akp_enable,
> +	.get_modes =3D acx424akp_get_modes,
> +};
> +
> +static int acx424akp_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct acx424akp *acx;
> +	int ret;
> +	int i;

unsigned int?

> +
> +	acx =3D devm_kzalloc(dev, sizeof(struct acx424akp), GFP_KERNEL);
> +	if (!acx)
> +		return -ENOMEM;
> +	acx->video_mode =3D !of_property_read_bool(dev->of_node,
> +						 "dsi-command-mode");
> +
> +	mipi_dsi_set_drvdata(dsi, acx);
> +	acx->dev =3D dev;
> +
> +	dsi->lanes =3D 2;
> +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> +	dsi->hs_rate =3D 420160000;
> +	dsi->lp_rate =3D 19200000;
> +
> +	if (acx->video_mode)
> +		dsi->mode_flags =3D
> +			MIPI_DSI_MODE_VIDEO |
> +			MIPI_DSI_MODE_VIDEO_BURST |
> +			MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +	else
> +		dsi->mode_flags =3D
> +			MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			MIPI_DSI_MODE_EOT_PACKET;
> +
> +

Gratuituous blank line.

> +	acx->supply =3D devm_regulator_get(dev, "vddi");
> +	if (IS_ERR(acx->supply))
> +		return PTR_ERR(acx->supply);
> +
> +	/* This asserts RESET by default */
> +	acx->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> +						 GPIOD_OUT_HIGH);
> +	if (IS_ERR(acx->reset_gpio)) {
> +		ret =3D PTR_ERR(acx->reset_gpio);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to request GPIO (%d)\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	drm_panel_init(&acx->panel);
> +	acx->panel.dev =3D dev;
> +	acx->panel.funcs =3D &acx424akp_drm_funcs;
> +
> +	acx->bl =3D devm_backlight_device_register(dev, "acx424akp", dev, acx,
> +						 &acx424akp_bl_ops, NULL);
> +	if (IS_ERR(acx->bl)) {
> +		DRM_DEV_ERROR(dev, "failed to register backlight device\n");
> +		return PTR_ERR(acx->bl);
> +	}
> +	acx->bl->props.max_brightness =3D 1023;
> +	acx->bl->props.brightness =3D 512;
> +	acx->bl->props.power =3D FB_BLANK_POWERDOWN;
> +
> +	ret =3D drm_panel_add(&acx->panel);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D acx424akp_power_on(acx);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to power up display\n");
> +		return ret;
> +	}
> +
> +	/* Read device ID */
> +	i =3D 0;
> +	do {
> +		ret =3D acx424akp_read_id(acx);
> +		if (ret)
> +			continue;
> +	} while (ret && i++ < 5);

Seems rather redundant to have both an "if (ret) continue;" and the ret
check in the while's condition. A more idiomatic way to write this would
be:

	for (i =3D 0; i < 5; i++) {
		ret =3D acx424akp_read_id(acx);
		if (!ret)
			break;
	}

Thierry

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s77AACgkQ3SOs138+
s6Fm2g/+JL826MGJMmonVkbdPy/1yE324pR1P0yvekNL13XaigjCGNqgilW5gx78
cInm2nhzOXzhG87YGSZlbJM6S7kTrAJ1IQzmDCeEX5EAF9SgMzTQHWtQn8BmuPsy
07LmJyRALrjM604gz5rEVsyTnYFaeDJhLQnjrUw9OP0wkMAuXyrDPa/XlXJ6nDVU
Uu1O/i2T2RFAkrp9djPXpdCXix62gjZ9C7x2cfnIPqmC24R1q4KfsPmsznjuo+Pq
nM8r8nOiCUGViIIGEL3nQGVL7RF78CfOVNFpCfmAFTVD2nJERoN/skHIgEleU+eq
92hReu09xE4D0V2FKRSdURN+GdDPCjQksXRS5MgJIFQzlFraShHkMfOPyeBY9Xlz
EkUPt1Q62KtZPED0znf+xBzSUDIYGQKqoWoQmCVBHY7v52yc5KkC0qNJAIC52JN8
fMlV2NTogvs0w3Hi5aQXsCQftcwhvqbzFnhZxvOHDmPPNhhoOT2udR/jS7VrPwq7
+2YNoZQT2DyWoQlqp7LcbzQLZZDmI0UX+7paTqMdMnajYz/vMjOeXZgClyujEhoN
YTk18HZLG4syyV47J/lVUddhvLOg2E+1uzBZ5HOyNmqC2iDrPJLR9B7KpaK0daA6
PTNTgDJsG57ibQo2aGa4XcbXhVP6kr8/7YJlg8M1zwb65Gq7saY=
=1vaq
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--

--===============1869879971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1869879971==--
