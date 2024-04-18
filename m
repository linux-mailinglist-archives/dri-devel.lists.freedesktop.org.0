Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE478A9AEF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 15:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E99710FC55;
	Thu, 18 Apr 2024 13:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AqRv0m6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA74D10FC55
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 13:12:08 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so577927f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713445927; x=1714050727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pcBJ/DF05C27i4cBPqqkubOl3qolEJNyp0DCsRTy94=;
 b=AqRv0m6Yw3vrDbC8VY7+OTfWD+wyyqka2W4fE8XPiAdjlscmZNAMQwkPgqt8HaARmJ
 AcRkNDM5xq7Iv9lRgkFv8tXi9R615+JpfzWTwSAYi1Fl75+wCo9MGkkg9NGcw0kjFQCM
 Pr9mJWSr+cVdSJp1O31YC78fkB6GV25sWXT5r+KNPCPjCI/fiYkd3NcxDMxUKmiNDgbj
 8SIb7U+aRT8Eodpo5RTvWu14NDU22pA11pIwOVv0Dp/tA4N4mm1WvTE34abrkoPQcX/t
 8L1+JaGX16CGQWVTsamfGPg8Lt1xA6JA7T3I6GCeYtGep0Y0hn7t39FAZRmd/74IDB0e
 BC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713445927; x=1714050727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pcBJ/DF05C27i4cBPqqkubOl3qolEJNyp0DCsRTy94=;
 b=C/bKw/dW9pUWoEksPFzfk3laXwUAn9lChv+84BrUjp3NAPMeq/FFbyaBgSXrL7ljUz
 nJ3zSKxx31mnw5VP9CyN0b6dLasMbVWwjCfhGoqETB9t9fUwUXzJPAJxY48wxXVlD+PX
 L5xIXZOv8alLNROJyRRpp++dULzoUP2YjoAuw48V7NRUlcjrJPqfrAsmBFBm6AjWqkG5
 4ZfZEGZ7u+ARH4EbMzhu/4oYjBo5lGBwGXqWDrL5/v8WNLYxBARCaG5OMQRbYj0jT9dl
 pITTkQ6StvMl6ZZX2npS01NvipwzFW9zQCZ0aPLtJmJNr2N516vo4Qy+oBzLr0DUKsdh
 96zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBQnSceLVU/CdqTYtBSoAqiBAllsbqnVAXdOZqgnzrowuOA3YaTAHDHQmv9r6iJZ7Z8i/7RE5aTfNMR9hS+fvV98zjG6Wx7ZKl9QxUp4N+
X-Gm-Message-State: AOJu0YymKrnIGJb8h2cTxKoHQl3MLkSnBeh/v1DATBhfqM1lhVx948r9
 UtOrg5Lieseusdpq3tTHn/1HfSzyWnzKe/Gd3sbxjxIYFMqiO+8srPmH2bsznyaMINQv8AxF+aa
 j8xV6DJJGpkAEYAoziu1ptL3j5eogqInI5cqr
X-Google-Smtp-Source: AGHT+IEUCtmp/zbHscoV7GzmeG/IAIq9a/whcV284PzLMb7N9pyrM9efrUWMXit/VqjO//igOdDQnf4hdIzP3AAZ6CE=
X-Received: by 2002:adf:ee0a:0:b0:341:72b8:83b9 with SMTP id
 y10-20020adfee0a000000b0034172b883b9mr1600989wrn.68.1713445926380; Thu, 18
 Apr 2024 06:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418081548.12160-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
In-Reply-To: <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Thu, 18 Apr 2024 21:11:37 +0800
Message-ID: <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dianders@google.com, 
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

