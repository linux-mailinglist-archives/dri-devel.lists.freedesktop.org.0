Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE328AF650
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 20:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B01911356C;
	Tue, 23 Apr 2024 18:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qhsayX47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E077C11356C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 18:10:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41adf552d74so3821835e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 11:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713895832; x=1714500632;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wl2ct4hkdwUhx5/aeg9lOPHNV+QD++rylKxscdt/bF4=;
 b=qhsayX47cPMoH174FuaDHDxpifHxlVSsJ1QnYDXM1OcvpCvaAFqTJOMe3FVHhNCWfl
 HkF7GsCqFuXbyPfe40YJQU75KeyOQR+kspKXwW6g9Hrfl5o+bnQjw/VkA7vaHCJTno8Z
 Um8SbL9TYnpv7+iqXh6vsr9A4WEekTMVMvOYoc3jSx74lgaUBcKyU/a1ESoKXJbXfWJp
 7h+4dDlBqhXCrbKfacLvibNM7f4k56HQN2LXbdivhqyFu1i8N9j0LFuJfeWqlYlf9Pso
 lvTp176C0NxaR0Fysp1oKwnx5xL3zFbcSAS9UGbdp87xc1EH+aaaNNaZayVQ4KsYdFoJ
 60kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713895832; x=1714500632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wl2ct4hkdwUhx5/aeg9lOPHNV+QD++rylKxscdt/bF4=;
 b=hrexPlomQH9Ufu9qutbW72t4wbTLew+AVYd9kxt+iOvH47b5ymjBiTeFpP5s6RwNjf
 pLNhJDprjN31jQhy0dPY7lRTX7I5YQDfj7EUz6ptYIP+3nynwaWsuFHADTM1fkYTHIqi
 AAmG1SJVQzGMFT7eZcuha62vgsWdZry1AILcB4WRfjTpm+Zj74B6TTh7RPl5S9MQt6bn
 2UrVR+Zexd9gl5KU1dLzsrZ/+IoaQM6IwHvI+IUdifd/Ms6Dksc4vx8OmjPajBXfDfPy
 cl9roGzZkTVOdHaYyveAJPS69UcVSPVFokMJMhO91njf0MVLrobMb17wSz9WeAfrrGYY
 UBcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWDsSveJR/9r8GtB28D3WAI9yOqX7/4alE95JRSVSwmTpRA8dQLJN3JSNVMi8fFj0hj5573RtlybmvRdaJKEkvIa36NUvjB3epWEuolwkO
X-Gm-Message-State: AOJu0YxaOz5uj/wn8tRTdGYpC/b3sKURORq6rcTnRUcZfb/XyrF9047i
 0JyxmE5qPIf/bH77ryhtuP13QAgzBApVnR7o+LeW+ZI3qMCCtupu0UsZJ6B8Do0CBkesferRM9z
 nVMYLDjYgKgbWvwRkUdNylDaxDHY52RVvf58n
X-Google-Smtp-Source: AGHT+IFFYQ6yDh91vFBzxgZW+1q5Z+Ylw9RzRb7kgpgzvmMuVBW1eUvQTyJzbETI8cyjFIL2yqPiZ1EjCyLfp9CT/Nc=
X-Received: by 2002:a5d:590f:0:b0:34b:3374:bc26 with SMTP id
 v15-20020a5d590f000000b0034b3374bc26mr3444655wrd.65.1713895831867; Tue, 23
 Apr 2024 11:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418081548.12160-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
 <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
 <vbt2nxddw2dc7hkreq4iybv5zv5xyp32oajybeqsphgfrhzmn7@tskvckljmxpe>
In-Reply-To: <vbt2nxddw2dc7hkreq4iybv5zv5xyp32oajybeqsphgfrhzmn7@tskvckljmxpe>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Tue, 23 Apr 2024 11:10:03 -0700
Message-ID: <CACb=7PVTvV9nsFu1ZAXu7YTjSOAGZka+c__EJq3J3qgSJGEShw@mail.gmail.com>
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

