Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BE8AC2550
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 16:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6483E10E823;
	Fri, 23 May 2025 14:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7371910E828
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 14:46:34 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3feaedb39e9so9069b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 07:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748011593; x=1748616393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ghdI2uqqe2O4Wmd68hFPGrigGpfsBMc5eDJtKxJn5bI=;
 b=gnRA+KUiE93Qh/JtJs6EpQBBA8OpuPZP8kwFRDYrTmOce91rUsustUR6z7Opf6RAba
 EBXN5CnpGwmmyDfii88a3RUCq22dJVNsqzYxwWNmIo3I/3kx6Lst0tqt/NdOpqWi/Scp
 jkuynV62ePy3qyi6b4X+yuJ55esHj6DeBWalF8eBQU9UtrEsYBKnD0L2irnB8PdRQznU
 2YudoWnIONkvWjvviyJ1QVsvwurCr0GgrG26Y6IJudhGtl6BK7a9xcNC72o3MTxa0MPE
 ulZRWtDctzUTpQh4YQpTk+AaZHLOrOAruAOrXNWSLab9AfwQUIS+Nz6io/dcJ9LOBFiz
 dUGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmngOYUIhj1Ba7KVQGLqr4w9A38wgt7URMz9nbDaLcNQ6QEtsXUHW0Nwfv1jTXOGv/oktGioACncI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg9BeeiajM3mtv1HdoZdlAXQ8y6XN97EScIiCrn1ZXk2/2M9i5
 qCbhPlbIpF4UQgJ4yHOAS65pnxtti3/2HKzPGkbXwpWBa+XJ/zVJ34lKa66p1+qzN9g=
X-Gm-Gg: ASbGncstR5IqGCIBPTAVuMB95M2FHxl9PwZrYlBy8oknVSsbXCWh6CZNH+VKDRDxWcY
 FVMqHEtYsZvCVFhNCf9ySKGWvxXRr7tXC8MOepGVNdkuYVGYCuvMKV175SfBwGUZqbVNocE994Q
 sCCzHJLWP2ut6RPESRHOyzcS+Ja14QdZgM74mdgRsD2YKba89dKcA/QSDC1H19LERKC0YSEftnl
 YozErmW1toNsvZLjm767JLm/QMTk7x9ctzVgg0VUmAyvqFtynpqdEhK8zqGvNA69ScVisCrsSRO
 hILjP9AaZug3bSf2UCNUm81QHbJqJy9JB9k8tcz9vlAEh9mUEcFFTVKmkXY3VZ+8AdCFrDVEyWJ
 knf+Tp7l+g2vlAF6rJnwWrl2n
X-Google-Smtp-Source: AGHT+IEie59Slh70JrDuAERspqj+4EnphAQlu/72VuVlUv8PpgXS+4ge6mq4k2GGTbWkyJH/cCagAA==
X-Received: by 2002:a05:6808:80ae:b0:3f9:8b5b:294c with SMTP id
 5614622812f47-404da7edf1amr19126025b6e.31.1748011593052; 
 Fri, 23 May 2025 07:46:33 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com.
 [209.85.210.44]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-404d97d6319sm2960666b6e.3.2025.05.23.07.46.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 07:46:32 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-72c14138668so2851842a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 07:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV46Ec2P810w/vymsdGy1/9dDa53jcLVGkSaNu4pJW73tJg0QbU7uWkJ0NabzWTdi1Zdsv5jxP5lKQ=@lists.freedesktop.org
X-Received: by 2002:a05:6830:6887:b0:72b:a3f3:deb6 with SMTP id
 46e09a7af769-734f984a750mr15833524a34.4.1748011592230; Fri, 23 May 2025
 07:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512184302.241417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 16:46:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9NM3SPeZAxDnh=ez0uBvt9077_64oJe9A727p1r9QOg@mail.gmail.com>
X-Gm-Features: AX0GCFv_GjXouNvqk1PpQnSfRmAzXOHXMmh8i0A88wx3URx0tlvPZOD5l0uuRfQ
Message-ID: <CAMuHMdV9NM3SPeZAxDnh=ez0uBvt9077_64oJe9A727p1r9QOg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
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
> Add clock and reset entries for the DSI and LCDC peripherals.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -58,6 +60,9 @@ enum clk_ids {
>         CLK_SMUX2_GBE0_RXCLK,
>         CLK_SMUX2_GBE1_TXCLK,
>         CLK_SMUX2_GBE1_RXCLK,
> +       CLK_DIV_PLLETH_LPCLK,

CLK_CDIV4_PLLETH_LPCLK?

> +       CLK_CSDIV_PLLETH_LPCLK,

CLK_PLLETH_LPCLK_GEAR?

> +       CLK_PLLDSI_SDIV2,

CLK_PLLDSI_GEAR?

>         CLK_PLLGPU_GEAR,
>
>         /* Module Clocks */

> @@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
>         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
>         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
> +       DEF_FIXED(".cdiv4_plleth_lpclk", CLK_DIV_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
> +       DEF_CSDIV(".plleth_lpclk_gear", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLETH_LPCLK,
> +                 CSDIV0_DIVCTL2, dtable_16_128),
> +
> +       DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,

".plldsi_gear", CLK_PLLDSI_GEAR ...


> +                      CSDIV1_DIVCTL2, dtable_2_32),
>
>         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
>

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
