Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D3C42AA6
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 10:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A0310E1A5;
	Sat,  8 Nov 2025 09:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lFkKyKTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E425B10E120
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 08:34:05 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b7277324204so261405666b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762590844; x=1763195644; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=S2bAn/z92LSkt2g9/ex7wXFtatjYpsStSn9cf/zplSc=;
 b=lFkKyKTIuJWzVd14uAGnpJrRdKSx5v843dlIPkqGNqxsAE0rKEwhpUfFsPEfBIWxSb
 OqUkZGQZ4TIpgMW3UD3GyIZw1qW84cSJ+S5A5IJWSzRWvNxHzdQye/IBAFhlZWKLl3a0
 4D1QPd7uTlzrV1KMaLqJfxlYzubKQXAFMZIyItsgS4OZq+p7y4s5KZlZcTKYn4Nvk0YC
 XYrmG0b/yI58Nf3yHQO90dgl+eQGEhdqBCL3C8ly8YLtvXEdlColKEGwd8GbYCF1mVfg
 LLQv83Xb877W77MrrEq506oQbYcpmHS+XCGwiK1juGyQTis6xCk62oq/9lReqiNNMwY6
 zTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762590844; x=1763195644;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S2bAn/z92LSkt2g9/ex7wXFtatjYpsStSn9cf/zplSc=;
 b=KBzBf9egxvgOdIUAAP4hr8JqqZxJHt4/17sY9oHApQ9RK972KpFiqFCUeIAiV66L1m
 YoLXRQ4p/ELMudxZ/VH/sH/6H1xZDnJ+rhrnQ+hqgZ9Qw2ubL93835S8NV9BAVw/l1rL
 zWvK4/apxONcgPXcQXUIc3/Eol2gdrax8wpDUxl8HxTKKderR3QT9wQlNguSxnGSTOne
 zOAuB6Vizx0XjPlArnCMpmOvWG7eXEpdrOJPPXUoKU+8t/TSjvY9/B8b8PAeN8yzundg
 XWA67KJbKHnYksB9RHnxg1sos4VaibV4EOQWkaBRiESJVShEfsFpm/bQEL8PJUvHh5n2
 cC1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV21i8oFvPQnJ2H8SBQLGzG218UxG/NHpro4G4m7it/8OsCSLfhq1E1fSavgReDG93EcXOUGGPLgY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/Dc3wSttuAcBsutR9RmLlcf1sNG5Xpnm2uMih8eD6lbNrRC5j
 Ln00aOZmlTIGMypKaUh60gzzc0jCbi4M0OJCPPAg4ajp3W56S/7xZ7UwE/4hYxJ1bi/0ylNZbWM
 zcqsnISPbKPzGBQUPxgOz2JtzCrL0tLo=
X-Gm-Gg: ASbGnctfD4x64+TBnEzCfc+4py6umbQh4TNFVKSjiIyf3iTh+ykdgdmE3n6JoA9D4uw
 FPN6/sOmkZJv2w/uEk2At+swyZ61Nyujt7fAlvm+o9jQCc6ga7SdHx/WgSVzam1khZpI2MXs8wv
 n/HttNca8YaAgxuhUDqCXqmm41lXGC32ykM94Lccfgq3XoVOovFvN5rWR744vxAVmTlRYuT9Hg5
 xo2bpqdAjVIsXXcabjidOzIqmRZIPpjm6QnEcZgF2Jj/Posxlgc8aUhIJsq2g==
X-Google-Smtp-Source: AGHT+IFbr8D70I5Hh0mnS7XVwXHbLqUGTeP+fYZpSbGy0noG5yKzFl2DcNr86SrLZ7RYVuNvP7KnNxLcSVBXZ7AYddg=
X-Received: by 2002:a17:907:2daa:b0:b46:6718:3f30 with SMTP id
 a640c23a62f3a-b72e04c75bcmr186480266b.51.1762590844332; Sat, 08 Nov 2025
 00:34:04 -0800 (PST)
