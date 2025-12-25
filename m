Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6BCDD98E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 10:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5CF11ADF7;
	Thu, 25 Dec 2025 09:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dhMTFmHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09C11B10B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:37:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C0E160137
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0315CC19421
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766655446;
 bh=sK1sNGUuaVZlsyA4mFkm3mJlJ/25GORIUE77JBYSTpI=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=dhMTFmHZTtNp1XTq2IthkPoEQMnL7OpL0HTs4JhUm2TZNziVN7QXwlveroF64yTVb
 aPwVqpyrE2mKt3ZRlpt9s8ScHRfq2/esQxPQNSgXL42B052UUsO8i7gwHYlGfS0VR/
 aj7PzIo03CR1/HU557YUDaXHKAgLJWkH/peadO6LhnxH2RCvKUuOSZyj0sz9YZ828E
 z3TZYD34n12wczzz+0l1Pgoaqa3BczSu3asumlheeBrxUDtg07yX9O5wlP8N+K5fH7
 ArdcWtvUAKmpDOq35pjmlNQJFIPb3UO6tcyWXHSiC9zoLK/S7cvmKWyxezcbAvHNng
 PrKD0XxdReElw==
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-3ed151e8fc3so4387293fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 01:37:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQv3qYO6/nBfQ6Qi6TcWEEqqfSph2nrBWpRGoA0I/kMi4yjb5A2QbWZfj2eakjsxjS2hP9eSPEpyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3CPaa1Tf6Fau/SMzoXdKm2ayPlpiuwsC++RHYO2HtuXwrWni6
 hHixEjdvNqzjy//PKpAGekqTS282zofWId0YlVjL4QE5lFytVjP4ls/PCR3KU/6TzJ1ccEHmi7e
 hFUMthxnbBOC5+96ZdtHr1bHBCZ0Eoxo=
X-Google-Smtp-Source: AGHT+IFIDa7aBczNVoikTY+oCF3Is3mEEiepb8/c/Tocjg8H68oMELW+/WsDLZ+Dw5xNgmRh0RfQzCn7KBUJoVj+76o=
X-Received: by 2002:a05:6820:1501:b0:65b:35a2:7a81 with SMTP id
 006d021491bc7-65d0ea9d074mr9434650eaf.53.1766655445026; Thu, 25 Dec 2025
 01:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-6-jernej.skrabec@gmail.com>
 <CAGb2v65wY2pF6sR+0JgnpLa4ysvjght5hAKDa1RUyo=zEKXreg@mail.gmail.com>
In-Reply-To: <CAGb2v65wY2pF6sR+0JgnpLa4ysvjght5hAKDa1RUyo=zEKXreg@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:37:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v65e2a_f+UEDu-Wk3bWvgHt24erjk+iLWgMAQwB-mzcnaA@mail.gmail.com>
X-Gm-Features: AQt7F2r8yNX37j9VOgrBDh4ZNnkaSnN00GkQWIlj3gFqx8TPcDU1cMocMkHbCL8
Message-ID: <CAGb2v65e2a_f+UEDu-Wk3bWvgHt24erjk+iLWgMAQwB-mzcnaA@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/sun4i: Add planes driver
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
 sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 25, 2025 at 5:29=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > This driver serves just as planes sharing manager, needed for Display
