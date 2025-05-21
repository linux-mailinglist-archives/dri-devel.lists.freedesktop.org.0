Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B901BABF6C8
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEAC14BE68;
	Wed, 21 May 2025 13:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XSa2aIP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229C0112876
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 13:05:47 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a35919fa8bso2760863f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 06:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747832746; x=1748437546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kq2QYelvGUau3xiMyKB8CSK2D94ZYBdUfldDB6qPuP4=;
 b=XSa2aIP4Sp0WvB1k5lgujer5cHK9TexooT+14QoRFdavcoYBCv84XXQygeWXWnJRDw
 ZeGI9gZRHhg4K/DyCPgLgwuqvOFsE0kV5plyD+Enqhw9UG6JjYYAc6XTmTmw617aF8sv
 9ncATbMSvaW1UfmVc1JfkxvcRhxxmIvX78GWywcdY2YfZ8O1NrNdoCM0ASfh1mm1JfaT
 Rl2KxzM38bdJ6pXP3+HcrPyUXlxmMbMhFtab9BhbATzW3/O0I1caJ+iUI1abXupw5lzf
 aOmDX0VA0XVMPP5qRSUv8TkzGJoLazI3BhReWzpsmkCc3J8x8WeFJ1t0hz6eDgB29sUe
 BVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747832746; x=1748437546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kq2QYelvGUau3xiMyKB8CSK2D94ZYBdUfldDB6qPuP4=;
 b=J9kOcIqy9h7bQwmmM4KbjqijsdJ3uV4ouQ4EXCajUs08wxKedIMCN3Hk+gcWKO79at
 7exuGGNsTFqfvl+T2jc4G3L3KoOFzi+zvUKniSrzQBOhtmdensStu9wE07DCJfEozT7y
 pyqq4WAFyfuOFDOuYqBtSPbUYzq7vqsQqcNjZiHQHOkuW2R8lTgIh+LfIVBnmQHWyLKR
 ZGT24/TLBd5UlfgvXt1GRtT+NCXrO0MDEqBM9BSn/x0W17zO2FDFR18IVuIBB6ItXSD3
 ViH1vjRzFx+DiAFJxcCsh4QItsFhvUrjqp3j3MsLNjwc/y8U7SJrdmixF5mnEG+eirqF
 CHnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjcENJcmzOyAxBHf+XZ8lv07cPenwJgkHz6CeAmsMt4/jk7PAzTrIidashaKwZP36XAdv0o0AzKf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+Kj/oMl+PDPEJwAxxvqzDH6MCnKmsL88Gmk0a2NDWfxUs3cmm
 HSYWQWtdPoDU5v4l5GvCY3wMTyNZVoAZ0RLfDHt5nYWXRGH285yjhg5tJLQB2N//xcKqvhJOiKC
 3YPQq7Jy+gJSpiHSSIRwJBYNmG3mA4m8=
X-Gm-Gg: ASbGncuHQGjJf3GJgcTl6v9iPfI72/C9tXQ6P8d9m3/VpzyVBOc8Aq1ZQ+96oNeJQh8
 bImNC92pBcG/VcjCEhLpmx6IgTuSiD9WIbxrA4299kZWCAG9AQtPg2FwAR95a7HIjujWYyh+jLA
 mSJFF3XGhHEj2mT5ncPgtlym2ZqXI=
X-Google-Smtp-Source: AGHT+IGzS8pfQi7/dEbDdomy3hkC6k+0NgcpCjRsfjoA9Qd7+Ky5V/M+iNzbPe2SPdzvMWVOmv6VmO08Wn3ieAZwt5I=
X-Received: by 2002:a05:6000:40e0:b0:3a0:b733:f264 with SMTP id
 ffacd0b85a97d-3a35fe5ba7amr17805296f8f.11.1747832745550; Wed, 21 May 2025
 06:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250520141645.GE13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520141645.GE13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:05:19 +0100
X-Gm-Features: AX0GCFtZ4ZN7SPwiR4G15YWl5KOoD357yy9hFAPfXBDbSCglSfFCpeL2eSTQ_IE
Message-ID: <CA+V-a8uG_5U_1XHJLQKRn3wgK4VBDJwV9_7uHtGC2j76pEbJ5g@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
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

On Tue, May 20, 2025 at 3:16=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Mon, May 12, 2025 at 07:23:23PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
> > VCLK rate instead of the mode clock. The relationship between HSCLK and
> > VCLK is:
> >
> >     vclk * bpp <=3D hsclk * 8 * lanes
> >
> > Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
> > HSFREQ accurately reflects the clock rate set in hardware, leading to
> > better precision in data transmission.
> >
> > Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
> > when computing `hsfreq`. Also, update unit conversions to use correct
> > scaling factors for better clarity and correctness.
> >
> > Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
> > threshold comparisons to use Hz instead of kHz to ensure correct behavi=
or.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - Added dev_info() to print the VCLK rate if it doesn't match the
> >   requested rate.
> > - Added Reviewed-by tag from Biju
> >
> > v3->v4:
> > - Used MILLI instead of KILO
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - No changes
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 30 +++++++++++--------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index c5f698cd74f1..3f6988303e63 100644
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
>
> No need for the inner parentheses.
>
Agreed, I will drop it.

> >                       break;
> >       }
> >
> > @@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_m=
ipi_dsi *dsi)
> >  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> >                                 const struct drm_display_mode *mode)
> >  {
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
> > +
> >       /*
> >        * Relationship between hsclk and vclk must follow
> >        * vclk * bpp =3D hsclk * 8 * lanes
> > @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mi=
pi_dsi *dsi,
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
> > +     if (vclk_rate !=3D mode->clock * MILLI)
> > +             dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu m=
ismatch\n",
> > +                      mode->clock * MILLI, vclk_rate);
>
> There's a high risk that the requested rate won't be achieved exactly.
> Do we really want to print a non-debug message to the kernel log every
> time ?
>
Actually Biju requested the above.

> > +     hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
>
> I doubt DIV_ROUND_CLOSEST_ULL() will make any difference in practice
> given that you can't have more than 4 lanes, but that's fine.
>
Thanks, I'll check on it.

Cheers,
Prabhakar
> >
> >       ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> >       if (ret < 0)
> > @@ -304,12 +310,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mi=
pi_dsi *dsi,
> >        * - data lanes: maximum 4 lanes
> >        * Therefore maximum hsclk will be 891 Mbps.
> >        */
> > -     if (hsfreq > 445500) {
> > +     if (hsfreq > 445500000) {
> >               clkkpt =3D 12;
> >               clkbfht =3D 15;
> >               clkstpt =3D 48;
> >               golpbkt =3D 75;
> > -     } else if (hsfreq > 250000) {
> > +     } else if (hsfreq > 250000000) {
> >               clkkpt =3D 7;
> >               clkbfht =3D 8;
> >               clkstpt =3D 27;
> > @@ -753,7 +759,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
> >        * mode->clock and format are not available. So initialize DPHY w=
ith
> >        * timing parameters for 80Mbps.
> >        */
> > -     ret =3D rzg2l_mipi_dsi_dphy_init(dsi, 80000);
> > +     ret =3D rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
> >       if (ret < 0)
> >               goto err_phy;
> >
>
> --
> Regards,
>
> Laurent Pinchart
