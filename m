Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67392B2C609
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA96110E602;
	Tue, 19 Aug 2025 13:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB6710E602
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:48:23 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-53b09bdcb73so4486384e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755611302; x=1756216102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EeuW/6flpc2I+1hROrA6g3LcPwOigpLFE6GBluj/xEc=;
 b=Sro+6TZ59Nm9lK2zpXlz4QMMzgu3p0S1VmPxn4o1JAzpGD7M8xL4tbuqyFuMC59UYB
 9LIo8Nrnb6K/5hIGvbM4GILlcVKavhDg0ol+9Kgd+UvOfLZiY7kzGpcpKHAv/tlUJ327
 rc4PHJIUGOX5AHkOMC3P7G0H3zAKJXCe0OuAQpoSU2+xuAB+CaLj1XdB7mVbiZol3aM0
 3LxGNYE86aPQbzFVQ8cOGCCiNXfLTJXk3t7vnOnJ0+ynBkWtl2lE66vuxoH6NqvNr2Rw
 eJVh7rfy8ZLokwkXQ1uHox42u3hSJcXkclv85HKGALVDZncGRgrUJ93vFWpzi+akUe8f
 PevQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgCefaGtJ6FgqktBZnCkMcSFJmvQ6+rsglDNgEo8V8iZZfCEk/zmBnh27h5ud0D3mI1uFeqWScMXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOzvRRTWNry0fqj3KY2K5jzb1BFTtkIBLxdkf7vFg366j/dT+Q
 ywt9PsAe0SdOWJ7gc1/AlUiQ5F5yXTH9y9nZzNemmOuDBj5Fmvxqj+2DCZfKSWjN
X-Gm-Gg: ASbGnctdy695526BfJT0OH/xHyP2YmIPMc3fL45seWDlMgf6KopV/GECX3wPQ4wyaZx
 Dy5z5yNDiFB+J1qLgHl5XfvCs9uvPKuDwaLg3H/9D8ADvbcfF9rGXvfvgLCinB9lqDK70MWmskV
 4uxROmTeHKa7EIgQ92MrCRvi/i7m/Fa/UBAHtt4+p491/DQbKwdW9+36nucziUWF/sW4+6jWJRC
 Tng//YPSvJuut2rZX8K0Brz4YKXHv4A0EQ2SnJYoVW4wsBVnKth9gUnqP7VMz44UcS5Pg7DyLlQ
 2EU9GV9+R3lrUQfvn7ANRs5LPH4g0fbLYzWyphmQG+ze88zXPqenwRSPXcvz2YrzPpiN3cejSMD
 5HW/xZyFIhniMCbXzAXV0T5JUMmuUFXbA9gZH16effgQ80szIjgmt/yqyJFco
X-Google-Smtp-Source: AGHT+IGhohJrMo/djbayC2JjjToXfR3YZHDeCVb8fjfUrceRtnWbF+5sEsMb8+Guns1ZYkngtmCGuA==
X-Received: by 2002:a05:6102:c02:b0:4f9:69aa:60d with SMTP id
 ada2fe7eead31-5192b32c41dmr900215137.13.1755611302354; 
 Tue, 19 Aug 2025 06:48:22 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5127f22685dsm2864262137.13.2025.08.19.06.48.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:48:21 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-89018065338so3670377241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX8n6w/Hp33UfWU3GhZMGxJOM6B7/XKMCKegxGWQaqtI2vg8aSMi9tZvtZLE1kgWDd88oAlGlP9IK4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:8343:20b0:4fb:fbdb:283c with SMTP id
 ada2fe7eead31-5192628620bmr577370137.13.1755611300964; Tue, 19 Aug 2025
 06:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:48:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSJO1MOoNS5M2M1Zs=iWmiBbmc8Xc9tMDsXd_kM6bj=Q@mail.gmail.com>
X-Gm-Features: Ac12FXwqlAmfXivz66Sd55gS12RpO00X1Drkt6QaRo03rpO2tR6AE4qWRsOFRew
Message-ID: <CAMuHMdXSJO1MOoNS5M2M1Zs=iWmiBbmc8Xc9tMDsXd_kM6bj=Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
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

Hi all,

On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch series adds DU/DSI clocks and provides support for the
> MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
> series [0], but has now been split into 6 patches due to dependencies
> on the clock driver, making it easier to review and merge.

Thanks for your series!

> Lad Prabhakar (6):
>   clk: renesas: rzv2h-cpg: Add instance field to struct pll
>   clk: renesas: rzv2h-cpg: Add support for DSI clocks
>   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
>   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
>     RZ/V2N
>   drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

On the renesas-clk side, I am (almost) totally happy with this.
Any feedback from the renesas-drm side?
The last patch depends on a header file introduced by the second patch,
so I will need to provide an immutable branch containing the first
two patches (probably/hopefully based on v8).

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
