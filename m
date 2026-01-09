Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C4D0BC57
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 18:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA04910E15D;
	Fri,  9 Jan 2026 17:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1340210E15D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 17:59:27 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-93f69720a7cso2952821241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767981566; x=1768586366;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0SQS2qWJh+KMy2hwJnXtSg0hFzLccGsX0DfWg2V7M8U=;
 b=IiswQeemXy30dNNxzStSqjyiK9WcduB1SwE8WEode0fC/DuNFovvM3Jc2Su2k7xupl
 HoG/TD7Qb5I7uYhM1U/FhLwEl9L+xY5mSGBvq87ix47hWxtVqx5p6d/zU0rWysrqkClu
 4xSNjBsiRi7ezgqEsBpcx5AkzqSeXkgABS+bIZi//b3mrCkwtCODv/IdXP93YA6X+gzB
 YJ/vr4Hjtm5anjtJ4+4dWWdvRIeQLvDlad7ce4hAqFzomhTQa0bC/tT5FFG0f1HVlhxR
 P8o0YHF2ZbnUMVSvG6/MfE3Al/pHZirOcCAtuhdo6D9mZGlsLlw9iUi6U9ZIGlBKJmab
 odpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlpvwqbhyuCiUDL/0WpjuAhOe6H/6Rl0eOULRFsSVjJtLN1HgKuXQ9lqpjh7mFIhi9DOkzahmeXJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfKj6SNKL69INRhtXP9texWIWGjc1CcH+ekdJELoXBjwP12nKE
 4Qi0VcynZ3lDgTXNIEigBXUBY0r9fcOl08OhfsI1oIdNizcB49cIWwAIfKUlR96P
X-Gm-Gg: AY/fxX5NrpaQjfOhNc5AOZXtZVnsmViaWBdONrOlyTjZj71awofGEbl4cEG9ezS8UHh
 5uVsWzYsn0beTi0xrdxnPhlxzAKYbItaOAenUHm0rVKX32z1hvo/hDEzo1CKmFifCMpeNDJqrxf
 59Z+oBY9BZ5JrtAGILTQybrmuepKzPZ+FuSldwDUNwBC5tBX8lygUouVOpPc7/4W0Mi2reEaf8+
 DkMVe350j/0kMs8WKp0xz2fcU4atOH2x2nIPUFsy/bsg0Y2ggDEDaxt4NXbcmmFFNmHu/KcC3yK
 BO0KjyiHFpbNiBeZv6PzvF4jveOKe1onaBEIUQiYXtLvJXWgr2cgpepoboH737/xrZd+ebVpY3y
 AjVEow9aFEE3fs4anyk5bVXaYMvOuy5Y9YnvZkfGPhLbVzBS0nfmcBYHGgYJQNKwTcFl49xLzvF
 cLFH6K7sWT5aivfWsNhuGfX7cbi/6ubZEJbQ9wmMEN/z2l1Ug1
X-Google-Smtp-Source: AGHT+IGos4j/ZOCrYKWHbfBvwlDPnlpHD+rB9Tt5fs5NJft5WLD2Lmco4oy73OlvjojGFy5qPa/EjQ==
X-Received: by 2002:a05:6102:38ca:b0:5db:23d4:feb1 with SMTP id
 ada2fe7eead31-5ecb1e6f496mr4907458137.2.1767981565591; 
 Fri, 09 Jan 2026 09:59:25 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-944124c452asm9471945241.13.2026.01.09.09.59.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 09:59:24 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-94120e0acbeso2702355241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:59:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVBcjU9p1A4q0EIu/8PHQHt9ABnVT6+zkwTwkLuZtunsLPNk3E2UVWjw5BrC3yxLjThtubd6ynSjoE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:c11:b0:5db:1fbc:4462 with SMTP id
 ada2fe7eead31-5ecb6904fc1mr4710351137.31.1767981564119; Fri, 09 Jan 2026
 09:59:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
 <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
 <aWE8ikhsthB_0VQV@tom-desktop>
In-Reply-To: <aWE8ikhsthB_0VQV@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 18:59:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
X-Gm-Features: AZwV_QifanvuoW-_irwZsNnFdMvbLRSaB3vvL73nICwAcFv_-LTwhwad0tEOl0o
Message-ID: <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
Subject: Re: [PATCH 09/22] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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

On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > >
> > > > > To accommodate these differences, a SoC-specific
> > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > RZ/G3E SoC.
> > > > >
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > ---
> > > > >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> > > > >  1 file changed, 101 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > index c20625b8425e..9917b494a9c9 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > @@ -28,6 +28,7 @@ properties:
> > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > >
> > > > >        - enum:
> > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > >
> > > > >    reg:
> > > > > @@ -84,6 +85,13 @@ properties:
> > > > >            - const: pclk
> > > > >            - const: vclk
> > > > >            - const: lpclk
> > > > > +      - items:
> > > > > +          - const: pllrefclk
> > > > > +          - const: aclk
> > > > > +          - const: pclk
> > > > > +          - const: vclk1
> > > > > +          - const: vclk2
> > > > > +          - const: lpclk
> > > >
> > > > Why are you creating completely new lists every time?
> > > >
> > > > No, come with unified approach.
> > >
> > > The intent is not to create a completely new clock list per IP, but to keep a
> > > unified clock definition that can scale with feature differences.
> > >
> > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > DSI input ports.
> > >
> > > Because of this added capability, the hardware naturally introduced an
> > > additional clock.
> > >
> > > Can you please suggest how to handle it?
> >
> > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
>
> Testing a bit your suggestion
> we can do:
>
>   clock-names:
>     oneOf:
>       - items:
>           - const: pllclk
>           - const: sysclk
>           - const: aclk
>           - const: pclk
>           - const: vclk
>           - const: lpclk
>       - minItems: 5
>         items:
>           - const: pllrefclk
>           - const: aclk
>           - const: pclk
>           - const: vclk
>           - const: lpclk
>           - const: vclk2
>
> Then later into the compatible if switch we can do:
>
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,r9a09g047-mipi-dsi
>     then:
>       properties:
>         clocks:
>           items:
>             - description: DSI PLL reference input clock
>             - description: DSI AXI bus clock
>             - description: DSI Register access clock
>             - description: DSI Video clock
>             - description: DSI D-PHY Escape mode transmit clock
>             - description: DSI Video clock (2nd input clock)

All descriptions belong at the top level. Just add the 6th one.

>         clock-names:
>           minItems: 6

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
