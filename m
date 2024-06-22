Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BAB913298
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 09:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66D810E12B;
	Sat, 22 Jun 2024 07:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uo0LDaST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D717910E12B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 07:37:01 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-630daaec9c7so26214277b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 00:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719041820; x=1719646620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjLuZ9inbFoMpW0veWSS5+5irgFSGhkT1Wp76Bpgxx0=;
 b=Uo0LDaSTkp2m3ZpbG8Vmm+oUWe0mZ6mrWPmyJyJRUcVz/apibsHpflwn9SS3OJ0r+b
 GRwU9i3g8HOLG12QspCUKqTSs0Bu86bq3Lqh46QGkG6R19kE8tERlPFCSnRixEZ4Y3P1
 5mPdKCVGAMeb5UUdfDuWGoxEe97MbpnRlFgo4Bq9OhGXBWC4vN4nt4LDHVZ1PIuckCsX
 WdbR6VowUZxcUs4UaWJHNAB6eo47lGeGOw0LGMVhs+mCRyWg7oVtczJyWn6Lp/xQnGqb
 O+umRpByyAsu1wSjShX/ROabeWofPt28Y8DB8+VxF83CwgscUd0/djPlEgInbnsyiXp7
 lMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719041820; x=1719646620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjLuZ9inbFoMpW0veWSS5+5irgFSGhkT1Wp76Bpgxx0=;
 b=di6pRcuv0bd0hiW5duTSW5NdUnqTG7cpN9sHj5K22qa065GvoFShPLM5gsmGffaR5d
 NtepCBcqTBwiBv2+JSV8ZHK3P3iTap5dCgk/UuxVg8E8dJJdtmNxudBAaUeltLmbntCA
 hS93xueS5ROi/XrQsOGNkhJeLk5YzZqNJcoSoCS/l7bU4mu+vvog6qDAW9uFS+se5vDc
 lI8qVAKvZxD9GrTbe73fpBc89d620VyfPb0NsgnLxxkTptIBY3Yq6KSYCRiGx/O12JW4
 QnBgGqN5hYqiPA5iPK0EbLUbXhN90jgpmm4BgWAsN+1zbG50pb0SskgTv47C6v3hQ+mz
 7KwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeNsng9HHxlLw7mCfTILUpbVuL4jJodPzH571m0YMD0zpti2AxFUOIX7c5n+bwDBGXrfR4zYQ7Qrh0xB2o1hX7+JXx/5IiCb5kyDlcfEcG
X-Gm-Message-State: AOJu0YywRx3fi0njvjVIyUCZKdsdjPhiHN3yXOGXxMPyR80quz6rq+nJ
 Tp8xuqZO7rrMjRXu+KaYvfx3eturrsaHN67MUyXSct+AZgo3aWganPfKax/Y9Ha7R3U7OqU/ZNo
 B0jjjpQdgjdipx46FuTpTGuER4I0=
X-Google-Smtp-Source: AGHT+IF+ra8yyDtFTgSxn9+dmmEY/iK2jLtuTpWD2RYFXgFS7nSiy4PtN3wjErIm5rEsTFuoKCJPUshJ/I41TrqPSEk=
X-Received: by 2002:a0d:d342:0:b0:61a:ca09:dae3 with SMTP id
 00721157ae682-63a8e4bb138mr113037457b3.26.1719041820395; Sat, 22 Jun 2024
 00:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240618081515.1215552-1-kikuchan98@gmail.com>
 <20240618081515.1215552-3-kikuchan98@gmail.com>
 <de5e45eb-4885-4c4b-ab49-f350d82537f3@quicinc.com>
In-Reply-To: <de5e45eb-4885-4c4b-ab49-f350d82537f3@quicinc.com>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Sat, 22 Jun 2024 16:36:49 +0900
Message-ID: <CAG40kxGkXw7fsb47NZmNJ-dqF003Gf6qSfSSGO_ea0yKi5ymOQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/panel: st7701: Add support for SPI for
 configuration
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
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

Hello Jessica,

Thank you for your review and reply!

