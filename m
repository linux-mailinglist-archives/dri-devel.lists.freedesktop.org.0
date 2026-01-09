Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B5FD0BDF3
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849C310E927;
	Fri,  9 Jan 2026 18:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B1710E927
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:39:20 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-5636274b338so1004145e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767983959; x=1768588759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmILYhqvOyXlRgf5EHBu2pb/ojQMIlgBjR7Z/UbB1kA=;
 b=Ylf3MJ6BXTna1+SLhvObo2gzerhh6RqoyZTPmZ3lQW3HjEk2bA9+WyX5jaLMutUNY4
 56mC9U+E5NGsz5qP/w8D/MX8F1qBHp83DeSH1KvuNWf4B4Xv2xbnHN356fv9PM4/P8NA
 04pgy0sBvR4Yaq35xNmNfxUFuck2LqhkwVyqNEz2eaTsjEVvPrWeYEY7zQy2HorqwNQm
 11IUTVMYfYGWYNcjirJC+fW8xxTdLbSzXLmlelKMeBpqhsRXyv6aEtj0Ocnvq4om6f3D
 aZFApkJmIo3eOHn7Pec1GGbeFVgRVSpXimc+A/X4IJMJcgl3Uf3hOJt9PvcgKoWhVIBp
 yneQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh6wzdcUKgrQv8wtqAUKddr2a23PtoJ22OdyWAa9rL2Y4UNSHKYMl4TURcpX1mMCDHoMFCA6OV5mY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF/zk+uEgfcUnZEp9o+72HKclPFJnbXsdX+ABgBicST5uru8j1
 NY5UdbgHCN1LorZN/wzoZKw1DbTHkreWadnx9Uk/jp7B268R80t8E7/KGWZdRT5p
X-Gm-Gg: AY/fxX6LtCfo/c2ulPZvsI1DJEwFls/FNwcS3Lbvz4wSruUsGDyRX7UrGXpmRmHkf10
 mhRFxp/7/9RLu7thlLCx7+JSoTIQZ+JOsbuuXDI5ZgLo5ot/uFC8G+nNnujAxMs2tv//ilzlzVA
 OIk4vwjIA/82NLgX1jkBRKvZvRAOcDGhwWbCF03ci/7X/44C7PSrzhkbpad+k6pbgISUyBp8CH9
 3IkNm6fru4srW4q9abH4lZWq3TvFf8l5sCWmMDMwkLsWonJlFDlWoGWuvNARpO/YxEZ6MJwFPyf
 NkoUme6NQ8GQfmSuGumlF8ljY0RfgSx3wceSGkHc0vkN8CW/uXcEbV3ZjFWZ6rRlq3lgWuZy7Vi
 +hANsjxHSdoBb88Nc4DnOCVAmTbMVc0Rb+D9drqU9+NSSdfjGuwRRaF0MAe2GmcCo6BUIgZr+2X
 jxRS9KIFK6eCZvv6JTc1JoZfFvu6XajfFJasVWpUXAiN2CyJTz
X-Google-Smtp-Source: AGHT+IGbVsyC9ySjnxT46HHFidfRbqCcRjjTP792ZJKPKHH9ycqgPI0PZpxA93CslnSLHQ2D7MPVuw==
X-Received: by 2002:a05:6122:32cb:b0:563:45d3:9b1d with SMTP id
 71dfb90a1353d-563464bd28emr4218599e0c.9.1767983959524; 
 Fri, 09 Jan 2026 10:39:19 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5633a41f813sm9851291e0c.18.2026.01.09.10.39.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 10:39:19 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-5ecddf73062so2254099137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:39:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXFFjNXOBA+OxBgBxiuVPVMmd81NAqzCFh1VMOu6PpsSQkfgYP7RGYlTQyLTCHZkBUAWgMjggU0FNI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3909:b0:5ef:a1ea:bd33 with SMTP id
 ada2fe7eead31-5efa1eabdebmr1058605137.9.1767983958883; Fri, 09 Jan 2026
 10:39:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <a7ed87270fd084f2b3f1ad6ee9238b2fb5bcc426.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <a7ed87270fd084f2b3f1ad6ee9238b2fb5bcc426.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvh2mCj_8tuk7CMEWkktPvXAEaz5kKrgy8p-bgGETepA@mail.gmail.com>
X-Gm-Features: AZwV_Qioy5rAVOHURSXprxm6XZTivhCttyw7ug7KaU5R8GoCdbMVCMnDP5LwuYc
Message-ID: <CAMuHMdUvh2mCj_8tuk7CMEWkktPvXAEaz5kKrgy8p-bgGETepA@mail.gmail.com>
Subject: Re: [PATCH 07/22] clk: renesas: r9a09g047: Add support for DSI clocks
 and resets
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
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
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add definitions for DSI clocks and resets on the R9A09G047 cpg driver
> to enable proper initialization and control of the DSI hardware.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -486,6 +486,18 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(9, BIT(4))),
>         DEF_MOD("cru_0_pclk",                   CLK_PLLDTY_DIV16, 13, 4, 6, 20,
>                                                 BUS_MSTOP(9, BIT(4))),
> +       DEF_MOD("dsi_0_pclk",                   CLK_PLLDTY_DIV16, 14, 8, 7, 8,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_vclk1",                  CLK_SMUX2_DSI0_CLK, 14, 10, 7, 10,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_vclk2",                  CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),

Please move this below, to preserve sort order (by _onindex/_onbit)

> +       DEF_MOD("dsi_0_lpclk",                  CLK_PLLETH_LPCLK, 14, 11, 7, 11,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_pllref_clk",             CLK_QEXTAL, 14, 12, 7, 12,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
>         DEF_MOD("ge3d_clk",                     CLK_PLLVDO_GPU, 15, 0, 7, 16,
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("ge3d_axi_clk",                 CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
