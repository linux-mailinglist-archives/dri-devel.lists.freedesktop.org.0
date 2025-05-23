Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C3AC263F
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 17:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC9210E819;
	Fri, 23 May 2025 15:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209F10E819
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 15:19:03 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-742c3d06de3so109600b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 08:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748013542; x=1748618342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KUlujxEaEdi/ZnXb2x/YmWYgGPLEJZ1h5LPkWsQToHU=;
 b=GocgFd/6yuTyhSqasUcz5y6L0FbfNcueRvIAhLbhibUb/ezQXopL+E06G70SbXFJ9l
 /OFQUJ/R03A3wNBLSqI01U4CWB0xRjWLclvjRjTtyyl75t625mrm9L47/NTMwZUjShsS
 +2BkUxpXAyOfzN1v/EIwGb/ZdhQq3bU7G2EdtZJ9joEP3yw4mio2q9aLyo3gcGpn0EUj
 p+SYWsARiHInQ+YPv1vNTVi/sC22qoWhRVjQVy/vBHxIhYI6Cu9URBvo6PRpmnGBZ3ye
 I7Of+flL7voyoIVJJUmFoyfD9sskJY7mM3GPuNRuxowI6wKi1N/1MpJXhlWtheeoujlc
 9ydA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDkQawHu2QsWubXj4fbH6h/6kD23TOUbjIBcmmjovh3o5TX7V1vz6+bcKLFUjl+sSmMvqWhj+4d0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpngQvnhh5XrL3Dv+UFOlYcbJHxdt8EwR197KhbGmFcayN7qHw
 BfGBrsn/UDdX34rmBrzstApk6GZR1fCYbMElTblfDrGuVN4iA2jsnR+KmRw+lzF4Q1E=
X-Gm-Gg: ASbGncu6KjbHVc/WoMfYtSXwy9upz0LHWDwK/ynSEKMWxCcGnj9kx7fScI2LXbeOOTE
 BBGqojDmYDRhjMtE1k9IuEczjrJxh9hs3xgQlPl6bP2lcyGdzXevP1nbdgEmRahItEBp792vASx
 9Ktkl3e1EOS9nJI65RK2EfzCxWZNXGAJ72SAZGFOqHEpsZuM9mwvAxm6NdqRlzInxdxrwBjvViG
 Zy4bUlUuXvxPcxOSkZQn43xIbagnp0pVvSTXaR2zQr8LKaqPb1PtR2N+Os4UFwn/rIu9uSXqCF7
 FtGinHU5jhrlclQGd+rOSwYOC6L3pHzWM3ozrXnpLdkiUH4uzTjbBU6pO8Z/N1cMTkvWiRKitsX
 HCJiDXamK3EOdtA==
X-Google-Smtp-Source: AGHT+IGvbGWNL+tzVx6RcR3OFqgd9d7Oe7djujNei6saNl2xSvvUeXRYSlbUED9mCsrXZFGQMQl6fg==
X-Received: by 2002:a05:620a:2545:b0:7ca:f04a:ab68 with SMTP id
 af79cd13be357-7cd47fd36f4mr3599804885a.58.1748013532035; 
 Fri, 23 May 2025 08:18:52 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd468bdfb9sm1193327285a.85.2025.05.23.08.18.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 08:18:50 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6f2b04a6169so102859686d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 08:18:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ9JvRDjR1NhYFMtTehel/S4dH5IZnK1e+ZUU4gryzbxUud1OW3fiKSnCQCZ03czIiUIevpHOQvxY=@lists.freedesktop.org
X-Received: by 2002:a05:6214:1308:b0:6f8:a7c6:22ca with SMTP id
 6a1803df08f44-6f8b2c5f2bbmr442981216d6.16.1748013530224; Fri, 23 May 2025
 08:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 17:18:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
X-Gm-Features: AX0GCFsg_XSn4r6_gauahCGD7VbDyx79Ezig6sAhQFHM9qfPwmiMO6CmvkImCB0
Message-ID: <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
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

Hi Prabhakar, Fabrizio,

On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DSI support for Renesas RZ/V2H(P) SoC.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corporation
>   */
>  #include <linux/clk.h>
> +#include <linux/clk/renesas-rzv2h-dsi.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -30,6 +31,9 @@
>
>  #define RZ_MIPI_DSI_FEATURE_16BPP      BIT(0)
>
> +#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA       (80 * MEGA)
> +#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA       (1500 * MEGA)

RZV2H_MIPI_DPHY_FOUT_M{IN,AX}_IN_MHZ?

> +
>  struct rzg2l_mipi_dsi;
>
>  struct rzg2l_mipi_dsi_hw_info {
> @@ -40,6 +44,7 @@ struct rzg2l_mipi_dsi_hw_info {
>                               u64 *hsfreq_millihz);
>         unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
>                                             unsigned long mode_freq);
> +       const struct rzv2h_pll_div_limits *cpg_dsi_limits;
>         u32 phy_reg_offset;
>         u32 link_reg_offset;
>         unsigned long max_dclk;
> @@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
>         u8 features;
>  };
>
> +struct rzv2h_dsi_mode_calc {
> +       unsigned long mode_freq;
> +       u64 mode_freq_hz;

Interesting... I guess mode_freq is not in Hz?

> +};
> +
>  struct rzg2l_mipi_dsi {
>         struct device *dev;
>         void __iomem *mmio;

> +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq)
> +{
> +       static const unsigned long hsfreq[] = {
> +               1953125UL,
> +               3906250UL,
> +               7812500UL,
> +               15625000UL,
> +       };
> +       static const u16 ulpsexit[] = {49, 98, 195, 391};
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(hsfreq); i++) {
> +               if (freq <= hsfreq[i])
> +                       break;
> +       }
> +
> +       if (i == ARRAY_SIZE(hsfreq))
> +               i -= 1;

