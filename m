Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7BAABF6CC
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD5B10EDCD;
	Wed, 21 May 2025 13:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bajxjg7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7434211A9E2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 13:08:42 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so74678475e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747832921; x=1748437721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtJuC4sON7OcCbFhnl9rFz8s4+7CUDcertp/XszJ1mI=;
 b=bajxjg7icKbsIWbCQODXiW0Iz/lu1oOl/nIctybamlija20A5Il7Oyke5ops3Vhl2Q
 nPSkNvPjoCrhv2fkW4I/p2cpAyXxlgSh0+pFk4LJlQ61lmL1y23X+gLyuxY4pucZptZk
 3CqZMnbAF1DKkFyfG3Ud2I9zy+9366lnZ1vmvwKsL1loF+hxOmLh4WzJdMWidY84roNw
 +EWuHLiGWrX/4GoLsUJfSQKN3/BWbHy5lj6pHoR3mFQQGhGHMRi5Pk3UwodUXfba2+Ea
 Jzx/lhqOd8V2zuS3tzCf8+Q5Vgycvj4/iKjr9KjtU0ylrDEyh6H+KLgXFTSJgZXOS6lg
 Vc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747832921; x=1748437721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtJuC4sON7OcCbFhnl9rFz8s4+7CUDcertp/XszJ1mI=;
 b=vNdv/MqzGStjitM2fQdXVx59kUj+2q+kYNuKldlfz4Mziq1n7mP3Ne0q7nKwfSnlem
 FgCUwTtk2ZxTNSBKB1ZNj2xy0jQ0kovcCmitrGUR+vMn1zQm77HivQYrQYxVFS5lMgXj
 H9KG510JdN7Vm2AiJ3jJlIe3qqUQLhBbOBvd+WEp9Ugejc3pMFId14S77PUkmPkw0/Bs
 mVJhnA/uyXhnWgsuhZn4Fqz9oMkHDL0JTJKeHlo70o8+vtO9PuxBamr51ZVbyYrQ7ane
 HasjNWQQWnA4+ECeIijZtraRMao6MxirVDU6FSI4OUL3QIhKl0+GmOqJO+xgzo1lqQeg
 yvKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS+8Y7nTkB5M5WVidpoGlTK8dX5VyzLy77PupWGCEo5I+Nt6w5RtVhOyWhDv7SantRz+9r6UiosuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6FaVlahkpurmuaCdJK7KyCvpQ0bwQImbBNUtzyUQ3PgtG+rLs
 spvF7tFWNLHf+EFNVTlycpbnw5kaqJ2kjywAvqvD2sCX/8ls+wPEl38UEhbyTb5oG55or/ayU4a
 d0g1TEWLs3GfzlYPAskhzNJ9Th9kobKo=
X-Gm-Gg: ASbGncvNDkyrjVlFSTECmR6TnGT9D2rFZKYzw6TuJWXF4mZFqcHv8uVea2F9qrAzvvK
 l5RLDioBXkGIj8YEHV2RoHye8EfdhTEss1tK0gj/kfCjxiMR/MBU4nyPVBdERO3NvTUaOc1kjUM
 hgS9pWMmkr4OPwGoz5NdbkSeVrcDM=
X-Google-Smtp-Source: AGHT+IH5oWUCAOj7liq81Ww5yepueFEsMzPQhgQxcq8TIEroCXdBrKSZYY6lFxEMsfgBnUSJD91+1TgxZPcjy7Bm/ws=
X-Received: by 2002:a05:600c:5493:b0:43d:878c:7c40 with SMTP id
 5b1f17b1804b1-442fd618f0dmr240690125e9.10.1747832920435; Wed, 21 May 2025
 06:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250520142240.GF13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520142240.GF13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:08:13 +0100
X-Gm-Features: AX0GCFs98ZFk9bZKzlsJMx4dK9PDnmCfT8MxXsx3auXJDzvHLqULJxY_wHeAMoE
Message-ID: <CA+V-a8u5t_vjW+bc63o6qn8M=RV+yigkkaKsrAHLzNrtNM8-cg@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] drm: renesas: rz-du: mipi_dsi: Add OF data
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Laurent,

Thank you for the review.

On Tue, May 20, 2025 at 3:22=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, May 12, 2025 at 07:23:24PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In preparation for adding support for the Renesas RZ/V2H(P) SoC, this p=
atch
> > introduces a mechanism to pass SoC-specific information via OF data in =
the
> > DSI driver. This enables the driver to adapt dynamically to various
> > SoC-specific requirements without hardcoding configurations.
> >
> > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the =
one
> > on the RZ/G2L SoC. While the LINK registers are shared between the two
> > SoCs, the D-PHY registers differ. Also the VCLK range differs on both t=
hese
> > SoCs. To accommodate these differences `struct rzg2l_mipi_dsi_hw_info` =
is
> > introduced and as now passed as OF data.
> >
> > These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support=
 by
