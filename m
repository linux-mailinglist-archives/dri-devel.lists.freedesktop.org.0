Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973690FFEE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 11:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138CB10E07C;
	Thu, 20 Jun 2024 09:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Gbr0Xij1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B585B10E07C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 09:08:24 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57d0f929f79so501244a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 02:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718874503; x=1719479303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/HqSY3GOs/15VIJ9Rt+TiaY5fHiC8UUyqPG+GopX0FQ=;
 b=Gbr0Xij1DxcLB3b2azRIR6bvcwgKcUjBtgaKOdkWu70gOn3yUENW2qZKYNCVRA5/uY
 nzjOqXERdxDoK/44B/7UFC0ghfn1Q3cZHzRff4sXnTGDBv5+pYBiMuPKVAgQsoC2wY6F
 y8WZc6hHuu3x5UT7Mw0lkgXs8bJZCt7bTienqnTpQfJ+hB3q3++lSghGk7yITAvdqXwB
 Nukn/rPMiBL3BOrtMofV/Lmv2HwYCz8oWuJaHH8ovpTp7Bb2ASs1i3z03+reTmYtk6VR
 Kv7aYeRRyWt1T61VifGre/kCuSTcoJW8l/b944DgiBuzYs0dvWD9qBxQySitDKlH0yNR
 GeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718874503; x=1719479303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/HqSY3GOs/15VIJ9Rt+TiaY5fHiC8UUyqPG+GopX0FQ=;
 b=D9WEbAOlUuSJGL3DGqQfGx6Sajaqqv/3puaFNfIJMAnNwFYVZtefDML7I+Zp+j6OzZ
 GVY9EoBPdwcoW4Oq9FG7CZ4ha2To3+QtbxYEzCdZpbLSbmZ319VKilDEV8RI4xXtCuSo
 o901flxln8YVeT3BbX2cxuoaPNl8r9ddIGPs8oAzlYcU4A+6llKRDwr8bikWAEQdXwNH
 twjjwrz9ORi4B7ZCtY6C8UoVpw5pQpYTNSejDs5zVFe4iaKIenvXc2jOl8Hz0UnZplSw
 S9xCvjlR1HPFxY0gAwvs4wMSuXStA57EzWm17WfFYo6p0gjbk0lHEGCkm7IYfPGOTZja
 BfZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX27lhzexcUSfg0EUx2bHbH/v3PweLWEgwP8IwQBCwhkXVpNI1ko9INkFPasBlbzs1+8rSDdNgbgh1nWpWbPgIi6hZEWrWMFxpqdtqYxKAS
X-Gm-Message-State: AOJu0Ywnq+uAdVCVDs8M0VVfyNz00651jLMmkJ/kDZ9VFU3UCc493+s3
 tkbOU7wn1xOi2vnZ3ipEpQ2Aq6ZOJnaGXTpW+PnxYkIX8KW/ghfr4N9HQqtTXhUuo9MlncRfzdC
 49qVLwj/pRvakcNj9O1Kr6/P0SojhrSdXmgd5xQ==
X-Google-Smtp-Source: AGHT+IHO5sP2gbpxBB+AMGd4wNamE9Q721oKfWv/dUroSShvJU+KFMT4kGHIsnxr8NwAqlWGAJQN7rLag50g2h0cmh4=
X-Received: by 2002:a50:ee92:0:b0:57c:765b:83a3 with SMTP id
 4fb4d7f45d1cf-57d0bff1a13mr2919665a12.25.1718874502424; Thu, 20 Jun 2024
 02:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240614145609.25432-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240614145609.25432-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <xiv3rvzpx7l2esosggybp6pheoa4zg3ew6vnhjxewnmvkdy73o@jflkmq77lxxn>
In-Reply-To: <xiv3rvzpx7l2esosggybp6pheoa4zg3ew6vnhjxewnmvkdy73o@jflkmq77lxxn>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Thu, 20 Jun 2024 17:08:11 +0800
Message-ID: <CA+6=WdQpLMQBti_1WBQ9h09fRSf74o0m4YrJqDOqzDAYJ0EyOA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: starry-er88577: add new panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Dmitry

We checked the panel-boe-th101mb31ig002-28a.c driver. Although the
init_code is similar, the IC does not seem to be the same from the
name, and our panel and timing are also different.

