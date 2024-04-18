Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E204D8A9C52
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7467113CC5;
	Thu, 18 Apr 2024 14:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y0XQalP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B8E113CC5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:11:06 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d8a2cbe1baso12417431fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713449464; x=1714054264; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LNtnra4jIvx0MSD1gfimaj73u3w4g6I0rnPlaCiirlk=;
 b=y0XQalP189PGcEFkXBCbqJopidi3cjp3ib7Sx2zzUIhB+2vFT+xGVhPtri6FQ1INuU
 OT823JzufggmWexU0A6ynlARWZ/E7lrSjNUaj0OCFYGsIRMlFlbHYTPXp+tuEcILQThg
 ZVMMSEaphRw5Se9CZ1v6NMTv8SnVbLs8j8S317KprmXRg070IZZnurMTeMuO1EI/Yd46
 eQJKNqqCswLdO+OhW4hFvRVfKK3dmzmF04jgAVeKFKOleaw/c5kpYcZ7p+920RtOGyOc
 7lTAx2CALe8kQlJVG2g8JxX/+zrVyEboetPBVARx1iJwiq5Tx/RO0wZgwkIxVW7yUI3V
 HGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449464; x=1714054264;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LNtnra4jIvx0MSD1gfimaj73u3w4g6I0rnPlaCiirlk=;
 b=fltrOjH4U0aoTzhNwuJq0dYfJ6/0KRAUlma4m/2oFoao6ahxTkEypDkFQx12XHI78m
 6Z42VCOfH+bSux3ahLle/iM3veU5NM/wvuvRRAV4MKpuXbl5y11Cw0p4Qr/Vs86/oKG4
 GIB7UGtMzQSIZsLbnTssbROHDG5tHoa+CVAgosVrSWGYAeZMLxQ4hdbYKMVGE4MDZ7W7
 R/Qr51s4v635L9J7KUCnMpgXdmb+DA5deF1Vu6Nd+6LADv+oQnNYkhCXmI5BeUP+lH+B
 r0kK3p24pA9kkkFfPANO7CyY3sB0AhVezmzUPfPRqr6r/CkdNID6nhf9rjVtvkNCIW8o
 kUQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHGbFXVe0g20EujPr2OWQM2dSovDwRQXv7FDYhglY4tW+fQhPYF2QUOYegePDnQdzWMKlW8TUa6Wst+B8jH2FYBIW+TVzMtgTFa6+xPUoB
X-Gm-Message-State: AOJu0YzYA2pLbsb/dcGA7yIteXSgK1GQShIrhxWetkYu0Q6a9UavDKz6
 WhvCDQ44nftQY0+4im1Fb5rULrrK/2N4n+Yg4P9R8f7ubgoeErp2AHz9T8gR3FA=
X-Google-Smtp-Source: AGHT+IFdCUq3VqS+paDye/Ke7ewPYXel2f5bzxTKTI331K5OcS+VUSO1hNgDYfa3ldwMDWUI512s/Q==
X-Received: by 2002:a2e:9789:0:b0:2da:5f41:10c8 with SMTP id
 y9-20020a2e9789000000b002da5f4110c8mr2170989lji.3.1713449464276; 
 Thu, 18 Apr 2024 07:11:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 z28-20020a2eb53c000000b002d6c88b9addsm213024ljm.50.2024.04.18.07.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:11:03 -0700 (PDT)
Date: Thu, 18 Apr 2024 17:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hsin-Yi Wang <hsinyi@google.com>
Cc: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>, 
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dianders@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
Message-ID: <vbt2nxddw2dc7hkreq4iybv5zv5xyp32oajybeqsphgfrhzmn7@tskvckljmxpe>
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418081548.12160-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
 <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
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