On Sat, Jun 22, 2024 at 5:31=E2=80=AFAM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
>
>
> On 6/18/2024 1:15 AM, Hironori KIKUCHI wrote:
> > The ST7701 supports not only MIPI DSI, but also SPI as an interface
> > for configuration. To support a panel connected via RGB parallel
> > interface, add support for SPI using MIPI DBI helpers.
> >
> > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/Kconfig                 |   2 +
> >   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 211 ++++++++++++++---=
-
> >   2 files changed, 172 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 2ae0eb0638f..1831544400d 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -755,7 +755,9 @@ config DRM_PANEL_SHARP_LS060T1SX01
> >   config DRM_PANEL_SITRONIX_ST7701
> >       tristate "Sitronix ST7701 panel driver"
> >       depends on OF
> > +     depends on SPI
> >       depends on DRM_MIPI_DSI
> > +     select DRM_MIPI_DBI
> >       depends on BACKLIGHT_CLASS_DEVICE
> >       help
> >         Say Y here if you want to enable support for the Sitronix
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gp=
u/drm/panel/panel-sitronix-st7701.c
> > index 421eb4592b6..3c4a66f2fc7 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> > @@ -4,6 +4,7 @@
> >    * Author: Jagan Teki <jagan@amarulasolutions.com>
> >    */
> >
> > +#include <drm/drm_mipi_dbi.h>
> >   #include <drm/drm_mipi_dsi.h>
> >   #include <drm/drm_modes.h>
> >   #include <drm/drm_panel.h>
> > @@ -14,6 +15,7 @@
> >   #include <linux/module.h>
> >   #include <linux/of.h>
> >   #include <linux/regulator/consumer.h>
> > +#include <linux/spi/spi.h>
> >
> >   #include <video/mipi_display.h>
> >
> > @@ -130,12 +132,16 @@ struct st7701_panel_desc {
> >   struct st7701 {
> >       struct drm_panel panel;
> >       struct mipi_dsi_device *dsi;
> > +     struct mipi_dbi dbi;
> >       const struct st7701_panel_desc *desc;
> >
> >       struct regulator_bulk_data supplies[2];
> >       struct gpio_desc *reset;
> >       unsigned int sleep_delay;
> >       enum drm_panel_orientation orientation;
> > +
> > +     int (*write_command)(struct st7701 *st7701, u8 cmd, const u8 *seq=
,
> > +                          size_t len);
> >   };
> >
> >   static inline struct st7701 *panel_to_st7701(struct drm_panel *panel)
> > @@ -143,16 +149,22 @@ static inline struct st7701 *panel_to_st7701(stru=
ct drm_panel *panel)
> >       return container_of(panel, struct st7701, panel);
> >   }
> >
> > -static inline int st7701_dsi_write(struct st7701 *st7701, const void *=
seq,
> > -                                size_t len)
> > +static int st7701_dsi_write(struct st7701 *st7701, u8 cmd, const u8 *s=
eq,
> > +                         size_t len)
> >   {
> > -     return mipi_dsi_dcs_write_buffer(st7701->dsi, seq, len);
> > +     return mipi_dsi_dcs_write(st7701->dsi, cmd, seq, len);
> >   }
> >
> > -#define ST7701_DSI(st7701, seq...)                           \
> > -     {                                                       \
> > -             const u8 d[] =3D { seq };                         \
> > -             st7701_dsi_write(st7701, d, ARRAY_SIZE(d));     \
> > +static int st7701_dbi_write(struct st7701 *st7701, u8 cmd, const u8 *s=
eq,
> > +                         size_t len)
> > +{
> > +     return mipi_dbi_command_stackbuf(&st7701->dbi, cmd, seq, len);
> > +}
> > +
> > +#define ST7701_DSI(st7701, cmd, seq...)
>
> Hi Hironori,
>
> Is it really correct to keep this as *_DSI? Since the macro can
> theoretically support either DBI or DSI write commands, maybe this
> should be renamed to something more generic.
>
>                                 \
> > +     {                                                               \
> > +             const u8 d[] =3D { seq };                                =
 \
> > +             st7701->write_command(st7701, cmd, d, ARRAY_SIZE(d));   \
> >       }
> >
> >   static u8 st7701_vgls_map(struct st7701 *st7701)
> > @@ -211,10 +223,10 @@ static void st7701_init_sequence(struct st7701 *s=
t7701)
> >       /* Command2, BK0 */
> >       st7701_switch_cmd_bkx(st7701, true, 0);
> >
> > -     mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_PVGAMCTRL,
> > -                        desc->pv_gamma, ARRAY_SIZE(desc->pv_gamma));
> > -     mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_NVGAMCTRL,
> > -                        desc->nv_gamma, ARRAY_SIZE(desc->nv_gamma));
> > +     st7701->write_command(st7701, DSI_CMD2_BK0_PVGAMCTRL, desc->pv_ga=
mma,
>
> Same here for the DSI_CMD2_* macros.
>

Right...
I'll change them to ST7701_WIRTE() and ST7701_CMD* respectively.
Thanks.


> > +                           ARRAY_SIZE(desc->pv_gamma));
> > +     st7701->write_command(st7701, DSI_CMD2_BK0_NVGAMCTRL, desc->nv_ga=
mma,
> > +                           ARRAY_SIZE(desc->nv_gamma));
> >       /*
> >        * Vertical line count configuration:
> >        * Line[6:0]: select number of vertical lines of the TFT matrix i=
n
> > @@ -974,42 +986,47 @@ static const struct st7701_panel_desc rg_arc_desc=
 =3D {
> >       .gip_sequence =3D rg_arc_gip_sequence,
> >   };
> >
> > -static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
> > +static void st7701_cleanup(void *data)
> > +{
> > +     struct st7701 *st7701 =3D (struct st7701 *)data;
> > +
> > +     drm_panel_remove(&st7701->panel);
> > +}
> > +
> > +static int st7701_probe(struct device *dev, int connector_type)
> >   {
> >       const struct st7701_panel_desc *desc;
> >       struct st7701 *st7701;
> >       int ret;
> >
> > -     st7701 =3D devm_kzalloc(&dsi->dev, sizeof(*st7701), GFP_KERNEL);
> > +     desc =3D of_device_get_match_data(dev);
> > +     if (!desc)
> > +             return -ENODEV;
> > +
> > +     st7701 =3D devm_kzalloc(dev, sizeof(*st7701), GFP_KERNEL);
> >       if (!st7701)
> >               return -ENOMEM;
> >
> > -     desc =3D of_device_get_match_data(&dsi->dev);
> > -     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST |
> > -                       MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUO=
US;
> > -     dsi->format =3D desc->format;
> > -     dsi->lanes =3D desc->lanes;
> > -
> > +     st7701->desc =3D desc;
> >       st7701->supplies[0].supply =3D "VCC";
> >       st7701->supplies[1].supply =3D "IOVCC";
> >
> > -     ret =3D devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(st7701->sup=
plies),
> > +     ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(st7701->supplies)=
,
> >                                     st7701->supplies);
> >       if (ret < 0)
> >               return ret;
> >
> > -     st7701->reset =3D devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LO=
W);
> > +     st7701->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >       if (IS_ERR(st7701->reset)) {
> > -             dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
> > +             dev_err(dev, "Couldn't get our reset GPIO\n");
> >               return PTR_ERR(st7701->reset);
> >       }
> >
> > -     ret =3D of_drm_get_panel_orientation(dsi->dev.of_node, &st7701->o=
rientation);
> > +     ret =3D of_drm_get_panel_orientation(dev->of_node, &st7701->orien=
tation);
> >       if (ret < 0)
> > -             return dev_err_probe(&dsi->dev, ret, "Failed to get orien=
tation\n");
> > +             return dev_err_probe(dev, ret, "Failed to get orientation=
\n");
> >
> > -     drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
> > -                    DRM_MODE_CONNECTOR_DSI);
> > +     drm_panel_init(&st7701->panel, dev, &st7701_funcs, connector_type=
);
> >
> >       /**
> >        * Once sleep out has been issued, ST7701 IC required to wait 120=
ms
> > @@ -1026,21 +1043,77 @@ static int st7701_dsi_probe(struct mipi_dsi_dev=
ice *dsi)
> >       if (ret)
> >               return ret;
> >
> > +     dev_set_drvdata(dev, st7701);
> > +
> >       drm_panel_add(&st7701->panel);
> >
> > -     mipi_dsi_set_drvdata(dsi, st7701);
> > -     st7701->dsi =3D dsi;
> > -     st7701->desc =3D desc;
> > -
> > -     ret =3D mipi_dsi_attach(dsi);
> > +     ret =3D devm_add_action_or_reset(dev, st7701_cleanup, st7701);
>
> Is the intention here to move to using the devm framework? Also, just
> wondering, what advantages does this implementation have over the
> original implementation?

Uh, maybe no?
Actually not intended, but I just want to avoid the need to call
drm_panel_remove() manually and carefully in both st7701_dsi_probe()
and st7701_spi_probe() after calling st7701_probe().

Oh, in this way, I've just noticed that drm_panel_remove() might no
longer need to be explicitly called in st7701_remove(), perhaps?

>
> >       if (ret)
> > -             goto err_attach;
> > +             return ret;
>
> If you're removing the `goto` here, you could probably drop this entire
> check and just `return ret` at the end of the function.

Right, thanks.

>
> >
> >       return 0;
> > +}
> >
> > -err_attach:
> > -     drm_panel_remove(&st7701->panel);
> > -     return ret;
> > +static void st7701_remove(struct st7701 *st7701)
> > +{
> > +     st7701_cleanup(st7701);
>
> Why add an extra helper that's essentially just a wrapper for another
> helper? Why can't we directly call st7701_cleanup()?

To avoid a cast, because I'm unsure which is preferred in kernel...
Would it be better like this?

return devm_add_action_or_reset(dev, (void (*)(void *))st7701_remove, st770=
1);

or, more directly

return devm_add_action_or_reset(dev, (void (*)(void
*))drm_panel_remove, &st7701->panel);

This emphasizes a relation to the preceding drm_panel_add().

>
> Thanks,
>
> Jessica Zhang
>
> > +}
> > +
> > +static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct st7701 *st7701;
> > +     int err;
> > +
> > +     err =3D st7701_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
> > +     if (err)
> > +             return err;
> > +
> > +     st7701 =3D dev_get_drvdata(&dsi->dev);
> > +     st7701->dsi =3D dsi;
> > +     st7701->write_command =3D st7701_dsi_write;
> > +
> > +     if (!st7701->desc->lanes)
> > +             return dev_err_probe(&dsi->dev, err, "This panel is not f=
or MIPI DSI\n");
> > +
> > +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST |
> > +                       MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUO=
US;
> > +     dsi->format =3D st7701->desc->format;
> > +     dsi->lanes =3D st7701->desc->lanes;
> > +
> > +     mipi_dsi_set_drvdata(dsi, st7701);
> > +
> > +     err =3D mipi_dsi_attach(dsi);
> > +     if (err)
> > +             return dev_err_probe(&dsi->dev, err, "Failed to init MIPI=
 DSI\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static int st7701_spi_probe(struct spi_device *spi)
> > +{
> > +     struct st7701 *st7701;
> > +     struct gpio_desc *dc;
> > +     int err;
> > +
> > +     err =3D st7701_probe(&spi->dev, DRM_MODE_CONNECTOR_DPI);
> > +     if (err)
> > +             return err;
> > +
> > +     st7701 =3D dev_get_drvdata(&spi->dev);
> > +     st7701->write_command =3D st7701_dbi_write;
> > +
> > +     dc =3D devm_gpiod_get_optional(&spi->dev, "dc", GPIOD_OUT_LOW | G=
PIOD_FLAGS_BIT_NONEXCLUSIVE);
> > +     if (IS_ERR(dc))
> > +             return dev_err_probe(&spi->dev, PTR_ERR(dc), "Failed to g=
et GPIO for D/CX\n");
> > +
> > +     spi_set_drvdata(spi, st7701);
> > +
> > +     err =3D mipi_dbi_spi_init(spi, &st7701->dbi, dc);
> > +     if (err)
> > +             return dev_err_probe(&spi->dev, err, "Failed to init MIPI=
 DBI\n");
> > +     st7701->dbi.read_commands =3D NULL;
> > +
> > +     return 0;
> >   }
> >
> >   static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
> > @@ -1048,28 +1121,84 @@ static void st7701_dsi_remove(struct mipi_dsi_d=
evice *dsi)
> >       struct st7701 *st7701 =3D mipi_dsi_get_drvdata(dsi);
> >
> >       mipi_dsi_detach(dsi);
> > -     drm_panel_remove(&st7701->panel);
> > +     st7701_remove(st7701);
> >   }
> >
> > -static const struct of_device_id st7701_of_match[] =3D {
> > +static void st7701_spi_remove(struct spi_device *spi)
> > +{
> > +     struct st7701 *st7701 =3D spi_get_drvdata(spi);
> > +
> > +     st7701_remove(st7701);
> > +}
> > +
> > +static const struct of_device_id st7701_dsi_of_match[] =3D {
> >       { .compatible =3D "anbernic,rg-arc-panel", .data =3D &rg_arc_desc=
 },
> >       { .compatible =3D "densitron,dmt028vghmcmi-1a", .data =3D &dmt028=
vghmcmi_1a_desc },
> >       { .compatible =3D "elida,kd50t048a", .data =3D &kd50t048a_desc },
> >       { .compatible =3D "techstar,ts8550b", .data =3D &ts8550b_desc },
> > -     { }
> > +     { /* sentinel */ }
> >   };
> > -MODULE_DEVICE_TABLE(of, st7701_of_match);
> > +MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);
> > +
> > +static const struct of_device_id st7701_spi_of_match[] =3D {
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, st7701_spi_of_match);
> > +
> > +static const struct spi_device_id st7701_spi_ids[] =3D {
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(spi, st7701_spi_ids);
> >
> >   static struct mipi_dsi_driver st7701_dsi_driver =3D {
> >       .probe          =3D st7701_dsi_probe,
> >       .remove         =3D st7701_dsi_remove,
> >       .driver =3D {
> >               .name           =3D "st7701",
> > -             .of_match_table =3D st7701_of_match,
> > +             .of_match_table =3D st7701_dsi_of_match,
> >       },
> >   };
> > -module_mipi_dsi_driver(st7701_dsi_driver);
> > +
> > +static struct spi_driver st7701_spi_driver =3D {
> > +     .probe          =3D st7701_spi_probe,
> > +     .remove         =3D st7701_spi_remove,
> > +     .id_table       =3D st7701_spi_ids,
> > +     .driver =3D {
> > +             .name           =3D "st7701",
> > +             .of_match_table =3D st7701_spi_of_match,
> > +     },
> > +};
> > +
> > +static int __init st7701_driver_init(void)
> > +{
> > +     int err;
> > +
> > +     err =3D spi_register_driver(&st7701_spi_driver);
> > +     if (err)
> > +             return err;
> > +
> > +     if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
> > +             err =3D mipi_dsi_driver_register(&st7701_dsi_driver);
> > +             if (err) {
> > +                     spi_unregister_driver(&st7701_spi_driver);
> > +                     return err;
> > +             }
> > +
> > +             return 0;
> > +     }
> > +}
> > +module_init(st7701_driver_init);
> > +
> > +static void __exit st7701_driver_exit(void)
> > +{
> > +     if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
> > +             mipi_dsi_driver_unregister(&st7701_dsi_driver);
> > +
> > +     spi_unregister_driver(&st7701_spi_driver);
> > +}
> > +module_exit(st7701_driver_exit);
> >
> >   MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
> > +MODULE_AUTHOR("Hironori KIKUCHI <kikuchan98@gmail.com>");
> >   MODULE_DESCRIPTION("Sitronix ST7701 LCD Panel Driver");
> >   MODULE_LICENSE("GPL");
> > --
> > 2.45.2
> >

