Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06833B382A0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 14:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A41010E812;
	Wed, 27 Aug 2025 12:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kv4uTorK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878A110E812
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:41:30 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6188b72b7caso8906098a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756298489; x=1756903289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMmM0u08wwwsS70h/c9rFw/WvMY6gf51mO+EfZq2OB4=;
 b=kv4uTorK+zNSHJXPFPuohLk/hKV0y8aGyVYTTfK+8pw25SpjDk0EvU5bJbJkeELB8W
 ihkbz+aVdVOsLl2989I+oUc2Dk9FZrQKMF3rkJbv3omTR8fZaHHwZ+rdiHP/C7zWyNGJ
 /YZ3DWMUi8n0hKzPfWx9bbrGC+AKHYQ/KpQruqELbYaDviJ0hc/v66bhYL9JFioD7mBc
 icIz/sbRdCW02Z5I4RGhXh6xFDfzhRYHvmCc4zDxdmeQelbsXy7c2we/7am3H3Zj5enU
 W/LPWLbRqhgMhYfa/9fAtMPItk7lvx2Zc9pQo+9fWPNdDc9Ed00sSFNqPXiZ+aJDQpGV
 AMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756298489; x=1756903289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eMmM0u08wwwsS70h/c9rFw/WvMY6gf51mO+EfZq2OB4=;
 b=vN/7FhAh6xWnSI4+xHv8j4gHy87e2oDmwg8kA11DuxZf/UuJgxjZd5gN81wgQvCFPe
 evvcgHwfDs8OXuY6i3xZs81kTsU1kbDjuq8kEqkEVQfHVlyCemE02/qxBQ2DDirXkV5r
 JBoHeqb5G25op9McQ3ABtZLsDw0rOWEpTCk52AjHOmT4A6CGap2fgJsRnD10CjLYdjWB
 MKinJI6G7pDcinCYRsjOrYEwpxYxxA2jAPCio9oCyr0Z9eIRZ/wQ5bOWPZgi1l3AyABx
 BdfvwkMKrPZWUNYExjj9nPU+gm+pS9kRWb5N7CE9QLxVwpsmDN8ADCIDuW3JrTVPtiPs
 lezA==
X-Gm-Message-State: AOJu0Yzm+zEvDIz3VVRa1bwU0pAT4vnugjM9n7/0E21uJoxag6fKU50B
 rCi9pGZhLNLQIRzuepI1fveX7i7qGOIE225zp3Ji7fujCjeItpy4vOKbkhR1f+9tAzerqD+y7/a
 V/Zu1uGyx+CfS1op8rb2hwtSE+LBm030=
X-Gm-Gg: ASbGncu0mn9Iw47aXcIED5K7TZ4Jco23DzbbZDeReAkcGzhUlxZ3r8J/JODi6++CMGC
 4dpyeLLN7gmCYQ1GXRzcGwlyEDNflGD/NjXVa/vBK+7/VqxuWtdjzTq8IxLdmP++3d+0nUrd4Ya
 kVNsB0XAgAqELMjDZCBSFZ2F31lpnWqaf1DvsvzmVk8mQol2bLpwgdGD+k3dPJ8I02vXelg3oQS
 JOZ5NU3lPZf6XXpUd8=
X-Google-Smtp-Source: AGHT+IGAEM5j3YGCjXIQuGckrO2T8lMGWacAUaSsDuQNxM+xoz+WZ7QKrSAI9z3U+JQuGCLeWnzZu3sl0gYiGY8EcQM=
X-Received: by 2002:a05:6402:40c3:b0:61c:7743:7f9a with SMTP id
 4fb4d7f45d1cf-61c7743853emr6957109a12.28.1756298488818; Wed, 27 Aug 2025
 05:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <7284cad0-b71b-49dc-bb09-cd9f1ff00028@ideasonboard.com>
In-Reply-To: <7284cad0-b71b-49dc-bb09-cd9f1ff00028@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Aug 2025 13:41:01 +0100
X-Gm-Features: Ac12FXyDkkuzQztuz4_kFDFT2wtV1C7V7elochaTfQIrqWyA90yeg-B8c4pt0vU
Message-ID: <CA+V-a8spWss_aM-NwbeidYKJBugWvTyZoOtaLGRGeq_v1Sr4TA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>
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

Thank you for the review.

