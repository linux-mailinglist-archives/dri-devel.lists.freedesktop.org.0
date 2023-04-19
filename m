Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124C6E77B4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1786D10E92D;
	Wed, 19 Apr 2023 10:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E98F10E935
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 10:47:18 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a645fd0c6dso23882755ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681901238; x=1684493238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ef5jinu68hChsQPL90lIFDCf/6lC4PbhW9wu+rG7+o0=;
 b=Gt7govrcwA6PFE6GqKzvccIYmexBSH1eg54UQoXqmm+G6yIfqc7dhRciA+N80wC8I4
 /Nfs0TnHx2XlvKAlRBlO3EpJ1YrIYPgMu5XQJttcAEVMrD6i2gCuAFV8dlYBPOPDKU9y
 lYSlaeFsedD2qQEm4+rlOAnrRBWZtO13+Cgq1U3wyYMH9c8Lq4Z3Iszpa+Ff0BX7dp5W
 Q4DyqgiCT2SAawiR4a2FcBCjAZ7HSNwHrYyFB6V7EgZ12b4P+Ja6gFfYCzs6LbQBUsQq
 jTn9PK9uRd1UcgUT0+YEEGOV0OAtMpkOjm3pKZW7zDuJMzTKHXoi/es/zCK5fWA/PwjZ
 j7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681901238; x=1684493238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ef5jinu68hChsQPL90lIFDCf/6lC4PbhW9wu+rG7+o0=;
 b=DKbcCaOH/0iIuGMzNwvYNv27Mk+9NgNuw/C5mDO3SCmCeWuaaLKLk3ZTEdRFBCULe3
 kNCbJqPFFHVSifrkcGzv6YycwKKm04Z2uB19ZEORvY2R5f7s8Xn2QkBuzvvoMPcAmMR1
 FrbQKJ6DSVWxvdip7KW678q3cPjd4P4BgCYn9oT3bNux8arzfJH/sdPBcMUixAlOllBy
 2eGx5LnHKdbkcOb3PjSvgL0zsSBIS59r6JR/hVkJe7q0EhmxaAR8pdxWJkPkzSn+9AQU
 xtt9NwKgR1ynn1keuJ3h/64woG7IrjeLEwtGLg2/zn1BOv+325EOmMkJVbSLlM8OuJI6
 PiFw==
X-Gm-Message-State: AAQBX9c6mbfTwR6Kg1WkMxM29hvgMQ7BKAy14040va4BKrHEQL1Ay2ym
 KzF6D9Cn8B5Ao75xhlDaq3alTqq9OHNwiRt1Gcw=
X-Google-Smtp-Source: AKy350aHmthhp0IFZ0TnKbCamhN7olX7ZFASuauGWbeHtx1TZh+J0gjvGhLHwKEsUYp7tk86iFQW4196TmK7coLmgQo=
X-Received: by 2002:a17:902:da84:b0:1a6:c4fd:d42 with SMTP id
 j4-20020a170902da8400b001a6c4fd0d42mr5164953plx.67.1681901237872; Wed, 19 Apr
 2023 03:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <3e47f0d1017fe4c9f71a5de65f32c6ba1662efe2.camel@pengutronix.de>
 <CAHCN7xL4+9NogrnXA1PEWorwY7JpSGBozDtHT83JvzjfinmS+A@mail.gmail.com>
In-Reply-To: <CAHCN7xL4+9NogrnXA1PEWorwY7JpSGBozDtHT83JvzjfinmS+A@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 19 Apr 2023 05:47:06 -0500
Message-ID: <CAHCN7xK8K+DsNAFTVAezwJQzZ7RCDb2CjCBZ8dNb=S8d1BmtMA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 m.szyprowski@samsung.com, marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 6:55=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Apr 17, 2023 at 3:43=E2=80=AFAM Lucas Stach <l.stach@pengutronix.=
de> wrote:
> >
> > Hi Adam,
> >
> > Am Samstag, dem 15.04.2023 um 05:40 -0500 schrieb Adam Ford:
> > > If there is more than one lane, the HFP, HBP, and HSA is calculated i=
n
> > > bytes/pixel, then they are divided amongst the different lanes with s=
ome
> > > additional overhead. This is necessary to achieve higher resolutions =
while
> > > keeping the pixel clocks lower as the number of lanes increase.
> > >
> >
> > In the testing I did to come up with my patch "drm: bridge: samsung-
> > dsim: fix blanking packet size calculation" the number of lanes didn't
> > make any difference. My testing might be flawed, as I could only
> > measure the blanking after translation from MIPI DSI to DPI, so I'm
> > interested to know what others did here. How did you validate the
> > blanking with your patch? Would you have a chance to test my patch and
> > see if it works or breaks in your setup?

