Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10932A95FAE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B007110E299;
	Tue, 22 Apr 2025 07:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2651E10E299
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:41:25 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-525b44ec88aso2150630e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745307681; x=1745912481;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CchbbGjqvUvjIqESIBqdCzQiBA7qsjtrrzbifnEpKqk=;
 b=KmHg/erhmRh8bV2iiLUx4Absm7q4gHPORyiHCPkfdWiMtoQjUPXTcYjMIEcvSAWAiU
 L2veMjeTmKfZbTtutC8N2E+gGwrin7pVbejGlAFpzmRunBWp8aQTne1v34PI6oJUwb3H
 3xDQJnbaZgURRQJa/wkn+q3Fd8VVsI5VRIzrDafTANctlYi0ZjDMfJDeDEgzygYkCnAx
 nKIrNhtlvfg5LfKtGth1w1fRCqpeiHKm0U+KuAJhYFGNEPoFjE3fBmNggeAM0WFh3b4k
 7oudLqVPjX/UAqNSlySFrlFMxdIT4i+JUtfYBewCvJVYNdO66iJQF5+Nbc/DQZ3Kf0Vo
 MTnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeKpnqpZQIvAX5rlS/BvCThbVXdC5eehfqcxtX74DLY52l8JTezZvWRYW3cZostsLIhQ4NqDaoYDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw11PasU5/8Y06dkWzAGerVGedsHB0n39px3+baOXfEaRV9rSEB
 SNpsHQ+fAmLwZ0o3L2t8rkIHnpp6DtalAPq3njMf3RZhjvM080V8CAmUNyDx
X-Gm-Gg: ASbGncsnF0DRMQ8KbXG1wjOVAV4I3CuZhLhWREKJY8OMPXosdXnXMHHc/EQDjyvx7KA
 LCEa6iXPmminjz02BgoHZDf9Vd8l+s82jTWoLp5f20QRKyYMUHP2IBfCb3olla3b7yChLPstM7S
 Ijeahf/dE+Qt3jzyEhtmZWL14zqypuQYNhjlUPY3hbmph+oroQZA0TRBIqXWw67QkIUOeLCQ8fS
 r1YVUQxpbLITa+E3N61p6GBQOw88LTkPeIouXEWgEmWotcRH2xagaLjSqjkx1FJW5rYr5VugjAh
 5eWC7YTZJOmUD1LDerphI1YFid93Vl9e5B/QI1pYgSDSq9f2jknKOcwff0y1s/f5iYIPxpeGVhH
 T6Xw=
X-Google-Smtp-Source: AGHT+IFwfJL1GwSbUU9Bvw7f7/ReARosDESr7CuM4+3DoLij6NfI+djosT6xOneQqXSE+Hs1Bx30Xw==
X-Received: by 2002:a05:6122:46a8:b0:526:1dde:3613 with SMTP id
 71dfb90a1353d-52925232bc3mr9930150e0c.0.1745307681106; 
 Tue, 22 Apr 2025 00:41:21 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52922bec16asm1846264e0c.2.2025.04.22.00.41.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:41:20 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-86feb848764so1446489241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzkucXOjrD6gXbnuJnvSkw2XDmTC+l0B5UOLHgBwHnPgJ3aTNdrbfJz6CX/ryfvBB2D6WoyKAjFmM=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3235:b0:4bb:cdc0:5dd7 with SMTP id
 ada2fe7eead31-4cb801fcb0emr7598638137.16.1745307679790; Tue, 22 Apr 2025
 00:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250418184658.456398-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250418184658.456398-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 09:41:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWs7R9rtS7Ur6PP9e3m9ghkM1jc_Xn3QOWG4rvTtB2omA@mail.gmail.com>
X-Gm-Features: ATxdqUFBeCs2oJ7izTqYxFnW1BxjoUqkEqYOurERQsS1p8loeCSNnydQw8JebiM
Message-ID: <CAMuHMdWs7R9rtS7Ur6PP9e3m9ghkM1jc_Xn3QOWG4rvTtB2omA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
To: Prabhakar <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Fri, 18 Apr 2025 at 20:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> high accuracy.
>
> These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Replaced `unsigned long long` with `u64`
> - Replaced *_mhz with *_millihz` in functions

Thanks for the update!

> @@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>   */
>
>  static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> -                                   unsigned long hsfreq)
> +                                   u64 hsfreq_millihz)
>  {
> +       unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, KILO);

MILLI (everywhere)

It's a strange world where KILO == MILLI ;-)

    include/linux/units.h:#define KILO      1000UL
    include/linux/units.h-#define MILLI     1000UL

>         const struct rzg2l_mipi_dsi_timings *dphy_timings;
>         unsigned int i;
>         u32 dphyctrl0;
> @@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>                                   const struct drm_display_mode *mode)
>  {
>         unsigned long hsfreq, vclk_rate;
> +       u64 hsfreq_millihz;
>         unsigned int bpp;
>         u32 txsetr;
>         u32 clstptsetr;
> @@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>          */
>         bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>         vclk_rate = clk_get_rate(dsi->vclk);
> -       hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> +       hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);

The "* 1ULL" only makes the last factor unsigned long long.
"vclk_rate * bpp" is still unsigned long, causing overflow on 32-bit.
As there is no rounding variant of mul_u64_u32_div(), you probably
want to use mul_u32_u32() instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