On Thu, Aug 21, 2025 at 10:28=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> Hi,
>
> On 28/07/2025 23:14, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DSI support for Renesas RZ/V2H(P) SoC.
>
> I think a bit longer desc would be in order, as this is not just a "add
> a new compatible string" patch, but we have new registers and functions.
>
Sure, I'll elaborate on the commit message.

> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v6->v7:
> > - Used the new apis for calculating the PLLDSI
> >   parameters in the DSI driver.
> >
> > v5->v6:
> > - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
> >   PHYTCLKSETR_* and PHYTHSSETR_* macros.
> > - Replaced 10000000UL with 10 * MEGA
> > - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
> > - Replaced `i -=3D 1;` with `i--;`
> > - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
> >   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
> >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
> >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
> >
> > v4->v5:
> > - No changes
> >
> > v3->v4
> > - In rzv2h_dphy_find_ulpsexit() made the array static const.
> >
> > v2->v3:
> > - Simplifed V2H DSI timings array to save space
> > - Switched to use fsleep() instead of udelay()
> >
> > v1->v2:
> > - Dropped unused macros
> > - Added missing LPCLK flag to rzv2h info
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++++
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
> >  2 files changed, 379 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index 893a90c7a886..3b2f77665309 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/clk/renesas-rzv2h-cpg-pll.h>
> >  #include <linux/delay.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/io.h>
> > @@ -46,6 +47,11 @@ struct rzg2l_mipi_dsi_hw_info {
> >                             u64 *hsfreq_millihz);
> >       unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
> >                                           unsigned long mode_freq);
> > +     struct {
> > +             const struct rzv2h_pll_limits **limits;
> > +             const u8 *table;
> > +             const u8 table_size;
> > +     } cpg_plldsi;
> >       u32 phy_reg_offset;
> >       u32 link_reg_offset;
> >       unsigned long min_dclk;
> > @@ -53,6 +59,11 @@ struct rzg2l_mipi_dsi_hw_info {
> >       u8 features;
> >  };
> >
> > +struct rzv2h_dsi_mode_calc {
> > +     unsigned long mode_freq_khz;
> > +     struct rzv2h_pll_pars dsi_parameters;
> > +};
> > +
> >  struct rzg2l_mipi_dsi {
> >       struct device *dev;
> >       void __iomem *mmio;
> > @@ -75,11 +86,22 @@ struct rzg2l_mipi_dsi {
> >       unsigned int lanes;
> >       unsigned long mode_flags;
> >
> > +     struct rzv2h_dsi_mode_calc mode_calc;
> > +
> >       /* DCS buffer pointers when using external memory. */
> >       dma_addr_t dcs_buf_phys;
> >       u8 *dcs_buf_virt;
> >  };
> >
> > +static const struct rzv2h_pll_limits rzv2h_plldsi_div_limits =3D {
> > +     .fout =3D { .min =3D 80 * MEGA, .max =3D 1500 * MEGA },
> > +     .fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA },
> > +     .m =3D { .min =3D 64, .max =3D 1023 },
> > +     .p =3D { .min =3D 1, .max =3D 4 },
> > +     .s =3D { .min =3D 0, .max =3D 5 },
> > +     .k =3D { .min =3D -32768, .max =3D 32767 },
> > +};
> > +
> >  static inline struct rzg2l_mipi_dsi *
> >  bridge_to_rzg2l_mipi_dsi(struct drm_bridge *bridge)
> >  {
> > @@ -194,6 +216,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_=
mipi_dsi_global_timings[] =3D {
> >       },
> >  };
> >
> > +struct rzv2h_mipi_dsi_timings {
> > +     const u8 *hsfreq;
> > +     u8 len;
> > +     u8 start_index;
> > +};
> > +
> > +enum {
> > +     TCLKPRPRCTL,
> > +     TCLKZEROCTL,
> > +     TCLKPOSTCTL,
> > +     TCLKTRAILCTL,
> > +     THSPRPRCTL,
> > +     THSZEROCTL,
> > +     THSTRAILCTL,
> > +     TLPXCTL,
> > +     THSEXITCTL,
> > +};
> > +
> > +static const u8 tclkprprctl[] =3D {
> > +     15, 26, 37, 47, 58, 69, 79, 90, 101, 111, 122, 133, 143, 150,
> > +};
> > +
> > +static const u8 tclkzeroctl[] =3D {
> > +     9, 11, 13, 15, 18, 21, 23, 24, 25, 27, 29, 31, 34, 36, 38,
> > +     41, 43, 45, 47, 50, 52, 54, 57, 59, 61, 63, 66, 68, 70, 73,
> > +     75, 77, 79, 82, 84, 86, 89, 91, 93, 95, 98, 100, 102, 105,
> > +     107, 109, 111, 114, 116, 118, 121, 123, 125, 127, 130, 132,
> > +     134, 137, 139, 141, 143, 146, 148, 150,
> > +};
> > +
> > +static const u8 tclkpostctl[] =3D {
> > +     8, 21, 34, 48, 61, 74, 88, 101, 114, 128, 141, 150,
> > +};
> > +
> > +static const u8 tclktrailctl[] =3D {
> > +     14, 25, 37, 48, 59, 71, 82, 94, 105, 117, 128, 139, 150,
> > +};
> > +
> > +static const u8 thsprprctl[] =3D {
> > +     11, 19, 29, 40, 50, 61, 72, 82, 93, 103, 114, 125, 135, 146, 150,
> > +};
> > +
> > +static const u8 thszeroctl[] =3D {
> > +     18, 24, 29, 35, 40, 46, 51, 57, 62, 68, 73, 79, 84, 90,
> > +     95, 101, 106, 112, 117, 123, 128, 134, 139, 145, 150,
> > +};
> > +
> > +static const u8 thstrailctl[] =3D {
> > +     10, 21, 32, 42, 53, 64, 75, 85, 96, 107, 118, 128, 139, 150,
> > +};
> > +
> > +static const u8 tlpxctl[] =3D {
> > +     13, 26, 39, 53, 66, 79, 93, 106, 119, 133, 146, 150,
> > +};
> > +
> > +static const u8 thsexitctl[] =3D {
> > +     15, 23, 31, 39, 47, 55, 63, 71, 79, 87,
> > +     95, 103, 111, 119, 127, 135, 143, 150,
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings rzv2h_dsi_timings_tables[] =
=3D {
> > +     [TCLKPRPRCTL] =3D {
> > +             .hsfreq =3D tclkprprctl,
> > +             .len =3D ARRAY_SIZE(tclkprprctl),
> > +             .start_index =3D 0,
> > +     },
> > +     [TCLKZEROCTL] =3D {
> > +             .hsfreq =3D tclkzeroctl,
> > +             .len =3D ARRAY_SIZE(tclkzeroctl),
> > +             .start_index =3D 2,
> > +     },
> > +     [TCLKPOSTCTL] =3D {
> > +             .hsfreq =3D tclkpostctl,
> > +             .len =3D ARRAY_SIZE(tclkpostctl),
> > +             .start_index =3D 6,
> > +     },
> > +     [TCLKTRAILCTL] =3D {
> > +             .hsfreq =3D tclktrailctl,
> > +             .len =3D ARRAY_SIZE(tclktrailctl),
> > +             .start_index =3D 1,
> > +     },
> > +     [THSPRPRCTL] =3D {
> > +             .hsfreq =3D thsprprctl,
> > +             .len =3D ARRAY_SIZE(thsprprctl),
> > +             .start_index =3D 0,
> > +     },
> > +     [THSZEROCTL] =3D {
> > +             .hsfreq =3D thszeroctl,
> > +             .len =3D ARRAY_SIZE(thszeroctl),
> > +             .start_index =3D 0,
> > +     },
> > +     [THSTRAILCTL] =3D {
> > +             .hsfreq =3D thstrailctl,
> > +             .len =3D ARRAY_SIZE(thstrailctl),
> > +             .start_index =3D 3,
> > +     },
> > +     [TLPXCTL] =3D {
> > +             .hsfreq =3D tlpxctl,
> > +             .len =3D ARRAY_SIZE(tlpxctl),
> > +             .start_index =3D 0,
> > +     },
> > +     [THSEXITCTL] =3D {
> > +             .hsfreq =3D thsexitctl,
> > +             .len =3D ARRAY_SIZE(thsexitctl),
> > +             .start_index =3D 1,
> > +     },
> > +};
> > +
> > +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq)
> > +{
> > +     static const unsigned long hsfreq[] =3D {
> > +             1953125UL,
> > +             3906250UL,
> > +             7812500UL,
> > +             15625000UL,
> > +     };
> > +     static const u16 ulpsexit[] =3D {49, 98, 195, 391};
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(hsfreq); i++) {
> > +             if (freq <=3D hsfreq[i])
> > +                     break;
> > +     }
> > +
> > +     if (i =3D=3D ARRAY_SIZE(hsfreq))
> > +             i--;
> > +
> > +     return ulpsexit[i];
> > +}
> > +
> > +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
> > +{
> > +     const struct rzv2h_mipi_dsi_timings *timings;
> > +     u16 i;
> > +
> > +     timings =3D &rzv2h_dsi_timings_tables[index];
> > +     for (i =3D 0; i < timings->len; i++) {
> > +             unsigned long hsfreq =3D timings->hsfreq[i] * 10 * MEGA;
> > +
> > +             if (freq <=3D hsfreq)
> > +                     break;
> > +     }
> > +
> > +     if (i =3D=3D timings->len)
> > +             i--;
> > +
> > +     return timings->start_index + i;
> > +};
>
> I have to say I really don't like this... In the minimum, the method how
> this works has to be explained in a comment. These values can't really
> be calculated? If we really have to deal with hardcoded values and with
> that table from the docs, I would say that just replicate the table in
> the driver (i.e. a struct that represents one row of the table), instead
> of the method in this driver.
>
> Or was this method added based on earlier feedback, for v3? I see
> "Simplifed V2H DSI timings array to save space" in the change log. If
> so, at least document it clearly.
>
As mentioned in the previous thread, we will have to live with the
lookup tables. I'll add some comments for it.

