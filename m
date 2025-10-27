Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDAAC0D25D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 12:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4569C10E088;
	Mon, 27 Oct 2025 11:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2D610E088
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:30:13 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-87dfba1b278so47986486d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 04:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761564612; x=1762169412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HgNtIcnn6eENaUFz3K0ARDS/soEXQSArUyONWZnfjlQ=;
 b=IDrHnZXfhOQqag/gKJPABxCJgYpfjeZb4a4CdNLCxZXd/mbuR+lvKh4Kc+9nwswz6g
 UWfpR+9nUcm0TBGwleQqwaFR7cwezlyO6Yt+92y74GqB2Exbva6e6XOJTZc/WrDALrDP
 dKEtebIZY5uU5ZfwuzXwDXmkTP11bzufGykkVPYUB0LVQJwo8KdRZqYNxA0x14F011IC
 GUNLYo/TGVTtpvFiM0ndgdML1FyXugM9/M7Dx25pn7I/rBC7Y9yTWgAoRPZBif/nMcKn
 J135a43ESAegBb3hHCrPFbOMLVvw50nG8s5EevqNqFgNRsIscUX3s0gS21rVlVZ92TEm
 4n9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX8R9x/BYk7a3WYJQmSzkd2NdmzbblO2j88zIxUcKEeX2RyUsG+DeYGyPX5mHUDiQ5d+FyOQ3tBTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk5VHAJ9n2b3D6SqyMAO9yXBC6sqxtl7os5tybtjaPFxp4Pv7Z
 iHxGsRVlEvowK8sxcuAJLo9P7fIbfHKfiqB7wwx5dZzc1zQAPYe5E+MReXrV6UKw
X-Gm-Gg: ASbGncvhr8SbZd09jhiJlxF5tl8dhIkrW64P32/Hooa7FI7nLeVGtKloGKYap23hZjz
 KPQIxJVokSSnjYBUSUtbM3siZeec8N6hfUdu2JX0whCmva1j14/V/YJat0q2G/PgPdViiBJNGct
 chYn/bI0yIvj4BzDIkjz4UrPxuj7xGLSB41EZTQOkIy46y10tIGWlaPVyzmTU6bLOBoQkGYiP6Y
 i0STxq/NXOC5QioEJ9iOXcHoDypWQw3vgYVuks7BVFeJm5urknRY1ECBXa3rOImXokBr06Y6uZ4
 TA55PLnAu3VrwTPocaDqpLlA8f4oEvOIcc1w8i060XFcUAK7Gqfy4Zwf5LXXtXvmW+IShExOBxq
 knBOD+VwMsGqozDOSQgPgIykpf/AubWfddrrGIene+njhnIZVPTGtVP9RXdWPKXraLxgRe/ELE4
 x8IHA4KkjA/ivWiwH8YgBI6CA8VcI0vUCnb11bgkxmGw==
X-Google-Smtp-Source: AGHT+IHR8BBvawfoBc6Sgf9kFJyvQmHW8NWzoEjqtuoziqUqXgIfDJ+8bsr+4k6YxSk57tvhw7LSnA==
X-Received: by 2002:a05:6214:5006:b0:87c:2003:58e5 with SMTP id
 6a1803df08f44-87f9edb6897mr210978656d6.26.1761564612131; 
 Mon, 27 Oct 2025 04:30:12 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com.
 [209.85.222.173]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc49b649dsm54665126d6.53.2025.10.27.04.30.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:30:11 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-88f2b29b651so483331885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 04:30:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWDIs5pXuzl083vtMiXmRvKvdaSx1MDqYa+R4qNGpdYiVOX0/nfgtSZpBDviQLU1FdTSIdsrYQOQT8=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2921:b0:59d:458d:b629 with SMTP id
 ada2fe7eead31-5db2e58fe50mr3946640137.30.1761564193435; Mon, 27 Oct 2025
 04:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
 <20251021184502.GD19043@pendragon.ideasonboard.com>
In-Reply-To: <20251021184502.GD19043@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 12:23:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
X-Gm-Features: AWmQ_blPQXHDdcv3HEZmR70Xe3WDxqjStucPirJolGtaGc9WMslN79O8Z1NYVMM
Message-ID: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
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

On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven wrote:
> > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > This patch series adds DU/DSI clocks and provides support for the
> > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > >
> > > > v10->v11:
> > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > >   while iterating over the divider table
> > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > >
> > > I think this series is ready for merging.
> >
> > \o/
> >
> > > > Lad Prabhakar (7):
> > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and =
LCDC
> > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> > > >     RZ/V2N
> > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> > >
> > > As this touches both clk and drm, let's discuss the merge strategy.
> > > My proposal:
> > >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> > >      to be used as a base for the remaining patches,

Done:

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787=
:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/clk-renesas-rzv2h-plldsi-tag

for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd94:

  clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:03 +010=
0)

----------------------------------------------------------------
clk: renesas: rzv2h: Add support for DSI clocks

RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
driver source files.

----------------------------------------------------------------
Lad Prabhakar (3):
      clk: renesas: rzv2h: Add instance field to struct pll
      clk: renesas: rzv2h: Use GENMASK for PLL fields
      clk: renesas: rzv2h: Add support for DSI clocks

 drivers/clk/renesas/rzv2h-cpg.c | 512 ++++++++++++++++++++++++++++++++++++=
+++-
 drivers/clk/renesas/rzv2h-cpg.h |  26 +-
 include/linux/clk/renesas.h     | 145 ++++++++++++
 3 files changed, 672 insertions(+), 11 deletions(-)

> > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,

Done.

> > >   3. The DRM people queue patches 5-7 on top of 1.
> > >
> > > Does that sound fine for you?
> > Sounds good to me.
> >
> > Biju/Tomi, are you OK with the above?
>
> The plan seems good to me. Note that you won't be able to push this
> yourself to drm-misc as committers are limited to pushing linear
> branches. We need an ack from the drm-misc maintainers, and one of them
> will need to merge the branch (either branch 1. as prepared by Geert, on
> top of which you can them push patches 5-7 yourself, or a branch you'll
> prepare on top of 1. with patches 5-7).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
