Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5CF36F0ED
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 22:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF3C6F4AC;
	Thu, 29 Apr 2021 20:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545886F4AC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 20:21:07 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id k127so12951936qkc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 13:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=J3wFByqiPV4OnR04fAnsALgGc8jiBU8vCjgons3cKKs=;
 b=fb3OHJMvALjHaIH3nuf4jfzdsanUWh9BBZ5tLd6+S5gXZOj3R5toQe5ViyiewswJT/
 9L51SZdnOE4KCLx0DNFzgpZBvcOL7MYKR8zsOy0RzWiYJj+37LO2zYvUVjwlRxYKzNBX
 tjgWCPXKuCMIAnoY1BZReCIJ2ELBO0QzOXmx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=J3wFByqiPV4OnR04fAnsALgGc8jiBU8vCjgons3cKKs=;
 b=H3FKKmOc6ai0s5LZhoF/hwTZZStKrTC07tICt3CvqOkhAu1/OG+W7svFf9BiDGTbPZ
 ZZUVm4SD8MYqlBfxy+Kq+eZ3xA2QqX0V6h8tGIg94gr4lfSTOg9VLYCmhWnYDDIY9gOU
 MoVdClDSsVLlBaGei1dsPsD5LfN4FPTDzhSttDe/5wX2sunW9t4CcrdDx6g1JA78KmoC
 WtwCWloR1KUWAasUHcU49ZuNc9/Vs+h0CFAEcYACwYnzS9dD1I1umt71rYSazV34Fg63
 cw1ZG/MDtOCEjUXjpIFMvnFbucWehrOFq4cNFuj8XQbbAedFIwo/9OECa9ovv5V4nLR2
 U56w==
X-Gm-Message-State: AOAM533C5icDiFy1A3YI5TyTPosN+qhzsiwkbnZgg14NMwOpqhrlnXMu
 dYojmAk2Q/ZaBCg2tAP/oeAZ9Vpad4YBKQ==
X-Google-Smtp-Source: ABdhPJxQLjMeYBdhpxUHiOpy8/IajiEJMUFgV1RncpdTqQ+0hLPahX9WdO4pwNDyq9TF/ndpCQlD+g==
X-Received: by 2002:a37:6454:: with SMTP id y81mr1642059qkb.490.1619727665784; 
 Thu, 29 Apr 2021 13:21:05 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id o189sm3003180qka.86.2021.04.29.13.21.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 13:21:05 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id t94so26956434ybi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 13:21:05 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr1892144ybp.476.1619727664697; 
 Thu, 29 Apr 2021 13:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210405234713.3190693-2-linus.walleij@linaro.org>
In-Reply-To: <20210405234713.3190693-2-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Apr 2021 13:20:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VT9R9r0ztMfKr0wH8vrOL0RnKmQuwYp8L2aZX74n8A_A@mail.gmail.com>
Message-ID: <CAD=FV=VT9R9r0ztMfKr0wH8vrOL0RnKmQuwYp8L2aZX74n8A_A@mail.gmail.com>
Subject: Re: [2/2] drm/panel: lms397kf04: Add driver for LMS397KF04
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Walleij <linus.walleij@linaro.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 29, 2021 at 8:40 AM Linus Walleij <linus.walleij@linaro.org wrote:
>
> @@ -33,6 +33,7 @@ obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
>  obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_LMS397KF04) += panel-samsung-lms397kf04.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o

nit: sort ordering is off by one. D comes before M.


