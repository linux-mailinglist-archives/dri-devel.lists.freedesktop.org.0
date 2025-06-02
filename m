Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780CCACAC45
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 12:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F311710E4E9;
	Mon,  2 Jun 2025 10:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IyOvsy+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C817C10E4E9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 10:10:19 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so24807415e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748859018; x=1749463818; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c37LvNlWl52qBAYfX/7eP3J23YVHzuToqgxYWLWYiXs=;
 b=IyOvsy+MMtEfFO8WOMe6gURH/v9v1ui/6D3nTAymEPyk9zeXtJPQ8SxyjCJWdFyJj0
 Hrqb1efQxkrY9NLt8niahiVRrl06Xmr8Q4QgucniMe/+KduF80Kd8ixk9mnibTkKBSes
 XIxO8GzI2V7a9uWHk90AdL7qp9kvL1z3JN+RVIvFryIa3+uWSWBDtFOuLcVAnh/QianU
 To9XhpRTKC18xcnnk0UELY6NzV2btuhULoUUkVyAaCGq2QwaNCzbkgmgdk4Z8fRCX20p
 on17DbaO6FG3RaDfRaNPkX65rcqKL35pCJeW8/yh9vL4zbqj/lFOdt50d1BUj4bbiPDu
 H4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748859018; x=1749463818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c37LvNlWl52qBAYfX/7eP3J23YVHzuToqgxYWLWYiXs=;
 b=MiEzAk6NmYGku2UkASIxQR4FDXXSkGI/bjgM8VjowiUY73LtCDCuXA/U3k3JYhChhl
 FRL+D6eNgqknun3FR3AeD+U0vClZcVLdRbgo4xNYi6Df4F+PFnkUlJOAgyTqTQxb6kNk
 QsoOgjnl2B0tkEH8l0bPczyz+LJNpKkoFKJAoM81eRsLJO3OxM6BWwGXp61vBuoY/A7o
 LgHSXnQmrLlcNaL+RC7VKCazKt+HKWoLrMji0dO73ObMJusKv6UNUiAgRjLZ2b2lQhfE
 +fLXKpElS2dOdyurUY12vVphNeQHttF7MuDbqKDlg+JbjXptXhbkUKV5BPLMfIW2O+2g
 cOzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVh9fEzsL0ERJHc+ePBwJJciz02/GKDuhq38vmw+/duprOI+FNWrKW71GQxeGMVM41/ZZvvHjFcLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyELo+fcasb95lCRRwaTTwLVboiJhOutTVfwfjgTMHllCGvY+ls
 A+k9guUBPmh+qapm681zsepTcsCwzQD+xL2PZ7sbXq9Yi6/sR17m09DVdk6R/Hu5hDIs7OQiMtr
 ZSBWgv0jEhivDuef0ce8BtkWCYyg6ajk=
X-Gm-Gg: ASbGncsvLYv/aYGxUegiYVKrkQlg8TyjEHso9ACsmrzOohlsAxcOl6vpABt+Z9g3uzl
 AczZpJq2mZOkoh2Fk5hZj+yuEzrkHNUqKJw/p1h992vlnPEI5QaCHR8fv1LMVmSLxsxn2H4KO8/
 nuowGchK+ArStgKy7NV9X/vVlHJMm8i+1B
X-Google-Smtp-Source: AGHT+IEgKL8zfIDI5qTT8HOuKd9YpyA8u9uwtHaeIBHhfWQyeMJjTtPZxE89y1xTcJ7+i1RcaKzDUvLJXUthxip25vA=
X-Received: by 2002:a05:6000:3112:b0:3a4:bac3:2792 with SMTP id
 ffacd0b85a97d-3a4f7a3dc11mr9651708f8f.4.1748859017860; Mon, 02 Jun 2025
 03:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250602094230.GA3645@pendragon.ideasonboard.com>
In-Reply-To: <20250602094230.GA3645@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jun 2025 11:09:51 +0100
X-Gm-Features: AX0GCFvU4EN1awcvV6DWq0sPlDw_VVSuNxrtTbJXgz7-s4LPbEB8Tq9WT_VuUrs
Message-ID: <CA+V-a8t__xkMRDrum+DYzg6584y9MmOTuOypC5qzyuW1THigNA@mail.gmail.com>
Subject: Re: [PATCH v6 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
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

On Mon, Jun 2, 2025 at 10:42=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, May 30, 2025 at 05:58:59PM +0100, Prabhakar wrote:
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
> > v5->v6:
> > - Dropped parentheses around the calculation of `hsfreq_max`.
> > - Changed dev_info() to dev_dbg
> >
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
> > index e8ca6a521e0f..4d4521a231cb 100644
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
> > +             if (hsfreq <=3D dphy_timings->hsfreq_max * KILO)
>
> Why don't you modify hsfreq_max to also store the frequency in Hz ? That
> would bring more consistency across the driver.
>
Agreed, I will add a separate patch for this.

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
> > +     clk_set_rate(dsi->vclk, mode->clock * KILO);
> > +
> >       /*
> >        * Relationship between hsclk and vclk must follow
> >        * vclk * bpp =3D hsclk * 8 * lanes
> > @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mi=
pi_dsi *dsi,
> >        * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> >        */
> >       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > -     hsfreq =3D mode->clock * bpp / dsi->lanes;
> > -
> > -     ret =3D pm_runtime_resume_and_get(dsi->dev);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +     vclk_rate =3D clk_get_rate(dsi->vclk);
> > +     if (vclk_rate !=3D mode->clock * KILO)
> > +             dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mi=
smatch\n",
> > +                     mode->clock * KILO, vclk_rate);
>
> I would move those 4 lines just below clk_set_rate().
>
Agreed, I will move them in the next version.

Cheers,
Prabhakar
