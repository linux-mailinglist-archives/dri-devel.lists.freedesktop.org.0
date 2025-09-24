Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF7B99FB2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 15:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B569410E722;
	Wed, 24 Sep 2025 13:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A11510E722
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 13:11:32 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5997f407c85so1547427137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 06:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758719491; x=1759324291;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIlYzxGhD3l9eBjwM++AWTKEOipfMDPpBnbYVK8JQsQ=;
 b=hDwoJJRw/qTqX67dEoco3VJhaZ79EbolZxFIJ8WK91GkLLbrshQlAyJyGbe3nd/wp1
 bAYVX7AS8O6j0Zxm3iUihc3D692Q1PzdBuXPKnsflVA68Go/OOZA/1vJG2cVQbhSsp+g
 xtiFNuymbAaN1g4ZJdgmNZuCQ/Ni9CBwPJd3oGclZDFPSVT9IhrnREQEPKoLqupvjjqY
 VHtFCmoCsxW0Nc6Ei7TaBX9n3XjgfWyMBW3rmTkd6hF1Cqi8+beKhXkSSMd+2543UFo6
 ry+rTmSf/+OfphLB7GMuApCcwsQp3VM85F8WnINNEJ/gp1ZEEpuVowEQBErU9EWn/Sb7
 KAWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB2znrTmwNkOOoZJ0erL8duLzayW78I0Mg9qpXWvqf3hBfCmd/q9YpdoOhYAfW48tw45XQHGYQHoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNl/0hhPBQTlu7C47kPk0blwCDTqgplaJqjWmsCc7lI3zB7AzZ
 8/Ylrjxk50LsJMoQMkO9eaN5d4TjWVNGBaVj/2CqH6q8xALr0pI4sdnANSlLyq+4
X-Gm-Gg: ASbGncv8NJx1E1FAaczjr4B/oqbusebaNL4/atqBnL8ihR/SyKIfQc+qUrQb2pDi8tL
 vGa6/0Jr+4dPH/RLiosCHFkflJABdWWgtOcggS+dcwIhU/0xWco0/CkqgUlGQ2caiRtwg8YiX9p
 tCA9+rC+DlTXNHB5zuWXfh1X1vUmngSeNU/x2EPsjWB0753F1U8Q1HoogJbo2l9M4FLrJq7T+/V
 h5psuUhhYbJPONWo1gvLt86XlSpcQr8/j04JvUi6rgavcqm2A/3bNVaPFJYwYvNKzN/CjNR0Zcv
 7mXGAKs675QzZSijl9M+DuveHOQlf0Pshdn+uj/LIkK1Asa8gUCrFB8jCkOk1tFc1xmLK+Zg1nB
 cIdGkLrQS/A8XeqDJsZjbBbdUsUz9YiTQ/X0ErJC+usQjmYmvwFQvh6dyRnXz
X-Google-Smtp-Source: AGHT+IGT/d6VjhOBVGGrj/yPo0b8uTeXCzidNGo3/9Wch11/qg5PJjOXcH2QvvoP4vuqIuBXScnHDA==
X-Received: by 2002:a05:6102:548b:b0:4de:d08f:6727 with SMTP id
 ada2fe7eead31-5a575a9cb29mr2305358137.13.1758719490781; 
 Wed, 24 Sep 2025 06:11:30 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8e3e58e736csm3008294241.1.2025.09.24.06.11.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 06:11:30 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-580e7811ae2so945450137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 06:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUoS92cYPkbPviEUxJ5vrYFZ3wiyJZG1znkc7CkEnWUOmzPM1swPKjSk819VKgo5312nGQWk/wJoDo=@lists.freedesktop.org
X-Received: by 2002:a05:6102:4426:b0:5a1:17e3:ea9d with SMTP id
 ada2fe7eead31-5a578c96363mr2082608137.25.1758719489139; Wed, 24 Sep 2025
 06:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250903161718.180488-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:11:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUT2Nv9cEw1VsSeRQfNsK7-CxWqDN+S=Txkv6DXMDdCOQ@mail.gmail.com>
X-Gm-Features: AS18NWB3LiRE7h2GD3dAO4aR_IhRpZe13Ufoocoh6CaSUdYv9A8x5d9icvSRroc
Message-ID: <CAMuHMdUT2Nv9cEw1VsSeRQfNsK7-CxWqDN+S=Txkv6DXMDdCOQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
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

On Wed, 3 Sept 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add MIPI DSI support for the Renesas RZ/V2H(P) SoC. Compared to the
> RZ/G2L family, the RZ/V2H(P) requires dedicated D-PHY PLL programming,
> different clock configuration, and additional timing parameter handling.
> The driver introduces lookup tables and helpers for D-PHY timings
> (TCLK*, THS*, TLPX, and ULPS exit) as specified in the RZ/V2H(P) hardware
> manual. ULPS exit timing depends on the LPCLK rate and is now handled
> explicitly.
>
> The implementation also adds support for 16 bpp RGB format, updates the
> clock setup path to use the RZ/V2H PLL divider limits, and provides new
> .dphy_init, .dphy_conf_clks, and .dphy_startup_late_init callbacks to
> match the RZ/V2H sequence.
>
> With these changes, the RZ/V2H(P) can operate the MIPI DSI interface in
> compliance with its hardware specification while retaining support for
> existing RZ/G2L platforms.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

> +/**
> + * rzv2h_dphy_find_timings_val - Find timing parameter value from lookup tables
> + * @freq: Input frequency in Hz
> + * @index: Index to select timing parameter table (see enum rzv2h_dsi_timing_idx)
> + *
> + * Selects the timing table for the requested parameter, finds the
> + * frequency range entry and returns the register value to program:
> + *
> + *   register_value = timings->base_value + table_index
> + *
> + * Note: frequency table entries are stored as small integers (units of 10):
> + *       threshold_in_hz = (unsigned long)table_entry * 10 * MEGA
> + *
> + * Return: timing register value to be programmed into hardware
> + */
> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
> +{
> +       const struct rzv2h_mipi_dsi_timings *timings;
> +       u16 i;
> +
> +       /* Get the timing table structure for the requested parameter */
> +       timings = &rzv2h_dsi_timings_tables[index];
> +
> +       /*
> +        * Search through frequency table to find appropriate range
> +        * timings->hsfreq[i] contains frequency values from HW manual
> +        * Convert to Hz by multiplying by 10 * MEGA.
> +        */
> +       for (i = 0; i < timings->len; i++) {
> +               unsigned long hsfreq = timings->hsfreq[i] * 10 * MEGA;
> +
> +               if (freq <= hsfreq)
> +                       break;
> +       }
> +
> +       /* If frequency exceeds table range, use the last entry */
> +       if (i == timings->len)
> +               i--;
> +
> +       /*
> +        * Calculate final register value:
> +        * - timings->base_value: base value for this timing parameter
> +        * - i: index into frequency table (0-based)
> +        * Combined they give the exact register value to program
> +        */
> +       return timings->base_value + i;
> +};

Unneeded semicolon.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
