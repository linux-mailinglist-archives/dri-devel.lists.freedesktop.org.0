Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2443C2190
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 11:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD71C6E9F4;
	Fri,  9 Jul 2021 09:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5551A6E9F4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 09:25:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id cy23so7846252edb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MXMeDyz3BndGnqN7t0UJf7TFFNFt4AJs4LVerjbHIXc=;
 b=pTM/8Z7Wezx6bjNj/3DWusdzZZOYLwJzrwX9lcqnNvDCku37j8nIQd38hZsBVBjF8o
 UcRdaunwlJpS8cLn+l5mBhHmvkXBJzkYhUhyb/XXjxpIN9oS4P3n/V7VngvmPmRgmgXz
 jjIYY+1nXT2PtAC3HHaB91ht2JZaBuL6t6kvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MXMeDyz3BndGnqN7t0UJf7TFFNFt4AJs4LVerjbHIXc=;
 b=tjTU3h0mXeKJdVUXpaYYVjc/i68J5EIQcNUHtC+DpXDS1Hmu3FnXExJEOQSEZsHK63
 GEcf+hUKQ6rW+XWWX+APVxVjxHWhMkw1OSp9xsCNnnjhLgBiq2Isg+jdMpRJ+jwmi/JU
 +pkPQgUFpJnL0nVZ9tIf5PLdiBHiHbSC4b0SGGhTEBNzipsRsxmQ4Er9qk9ZSCxnd43V
 vpzSbocjGOC4F4RzWVpTBLgsld1GznPIY+nv6rmJijB7HWsoUczGrsEsHk0LNW+rL2Pj
 UPaEkow93uTtMqu3wBk06/gkoyJTLiwh2YB7c2l+zApKbfZ8R8Cyu94c3izXPCqc6PpW
 V/uw==
X-Gm-Message-State: AOAM531avhfp59JQlCSdPlE4XZ4lvOGMVLuvMkPCGs1fbnff76zPPwTJ
 gAR7iOUBz8pQJs4gIz5LKmYQl7xrBUcUq3cHPHRD7InQ/Lk=
X-Google-Smtp-Source: ABdhPJyoRrFaR/m6oIlAp6vuAJVXwh2IRlRcPAlYdtmjLcm3UkSaa+RNIS1eQnQpDPShhjy/tKD9yl8TZCqRoMxcOzI=
X-Received: by 2002:a05:6402:2815:: with SMTP id
 h21mr46692506ede.150.1625822745899; 
 Fri, 09 Jul 2021 02:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210707234315.242663-1-linus.walleij@linaro.org>
 <20210707234315.242663-2-linus.walleij@linaro.org>