> diff --git a/drivers/gpu/drm/panel/panel-samsung-lms397kf04.c b/drivers/gpu/drm/panel/panel-samsung-lms397kf04.c
> new file mode 100644
> index 000000000000..41290cadc351
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-lms397kf04.c
> @@ -0,0 +1,421 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panel driver for the Samsung LMS397KF04 480x800 DPI RGB panel.
> + * According to the data sheet the display controller is called DB7430
> + * Linus Walleij <linus.walleij@linaro.org>
> + */
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <video/mipi_display.h>
> +
> +#define LMS397_MANUFACTURER_CMD                0xb0
> +#define LMS397_UNKNOWN_B4              0xb4
> +#define LMS397_USER_SELECT             0xb5
> +#define LMS397_UNKNOWN_B7              0xb7
> +#define LMS397_UNKNOWN_B8              0xb8
> +#define LMS397_PANEL_DRIVING           0xc0
> +#define LMS397_SOURCE_CONTROL          0xc1
> +#define LMS397_GATE_INTERFACE          0xc4
> +#define LMS397_DISPLAY_H_TIMING                0xc5
> +#define LMS397_RGB_SYNC_OPTION         0xc6
> +#define LMS397_GAMMA_SET_RED           0xc8
> +#define LMS397_GAMMA_SET_GREEN         0xc9
> +#define LMS397_GAMMA_SET_BLUE          0xca
> +#define LMS397_BIAS_CURRENT_CTRL       0xd1
> +#define LMS397_DDV_CTRL                        0xd2
> +#define LMS397_GAMMA_CTRL_REF          0xd3
> +#define LMS397_UNKNOWN_D4              0xd4
> +#define LMS397_DCDC_CTRL               0xd5
> +#define LMS397_VCL_CTRL                        0xd6
> +#define LMS397_UNKNOWN_F8              0xf8
> +#define LMS397_UNKNOWN_FC              0xfc

I managed to dig up a copy of the DCS spec. It says that all these
0xb0 - 0xfc are specific to each manufacturer, so that makes sense
that they're all defined in this file instead of somewhere common.
...but it also says that, at least the way they're intended to be
used, these commands are all supposed to be used only in the factory
and then disabled. I guess maybe the manufacturer of this panel
ignored that and requires these things to be configured each time the
panel is powered up?

Also: should these #defines have a "DB7430" prefix instead of "LMS397"
prefix? Presumably all of these commands are defined by the display
controller and the only "LMS397" specific stuff is what you need to
program into them for your display. I'm trying to think forward to
when the second panel comes along that also has a DB7430 display
controller.


