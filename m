Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEFE4E2369
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 10:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430A810E1A4;
	Mon, 21 Mar 2022 09:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A839810E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 09:36:28 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id e3so12537535pjm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s2P5Lw/DsAKf7yY0qEaJNmwr7N89ocRPuK2j4JhWlrc=;
 b=KT7QeMz1NqB+HMsVwUXmk861vvvxxOdOWCEd5bpQVVmeoxmTa0JpALgY2aUl7ImAeB
 7ndwN1oj3D8d7FXI8cSgzNYUvcTwCEcsmO+ORo0r4G/CGjTVZQatY8cJWfVAjK8OzuCn
 eSo3yGGRc0yOJns4AGBSXjfzRSH4x7fDQQiohtfcuUY8upJsOyDkuGsj5+OEwu4QiNga
 odEgAA7VRXahtIngThDgle3xywRchZRiETzMWQ7SZS84NF+8XSsl32FoXKUvfvbAcKZh
 pOCSWPaF83NWdUHLg6H9azV8S/QQ4mxBIoaxwHrG2z7/eGFEfc00zdTh2A5fkcgg0WpM
 VQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s2P5Lw/DsAKf7yY0qEaJNmwr7N89ocRPuK2j4JhWlrc=;
 b=jkLORHptVn1aXq5MAXrZJowT3DDyn5lWFacuJrfkrAVPDsVW1qurt0xTqpR1+bfFCc
 s3yB2f9a5bNh9y02uJfcSjFtTpTCedIX9qg1mFWddMSSHxt5Mdg/Hw2ZjrUj9t6DlK+u
 +A+txsA4LrCEbJ0fkrxk8nZ6XedgFO5NN8EFlhcEUnLyYC7LvWdOuENF4Wo0FVAJQY7Z
 4lbfZ3AIAAYlp+vv4xFcMvG1L7Z9UFXa1i9u8PK05IqR/naOw4XyJzsu5rxnqODuLJ5g
 jA/4CQDMOw0KRsiE+cerd621joZDKZAIyROhINCqaj55nGq79/Uf9EGK9JgOaboRjzPh
 oVAw==
X-Gm-Message-State: AOAM5336nVDe4vJg8OhvuptwwCh0qIaombcHqaSQx3ikVR9HFBcUhuYp
 qZXF3+p2VPPCYGfhbzuf59wNPJY/egDjUpaJChA=
X-Google-Smtp-Source: ABdhPJwhclQAU0bcNNzQNAYvSMp3963FNp9lNNfK8TA41DuF3UR2CMJUXgoMgYeHVkDUp2IwX/SlZ1844df4xvsbhyA=
X-Received: by 2002:a17:902:c412:b0:154:4012:4beb with SMTP id
 k18-20020a170902c41200b0015440124bebmr8002715plk.107.1647855388012; Mon, 21
 Mar 2022 02:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220311170240.173846-1-cbranchereau@gmail.com>
 <20220311170240.173846-3-cbranchereau@gmail.com>
 <YjD1rl7jSxLvJhfL@ravnborg.org>
In-Reply-To: <YjD1rl7jSxLvJhfL@ravnborg.org>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Mon, 21 Mar 2022 10:36:16 +0100
Message-ID: <CAFsFa87NBB8VFFHJKjyPi+A255i9dyE-xxTggz3kLcEXmSWJXg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add panel driver for NewVision NV3052C
 based LCDs
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
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
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam

On Tue, Mar 15, 2022 at 9:23 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Christophe,
> On Fri, Mar 11, 2022 at 06:02:38PM +0100, Christophe Branchereau wrote:
> > This driver supports the NewVision NV3052C based LCDs. Right now, it
> > only supports the LeadTek LTK035C5444T 2.4" 640x480 TFT LCD panel, which
> > can be found in the Anbernic RG-350M handheld console.
>
> I had to get away from my day-time job and you were the lucky winner.
> A couple of comments in the following that you can address now or later.
>
> >
> > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/panel/Kconfig                 |   9 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  .../gpu/drm/panel/panel-newvision-nv3052c.c   | 497 ++++++++++++++++++
> >  3 files changed, 507 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index bb2e47229c68..40084f709789 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -283,6 +283,15 @@ config DRM_PANEL_NEC_NL8048HL11
> >         panel (found on the Zoom2/3/3630 SDP boards). To compile this driver
> >         as a module, choose M here.
> >
> > +config DRM_PANEL_NEWVISION_NV3052C
> > +     tristate "NewVision NV3052C RGB/SPI panel"
> > +     depends on OF && SPI
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     select DRM_MIPI_DBI
> > +     help
> > +       Say Y here if you want to enable support for the panels built
> > +       around the NewVision NV3052C display controller.
> > +
> >  config DRM_PANEL_NOVATEK_NT35510
> >       tristate "Novatek NT35510 RGB panel driver"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > index 5740911f637c..42a7ab54234b 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
> >  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
> >  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
> >  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
> > +obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
> >  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
> >  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
> >  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
> > diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> > new file mode 100644
> > index 000000000000..fc31df0dee12
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> > @@ -0,0 +1,497 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * NevVision NV3052C IPS LCD panel driver
> > + *
> > + * Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
> > + * Copyright (C) 2022, Christophe Branchereau <cbranchereau@gmail.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/spi/spi.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +
> > +struct nv3052c_panel_info {
> > +     const struct drm_display_mode *display_modes;
> > +     unsigned int num_modes;
> > +     u16 width_mm, height_mm;
> > +     u32 bus_format, bus_flags;
> > +};
> > +
> > +struct nv3052c {
> > +     struct device *dev;
> > +     struct drm_panel panel;
> > +     struct mipi_dbi dbi;
> > +
> > +     const struct nv3052c_panel_info *panel_info;
> > +
> > +     struct regulator *supply;
> > +     struct gpio_desc *reset_gpio;
> > +};
> > +
> > +struct nv3052c_reg {
> > +     u8 cmd;
> > +     u8 val;
> > +};
> > +
> > +static const struct nv3052c_reg nv3052c_panel_regs[] = {
> > +     { 0xff, 0x30 },
> > +     { 0xff, 0x52 },
> > +     { 0xff, 0x01 },
> > +     { 0xe3, 0x00 },
> > +     { 0x40, 0x00 },
> > +     { 0x03, 0x40 },
> > +     { 0x04, 0x00 },
> > +     { 0x05, 0x03 },
> > +     { 0x08, 0x00 },
> > +     { 0x09, 0x07 },
> > +     { 0x0a, 0x01 },
> > +     { 0x0b, 0x32 },
> > +     { 0x0c, 0x32 },
> > +     { 0x0d, 0x0b },
> > +     { 0x0e, 0x00 },
> > +     { 0x23, 0xa0 },
> > +
> > +     { 0x24, 0x0c },
> > +     { 0x25, 0x06 },
> > +     { 0x26, 0x14 },
> > +     { 0x27, 0x14 },
> > +
> > +     { 0x38, 0xcc },
> > +     { 0x39, 0xd7 },
> > +     { 0x3a, 0x4a },
> > +
> > +     { 0x28, 0x40 },
> > +     { 0x29, 0x01 },
> > +     { 0x2a, 0xdf },
> > +     { 0x49, 0x3c },
> > +     { 0x91, 0x77 },
> > +     { 0x92, 0x77 },
> > +     { 0xa0, 0x55 },
> > +     { 0xa1, 0x50 },
> > +     { 0xa4, 0x9c },
> > +     { 0xa7, 0x02 },
> > +     { 0xa8, 0x01 },
> > +     { 0xa9, 0x01 },
> > +     { 0xaa, 0xfc },
> > +     { 0xab, 0x28 },
> > +     { 0xac, 0x06 },
> > +     { 0xad, 0x06 },
> > +     { 0xae, 0x06 },
> > +     { 0xaf, 0x03 },
> > +     { 0xb0, 0x08 },
> > +     { 0xb1, 0x26 },
> > +     { 0xb2, 0x28 },
> > +     { 0xb3, 0x28 },
> > +     { 0xb4, 0x33 },
> > +     { 0xb5, 0x08 },
> > +     { 0xb6, 0x26 },
> > +     { 0xb7, 0x08 },
> > +     { 0xb8, 0x26 },
> > +     { 0xf0, 0x00 },
> > +     { 0xf6, 0xc0 },
> > +
> > +     { 0xff, 0x30 },
> > +     { 0xff, 0x52 },
> > +     { 0xff, 0x02 },
> > +     { 0xb0, 0x0b },
> > +     { 0xb1, 0x16 },
> > +     { 0xb2, 0x17 },
> > +     { 0xb3, 0x2c },
> > +     { 0xb4, 0x32 },
> > +     { 0xb5, 0x3b },
> > +     { 0xb6, 0x29 },
> > +     { 0xb7, 0x40 },
> > +     { 0xb8, 0x0d },
> > +     { 0xb9, 0x05 },
> > +     { 0xba, 0x12 },
> > +     { 0xbb, 0x10 },
> > +     { 0xbc, 0x12 },
> > +     { 0xbd, 0x15 },
> > +     { 0xbe, 0x19 },
> > +     { 0xbf, 0x0e },
> > +     { 0xc0, 0x16 },
> > +     { 0xc1, 0x0a },
> > +     { 0xd0, 0x0c },
> > +     { 0xd1, 0x17 },
> > +     { 0xd2, 0x14 },
> > +     { 0xd3, 0x2e },
> > +     { 0xd4, 0x32 },
> > +     { 0xd5, 0x3c },
> > +     { 0xd6, 0x22 },
> > +     { 0xd7, 0x3d },
> > +     { 0xd8, 0x0d },
> > +     { 0xd9, 0x07 },
> > +     { 0xda, 0x13 },
> > +     { 0xdb, 0x13 },
> > +     { 0xdc, 0x11 },
> > +     { 0xdd, 0x15 },
> > +     { 0xde, 0x19 },
> > +     { 0xdf, 0x10 },
> > +     { 0xe0, 0x17 },
> > +     { 0xe1, 0x0a },
> > +
> > +     { 0xff, 0x30 },
> > +     { 0xff, 0x52 },
> > +     { 0xff, 0x03 },
> > +     { 0x00, 0x2a },
> > +     { 0x01, 0x2a },
> > +     { 0x02, 0x2a },
> > +     { 0x03, 0x2a },
> > +     { 0x04, 0x61 },
> > +     { 0x05, 0x80 },
> > +     { 0x06, 0xc7 },
> > +     { 0x07, 0x01 },
> > +     { 0x08, 0x03 },
> > +     { 0x09, 0x04 },
> > +     { 0x70, 0x22 },
> > +     { 0x71, 0x80 },
> > +     { 0x30, 0x2a },
> > +     { 0x31, 0x2a },
> > +     { 0x32, 0x2a },
> > +     { 0x33, 0x2a },
> > +     { 0x34, 0x61 },
> > +     { 0x35, 0xc5 },
> > +     { 0x36, 0x80 },
> > +     { 0x37, 0x23 },
> > +     { 0x40, 0x03 },
> > +     { 0x41, 0x04 },
> > +     { 0x42, 0x05 },
> > +     { 0x43, 0x06 },
> > +     { 0x44, 0x11 },
> > +     { 0x45, 0xe8 },
> > +     { 0x46, 0xe9 },
> > +     { 0x47, 0x11 },
> > +     { 0x48, 0xea },
> > +     { 0x49, 0xeb },
> > +     { 0x50, 0x07 },
> > +     { 0x51, 0x08 },
> > +     { 0x52, 0x09 },
> > +     { 0x53, 0x0a },
> > +     { 0x54, 0x11 },
> > +     { 0x55, 0xec },
> > +     { 0x56, 0xed },
> > +     { 0x57, 0x11 },
> > +     { 0x58, 0xef },
> > +     { 0x59, 0xf0 },
> > +     { 0xb1, 0x01 },
> > +     { 0xb4, 0x15 },
> > +     { 0xb5, 0x16 },
> > +     { 0xb6, 0x09 },
> > +     { 0xb7, 0x0f },
> > +     { 0xb8, 0x0d },
> > +     { 0xb9, 0x0b },
> > +     { 0xba, 0x00 },
> > +     { 0xc7, 0x02 },
> > +     { 0xca, 0x17 },
> > +     { 0xcb, 0x18 },
> > +     { 0xcc, 0x0a },
> > +     { 0xcd, 0x10 },
> > +     { 0xce, 0x0e },
> > +     { 0xcf, 0x0c },
> > +     { 0xd0, 0x00 },
> > +     { 0x81, 0x00 },
> > +     { 0x84, 0x15 },
> > +     { 0x85, 0x16 },
> > +     { 0x86, 0x10 },
> > +     { 0x87, 0x0a },
> > +     { 0x88, 0x0c },
> > +     { 0x89, 0x0e },
> > +     { 0x8a, 0x02 },
> > +     { 0x97, 0x00 },
> > +     { 0x9a, 0x17 },
> > +     { 0x9b, 0x18 },
> > +     { 0x9c, 0x0f },
> > +     { 0x9d, 0x09 },
> > +     { 0x9e, 0x0b },
> > +     { 0x9f, 0x0d },
> > +     { 0xa0, 0x01 },
> > +
> > +     { 0xff, 0x30 },
> > +     { 0xff, 0x52 },
> > +     { 0xff, 0x02 },
> > +     { 0x01, 0x01 },
> > +     { 0x02, 0xda },
> > +     { 0x03, 0xba },
> > +     { 0x04, 0xa8 },
> > +     { 0x05, 0x9a },
> > +     { 0x06, 0x70 },
> > +     { 0x07, 0xff },
> > +     { 0x08, 0x91 },
> > +     { 0x09, 0x90 },
> > +     { 0x0a, 0xff },
> > +     { 0x0b, 0x8f },
> > +     { 0x0c, 0x60 },
> > +     { 0x0d, 0x58 },
> > +     { 0x0e, 0x48 },
> > +     { 0x0f, 0x38 },
> > +     { 0x10, 0x2b },
> > +
> > +     { 0xff, 0x30 },
> > +     { 0xff, 0x52 },
> > +     { 0xff, 0x00 },
> > +     { 0x36, 0x0a },
> > +};
> There are some random (?) empty lines.
> If they have any significance then a short comment would be nice.
> If not, then drop the empty lines.
>