In-Reply-To: <20210707234315.242663-2-linus.walleij@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 9 Jul 2021 14:55:34 +0530
Message-ID: <CAMty3ZCjciURnUJnTOPDQOSaiDVRneJoe=w9U==73Jt=Wd895w@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] drm/panel: ws2401: Add driver for WideChips WS2401
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 8, 2021 at 5:25 AM Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
> This adds a driver for panels based on the WideChips WS2401 display
> controller. This display controller is used in the Samsung LMS380KF01
> display found in the Samsung GT-I8160 (Codina) mobile phone and
> possibly others.
>
> As is common with Samsung displays manufacturer commands are necessary
> to configure the display to a working state.
>
> The display optionally supports internal backlight control, but can
> also use an external backlight.
>
> This driver re-uses the DBI infrastructure to communicate with the
> display.
>
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the ws2401_command() macro - we enhanced the
>   mipi_dbi_command() to print errors for everyone instead.
> - Read out MTP properly (used wrong variables)
> - Register internal backlight if and only if the panel->backlight
>   field is NULL after trying to look up external backlight.
> ChangeLog v1->v2:
> - Disable the backlight in ->unprepare() before entering sleep
>   mode.
> - If we are not using internal backlight, close the L2 access
>   after initializing.
> - Depromote some talkative dev_info()s to dev_dbg().
> - Power up and read the MTP values before we register the display.
>   This works fine and is probably how MTP is supposed to work.
> - Fix the set-up of gamma values, this was found in the GT-I8160 HD
>   kernel tree.
> - Bail out properly if drm_panel_of_backlight() returns
>   -EDEFER_PROBE.
> - Drop OF from dependencies since drm_panel_of_backlight() has
>   static inline stubs in the header file.
> - Sort MAINTAINERS properly.
> - Alphabetize includes
> - Use format specifier %#02x so we get 0x... output in debug
> - Drop unnecessary braces around if () in debug macro
> - Drop unused <of.h> include.
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-widechips-ws2401.c    | 436 ++++++++++++++++++
>  4 files changed, 453 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-widechips-ws2401.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..10bba4be1678 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5956,6 +5956,13 @@ T:       git git://people.freedesktop.org/~sroland=
/linux
>  F:     drivers/gpu/drm/vmwgfx/
>  F:     include/uapi/drm/vmwgfx_drm.h
>
> +DRM DRIVER FOR WIDECHIPS WS2401 PANELS
> +M:     Linus Walleij <linus.walleij@linaro.org>
> +S:     Maintained
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
> +F:     Documentation/devicetree/bindings/display/panel/samsung,lms380kf0=
1.yaml
> +F:     drivers/gpu/drm/panel/panel-widechips-ws2401.c
> +
>  DRM DRIVERS
>  M:     David Airlie <airlied@linux.ie>
>  M:     Daniel Vetter <daniel@ffwll.ch>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfi=
g
> index 4894913936e9..319fa44c4bc9 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -552,6 +552,15 @@ config DRM_PANEL_VISIONOX_RM69299
>           Say Y here if you want to enable support for Visionox
>           RM69299  DSI Video Mode panel.
>
> +config DRM_PANEL_WIDECHIPS_WS2401
> +       tristate "Widechips WS2401 DPI panel driver"
> +       depends on SPI && GPIOLIB
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       select DRM_MIPI_DBI
> +       help
> +         Say Y here if you want to enable support for the Widechips WS24=
01 DPI
> +         480x800 display controller used in panels such as Samsung LMS38=
0KF01.
> +
>  config DRM_PANEL_XINPENG_XPP055C272
>         tristate "Xinpeng XPP055C272 panel driver"
>         depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index cae4d976c069..d94c27df17aa 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -58,4 +58,5 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) +=3D panel-tpo-t=
d043mtea1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) +=3D panel-tpo-tpg110.o
>  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) +=3D panel-truly-nt35597.o
>  obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) +=3D panel-visionox-rm69299.o
> +obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) +=3D panel-widechips-ws2401.o
>  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) +=3D panel-xinpeng-xpp055c272=
.o
> diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu=
/drm/panel/panel-widechips-ws2401.c
> new file mode 100644
> index 000000000000..95825063f812
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panel driver for the WideChips WS2401 480x800 DPI RGB panel, used in
> + * the Samsung Mobile Display (SMD) LMS380KF01.
> + * Found in the Samsung Galaxy Ace 2 GT-I8160 mobile phone.
> + * Linus Walleij <linus.walleij@linaro.org>
> + * Inspired by code and know-how in the vendor driver by Gareth Phillips=
.
> + */
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <video/mipi_display.h>
> +
> +#define WS2401_RESCTL                  0xb8 /* Resolution select control=
 */