> +
> +#define DATA_MASK      0x100
> +
> +/**
> + * struct lms397kf04 - state container for the LMS397kf04 panel
> + */
> +struct lms397kf04 {
> +       /**
> +        * @dev: the container device
> +        */
> +       struct device *dev;

optional nit: these are all small descriptions. Why not move them all
to the single-line format, like:

/** @dev: the container device */


> +       /**
> +        * @spi: the corresponding SPI device
> +        */
> +       struct spi_device *spi;
> +       /**
> +        * @panel: the DRM panel instance for this device
> +        */
> +       struct drm_panel panel;
> +       /**
> +        * @width: the width of this panel in mm
> +        */
> +       u32 width;
> +       /**
> +        * @height: the height of this panel in mm
> +        */
> +       u32 height;
> +       /**
> +        * @reset: reset GPIO line
> +        */
> +       struct gpio_desc *reset;
> +       /**
> +        * @regulators: VCCIO and VIO supply regulators
> +        */
> +       struct regulator_bulk_data regulators[2];
> +};
> +
> +static const struct drm_display_mode lms397kf04_mode = {
> +       /*
> +        * 31 ns period min (htotal*vtotal*vrefresh)/1000
> +        * gives a Vrefresh of ~71 Hz.
> +        */
> +       .clock = 32258,
> +       .hdisplay = 480,
> +       .hsync_start = 480 + 10,
> +       .hsync_end = 480 + 10 + 4,
> +       .htotal = 480 + 10 + 4 + 40,
> +       .vdisplay = 800,
> +       .vsync_start = 800 + 6,
> +       .vsync_end = 800 + 6 + 1,
> +       .vtotal = 800 + 6 + 1 + 7,
> +       .width_mm = 53,
> +       .height_mm = 87,
> +       .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static inline struct lms397kf04 *to_lms397kf04(struct drm_panel *panel)
> +{
> +       return container_of(panel, struct lms397kf04, panel);
> +}
> +
> +static int lms397kf04_write_word(struct lms397kf04 *lms, u16 data)
> +{
> +       /* SPI buffers are always in CPU order */
> +       return spi_write(lms->spi, &data, 2);
> +}
> +
> +static int lms397kf04_dcs_write(struct lms397kf04 *lms, const u8 *data, size_t len)
> +{
> +       int ret;
> +
> +       dev_dbg(lms->dev, "SPI writing dcs seq: %*ph\n", (int)len, data);
> +
> +       /*
> +        * This sends 9 bits with the first bit (bit 8) set to 0
> +        * This indicates that this is a command. Anything after the
> +        * command is data.
> +        */
> +       ret = lms397kf04_write_word(lms, *data);
> +
> +       while (!ret && --len) {
> +               ++data;
> +               /* This sends 9 bits with the first bit (bit 8) set to 1 */
> +               ret = lms397kf04_write_word(lms, *data | DATA_MASK);
> +       }
> +
> +       if (ret) {
> +               dev_err(lms->dev, "SPI error %d writing dcs seq: %*ph\n", ret,
> +                       (int)len, data);
> +       }
> +
> +       return ret;

So I've never looked at MIPI stuff at all before. ...but, as far as I
can tell your panel is implementing MIPI DBI Type C Option 1 (3-line
SPI). It feels like you should be using the functions for dealing with
MIPI DBI, like mipi_dbi_spi_init(), mipi_dbi_command(). If I'm reading
the code correctly, I think that will have the benefit of making your
panel more flexible in terms of the capabilities of the SPI
controller. It seems to handle the case when the SPI controller
doesn't support 9-bits-per-word transfers, for instance.

If you have a good reason for not using the MIPI DBI functions then
let me know and I'll look over your functions more closely.


> +}
> +
> +#define lms397kf04_dcs_write_seq_static(ctx, seq ...) \
> +       ({ \
> +               static const u8 d[] = { seq }; \
> +               lms397kf04_dcs_write(ctx, d, ARRAY_SIZE(d)); \
> +       })
> +
> +static int lms397kf04_power_on(struct lms397kf04 *lms)
> +{
> +       int ret;
> +
> +       /* Power up */
> +       ret = regulator_bulk_enable(ARRAY_SIZE(lms->regulators),
> +                                   lms->regulators);
> +       if (ret) {
> +               dev_err(lms->dev, "failed to enable regulators: %d\n", ret);
> +               return ret;
> +       }
> +       msleep(50);
> +
> +       /* Assert reset >=1 ms */
> +       gpiod_set_value_cansleep(lms->reset, 1);
> +       msleep(1);

I dunno if it's still conventional wisdom, but
"Documentation/timers/timers-howto.rst" still says that you should be
using usleep() for such short sleeps.


> +       /* De-assert reset */
> +       gpiod_set_value_cansleep(lms->reset, 0);
> +       /* Wait >= 10 ms */
> +       msleep(10);
> +       dev_info(lms->dev, "de-asserted RESET\n");

Can this be something less than dev_info()? dev_dbg() maybe?


> +
> +       /*
> +        * This is set to 0x0a (RGB/BGR order + horizontal flip) in order
> +        * to make the display behave normally. If this is not set the displays
> +        * normal output behaviour is horizontally flipped and BGR ordered. Do
> +        * it twice because the first message doesn't always "take".
> +        */
> +       lms397kf04_dcs_write_seq_static(lms, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
> +       lms397kf04_dcs_write_seq_static(lms, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);

This actually looks like a somewhat standard property, but I guess
exactly how it's interpreted is somewhat subject to the panel. Seems
fine to just hardcode something (like you're doing) for now and
someone can later figure out how to make it fancier.

Also: should we be error-checking lms397kf04_dcs_write_seq_static()
return values in this function? spi_write() can fail...


> +       /* Called "Access protection off" in vendor code */
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_MANUFACTURER_CMD, 0x00);

Should you change the #define to LMS397_ACCESS_PROTECTION or something, then?

I don't have the vendor code, but I would suspect that
"MANUFACTURER_CMD" is 0xb0 because the MIPI DCS document describes
0xb0 as the ID of the first custom manufacturer-specific command, but
really all the commands 0xb0 - 0xff are manufacturer-specific
commands.


> +       lms397kf04_dcs_write_seq_static(lms, LMS397_PANEL_DRIVING, 0x28, 0x08);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_SOURCE_CONTROL,
> +                                       0x01, 0x30, 0x15, 0x05, 0x22);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_GATE_INTERFACE,
> +                                       0x10, 0x01, 0x00);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_DISPLAY_H_TIMING,
> +                                       0x06, 0x55, 0x03, 0x07, 0x0b,
> +                                       0x33, 0x00, 0x01, 0x03);
> +       /*
> +        * 0x00 in datasheet 0x01 in vendor code 0x00, it seems 0x01 means
> +        * DE active high and 0x00 means DE active low.
> +        */
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_RGB_SYNC_OPTION, 0x01);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_GAMMA_SET_RED,
> +               /* R positive gamma */ 0x00,
> +               0x0A, 0x31, 0x3B, 0x4E, 0x58, 0x59, 0x5B, 0x58, 0x5E, 0x62,
> +               0x60, 0x61, 0x5E, 0x62, 0x55, 0x55, 0x7F, 0x08,
> +               /* R negative gamma */ 0x00,
> +               0x0A, 0x31, 0x3B, 0x4E, 0x58, 0x59, 0x5B, 0x58, 0x5E, 0x62,
> +               0x60, 0x61, 0x5E, 0x62, 0x55, 0x55, 0x7F, 0x08);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_GAMMA_SET_GREEN,
> +               /* G positive gamma */ 0x00,
> +               0x25, 0x15, 0x28, 0x3D, 0x4A, 0x48, 0x4C, 0x4A, 0x52, 0x59,
> +               0x59, 0x5B, 0x56, 0x60, 0x5D, 0x55, 0x7F, 0x0A,
> +               /* G negative gamma */ 0x00,
> +               0x25, 0x15, 0x28, 0x3D, 0x4A, 0x48, 0x4C, 0x4A, 0x52, 0x59,
> +               0x59, 0x5B, 0x56, 0x60, 0x5D, 0x55, 0x7F, 0x0A);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_GAMMA_SET_BLUE,
> +               /* B positive gamma */ 0x00,
> +               0x48, 0x10, 0x1F, 0x2F, 0x35, 0x38, 0x3D, 0x3C, 0x45, 0x4D,
> +               0x4E, 0x52, 0x51, 0x60, 0x7F, 0x7E, 0x7F, 0x0C,
> +               /* B negative gamma */ 0x00,
> +               0x48, 0x10, 0x1F, 0x2F, 0x35, 0x38, 0x3D, 0x3C, 0x45, 0x4D,
> +               0x4E, 0x52, 0x51, 0x60, 0x7F, 0x7E, 0x7F, 0x0C);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_BIAS_CURRENT_CTRL,
> +                                       0x33, 0x13);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_DDV_CTRL,
> +                                       0x11, 0x00, 0x00);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_GAMMA_CTRL_REF,
> +                                       0x50, 0x50);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_DCDC_CTRL,
> +                                       0x2f, 0x11, 0x1e, 0x46);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_VCL_CTRL,
> +                                       0x11, 0x0a);
> +
> +       return 0;
> +}
> +
> +static void lms397kf04_power_off(struct lms397kf04 *lms)
> +{
> +       /* Go into RESET and disable regulators */
> +       gpiod_set_value_cansleep(lms->reset, 1);
> +       regulator_bulk_disable(ARRAY_SIZE(lms->regulators),
> +                              lms->regulators);

In theory regulator_bulk_disable() could fail. Since unprepare() also
has an "error" return maybe return it?


> +}
> +
> +static int lms397kf04_unprepare(struct drm_panel *panel)
> +{
> +       struct lms397kf04 *lms = to_lms397kf04(panel);
> +
> +       lms397kf04_power_off(lms);
> +
> +       return 0;
> +}

