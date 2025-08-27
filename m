Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA876B38027
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 12:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E4A10E7B4;
	Wed, 27 Aug 2025 10:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g152+6Z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDA910E7B4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:45:41 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3c6ae25978bso3389486f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756291540; x=1756896340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywFtIUPgkefEyFmx2NKt2azET6uVxnWh9aDDLWNj8mM=;
 b=g152+6Z/xf6NfE8R+fA3ddjJAjKlKYf4z1OkWCnBeUkBFMpj7RijGc9roqpOC2o2nn
 +xlIOP3VsWeakwOoza4JCKy0td7a1GliYBv4GRDdDpbaFJ5OajicR4ka4SFgO4OcwBrr
 hvU5L9y6ixv/IpyWmyXVfsst2GX8vWEF1Gb+hENpcCZuQZ4ChFrRW+BnlcKu5f8vQwJo
 B8/xJCXsDDGuomOktWKzkU0KDOh0XzSpQeCFuJAkl1BT1G48r9NTZ0Hqe70+PTzfcNcb
 1G6Gn0Z0R7ccRXTvg7bkmbOs9+tNyqCvCM+5pnD31E/QvQu1nWT0gee8ugUBBZhNSfOH
 Pvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756291540; x=1756896340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywFtIUPgkefEyFmx2NKt2azET6uVxnWh9aDDLWNj8mM=;
 b=bLSkAXqWpnAMdsNUx7Moktv6XPD5WN0jBH8lJQpQEMG5Z9P5jt3rM4wm8DSkmJ5y31
 HUtSjrrzNgoq7l9PwMAgPFBPFnux9rdDB8wv6krZp6wma4hDAzYxZB9lOTp9xJjeKeiy
 YhceEpnkDyr0dowGZXyP8e8onII1n5I5JJzvyZIY1atFyNw+6pYlEH+l0T5q2eGfjgAy
 yrX8WmKJzLrhZMd7X2T7wxMjOR1rsC2GHF4xW2ZvZ7324kPD7QwegmUQTJ64kPHqOsLk
 NZQoNKhzlars9vhFGhUd+jyWBDYIqyZ5wDUQ0zUtQRxNCFZsej5cFQM9bDKT9a3ETJnd
 Su5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaOGFJklJjNMF7zdtWBNU9p9gSz2TMb3rnmdQ0DUKT5r+bXocaz1dG+3BcOyMOFO6YdWgmN5MUVME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfWwBw2p/XjyL1kBvCqr0GBrjdTdK65xmrr+kx9kmvJ8Q4oGOl
 jRiiD36Giw9pRAKNLzP9EZDaMkJ5Zux9pH/8bFYfSLtwRTG8o9BTY80d+hGuauvWdnKNNkUHf5H
 1m8NkKl41dprNMO92jLOQynuoC78VWvc=
X-Gm-Gg: ASbGnctRfJnHKaiFPDQUyD9qNskXOEuKM5f6/aVcW/Anlb0Vo44y8bxbWqCuTjJwVe4
 nNzyyiUzI68yq+dIzPkB2HtxT4Xs1wsDGvgctTHYBYN33yq9smqHRrRCCStYcVUMux1xjMLVs9q
 pYviYgjhRfFFAtH938EIwzsM6MwIvphruCH811kM7faHwgjKjdUPkoBkMyQE7N0LHI42pc9MC09
 II8FSQNJLv2+caHBKA=
X-Google-Smtp-Source: AGHT+IHJqbTQlZxQrSzgsn7uAhDMaT3ieXLEx/3wOIxur6z+DYM0qqrydbeR13Y1wCHEumVIHPbjQZcDuzqpaIwgUiU=
X-Received: by 2002:a05:6000:2407:b0:3c8:9cfa:c178 with SMTP id
 ffacd0b85a97d-3c89cfac400mr11428571f8f.25.1756291539709; Wed, 27 Aug 2025
 03:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <1909286.atdPhlSkOF@senjougahara>
 <76B1EB6D-B149-43C2-AA56-A15C9DCCA3AF@gmail.com>
 <14287352.RDIVbhacDa@senjougahara>
In-Reply-To: <14287352.RDIVbhacDa@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 27 Aug 2025 13:45:28 +0300
X-Gm-Features: Ac12FXzDJMFwSyCznjWDvhfBWLuEGGUDton2Z3d8Y-Yt9F2wgfNpu5x2X_82XmI
Message-ID: <CAPVz0n0kCBAh7W0R766A_dXbcM3E=EoSXemuc0_rOm+Qch-a+Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and
 Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-staging@lists.linux.dev
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

=D1=81=D1=80, 27 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13:3=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrote:
> > 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07:09:45 G=
MT+03:00, Mikko Perttunen
> <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > >> CSUS clock is required to be enabled on camera device configuration =
or
> > >> else camera module refuses to initiate properly.
> > >>
> > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >> ---
> > >>
> > >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> > >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> > >>  2 files changed, 2 insertions(+)
> > >>
> > >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> > >> b/drivers/clk/tegra/clk-tegra20.c index 551ef0cf0c9a..42f8150c6110 1=
00644
> > >> --- a/drivers/clk/tegra/clk-tegra20.c
> > >> +++ b/drivers/clk/tegra/clk-tegra20.c
> > >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[=
] =3D {
> > >>
> > >>    { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > >>    { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > >>    { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> > >>
> > >> +  { TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
> > >>
> > >>    /* must be the last entry */
> > >>    { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> > >>
> > >>  };
> > >>
> > >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > >> b/drivers/clk/tegra/clk-tegra30.c index 82a8cb9545eb..70e85e2949e0 1=
00644
> > >> --- a/drivers/clk/tegra/clk-tegra30.c
> > >> +++ b/drivers/clk/tegra/clk-tegra30.c
> > >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[=
] =3D {
> > >>
> > >>    { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> > >>    { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > >>    { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > >>
> > >> +  { TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
> > >>
> > >>    /* must be the last entry */
> > >>    { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> > >>
> > >>  };
> > >
> > >I looked into what this clock does and it seems to be a gate for the C=
SUS
> > >pin, which provides an output clock for camera sensors (VI MCLK). Defa=
ult
> > >source seems to be PLLC_OUT1. It would be good to note that on the com=
mit
> > >message, as I can't find any documentation about the CSUS clock elsewh=
ere.
> > >
> > >What is the 6MHz rate based on?
> >
> > 6mhz is the statistic value which I was not able to alter while testing=
. I
> > have tried 12mhz and 24mhz too but it remained 6mhz, so I left it 6mhz.
> > >Since this seems to be a clock consumed by the sensor, it seems to me =
that
> > >rather than making it always on, we could point to it in the sensor's
> > >device tree entry.
> >
> > Sensor device tree uses vi_sensor as clocks source and sensor drivers d=
on't
> > support multiple linked clocks.
>
> AIUI vi_sensor is an internal clock so the sensor cannot be receiving it
> directly. Perhaps the sensor is actually connected to csus, and the reaso=
n we
> need to enable it is to allow the vi_sensor clock to pass through the csu=
s
> gate?
>
> That leaves the question of why the csus pad would be muxed to vi_sensor =
by
> default, but perhaps there's an explanation for that.
>

From downstream T30 sources csus and vi_sensor are always called in
pair (6MHz csus and 24MHz for vi_sensor), naturally I assumed that
latter is used as camera reference clock since most sensors has
reference clock around 24 MHz

> > >Cheers,
> > >Mikko
>
>
>
>