On Thu, Apr 18, 2024 at 7:46=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Apr 18, 2024 at 04:15:48PM +0800, lvzhaoxiong wrote:
> > The kingdisplay panel is based on JD9365DA controller.
> > Add a driver for it.
> >
> > Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/Kconfig                 |   9 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  .../drm/panel/panel-kingdisplay-kd101ne3.c    | 607 ++++++++++++++++++
> >  3 files changed, 617 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 154f5bf82980..2c73086cf102 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -297,6 +297,15 @@ config DRM_PANEL_KINGDISPLAY_KD097D04
> >         24 bit RGB per pixel. It provides a MIPI DSI interface to
> >         the host and has a built-in LED backlight.
> >
> > +config DRM_PANEL_KINGDISPLAY_KD101NE3
> > +     tristate "Kingdisplay kd101ne3 panel"
> > +     depends on OF
> > +     depends on DRM_MIPI_DSI
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     help
> > +       Say Y if you want to enable support for panels based on the
> > +       Kingdisplay kd101ne3 controller.
> > +
> >  config DRM_PANEL_LEADTEK_LTK050H3146W
> >       tristate "Leadtek LTK050H3146W panel"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
> > index 24a02655d726..cbd414b98bb0 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -30,6 +30,7 @@ obj-$(CONFIG_DRM_PANEL_JDI_LPM102A188A) +=3D panel-jd=
i-lpm102a188a.o
> >  obj-$(CONFIG_DRM_PANEL_JDI_R63452) +=3D panel-jdi-fhd-r63452.o
> >  obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) +=3D panel-khadas-ts050.o
> >  obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) +=3D panel-kingdisplay-kd=
097d04.o
> > +obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD101NE3) +=3D panel-kingdisplay-kd=
101ne3.o
> >  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) +=3D panel-leadtek-ltk050=
h3146w.o
> >  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) +=3D panel-leadtek-ltk500=
hd1829.o
> >  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) +=3D panel-lg-lb035q02.o
> > diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c b/drive=
rs/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > new file mode 100644
> > index 000000000000..dbf0992f8b81
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > @@ -0,0 +1,607 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Panels based on the JD9365DA display controller.
> > + * Author: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +struct panel_desc {
> > +     const struct drm_display_mode *modes;
> > +     unsigned int bpc;
> > +
> > +     /**
> > +      * @width_mm: width of the panel's active display area
> > +      * @height_mm: height of the panel's active display area
> > +      */
> > +     struct {
> > +             unsigned int width_mm;
> > +             unsigned int height_mm;
>
> Please move to the declared mode;
>
> > +     } size;
> > +
> > +     unsigned long mode_flags;
> > +     enum mipi_dsi_pixel_format format;
> > +     const struct panel_init_cmd *init_cmds;
> > +     unsigned int lanes;
> > +     bool discharge_on_disable;
> > +     bool lp11_before_reset;
> > +};
> > +
> > +struct kingdisplay_panel {
> > +     struct drm_panel base;
> > +     struct mipi_dsi_device *dsi;
> > +
> > +     const struct panel_desc *desc;
> > +
> > +     enum drm_panel_orientation orientation;
> > +     struct regulator *pp3300;
> > +     struct gpio_desc *enable_gpio;
> > +};
> > +
> > +enum dsi_cmd_type {
> > +     INIT_DCS_CMD,
> > +     DELAY_CMD,
> > +};
> > +
> > +struct panel_init_cmd {
> > +     enum dsi_cmd_type type;
> > +     size_t len;
> > +     const char *data;
> > +};
> > +
> > +#define _INIT_DCS_CMD(...) { \
> > +     .type =3D INIT_DCS_CMD, \
> > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > +     .data =3D (char[]){__VA_ARGS__} }
> > +
> > +#define _INIT_DELAY_CMD(...) { \
> > +     .type =3D DELAY_CMD,\
> > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > +     .data =3D (char[]){__VA_ARGS__} }
>
> This is the third panel driver using the same appoach. Can you use
> mipi_dsi_generic_write_seq() instead of the huge table? Or if you prefer
> the table, we should extract this framework to a common helper.
> (my preference is shifted towards mipi_dsi_generic_write_seq()).
>
The drawback of mipi_dsi_generic_write_seq() is that it can cause the
kernel size grows a lot since every sequence will be expanded.

Similar discussion in here:
https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpXMUg7FjYDh3-=3Dmv=
m_jS7TF1tsaAzbb4Uw@mail.gmail.com/

This patch would increase the module size from 157K to 572K.
scripts/bloat-o-meter shows chg +235.95%.

So maybe the common helper is better regarding the kernel module size?

