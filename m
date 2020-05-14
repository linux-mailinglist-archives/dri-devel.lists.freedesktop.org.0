Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68EC1D29CC
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 10:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1206E0D1;
	Thu, 14 May 2020 08:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951626EAD7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 08:14:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g4so2519468ljl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Rzn7cq0RueHKImWKXM7yCKiShW9x1YZUKKs+w//dgo=;
 b=KgIbBmPSAM5V057UJjswd00GWFSuplgpUczlwr2or1sTvcPJpkGdXn16zcqWrvB7Hq
 g1nH9gMvbaCxnNdR6eAbMlJGQp7ty5d24X1TtmCjIxLOGZ+PB2n7vlNyzMOBaM/MXgE0
 NBmeD1JsqKSaPhhcVERmvmVXqDft31wiEG024q05U0/+VnG3ZcG9BzR3fsRqQgnIJJTF
 e61hISdePjkS9LFo0jJ2tac/wz8U4VbNHVTJxXEIC79E876IAR4nMn6dbFWSIyCMxtih
 WosQ0N5myIn223ln+nv/RmPqjDaFD3JWqn1sBt5mEIna5hYyy3CgVofylAMRA+P18bee
 u2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Rzn7cq0RueHKImWKXM7yCKiShW9x1YZUKKs+w//dgo=;
 b=pOx0EVcZx5NvXW/lhvD/L8X4u5QsMyDVdc9QuxWW4PTH8HtLjFvrA5Nh0wG8gMU33k
 219dv7/Ag2WojD63W61qvWp1sTTmbKAfaebxWQU62txRsLmYD2F1Td2EW2TLPc7xSTkv
 zw2gOMe5pEVY0vWdr7gwOcHFiI9XuHBv/v0Gbdo0iZbmr+jdXe89jh9Fv+pYSfFUnviD
 ybdilqlaLv3kTWEgjVAMx1pX95FbCnQdimV6TNRISwbFcivnfJYyYfvmSAXdf1Il0DaA
 Wd1GPvGC4g8SoC3JRn9+cOG/cGcHa4zrNm4H4z31Lu/sVllFzk4EM6/rIZV12EXurEiu
 uMiQ==
X-Gm-Message-State: AOAM532Oyu+5bgusebv8WIuuXQyBG50/sflVhZvzugDSAJtkAZSIxk2C
 z5QX7/dCXwrkXD7tskgaYkA7gNgLMu545WvUpbio+g==
X-Google-Smtp-Source: ABdhPJxicGsmyw6HOfdUXo27l6k92d2nLg/bnWVSnOja2VnXH2wkCfinXIbqKftvHF03hVugro8AJtYkQ2nArGHEyAw=
X-Received: by 2002:a05:651c:154:: with SMTP id
 c20mr1842104ljd.99.1589444082846; 
 Thu, 14 May 2020 01:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-6-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1589267017-17294-6-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 May 2020 10:14:31 +0200
Message-ID: <CACRpkdbZoMDC-D12CByKJUZbu4shqixC=QrKwJUd8x=nyK7seQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/panel: Add ilitek ili9341 driver
To: dillon.minfei@gmail.com
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>,
 Dave Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon,

thanks for your patch! Overall this looks like a good start.

On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:

> #define ILI9341_SLEEP_OUT            0x11   /* Sleep out register */

This is not a register, also just use MIPI_DCS_EXIT_SLEEP_MODE
in the code.

> +#define ILI9341_DFC                  0xb6   /* Display Function Control
> +                                            * register
> +                                            */

This commenting style doesn't work, either just put it after /* the define */
and don't care if the line gets a bit long and checkpatch complains,
or

/*
 * Put it above the define like this
 */
#define FOO 0x00

