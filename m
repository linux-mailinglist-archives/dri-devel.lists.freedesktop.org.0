Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820CA81F81
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AF110E75F;
	Wed,  9 Apr 2025 08:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4DC10E75F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 08:15:59 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5f0c8448f99so9375061a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 01:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744186557; x=1744791357;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8wlwAvEfKUmPWwXyFA3bJ/dUP5Ua3CH+QEIQ4JbmjA=;
 b=B8L/CEBtCNaNwEhjaSsTAQSGJFZQvTM04qbzLZu4Ym+LcJUQI2nWN7PLrxgD3Lo0ze
 1wg1/K/j/iS6k4ruXqb3CSkPeWkTn7TlzhJWjisvRcgie93hI4AYxhE5uP0ZagiVtWic
 59oIDfE61N+9RfbOa6Xfs6XDxc0Ujr5av3Ie0dLOhikHe/7LzmB1JxJEPA1kmYgPMBcE
 uOJHZWVrx7+Y3NdIgu5rIRdNmdxGbPw3ki9+pAikNIxhw26sAPbvFUcVByiYrOqWmG5h
 JraJD/GfxEC6CN4+sMxzJGFb3pI81FfS5JjmOBpu49N7ZUGoSKsexFhV9wrpEVUAd/pB
 WIkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXokfmHs4emIcIBxC8tTA4Id5OGJkOLgrUNbjGIn10CYJGXNg2PlUcQrmfBiFLDkQOeXqzdxS7Z6Vw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMw1cz6rvDdzRTDa7CWdaTp0hvDTD97oyx6Dkp8e4wHzu3NSPr
 nLKE1MCK6lOHr6IdLAh6nNC8XhijgZ7t7KhXeZ3ZC49hjqTWoRg0HtErsOW2wK8=
X-Gm-Gg: ASbGncvN+mvJt0iyOR/ndmTI0BaeJcSrgS0qUyoTVGiCj8yRYuR9eU7YD5/YRLvTN2i
 NFT6E2N4dGFUIx8LInpMbkb4bhMV0X1ZsxBSPRP04C0fs1u44h48UQYDv/jmL81ll50sm5neNSM
 7MlF8ZSjs8DOL5yTZYMpF4JpbITBNJp/y9M6IzDJM9Beqcf0s5JTZ1je7/SqEx/yX9zoLhqifdP
 KYqxo+3QchSLP9l0ImeqwooWv7XVu8iBf2RZ4GM4BtJYIL6YoLpCvthj99gbCaCAsUAeYeGbI/4
 pCkt/YXHM1C9brcwt9o7pEDnytgrtg+RYqLY7i/PCyWlXTQ4razgax+PEpFSy8eyObnpmmcOyIN
 LP9M=
X-Google-Smtp-Source: AGHT+IFB5LgWSDgxWc9rXapnZyxykssGDu/pvwwJhDWi3H/6wJcEOpEVP7LJig14XDIFdMR3GbV3Og==
X-Received: by 2002:a05:6402:3487:b0:5e5:d9e5:c4d7 with SMTP id
 4fb4d7f45d1cf-5f2f86d8153mr1350976a12.28.1744186556176; 
 Wed, 09 Apr 2025 01:15:56 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f2fbd1808csm408549a12.63.2025.04.09.01.15.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 01:15:54 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so10921989a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 01:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtGSso62pfTxPIM2vDvXIHNKVS2ellokoLGPCTO1X8fCm4b/9bl/zhcquNh9c2+9FZe9QLD1QiBkE=@lists.freedesktop.org
X-Received: by 2002:a17:907:2ce2:b0:ac3:878d:662 with SMTP id
 a640c23a62f3a-aca9d5d9738mr124075466b.9.1744186554430; Wed, 09 Apr 2025
 01:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 10:15:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVAxaLZJ4y0AWKrLobp55n5NPqQgEtHK_d1DDUM1LAkDw@mail.gmail.com>
X-Gm-Features: ATxdqUFduY_Nysj8xnNB1omwilrHwMeJqiWwK4ZmMj1fQC_W_1_6CC0mYuD3HIA
Message-ID: <CAMuHMdVAxaLZJ4y0AWKrLobp55n5NPqQgEtHK_d1DDUM1LAkDw@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
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
> Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> high accuracy.
>
> These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -33,7 +33,7 @@
>  struct rzg2l_mipi_dsi;
>
>  struct rzg2l_mipi_dsi_hw_info {
> -       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);

Due to the lack of capitalization of the "hz" part, it is not clear
that the "m" stands for "milli" instead of "mega".
Perhaps hsfreq_mHz or hsfreq_millihz?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
