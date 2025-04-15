Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4BA8A382
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 17:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E18810E7EA;
	Tue, 15 Apr 2025 15:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775A810E7EA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 15:59:09 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-301918a4e3bso5812899a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 08:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744732748; x=1745337548;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQOaA84/gJX5YcmA1yI2UrffzTTDGmIxxE06BR+8a5Q=;
 b=s2uSb65OGa4SP6TxfwXykZmgWB8TRn0QPbYEU2YbLgHi3+4SdOCD4gl1mDoMkKlhxq
 uObtbJ+jscgx8DQh3E6Myw7qmGwstDIcq6g23u44IBwSLaOM3KkzLGgZvnkNH7ThlD/S
 KjnITBeq1WdplTEFChoxkwNryXrn0hp8rDfB14IMDGbh3yjpgH4E5rkdympjh38ZI40s
 yOnIHS+BMGzRNPYHgCfHiJF5hOmIjJ750k33Hj9v/fOSdBDca0kCUMpvRv5Lu35Cwxw7
 z7bydaf6x3B6KOYFaqoSUgGePdIlql0jcVmmPEmKZitBy1wbs3/MAgtgrLLcbnr/EwWy
 3IXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLpSB9o1AcKkTIC0/w+cqV1llhRa4HGxL7sJTXHLxj6pbjMghNPayQTJ5zh7KX1M5VvaGwpbRrSxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXdtd+yhbBnpeu8GeVI6sOjfNkN3sCALMD0BxA4A7oIpapVvv0
 W4f8CVGdLWKl+i18m5iCitHCnkmmG1xb8/0Wb+Ukg1+W27iqsKeQ05xAoSz4
X-Gm-Gg: ASbGncucaGTr1E0/sRxSYP0P5ea7NVSkPK/waGOnAqyQVupVkbxsd7nzz73TKP+qIsv
 FSsEDAA3Rsiy6/l82XXEhnMQzQFHSnoBaD9fTJYgXjLrqCu7lUq/FrHI6q0MCyzRjdRLMEDH3Jx
 MdbGCIsEPkHNl05PcFBhZ7OH51Pd1KNaLDoVHinjG+W0eAYUFoHUk/2Z0Gbd418i7QiTXQY7Gg5
 gHtCVSJgF/jHD+mzpBuBdcpMhdBdgNjy7v3TM+Ew7G5ok10x0HwfkLwGqZWwlNIUTh5NVZajoQe
 OpItAN19Sn/ItYcWP0phZs1r04+/HOfZxe2+WhD3eYqRTOBNpUPnJrbDQ6xulwb8NUeUhKq0MwZ
 fvBla6Fs=
X-Google-Smtp-Source: AGHT+IHFjFl5KRvDy63kefHaLTfW8gWE/+vUDWwkmwGsEXNHydFmksF73I6gYjT1A3Sj+P1PFgXC6g==
X-Received: by 2002:a17:90b:520a:b0:2ff:7b28:a51c with SMTP id
 98e67ed59e1d1-308237855a0mr22310385a91.34.1744732748663; 
 Tue, 15 Apr 2025 08:59:08 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd17192asm13513295a91.35.2025.04.15.08.59.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 08:59:08 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2264aefc45dso85739285ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 08:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+xJseTw8xj9aQ1cNHh+R6S4vvZppNvXS5xrB80OjTvoF/FsgpuFX4u4jnD2Kw2NHJhZkRB2YC7Fc=@lists.freedesktop.org
X-Received: by 2002:a05:6102:c05:b0:4c1:6feb:83aa with SMTP id
 ada2fe7eead31-4c9e4ee9fe6mr12739669137.9.1744732271060; Tue, 15 Apr 2025
 08:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 17:50:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj91VbxRbb_pZ23ySbvjzzgfTgy83GXTEtC9CAS=d5Sg@mail.gmail.com>
X-Gm-Features: ATxdqUGU1HbZIqRGMDrZbhA-dxUGjQxgUi_EpOym7TmGQkaFVWVIrulXG2lf2bU
Message-ID: <CAMuHMdWj91VbxRbb_pZ23ySbvjzzgfTgy83GXTEtC9CAS=d5Sg@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the DSI and LCDC peripherals.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - No changes

You did change CSDIV0_DIVCTL2 to the NO_RMW-variant...

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
>         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
>         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
> +       DEF_FIXED(".plleth_lpclk_div4", CLK_DIV_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
> +       DEF_CSDIV(".plleth_lpclk", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLETH_LPCLK,
> +                 CSDIV0_DIVCTL2, dtable_16_128),

The clock names look strange to me: "plleth_lpclk_div4" sounds like it is
"plleth_lpclk" divided by four, but that is not the case here.

> +
> +       DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
> +                      CSDIV1_DIVCTL2, dtable_2_32),
>
>         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
>

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h

> @@ -117,6 +118,8 @@ struct smuxed {
>
>  #define CSDIV0_DIVCTL0 DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
>  #define CSDIV0_DIVCTL1 DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
> +#define CSDIV0_DIVCTL2 DDIV_PACK_NO_RMW(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)

The documentation says:

    DIVCTL2[3:2] is reserved.
    When writing, read modify write is needed.

So the NO_RMW-logic seems to be inverted?

> +#define CSDIV1_DIVCTL2 DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
>
>  #define SSEL0_SELCTL2  SMUX_PACK(CPG_SSEL0, 8, 1)
>  #define SSEL0_SELCTL3  SMUX_PACK(CPG_SSEL0, 12, 1)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