> > +
> > +static const struct panel_init_cmd kingdisplay_kd101ne3_init_cmd[] =3D=
 {
> > +     _INIT_DELAY_CMD(50),
> > +     _INIT_DCS_CMD(0xE0, 0x00),
> > +     _INIT_DCS_CMD(0xE1, 0x93),
> > +     _INIT_DCS_CMD(0xE2, 0x65),
> > +     _INIT_DCS_CMD(0xE3, 0xF8),
> > +     _INIT_DCS_CMD(0x80, 0x03),
> > +     _INIT_DCS_CMD(0xE0, 0x01),
> > +     _INIT_DCS_CMD(0x0C, 0x74),
> > +     _INIT_DCS_CMD(0x17, 0x00),
> > +     _INIT_DCS_CMD(0x18, 0xC7),
> > +     _INIT_DCS_CMD(0x19, 0x01),
> > +     _INIT_DCS_CMD(0x1A, 0x00),
> > +     _INIT_DCS_CMD(0x1B, 0xC7),
> > +     _INIT_DCS_CMD(0x1C, 0x01),
> > +     _INIT_DCS_CMD(0x24, 0xFE),
> > +     _INIT_DCS_CMD(0x37, 0x19),
> > +     _INIT_DCS_CMD(0x35, 0x28),
> > +     _INIT_DCS_CMD(0x38, 0x05),
> > +     _INIT_DCS_CMD(0x39, 0x08),
> > +     _INIT_DCS_CMD(0x3A, 0x12),
> > +     _INIT_DCS_CMD(0x3C, 0x7E),
> > +     _INIT_DCS_CMD(0x3D, 0xFF),
> > +     _INIT_DCS_CMD(0x3E, 0xFF),
> > +     _INIT_DCS_CMD(0x3F, 0x7F),
> > +     _INIT_DCS_CMD(0x40, 0x06),
> > +     _INIT_DCS_CMD(0x41, 0xA0),
> > +     _INIT_DCS_CMD(0x43, 0x1E),
> > +     _INIT_DCS_CMD(0x44, 0x0B),
> > +     _INIT_DCS_CMD(0x55, 0x02),
> > +     _INIT_DCS_CMD(0x57, 0x6A),
> > +     _INIT_DCS_CMD(0x59, 0x0A),
> > +     _INIT_DCS_CMD(0x5A, 0x2E),
> > +     _INIT_DCS_CMD(0x5B, 0x1A),
> > +     _INIT_DCS_CMD(0x5C, 0x15),
> > +     _INIT_DCS_CMD(0x5D, 0x7F),
> > +     _INIT_DCS_CMD(0x5E, 0x61),
> > +     _INIT_DCS_CMD(0x5F, 0x50),
> > +     _INIT_DCS_CMD(0x60, 0x43),
> > +     _INIT_DCS_CMD(0x61, 0x3F),
> > +     _INIT_DCS_CMD(0x62, 0x32),
> > +     _INIT_DCS_CMD(0x63, 0x35),
> > +     _INIT_DCS_CMD(0x64, 0x1F),
> > +     _INIT_DCS_CMD(0x65, 0x38),
> > +     _INIT_DCS_CMD(0x66, 0x36),
> > +     _INIT_DCS_CMD(0x67, 0x36),
> > +     _INIT_DCS_CMD(0x68, 0x54),
> > +     _INIT_DCS_CMD(0x69, 0x42),
> > +     _INIT_DCS_CMD(0x6A, 0x48),
> > +     _INIT_DCS_CMD(0x6B, 0x39),
> > +     _INIT_DCS_CMD(0x6C, 0x34),
> > +     _INIT_DCS_CMD(0x6D, 0x26),
> > +     _INIT_DCS_CMD(0x6E, 0x14),
> > +     _INIT_DCS_CMD(0x6F, 0x02),
> > +     _INIT_DCS_CMD(0x70, 0x7F),
> > +     _INIT_DCS_CMD(0x71, 0x61),
> > +     _INIT_DCS_CMD(0x72, 0x50),
> > +     _INIT_DCS_CMD(0x73, 0x43),
> > +     _INIT_DCS_CMD(0x74, 0x3F),
> > +     _INIT_DCS_CMD(0x75, 0x32),
> > +     _INIT_DCS_CMD(0x76, 0x35),
> > +     _INIT_DCS_CMD(0x77, 0x1F),
> > +     _INIT_DCS_CMD(0x78, 0x38),
> > +     _INIT_DCS_CMD(0x79, 0x36),
> > +     _INIT_DCS_CMD(0x7A, 0x36),
> > +     _INIT_DCS_CMD(0x7B, 0x54),
> > +     _INIT_DCS_CMD(0x7C, 0x42),
> > +     _INIT_DCS_CMD(0x7D, 0x48),
> > +     _INIT_DCS_CMD(0x7E, 0x39),
> > +     _INIT_DCS_CMD(0x7F, 0x34),
> > +     _INIT_DCS_CMD(0x80, 0x26),
> > +     _INIT_DCS_CMD(0x81, 0x14),
> > +     _INIT_DCS_CMD(0x82, 0x02),
> > +     _INIT_DCS_CMD(0xE0, 0x02),
> > +     _INIT_DCS_CMD(0x00, 0x52),
> > +     _INIT_DCS_CMD(0x01, 0x5F),
> > +     _INIT_DCS_CMD(0x02, 0x5F),
> > +     _INIT_DCS_CMD(0x03, 0x50),
> > +     _INIT_DCS_CMD(0x04, 0x77),
> > +     _INIT_DCS_CMD(0x05, 0x57),
> > +     _INIT_DCS_CMD(0x06, 0x5F),
> > +     _INIT_DCS_CMD(0x07, 0x4E),
> > +     _INIT_DCS_CMD(0x08, 0x4C),
> > +     _INIT_DCS_CMD(0x09, 0x5F),
> > +     _INIT_DCS_CMD(0x0A, 0x4A),
> > +     _INIT_DCS_CMD(0x0B, 0x48),
> > +     _INIT_DCS_CMD(0x0C, 0x5F),
> > +     _INIT_DCS_CMD(0x0D, 0x46),
> > +     _INIT_DCS_CMD(0x0E, 0x44),
> > +     _INIT_DCS_CMD(0x0F, 0x40),
> > +     _INIT_DCS_CMD(0x10, 0x5F),
> > +     _INIT_DCS_CMD(0x11, 0x5F),
> > +     _INIT_DCS_CMD(0x12, 0x5F),
> > +     _INIT_DCS_CMD(0x13, 0x5F),
> > +     _INIT_DCS_CMD(0x14, 0x5F),
> > +     _INIT_DCS_CMD(0x15, 0x5F),
> > +     _INIT_DCS_CMD(0x16, 0x53),
> > +     _INIT_DCS_CMD(0x17, 0x5F),
> > +     _INIT_DCS_CMD(0x18, 0x5F),
> > +     _INIT_DCS_CMD(0x19, 0x51),
> > +     _INIT_DCS_CMD(0x1A, 0x77),
> > +     _INIT_DCS_CMD(0x1B, 0x57),
> > +     _INIT_DCS_CMD(0x1C, 0x5F),
> > +     _INIT_DCS_CMD(0x1D, 0x4F),
> > +     _INIT_DCS_CMD(0x1E, 0x4D),
> > +     _INIT_DCS_CMD(0x1F, 0x5F),
> > +     _INIT_DCS_CMD(0x20, 0x4B),
> > +     _INIT_DCS_CMD(0x21, 0x49),
> > +     _INIT_DCS_CMD(0x22, 0x5F),
> > +     _INIT_DCS_CMD(0x23, 0x47),
> > +     _INIT_DCS_CMD(0x24, 0x45),
> > +     _INIT_DCS_CMD(0x25, 0x41),
> > +     _INIT_DCS_CMD(0x26, 0x5F),
> > +     _INIT_DCS_CMD(0x27, 0x5F),
> > +     _INIT_DCS_CMD(0x28, 0x5F),
> > +     _INIT_DCS_CMD(0x29, 0x5F),
> > +     _INIT_DCS_CMD(0x2A, 0x5F),
> > +     _INIT_DCS_CMD(0x2B, 0x5F),
> > +     _INIT_DCS_CMD(0x2C, 0x13),
> > +     _INIT_DCS_CMD(0x2D, 0x1F),
> > +     _INIT_DCS_CMD(0x2E, 0x1F),
> > +     _INIT_DCS_CMD(0x2F, 0x01),
> > +     _INIT_DCS_CMD(0x30, 0x17),
> > +     _INIT_DCS_CMD(0x31, 0x17),
> > +     _INIT_DCS_CMD(0x32, 0x1F),
> > +     _INIT_DCS_CMD(0x33, 0x0D),
> > +     _INIT_DCS_CMD(0x34, 0x0F),
> > +     _INIT_DCS_CMD(0x35, 0x1F),
> > +     _INIT_DCS_CMD(0x36, 0x05),
> > +     _INIT_DCS_CMD(0x37, 0x07),
> > +     _INIT_DCS_CMD(0x38, 0x1F),
> > +     _INIT_DCS_CMD(0x39, 0x09),
> > +     _INIT_DCS_CMD(0x3A, 0x0B),
> > +     _INIT_DCS_CMD(0x3B, 0x11),
> > +     _INIT_DCS_CMD(0x3C, 0x1F),
> > +     _INIT_DCS_CMD(0x3D, 0x1F),
> > +     _INIT_DCS_CMD(0x3E, 0x1F),
> > +     _INIT_DCS_CMD(0x3F, 0x1F),
> > +     _INIT_DCS_CMD(0x40, 0x1F),
> > +     _INIT_DCS_CMD(0x41, 0x1F),
> > +     _INIT_DCS_CMD(0x42, 0x12),
> > +     _INIT_DCS_CMD(0x43, 0x1F),
> > +     _INIT_DCS_CMD(0x44, 0x1F),
> > +     _INIT_DCS_CMD(0x45, 0x00),
> > +     _INIT_DCS_CMD(0x46, 0x17),
> > +     _INIT_DCS_CMD(0x47, 0x17),
> > +     _INIT_DCS_CMD(0x48, 0x1F),
> > +     _INIT_DCS_CMD(0x49, 0x0C),
> > +     _INIT_DCS_CMD(0x4A, 0x0E),
> > +     _INIT_DCS_CMD(0x4B, 0x1F),
> > +     _INIT_DCS_CMD(0x4C, 0x04),
> > +     _INIT_DCS_CMD(0x4D, 0x06),
> > +     _INIT_DCS_CMD(0x4E, 0x1F),
> > +     _INIT_DCS_CMD(0x4F, 0x08),
> > +     _INIT_DCS_CMD(0x50, 0x0A),
> > +     _INIT_DCS_CMD(0x51, 0x10),
> > +     _INIT_DCS_CMD(0x52, 0x1F),
> > +     _INIT_DCS_CMD(0x53, 0x1F),
> > +     _INIT_DCS_CMD(0x54, 0x1F),
> > +     _INIT_DCS_CMD(0x55, 0x1F),
> > +     _INIT_DCS_CMD(0x56, 0x1F),
> > +     _INIT_DCS_CMD(0x57, 0x1F),
> > +     _INIT_DCS_CMD(0x58, 0x40),
> > +     _INIT_DCS_CMD(0x5B, 0x10),
> > +     _INIT_DCS_CMD(0x5C, 0x06),
> > +     _INIT_DCS_CMD(0x5D, 0x40),
> > +     _INIT_DCS_CMD(0x5E, 0x00),
> > +     _INIT_DCS_CMD(0x5F, 0x00),
> > +     _INIT_DCS_CMD(0x60, 0x40),
> > +     _INIT_DCS_CMD(0x61, 0x03),
> > +     _INIT_DCS_CMD(0x62, 0x04),
> > +     _INIT_DCS_CMD(0x63, 0x6C),
> > +     _INIT_DCS_CMD(0x64, 0x6C),
> > +     _INIT_DCS_CMD(0x65, 0x75),
> > +     _INIT_DCS_CMD(0x66, 0x08),
> > +     _INIT_DCS_CMD(0x67, 0xB4),
> > +     _INIT_DCS_CMD(0x68, 0x08),
> > +     _INIT_DCS_CMD(0x69, 0x6C),
> > +     _INIT_DCS_CMD(0x6A, 0x6C),
> > +     _INIT_DCS_CMD(0x6B, 0x0C),
> > +     _INIT_DCS_CMD(0x6D, 0x00),
> > +     _INIT_DCS_CMD(0x6E, 0x00),
> > +     _INIT_DCS_CMD(0x6F, 0x88),
> > +     _INIT_DCS_CMD(0x75, 0xBB),
> > +     _INIT_DCS_CMD(0x76, 0x00),
> > +     _INIT_DCS_CMD(0x77, 0x05),
> > +     _INIT_DCS_CMD(0x78, 0x2A),
> > +     _INIT_DCS_CMD(0xE0, 0x04),
> > +     _INIT_DCS_CMD(0x00, 0x0E),
> > +     _INIT_DCS_CMD(0x02, 0xB3),
> > +     _INIT_DCS_CMD(0x09, 0x61),
> > +     _INIT_DCS_CMD(0x0E, 0x48),
> > +
> > +     _INIT_DCS_CMD(0xE0, 0x00),
> > +     _INIT_DCS_CMD(0X11),
> > +     /* T6: 120ms */
> > +     _INIT_DELAY_CMD(120),
> > +     _INIT_DCS_CMD(0X29),
> > +     _INIT_DELAY_CMD(20),
> > +     {},
> > +};
> > +
> > +static inline struct kingdisplay_panel *to_kingdisplay_panel(struct dr=
m_panel *panel)
> > +{
> > +     return container_of(panel, struct kingdisplay_panel, base);
> > +}
> > +
> > +static int kingdisplay_panel_init_dcs_cmd(struct kingdisplay_panel *ki=
ngdisplay)
> > +{
> > +     struct mipi_dsi_device *dsi =3D kingdisplay->dsi;
> > +     struct drm_panel *panel =3D &kingdisplay->base;
> > +     int i, err =3D 0;
> > +
> > +     if (kingdisplay->desc->init_cmds) {
> > +             const struct panel_init_cmd *init_cmds =3D kingdisplay->d=
esc->init_cmds;
> > +
> > +             for (i =3D 0; init_cmds[i].len !=3D 0; i++) {
> > +                     const struct panel_init_cmd *cmd =3D &init_cmds[i=
];
> > +
> > +                     switch (cmd->type) {
> > +                     case DELAY_CMD:
> > +                             msleep(cmd->data[0]);
> > +                             err =3D 0;
> > +                             break;
> > +
> > +                     case INIT_DCS_CMD:
> > +                             err =3D mipi_dsi_dcs_write(dsi, cmd->data=
[0],
> > +                                                      cmd->len <=3D 1 =
? NULL :
> > +                                                      &cmd->data[1],
> > +                                                      cmd->len - 1);
> > +                             break;
> > +
> > +                     default:
> > +                             err =3D -EINVAL;
> > +                     }
> > +
> > +                     if (err < 0) {
> > +                             dev_err(panel->dev,
> > +                                     "failed to write command %u\n", i=
);
> > +                             return err;
> > +                     }
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int kingdisplay_panel_enter_sleep_mode(struct kingdisplay_panel=
 *kingdisplay)
> > +{
> > +     struct mipi_dsi_device *dsi =3D kingdisplay->dsi;
> > +     int ret;
> > +
> > +     dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +
> > +     usleep_range(1000, 2000);
> > +     ret =3D mipi_dsi_dcs_set_display_off(dsi);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     msleep(50);
> > +
> > +     ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int kingdisplay_panel_disable(struct drm_panel *panel)
> > +{
> > +     struct kingdisplay_panel *kingdisplay =3D to_kingdisplay_panel(pa=
nel);
> > +     int ret;
> > +
> > +     ret =3D kingdisplay_panel_enter_sleep_mode(kingdisplay);
> > +     if (ret < 0) {
> > +             dev_err(panel->dev, "failed to set panel off: %d\n", ret)=
;
> > +             return ret;
> > +     }
> > +
> > +     msleep(100);
> > +
> > +     return 0;
> > +}
> > +
> > +static int kingdisplay_panel_unprepare(struct drm_panel *panel)
> > +{
> > +     struct kingdisplay_panel *kingdisplay =3D to_kingdisplay_panel(pa=
nel);
> > +     int err;
> > +
> > +     gpiod_set_value_cansleep(kingdisplay->enable_gpio, 0);
> > +
> > +     /* T15: 2ms */
> > +     usleep_range(1000, 2000);
> > +
> > +     err =3D regulator_disable(kingdisplay->pp3300);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     return 0;
> > +}
> > +
> > +static int kingdisplay_panel_prepare(struct drm_panel *panel)
> > +{
> > +     struct kingdisplay_panel *kingdisplay =3D to_kingdisplay_panel(pa=
nel);
> > +     int ret;
> > +
> > +     gpiod_set_value(kingdisplay->enable_gpio, 0);
> > +
> > +     ret =3D regulator_enable(kingdisplay->pp3300);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* T1: 5ms */
> > +     usleep_range(5000, 6000);
> > +
> > +     if (kingdisplay->desc->lp11_before_reset) {
> > +             mipi_dsi_dcs_nop(kingdisplay->dsi);
> > +             usleep_range(1000, 2000);
> > +     }
> > +
> > +     /* T2: 10ms, T1 + T2 > 5ms*/
> > +     usleep_range(10000, 11000);
> > +
> > +     gpiod_set_value_cansleep(kingdisplay->enable_gpio, 1);
> > +
> > +     ret =3D kingdisplay_panel_init_dcs_cmd(kingdisplay);
> > +     if (ret < 0) {
> > +             dev_err(panel->dev, "failed to init panel: %d\n", ret);
> > +             goto poweroff;
> > +     }
> > +
> > +     return 0;
> > +
> > +poweroff:
> > +     regulator_disable(kingdisplay->pp3300);
> > +             /* T6: 2ms */
> > +     usleep_range(1000, 2000);
> > +     gpiod_set_value(kingdisplay->enable_gpio, 0);
> > +
> > +     return ret;
> > +}
> > +
> > +static int kingdisplay_panel_enable(struct drm_panel *panel)
> > +{
> > +     msleep(130);
> > +     return 0;
> > +}
> > +
> > +static const struct drm_display_mode kingdisplay_kd101ne3_40ti_default=
_mode =3D {
> > +     .clock =3D 70595,
> > +     .hdisplay =3D 800,
> > +     .hsync_start =3D 800 + 30,
> > +     .hsync_end =3D 800 + 30 + 30,
> > +     .htotal =3D 800 + 30 + 30 + 30,
> > +     .vdisplay =3D 1280,
> > +     .vsync_start =3D 1280 + 30,
> > +     .vsync_end =3D 1280 + 30 + 4,
> > +     .vtotal =3D 1280 + 30 + 4 + 8,
> > +     .type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> > +};
> > +
> > +static const struct panel_desc kingdisplay_kd101ne3_40ti_desc =3D {
> > +     .modes =3D &kingdisplay_kd101ne3_40ti_default_mode,
> > +     .bpc =3D 8,
> > +     .size =3D {
> > +             .width_mm =3D 135,
> > +             .height_mm =3D 216,
> > +     },
> > +     .lanes =3D 4,
> > +     .format =3D MIPI_DSI_FMT_RGB888,
> > +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE |
> > +                   MIPI_DSI_MODE_LPM,
> > +     .init_cmds =3D kingdisplay_kd101ne3_init_cmd,
> > +     .lp11_before_reset =3D true,
> > +};
> > +
> > +static int kingdisplay_panel_get_modes(struct drm_panel *panel,
> > +                            struct drm_connector *connector)
> > +{
> > +     struct kingdisplay_panel *kingdisplay =3D to_kingdisplay_panel(pa=
nel);
> > +     const struct drm_display_mode *m =3D kingdisplay->desc->modes;
> > +     struct drm_display_mode *mode;
> > +
> > +     mode =3D drm_mode_duplicate(connector->dev, m);
> > +     if (!mode) {
> > +             dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> > +                     m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> > +             return -ENOMEM;
> > +     }
> > +
> > +     mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > +     drm_mode_set_name(mode);
> > +     drm_mode_probed_add(connector, mode);
> > +
> > +     connector->display_info.width_mm =3D kingdisplay->desc->size.widt=
h_mm;
> > +     connector->display_info.height_mm =3D kingdisplay->desc->size.hei=
ght_mm;
>
> Please use drm_connector_helper_get_modes_fixed()
>
> > +     connector->display_info.bpc =3D kingdisplay->desc->bpc;
> > +     /*
> > +      * TODO: Remove once all drm drivers call
> > +      * drm_connector_set_orientation_from_panel()
>
> What is your usecase / platform? Are you using drm_bridge_connector? If n=
ot, why?
>
> > +      */
> > +     drm_connector_set_panel_orientation(connector, kingdisplay->orien=
tation);
> > +
> > +     return 1;
> > +}
> > +
> > +static enum drm_panel_orientation kingdisplay_panel_get_orientation(st=
ruct drm_panel *panel)
> > +{
> > +     struct kingdisplay_panel *kingdisplay =3D to_kingdisplay_panel(pa=
nel);
> > +
> > +     return kingdisplay->orientation;
> > +}
> > +
> > +static const struct drm_panel_funcs kingdisplay_panel_funcs =3D {
> > +     .disable =3D kingdisplay_panel_disable,
> > +     .unprepare =3D kingdisplay_panel_unprepare,
> > +     .prepare =3D kingdisplay_panel_prepare,
> > +     .enable =3D kingdisplay_panel_enable,
> > +     .get_modes =3D kingdisplay_panel_get_modes,
> > +     .get_orientation =3D kingdisplay_panel_get_orientation,
> > +};
> > +
> > +static int kingdisplay_panel_add(struct kingdisplay_panel *kingdisplay=
)
> > +{
> > +     struct device *dev =3D &kingdisplay->dsi->dev;
> > +     int err;
> > +
> > +     kingdisplay->pp3300 =3D devm_regulator_get(dev, "pp3300");
> > +     if (IS_ERR(kingdisplay->pp3300))
> > +             return PTR_ERR(kingdisplay->pp3300);
> > +
> > +
> > +     kingdisplay->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_=
OUT_LOW);
> > +     if (IS_ERR(kingdisplay->enable_gpio)) {
> > +             dev_err(dev, "cannot get reset-gpios %ld\n",
> > +                     PTR_ERR(kingdisplay->enable_gpio));
> > +             return PTR_ERR(kingdisplay->enable_gpio);
> > +     }
> > +
> > +     gpiod_set_value(kingdisplay->enable_gpio, 0);
> > +
> > +     drm_panel_init(&kingdisplay->base, dev, &kingdisplay_panel_funcs,
> > +                    DRM_MODE_CONNECTOR_DSI);
> > +     err =3D of_drm_get_panel_orientation(dev->of_node, &kingdisplay->=
orientation);
> > +     if (err < 0) {
> > +             dev_err(dev, "%pOF: failed to get orientation %d\n", dev-=
>of_node, err);
> > +             return err;
> > +     }
> > +
> > +     err =3D drm_panel_of_backlight(&kingdisplay->base);
> > +     if (err)
> > +             return err;
> > +
> > +     kingdisplay->base.funcs =3D &kingdisplay_panel_funcs;
> > +     kingdisplay->base.dev =3D &kingdisplay->dsi->dev;
> > +
> > +     drm_panel_add(&kingdisplay->base);
> > +
> > +     return 0;
> > +}
> > +
> > +static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct kingdisplay_panel *kingdisplay;
> > +     int ret;
> > +     const struct panel_desc *desc;
> > +
> > +     kingdisplay =3D devm_kzalloc(&dsi->dev, sizeof(*kingdisplay), GFP=
_KERNEL);
> > +     if (!kingdisplay)
> > +             return -ENOMEM;
> > +
> > +     desc =3D of_device_get_match_data(&dsi->dev);
> > +     dsi->lanes =3D desc->lanes;
> > +     dsi->format =3D desc->format;
> > +     dsi->mode_flags =3D desc->mode_flags;
> > +     kingdisplay->desc =3D desc;
> > +     kingdisplay->dsi =3D dsi;
> > +     ret =3D kingdisplay_panel_add(kingdisplay);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     mipi_dsi_set_drvdata(dsi, kingdisplay);
> > +
> > +     ret =3D mipi_dsi_attach(dsi);
> > +     if (ret)
> > +             drm_panel_remove(&kingdisplay->base);
> > +
> > +     return ret;
> > +}
> > +
> > +static void kingdisplay_panel_shutdown(struct mipi_dsi_device *dsi)
> > +{
> > +     struct kingdisplay_panel *kingdisplay =3D mipi_dsi_get_drvdata(ds=
i);
> > +
> > +     drm_panel_disable(&kingdisplay->base);
> > +     drm_panel_unprepare(&kingdisplay->base);
> > +}
> > +
> > +static void kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
> > +{
> > +     struct kingdisplay_panel *kingdisplay =3D mipi_dsi_get_drvdata(ds=
i);
> > +     int ret;
> > +
> > +     kingdisplay_panel_shutdown(dsi);
> > +
> > +     ret =3D mipi_dsi_detach(dsi);
> > +     if (ret < 0)
> > +             dev_err(&dsi->dev, "failed to detach from DSI host: %d\n"=
, ret);
> > +
> > +     if (kingdisplay->base.dev)
> > +             drm_panel_remove(&kingdisplay->base);
>
> You are adding it unconditionally, so there should be no condition on
> removal of the panel.
>
> > +}
> > +
> > +static const struct of_device_id kingdisplay_of_match[] =3D {
> > +     { .compatible =3D "kingdisplay,kd101ne3-40ti",
> > +       .data =3D &kingdisplay_kd101ne3_40ti_desc
> > +     },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, kingdisplay_of_match);
> > +
> > +static struct mipi_dsi_driver kingdisplay_panel_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "panel-kingdisplay-kd101ne3",
> > +             .of_match_table =3D kingdisplay_of_match,
> > +     },
> > +     .probe =3D kingdisplay_panel_probe,
> > +     .remove =3D kingdisplay_panel_remove,
> > +     .shutdown =3D kingdisplay_panel_shutdown,
> > +};
> > +module_mipi_dsi_driver(kingdisplay_panel_driver);
> > +
> > +MODULE_AUTHOR("Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.co=
m>");
> > +MODULE_DESCRIPTION("kingdisplay kd101ne3-40ti 800x1280 video mode pane=
l driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.17.1
> >
>
> --
> With best wishes
> Dmitry
