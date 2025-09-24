Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC4FB99F79
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 15:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008F310E721;
	Wed, 24 Sep 2025 13:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1597D10E721
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 13:05:33 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-ea5b96d2488so5068609276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 06:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758719132; x=1759323932;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dt3FE+JEfBgU4GvIduSmfD+mr673puEsHTiT0sBkYwI=;
 b=m+ONfWyzB7YEPeFYxMbvAxQxrUHmRr3UOt099BPHgIUYGttZU7eCW8mxLcrwKjg0Yh
 aPGCwoESJHVYWeKBTL1CwwNR2qfVzeEoftkDWJrtU/snOLAiOUdpjeckooNzTfantsOL
 ZUnBKAcLLLgvfRkiu/VWBBBNhOGBCSnzeQDNxF1TSnYdr68YcDUf53uKB5s03/akhFcq
 Z4K6kUghmKPfnmr/cmx9mSkRaqQHQhZvbF56sA2GdAiNjBRY7rEejGSaJwl+PG7zOjkA
 N10OvnFTy9PJ168k1EOTu7zDQUAzJwRmsjd08qDBJp5NuUcFCmVi6GzZEq99wXlXdR+L
 a17g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjUGSnCYdOOwO0iPi6xDR8fPA6MddENuf0T8hpAZajEZH8LbRwKttcOv/RTytXYZ1FUdr0HLecKNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPMic4Jbagk3HzFOqN01xAPUMSu2W3UiUZwxOVOujLaIcTUuiI
 com5ogqhja1jL3MqpytPVL5eKN9p0TIdkhDSmgk0balRtFsSG4kiDA0tn1i3/VV8
X-Gm-Gg: ASbGncvmuLP22wrZYhhh29r5wWPAV6QjjOCFT7xKx67ksWAg2mlGAytAf9MTina+IXv
 QY9C0m9tXOHZY43tNGYlEslZI+HWtdyxi44r7tXjhxl7ZEaZnkIKF9W2+vi2exr/rNkwuu5Vap8
 308iZyKEiBrH7E+xcoj70TtH13kY6MrFveIfPdUjlkR6+8AJ/+z1ySjlbdiyNi8+g/lGMSq9Vn8
 tPL8HF9H4UyO2Pt202EV2GZWFuynxYV0i8cq0WygBu74WMNffB2BoA+gMUQHi9PO0Dv+dVFIYWn
 OVWmkO+Oa3k/9NzM1GHAgKDSpRjPKdNN5DQ/DgNM+W30Ifj0fZEbpNfUwr9MRMCBFtZ229ElA/c
 gLVtFnU37uB8JXMzTQDG6V54YRuBeTg3LyyduypyexKLUdRIuYeRM5B8vRbKvSgV5Bym3Kq8=
X-Google-Smtp-Source: AGHT+IE0DySLezadOsaDGNhe7UykEoYj50NnStCZLDrv26iCj3KttSPXTvbcIVI255V9oC5MUFePxQ==
X-Received: by 2002:a05:6902:f85:b0:eae:87da:feee with SMTP id
 3f1490d57ef6-eb32e82aaddmr5185812276.20.1758719131705; 
 Wed, 24 Sep 2025 06:05:31 -0700 (PDT)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com.
 [74.125.224.50]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-ea5ce7275ddsm5904964276.8.2025.09.24.06.05.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 06:05:30 -0700 (PDT)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-6353f2937f3so2022290d50.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 06:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWRKxf0PrMRsJDROzOdezRUeHoM6p8qJ3y27Vad9zBvUWGqkSsGjl9dgHs4FkIZvr7+yOl2N1J4hGw=@lists.freedesktop.org
X-Received: by 2002:a05:690e:2593:b0:5fc:53ab:a49c with SMTP id
 956f58d0204a3-636045f7a94mr3388326d50.11.1758719130471; Wed, 24 Sep 2025
 06:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
X-Gm-Features: AS18NWC94EGYcxjMXs4Deenf7S5F9QjlUjLF0OPIzRnfMxCF0EhsIC5PeV3xDXg
Message-ID: <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
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
> Add support for PLLDSI and PLLDSI divider clocks.
>
> Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
> PLLDSI related data structures, limits, and algorithms between the
> RZ/V2H(P) CPG and DSI drivers.
>
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly
> different parameter limits and omits the programmable divider present in
> CPG. To ensure precise frequency calculations, especially for milliHz-level
> accuracy needed by the DSI driver, the shared algorithm allows both drivers
> to compute PLL parameters consistently using the same logic and input
> clock.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       u64 rate_millihz;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
> +               goto exit_determine_rate;
> +
> +       if (!rzv2h_get_pll_dtable_pars(dsi_info->pll_dsi_limits, dsi_params, dsi_div->dtable,
> +                                      rate_millihz)) {
> +               dev_err(priv->dev,
> +                       "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +exit_determine_rate:
> +       req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
> +       req->best_parent_rate = req->rate * dsi_params->div.divider_value;
> +       dsi_info->req_pll_dsi_rate = req->best_parent_rate;
> +
> +       return 0;
> +};

Unneeded semicolon (there are three more below).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