It could be shorter. Assuming you add a return value to lms397kf04_power_off():

static int lms397kf04_unprepare(struct drm_panel *panel)
{
  return lms397kf04_power_off(to_lms397kf04(panel));
}


> +
> +static int lms397kf04_disable(struct drm_panel *panel)
> +{
> +       struct lms397kf04 *lms = to_lms397kf04(panel);
> +
> +       lms397kf04_dcs_write_seq_static(lms, MIPI_DCS_SET_DISPLAY_OFF);
> +       msleep(25);
> +       lms397kf04_dcs_write_seq_static(lms, MIPI_DCS_ENTER_SLEEP_MODE);
> +       msleep(120);
> +
> +       return 0;
> +}
> +
> +static int lms397kf04_prepare(struct drm_panel *panel)
> +{
> +       struct lms397kf04 *lms = to_lms397kf04(panel);
> +       int ret;
> +
> +       ret = lms397kf04_power_on(lms);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

It could be shorter:

static int lms397kf04_prepare(struct drm_panel *panel)
{
  return lms397kf04_power_on(to_lms397kf04(panel));
}

> +}
> +
> +static int lms397kf04_enable(struct drm_panel *panel)
> +{
> +       struct lms397kf04 *lms = to_lms397kf04(panel);
> +
> +       /* Exit sleep mode */
> +       lms397kf04_dcs_write_seq_static(lms, MIPI_DCS_EXIT_SLEEP_MODE);
> +       msleep(20);
> +
> +       /* NVM (non-volatile memory) load sequence */
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_UNKNOWN_D4,
> +                                       0x52, 0x5e);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_UNKNOWN_F8,
> +                                       0x01, 0xf5, 0xf2, 0x71, 0x44);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_UNKNOWN_FC,
> +                                       0x00, 0x08);
> +       msleep(150);