> > +
> >  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 r=
eg, u32 data)
> >  {
> >       iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
> > @@ -318,6 +489,150 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi=
_dsi *dsi, unsigned long mode_f
> >       return 0;
> >  }
> >
> > +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *d=
si,
> > +                                           unsigned long mode_freq)
> > +{
> > +     u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> > +     struct rzv2h_pll_div_pars cpg_dsi_parameters;
> > +     struct rzv2h_pll_pars dsi_parameters;
> > +     bool parameters_found;
> > +     unsigned int bpp;
> > +
> > +     bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +     mode_freq_hz =3D mul_u32_u32(mode_freq, KILO);
> > +     mode_freq_millihz =3D mode_freq_hz * MILLI;
> > +     parameters_found =3D
> > +             rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
> > +                                     &cpg_dsi_parameters,
> > +                                     dsi->info->cpg_plldsi.table,
> > +                                     dsi->info->cpg_plldsi.table_size,
> > +                                     mode_freq_millihz);
> > +     if (!parameters_found)
> > +             return MODE_CLOCK_RANGE;
> > +
> > +     hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.div.f=
req_millihz * bpp,
> > +                                            dsi->lanes);
> > +     parameters_found =3D rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
> > +                                           &dsi_parameters, hsfreq_mil=
lihz);
> > +     if (!parameters_found)
> > +             return MODE_CLOCK_RANGE;
> > +
> > +     if (abs(dsi_parameters.error_millihz) >=3D 500)
> > +             return MODE_CLOCK_RANGE;
> > +
> > +     memcpy(&dsi->mode_calc.dsi_parameters, &dsi_parameters, sizeof(ds=
i_parameters));
> > +     dsi->mode_calc.mode_freq_khz =3D mode_freq;
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned l=
ong mode_freq,
> > +                             u64 *hsfreq_millihz)
> > +{
> > +     struct rzv2h_pll_pars *dsi_parameters =3D &dsi->mode_calc.dsi_par=
ameters;
> > +     unsigned long status;
> > +
> > +     if (dsi->mode_calc.mode_freq_khz !=3D mode_freq) {
> > +             status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> > +             if (status !=3D MODE_OK) {
> > +                     dev_err(dsi->dev, "No PLL parameters found for mo=
de clk %lu\n",
> > +                             mode_freq);
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     *hsfreq_millihz =3D dsi_parameters->freq_millihz;
> > +
> > +     return 0;
> > +}
> > +
> > +static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> > +                                 u64 hsfreq_millihz)
> > +{
> > +     struct rzv2h_pll_pars *dsi_parameters =3D &dsi->mode_calc.dsi_par=
ameters;
> > +     unsigned long lpclk_rate =3D clk_get_rate(dsi->lpclk);
> > +     u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
> > +     struct rzg2l_mipi_dsi_timings dphy_timings;
> > +     u16 ulpsexit;
> > +     u64 hsfreq;
> > +
> > +     hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
> > +
> > +     if (dsi_parameters->freq_millihz =3D=3D hsfreq_millihz)
> > +             goto parameters_found;
> > +
> > +     if (rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
> > +                            dsi_parameters, hsfreq_millihz))
> > +             goto parameters_found;
> > +
> > +     dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", =
hsfreq);
> > +     return -EINVAL;
> > +
> > +parameters_found:
>
> Maybe:
>
> if (dsi_parameters->freq_millihz !=3D hsfreq_millihz &&
>         !rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits, dsi_parameters,
>                         hsfreq_millihz)) {
>         dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n",
>                 hsfreq);
>         return -EINVAL;
> }
>
> keeps the flow a bit cleaner.
>
Agreed, I will update as above.

