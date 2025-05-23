Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414AAC25E2
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 17:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C56E10E814;
	Fri, 23 May 2025 15:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B33210E814
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 15:04:41 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7c54b651310so1319573785a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 08:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748012677; x=1748617477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z7q5VOWPHTLyk2rAGQ6nFq+sdmA8F0+9sYOybYBqTFg=;
 b=AlS3WwwGdboiph/EBwL7f7Oue/L2raVk3aHsKkfH1L7gVTWXXM4B2ddkfCB7zHdNZ9
 gZ62jWVqCVliUD2i6tqXdArirzcCPyOw85x7wRMD+vHgJnwHZLsykFQQ8g34sdW41nJG
 d2SdCJxy9NxDl5a2Nx9LWvKR7bHWoKFGJuaXTrINHdm84lB7RVipuU3PfwZGP0/DW8mj
 +3TwoGSpaGufn3qXKVAxg+IM1B0LBQqpd4Hjqj7gRpYo+pnqZQMDLGK3/2ywq37Gz0h6
 IkAOH1qXBu05YsfV2CgBPZ5SS5OD3Mh81EvA3EgfBA2P/U8tSovvVLGViSy4tFbU0f8q
 zW5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8vuYyfmgT4hYZe2zPIR2MX9rfHU4Wv3an44uqMS7E3/WiwzL8ADOu/nbPs2mY9xpP/XGBe7Re+xo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx77brZwK7elIAaQva6OxAbRVtvkNqryTkKx5QVg9zj/UJ0n62i
 UE1vvxy+/7aGTMkyIiGdAZz54LlU8MiWK+8UHLfzX6yzblxENZHEv091C+46GPDDhzc=
X-Gm-Gg: ASbGncsG3qSfD4yYimCH5sGUJlQyM9EocDlJ/m1KoTWf92cR6IJNVN0G75bnLKr45d5
 V9+S1AH7IzH8zXHMuMaYwqIQw5JmsRBrVSTzYzEwh/iboi45AdzHGnvuelBLmY/5mf8F8NtKZ6N
 niMwMsdWyaYXQFCAQK8WMFoIq9AAy088M/ZMzne3btB2JS+IyUHKLFHuFD5d68R+ijz/BpDzfO6
 eetSMcOc2dNY0p2dyka77VZ8QSTCdrpTob/MbfTrlxWnDg3ZaBkYEEIWJUei42vfUiTC3F3KMTd
 1eF/tL8K/Zft2c+r4D6Ps1Z+W61cwwo0RlPtmpU01OCM1P2ZYpFJ0iU75VLgRYT46LiKUho/3Ni
 Zmy0g6KwrAJgao9ssZA8yorCqE9Yy
X-Google-Smtp-Source: AGHT+IHpxjx5UFoUtUoD43pN2juSSGF8GI5Ztc48blOBx3oA5RFyK6m0v74F2gZebAkv/0jjuAUhMA==
X-Received: by 2002:a05:620a:280d:b0:7c5:4c49:769c with SMTP id
 af79cd13be357-7cd47effeccmr4510970185a.6.1748012676490; 
 Fri, 23 May 2025 08:04:36 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
 [209.85.222.175]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467dab1asm1190383985a.44.2025.05.23.08.04.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 08:04:36 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7caea4bc9e9so1479952785a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 08:04:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ+WlAQELx4ZHWjgbhSVgmZw6z+Q1B8WKoDj1M0dg/KzsufXk18OPRePIl73ZxXhsxF/PBzckv1C4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3f06:b0:4e2:bacd:9f02 with SMTP id
 ada2fe7eead31-4e2bacda0c0mr10649290137.16.1748012320563; Fri, 23 May 2025
 07:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512184302.241417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 16:58:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU__dxi4wvS3ikBQefM7uwWWK0bCcHv=TL-Td678pEi9Q@mail.gmail.com>
X-Gm-Features: AX0GCFt82q4LbUN8wOO1SOIRH6DyQiAH55lXfwgWzPo4hKmY_3p-dAhsTJpdcck
Message-ID: <CAMuHMdU__dxi4wvS3ikBQefM7uwWWK0bCcHv=TL-Td678pEi9Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/V2H(P) SoC
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
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that of
> the RZ/G2L SoC. While the LINK registers are the same for both SoCs, the
> D-PHY registers differ. Additionally, the number of resets for DSI on
> RZ/V2H(P) is two compared to three on the RZ/G2L.
>
> To accommodate these differences, a SoC-specific
> `renesas,r9a09g057-mipi-dsi` compatible string has been added for the
> RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -14,16 +14,17 @@ description: |
>    RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
>    up to four data lanes.
>
> -allOf:
> -  - $ref: /schemas/display/dsi-controller.yaml#
> -
>  properties:
>    compatible:
> -    items:
> +    oneOf:
>        - enum:
> -          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> -          - renesas,r9a07g054-mipi-dsi # RZ/V2L
> -      - const: renesas,rzg2l-mipi-dsi
> +          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)

Nit: I would add the new entry after all the old entries, to preserve
sort order (by part number).

> +
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> +              - renesas,r9a07g054-mipi-dsi # RZ/V2L
> +          - const: renesas,rzg2l-mipi-dsi
>
>    reg:
>      maxItems: 1

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
