Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F17BFFD93
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA18510E0BB;
	Thu, 23 Oct 2025 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D8410E0BB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:20:54 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-557bf688086so49637e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761207653; x=1761812453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECYIxuT82Q/NafhPkuUWEytQEjZXJcXQfJX7HoJHHBY=;
 b=WoWpkWeg5UAiErmGOVy6OAZiScBhNaFnnxF2O7QQRQXBc2WeoOS9i9Km/GPGN5scZQ
 S9n8yixmjMnYcr8bD8LC/7X0r+ePcpbpGGk03ZrmYpJK2v/d/AkKeTwAZxpBosU5GEaq
 5EvueAswOFlGxS5N5zyaQlS3vDXFWsq1+UbRuWv7SCFQhj9UYiOdTUWX7qg91DyPy4+4
 C/S3X/jZ+fMvD5x3IwrxCn8Y08TN6oLQBwJ4cEtn4xnC6Sl4hpFHzmsT3RXzRCVnjWk7
 8vTczTi5KBUtZpC6XSx1RYTVwTnm/rvOIgB1dhEXeFYYGvG+w/j2f5ND772UkzehWJ9U
 kIfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz0/yNGq9AKXccwpRkKpVvoW27QYLuyKdDYGgTXjCYnSQpzIpADJ5INBggsQvkKTbwwzdut4qOmF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7BXgHNpLBvmEUgUatBBYQ8G8OKEiybF4VLp2zjl4MNZ1GaJj5
 rHla9LnqsiZZvddYqG7eVPr++0+dXsgSNgns5idZs/IUWmEZqrNPWMaSSQ8jq6sI
X-Gm-Gg: ASbGncvfX/WpRCliDg9B4TOm521JawAqeWl12TrkULPEyKOiInPYVNbEPkjQg7moaMr
 xLDI7GMhPxK/vjuCGj64OZ35ylGEP12SXH4PuXGIhBGeTxKO7VF0H05RQHp7RIpHtM81LNMfTCv
 IAoz0eqp1OsBPBwRTeepzZCJFxTQdGtyMxxIi4gUPaGkWGgjgf+FHnKrw1sEAMnjmlOV9wV5Gaf
 1Fc4yMGiDuA5KZPP2KOlrrKQfKs5UN+DYEXIyRh9Y81ZOsKwT+2fPjHfHKl2pTyJWLzvdNJpnUd
 Bg1j02fKUWeiqiGowwYOTJLWrC3jb0zL9UkAh5AfPOWE/w3/1IlWjg9qmN2/d+oyEG69O/7XAWZ
 XQq7oQmoM4Uo88IIt8bEPGPJHhox4/xuru0t6zD5hNKaQvuuBDeXTdKf9ujAxKY0dszoHickI8e
 35MELNCPYcB/94cXFBCgBnK4hUjilenWyZpFIz0g==
X-Google-Smtp-Source: AGHT+IHCZCbB7hm1rIDGgkPi+KAgJi6/H1KRyOE7X9cm75CQ1Rek7YvyH5V96qPqU6pSeMR44cYCbg==
X-Received: by 2002:a05:6122:178b:b0:54c:da0:f734 with SMTP id
 71dfb90a1353d-5564eca564bmr6387846e0c.0.1761207652941; 
 Thu, 23 Oct 2025 01:20:52 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-557bef1ae0asm523714e0c.23.2025.10.23.01.20.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:20:52 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-5d40e0106b6so278541137.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXVJKr79UXZ+8qhlVoU0oD1d5/aHtXjlcKXrouGbLmGlgHrV4F10Z5FfkC2bZtcTnyTE3FVj5ClRBM=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5110:b0:5db:27e9:933e with SMTP id
 ada2fe7eead31-5db27e9988cmr1196188137.38.1761207652096; Thu, 23 Oct 2025
 01:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
 <20251021184502.GD19043@pendragon.ideasonboard.com>
In-Reply-To: <20251021184502.GD19043@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 10:20:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUU-2ugmA-VcRuYOsriUKtAEQXmWEwJSwuCsSTa3ySTZg@mail.gmail.com>
X-Gm-Features: AS18NWACo5Ab6gaObSrlb5u0ift86EnuHySc5nm6Ey8p5bDoFaPy9DC0cq8vSBg
Message-ID: <CAMuHMdUU-2ugmA-VcRuYOsriUKtAEQXmWEwJSwuCsSTa3ySTZg@mail.gmail.com>
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

Hi Laurent,

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
> > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
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

Do you mean new commits must be in a single branch, or drm-misc
itself must be linear? In case of the former, 5-7 can be applied on top of
my immutable branch, without involving a merge?

> will need to merge the branch (either branch 1. as prepared by Geert, on
> top of which you can them push patches 5-7 yourself, or a branch you'll
> prepare on top of 1. with patches 5-7).

Note that another change to include/linux/clk/renesas.h,
and thus a dependency of drm on clk, is coming in
"[PATCH v3 0/2] Remove hard coded values for MIPI-DSI"
https://lore.kernel.org/20251022235903.1091453-1-chris.brandt@renesas.com

Would it be worthwhile to wait on/speed up review of the latter?
Thanks!

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
