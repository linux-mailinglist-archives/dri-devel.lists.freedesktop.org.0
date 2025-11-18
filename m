Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C585C69313
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3369D10E484;
	Tue, 18 Nov 2025 11:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S17d8gnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1739710E0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:50:48 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42b3720e58eso4988823f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 03:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763466646; x=1764071446; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dvlVzeTZOL3SeM1Ld6pZdy3YbDlbCykL8GrXDIYLsA=;
 b=S17d8gnEXW53rGNcXbbpEGFNbb3VdgBT0aWvdTjbfwLnLoCoXuW0PjNarpaH76bBPN
 18ycKKMnnGYFK7b1G2/oV7RpO+vLi6j8Q8OPd5qeyoxCA1KWp3GLk7iXI3bBlxhaBvQm
 GYJOW77qoN3XA5KEpyqYDheTf2CQdXMzPtoQbtGHWjnwhMleHXa6Tj0lDb17/2aE0Ph/
 kXPTUSSRx5+jsxBQBtHNL3N/wwEKlb91cp2iADTliABvgFJNsZGdSxKMZcR4QZ+aDcxp
 AoORtIKiReertdRD0tS65l/l5oCKFcuaVXsAsrV9gOGufGOxcs2jtU0ECW6bdJa9bbUh
 6Jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763466646; x=1764071446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3dvlVzeTZOL3SeM1Ld6pZdy3YbDlbCykL8GrXDIYLsA=;
 b=TKRy7zmMVxfueYG78oWwcq3yWQ0zeeBbf7vMd5iEg25LOJc1Xskqwv0Uj92krugUPN
 ngcpFcp1NFIfGLfYR6ujc0TXh/5xfzoepLunvTfMiXD4U4fMqcX04K9gAgKUPgHMhTM7
 +so6MCwXXM76d+rPKC0F9c4WfNuid20629YUAIV+hhkQ0mSWhX23zbEkeM4MxjXUCegj
 h486DCS+YS12aujqtoclf/5KLQdHEFXpagUlYwcesSM6JT7guo/GPLQn9lMrRYe/axej
 jkWZAZDbrEKodvEfv5Mz/MdVfo09xTXC8PgFbNqjZhi7Ha1HgxwyQgpTRMzcUb8ScZ/m
 VMQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV79iZZEJrc2M+5PHgLXRKqA0MqZrAqsz9dF6o1tK0vsfNtOlDTX7VTibb8EbaXFLhSevpG5sxApS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUi0U1ab47ylw1yywLWHW7cIQLX1cE4fpC3fK/o0hfcrLZKSs7
 y5xOlhZgsXSQs+UFFokqj1UZ0oq9ssU0HiKc6xXYcrtiq4jR1z2bNo9U0XseqffVamFrr8VGcSh
 qOU2OPGxVZYKWUwkD//o0DtLdzSX5pSo=
X-Gm-Gg: ASbGnctxLo6DdQV3+Wt66KuTWlu9XyqdYt7r8XS40zs9FPA3yV776E74U1ocGHDlJ+F
 wDWCTx0KrwyktVoX7zaAMpvrtkUSD5COc8EWn5agqFsizRqZIaL/TQ6MiODqjofazg5exd6NY6E
 ZUap20/ux2u6W8IHJnYrHi0gMI+Eak1Si3L3/39MT5briQdWxikHmYD6kZD/t6Goaur1wWe5i2a
 enksnU2gBdpZqvxUHTHd3mK3tsSuabtsHU28l7RBpJkp3qq66wqrlE157UMAFWWjBqyjo22k3Jf
 RDuPgFG7kpX/GgOl6CDuMYXpli4t
