Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8239ABDDE8
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7685410E47F;
	Tue, 20 May 2025 14:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDA310E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:55:13 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-528ce9730cfso1255313e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747752912; x=1748357712;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ttxhK6Ti/XQOTqH6UODUStCIPGw0sZp98YSCtYewY44=;
 b=LOQPA3YzaNPo7Mxynq1kmXoKMABdEqJUtqHqc2bfYcpBdaBKNpl4+ASts4k2/NXXFd
 kHVbswBz1aJJFdA/txjpP8Zheo9EgIVNLdCIo+nSM3SbN/slIyo91FR01/7aufBeHBUz
 ga/LAGYTv4DTDR1zzvqf/yA1CI0uYdzm8OuGrs3nnLr1Ikha9A53XWd82Hv7ZfqaVqLN
 XyXtNDFWZRx3zk/osPpG/nvWXOHumgR5U6nLsxS2mRLJriXheRvqPlhdNS6VjfmzmnyW
 adFr39KMKKVXgZp+H/L95F0DITj9lGHfqtqfJpr8fN91VpmbIO9hrsY35x78t+3ZHuon
 64WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWybuwPuXckgHYzpMviPg5R4geqmiBQQ4XNYP1GdS+cb/KynxhXr75vomgoCSwu+y4ZQR7VnXKNxR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzG+HKuDzJqnXF9SKT1/pmWGdcsGkApdZjv2QV8Y4+uVm+Eal+
 vM15Tzf+dxtU8hTGdkk38Sg12bgRnoUiKp4MaJJMoOGeqTeWMvptsWVg2a4zTYwD
X-Gm-Gg: ASbGncsUbWNGeuRO+kFH56/h+2UkyWAsAoaMxjY51jBvUTMZOemEAU5JQeCF7Ub7Za0
 UP1aiAUCHhXoZ/qNb00UeX8Qec9TueSKF1YKY+OikHGWmrKx8ecvHR0TbgZ3c/wPqECj7ieW9A8
 jVf+0UnZcHB8+mTxuIR3za05kCgpP5f7vupHN+XDqD72djTE5owTqD96qqNW5w84jOlg4dmnDg/
 5U8vQHn++nLzMCYSP5PBkhxaiptERIWD4sMTEQLxz6rYphFLM7KqwTSSdpThBIue7jLAtrfpvr0
 xBdWE2jalJoHlL0DaO/DxpjEZDCo+fvlXnPy34Eil7zGBXA5+ZvGcJn4qxdGA8Pf+JPcumGtg46
 P11P1Tnjzl6mS2g==
X-Google-Smtp-Source: AGHT+IHuE9Qg8ZPLY7VLldZr6cTTEaj5+KD3F0Y6SEapycMnq49bYfnoolWcwzBxNclwO3yARo0g4g==
X-Received: by 2002:a05:6122:a1f:b0:527:8771:2d39 with SMTP id
 71dfb90a1353d-52dbcd6d66dmr13785832e0c.7.1747752911544; 
 Tue, 20 May 2025 07:55:11 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dbab6d250sm8550977e0c.48.2025.05.20.07.55.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:55:10 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4dfc11e2520so1781181137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:55:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU3yNiS1Iu6J2bDPJWweJQSGMg6CLINuelDfWbLIo+F3n8zVoEpV1YeclgJnRSH7xQvE7aI/4EdHds=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1528:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4e05375dcb2mr14690410137.19.1747752910647; Tue, 20 May 2025
 07:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 16:54:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEgTo7V-gzzpVVNqxnDMSdTC1ew70gbJ=Sb5Qr4asryA@mail.gmail.com>
X-Gm-Features: AX0GCFv8LYK03_9WrEiJFFzvjW_0fJJk_EmmURtGv-joA1Jov8I_4pZ3KpumSj4
Message-ID: <CAMuHMdVEgTo7V-gzzpVVNqxnDMSdTC1ew70gbJ=Sb5Qr4asryA@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

On Mon, 12 May 2025 at 20:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
> VCLK rate instead of the mode clock. The relationship between HSCLK and
> VCLK is:
>
>     vclk * bpp <= hsclk * 8 * lanes
>
> Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
> HSFREQ accurately reflects the clock rate set in hardware, leading to
> better precision in data transmission.
>
> Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
> when computing `hsfreq`. Also, update unit conversions to use correct
> scaling factors for better clarity and correctness.
>
> Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
> threshold comparisons to use Hz instead of kHz to ensure correct behavior.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - Added dev_info() to print the VCLK rate if it doesn't match the
>   requested rate.
> - Added Reviewed-by tag from Biju
>
> v3->v4:
> - Used MILLI instead of KILO

Thanks for the update!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

> @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>         u32 golpbkt;
>         int ret;
>
> +       ret = pm_runtime_resume_and_get(dsi->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       clk_set_rate(dsi->vclk, mode->clock * MILLI);

drm_display_mode.clock is in kHz, so s/MILLI/KILO/

> +
>         /*
>          * Relationship between hsclk and vclk must follow
>          * vclk * bpp = hsclk * 8 * lanes
> @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>          * hsclk(bit) = hsclk(byte) * 8 = hsfreq
>          */
>         bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -       hsfreq = (mode->clock * bpp) / dsi->lanes;
> -
> -       ret = pm_runtime_resume_and_get(dsi->dev);
> -       if (ret < 0)
> -               return ret;
> -
> -       clk_set_rate(dsi->vclk, mode->clock * 1000);
> +       vclk_rate = clk_get_rate(dsi->vclk);
> +       if (vclk_rate != mode->clock * MILLI)
> +               dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
> +                        mode->clock * MILLI, vclk_rate);

Likewise.

> +       hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
>
>         ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
>         if (ret < 0)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