I'll believe you if you tell me that it's correct, but something feels
odd to me. As I mentioned above, the MIPI DCS specs say that it's
expected that most of the configuration that you're doing in
lms397kf04_power_on() would happen at manufacturer time and then be
"locked" so you don't need to do it again.

I could sorta believe that maybe some panels wouldn't have any
non-volatile storage and that would explain why you need to program
this stuff on every enable. ...but now the above comment says that
it's loading stuff from non-volatile memory.

Are you sure that all of the magic config commands you have in
lms397kf04_power_on() are actually needed / doing anything? Could they
be leftover from some example code and they're not actually needed
anymore?


> +       /* CABC turn on sequence (BC = backlight control) */

I would expect that the "CA" would mean "Content Adaptive". As I
understand it CABC saves power by dimming the backlight on the screen
(or maybe part of the screen) depending on the contents. I think it's
supposed to be a good power savings for watching full screen movies
where it's common that nothing is using "full white".


> +       lms397kf04_dcs_write_seq_static(lms, LMS397_UNKNOWN_B4,
> +                                       0x0f, 0x00, 0x50);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_USER_SELECT, 0x80);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_UNKNOWN_B7, 0x24);
> +       lms397kf04_dcs_write_seq_static(lms, LMS397_UNKNOWN_B8, 0x01);
> +
> +       /* Turn on display */
> +       lms397kf04_dcs_write_seq_static(lms, MIPI_DCS_SET_DISPLAY_ON);
> +
> +       /* Update brightness */
> +

Was there supposed to be something after "Update brightness"?


