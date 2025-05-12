Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A856AB3ADD
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8400810E413;
	Mon, 12 May 2025 14:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="elyiDxk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C717F10E413
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 14:42:54 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a0ac853894so3965762f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747060973; x=1747665773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgS0gFzPJkgOZrUm2WjFUj6B4kBtJbfFOU+fHqfvDz4=;
 b=elyiDxk4cesmN6btznycaSN52Fl/P+9H/6wOCzWOuPYN76KHWt/vNhoZxtoa/fohfZ
 nyJKhHmW92K+S8jNvQnqD2B+jcS4VnyVZ6D5RQ1zbiL9Y8lJIgQdvEiEFhk85JOavbgT
 ytzo0yeC0Po3vjQDJJUvqVhDk5DazhGNUmGyitDND4SGDXl/Pe55qXC2Ku8rswWlmM3O
 z+zMOz138RFoHsro6YpL3hULS6hCRgsGP0+XKXbTgTf1bWWPo2W4mqgy6GQrbLM9QEaX
 4Lj+gVlSN4HmU3Qrwti40kuCxkZ5q/lht98E3L4kVjHWwUrJMdqbZT6VvFWchnDaIink
 Xrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747060973; x=1747665773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgS0gFzPJkgOZrUm2WjFUj6B4kBtJbfFOU+fHqfvDz4=;
 b=ZG2LodcyeL8GO7d1y8DiXhw8gdJqcWMDQksVJAHZrMX7pwsViLu4LnYDEsS7IFfaxR
 KE8qKxTealWFNyyau7NgWPn0qVBeKqEsH4IfaNXFvaiaGWbIi2V663gh9/3RB7NHkpU/
 rWATkBk8FBUIjo/JapREzMeCRDS3B6JcWOYt2kHWm+dGwlc8zYcQ75U+TaMgYv2ogGO4
 wuiW9aEeGQ6GBgin0iNTsIPlfLg6P4ymD0BT0Tv/rlIsfJ5WtdICgPjQMa8vH9L/HGZ4
 pvBPFK6FjlDEJF5Y5utnHycasc9FRX1Eig7YrCeNRk/nVM4aOMzj/684+HZIZEHMkoU2
 FrTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp0tHeqHjAeStKegCcbZ+28Igi0Vi3rhZLZ1iXkuCKNrjPzAt3KZ3rpEjBbdj1FcAmVMnxTR1tXB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfo6gRgxlHwsw5HotIUfOBoV+OVvluXqNWPk9nFb3Cb3VfzE6O
 G666T8R1IunRgFaOJY6/Q1x9wSBg6f92k57kb2Of/mPfV1Cj8e/LAhCUpC8C77ZLIsUu1db7d72
 I8H8amjkbynRaYVcblHMlZkjsXIQ=
X-Gm-Gg: ASbGnctcp4kC77hd3L03DcTY9vh/YNAdl9SRpF/FBwMRG7JSXTIZPHejvEFmId+uJ5Z
 DvPKo5MQ6DvQTxL0NPLcclqsztrT+caPx8YzKxA9sU26RuuiKDXrevjSo2HpCtwho9/eVNWuMVN
 iX/jzdopY9Og1Dt6S69wbJTttercW7Ldo=
X-Google-Smtp-Source: AGHT+IGgeCmhN6ZRg/tTj5xtux+YtjBRmxlsL0nR+eKs2oGnS9tHIOYCy15h6BCp659yOebsuWHJvxi2oHiACilW0rA=
X-Received: by 2002:a05:6000:420d:b0:3a2:39d:f51d with SMTP id
 ffacd0b85a97d-3a2039df76fmr5286273f8f.23.1747060972990; Mon, 12 May 2025
 07:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346F143A2F83CAD8733BD2E868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346F143A2F83CAD8733BD2E868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 15:42:26 +0100
X-Gm-Features: AX0GCFtIfNOD3yNLytAtJM5Aw-ApuQ_ToGcv-oRoFGArlVXSiaJ6rYqqvhWKN_4
Message-ID: <CA+V-a8sCY38_KZTaEsEyF2cXNA=+3R4405FdJwx+GbgUcogWeA@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

Thank you for the review.

On Sun, May 4, 2025 at 1:33=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 April 2025 21:41
> > Subject: [PATCH v4 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for H=
SFREQ calculation
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual =
VCLK rate instead of the mode
> > clock. The relationship between HSCLK and VCLK is:
> >
> >     vclk * bpp <=3D hsclk * 8 * lanes
> >
> > Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that H=
SFREQ accurately reflects the
> > clock rate set in hardware, leading to better precision in data transmi=
ssion.
> >
> > Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division w=
hen computing `hsfreq`. Also,
> > update unit conversions to use correct scaling factors for better clari=
ty and correctness.
> >
> > Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ =
threshold comparisons to use Hz
> > instead of kHz to ensure correct behavior.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Used MILLI instead of KILO
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - No changes
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 ++++++++++---------
> >  1 file changed, 15 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index c5f698cd74f1..911c955a3a76 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/math.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_graph.h>
> > @@ -15,6 +16,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
> >  #include <linux/slab.h>
> > +#include <linux/units.h>
> >
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > @@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mi=
pi_dsi *dsi,
> >       /* All DSI global operation timings are set with recommended sett=
ing */
> >       for (i =3D 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i)=
 {
> >               dphy_timings =3D &rzg2l_mipi_dsi_global_timings[i];
> > -             if (hsfreq <=3D dphy_timings->hsfreq_max)
> > +             if (hsfreq <=3D (dphy_timings->hsfreq_max * MILLI))
> >                       break;
> >       }
> >
> > @@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_m=
ipi_dsi *dsi)  static int
> > rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> >                                 const struct drm_display_mode *mode)  {
> > -     unsigned long hsfreq;
> > +     unsigned long hsfreq, vclk_rate;
> >       unsigned int bpp;
> >       u32 txsetr;
> >       u32 clstptsetr;
> > @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mip=
i_dsi *dsi,
> >       u32 golpbkt;
> >       int ret;
> >
> > +     ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     clk_set_rate(dsi->vclk, mode->clock * MILLI);
> >       /*
> >        * Relationship between hsclk and vclk must follow
> >        * vclk * bpp =3D hsclk * 8 * lanes
> > @@ -280,13 +288,8 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mip=
i_dsi *dsi,
> >        * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> >        */
> >       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > -     hsfreq =3D (mode->clock * bpp) / dsi->lanes;
> > -
> > -     ret =3D pm_runtime_resume_and_get(dsi->dev);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +     vclk_rate =3D clk_get_rate(dsi->vclk);
>
> Not sure, If there is a requested vclk for example, 108.45 MHz and get_ra=
te() is returning
> only 108MHz, do we need to propagate/print this error(like requested vs a=
ctual, if there is a mismatch)
> as there is change in resolution?
>
OK, I'll add the below:

       if (vclk_rate !=3D mode->clock * MILLI)
               dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu
mismatch\n",
                        mode->clock * MILLI, vclk_rate);

> Otherwise LGTM
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>

Cheers,
Prabhakar