On Thu, Apr 18, 2024 at 09:11:37PM +0800, Hsin-Yi Wang wrote:
> On Thu, Apr 18, 2024 at 7:46 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, Apr 18, 2024 at 04:15:48PM +0800, lvzhaoxiong wrote:
> > > The kingdisplay panel is based on JD9365DA controller.
> > > Add a driver for it.
> > >
> > > Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
> > > ---
> > >  drivers/gpu/drm/panel/Kconfig                 |   9 +
> > >  drivers/gpu/drm/panel/Makefile                |   1 +
> > >  .../drm/panel/panel-kingdisplay-kd101ne3.c    | 607 ++++++++++++++++++
> > >  3 files changed, 617 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > >
> > > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > > index 154f5bf82980..2c73086cf102 100644
> > > --- a/drivers/gpu/drm/panel/Kconfig
> > > +++ b/drivers/gpu/drm/panel/Kconfig
> > > @@ -297,6 +297,15 @@ config DRM_PANEL_KINGDISPLAY_KD097D04
> > >         24 bit RGB per pixel. It provides a MIPI DSI interface to
> > >         the host and has a built-in LED backlight.
> > >
> > > +config DRM_PANEL_KINGDISPLAY_KD101NE3
> > > +     tristate "Kingdisplay kd101ne3 panel"
> > > +     depends on OF
> > > +     depends on DRM_MIPI_DSI
> > > +     depends on BACKLIGHT_CLASS_DEVICE
> > > +     help
> > > +       Say Y if you want to enable support for panels based on the
> > > +       Kingdisplay kd101ne3 controller.
> > > +
> > >  config DRM_PANEL_LEADTEK_LTK050H3146W
> > >       tristate "Leadtek LTK050H3146W panel"
> > >       depends on OF
> > > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > > index 24a02655d726..cbd414b98bb0 100644
> > > --- a/drivers/gpu/drm/panel/Makefile
> > > +++ b/drivers/gpu/drm/panel/Makefile
> > > @@ -30,6 +30,7 @@ obj-$(CONFIG_DRM_PANEL_JDI_LPM102A188A) += panel-jdi-lpm102a188a.o
> > >  obj-$(CONFIG_DRM_PANEL_JDI_R63452) += panel-jdi-fhd-r63452.o
> > >  obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
> > >  obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
> > > +obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD101NE3) += panel-kingdisplay-kd101ne3.o
> > >  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
> > >  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
> > >  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
> > > diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > > new file mode 100644
> > > index 000000000000..dbf0992f8b81
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > > @@ -0,0 +1,607 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Panels based on the JD9365DA display controller.
> > > + * Author: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/regulator/consumer.h>
> > > +
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_mipi_dsi.h>
> > > +#include <drm/drm_panel.h>
> > > +
> > > +#include <video/mipi_display.h>
> > > +
> > > +struct panel_desc {
> > > +     const struct drm_display_mode *modes;
> > > +     unsigned int bpc;
> > > +
> > > +     /**
> > > +      * @width_mm: width of the panel's active display area
> > > +      * @height_mm: height of the panel's active display area
> > > +      */
> > > +     struct {
> > > +             unsigned int width_mm;
> > > +             unsigned int height_mm;
> >
> > Please move to the declared mode;
> >
> > > +     } size;
> > > +
> > > +     unsigned long mode_flags;
> > > +     enum mipi_dsi_pixel_format format;
> > > +     const struct panel_init_cmd *init_cmds;
> > > +     unsigned int lanes;
> > > +     bool discharge_on_disable;
> > > +     bool lp11_before_reset;
> > > +};
> > > +
> > > +struct kingdisplay_panel {
> > > +     struct drm_panel base;
> > > +     struct mipi_dsi_device *dsi;
> > > +
> > > +     const struct panel_desc *desc;
> > > +
> > > +     enum drm_panel_orientation orientation;
> > > +     struct regulator *pp3300;
> > > +     struct gpio_desc *enable_gpio;
> > > +};
> > > +
> > > +enum dsi_cmd_type {
> > > +     INIT_DCS_CMD,
> > > +     DELAY_CMD,
> > > +};
> > > +
> > > +struct panel_init_cmd {
> > > +     enum dsi_cmd_type type;
> > > +     size_t len;
> > > +     const char *data;
> > > +};
> > > +
> > > +#define _INIT_DCS_CMD(...) { \
> > > +     .type = INIT_DCS_CMD, \
> > > +     .len = sizeof((char[]){__VA_ARGS__}), \
> > > +     .data = (char[]){__VA_ARGS__} }
> > > +
> > > +#define _INIT_DELAY_CMD(...) { \
> > > +     .type = DELAY_CMD,\
> > > +     .len = sizeof((char[]){__VA_ARGS__}), \
> > > +     .data = (char[]){__VA_ARGS__} }
> >
> > This is the third panel driver using the same appoach. Can you use
> > mipi_dsi_generic_write_seq() instead of the huge table? Or if you prefer
> > the table, we should extract this framework to a common helper.
> > (my preference is shifted towards mipi_dsi_generic_write_seq()).
> >
> The drawback of mipi_dsi_generic_write_seq() is that it can cause the
> kernel size grows a lot since every sequence will be expanded.
> 
> Similar discussion in here:
> https://lore.kernel.org/dri-devel/CAD=FV=Wju3WS45=EpXMUg7FjYDh3-=mvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> 
> This patch would increase the module size from 157K to 572K.
> scripts/bloat-o-meter shows chg +235.95%.
> 
> So maybe the common helper is better regarding the kernel module size?

Yes, let's get a framework done in a useful way.
I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_range() should be
used instead (and it's up to the developer to select correct delay
function).

> 
> > > +
> > > +static const struct panel_init_cmd kingdisplay_kd101ne3_init_cmd[] = {
> > > +     _INIT_DELAY_CMD(50),
> > > +     _INIT_DCS_CMD(0xE0, 0x00),

[skipped the body of the table]

> > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > +
> > > +     _INIT_DCS_CMD(0xE0, 0x00),

> > > +     _INIT_DCS_CMD(0X11),

Also, at least this is mipi_dsi_dcs_exit_sleep_mode().

> > > +     /* T6: 120ms */
> > > +     _INIT_DELAY_CMD(120),
> > > +     _INIT_DCS_CMD(0X29),

And this is mipi_dsi_dcs_set_display_on().

Having a single table enourages people to put known commands into the
table, the practice that must be frowned upon and forbidden.

We have functions for some of the standard DCS commands. So, maybe
instead of adding a single-table based approach we can improve
mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by moving the
error handling to a common part of enable() / prepare() function.

> > > +     _INIT_DELAY_CMD(20),
> > > +     {},
> > > +};

-- 
With best wishes
Dmitry