> +/**
> + * struct ili9341_config - the system specific ILI9341 configuration

Nice with this per-system config, it makes the driver easy to maintain
for new users.

> +static int ili9341_dpi_init(struct ili9341 *ili)
> +{
> +       ili9341_command(ili, 0xca, 0xc3, 0x08, 0x50);

This stuff is a bit hard to understand, don't you think?

But given that register 0xCA seems undocumented I don't
know if there is anything more you can do, so it is OK
I suppose.

> +       ili9341_command(ili, ILI9341_POWERB, 0x00, 0xc1, 0x30);

This command is described in the manual  page 196.
Version: V1.11
Document No.: ILI9341_DS_V1.11.pdf
https://dflund.se/~triad/ILI9341_v1.11.pdf

And this goes for all the below commands. Please add some more defines
from the datasheet and have less magic numbers in the driver.

> +       ili9341_command(ili, ILI9341_POWER_SEQ, 0x64, 0x03, 0x12, 0x81);
> +       ili9341_command(ili, ILI9341_DTCA, 0x85, 0x00, 0x78);
> +       ili9341_command(ili, ILI9341_POWERA, 0x39, 0x2c, 0x00, 0x34, 0x02);
> +       ili9341_command(ili, ILI9341_PRC, 0x20);
> +       ili9341_command(ili, ILI9341_DTCB, 0x00, 0x00);
> +       ili9341_command(ili, ILI9341_FRC, 0x00, 0x1b);
> +       ili9341_command(ili, ILI9341_DFC, 0x0a, 0xa2);
> +       ili9341_command(ili, ILI9341_POWER1, 0x10);
> +       ili9341_command(ili, ILI9341_POWER2, 0x10);
> +       ili9341_command(ili, ILI9341_VCOM1, 0x45, 0x15);
> +       ili9341_command(ili, ILI9341_VCOM2, 0x90);
> +       ili9341_command(ili, ILI9341_MAC, 0xc8);
> +       ili9341_command(ili, ILI9341_3GAMMA_EN, 0x00);
> +       ili9341_command(ili, ILI9341_RGB_INTERFACE, 0xc2);
> +       ili9341_command(ili, ILI9341_DFC, 0x0a, 0xa7, 0x27, 0x04);
> +       ili9341_command(ili, ILI9341_COLUMN_ADDR, 0x00, 0x00, 0x00, 0xef);
> +       ili9341_command(ili, ILI9341_PAGE_ADDR, 0x00, 0x00, 0x01, 0x3f);
> +       ili9341_command(ili, ILI9341_INTERFACE, 0x01, 0x00, 0x06);
> +       if (ili->input == ILI9341_INPUT_PRGB_18_BITS)
> +               ili9341_command(ili, ILI9341_PIXEL_FORMAT, 0x66);
> +       else
> +               ili9341_command(ili, ILI9341_PIXEL_FORMAT, 0x56);
> +       ili9341_command(ili, ILI9341_GRAM);
> +       msleep(200);

I think some of the above should not be hardcoded but should instead
be stored in fields in struct ili9341_config. I know it can be a bit
tedious but it makes things much more clear.

> +       ili9341_command(ili, ILI9341_GAMMA, 0x01);
> +       ili9341_command(ili, ILI9341_PGAMMA, 0x0f, 0x29, 0x24, 0x0c, 0x0e,
> +                                               0x09, 0x4e, 0x78, 0x3c, 0x09,
> +                                               0x13, 0x05, 0x17, 0x11, 0x00);
> +       ili9341_command(ili, ILI9341_NGAMMA, 0x00, 0x16, 0x1b, 0x04, 0x11,
> +                                               0x07, 0x31, 0x33, 0x42, 0x05,
> +                                               0x0c, 0x0a, 0x28, 0x2f, 0x0f);

This should definately be in ili9341_config, as it is a screen property.

In the long run I would like these panels to support setting gamma
from userspace etc but it is a big tedious work to get that right
so hard-coding a default per-variant is fine.

You can check in e.g. panel-novatek-nt35510.c how I encoded
such sequences in per-variant data.

> +static int ili9341_dpi_power_off(struct ili9341 *ili)
> +{
> +       /* Disable power */
> +       if (!IS_ERR(ili->vcc))
> +               return regulator_disable(ili->vcc);
> +
> +       return 0;
> +}

Usually you should also assert RESET when disabling
power.