On Thu, Apr 18, 2024 at 7:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Apr 18, 2024 at 09:11:37PM +0800, Hsin-Yi Wang wrote:
> > On Thu, Apr 18, 2024 at 7:46=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, Apr 18, 2024 at 04:15:48PM +0800, lvzhaoxiong wrote:
> > > > The kingdisplay panel is based on JD9365DA controller.
> > > > Add a driver for it.
> > > >
> > > > Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.=
com>
> > > > ---
> > > >  drivers/gpu/drm/panel/Kconfig                 |   9 +
> > > >  drivers/gpu/drm/panel/Makefile                |   1 +
> > > >  .../drm/panel/panel-kingdisplay-kd101ne3.c    | 607 ++++++++++++++=
++++
> > > >  3 files changed, 617 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/panel/panel-kingdisplay-kd101ne=
3.c
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/=
Kconfig
> > > > index 154f5bf82980..2c73086cf102 100644
> > > > --- a/drivers/gpu/drm/panel/Kconfig
> > > > +++ b/drivers/gpu/drm/panel/Kconfig
> > > > @@ -297,6 +297,15 @@ config DRM_PANEL_KINGDISPLAY_KD097D04
> > > >         24 bit RGB per pixel. It provides a MIPI DSI interface to
> > > >         the host and has a built-in LED backlight.
> > > >
> > > > +config DRM_PANEL_KINGDISPLAY_KD101NE3
> > > > +     tristate "Kingdisplay kd101ne3 panel"
> > > > +     depends on OF
> > > > +     depends on DRM_MIPI_DSI
> > > > +     depends on BACKLIGHT_CLASS_DEVICE
> > > > +     help
> > > > +       Say Y if you want to enable support for panels based on the
> > > > +       Kingdisplay kd101ne3 controller.
> > > > +
> > > >  config DRM_PANEL_LEADTEK_LTK050H3146W
> > > >       tristate "Leadtek LTK050H3146W panel"
> > > >       depends on OF
> > > > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel=
/Makefile
> > > > index 24a02655d726..cbd414b98bb0 100644
> > > > --- a/drivers/gpu/drm/panel/Makefile
> > > > +++ b/drivers/gpu/drm/panel/Makefile
> > > > @@ -30,6 +30,7 @@ obj-$(CONFIG_DRM_PANEL_JDI_LPM102A188A) +=3D pane=
l-jdi-lpm102a188a.o
> > > >  obj-$(CONFIG_DRM_PANEL_JDI_R63452) +=3D panel-jdi-fhd-r63452.o
> > > >  obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) +=3D panel-khadas-ts050.o
> > > >  obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) +=3D panel-kingdispla=
y-kd097d04.o
> > > > +obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD101NE3) +=3D panel-kingdispla=
y-kd101ne3.o
> > > >  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) +=3D panel-leadtek-lt=
k050h3146w.o
> > > >  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) +=3D panel-leadtek-lt=
k500hd1829.o
> > > >  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) +=3D panel-lg-lb035q02.o
> > > > diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c b/d=
rivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > > > new file mode 100644
> > > > index 000000000000..dbf0992f8b81
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > > > @@ -0,0 +1,607 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Panels based on the JD9365DA display controller.
> > > > + * Author: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.co=
m>
> > > > + */
> > > > +
> > > > +#include <linux/delay.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_device.h>
> > > > +#include <linux/regulator/consumer.h>
> > > > +
> > > > +#include <drm/drm_connector.h>
> > > > +#include <drm/drm_crtc.h>
> > > > +#include <drm/drm_mipi_dsi.h>
> > > > +#include <drm/drm_panel.h>
> > > > +
> > > > +#include <video/mipi_display.h>
> > > > +
> > > > +struct panel_desc {
> > > > +     const struct drm_display_mode *modes;
> > > > +     unsigned int bpc;
> > > > +
> > > > +     /**
> > > > +      * @width_mm: width of the panel's active display area
> > > > +      * @height_mm: height of the panel's active display area
> > > > +      */
> > > > +     struct {
> > > > +             unsigned int width_mm;
> > > > +             unsigned int height_mm;
> > >
> > > Please move to the declared mode;
> > >
> > > > +     } size;
> > > > +
> > > > +     unsigned long mode_flags;
> > > > +     enum mipi_dsi_pixel_format format;
> > > > +     const struct panel_init_cmd *init_cmds;
> > > > +     unsigned int lanes;
> > > > +     bool discharge_on_disable;
> > > > +     bool lp11_before_reset;
> > > > +};
> > > > +
> > > > +struct kingdisplay_panel {
> > > > +     struct drm_panel base;
> > > > +     struct mipi_dsi_device *dsi;
> > > > +
> > > > +     const struct panel_desc *desc;
> > > > +
> > > > +     enum drm_panel_orientation orientation;
> > > > +     struct regulator *pp3300;
> > > > +     struct gpio_desc *enable_gpio;
> > > > +};
> > > > +
> > > > +enum dsi_cmd_type {
> > > > +     INIT_DCS_CMD,
> > > > +     DELAY_CMD,
> > > > +};
> > > > +
> > > > +struct panel_init_cmd {
> > > > +     enum dsi_cmd_type type;
> > > > +     size_t len;
> > > > +     const char *data;
> > > > +};
> > > > +
> > > > +#define _INIT_DCS_CMD(...) { \
> > > > +     .type =3D INIT_DCS_CMD, \
> > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > +
> > > > +#define _INIT_DELAY_CMD(...) { \
> > > > +     .type =3D DELAY_CMD,\
> > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > +     .data =3D (char[]){__VA_ARGS__} }
> > >
> > > This is the third panel driver using the same appoach. Can you use
> > > mipi_dsi_generic_write_seq() instead of the huge table? Or if you pre=
fer
> > > the table, we should extract this framework to a common helper.
> > > (my preference is shifted towards mipi_dsi_generic_write_seq()).
> > >
> > The drawback of mipi_dsi_generic_write_seq() is that it can cause the
> > kernel size grows a lot since every sequence will be expanded.
> >
> > Similar discussion in here:
> > https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpXMUg7FjYDh3-=
=3Dmvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> >
> > This patch would increase the module size from 157K to 572K.
> > scripts/bloat-o-meter shows chg +235.95%.
> >
> > So maybe the common helper is better regarding the kernel module size?
>
> Yes, let's get a framework done in a useful way.
> I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_range() should be
> used instead (and it's up to the developer to select correct delay
> function).
>
> >
> > > > +
> > > > +static const struct panel_init_cmd kingdisplay_kd101ne3_init_cmd[]=
 =3D {
> > > > +     _INIT_DELAY_CMD(50),
> > > > +     _INIT_DCS_CMD(0xE0, 0x00),
>
> [skipped the body of the table]
>
> > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > +
> > > > +     _INIT_DCS_CMD(0xE0, 0x00),
>
> > > > +     _INIT_DCS_CMD(0X11),
>
> Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
>
> > > > +     /* T6: 120ms */
> > > > +     _INIT_DELAY_CMD(120),
> > > > +     _INIT_DCS_CMD(0X29),
>
> And this is mipi_dsi_dcs_set_display_on().
>
> Having a single table enourages people to put known commands into the
> table, the practice that must be frowned upon and forbidden.
>
> We have functions for some of the standard DCS commands. So, maybe
> instead of adding a single-table based approach we can improve
> mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by moving the
> error handling to a common part of enable() / prepare() function.
>

For this panel, I think it can also refer to how
panel-kingdisplay-kd097d04.c does. Create the table for init cmd data,
not what operation to use, and use mipi_dsi_generic_write_seq() when
looping through the table.


> > > > +     _INIT_DELAY_CMD(20),
> > > > +     {},
> > > > +};
>
> --
> With best wishes
> Dmitry
