Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CEA988F4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 13:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3438410E085;
	Wed, 23 Apr 2025 11:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XRA+uEMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8B10E085
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 11:54:26 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39ee623fe64so5481761f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 04:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745409265; x=1746014065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXiSx30w1hmWlM/Di4qv5E69sWeA1eC0NCdlxnJgn04=;
 b=XRA+uEMGouoJcY9AY8GsUFtzwLpmMjkAmTHrRx8bsvi0lmu8MyxXB9Ba/zahTQKDfu
 Kxw/z5hbxuHmCX7sNhblNsmOFC6qi1ijcBP18z1+Q9HZgIeQSrCTC9eIwCJ9DltceuzR
 Cubm4nr9d8XGVz68TlVnFEFFkBJNH8QiNo6g43+TFF9X5znBBRDp1DbuuCk6f802E8vj
 wfQd4aMziPvJbtIfRVFy3dGdXCIq1el+pHdomCRu8jHgH5RhMEYc4C2Y8Rej8pXF9ZrE
 iNLA7TXTUjafwcSWuC5o5KywUk7bSF7nTtlX50oN15N1nfXZEhO0jw3D3s4cVd6U42j5
 zQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745409265; x=1746014065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXiSx30w1hmWlM/Di4qv5E69sWeA1eC0NCdlxnJgn04=;
 b=S8jqItLz9m2CH37+761Wc9UpyijWPOMuDMBI8kpMNJZ5lLQnql7Pue/OXL4VoCAXCh
 ARpyCJzvQmm9pFhNy8XfAktRWY4XzQVGN6GJnTlI5tE7xH+U1Nji9eHOT3m5mwud977P
 BOhNjLrLDHzPAyaaAWJ6Z+VVwplJEqw4so5ekVHvkdWs7vkI9RnSuC7AZE+acwFXJpgD
 PqNF1Nw020L9x6L7Ev2NagQN1a3AFajlkDnQYI52ZQLq0/lbCHzwoZmMCSCoDhBv4/1B
 rColCymevr/J7ixq4PlJhWHSouo5yUwWlSbEnQeURPLgdMzskLT8U1V3BCDVhlDT+gph
 3T1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrOZ3O3bKGBQ33efgavx5u3PfLWWfV5xTIQBDPyEbVNs+cqovSVs9Y63NZMIpmLSjLpHyeswOFM9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxexaWpnoKntoI5D7+gofkaT6348YmIsvua0Ur/0tlc0b1zYFF
 fGg/Kw5AaGOk1VwDYeLFTQ7JL7FFpmJY2aq0N+0rXXw2A6Zh44pTvC4s47bDYO6a8RbAfdHJizf
 iq0Aq9LicIWOr3GzKJcRBBe5xa4Y=
X-Gm-Gg: ASbGnct2peESgVeViaBmWosskpUv7FzDFDb94P/M4AUpVnx/eq2a7Sc28e2UaIogIMR
 +dqwLtGyEesFHADMFtoHeqPxEuUZw6WZUh9OY1vZ91uZHJ+9YQrnXlZa0FwcZ/PsdeP3BvcUQWV
 760hK84GAnpmPHtzbJh5TVhTJL47mxAJdT
X-Google-Smtp-Source: AGHT+IFmLMHRjZ1XgjDcqyxjk7BtcPPGf+OCSTtdICXla1NMLROjvh3kKmkIO0184O1OWZlMMASHo5tS0W9iQ2Iv8xM=
X-Received: by 2002:a05:6000:43cc:20b0:39f:fd4:aec7 with SMTP id
 ffacd0b85a97d-39f0fd4aed9mr4142583f8f.7.1745409264608; Wed, 23 Apr 2025
 04:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250418184658.456398-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWs7R9rtS7Ur6PP9e3m9ghkM1jc_Xn3QOWG4rvTtB2omA@mail.gmail.com>
In-Reply-To: <CAMuHMdWs7R9rtS7Ur6PP9e3m9ghkM1jc_Xn3QOWG4rvTtB2omA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 23 Apr 2025 12:53:58 +0100
X-Gm-Features: ATxdqUE-OgT80-E06tUi_do9bnwXEJELC81J36DTuicZR1BwPkK_CJ9Za-SJxBA
Message-ID: <CA+V-a8tXpWf8-YL-qzWhqc+fDvV4Kzd-6gJqC5HWvE00QsNFAA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
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

On Tue, Apr 22, 2025 at 8:41=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 18 Apr 2025 at 20:47, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> > precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> > high accuracy.
> >
> > These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Replaced `unsigned long long` with `u64`
> > - Replaced *_mhz with *_millihz` in functions
>
> Thanks for the update!
>
> > @@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mi=
pi_dsi *dsi, u32 reg)
> >   */
> >
> >  static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> > -                                   unsigned long hsfreq)
> > +                                   u64 hsfreq_millihz)
> >  {
> > +       unsigned long hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, =
KILO);
>
> MILLI (everywhere)
>
OK.

> It's a strange world where KILO =3D=3D MILLI ;-)
>
:-)
>     include/linux/units.h:#define KILO      1000UL
>     include/linux/units.h-#define MILLI     1000UL
>
> >         const struct rzg2l_mipi_dsi_timings *dphy_timings;
> >         unsigned int i;
> >         u32 dphyctrl0;
> > @@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >                                   const struct drm_display_mode *mode)
> >  {
> >         unsigned long hsfreq, vclk_rate;
> > +       u64 hsfreq_millihz;
> >         unsigned int bpp;
> >         u32 txsetr;
> >         u32 clstptsetr;
> > @@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >          */
> >         bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> >         vclk_rate =3D clk_get_rate(dsi->vclk);
> > -       hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> > +       hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO=
 * 1ULL, dsi->lanes);
>
> The "* 1ULL" only makes the last factor unsigned long long.
> "vclk_rate * bpp" is still unsigned long, causing overflow on 32-bit.
> As there is no rounding variant of mul_u64_u32_div(), you probably
> want to use mul_u32_u32() instead.
>
Agreed, I will update it to,
`DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * KILO),
dsi->lanes);`

Cheers,
Prabhakar
