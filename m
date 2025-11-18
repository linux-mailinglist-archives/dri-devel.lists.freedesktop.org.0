Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF08C690A3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D878A10E172;
	Tue, 18 Nov 2025 11:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OurahoAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F1910E172
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:21:40 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-429c48e05aeso3234132f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 03:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763464899; x=1764069699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4adjp1n4HMnqOgVZgrtwuRwqjyLZVjTGk78K7r+qec=;
 b=OurahoAqSCXQrJtxAXBws+CiSmmg3Tw7quHSjp27qSm5/LkfqkRYQdgyYYVf8Mt05M
 tVWwHzUXpLV9K3lgbIO1MBlkkgxGxRz0WPVexMqvqJ+AHAcLyEKK0Rk5uSVlzr2pJ5iv
 z1UObw2ozM3h1dlhQln2gwhzR9bu3NXpp2begw3+VB1Zr4LHOXw+SsH/Y1sqeNK0lGdq
 wRt0QgbWcVzpD4NG/Qt4sWm+DbH3rJaNGKXKkPjpFSVVtrAumPKXYVSKEBPutfbE6OLO
 q3BMah+Fo4d/1EVlW8o1h4pHWaL8iwAFS/9AFGnnIEtELLRtYYag19KBexcmK2PlcLnW
 tRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763464899; x=1764069699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N4adjp1n4HMnqOgVZgrtwuRwqjyLZVjTGk78K7r+qec=;
 b=gWf49SQn04k/kkl+lxL5laoEIu/6VbYn9/2sws6Gn0xX5wSMoTB4EJjpaPkiC6TiEz
 p+6SCYZWTEcKLCmGYfgfGrBm2TXNcteTZGyzNX+q8KFuO7G1UtT1TrM28xVETUz7GDtg
 A0EtGT5JyASyFfPCqKhqQ9a84LHDKX3643BES5c6sbrGv23i6Ij9LAjb5qCVKbQERJPl
 snQ7fRnwRy339NWxERMVh3IPmyGKwAC98LJJq++bGNeAAFAbk4XlpcfQQCT7G4jZQr1t
 TZ53qIXvXC/pNRMq3w00TarWDP1JJVe6kURsAANsA7+FbFC9DzF+6qS79fvqwOz+RrtL
 2Y7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcNQizqTRN1fU2qE8lFnyT3f74CMPQPb65SB26yg6QNpisvcvpGw26h8eDtozZayKNuQSIZq4kUzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxasp0d2GKrDcLCzTNWiNRjyNg6OJvhnVOtM/6t+JReuLh7dofc
 hzLCzU69MkUpEJ6Ud7JgPZd6ES72yc9BeA9bPDJHEo7drcckRnuStVkRuo6OnUA9uB0SrGkl5WN
 qdeMthYz5+jmE+1eoSsHovCP2fR5kZ9WemnCJ
X-Gm-Gg: ASbGncsYGqwaLush4HGMVwLdXLmB46LbkhNozI0KlonsqGldOLryOtDQRfEgMZmlt+9
 eMipzE4rKV8MvFfzIg7Wzm4Tutb/91VKbPCoAFXFM7F2GfsdbEm4heuxFgYupH6omOA4m6R8Hpy
 7P0W+GTJF5n9VA9UOv0AE21WJS08X8UT3+Fz/22Ido3IsqyNvbWwt79rm+ACFSzE0lHN6w3Jbh5
 ZwpuC2lNTTrc3RVXqsR+luEFBeeUZ/fyaQ/UlBzEbwFexFgxkAOhhGiSmUKKwIIEyoO/0xSrDhW
 t1W/8xXx8t8sj/ZVdHdZXfNlhsW+
X-Google-Smtp-Source: AGHT+IGANyPdqzYmfFEaFVGhyAXfuxeoDjl23RYIriV6FF/16VMTynZc4LvP1liBFBcOfFF1lFTyu84kN1+K1m6YB6o=
X-Received: by 2002:a05:6000:178f:b0:429:cc35:7032 with SMTP id
 ffacd0b85a97d-42ca8bd18c7mr2818838f8f.23.1763464898795; Tue, 18 Nov 2025
 03:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
 <20251021184502.GD19043@pendragon.ideasonboard.com>
 <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
In-Reply-To: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Nov 2025 11:21:12 +0000
X-Gm-Features: AWmQ_bl1DwIS-3Ab86i8VXMJ8kC7jPBYyZty6PEvVtZX5ppN0ByYyuYIgaFMugg
Message-ID: <CA+V-a8vLXg-whqwpE3pLF5JP3kK9on9Hu3iyLXEvrWbR9XmF5w@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

Hi Laurent/Tomi,

On Mon, Oct 27, 2025 at 11:23=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > > On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven wrote:
> > > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com=
> wrote:
> > > > > This patch series adds DU/DSI clocks and provides support for the
> > > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > > >
> > > > > v10->v11:
> > > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > > >   while iterating over the divider table
> > > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > > >
> > > > I think this series is ready for merging.
> > >
> > > \o/
> > >
> > > > > Lad Prabhakar (7):
> > > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI an=
d LCDC
> > > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) a=
nd
> > > > >     RZ/V2N
> > > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> > > >
> > > > As this touches both clk and drm, let's discuss the merge strategy.
> > > > My proposal:
> > > >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> > > >      to be used as a base for the remaining patches,
>
> Done:
>
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> tags/clk-renesas-rzv2h-plldsi-tag
>
> for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd94:
>
>   clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:03 +0=
100)
>
> ----------------------------------------------------------------
> clk: renesas: rzv2h: Add support for DSI clocks
>
> RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
> driver source files.
>
> ----------------------------------------------------------------
> Lad Prabhakar (3):
>       clk: renesas: rzv2h: Add instance field to struct pll
>       clk: renesas: rzv2h: Use GENMASK for PLL fields
>       clk: renesas: rzv2h: Add support for DSI clocks
>
>  drivers/clk/renesas/rzv2h-cpg.c | 512 ++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/clk/renesas/rzv2h-cpg.h |  26 +-
>  include/linux/clk/renesas.h     | 145 ++++++++++++
>  3 files changed, 672 insertions(+), 11 deletions(-)
>
> > > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
>
> Done.
>
Can you please pick up the DSI patches.

Cheers,
Prabhakar