> +       return 0;
> +}
> +
> +/**
> + * lms397kf04_get_modes() - return the mode
> + * @panel: the panel to get the mode for
> + * @connector: reference to the central DRM connector control structure
> + */
> +static int lms397kf04_get_modes(struct drm_panel *panel,
> +                           struct drm_connector *connector)

nit: second line in function declaration has odd indentation.


> +{
> +       struct lms397kf04 *lms = to_lms397kf04(panel);
> +       struct drm_display_mode *mode;
> +       static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +       mode = drm_mode_duplicate(connector->dev, &lms397kf04_mode);
> +       if (!mode) {
> +               dev_err(lms->dev, "failed to add mode\n");
> +               return -ENOMEM;
> +       }
> +
> +       connector->display_info.width_mm = mode->width_mm;
> +       connector->display_info.height_mm = mode->height_mm;
> +       connector->display_info.bus_flags =
> +               DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> +       drm_display_info_set_bus_formats(&connector->display_info,
> +                                        &bus_format, 1);

panel-simple also sets the bpc in the "display_info". Do you need to?


> +
> +       drm_mode_set_name(mode);
> +       mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +
> +       drm_mode_probed_add(connector, mode);
> +
> +       return 1;
> +}
> +
> +static const struct drm_panel_funcs lms397kf04_drm_funcs = {
> +       .disable = lms397kf04_disable,
> +       .unprepare = lms397kf04_unprepare,
> +       .prepare = lms397kf04_prepare,
> +       .enable = lms397kf04_enable,
> +       .get_modes = lms397kf04_get_modes,
> +};
> +
> +static int lms397kf04_probe(struct spi_device *spi)
> +{
> +       struct device *dev = &spi->dev;
> +       struct lms397kf04 *lms;
> +       int ret;
> +
> +       lms = devm_kzalloc(dev, sizeof(*lms), GFP_KERNEL);
> +       if (!lms)
> +               return -ENOMEM;
> +       lms->dev = dev;
> +
> +       /*
> +        * VCI   is the analog voltage supply
> +        * VCCIO is the digital I/O voltage supply
> +        */
> +       lms->regulators[0].supply = "vci";
> +       lms->regulators[1].supply = "vccio";
> +       ret = devm_regulator_bulk_get(dev,
> +                                     ARRAY_SIZE(lms->regulators),
> +                                     lms->regulators);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +       /* This asserts the RESET signal, putting the display into reset */
> +       lms->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(lms->reset)) {
> +               dev_err(dev, "no RESET GPIO\n");
> +               return -ENODEV;

nit: include the error code in the error message? Here and in other
error messages in probe.

Also, you're forcing the error to -ENODEV. What if devm_gpiod_get()
returned -EPROBE_DEFER? That will cause a problem, right? Why not just
return the error code?

...oh, or more broadly use the nifty dev_err_probe() function that you
use above!


> +       }
> +
> +       spi->bits_per_word = 9;
> +       /* Preserve e.g. SPI_3WIRE setting */
> +       spi->mode |= SPI_MODE_3;
> +       ret = spi_setup(spi);
> +       if (ret < 0) {
> +               dev_err(dev, "spi setup failed.\n");
> +               return ret;
> +       }
> +       lms->spi = spi;
> +
> +       drm_panel_init(&lms->panel, dev, &lms397kf04_drm_funcs,
> +                      DRM_MODE_CONNECTOR_DPI);
> +
> +       /* FIXME: if no external backlight, use internal backlight */
> +       ret = drm_panel_of_backlight(&lms->panel);
> +       if (ret) {
> +               dev_info(dev, "failed to add backlight\n");

dev_err() ?


> +               return ret;
> +       }
> +
> +       spi_set_drvdata(spi, lms);
> +
> +       drm_panel_add(&lms->panel);
> +       dev_info(dev, "added panel\n");

Change to dev_dbg() ?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