X-Google-Smtp-Source: AGHT+IEBEKeO2bU9AocfEk+Htq/TSXCk60FbpZ0ZYLaYz3dvQxmRCANeaq3rrPQuzWW4G28xtGF7ejVCsUjv5/CqkFA=
X-Received: by 2002:a05:6000:2405:b0:428:4004:8241 with SMTP id
 ffacd0b85a97d-42b59382195mr15731333f8f.40.1763466646273; Tue, 18 Nov 2025
 03:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
 <20251021184502.GD19043@pendragon.ideasonboard.com>
 <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
 <CA+V-a8vLXg-whqwpE3pLF5JP3kK9on9Hu3iyLXEvrWbR9XmF5w@mail.gmail.com>
 <20251118113434.GA22495@pendragon.ideasonboard.com>
In-Reply-To: <20251118113434.GA22495@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Nov 2025 11:50:20 +0000
X-Gm-Features: AWmQ_bmJ-5wRZxj7MbmQMhRNDbiK7VXawO483M5C_HjqRzY3YZWOZRnXXVy1Z6s
Message-ID: <CA+V-a8uz2Y2qNtHvGSzkoj2bJPQkuUKSxffqx9=Rwr88LZXM6g@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
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

Hi Laurent,

On Tue, Nov 18, 2025 at 11:34=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 18, 2025 at 11:21:12AM +0000, Lad, Prabhakar wrote:
> > On Mon, Oct 27, 2025 at 11:23=E2=80=AFAM Geert Uytterhoeven wrote:
> > > On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart wrote:
> > > > On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > > > > On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven wrote=
:
> > > > > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > > > > > > This patch series adds DU/DSI clocks and provides support for=
 the
> > > > > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > > > > >
> > > > > > > v10->v11:
> > > > > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patc=
h
> > > > > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > > > > >   while iterating over the divider table
> > > > > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > > > > >
> > > > > > I think this series is ready for merging.
> > > > >
> > > > > \o/
> > > > >
> > > > > > > Lad Prabhakar (7):
> > > > > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > > > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > > > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > > > > >   clk: renesas: r9a09g057: Add clock and reset entries for DS=
I and LCDC
> > > > > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(=
P) and
> > > > > > >     RZ/V2N
> > > > > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > > > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) So=
C
> > > > > >
> > > > > > As this touches both clk and drm, let's discuss the merge strat=
egy.
> > > > > > My proposal:
> > > > > >   1. I queue patches 1-3 in an immutable branch with a signed t=
ag,
> > > > > >      to be used as a base for the remaining patches,
> > >
> > > Done:
> > >
> > > The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1d=
f56787:
> > >
> > >   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers=
.git
> > > tags/clk-renesas-rzv2h-plldsi-tag
> > >
> > > for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd=
94:
> > >
> > >   clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:0=
3 +0100)
> > >
> > > ----------------------------------------------------------------
> > > clk: renesas: rzv2h: Add support for DSI clocks
> > >
> > > RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
> > > driver source files.
> > >
> > > ----------------------------------------------------------------
> > > Lad Prabhakar (3):
> > >       clk: renesas: rzv2h: Add instance field to struct pll
> > >       clk: renesas: rzv2h: Use GENMASK for PLL fields
> > >       clk: renesas: rzv2h: Add support for DSI clocks
> > >
> > >  drivers/clk/renesas/rzv2h-cpg.c | 512 ++++++++++++++++++++++++++++++=
+++++++++-
> > >  drivers/clk/renesas/rzv2h-cpg.h |  26 +-
> > >  include/linux/clk/renesas.h     | 145 ++++++++++++
> > >  3 files changed, 672 insertions(+), 11 deletions(-)
> > >
> > > > > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
> > >
> > > Done.
> >
> > Can you please pick up the DSI patches.
>
> We can't, this has to be done by a drm-misc maintainer as it involves
> merging a non-fast forward branch instead of pushing commit directly on
> top of drm-misc-next.
>
I see, thank you. Talking to Geert we are closed for v6.19 as the
SoC+board changes have not made into v6.19. Probably we can wait for
the next cycle and Biju should be able to pick them up.

Cheers,
Prabhakar