> > +     dphy_timings.tclk_trail =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL);
> > +     dphy_timings.tclk_post =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL);
> > +     dphy_timings.tclk_zero =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL);
> > +     dphy_timings.tclk_prepare =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL);
> > +     dphy_timings.ths_exit =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL);
> > +     dphy_timings.ths_trail =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL);
> > +     dphy_timings.ths_zero =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL);
> > +     dphy_timings.ths_prepare =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL);
> > +     dphy_timings.tlpx =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL);
> > +     ulpsexit =3D rzv2h_dphy_find_ulpsexit(lpclk_rate);
> > +
> > +     phytclksetr =3D FIELD_PREP(PHYTCLKSETR_TCLKTRAILCTL, dphy_timings=
.tclk_trail) |
> > +                   FIELD_PREP(PHYTCLKSETR_TCLKPOSTCTL, dphy_timings.tc=
lk_post) |
> > +                   FIELD_PREP(PHYTCLKSETR_TCLKZEROCTL, dphy_timings.tc=
lk_zero) |
> > +                   FIELD_PREP(PHYTCLKSETR_TCLKPRPRCTL, dphy_timings.tc=
lk_prepare);
> > +     phythssetr =3D FIELD_PREP(PHYTHSSETR_THSEXITCTL, dphy_timings.ths=
_exit) |
> > +                  FIELD_PREP(PHYTHSSETR_THSTRAILCTL, dphy_timings.ths_=
trail) |
> > +                  FIELD_PREP(PHYTHSSETR_THSZEROCTL, dphy_timings.ths_z=
ero) |
> > +                  FIELD_PREP(PHYTHSSETR_THSPRPRCTL, dphy_timings.ths_p=
repare);
> > +     phytlpxsetr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~PHYT=
LPXSETR_TLPXCTL;
> > +     phytlpxsetr |=3D FIELD_PREP(PHYTLPXSETR_TLPXCTL, dphy_timings.tlp=
x);
> > +     phycr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
> > +     phycr |=3D FIELD_PREP(PHYCR_ULPSEXIT, ulpsexit);
> > +
> > +     /* Setting all D-PHY Timings Registers */
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
> > +
> > +     rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
> > +                              FIELD_PREP(PLLCLKSET0R_PLL_S, dsi_parame=
ters->s) |
> > +                              FIELD_PREP(PLLCLKSET0R_PLL_P, dsi_parame=
ters->p) |
> > +                              FIELD_PREP(PLLCLKSET0R_PLL_M, dsi_parame=
ters->m));
> > +     rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
> > +                              FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parame=
ters->k));
> > +     fsleep(20);
>
> Why sleep? Sleeps should (almost) always have a comment, explaining what
> it is waiting for.
>
Sure, I will add comments here (and below).

Cheers,
Prabhakar

> > +
> > +     rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
> > +     fsleep(500);
> > +
> > +     return 0;
> > +}
> > +
> > +static void rzv2h_mipi_dsi_dphy_startup_late_init(struct rzg2l_mipi_ds=
i *dsi)
> > +{
> > +     fsleep(220);
>
> Especially sleeps like this, where the upper side is "open ended".
>
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYRSTR, PHYRSTR_PHYMRSTN);
> > +}
> > +
>
>  Tomi
>
