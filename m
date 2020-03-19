Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3458918B8AF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 15:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF00F6EA0A;
	Thu, 19 Mar 2020 14:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0356EA0A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 14:09:01 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j15so1738967lfk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEcY8z6wwpaaAzNCe8Z6QFn2FupyzXJqJUFsyjFrfJ0=;
 b=RpJpNILV8tOQM22m6W5PBUdt+ZfhFSgvIxHC1TiiRYjzVLusOipyaoJsKDY1qBn9tC
 8TB8eQ+UdlHWSUBZx7YYfAkczhVm0iUNa4fZsCrSV6lW6L4gBoR4IzGSsM10bzU/XxJk
 xt2BWzjPc+zveX2UXnxkEsU0gXu0N+pJbv9gLrJgekGQdHkzMVBIMBtNcQO6VcI/yeJs
 jN6CSCeVLAsyHSKmknd300Oww6sGsSrfzPrYw038eJW/WOkqTtPBoIFpHMF0JQtaQnkJ
 bMQwUCeKH2KWlz/35dQkMLjM6eF+HheLW7BwEqBfn1hW1KIolmS7Lroy5Krr2USWV14a
 Ib9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEcY8z6wwpaaAzNCe8Z6QFn2FupyzXJqJUFsyjFrfJ0=;
 b=CvkT/jaywLW5LrJGN1/YJhzun/A+3VVgYMtvX3xYQZ8dXsgUqwokD8IWuuK1UhF1I5
 iNue9zkTvKJstukuqyhIF14DwVkpH3vCEoSSaWWLtBQL81iL78MXI9Hqn8Ttq6si4FSQ
 WU2JhLSTB6GZnOvImhihXjhH4Yi4gzDPDkT5hnIOIJUONEzLCc/jIDoBYJ2vOjkXrstm
 Wz1d7xT7/13Sp8xH7BcGBa6W8NVrpqU336wKxiWUH6cS5Ek4pPc7jPJcX+J0eZNWhUkv
 bWANZ+uac4mocENIlegK9AZ5mupSC8ZikP3aw7fcbI9aF3sD8m5ai0MqM7F+Fk8xjckR
 no8A==
X-Gm-Message-State: ANhLgQ03JqRXYMuMxbG7LvJbugP3+9KSlSyt53K1yHHy11314vVtLCxn
 Sm6pGfacyLYgKgeDLZhN8HC5kxnNFbZ9rJmhg/fsKg==
X-Google-Smtp-Source: ADFU+vtL2a5EH4HAtULGcGOjAWCmsAowQ2bEo2SZGc7cGuYj69Mom1zEbkHAkEi23SJQ7tUhsLzeUDsfPICmoRNYDiM=
X-Received: by 2002:a19:4b53:: with SMTP id y80mr2235185lfa.77.1584626939845; 
 Thu, 19 Mar 2020 07:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-4-icenowy@aosc.io>
In-Reply-To: <20200316133503.144650-4-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Mar 2020 15:08:48 +0100
Message-ID: <CACRpkdahrHmXWpdqoApFEq6cW2gatMfds9SMZGwsUnNHt+J0aQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: add Xingbangda XBD599 panel
To: Icenowy Zheng <icenowy@aosc.io>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy!

Thanks for your patch.

On Mon, Mar 16, 2020 at 2:37 PM Icenowy Zheng <icenowy@aosc.io> wrote:

> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI IPS LCD panel made by
> Xingbangda, which is used on PinePhone final assembled phones.
>
> Add support for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
(...)

> +/* Manufacturer specific Commands send via DSI */
> +#define ST7703_CMD_ALL_PIXEL_OFF 0x22
> +#define ST7703_CMD_ALL_PIXEL_ON         0x23
> +#define ST7703_CMD_SETDISP      0xB2
> +#define ST7703_CMD_SETRGBIF     0xB3
> +#define ST7703_CMD_SETCYC       0xB4
> +#define ST7703_CMD_SETBGP       0xB5
> +#define ST7703_CMD_SETVCOM      0xB6
> +#define ST7703_CMD_SETOTP       0xB7
> +#define ST7703_CMD_SETPOWER_EXT         0xB8
> +#define ST7703_CMD_SETEXTC      0xB9
> +#define ST7703_CMD_SETMIPI      0xBA
> +#define ST7703_CMD_SETVDC       0xBC
> +#define ST7703_CMD_SETSCR       0xC0
> +#define ST7703_CMD_SETPOWER     0xC1
> +#define ST7703_CMD_UNK_C6       0xC6
> +#define ST7703_CMD_SETPANEL     0xCC
> +#define ST7703_CMD_SETGAMMA     0xE0
> +#define ST7703_CMD_SETEQ        0xE3
> +#define ST7703_CMD_SETGIP1      0xE9
> +#define ST7703_CMD_SETGIP2      0xEA

It appears that the Himax HX8363 is using the same display controller
if you look at the datasheet:
http://www.datasheet-pdf.com/PDF/HX8369-A-Datasheet-Himax-729024
There you find an explanation to some of the commands.