> > allowing SoC-specific data to be passed through OF.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - Dropped RZ_MIPI_DSI_FEATURE_DPHY_RST feature flag
> > - Added Reviewed tag from Biju
> >
> > v3->v4:
> > - No changes
> >
> > v2->v3:
> > - Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it is not neede=
d.
> >
> > v1->v2:
> > - Added DPHY_RST as feature flag
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 51 ++++++++++++++-----
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
> >  2 files changed, 38 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index 3f6988303e63..00c2bc6e9d6c 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -28,10 +28,23 @@
> >
> >  #include "rzg2l_mipi_dsi_regs.h"
> >
> > +struct rzg2l_mipi_dsi;
> > +
> > +struct rzg2l_mipi_dsi_hw_info {
> > +     int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq=
);
> > +     void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> > +     u32 phy_reg_offset;
> > +     u32 link_reg_offset;
> > +     unsigned long max_dclk;
> > +     unsigned long min_dclk;
>
> I'd put min before max.
>
Sure, I'll swap them (and below).

Cheers,
Prabhakar

> > +};
> > +
> >  struct rzg2l_mipi_dsi {
> >       struct device *dev;
> >       void __iomem *mmio;
> >
> > +     const struct rzg2l_mipi_dsi_hw_info *info;
> > +
> >       struct reset_control *rstc;
> >       struct reset_control *arstc;
> >       struct reset_control *prstc;
> > @@ -164,22 +177,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_=
mipi_dsi_global_timings[] =3D {
> >
> >  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 r=
eg, u32 data)
> >  {
> > -     iowrite32(data, dsi->mmio + reg);
> > +     iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
> >  }
> >
> >  static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 =
reg, u32 data)
> >  {
> > -     iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
> > +     iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
> >  }
> >
> >  static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg=
)
> >  {
> > -     return ioread32(dsi->mmio + reg);
> > +     return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
> >  }
> >
> >  static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 re=
g)
> >  {
> > -     return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
> > +     return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
> >  }
> >
> >  /* -------------------------------------------------------------------=
----------
> > @@ -294,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >                        mode->clock * MILLI, vclk_rate);
> >       hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> >
> > -     ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> > +     ret =3D dsi->info->dphy_init(dsi, hsfreq);
> >       if (ret < 0)
> >               goto err_phy;
> >
> > @@ -337,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >       return 0;
> >
> >  err_phy:
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >
> >       return ret;
> > @@ -345,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >
> >  static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
> >  {
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >  }
> >
> > @@ -587,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridg=
e *bridge,
> >                                const struct drm_display_info *info,
> >                                const struct drm_display_mode *mode)
> >  {
> > -     if (mode->clock > 148500)
> > +     struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +
> > +     if (mode->clock > dsi->info->max_dclk)
> >               return MODE_CLOCK_HIGH;
> >
> > -     if (mode->clock < 5803)
> > +     if (mode->clock < dsi->info->min_dclk)
> >               return MODE_CLOCK_LOW;
> >
> >       return MODE_OK;
> > @@ -716,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
> >       platform_set_drvdata(pdev, dsi);
> >       dsi->dev =3D &pdev->dev;
> >
> > +     dsi->info =3D of_device_get_match_data(&pdev->dev);
> > +
> >       ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1=
, 4);
> >       if (ret < 0)
> >               return dev_err_probe(dsi->dev, ret,
> > @@ -759,13 +776,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_d=
evice *pdev)
> >        * mode->clock and format are not available. So initialize DPHY w=
ith
> >        * timing parameters for 80Mbps.
> >        */
> > -     ret =3D rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
> > +     ret =3D dsi->info->dphy_init(dsi, 80000000);
> >       if (ret < 0)
> >               goto err_phy;
> >
> >       txsetr =3D rzg2l_mipi_dsi_link_read(dsi, TXSETR);
> >       dsi->num_data_lanes =3D min(((txsetr >> 16) & 3) + 1, num_data_la=
nes);
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >
> >       /* Initialize the DRM bridge. */
> > @@ -782,7 +799,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
> >       return 0;
> >
> >  err_phy:
> > -     rzg2l_mipi_dsi_dphy_exit(dsi);
> > +     dsi->info->dphy_exit(dsi);
> >       pm_runtime_put(dsi->dev);
> >  err_pm_disable:
> >       pm_runtime_disable(dsi->dev);
> > @@ -797,8 +814,16 @@ static void rzg2l_mipi_dsi_remove(struct platform_=
device *pdev)
> >       pm_runtime_disable(&pdev->dev);
> >  }
> >
> > +static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
> > +     .dphy_init =3D rzg2l_mipi_dsi_dphy_init,
> > +     .dphy_exit =3D rzg2l_mipi_dsi_dphy_exit,
> > +     .link_reg_offset =3D 0x10000,
> > +     .max_dclk =3D 148500,
> > +     .min_dclk =3D 5803,
>
> Here too.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > +};
> > +
> >  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> > -     { .compatible =3D "renesas,rzg2l-mipi-dsi" },
> > +     { .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D &rzg2l_mipi=
_dsi_info, },
> >       { /* sentinel */ }
> >  };
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driv=
ers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> > index 1dbc16ec64a4..16efe4dc59f4 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> > @@ -41,8 +41,6 @@
> >  #define DSIDPHYTIM3_THS_ZERO(x)              ((x) << 0)
> >
> >  /* --------------------------------------------------------*/
> > -/* Link Registers */
> > -#define LINK_REG_OFFSET                      0x10000
> >
> >  /* Link Status Register */
> >  #define LINKSR                               0x10
>
> --
> Regards,
>
> Laurent Pinchart
