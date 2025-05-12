Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6982AB3CD5
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B960A10E449;
	Mon, 12 May 2025 15:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T1WYB+vO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64A710E449
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 15:58:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so33599615e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747065512; x=1747670312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Tiu7K1d+E3ERrbWyua7cTehS3PZhz9sGhrRK35gQe8=;
 b=T1WYB+vOw+gJoaCIXIK/k9vz/LOtVzED60/Uy3Y7OoZZz/iv3fPIculhA/l2orVwQM
 x6TsPlYynVd+BVvpGFdJUDR1+4U/QbSVLiq76TR1KHQ+TZqm9swb8VUT3FW9JT2MjhDy
 0qU5wS/CLLiSKQQjIkGFY0vgx8P+JhY5XZlUImGwsbQ96ibZmKhKxHpQe8G++TR9r0G5
 dq6gvo3/uOOftULxGyqnb+sl7RkRC7MsamyQwPH7+T9wHti6FtQHQbbv/Hcw4v2MDI79
 EfZ7BbvUt+fQBNnHlx0rDvSFeLySSl8q5f25aNNbGiluK310psKc5xgJE1OKCyvGsNIt
 6tdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747065512; x=1747670312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Tiu7K1d+E3ERrbWyua7cTehS3PZhz9sGhrRK35gQe8=;
 b=QCRhOzPKf/r2JHeKWIeKM15XkB/ZpzCS0uSyGtcKn5b3rQGFWVHsOUQRcGujOS7oIr
 4wZ26KYHx9INKa8ZsVuYS3N99KPifDQd8iD7P2fdwse5ODGRZtxqxAHMDkU5sk5xsTFY
 ZFZFP3TUoy7U9mUcMTSUths6zDdk0sq+CUQiKkwMNpz6xrFipDspohpb08Xe7HvMRJnq
 u1h0fTafTp57Bwz1keMJeF3NLnJyRlX7sm5BwMGAF51K8sGyVxyCKyORDein4hcYcJ/K
 NYHtwTf7CMnmsyy6y2IJtVUS5EJF4a+1Pjpfw4hcicuh1PTb0ZRocWNRngcIJcEIJlmv
 Gsrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYlYEmoTnmoEVhIPhYYmgdaVvMF4ULBPMupfi0MmJQ+7b//dCC9op7eUIp7ycp1jv9KnCcsgmo8Mc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoXiDfYB4SOgc8jeFKluWtjWGN8+czVzVKRObEY60L/Qi2atZe
 oNiDw9lPersgI2azIPsJqfe9gyyN6qQAwDAghS1jpc9kNEhUmkU1yl5k/fRV2WvnYHriUmGctFX
 9yP9enffBczD/KwJiYOBp/w/NBvY=
X-Gm-Gg: ASbGnctOkE4znNYJZcPdCpd4BC0TIAzVVDS1QxqzF5euFdaHUfiKgMb0o1u+wfI4g+t
 7pnilELOMYfvppAfVkpM5KLlUORedRrkasn8Z0UxSOYc45S8XDK/oLBO5gPmM0XeaIDL3gP2IWg
 cDxNPukEmHPd6ER/0cVVbU8zdJp8t9CRLf2klp4+4V7A==
X-Google-Smtp-Source: AGHT+IFXbahmg2a+BTqiLfTc49OhOevVl2AgJz/PIJpOPa+2/Fc+7yusnDFsUzxWbWrLCDk5Ky9+6rU51Zl0bh1I2Eo=
X-Received: by 2002:a05:600c:1c8c:b0:442:dc6f:2f11 with SMTP id
 5b1f17b1804b1-442de4a8ca9mr58212345e9.25.1747065511651; Mon, 12 May 2025
 08:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113467D1EFC9C66CD94D216F3868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113467D1EFC9C66CD94D216F3868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 16:58:05 +0100
X-Gm-Features: AX0GCFuR8rcyABea0qPHxH1BuKL66czaA5OEAqMZRwiSFyesM0ZStKGzdKFxm4Y
Message-ID: <CA+V-a8vz-7o96s0ok2ap+Kg2=BKMv8O8Zk667bYi+0Cu8F399Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK handling
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

On Sun, May 4, 2025 at 2:00=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 April 2025 21:41
> > Subject: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support fo=
r LPCLK handling
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce the `RZ_MIPI_DSI_FEATURE_LPCLK` feature flag in `rzg2l_mipi_d=
si_hw_info` to indicate the
> > need for LPCLK configuration.
> >
> > On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required DPHY=
 register configuration,
> > whereas on the RZ/G2L SoC, this clock is not present. To accommodate th=
is difference, add an `lpclk`
> > clock handle in `rzg2l_mipi_dsi` and update the probe function to condi=
tionally acquire LPCLK if the
> > SoC supports it.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4
> > - No changes
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - Added LPCLK as feature flag
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index df43ff59e08e..22a386ca8ae3 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -30,6 +30,7 @@
> >
> >  #define RZ_MIPI_DSI_FEATURE_DPHY_RST BIT(0)
> >  #define RZ_MIPI_DSI_FEATURE_16BPP    BIT(1)
> > +#define RZ_MIPI_DSI_FEATURE_LPCLK    BIT(2)
> >
> >  struct rzg2l_mipi_dsi;
> >
> > @@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
> >       struct drm_bridge *next_bridge;
> >
> >       struct clk *vclk;
> > +     struct clk *lpclk;
> >
> >       enum mipi_dsi_pixel_format format;
> >       unsigned int num_data_lanes;
> > @@ -788,6 +790,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_de=
vice *pdev)
> >       if (IS_ERR(dsi->vclk))
> >               return PTR_ERR(dsi->vclk);
> >
> > +     if (dsi->info->features & RZ_MIPI_DSI_FEATURE_LPCLK) {
> > +             dsi->lpclk =3D devm_clk_get(dsi->dev, "lpclk");
> > +             if (IS_ERR(dsi->lpclk))
> > +                     return PTR_ERR(dsi->lpclk);
> > +     }
> > +
>
> Can we use devm_clk_get_optional() and get rid of this Feature bit check
> as DT binding check validates for a particular SoC this clk is required o=
r not?
> Otherwise, there is no usage for optional API's?
>
OK, I'll switch to devm_clk_get_optional().

Cheers,
Prabhakar
