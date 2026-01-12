Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53929D1254F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8109410E051;
	Mon, 12 Jan 2026 11:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFA910E051
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:35:29 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-55ab217bb5eso957316e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768217728; x=1768822528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCwZy8nplNPe4SBnl4QbdPCHxaIVjw84NdLZ03XKiqs=;
 b=AU4KOAozcqeCFjBVENrsOnwJSc/CTAkwCOeVYXbYEQSUP8zCq+AJ/DODnn/RkPaoca
 33UIQBeyio751/9F68dQccESxBJ2v6hoaUEZSTgRfM/QLtmgPSPQtl5j7pr9jxE+IgFf
 zfHgA6aIalRU/3E6xDvSkJX8Bt2aYi2HJ8c/3I+bfAEgGkZqpLAvBJEyOeBnJ8Q1BCxB
 tFExwW5CjsW4OP97LgAsEfsLLzVMzwKRh4KE1+0wkJMBzsVsrlyzolZCOxECFWCGiQbr
 IQ/WzXc9vByyhU9gI17zBbZs07GkWOsJS/gIXkidpQjxf5A9f+rWFzF03214FaXVvSxl
 lNlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu7z3dCGDuQk22iJ+QxYhBIoctahSXR4cbPUwARs39f55ZnrSO/GH9ZypbPjdF7q+z1ZWkX8ysqSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbuxok/fusM2UW1u9DJdrnzYlsp2uScdGbLlWomnEYgGqQQKmE
 lFIZX3YJbHmJdAEO0zemdkXq5bAr42rCx2fwqFxT1o3C20J+4v0S5K5nDDGAhsr9
X-Gm-Gg: AY/fxX7UvGCyXIRpF2gLupSYxYe6+RhTEtDlF62LYqJuCibC3G5F5lqIu0lCKHH/XN1
 OIR+dfKOSV3hONPA/Pv1Yrek9xx35flWbDKqCX5CLttGfIHoCZ7NxZDVIgDytT5SZlMzZU0wMGQ
 2xbe1SR//67Hb94fEIzxh0GbghUeOriy5BZ1vovLAfIjY3tgR7QZpgoWXW+hAR5FeDpWt7fh5FV
 VeWEWgyltgoZfrJ5xgeHBBXq14yhRnQM3UYyddGmsyj7x0Nt4HDdHXMOcwphmYceWsMlLoFXuNJ
 8iiNXeLUCllhXKNOSROh6vnYCfShToFmor9x3fIC0qTN37U5yGio2RsFsP5wZBplRdzz8KiDKi7
 WHWbwOjQz4smJJPZxZbTseKUetKAi6fkERHcogMD+dm6cvoXx04hjF86RTNJJDgyKlcbfKH9YyK
 hTZ6yUW7TR7VM4TWRXYfjZyC9qCRyV2eoL5JIe7WVHGgv9WWrf
X-Google-Smtp-Source: AGHT+IH/gIcIUsd+F5lbE5ys0KnyKq+pyrvp6nTkbBb47spTIzixawWsDyLbr7XW+Ljx5xM6OU05BQ==
X-Received: by 2002:a05:6122:9003:b0:54c:da0:f711 with SMTP id
 71dfb90a1353d-56347d6e767mr5387210e0c.7.1768217727978; 
 Mon, 12 Jan 2026 03:35:27 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-563618ff8d5sm10802420e0c.7.2026.01.12.03.35.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:35:26 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-93f63d46f34so1902371241.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:35:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXMCtZ5jqBot86IMgRpA5zpVHGen5e5o8sP4GDWPtplo/Ar3huJcEn6JHSUsYY9O1tD6mAFFcs/xo4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:6058:b0:5ec:c528:4dd3 with SMTP id
 ada2fe7eead31-5ecc5284f7amr6284383137.42.1768217726081; Mon, 12 Jan 2026
 03:35:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
 <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
 <aWE8ikhsthB_0VQV@tom-desktop>
 <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
 <aWTYS9BjWn2bY5Lz@tom-desktop>
In-Reply-To: <aWTYS9BjWn2bY5Lz@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 12:35:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
X-Gm-Features: AZwV_QgqmWBfwmu_212Rxj3vjBBvkBDNMwpqCH0FZHQJKUGeDVAXwigjiGPPHlA
Message-ID: <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
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

On Mon, 12 Jan 2026 at 12:18, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 06:59:12PM +0100, Geert Uytterhoeven wrote:
> > On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > > > >
> > > > > > > To accommodate these differences, a SoC-specific
> > > > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > > > RZ/G3E SoC.
> > > > > > >
> > > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > @@ -28,6 +28,7 @@ properties:
> > > > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > > > >
> > > > > > >        - enum:
> > > > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > > > >
> > > > > > >    reg:
> > > > > > > @@ -84,6 +85,13 @@ properties:
> > > > > > >            - const: pclk
> > > > > > >            - const: vclk
> > > > > > >            - const: lpclk
> > > > > > > +      - items:
> > > > > > > +          - const: pllrefclk
> > > > > > > +          - const: aclk
> > > > > > > +          - const: pclk
> > > > > > > +          - const: vclk1
> > > > > > > +          - const: vclk2
> > > > > > > +          - const: lpclk
> > > > > >
> > > > > > Why are you creating completely new lists every time?
> > > > > >
> > > > > > No, come with unified approach.
> > > > >
> > > > > The intent is not to create a completely new clock list per IP, but to keep a
> > > > > unified clock definition that can scale with feature differences.
> > > > >
> > > > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > > > DSI input ports.
> > > > >
> > > > > Because of this added capability, the hardware naturally introduced an
> > > > > additional clock.
> > > > >
> > > > > Can you please suggest how to handle it?
> > > >
> > > > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > > > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
> > >
> > > Testing a bit your suggestion
> > > we can do:
> > >
> > >   clock-names:
> > >     oneOf:
> > >       - items:
> > >           - const: pllclk
> > >           - const: sysclk
> > >           - const: aclk
> > >           - const: pclk
> > >           - const: vclk
> > >           - const: lpclk
> > >       - minItems: 5
> > >         items:
> > >           - const: pllrefclk
> > >           - const: aclk
> > >           - const: pclk
> > >           - const: vclk
> > >           - const: lpclk
> > >           - const: vclk2
> > >
> > > Then later into the compatible if switch we can do:
> > >
> > >
> > >   - if:
> > >       properties:
> > >         compatible:
> > >           contains:
> > >             const: renesas,r9a09g047-mipi-dsi
> > >     then:
> > >       properties:
> > >         clocks:
> > >           items:
> > >             - description: DSI PLL reference input clock
> > >             - description: DSI AXI bus clock
> > >             - description: DSI Register access clock
> > >             - description: DSI Video clock
> > >             - description: DSI D-PHY Escape mode transmit clock
> > >             - description: DSI Video clock (2nd input clock)
> >
> > All descriptions belong at the top level. Just add the 6th one.
>
> Please correct me if I'm wrong but if we move up:
>
>         - description: DSI Video clock (2nd input clock)
>
> To the top level description we will have 6 clocks for G3E and 6 for
> RZ/G2L. With that I think dt_binding_check will fail ("is valid under
> each of") because of the oneOf.

RZ/G2L and RZ/V2H need "maxItems: 5" in their if-sections.

> > >         clock-names:
> > >           minItems: 6
> >
> > Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
