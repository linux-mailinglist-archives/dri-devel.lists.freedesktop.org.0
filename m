Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8BBBDF2DE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C5410E81C;
	Wed, 15 Oct 2025 14:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWNfzApJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA79B10E81C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:56:26 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so4971699f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760540185; x=1761144985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GI9CaA/4ITOkaOZyH+29H11i4BVtBD/Oo8oTodLjamo=;
 b=WWNfzApJpXtok4OJcQZtFpB/Uq7YkvilogUmMgwA/rX3ADH3JOKttGc3PrO3UtLXI7
 519FaRl965lIVxi5bbOzR8bgEOjKfARVqgIma8l2xChEu2NyyeBJzJsaGnCyCr8MASwj
 15lKQ95Waj4S3rhqDDYZIIBvmbOXo4JpHrntqX1tWCD9hf8bU8t0OiVpBRT98gpm3Sy8
 4vGr5sFCdLRmmrUNgXZ1TEgDkukSBzvIVizKdxL5BE6acZrQUWh1cRffbdRM+JWl4Qa+
 qBLZxtFEhF2OzMQuHmCsTCdkW53btG0i4WcFdi3xPFxjGHOc/aB1bcUwnONwAD9igyUc
 Qt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760540185; x=1761144985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GI9CaA/4ITOkaOZyH+29H11i4BVtBD/Oo8oTodLjamo=;
 b=OlpFklm/nxOHXSAijP3B5upuxvqW+Y7RgaCQPiYMmhxmepiG94YM2hik5AexvddkV6
 0jnQ3d3TIT560dAn/P/hpvptHwIinXi3GAa1GJxWbOUvoNuINJUwyy7UqlM/JTgqSVTu
 VYACjZr9mfqximaw6PaH0JHOtdpc1SmE3+gjigojrN39CF/pmPt2n3p10d0rBj5WfPVa
 Z4HBujpBvNqldNPvOVh1HKXIxTmcXTDYpw837JIx32VIvIM1QoPGrzm6MUa2o3HsKPf3
 B7rdBZSxs2LbznnS+Tq2j6HTAkzXfm44J2Y5kQEnNEEkJPqMI/Bn+YM71q9soyKWZ0/r
 IOmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM+ckgJA07Jl1eQx5T0UIl0HGOSv9YYFbty3cZQcGqDMM5Qlvhlp2DOJtWy7r7bpe1+gcCqfZg4a8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8NReu7bdzIC71akyxTbNHSwgBkMSOeKy3afxOn4HXWepGs1DN
 3Wj17rjGehJd/WsSBClcRzu+68iUKfZ4nc2tPg9G/h7HfNRMrHFTnJ5Nli009pItQDwFB1QuS37
 CoRofn1mbBTYhP5BCs+g7VVG58WB6sEo=
X-Gm-Gg: ASbGncudmfgP5/h3OMMN+ActJCM9Ea8tjfa5lbAwx4tFc2Z474abv83bJBVVj0LQcpo
 cUdSL52ZcOvJNFxSbD6frIWHfid6LRCfwJ1WfttK0cXs1wx2R2XmQxCosnCXUSH6ArTZkCaWsBI
 RALoprsOqVRmKR2P5YC0QdstJ+yjJp8LAAWHQZqsQMEGyHaMod+LUg81jZtFnsmAo9n8vU5hBXS
 hbgoSwcfd5nFKprwXiFOugHPkTIw+e1Zkafh+4ivPoRIXmuL+lQ7w2Lqefw
X-Google-Smtp-Source: AGHT+IH5L1Mo7xLa57k+5KugvuK+N+9eSJpkUwgo4LQeKXBhJMy9CjFuhGIGVQ+i6zqQoqwOUPriVfL9xrycTyM9beg=
X-Received: by 2002:a05:6000:43d6:20b0:426:f391:1968 with SMTP id
 ffacd0b85a97d-426f3911a30mr3441482f8f.35.1760540185079; Wed, 15 Oct 2025
 07:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 15 Oct 2025 15:55:57 +0100
