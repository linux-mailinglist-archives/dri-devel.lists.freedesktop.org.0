Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F89B2C4F0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA3E10E5EF;
	Tue, 19 Aug 2025 13:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6361B10E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:14:43 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-53b173841deso3954390e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755609282; x=1756214082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w8Kx5cGiGpdinLDvM81MdLwujJYEv4s4yCGfX3+iapQ=;
 b=rltC24AQfg4odV2PKjw/3Q2slLh9etReyz2b46v/q2aVdQcqSUD4m16JXe6qkqYSxj
 zEZXMJS/Xa29vkhWAzzLl+EsZfEq6Qt9x7qgZG9Z+xFwGo7EaLnc7KOb5aIB4/7jinJj
 AKr9E2tKBTtzKqyvj486oPCz/SnvhLWdLrypTvya4pHC0NECXBtMQ7FLhtnYsC0yuNvb
 rIuO7jwRhrptAeohBvIs/px+1szCVijd1wlwtenwkFsuO5FwuykW4wOAbdt/XkG3oPYg
 AQeltewbOwUNBVRxQsDNKoSAJ5mZeTQNHEe88+jh44H7sdTkg0Unt4lsBEgOl9WXLbPy
 +cgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp1YIVIY3ZavxSCaAsqJPwEm68e9Sg9BpoSl4BDldRkTZWqEQ9wl5OgQEi1rxar9sCyjlpGDggSv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpv7juZbfoCcIxfhYFrAYNo9+VJp59fQddNdFz6bx9MnqQHL2z
 iSRMFwoL0LcSPOnY6uEZ0QbuDA4pZDfSf2uieRc49Wb6bskXL1bP/28HeZGata90
X-Gm-Gg: ASbGncv0y0KAcKL93TSP4fJaiy/0hxZtbWIc18waeeLFURp2kK0xkSJBuoks0/FE3X7
 OExKIK/uxTTRAmrAZNYdC9iAuI0P79MpmoBsQydmOQfyRxt+sURRk0+LRF1aDGP1nACdh9X3bhJ
 /OgVTxZMKz/JJb/am5LCMrnAsrB7W+Nf8BRNMZgyEBjOqwpXPE8pI0kwPnDMI+4PTJgNRAU00xP
 w+8HcHMmhImSnicx3k4nNXh6MI8qjF4KfoIgVYfAhO7tVuSJGiqkpPzGvmNR5CTNtR1RqWUWltf
 TdQjk2za6aeooxikwP+dAPVs6J7+5Ex/Hc+C5jUhg1bzvD5H9PA62Svh4lD/XFFkmLbg8FT/d5U
 MX13yDvUXv3fIBh8MBe85mQREVXloHSlsnqSnqOu0BuzkV8JEbpxOGxPyhV09hZlG2eY98aI=
X-Google-Smtp-Source: AGHT+IEyMKdTIlue4ANDC2lOnML/KTOUoQLkP9LA3NV0AjA+0rLR9PoyHEh0QiM+SH46WJyoS8JZog==
X-Received: by 2002:a05:6122:3c51:b0:539:5cff:8070 with SMTP id
 71dfb90a1353d-53b5d35bc75mr976893e0c.9.1755609282312; 
 Tue, 19 Aug 2025 06:14:42 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53b2beff1c1sm2775085e0c.24.2025.08.19.06.14.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:14:41 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-50f85dab6e7so2281042137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:14:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGP+GD04bpcN2S4hRdzS87qo8rBQU0vDeScCnkPQ+Y506xkrco3Zh6KCBZKDKXCLtFnGwURaDtOng=@lists.freedesktop.org
X-Received: by 2002:a05:6102:6cc:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-51922118868mr745706137.9.1755609280511; Tue, 19 Aug 2025
 06:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:14:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5Rk2ppHwKZLgjektLCVShkoh=ESoSt9PY6jcp-uEukQ@mail.gmail.com>
X-Gm-Features: Ac12FXz6ckZqsKpNRXFU7y3mbLg1_W5_Ln9ZIyfl6OPClvcylW7dhk8Lvat-Pt0
Message-ID: <CAMuHMdV5Rk2ppHwKZLgjektLCVShkoh=ESoSt9PY6jcp-uEukQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] clk: renesas: r9a09g057: Add clock and reset
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

On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the DSI and LCDC peripherals.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
