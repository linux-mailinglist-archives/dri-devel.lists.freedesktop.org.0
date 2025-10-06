Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F590BBE173
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 14:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCAC10E34E;
	Mon,  6 Oct 2025 12:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35AE10E34E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 12:49:43 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-8fb58f2b820so3087581241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 05:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759754982; x=1760359782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwPjpMz/0J4A8goGwBvaeTijAxI7KyJ1C6GbFZyEwbs=;
 b=SYTXvWiDt4Dm+X8UKZ3N3ZgUU1fYLFcAjOH9SWq7Qk3N0UMnjdxVxdcruiZv+xm/T0
 FrOf8QUBH6zhg9HCKupHdXYFixiDxaQEq0cugWCrcZT/1kYXxcN/08v7jctoYZinVc9M
 vHbBWPBvymEph0KceWm9tE/cbpDnH9vKslD1TtyicyrX7dyfoJHj7/I91+sGgCu7DrQV
 4FRG/PdjXNWvXAdN7qZ9oiAFlVO481WVZ3fWjhuukXPlL/5cCCXcO6t0Ae6abGzNw7nI
 rNOER8h7j8Nsg1be4xxwy4fkyYYk5fpwTRxuqztEdebTOaX1MEN2+c1lU9pFrDukaxbV
 YlEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVECSovijJ5Mdvql6X+/pXXkum8uXgibNz0M20I3vnKvZvUMgSV+tJZOQsO6tVD3PwrWO32CAhpoQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYxyghNEYSlpciXVcQQe784GM/k5ne/oWPRNzqzPgehVNs8aeF
 2a82dz+ZPw3zvbDVQ4r6MKt/txsYYNS4TXNNMl+vZI5OcqzDelJ2OjICxCVI4wJF
X-Gm-Gg: ASbGncuNYumk3Ph313nHaikSgWM92YXlHgLw45eXSMUBjip/PTiAGKy3Eg/ytrqMRKI
 C4rGe3t3VfI0cR6tyqL+Wcl48/3zVtDKG3fmijgBCznWQpNTnfvC6mdBUWxNO/+nrgt8/Vq3odm
 n6v4M/lFv6pApn8NhlIw6YuavTd5NSf3jlZecpyQmwemLFaHtS1uozklBim+MRfYx4/QWqq2BhH
 UXEBhmXDJd5HJpZ7dOQdRMlFJywvzEZd7xKE8/FxGwPZf1OdjD2fj1a9a/O44xsP+K++V0oeDf/
 /lTjF9KECVHpjAHyIIOw0oPC0nsAjK1qiBGLtnoY00+c1YG0quUfZVmkY4XxJV9nADl1nw+nB59
 nmHrq+VMsZqhnNqyMe3B0zwUnw20vQb5Zjdej/s9BnaFnByQdeIX6PH+NohYxSHlPQR2WtUT8yt
 SMsdrtLxH4
X-Google-Smtp-Source: AGHT+IHfCfVNDgVKLAhEcjFJx0cCmlmCZKrhDSZM10jwCj4RqAd1L4Z3UYZEkngkWDebOayN7NfOSw==
X-Received: by 2002:a05:6102:5111:b0:523:d0d7:b964 with SMTP id
 ada2fe7eead31-5d41d0588acmr5044492137.12.1759754982296; 
 Mon, 06 Oct 2025 05:49:42 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-92eb4ee14e6sm2863092241.16.2025.10.06.05.49.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 05:49:41 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-8d02f793882so2833857241.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 05:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX8TYGL39EwukBYGX8SjsB1f8HHxL9rWk42jd8urqNA1Z1GZg88VW+NWhL05YggWrFJtmVHd560jwI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1620:b0:520:c4ea:4bcd with SMTP id
 ada2fe7eead31-5d41d055f58mr4323006137.9.1759754980548; Mon, 06 Oct 2025
 05:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 14:49:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
X-Gm-Features: AS18NWBb9B-DekEKpQfUFSovMcE6-nb-Pn4OxZ0U_p0Jp7pux_ucj5r-aIzp9-s
Message-ID: <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
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

On Thu, 2 Oct 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
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
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> v8->v9:
> - Updated Kconfig to select CLK_RZV2H
> - Updated to use renesas.h
> - Added reviewed-by tag from Tomi

Thanks for the update!

> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -19,6 +19,7 @@ config DRM_RZG2L_USE_MIPI_DSI
>         depends on DRM_BRIDGE && OF
>         depends on DRM_RZG2L_DU || COMPILE_TEST
>         default DRM_RZG2L_DU
> +       select CLK_RZV2H

As the kernel test robot has already told you, this is not a good idea.
RZ/V2H support is optional, just rely on (dummy) rzv2h_get_pll_*()
helpers returning false if CLK_RZV2H is not enabled.

>         help
>           Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