MIME-Version: 1.0
From: Biju Das <biju.das.au@gmail.com>
Date: Sat, 8 Nov 2025 08:33:53 +0000
X-Gm-Features: AWmQ_bmFChOZ2gWu0OVmeSTfILZt9gLDEULm0nND2RwOlaUkwhuiTXJouqHTspM
Message-ID: <CADT+UeB9_as1=Prxsx+DWJLCrdH=tGG9OfW4_5foXzte=6f=Ug@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
To: "chris.brandt@renesas.com" <chris.brandt@renesas.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>, 
 "biju.das.jz@bp.renesas.com" <biju.das.jz@bp.renesas.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "geert+renesas@glider.be" <geert+renesas@glider.be>, 
 "hien.huynh.px@renesas.com" <hien.huynh.px@renesas.com>,
 "hugo@hugovil.com" <hugo@hugovil.com>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, 
 "nghia.vo.zn@renesas.com" <nghia.vo.zn@renesas.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, 
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 08 Nov 2025 09:39:27 +0000
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

On Wed,  5 Nov 2025 17:25:29 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> ---
> v1->v2:
> - Remove unnecessary parentheses
> - Add target argument to new API
> - DPI mode has more restrictions on DIV_A and DIV_B
>
> v2->v3:
> - Removed Empty lines (Hugo)
> - Add dummy for compile-testing CONFIG_CLK_RZG2L=n case (Geert)
> - Renamed label found_dsi_div to calc_pll_clk (Hugo)
> - Renamed label found_clk to clk_valid (Hugo)
> - Removed 'found' var because not needed
> - Move 'foutpostdiv_rate =' after if(foutvco_rate > 1500000000) (Hugo)
> - Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)
> - Convert #define macros PLL5_TARGET_* to enum (Geert)
> - static {unsigned} int dsi_div_ab; (Geert)
> - {unsigned} int a, b;  (Geert)
> - Change "((1 << a) * (b + 1))" to "(b + 1) << a"  (Geert)
> - Change "foutvco_rate = rate * (1 << xxx ) * ..." to " = rate * ... * << xxx (Geert)
> - Move (u64) outside of modulo operation to avoid helper on 32-bit compiles (Geert)
> - Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)
> - void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int target)
> - Change "dsi_div_ab = (1 << AAA) * (BBB + 1)" to " = (BBB + 1) << AAA (Geert)
> - Added Reviewed-by and Tested-by (Biju)
>
> v3->v4:
> - Changed <,> to <=,>=  (Hugo)
> - Removed duplicate code bock (copy/paste mistake) (Hugo)
> - Fix dummy for rzg2l_cpg_dsi_div_set_divider when CONFIG_CLK_RZG2L=n (Geert)
> - Remove comment "Below conditions must be set.." (Hugo)
> - Remove +1,-1 from pl5_intin comparison math (kernel test robot)
> - Remove default register settings (PLL5_xxx_DEF) because makes no sense
> - If any calcualtion error, print a message and return a rate of 0
> - Rename global var "dsi_div_ab" to "dsi_div_ab_desired"
> - Check the range of hsclk
> - The correct clock parent is determined by if the divider is even/odd
> - Add in all the restrictions from DIV A,B from the hardware manual
> - No more need to be a recursive function
> - DPI settings must have DSI_DIV_B be '0' (divide 1/1)
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 147 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |  12 +++
>  2 files changed, 146 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 07909e80bae2..1a552ea1c535 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,17 @@
>  #define MSTOP_OFF(conf)          FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)      FIELD_GET(GENMASK(15, 0), (conf))
>

>

> +       if (dsi_div_target == PLL5_TARGET_DPI) {
> +               /* Fixed settings for DPI */
> +             priv->mux_dsi_div_params.clksrc = 0;
> +             priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> +         priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> +             dsi_div_ab_desired = 8;                   /* (1 << a) * (b + 1) */
This block is duplicated may be add a helper function(), if you are
planning to send another series.
> +       }

> +      /* Default settings for DPI */
> +  priv->mux_dsi_div_params.clksrc = 0;
> +  priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> +      priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> +  dsi_div_ab_desired = 8;                        /* (1 << a) * (b + 1) */
>

Cheers,
Biju