On Sat, Jun 15, 2024 at 1:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Jun 14, 2024 at 10:56:09PM GMT, Zhaoxiong Lv wrote:
> > The bias IC of this starry-er88577 panel is placed
> > on the panel side, so when the panel is powered on,
> > there is no need to control AVDD and AVEE in the driver,
> > only 3.3v and reset are needed.
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> >
> > ---
> >
> > Chage since V3:
> >
> > -  Separate Starry-er88577 from the panel-kingdisplay-kd101ne3 driver.
> > -  Use mipi_dsi_dcs_set_display_on_multi().
> > -  Use mipi_dsi_dcs_exit_sleep_mode_multi() and mipi_dsi_msleep().
> >
> > v2: https://lore.kernel.org/all/20240601084528.22502-5-lvzhaoxiong@huaq=
in.corp-partner.google.com/
> >
> > Chage since V2:
> >
> > -  Add compatible for Starry er88577 in panel-kingdisplay-kd101ne3 driv=
ers.
> > ---
> >  drivers/gpu/drm/panel/Kconfig                |   9 +
> >  drivers/gpu/drm/panel/Makefile               |   1 +
> >  drivers/gpu/drm/panel/panel-starry-er88577.c | 343 +++++++++++++++++++
> >  3 files changed, 353 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-starry-er88577.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index e54f6f5604ed..a52aa2552ab8 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -781,6 +781,15 @@ config DRM_PANEL_SITRONIX_ST7789V
> >         Say Y here if you want to enable support for the Sitronix
> >         ST7789V controller for 240x320 LCD panels
> >
> > +config DRM_PANEL_STARRY_ER88577
> > +     tristate "Starry er88577 panel"
> > +     depends on OF
> > +     depends on DRM_MIPI_DSI
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     help
> > +       Say Y if you want to enable support for panels based on the
> > +       Starry er88577 controller.
> > +
> >  config DRM_PANEL_SONY_ACX565AKM
> >       tristate "Sony ACX565AKM panel"
> >       depends on GPIOLIB && OF && SPI
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
> > index f0203f6e02f4..ecd843a6dc6e 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -81,6 +81,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) +=3D panel-=
sharp-ls060t1sx01.o
> >  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) +=3D panel-sitronix-st7701.o
> >  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) +=3D panel-sitronix-st7703.o
> >  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) +=3D panel-sitronix-st7789v.o
> > +obj-$(CONFIG_DRM_PANEL_STARRY_ER88577) +=3D panel-starry-er88577.o
> >  obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) +=3D panel-synaptics-r63353.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) +=3D panel-sony-acx565akm.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) +=3D panel-sony-td4353-jdi.o
> > diff --git a/drivers/gpu/drm/panel/panel-starry-er88577.c b/drivers/gpu=
/drm/panel/panel-starry-er88577.c
> > new file mode 100644
> > index 000000000000..a8250a464883
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-starry-er88577.c
> > @@ -0,0 +1,343 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Panels based on the JD9365DA display controller.
> > + * Author: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#include <video/mipi_display.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +struct starry_panel;
> > +
> > +struct panel_desc {
> > +     const struct drm_display_mode *modes;
> > +     unsigned int bpc;
> > +     unsigned long mode_flags;
> > +     enum mipi_dsi_pixel_format format;
> > +     const struct panel_init_cmd *init_cmds;
> > +     int (*init)(struct starry_panel *starry);
> > +     unsigned int lanes;
> > +     bool discharge_on_disable;
> > +     bool lp11_before_reset;
> > +     unsigned int power_off_delay_ms;
> > +};
> > +
> > +struct starry_panel {
> > +     struct drm_panel base;
> > +     struct mipi_dsi_device *dsi;
> > +
> > +     const struct panel_desc *desc;
> > +
> > +     enum drm_panel_orientation orientation;
> > +     struct regulator *vccio;
> > +     struct gpio_desc *reset;
> > +};
> > +
> > +static int starry_er88577_init(struct starry_panel *starry)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D starry->dsi =
};
> > +
> > +     /* T5:HWreset to init_code >=3D 120ms */
> > +     mipi_dsi_msleep(dsi_ctx, 120);
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xab, 0xba);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0xba, 0xab);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x10, 0x01, 0x47, 0x=
ff);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x0c, 0x14, 0x04, 0x=
50, 0x50, 0x14);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x56, 0x53, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x33, 0x30, 0x04);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0xb0, 0x00, 0x00, 0x=
10, 0x00, 0x10, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x05, 0x12, 0x29, 0x=
49, 0x40);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x7c, 0x61, 0x4f, 0x=
42, 0x3e, 0x2d, 0x31,
> > +                                  0x1a, 0x33, 0x33, 0x33, 0x52, 0x40, =
0x47, 0x38, 0x34, 0x26,
> > +                                  0x0e, 0x06, 0x7c, 0x61, 0x4f, 0x42, =
0x3e, 0x2d, 0x31, 0x1a,
> > +                                  0x33, 0x33, 0x33, 0x52, 0x40, 0x47, =
0x38, 0x34, 0x26, 0x0e,
> > +                                  0x06);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xcc, 0x76, 0x12, 0x=
34, 0x44, 0x44, 0x44,
> > +                                  0x44, 0x98, 0x04, 0x98, 0x04, 0x0f, =
0x00, 0x00, 0xc1);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x54, 0x94, 0x02, 0x=
85, 0x9f, 0x00, 0x6f,
> > +                                  0x00, 0x54, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x17, 0x09, 0x08, 0x=
89, 0x08, 0x11, 0x22,
> > +                                  0x20, 0x44, 0xff, 0x18, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x87, 0x47, 0x05, 0x=
05, 0x1c, 0x1c, 0x1d,
> > +                                  0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f, =
0x0f, 0x0f, 0x0d, 0x0d,
> > +                                  0x13, 0x13, 0x11, 0x11, 0x24);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x06, 0x06, 0x04, 0x=
04, 0x1c, 0x1c, 0x1d,
> > +                                  0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f, =
0x0e, 0x0e, 0x0c, 0x0c,
> > +                                  0x12, 0x12, 0x10, 0x10, 0x24);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x21, 0x00, 0x31, 0x=
42, 0x34, 0x16);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0xcb, 0x43);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x0e, 0x4b, 0x4b, 0x=
20, 0x19, 0x6b, 0x06,
> > +                                  0xb3);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0xe3, 0x2b, 0x38, 0x=
08);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x00, 0x01, 0x00, 0x=
0e, 0x04, 0x44, 0x08,
> > +                                  0x10, 0x00, 0x00, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x80, 0x09, 0xff, 0x=
ff, 0xff, 0xff, 0xff,
> > +                                  0xff);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x12, 0x03, 0x20, 0x=
00, 0xff);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x00);
>
> This looks pretty close to panel-boe-th101mb31ig002-28a.c
>
> > +
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +
>
>
> --
> With best wishes
> Dmitry