i--

> +
> +       return ulpsexit[i];
> +}
> +
> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
> +{
> +       const struct rzv2h_mipi_dsi_timings *timings;
> +       u16 i;
> +
> +       timings = &rzv2h_dsi_timings_tables[index];
> +       for (i = 0; i < timings->len; i++) {
> +               unsigned long hsfreq = timings->hsfreq[i] * 10000000UL;

(I wanted to say "MEGA", but then I noticed the 7th zero ;-)

10 * MEGA?

> +
> +               if (freq <= hsfreq)
> +                       break;
> +       }
> +
> +       if (i == timings->len)
> +               i -= 1;

i--

> +
> +       return timings->start_index + i;
> +};
> +
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
>  {
>         iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
> @@ -308,6 +479,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>         return 0;
>  }
>
> +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
> +                                             unsigned long mode_freq)
> +{
> +       struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
> +       u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> +       struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> +       unsigned int bpp, i;
> +
> +       bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +
> +       for (i = 0; i < 10; i += 1) {
> +               unsigned long hsfreq;
> +               bool parameters_found;
> +
> +               mode_freq_hz = mode_freq * MILLI + i;

KILO?

And I guess you want to use mul_u32_u32(), as mode_freq_hz is u64?

> +               mode_freq_millihz = mode_freq_hz * MILLI * 1ULL;

Why * 1ULL?

> +               parameters_found = rzv2h_dsi_get_pll_parameters_values(dsi->info->cpg_dsi_limits,
> +                                                                      &cpg_dsi_parameters,
> +                                                                      mode_freq_millihz);
> +               if (!parameters_found)
> +                       continue;
> +
> +               hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.freq_millihz * bpp,
> +                                                      dsi->lanes);
> +               parameters_found = rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
> +                                                                      dsi_parameters,
> +                                                                      hsfreq_millihz);
> +               if (!parameters_found)
> +                       continue;
> +
> +               if (abs(dsi_parameters->error_millihz) >= 500)
> +                       continue;
> +
> +               hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
> +               if (hsfreq >= RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
> +                   hsfreq <= RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
> +                       dsi->mode_calc.mode_freq_hz = mode_freq_hz;
> +                       dsi->mode_calc.mode_freq = mode_freq;
> +                       return MODE_OK;
> +               }
> +       }
> +
> +       return MODE_CLOCK_RANGE;
> +}

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -40,6 +40,39 @@
>  #define DSIDPHYTIM3_THS_TRAIL(x)       ((x) << 8)
>  #define DSIDPHYTIM3_THS_ZERO(x)                ((x) << 0)
>
> +/* RZ/V2H DPHY Registers */
> +#define PLLENR                         0x000
> +#define PLLENR_PLLEN                   BIT(0)
> +
> +#define PHYRSTR                                0x004
> +#define PHYRSTR_PHYMRSTN               BIT(0)
> +
> +#define PLLCLKSET0R                    0x010
> +#define PLLCLKSET0R_PLL_S(x)           ((x) << 0)

 #define PLLCLKSET0R_PLL_S GENMASK(2, 0)

and after that you can use FIELD_PREP(PLLCLKSET0R_PLL_S, x) in the code.
More opportunities for masks below...

> +#define PLLCLKSET0R_PLL_P(x)           ((x) << 8)
> +#define PLLCLKSET0R_PLL_M(x)           ((x) << 16)
> +
> +#define PLLCLKSET1R                    0x014
> +#define PLLCLKSET1R_PLL_K(x)           ((x) << 0)
> +
> +#define PHYTCLKSETR                    0x020
> +#define PHYTCLKSETR_TCLKTRAILCTL(x)    ((x) << 0)
> +#define PHYTCLKSETR_TCLKPOSTCTL(x)     ((x) << 8)
> +#define PHYTCLKSETR_TCLKZEROCTL(x)     ((x) << 16)
> +#define PHYTCLKSETR_TCLKPRPRCTL(x)     ((x) << 24)
> +
> +#define PHYTHSSETR                     0x024
> +#define PHYTHSSETR_THSEXITCTL(x)       ((x) << 0)
> +#define PHYTHSSETR_THSTRAILCTL(x)      ((x) << 8)
> +#define PHYTHSSETR_THSZEROCTL(x)       ((x) << 16)
> +#define PHYTHSSETR_THSPRPRCTL(x)       ((x) << 24)
> +
> +#define PHYTLPXSETR                    0x028
> +#define PHYTLPXSETR_TLPXCTL(x)         ((x) << 0)
> +
> +#define PHYCR                          0x030
> +#define PHYCR_ULPSEXIT(x)              ((x) << 0)
> +
>  /* --------------------------------------------------------*/
>
>  /* Link Status Register */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
