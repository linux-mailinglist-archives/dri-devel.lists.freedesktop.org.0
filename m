Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB89E8C93
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3A510E495;
	Mon,  9 Dec 2024 07:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5810E495
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:49:36 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-5187f6f7bcaso94970e0c.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 23:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733730572; x=1734335372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qk7zs9BOOihPQGUTMvGHn5Ym+4dxQx5CVpUjftA0HQQ=;
 b=DAdDjPbfNOVwkfuL/SaqlKsj/TPWmo3z1vrzy0s4R01smZv2KpRfL2tw/np4/IZ90N
 eDZUnaA1cbFe7vASJWQomvXhTMNPfQ75Z3G7QpbSwvYA8X8tR0NmS3JbOjs8uPXr3a/p
 d6vl0bqAoN7XSSY0cm/qBAvvjQSgVKpDMmjvdUpSBB6eAlAYWWjQhCSg4laMCSyvICux
 r/gEWYiCPK3840T/8qs4xwp3A8gcQXm3NA/ePE/rJo/z1tNVSuYruNCzgE5w0acR493x
 oOUbPxVV3CjmNV1SWARGiydtFeBPFfD5+4QnysD7onA6q0QLaeS/wQXMgsHffiqT8pVD
 sdPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9LSmXlbOm+Hewb/kDqKlFeVIhg5a1U1VyJXGlhR3UCzmQsCc7Td99GH1B3aNgCD+rmx3C05YcE5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9dTuPuR0Op4rcRjlVEz5f0vlSWp4eNgImyGzyyfFwmbNnceD5
 iK6XlwP1M7iyDJj89mPhr78BEKl9wiTlrEiKfGFrRN/b/xXSDQtfSIhtQW/3
X-Gm-Gg: ASbGncsAxUs9GaSzhlQk79Krm8WzUFZfpld64aNOC2lxK9oyiYVMyjayB2Tmdc3jcHb
 nhTOajI0J/c1bTtwBw3ifXesy/ZQVhUj7Y7aW38MK5RgptunbHUhlBe4oYUaEP4D2TTMwmXtf0n
 UYoRQojKJsVEwHTV8DFDua250bN4mGtS/AdAzfzEKYv4fR0qv7NndWUxRxcYkh0qg2tvI1m0+I1
 pl3wfJ3hfRHwB81v8g2kNFGqEl2wRZZovzo4kry80S7Ci8kx1J+CxJEx3j+uhE5VQqArtGxuCht
 YGbBTxw9Qz1yfv92
X-Google-Smtp-Source: AGHT+IHMJduTA6pNxQoWU4raj6kkLpZtllxI4AppJpgRgvI+fhvdYoGHPgNxeHnD63IR1Qyk2GSjBA==
X-Received: by 2002:a05:6102:160f:b0:4af:e99e:b41b with SMTP id
 ada2fe7eead31-4afe99ebd33mr3649949137.19.1733730571935; 
 Sun, 08 Dec 2024 23:49:31 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-85c2bcf3509sm1117678241.25.2024.12.08.23.49.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Dec 2024 23:49:30 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-5187cd9b8e5so122648e0c.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 23:49:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU3sfK9GHiuvSHXSBpHHwGVaAc6ceM+EiwTfZ0kykGQz1qNSiWbvnvJ4QSEI/+9VdV85bgl8+FiSUQ=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1152:b0:4af:e135:1ca9 with SMTP id
 ada2fe7eead31-4afe1356f47mr3950083137.13.1733730570269; Sun, 08 Dec 2024
 23:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com>
 <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
 <b0fffc87-a72e-4041-b3f6-7f2a4987916e@ideasonboard.com>
In-Reply-To: <b0fffc87-a72e-4041-b3f6-7f2a4987916e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 08:49:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmAbnbJ-UouN+dnodVg7+Lw47to-O4rTAcDanQ=NCGpg@mail.gmail.com>
Message-ID: <CAMuHMdUmAbnbJ-UouN+dnodVg7+Lw47to-O4rTAcDanQ=NCGpg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] clk: renesas: r8a779h0: Add display clocks
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

Hi Tomi,

On Mon, Dec 9, 2024 at 6:26=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 06/12/2024 15:43, Geert Uytterhoeven wrote:
> > On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add display related clocks for DU, DSI, FCPVD, and VSPD.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com=
>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> >> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-clk for v6.14.
> >
> >> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> >> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> >> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks=
[] __initconst =3D {
> >>          DEF_MOD("canfd0",       328,    R8A779H0_CLK_SASYNCPERD2),
> >>          DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
> >>          DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),
> >> +       DEF_MOD("dis0",         411,    R8A779H0_CLK_S0D3),
> >> +       DEF_MOD("dsitxlink0",   415,    R8A779H0_CLK_DSIREF),
> >> +       DEF_MOD("fcpvd0",       508,    R8A779H0_CLK_S0D3),
> >>          DEF_MOD("hscif0",       514,    R8A779H0_CLK_SASYNCPERD1),
> >>          DEF_MOD("hscif1",       515,    R8A779H0_CLK_SASYNCPERD1),
> >>          DEF_MOD("hscif2",       516,    R8A779H0_CLK_SASYNCPERD1),
> >> @@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks=
[] __initconst =3D {
> >>          DEF_MOD("vin15",        811,    R8A779H0_CLK_S0D4_VIO),
> >>          DEF_MOD("vin16",        812,    R8A779H0_CLK_S0D4_VIO),
> >>          DEF_MOD("vin17",        813,    R8A779H0_CLK_S0D4_VIO),
> >> +       DEF_MOD("vspd0",        830,    R8A779H0_CLK_S0D1_VIO),
> >>          DEF_MOD("wdt1:wdt0",    907,    R8A779H0_CLK_R),
> >>          DEF_MOD("cmt0",         910,    R8A779H0_CLK_R),
> >>          DEF_MOD("cmt1",         911,    R8A779H0_CLK_R),
> >
> > As mentioned by Laurent during his review on v1, all clock parents
> > should probably be some form of R8A779H0_CLK_S0Dx_VIO.
> > So I'm inclined to replace all of them by R8A779H0_CLK_VIOBUSD2 while
> > applying, which would match R-Car V4H.
>
> What do you mean with the above? First you say the clock parents should
> be some form of S0Dx_VIO, but then you say you'll use VIOBUSD2. Aren't
> those unrelated clocks, from different PLLs?

Oops, copy-'n-paste went wrong. I did mean R8A779H0_VIOBUSD*.

> > Are you OK with that?
>
> I'm fine with that. I can't really get much out of the docs wrt.
> clocking, and the clocks I used were from the BSP. Afaics, it looks
> similar to V4H, so it's probably best have the same clocks, as you sugges=
t.

Agreed.

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