> > Engine 3.3 and newer.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/Kconfig         |   8 +
> >  drivers/gpu/drm/sun4i/Makefile        |   1 +
> >  drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
> >  4 files changed, 257 insertions(+)
> >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
> >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h
> >
> > diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kcon=
fig
> > index b56ba00aabca..946dd7606094 100644
> > --- a/drivers/gpu/drm/sun4i/Kconfig
> > +++ b/drivers/gpu/drm/sun4i/Kconfig
> > @@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
> >           TCON TOP is responsible for configuring display pipeline for
> >           HDMI, TVE and LCD.
> >
> > +config DRM_SUN50I_PLANES
> > +       tristate
> > +       default DRM_SUN4I if DRM_SUN8I_MIXER!=3Dn
> > +       help
> > +         Chose this option if you have an Allwinner Soc with the
> > +         Display Engine 3.3 or newer. Planes are shared resource
> > +         between multiple mixers.
> > +
> >  endif
> > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Mak=
efile
> > index bad7497a0d11..03f002abef15 100644
> > --- a/drivers/gpu/drm/sun4i/Makefile
> > +++ b/drivers/gpu/drm/sun4i/Makefile
> > @@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)   +=3D sun6i_mipi_dsi.o
> >  obj-$(CONFIG_DRM_SUN8I_DW_HDMI)        +=3D sun8i-drm-hdmi.o
> >  obj-$(CONFIG_DRM_SUN8I_MIXER)  +=3D sun8i-mixer.o
> >  obj-$(CONFIG_DRM_SUN8I_TCON_TOP) +=3D sun8i_tcon_top.o
> > +obj-$(CONFIG_DRM_SUN50I_PLANES)        +=3D sun50i_planes.o
>
> I don't think you can have this as a separate module:
>
> a. You are using sun8i_vi_layer_init_one() and sun8i_ui_layer_init_one()
>    from the sun8i-mixer module, and neither of them are exported symbols.
>
> b. You export sun50i_planes_setup() for sun8i-mixer to call, which ends
>    up becoming a circular dependency.
>
> The easiest solution would be to just fold this into the sun8i-mixer modu=
le.
>
>
> > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/su=
n4i/sun50i_planes.c
> > new file mode 100644
> > index 000000000000..a99c01122990
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
> > @@ -0,0 +1,205 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
> > +
> > +#include <linux/device.h>
> > +#include <linux/io.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "sun50i_planes.h"
> > +#include "sun8i_ui_layer.h"
> > +#include "sun8i_vi_layer.h"
> > +
> > +static bool sun50i_planes_node_is_planes(struct device_node *node)
> > +{
> > +       return !!of_match_node(sun50i_planes_of_table, node);
> > +}
> > +
> > +struct drm_plane **
> > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > +                   unsigned int mixer)
> > +{
> > +       struct sun50i_planes *planes =3D dev_get_drvdata(dev);
> > +       const struct sun50i_planes_quirks *quirks;
> > +       struct drm_plane **drm_planes;
> > +       const struct default_map *map;
> > +       unsigned int i;
> > +
> > +       if (!sun50i_planes_node_is_planes(dev->of_node)) {
> > +               dev_err(dev, "Device is not planes driver!\n");
> > +               return NULL;
> > +       }
> > +
> > +       if (!planes) {
> > +               dev_err(dev, "Planes driver is not loaded yet!\n");
> > +               return NULL;
> > +       }
> > +
> > +       if (mixer > 1) {
> > +               dev_err(dev, "Mixer index is too high!\n");
> > +               return NULL;
> > +       }
> > +
> > +       quirks =3D planes->quirks;
> > +       map =3D &quirks->def_map[mixer];
> > +
> > +       drm_planes =3D devm_kcalloc(drm->dev, map->num_ch + 1,
>
> Just a note: it seems we are missing the sentinel in sun8i_layers_init().
>
> > +                                 sizeof(*drm_planes), GFP_KERNEL);
> > +       if (!drm_planes)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       for (i =3D 0; i < map->num_ch; i++) {
> > +               unsigned int phy_ch =3D map->map[i];
> > +               struct sun8i_layer *layer;
> > +               enum drm_plane_type type;
> > +
> > +               if ((i =3D=3D 0 && map->num_ch =3D=3D 1) || i =3D=3D 1)
> > +                       type =3D DRM_PLANE_TYPE_PRIMARY;
> > +               else
> > +                       type =3D DRM_PLANE_TYPE_OVERLAY;
> > +
> > +               if (phy_ch < UI_PLANE_OFFSET)
> > +                       layer =3D sun8i_vi_layer_init_one(drm, type, pl=
anes->regs,
> > +                                                       i, phy_ch, map-=
>num_ch,
> > +                                                       &quirks->cfg);
> > +               else
> > +                       layer =3D sun8i_ui_layer_init_one(drm, type, pl=
anes->regs,
> > +                                                       i, phy_ch, map-=
>num_ch,
> > +                                                       &quirks->cfg);
> > +
> > +               if (IS_ERR(layer)) {
> > +                       dev_err(drm->dev,
> > +                               "Couldn't initialize DRM plane\n");
> > +                       return ERR_CAST(layer);
> > +               }
> > +
> > +               drm_planes[i] =3D &layer->plane;
> > +       }
> > +
> > +       return drm_planes;
> > +}
> > +EXPORT_SYMBOL(sun50i_planes_setup);
> > +
> > +static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
> > +{
> > +       const struct sun50i_planes_quirks *quirks =3D planes->quirks;
> > +       unsigned int i, j;
> > +       u32 mapping;
> > +
> > +       mapping =3D 0;
> > +       for (j =3D 0; j < MAX_DISP; j++)
> > +               for (i =3D 0; i < quirks->def_map[j].num_ch; i++) {
> > +                       unsigned int ch =3D quirks->def_map[j].map[i];
> > +
> > +                       if (ch < UI_PLANE_OFFSET)
> > +                               mapping |=3D j << (ch * 2);
> > +                       else
> > +                               mapping |=3D j << ((ch - UI_PLANE_OFFSE=
T) * 2 + 16);
> > +               }
> > +       regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG, m=
apping);
> > +
> > +       for (j =3D 0; j < MAX_DISP; j++) {
> > +               mapping =3D 0;
> > +               for (i =3D 0; i < quirks->def_map[j].num_ch; i++) {
> > +                       unsigned int ch =3D quirks->def_map[j].map[i];
> > +
> > +                       if (ch >=3D UI_PLANE_OFFSET)
> > +                               ch +=3D 2;
> > +
> > +                       mapping |=3D ch << (i * 4);
> > +               }
> > +               regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN_M=
UX_REG + j * 4, mapping);
> > +       }
> > +}
> > +
> > +static const struct regmap_config sun50i_planes_regmap_config =3D {
> > +       .name           =3D "planes",
> > +       .reg_bits       =3D 32,
> > +       .val_bits       =3D 32,
> > +       .reg_stride     =3D 4,
> > +       .max_register   =3D 0x17fffc,
> > +};
> > +
> > +static int sun50i_planes_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct sun50i_planes *planes;
> > +       void __iomem *regs;
> > +
> > +       planes =3D devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
> > +       if (!planes)
> > +               return -ENOMEM;
> > +
> > +       planes->quirks =3D of_device_get_match_data(&pdev->dev);
> > +       if (!planes->quirks)
> > +               return dev_err_probe(dev, -EINVAL, "Unable to get quirk=
s\n");
> > +
> > +       planes->mapping =3D syscon_regmap_lookup_by_phandle(dev->of_nod=
e,
> > +                                                         "allwinner,pl=
ane-mapping");
> > +       if (IS_ERR(planes->mapping))
> > +               return dev_err_probe(dev, PTR_ERR(planes->mapping),
> > +                                    "Unable to get mapping\n");
> > +
> > +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(regs))
> > +               return PTR_ERR(regs);
> > +
> > +       planes->regs =3D devm_regmap_init_mmio(dev, regs, &sun50i_plane=
s_regmap_config);
> > +       if (IS_ERR(planes->regs))
> > +               return PTR_ERR(planes->regs);
> > +
> > +       dev_set_drvdata(dev, planes);
> > +
> > +       sun50i_planes_init_mapping(planes);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct sun50i_planes_quirks sun50i_h616_planes_quirks =3D=
 {
> > +       .def_map =3D {
> > +               {
> > +                       .map =3D {0, 6, 7},
> > +                       .num_ch =3D 3,
> > +               },
> > +               {
> > +                       .map =3D {1, 2, 8},
> > +                       .num_ch =3D 3,
> > +               },
> > +       },
> > +       .cfg =3D {
> > +               .de_type        =3D SUN8I_MIXER_DE33,
> > +               /*
> > +                * TODO: All planes support scaling, but driver needs
> > +                * improvements to properly support it.
> > +                */
> > +               .scaler_mask    =3D 0,
> > +               .scanline_yuv   =3D 4096,
> > +       },
> > +};
> > +
> > +/* sun4i_drv uses this list to check if a device node is a plane */

I didn't see any usage of this in patch 7. Is this part of another
series?

Maybe just export sun50i_planes_node_is_planes() instead?

> > +const struct of_device_id sun50i_planes_of_table[] =3D {
> > +       {
> > +               .compatible =3D "allwinner,sun50i-h616-de33-planes",
> > +               .data =3D &sun50i_h616_planes_quirks
> > +       },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
> > +EXPORT_SYMBOL(sun50i_planes_of_table);
> > +
> > +static struct platform_driver sun50i_planes_platform_driver =3D {
> > +       .probe          =3D sun50i_planes_probe,
> > +       .driver         =3D {
> > +               .name           =3D "sun50i-planes",
> > +               .of_match_table =3D sun50i_planes_of_table,
> > +       },
> > +};
> > +module_platform_driver(sun50i_planes_platform_driver);
> > +
> > +MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
> > +MODULE_DESCRIPTION("Allwinner DE33 planes driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/su=
n4i/sun50i_planes.h
> > new file mode 100644
> > index 000000000000..446feaeb03fc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
> > @@ -0,0 +1,43 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
> > +
> > +#ifndef _SUN50I_PLANES_H_
> > +#define _SUN50I_PLANES_H_
> > +
> > +#include <drm/drm_device.h>
> > +#include <linux/regmap.h>
>
> I think you could move these two to the .c file, and just use forward
> declarations here.
>
> The rest looks OK.
>
>
> > +
> > +#include "sun8i_mixer.h"
> > +
> > +/* mapping registers, located in clock register space */
> > +#define SUNXI_DE33_DE_CHN2CORE_MUX_REG 0x24
> > +#define SUNXI_DE33_DE_PORT02CHN_MUX_REG        0x28
> > +#define SUNXI_DE33_DE_PORT12CHN_MUX_REG        0x2c
> > +
> > +#define MAX_DISP       2
> > +#define MAX_CHANNELS   8
> > +#define UI_PLANE_OFFSET        6
> > +
> > +struct default_map {
> > +       unsigned int map[MAX_CHANNELS];
> > +       unsigned int num_ch;
> > +};
> > +
> > +struct sun50i_planes_quirks {
> > +       struct default_map      def_map[MAX_DISP];
> > +       struct sun8i_layer_cfg  cfg;
> > +};
> > +
> > +struct sun50i_planes {
> > +       struct regmap                           *regs;
> > +       struct regmap                           *mapping;
> > +       const struct sun50i_planes_quirks       *quirks;
> > +};
> > +
> > +extern const struct of_device_id sun50i_planes_of_table[];
> > +
> > +struct drm_plane **
> > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > +                   unsigned int mixer);
> > +
> > +#endif /* _SUN50I_PLANES_H_ */
> > --
> > 2.51.2
> >
> >
