Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E538CF4BF5
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F284410E423;
	Mon,  5 Jan 2026 16:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C1010E423
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:38:54 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id
 ada2fe7eead31-5dd6fbe5091so32127137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 08:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767631133; x=1768235933;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Y+GO4Aa0gc2QPJ7CBexGJmUMXVgfq3CdqOnY2xACHY=;
 b=MmIPyMHt4kNCdIMBZxsRmsJUdzLV6WoUDfLX5JyuQG/eYe0p9ZOslijRO7iNLzs2GT
 xjDeoDpsJmlYNGsZi6zNSW+KjW2THFk5/ISDXCLJpunN0JPqbi4HJ6nthcqRCpTNQp9/
 4eJ7uvPhKS7QvU/DQu8Mp8Axj/2jDI8z4rJynq5hKqV15ZccDN7zsx+IMtjS286bChmx
 ZJrVMw0Mgs+5GtHfxblKr3YCg0H83eJ+iTYLGpKj9qrfKcis5VtxpleRuDvOIrQ7OdQ3
 3DNx8Kyc6O4IIzHr958JliRXIzX/yU68LZotUsuXDRD+Bf1zG84uDOYkX/8GhN2cCz6G
 qgEA==
X-Gm-Message-State: AOJu0Yxgiz30ROZjxv4B1fkq6mYSkbU2o3dyXu6cCxUCEojwJXQIFCC+
 ayhfdmQZxHLlkUrPEf6heeaTMyd7ZxdPp3XzQXu3TqwqOb7xN74TUlbMhvCxGKTk
X-Gm-Gg: AY/fxX7uSFPBU1gqEkx/+cddPF2GAK8R1x1wIQgUG0Tv8AURrWwzmuvLU0xFYyyYP1t
 FHqR9diMYDJqod9L7GdpWhs5Y0qppm9zN+gl9K63f5IZBhnxRb06nq+MO2YXzIBjxv+a4+oeaxr
 uEM2uwmb9bBwkz/AGDVEymKxHH9dt3hdgsNCQ4g9x6WxS5ThHsGGEz8qb7EpA9J4+mauqrmfLSH
 UuKRXPCeZ2roksduc/nujvM7ZMfmY1hSEEuab11vB+pR2qD/jZpTMmjHVy9YpLwZpBMhcwKGNoH
 0tWiRMRbVvDzMk4ID3C8vsOMPIkhFF/ccxiZKOQCfFY2BfYBh9dPHxcWMsBsEFFqXrSqzqkWbqW
 A90M2oiH/UwPFprYcnW64A7ukSC2tvi5IchWxAi+A9fvDgX0kCCl3dfN3LiWHXBUo+DQpQRrKy4
 RaSKweQUUtUHa2DoY2T55wGbf0SUiieplI+bTS96cxt5PRvx4iQO5M
X-Google-Smtp-Source: AGHT+IFUiLgwSVeeUnGjwwW6lvTzmdWME2ijF+5DBA2xS20afXMT9DTBchFZ2FhrE8X0vRyG0zkhpg==
X-Received: by 2002:a05:6102:1483:b0:5de:93bb:c531 with SMTP id
 ada2fe7eead31-5eb1a812421mr17817038137.34.1767631131824; 
 Mon, 05 Jan 2026 08:38:51 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec723206fasm116763137.0.2026.01.05.08.38.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:38:51 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-560227999d2so48740e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 08:38:51 -0800 (PST)
X-Received: by 2002:a05:6102:e11:b0:5db:dd12:3d16 with SMTP id
 ada2fe7eead31-5ec742e6215mr9355137.6.1767631131303; Mon, 05 Jan 2026 08:38:51
 -0800 (PST)
MIME-Version: 1.0
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Jan 2026 17:38:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxOa2zUP8d7F=dUPP+Lun=_KHeU2N-OqxxknGnn24X0A@mail.gmail.com>
X-Gm-Features: AQt7F2qVMJycMg8E3neruWziUPT3Uppf-0VX2kRzSJ5yJoTedPwJ-6TZ9u5HxsQ
Message-ID: <CAMuHMdUxOa2zUP8d7F=dUPP+Lun=_KHeU2N-OqxxknGnn24X0A@mail.gmail.com>
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>, 
 David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

Hi Marek,

On Wed, 31 Dec 2025 at 15:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Currently, in rcar_mipi_dsi_parameters_calc(), the VCLK divider is stored
> in setup_info structure as BIT(divider). The rcar_mipi_dsi_parameters_calc()
> is called at the early beginning of rcar_mipi_dsi_startup() function. Later,
> in the same rcar_mipi_dsi_startup() function, the stored BIT(divider) value
> is passed to __ffs() to calculate back the divider out of the value again.
>
> Factor out VCLK divider calculation into rcar_mipi_dsi_vclk_divider()
> function and call the function from both rcar_mipi_dsi_parameters_calc()
> and rcar_mipi_dsi_startup() to avoid this back and forth BIT() and _ffs()
> and avoid unnecessarily storing the divider value in setup_info at all.
>
> This rework has a slight side-effect, in that it should allow the compiler
> to better evaluate the code and avoid compiler warnings about variable
> value overflows, which can never happen.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512222321.TeY4VbvK-lkp@intel.com/
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -412,18 +427,20 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>
>         fin_rate = clk_get_rate(clk);
>
> +       div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);
> +
>         switch (dsi->info->model) {
>         case RCAR_DSI_V3U:
>         default:
> -               setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
> +               vclk_divider = BIT_U32(div);

BIT_U16(), as vclk_divider is u16?

>                 break;
>
>         case RCAR_DSI_V4H:
> -               setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
> +               vclk_divider = BIT_U32(div + 1);

Likewise.

>                 break;
>         }
>
> -       rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
> +       rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
>
>         /* Find hsfreqrange */
>         setup_info->hsfreq = setup_info->fout * 2;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