> +/* This is the only mode listed for parallel RGB in the datasheet */
> +static const struct drm_display_mode rgb_240x320_mode = {
> +       .clock = 6100,
> +       .hdisplay = 240,
> +       .hsync_start = 240 + 10,
> +       .hsync_end = 240 + 10 + 10,
> +       .htotal = 240 + 10 + 10 + 20,
> +       .vdisplay = 320,
> +       .vsync_start = 320 + 4,
> +       .vsync_end = 320 + 4 + 2,
> +       .vtotal = 320 + 4 + 2 + 2,
> +       .vrefresh = 60,
> +       .flags = 0,
> +       .width_mm = 65,
> +       .height_mm = 50,

The width and height should certainly be om the ili9341_config
as it is a per-panel property. You can just fill in in in
the below .get_modes() function. Or assign the whole
mode as part of the ili9341_config if that is easier.

> +       return drm_panel_add(&ili->panel);
> +}
> +
> +
> +

Surplus whitespace here.

> +       mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
> +
> +       mipi_dbi_command(dbi, ILI9341_POWERB, 0x00, 0xc1, 0x30);
> +       mipi_dbi_command(dbi, ILI9341_POWER_SEQ, 0x64, 0x03, 0x12, 0x81);

Some of these are just copies of the above init sequence, so it makes
even more sense to just have these settings stored in
ili9341_config.

> +       mipi_dbi_command(dbi, ILI9341_DTCA, 0x85, 0x00, 0x78);
> +       mipi_dbi_command(dbi, ILI9341_POWERA, 0x39, 0x2c, 0x00, 0x34, 0x02);
> +       mipi_dbi_command(dbi, ILI9341_PRC, 0x20);
> +       mipi_dbi_command(dbi, ILI9341_DTCB, 0x00, 0x00);
> +
> +       /* Power Control */
> +       mipi_dbi_command(dbi, ILI9341_POWER1, 0x23);
> +       mipi_dbi_command(dbi, ILI9341_POWER2, 0x10);
> +       /* VCOM */
> +       mipi_dbi_command(dbi, ILI9341_VCOM1, 0x3e, 0x28);
> +       mipi_dbi_command(dbi, ILI9341_VCOM2, 0x86);
> +
> +       /* Memory Access Control */
> +       mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
> +                               MIPI_DCS_PIXEL_FMT_16BIT);
> +
> +       /* Frame Rate */
> +       mipi_dbi_command(dbi, ILI9341_FRC, 0x00, 0x1b);
> +
> +       /* Gamma */
> +       mipi_dbi_command(dbi, ILI9341_3GAMMA_EN, 0x00);
> +       mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x01);
> +       mipi_dbi_command(dbi, ILI9341_PGAMMA,
> +                        0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
> +                        0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
> +       mipi_dbi_command(dbi, ILI9341_NGAMMA,
> +                        0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
> +                        0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);

It seems to be copies of the stuff above, but why is there a different
gamma if you use DBI?

I suspect only one of them is really needed and it is not even
necessary to set if up in two places.

> +out_enable:
> +       switch (dbidev->rotation) {
> +       default:
> +               addr_mode = ILI9341_MADCTL_MX;
> +               break;> +out_enable:
> +       switch (dbidev->rotation) {
> +       default:
> +               addr_mode = ILI9341_MADCTL_MX;
> +               break;
> +       case 90:
> +               addr_mode = ILI9341_MADCTL_MV;
> +               break;
> +       case 180:
> +               addr_mode = ILI9341_MADCTL_MY;
> +               break;
> +       case 270:
> +               addr_mode = ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
> +                           ILI9341_MADCTL_MX;
> +               break;
> +       }
> +       addr_mode |= ILI9341_MADCTL_BGR;
> +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
> +       mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
> +       DRM_DEBUG_KMS("initialized display serial interface\n");
> +out_exit:
> +       drm_dev_exit(idx);
> +}
> +

> +       case 90:
> +               addr_mode = ILI9341_MADCTL_MV;
> +               break;
> +       case 180:
> +               addr_mode = ILI9341_MADCTL_MY;
> +               break;
> +       case 270:
> +               addr_mode = ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
> +                           ILI9341_MADCTL_MX;
> +               break;
> +       }
> +       addr_mode |= ILI9341_MADCTL_BGR;
> +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);

Since you use MIPI_DCS_* define here, check if this applies
to more of the commands above so you don't need custom
defines for them. e.g.
ILI9341_SLEEP_OUT 0x11 = MIPI_DCS_EXIT_SLEEP_MODE
and that isn't even a register right, it is just a command?
(Noted in the beginning.)

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