Lucas,

I tried your patch instead of mine.  Yours is dependent on the
hs_clock being always set to the burst clock which is configured by
the device tree.  I unrolled a bit of my stuff and replaced it with
yours.  It worked at 1080p, but when I tried a few other resolutions,
they did not work.  I assume it's because the DSI clock is fixed and
not changing based on the pixel clock.  In the version I did, I only
did that math when the lanes were > 1. In your patch, you divide by 8,
and in mine, I fetch the bits-per-pixel (which is 8) and I divide by
that just in case the bpp ever changes from 8.  Overall,  I think our
patches basically do the same thing.

adam

>
> Mine was purely by trial and error.  I don't have a scope, nor do I
> have a copy of the MIPI DSI spec, so if the image sync'd with my
> monitor, I treated it as successful.
>
> I can give yours a try, but it might be a few days since I've only
> been working on this stuff a bit in my spare time.
>
> adam
>
> >
> > Regards,
> > Lucas
> >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 40 +++++++++++++++++++++++--=
--
> > >  1 file changed, 34 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/=
bridge/samsung-dsim.c
> > > index e0a402a85787..1ccbad4ea577 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -215,6 +215,7 @@
> > >  #define DSI_RX_FIFO_SIZE             256
> > >  #define DSI_XFER_TIMEOUT_MS          100
> > >  #define DSI_RX_FIFO_EMPTY            0x30800002
> > > +#define DSI_HSYNC_PKT_OVERHEAD       6
> > >
> > >  #define OLD_SCLK_MIPI_CLK_NAME               "pll_clk"
> > >
> > > @@ -879,13 +880,40 @@ static void samsung_dsim_set_display_mode(struc=
t samsung_dsim *dsi)
> > >                       | DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
> > >               samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
> > >
> > > -             reg =3D DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
> > > -                     | DSIM_MAIN_HBP(m->htotal - m->hsync_end);
> > > -             samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
> > > +             /*
> > > +              * If there is more than one lane, the HFP, HBP, and HS=
A
> > > +              * is calculated in bytes/pixel, then they are divided
> > > +              * amongst the different lanes with some additional
> > > +              * overhead correction
> > > +              */
> > > +             if (dsi->lanes > 1) {
> > > +                     u32 hfp, hbp, hsa;
> > > +                     int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->f=
ormat) / 8;
> > > +
> > > +                     hfp =3D ((m->hsync_start - m->hdisplay) * bpp) =
/ dsi->lanes;
> > > +                     hfp -=3D (hfp > DSI_HSYNC_PKT_OVERHEAD) ? DSI_H=
SYNC_PKT_OVERHEAD : 0;
> > > +
> > > +                     hbp =3D ((m->htotal - m->hsync_end) * bpp) / ds=
i->lanes;
> > > +                     hbp -=3D (hbp > DSI_HSYNC_PKT_OVERHEAD) ? DSI_H=
SYNC_PKT_OVERHEAD : 0;
> > >
> > > -             reg =3D DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
> > > -                     | DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
> > > -             samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
> > > +                     hsa =3D ((m->hsync_end - m->hsync_start) * bpp)=
 / dsi->lanes;
> > > +                     hsa -=3D (hsa > DSI_HSYNC_PKT_OVERHEAD) ? DSI_H=
SYNC_PKT_OVERHEAD : 0;
> > > +
> > > +                     reg =3D DSIM_MAIN_HFP(hfp) | DSIM_MAIN_HBP(hbp)=
;
> > > +                     samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
> > > +
> > > +                     reg =3D DSIM_MAIN_VSA(m->vsync_end - m->vsync_s=
tart)
> > > +                             | DSIM_MAIN_HSA(hsa);
> > > +                     samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
> > > +             } else {
> > > +                     reg =3D DSIM_MAIN_HFP(m->hsync_start - m->hdisp=
lay)
> > > +                             | DSIM_MAIN_HBP(m->htotal - m->hsync_en=
d);
> > > +                     samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
> > > +
> > > +                     reg =3D DSIM_MAIN_VSA(m->vsync_end - m->vsync_s=
tart)
> > > +                             | DSIM_MAIN_HSA(m->hsync_end - m->hsync=
_start);
> > > +                     samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
> > > +             }
> > >       }
> > >       reg =3D  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
> > >               DSIM_MAIN_VRESOL(m->vdisplay, num_bits_resol);
> >