> +#define WS2401_PSMPS                   0xbd /* SMPS positive control */
> +#define WS2401_NSMPS                   0xbe /* SMPS negative control */
> +#define WS2401_SMPS                    0xbf
> +#define WS2401_BCMODE                  0xc1 /* Backlight control mode */
> +#define WS2401_WRBLCTL                 0xc3 /* Backlight control */
> +#define WS2401_WRDISBV                 0xc4 /* Write manual brightness *=
/
> +#define WS2401_WRCTRLD                 0xc6 /* Write BL control */
> +#define WS2401_WRMIE                   0xc7 /* Write MIE mode */
> +#define WS2401_READ_ID1                        0xda /* Read panel ID 1 *=
/
> +#define WS2401_READ_ID2                        0xdb /* Read panel ID 2 *=
/
> +#define WS2401_READ_ID3                        0xdc /* Read panel ID 3 *=
/
> +#define WS2401_GAMMA_R1                        0xe7 /* Gamma red 1 */
> +#define WS2401_GAMMA_G1                        0xe8 /* Gamma green 1 */
> +#define WS2401_GAMMA_B1                        0xe9 /* Gamma blue 1 */
> +#define WS2401_GAMMA_R2                        0xea /* Gamma red 2 */
> +#define WS2401_GAMMA_G2                        0xeb /* Gamma green 2 */
> +#define WS2401_GAMMA_B2                        0xec /* Gamma blue 2 */
> +#define WS2401_PASSWD1                 0xf0 /* Password command for leve=
l 2 */
> +#define WS2401_DISCTL                  0xf2 /* Display control */
> +#define WS2401_PWRCTL                  0xf3 /* Power control */
> +#define WS2401_VCOMCTL                 0xf4 /* VCOM control */
> +#define WS2401_SRCCTL                  0xf5 /* Source control */
> +#define WS2401_PANELCTL                        0xf6 /* Panel control */
> +
> +static const u8 ws2401_dbi_read_commands[] =3D {
> +       WS2401_READ_ID1,
> +       WS2401_READ_ID2,
> +       WS2401_READ_ID3,
> +       0, /* sentinel */
> +};
> +
> +/**
> + * struct ws2401 - state container for a panel controlled by the WS2401
> + * controller
> + */
> +struct ws2401 {
> +       /** @dev: the container device */
> +       struct device *dev;
> +       /** @dbi: the DBI bus abstraction handle */
> +       struct mipi_dbi dbi;
> +       /** @panel: the DRM panel instance for this device */
> +       struct drm_panel panel;
> +       /** @width: the width of this panel in mm */
> +       u32 width;
> +       /** @height: the height of this panel in mm */
> +       u32 height;
> +       /** @reset: reset GPIO line */
> +       struct gpio_desc *reset;
> +       /** @regulators: VCCIO and VIO supply regulators */
> +       struct regulator_bulk_data regulators[2];
> +       /** @bl: Backlight, if using internal backlight */
> +       struct backlight_device *bl;
> +};
> +
> +static const struct drm_display_mode lms380kf01_480_800_mode =3D {
> +       /*
> +        * The vendor driver states that the "SMD panel" has a clock
> +        * frequency of 49920000 Hz / 2 =3D 24960000 Hz.
> +        */
> +       .clock =3D 24960,
> +       .hdisplay =3D 480,
> +       .hsync_start =3D 480 + 8,
> +       .hsync_end =3D 480 + 8 + 10,
> +       .htotal =3D 480 + 8 + 10 + 8,
> +       .vdisplay =3D 800,
> +       .vsync_start =3D 800 + 8,
> +       .vsync_end =3D 800 + 8 + 2,
> +       .vtotal =3D 800 + 8 + 2 + 18,
> +       .width_mm =3D 50,
> +       .height_mm =3D 84,
> +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static inline struct ws2401 *to_ws2401(struct drm_panel *panel)
> +{
> +       return container_of(panel, struct ws2401, panel);
> +}
> +
> +static void ws2401_read_mtp_id(struct ws2401 *ws)
> +{
> +       struct mipi_dbi *dbi =3D &ws->dbi;
> +       u8 id1, id2, id3;
> +       int ret;
> +
> +       ret =3D mipi_dbi_command_read(dbi, WS2401_READ_ID1, &id1);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 1\n");
> +               return;
> +       }
> +       ret =3D mipi_dbi_command_read(dbi, WS2401_READ_ID2, &id2);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 2\n");
> +               return;
> +       }
> +       ret =3D mipi_dbi_command_read(dbi, WS2401_READ_ID3, &id3);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 3\n");
> +               return;
> +       }
> +       dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
> +}
> +
> +static int ws2401_power_on(struct ws2401 *ws)
> +{
> +       struct mipi_dbi *dbi =3D &ws->dbi;
> +       int ret;
> +
> +       /* Power up */
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(ws->regulators),
> +                                   ws->regulators);
> +       if (ret) {
> +               dev_err(ws->dev, "failed to enable regulators: %d\n", ret=
);
> +               return ret;
> +       }
> +       msleep(10);
> +
> +       /* Assert reset >=3D1 ms */
> +       gpiod_set_value_cansleep(ws->reset, 1);
> +       usleep_range(1000, 5000);
> +       /* De-assert reset */
> +       gpiod_set_value_cansleep(ws->reset, 0);
> +       /* Wait >=3D 10 ms */
> +       msleep(10);
> +       dev_dbg(ws->dev, "de-asserted RESET\n");

Just a small comment, are these delays are as per init sequence
mentioned in datasheet?

Jagan,