Best regards,
kikuchan.

On Sat, Jun 22, 2024 at 5:31=E2=80=AFAM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
>
>
> On 6/18/2024 1:15 AM, Hironori KIKUCHI wrote:
> > The ST7701 supports not only MIPI DSI, but also SPI as an interface
> > for configuration. To support a panel connected via RGB parallel
> > interface, add support for SPI using MIPI DBI helpers.
> >
> > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/Kconfig                 |   2 +
> >   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 211 ++++++++++++++---=
-
> >   2 files changed, 172 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 2ae0eb0638f..1831544400d 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -755,7 +755,9 @@ config DRM_PANEL_SHARP_LS060T1SX01
> >   config DRM_PANEL_SITRONIX_ST7701
> >       tristate "Sitronix ST7701 panel driver"
> >       depends on OF
> > +     depends on SPI
> >       depends on DRM_MIPI_DSI
> > +     select DRM_MIPI_DBI
> >       depends on BACKLIGHT_CLASS_DEVICE
> >       help
> >         Say Y here if you want to enable support for the Sitronix
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gp=
u/drm/panel/panel-sitronix-st7701.c
> > index 421eb4592b6..3c4a66f2fc7 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> > @@ -4,6 +4,7 @@
> >    * Author: Jagan Teki <jagan@amarulasolutions.com>
> >    */
> >
> > +#include <drm/drm_mipi_dbi.h>
> >   #include <drm/drm_mipi_dsi.h>
> >   #include <drm/drm_modes.h>
> >   #include <drm/drm_panel.h>
> > @@ -14,6 +15,7 @@
> >   #include <linux/module.h>
> >   #include <linux/of.h>
> >   #include <linux/regulator/consumer.h>
> > +#include <linux/spi/spi.h>
> >
> >   #include <video/mipi_display.h>
> >
> > @@ -130,12 +132,16 @@ struct st7701_panel_desc {
> >   struct st7701 {
> >       struct drm_panel panel;
> >       struct mipi_dsi_device *dsi;
> > +     struct mipi_dbi dbi;
> >       const struct st7701_panel_desc *desc;
> >
> >       struct regulator_bulk_data supplies[2];
> >       struct gpio_desc *reset;
> >       unsigned int sleep_delay;
> >       enum drm_panel_orientation orientation;
> > +
> > +     int (*write_command)(struct st7701 *st7701, u8 cmd, const u8 *seq=
,
> > +                          size_t len);
> >   };
> >
> >   static inline struct st7701 *panel_to_st7701(struct drm_panel *panel)
> > @@ -143,16 +149,22 @@ static inline struct st7701 *panel_to_st7701(stru=
ct drm_panel *panel)
> >       return container_of(panel, struct st7701, panel);
> >   }
> >
> > -static inline int st7701_dsi_write(struct st7701 *st7701, const void *=
seq,
> > -                                size_t len)
> > +static int st7701_dsi_write(struct st7701 *st7701, u8 cmd, const u8 *s=
eq,
> > +                         size_t len)
> >   {
> > -     return mipi_dsi_dcs_write_buffer(st7701->dsi, seq, len);
> > +     return mipi_dsi_dcs_write(st7701->dsi, cmd, seq, len);
> >   }
> >
> > -#define ST7701_DSI(st7701, seq...)                           \
> > -     {                                                       \
> > -             const u8 d[] =3D { seq };                         \
> > -             st7701_dsi_write(st7701, d, ARRAY_SIZE(d));     \
> > +static int st7701_dbi_write(struct st7701 *st7701, u8 cmd, const u8 *s=
eq,
> > +                         size_t len)
> > +{
> > +     return mipi_dbi_command_stackbuf(&st7701->dbi, cmd, seq, len);
> > +}
> > +
> > +#define ST7701_DSI(st7701, cmd, seq...)
>
> Hi Hironori,
>
> Is it really correct to keep this as *_DSI? Since the macro can
> theoretically support either DBI or DSI write commands, maybe this
> should be renamed to something more generic.
>
>                                 \
> > +     {                                                               \
> > +             const u8 d[] =3D { seq };                                =
 \
> > +             st7701->write_command(st7701, cmd, d, ARRAY_SIZE(d));   \
> >       }
> >
> >   static u8 st7701_vgls_map(struct st7701 *st7701)
> > @@ -211,10 +223,10 @@ static void st7701_init_sequence(struct st7701 *s=
t7701)
> >       /* Command2, BK0 */
> >       st7701_switch_cmd_bkx(st7701, true, 0);
> >
> > -     mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_PVGAMCTRL,
> > -                        desc->pv_gamma, ARRAY_SIZE(desc->pv_gamma));
> > -     mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_NVGAMCTRL,
> > -                        desc->nv_gamma, ARRAY_SIZE(desc->nv_gamma));
> > +     st7701->write_command(st7701, DSI_CMD2_BK0_PVGAMCTRL, desc->pv_ga=
mma,
>
> Same here for the DSI_CMD2_* macros.
>
> > +                           ARRAY_SIZE(desc->pv_gamma));
> > +     st7701->write_command(st7701, DSI_CMD2_BK0_NVGAMCTRL, desc->nv_ga=
mma,
> > +                           ARRAY_SIZE(desc->nv_gamma));
> >       /*
> >        * Vertical line count configuration:
> >        * Line[6:0]: select number of vertical lines of the TFT matrix i=
n
> > @@ -974,42 +986,47 @@ static const struct st7701_panel_desc rg_arc_desc=
 =3D {
> >       .gip_sequence =3D rg_arc_gip_sequence,
> >   };
> >
> > -static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
> > +static void st7701_cleanup(void *data)
> > +{
> > +     struct st7701 *st7701 =3D (struct st7701 *)data;
> > +
> > +     drm_panel_remove(&st7701->panel);
> > +}
> > +
> > +static int st7701_probe(struct device *dev, int connector_type)
> >   {
> >       const struct st7701_panel_desc *desc;
> >       struct st7701 *st7701;
> >       int ret;
> >
> > -     st7701 =3D devm_kzalloc(&dsi->dev, sizeof(*st7701), GFP_KERNEL);
> > +     desc =3D of_device_get_match_data(dev);
> > +     if (!desc)
> > +             return -ENODEV;
> > +
> > +     st7701 =3D devm_kzalloc(dev, sizeof(*st7701), GFP_KERNEL);
> >       if (!st7701)
> >               return -ENOMEM;
> >
> > -     desc =3D of_device_get_match_data(&dsi->dev);
> > -     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST |
> > -                       MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUO=
US;
> > -     dsi->format =3D desc->format;
> > -     dsi->lanes =3D desc->lanes;
> > -
> > +     st7701->desc =3D desc;
> >       st7701->supplies[0].supply =3D "VCC";
> >       st7701->supplies[1].supply =3D "IOVCC";
> >
> > -     ret =3D devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(st7701->sup=
plies),
> > +     ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(st7701->supplies)=
,
> >                                     st7701->supplies);
> >       if (ret < 0)
> >               return ret;
> >
> > -     st7701->reset =3D devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LO=
W);
> > +     st7701->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >       if (IS_ERR(st7701->reset)) {
> > -             dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
> > +             dev_err(dev, "Couldn't get our reset GPIO\n");
> >               return PTR_ERR(st7701->reset);
> >       }
> >
> > -     ret =3D of_drm_get_panel_orientation(dsi->dev.of_node, &st7701->o=
rientation);
> > +     ret =3D of_drm_get_panel_orientation(dev->of_node, &st7701->orien=
tation);
> >       if (ret < 0)
> > -             return dev_err_probe(&dsi->dev, ret, "Failed to get orien=
tation\n");
> > +             return dev_err_probe(dev, ret, "Failed to get orientation=
\n");
> >
> > -     drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
> > -                    DRM_MODE_CONNECTOR_DSI);
> > +     drm_panel_init(&st7701->panel, dev, &st7701_funcs, connector_type=
);
> >
> >       /**
> >        * Once sleep out has been issued, ST7701 IC required to wait 120=
ms
> > @@ -1026,21 +1043,77 @@ static int st7701_dsi_probe(struct mipi_dsi_dev=
ice *dsi)
> >       if (ret)
> >               return ret;
> >
> > +     dev_set_drvdata(dev, st7701);
> > +
> >       drm_panel_add(&st7701->panel);
> >
> > -     mipi_dsi_set_drvdata(dsi, st7701);
> > -     st7701->dsi =3D dsi;
> > -     st7701->desc =3D desc;
> > -
> > -     ret =3D mipi_dsi_attach(dsi);
> > +     ret =3D devm_add_action_or_reset(dev, st7701_cleanup, st7701);
>
> Is the intention here to move to using the devm framework? Also, just
> wondering, what advantages does this implementation have over the
> original implementation?
>
> >       if (ret)
> > -             goto err_attach;
> > +             return ret;
>
> If you're removing the `goto` here, you could probably drop this entire
> check and just `return ret` at the end of the function.
>
> >
> >       return 0;
> > +}
> >
> > -err_attach:
> > -     drm_panel_remove(&st7701->panel);
> > -     return ret;
> > +static void st7701_remove(struct st7701 *st7701)
> > +{
> > +     st7701_cleanup(st7701);
>
> Why add an extra helper that's essentially just a wrapper for another
> helper? Why can't we directly call st7701_cleanup()?
>
> Thanks,
>
> Jessica Zhang
>
> > +}
> > +
> > +static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct st7701 *st7701;
> > +     int err;
> > +
> > +     err =3D st7701_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
> > +     if (err)
> > +             return err;
> > +
> > +     st7701 =3D dev_get_drvdata(&dsi->dev);
> > +     st7701->dsi =3D dsi;
> > +     st7701->write_command =3D st7701_dsi_write;
> > +
> > +     if (!st7701->desc->lanes)
> > +             return dev_err_probe(&dsi->dev, err, "This panel is not f=
or MIPI DSI\n");
> > +
> > +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST |
> > +                       MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUO=
US;
> > +     dsi->format =3D st7701->desc->format;
> > +     dsi->lanes =3D st7701->desc->lanes;
> > +
> > +     mipi_dsi_set_drvdata(dsi, st7701);
> > +
> > +     err =3D mipi_dsi_attach(dsi);
> > +     if (err)
> > +             return dev_err_probe(&dsi->dev, err, "Failed to init MIPI=
 DSI\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static int st7701_spi_probe(struct spi_device *spi)
> > +{
> > +     struct st7701 *st7701;
> > +     struct gpio_desc *dc;
> > +     int err;
> > +
> > +     err =3D st7701_probe(&spi->dev, DRM_MODE_CONNECTOR_DPI);
> > +     if (err)
> > +             return err;
> > +
> > +     st7701 =3D dev_get_drvdata(&spi->dev);
> > +     st7701->write_command =3D st7701_dbi_write;
> > +
> > +     dc =3D devm_gpiod_get_optional(&spi->dev, "dc", GPIOD_OUT_LOW | G=
PIOD_FLAGS_BIT_NONEXCLUSIVE);
> > +     if (IS_ERR(dc))
> > +             return dev_err_probe(&spi->dev, PTR_ERR(dc), "Failed to g=
et GPIO for D/CX\n");
> > +
> > +     spi_set_drvdata(spi, st7701);
> > +
> > +     err =3D mipi_dbi_spi_init(spi, &st7701->dbi, dc);
> > +     if (err)
> > +             return dev_err_probe(&spi->dev, err, "Failed to init MIPI=
 DBI\n");
> > +     st7701->dbi.read_commands =3D NULL;
> > +
> > +     return 0;
> >   }
> >
> >   static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
> > @@ -1048,28 +1121,84 @@ static void st7701_dsi_remove(struct mipi_dsi_d=
evice *dsi)
> >       struct st7701 *st7701 =3D mipi_dsi_get_drvdata(dsi);
> >
> >       mipi_dsi_detach(dsi);
> > -     drm_panel_remove(&st7701->panel);
> > +     st7701_remove(st7701);
> >   }
> >
> > -static const struct of_device_id st7701_of_match[] =3D {
> > +static void st7701_spi_remove(struct spi_device *spi)
> > +{
> > +     struct st7701 *st7701 =3D spi_get_drvdata(spi);
> > +
> > +     st7701_remove(st7701);
> > +}
> > +
> > +static const struct of_device_id st7701_dsi_of_match[] =3D {
> >       { .compatible =3D "anbernic,rg-arc-panel", .data =3D &rg_arc_desc=
 },
> >       { .compatible =3D "densitron,dmt028vghmcmi-1a", .data =3D &dmt028=
vghmcmi_1a_desc },
> >       { .compatible =3D "elida,kd50t048a", .data =3D &kd50t048a_desc },
> >       { .compatible =3D "techstar,ts8550b", .data =3D &ts8550b_desc },
> > -     { }
> > +     { /* sentinel */ }
> >   };
> > -MODULE_DEVICE_TABLE(of, st7701_of_match);
> > +MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);
> > +
> > +static const struct of_device_id st7701_spi_of_match[] =3D {
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, st7701_spi_of_match);
> > +
> > +static const struct spi_device_id st7701_spi_ids[] =3D {
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(spi, st7701_spi_ids);
> >
> >   static struct mipi_dsi_driver st7701_dsi_driver =3D {
> >       .probe          =3D st7701_dsi_probe,
> >       .remove         =3D st7701_dsi_remove,
> >       .driver =3D {
> >               .name           =3D "st7701",
> > -             .of_match_table =3D st7701_of_match,
> > +             .of_match_table =3D st7701_dsi_of_match,
> >       },
> >   };
> > -module_mipi_dsi_driver(st7701_dsi_driver);
> > +
> > +static struct spi_driver st7701_spi_driver =3D {
> > +     .probe          =3D st7701_spi_probe,
> > +     .remove         =3D st7701_spi_remove,
> > +     .id_table       =3D st7701_spi_ids,
> > +     .driver =3D {
> > +             .name           =3D "st7701",
> > +             .of_match_table =3D st7701_spi_of_match,
> > +     },
> > +};
> > +
> > +static int __init st7701_driver_init(void)
> > +{
> > +     int err;
> > +
> > +     err =3D spi_register_driver(&st7701_spi_driver);
> > +     if (err)
> > +             return err;
> > +
> > +     if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
> > +             err =3D mipi_dsi_driver_register(&st7701_dsi_driver);
> > +             if (err) {
> > +                     spi_unregister_driver(&st7701_spi_driver);
> > +                     return err;
> > +             }
> > +
> > +             return 0;
> > +     }
> > +}
> > +module_init(st7701_driver_init);
> > +
> > +static void __exit st7701_driver_exit(void)
> > +{
> > +     if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
> > +             mipi_dsi_driver_unregister(&st7701_dsi_driver);
> > +
> > +     spi_unregister_driver(&st7701_spi_driver);
> > +}
> > +module_exit(st7701_driver_exit);
> >
> >   MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
> > +MODULE_AUTHOR("Hironori KIKUCHI <kikuchan98@gmail.com>");
> >   MODULE_DESCRIPTION("Sitronix ST7701 LCD Panel Driver");
> >   MODULE_LICENSE("GPL");
> > --
> > 2.45.2
> >