People are trying to add support for this panel too:
https://discuss.96boards.org/t/adding-support-to-himax-hx8363-panel/9068

The set-up values etc for the Himax display will be widely
different because it is using the same display controller
for a display of 480x800(854) pixels.

You should definately insert code to read the MTP bytes:
0xDA manufacturer
0xDB driver version
0xDC LCD module/driver
And print these, se e.g. my newly added NT35510 driver or
the Sony ACX424AKP driver.

Nobody seems to have any documentation of these MTP
ID bytes but they are certainly consistent among
e.g Ilitek or Novatek display drivers.

I do not think that either Xingbangda or Himax have made
this display controller. The number of advanced display
controller vendors in the world is actually pretty limited.
Ilitek, Novatek or TPO make most of them.

It is a bit of a problem for the development world that
display manufacturers hide the details of which display
controller they actually use, because we can't have
2 different drivers for the same display controller just
because Himax and Xingbada package it up with
their own branding.

This actually looks very much like an Ilitek display controller.
Some commands are clearly identical to Ilitek ILI9342:
http://www.ampdisplay.com/documents/pdf/ILI9342_DS_V008_20100331.pdf

I would:

1. Try to determine what the actual display controller
  is. I think it is some Ilitek.

2. Write a panel-ilitek-ili9342.c (if that is the actual controller)
  and parameterize it for this display controller the same
  way we do in e.g. panel-novatek-nt35510.c or
  panel-ilitek-ili9322.c, so you use the compatible string
  to set up the actual per-display settings for this display
  controller.

> +       /*
> +        * Init sequence was supplied by the panel vendor.
> +        */
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC,
> +                         0xF1, 0x12, 0x83);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI,
> +                         0x33, 0x81, 0x05, 0xF9, 0x0E, 0x0E, 0x20, 0x00,
> +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> +                         0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4F, 0x11,
> +                         0x00, 0x00, 0x37);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT,
> +                         0x25, 0x22, 0x20, 0x03);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF,
> +                         0x10, 0x10, 0x05, 0x05, 0x03, 0xFF, 0x00, 0x00,
> +                         0x00, 0x00);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR,
> +                         0x73, 0x73, 0x50, 0x50, 0x00, 0xC0, 0x08, 0x70,
> +                         0x00);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x4E);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0B);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0xF0, 0x12, 0xF0);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ,
> +                         0x00, 0x00, 0x0B, 0x0B, 0x10, 0x10, 0x00, 0x00,
> +                         0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
> +       dsi_dcs_write_seq(dsi, 0xC6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
> +                         0x74, 0x00, 0x32, 0x32, 0x77, 0xF1, 0xFF, 0xFF,
> +                         0xCC, 0xCC, 0x77, 0x77);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x07, 0x07);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x2C, 0x2C);
> +       dsi_dcs_write_seq(dsi, 0xBF, 0x02, 0x11, 0x00);
> +
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1,
> +                         0x82, 0x10, 0x06, 0x05, 0xA2, 0x0A, 0xA5, 0x12,
> +                         0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
> +                         0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00,
> +                         0x03, 0x00, 0x00, 0x00, 0x75, 0x75, 0x31, 0x88,
> +                         0x88, 0x88, 0x88, 0x88, 0x88, 0x13, 0x88, 0x64,
> +                         0x64, 0x20, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> +                         0x02, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2,
> +                         0x02, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                         0x00, 0x00, 0x00, 0x00, 0x02, 0x46, 0x02, 0x88,
> +                         0x88, 0x88, 0x88, 0x88, 0x88, 0x64, 0x88, 0x13,
> +                         0x57, 0x13, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> +                         0x75, 0x88, 0x23, 0x14, 0x00, 0x00, 0x02, 0x00,
> +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0A,
> +                         0xA5, 0x00, 0x00, 0x00, 0x00);
> +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA,
> +                         0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41, 0x35,
> +                         0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12, 0x12,
> +                         0x18, 0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41,
> +                         0x35, 0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12,
> +                         0x12, 0x18);

Already just using the HX8363 datasheet you can turn this into
something much more readable akin to how the NT35510 driver
is done.

> +static const struct drm_display_mode xbd599_default_mode = {
> +       .hdisplay    = 720,
> +       .hsync_start = 720 + 40,
> +       .hsync_end   = 720 + 40 + 40,
> +       .htotal      = 720 + 40 + 40 + 40,
> +       .vdisplay    = 1440,
> +       .vsync_start = 1440 + 18,
> +       .vsync_end   = 1440 + 18 + 10,
> +       .vtotal      = 1440 + 18 + 10 + 17,
> +       .vrefresh    = 60,

I think this vrefresh is going away soon.

> +       .clock       = 69000,
> +       .flags       = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +
> +       .width_mm    = 68,
> +       .height_mm   = 136,
> +       .type        = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};

All of this as well as some of the initialization
sequences should be per-variant data. (Switched by
the compatible).

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