The empty lines are not random no, to access a different page in the
init, one must write i.e.   { 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff,
0x02 }, to access page 2, so they add a little bit of readability.

But I can drop them indeed. as well as for the includes and struct on
top, to make it more compact.

> > +
> > +static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
> > +{
> > +     return container_of(panel, struct nv3052c, panel);
> > +}
> > +
> > +static int nv3052c_prepare(struct drm_panel *panel)
> > +{
> > +     struct nv3052c *priv = to_nv3052c(panel);
> > +     struct mipi_dbi *dbi = &priv->dbi;
> > +     unsigned int i;
> > +     int err;
> > +
> > +     err = regulator_enable(priv->supply);
> > +     if (err) {
> > +             dev_err(priv->dev, "Failed to enable power supply: %d\n", err);
> > +             return err;
> > +     }
> > +
> > +     /* Reset the chip */
> > +     gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > +     usleep_range(10, 1000);
> > +     gpiod_set_value_cansleep(priv->reset_gpio, 0);
> > +     msleep(5);
> > +
> > +     for (i = 0; i < ARRAY_SIZE(nv3052c_panel_regs); i++) {
> > +             err = mipi_dbi_command(dbi, nv3052c_panel_regs[i].cmd,
> > +                                    nv3052c_panel_regs[i].val);
> > +
> > +             if (err) {
> > +                     dev_err(priv->dev, "Unable to set register: %d\n", err);
> > +                     goto err_disable_regulator;
> > +             }
> > +     }
> > +
> > +     err = mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> > +     if (err) {
> > +             dev_err(priv->dev, "Unable to exit sleep mode: %d\n", err);
> > +             goto err_disable_regulator;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_disable_regulator:
> > +     regulator_disable(priv->supply);
> > +     return err;
> > +}
> > +
> > +static int nv3052c_unprepare(struct drm_panel *panel)
> > +{
> > +     struct nv3052c *priv = to_nv3052c(panel);
> > +     struct mipi_dbi *dbi = &priv->dbi;
> > +     int err;
> > +
> > +     err = mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
> > +     if (err) {
> > +             dev_err(priv->dev, "Unable to enter sleep mode: %d\n", err);
> > +             return err;
> Consider to just continue here. In case we fail to enter sleep mode we
> will anyway reset the panel and disable the supply voltage.
> So things will likely work anyway and we avoid a display with power
> where it was supposed to be disabled.
> I bet many panels uses the same pattern as this driver, but I think that
> continue is the right thing to do here.
>
Yes, you're right.

>
> > +     }
> > +
> > +     gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > +     regulator_disable(priv->supply);
> > +
> > +     return 0;
> > +}
>
> Everything else looked good - nicely written driver.
>
>         Sam

Thank you

>
> > +
> > +static int nv3052c_enable(struct drm_panel *panel)
> > +{
> > +     struct nv3052c *priv = to_nv3052c(panel);
> > +     struct mipi_dbi *dbi = &priv->dbi;
> > +     int err;
> > +
> > +     err = mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> > +     if (err) {
> > +             dev_err(priv->dev, "Unable to enable display: %d\n", err);
> > +             return err;
> > +     }
> > +
> > +     if (panel->backlight) {
> > +             /* Wait for the picture to be ready before enabling backlight */
> > +             msleep(120);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nv3052c_disable(struct drm_panel *panel)
> > +{
> > +     struct nv3052c *priv = to_nv3052c(panel);
> > +     struct mipi_dbi *dbi = &priv->dbi;
> > +     int err;
> > +
> > +     err = mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
> > +     if (err) {
> > +             dev_err(priv->dev, "Unable to disable display: %d\n", err);
> > +             return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nv3052c_get_modes(struct drm_panel *panel,
> > +                          struct drm_connector *connector)
> > +{
> > +     struct nv3052c *priv = to_nv3052c(panel);
> > +     const struct nv3052c_panel_info *panel_info = priv->panel_info;
> > +     struct drm_display_mode *mode;
> > +     unsigned int i;
> > +
> > +     for (i = 0; i < panel_info->num_modes; i++) {
> > +             mode = drm_mode_duplicate(connector->dev,
> > +                                       &panel_info->display_modes[i]);
> > +             if (!mode)
> > +                     return -ENOMEM;
> > +
> > +             drm_mode_set_name(mode);
> > +
> > +             mode->type = DRM_MODE_TYPE_DRIVER;
> > +             if (panel_info->num_modes == 1)
> > +                     mode->type |= DRM_MODE_TYPE_PREFERRED;
> > +
> > +             drm_mode_probed_add(connector, mode);
> > +     }
> > +
> > +     connector->display_info.bpc = 8;
> > +     connector->display_info.width_mm = panel_info->width_mm;
> > +     connector->display_info.height_mm = panel_info->height_mm;
> > +
> > +     drm_display_info_set_bus_formats(&connector->display_info,
> > +                                      &panel_info->bus_format, 1);
> > +     connector->display_info.bus_flags = panel_info->bus_flags;
> > +
> > +     return panel_info->num_modes;
> > +}
> > +
> > +static const struct drm_panel_funcs nv3052c_funcs = {
> > +     .prepare        = nv3052c_prepare,
> > +     .unprepare      = nv3052c_unprepare,
> > +     .enable         = nv3052c_enable,
> > +     .disable        = nv3052c_disable,
> > +     .get_modes      = nv3052c_get_modes,
> > +};
> > +
> > +static int nv3052c_probe(struct spi_device *spi)
> > +{
> > +     struct device *dev = &spi->dev;
> > +     struct nv3052c *priv;
> > +     int err;
> > +
> > +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->dev = dev;
> > +
> > +     priv->panel_info = of_device_get_match_data(dev);
> > +     if (!priv->panel_info)
> > +             return -EINVAL;
> > +
> > +     priv->supply = devm_regulator_get(dev, "power");
> > +     if (IS_ERR(priv->supply))
> > +             return dev_err_probe(dev, PTR_ERR(priv->supply), "Failed to get power supply\n");
> > +
> > +     priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +     if (IS_ERR(priv->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(priv->reset_gpio), "Failed to get reset GPIO\n");
> > +
> > +     err = mipi_dbi_spi_init(spi, &priv->dbi, NULL);
> > +     if (err)
> > +             return dev_err_probe(dev, err, "MIPI DBI init failed\n");
> > +
> > +     priv->dbi.read_commands = NULL;
> > +
> > +     spi_set_drvdata(spi, priv);
> > +
> > +     drm_panel_init(&priv->panel, dev, &nv3052c_funcs,
> > +                    DRM_MODE_CONNECTOR_DPI);
> > +
> > +     err = drm_panel_of_backlight(&priv->panel);
> > +     if (err)
> > +             return dev_err_probe(dev, err, "Failed to attach backlight\n");
> > +
> > +     drm_panel_add(&priv->panel);
> > +
> > +     return 0;
> > +}
> > +
> > +static int nv3052c_remove(struct spi_device *spi)
> > +{
> > +     struct nv3052c *priv = spi_get_drvdata(spi);
> > +
> > +     drm_panel_remove(&priv->panel);
> > +     drm_panel_disable(&priv->panel);
> > +     drm_panel_unprepare(&priv->panel);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct drm_display_mode ltk035c5444t_modes[] = {
> > +     { /* 60 Hz */
> > +             .clock = 24000,
> > +             .hdisplay = 640,
> > +             .hsync_start = 640 + 96,
> > +             .hsync_end = 640 + 96 + 16,
> > +             .htotal = 640 + 96 + 16 + 48,
> > +             .vdisplay = 480,
> > +             .vsync_start = 480 + 5,
> > +             .vsync_end = 480 + 5 + 2,
> > +             .vtotal = 480 + 5 + 2 + 13,
> > +             .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +     },
> > +     { /* 50 Hz */
> > +             .clock = 18000,
> > +             .hdisplay = 640,
> > +             .hsync_start = 640 + 39,
> > +             .hsync_end = 640 + 39 + 2,
> > +             .htotal = 640 + 39 + 2 + 39,
> > +             .vdisplay = 480,
> > +             .vsync_start = 480 + 5,
> > +             .vsync_end = 480 + 5 + 2,
> > +             .vtotal = 480 + 5 + 2 + 13,
> > +             .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +     },
> > +};
> > +
> > +static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
> > +     .display_modes = ltk035c5444t_modes,
> > +     .num_modes = ARRAY_SIZE(ltk035c5444t_modes),
> > +     .width_mm = 77,
> > +     .height_mm = 64,
> > +     .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > +     .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > +};
> > +
> > +static const struct of_device_id nv3052c_of_match[] = {
> > +     { .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, nv3052c_of_match);
> > +
> > +static struct spi_driver nv3052c_driver = {
> > +     .driver = {
> > +             .name = "nv3052c",
> > +             .of_match_table = nv3052c_of_match,
> > +     },
> > +     .probe = nv3052c_probe,
> > +     .remove = nv3052c_remove,
> > +};
> > +module_spi_driver(nv3052c_driver);
> > +
> > +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
> > +MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.35.1