X-Gm-Features: AS18NWDborL4rX4hqJjZmtwrGarJ9O0NBNJ1OthS7bueNWRfQx925JxPvOSaoZs
Message-ID: <CA+V-a8s9v5QmU=vrHM6wkFbEwdzp_+eE6kxEN53JfhnpA2KOUg@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

Hi Geert,

Thank you for the review.

On Mon, Oct 13, 2025 at 3:26=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, 9 Oct 2025 at 18:07, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and its post-dividers to the RZ/V2H CPG driver a=
nd
> > export a set of helper APIs to allow other consumers (notably the DSI
> > driver) to compute and select PLL parameter combinations.
> >
> > Introduce per-PLL-DSI state in the CPG private structure and implement
> > clk ops and registration for PLLDSI and PLLDSI divider clocks. Implemen=
t
> > rzv2h_cpg_plldsi_determine_rate and rzv2h_cpg_plldsi_set_rate to drive
> > PLL programming via the new per-PLL state and add a plldsi divider clk
> > with determine/set/recalc operations that cooperate with the PLL
> > algorithm.
> >
> > Centralize PLL parameter types and limits by moving definitions into a
> > shared header (include/linux/clk/renesas.h). Add struct rzv2h_pll_limit=
s,
> > struct rzv2h_pll_pars and struct rzv2h_pll_div_pars, plus the
> > RZV2H_CPG_PLL_DSI_LIMITS() macro to declare DSI PLL limits.
> >
> > Provide two exported helper functions, rzv2h_get_pll_pars() and
> > rzv2h_get_pll_divs_pars(), that perform iterative searches over PLL
> > parameters (M, K, P, S) and optional post-dividers to find the best (or
> > exact) match for a requested frequency. Export these helpers in the
> > "RZV2H_CPG" namespace for use by external drivers.
> >
> > This change centralizes DSI PLL rate selection logic, prevents duplicat=
e
> > implementations in multiple drivers, and enables the DSI driver to
> > request accurate PLL rates and program the hardware consistently.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v9->v10:
> > - Dropped rzv2h_get_pll_div_pars() helper and opencoded instead.
> > - Dropped rzv2h_get_pll_dtable_pars() helper and opencoded instead.
> > - Added dummy helpers rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars(=
)
> >   in renesas.h for !CONFIG_CLK_RZV2H case.
> > - Updated commit message.
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request =
*req)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct pll_clk *pll_clk =3D to_pll(clk_hw_get_parent(hw));
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       u8 table[RZV2H_MAX_DIV_TABLES] =3D { 0 };
> > +       struct rzv2h_pll_div_pars *dsi_params;
> > +       struct rzv2h_pll_dsi_info *dsi_info;
> > +       const struct clk_div_table *div;
> > +       u64 rate_millihz;
> > +       unsigned int i;
> > +
> > +       dsi_info =3D &priv->pll_dsi_info[pll_clk->pll.instance];
> > +       dsi_params =3D &dsi_info->pll_dsi_parameters;
> > +
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +       if (rate_millihz =3D=3D dsi_params->div.error_millihz + dsi_par=
ams->div.freq_millihz)
> > +               goto exit_determine_rate;
> > +
> > +       div =3D dsi_div->dtable;
>
> This belongs inside the for-initializer below.
>
Agreed.

> > +       i =3D 0;
>
> Ditto; or better: in the variable declaration at the top of the function.
>
Ok, I will move to the top.

> > +       for (; div->div; div++) {
> > +               if (i >=3D RZV2H_MAX_DIV_TABLES)
> > +                       return -EINVAL;
> > +               table[i++] =3D div->div;
> > +       }
> > +
> > +       if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_para=
ms, table, i,
> > +                                    rate_millihz)) {
> > +               dev_err(priv->dev, "failed to determine rate for req->r=
ate: %lu\n",
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millih=
z, MILLI);
> > +       req->best_parent_rate =3D req->rate * dsi_params->div.divider_v=
alue;
> > +       dsi_info->req_pll_dsi_rate =3D req->best_parent_rate;
> > +
> > +       return 0;
> > +}
>
> The rest LGTM, so with the above fixed, and the field changes factored
> out into a separate patch:
Ok, I will move the field changes into a separate patch.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Cheers,
Prabhakar
