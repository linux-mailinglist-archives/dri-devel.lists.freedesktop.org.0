Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE4D12D47
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 14:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5046510E3D0;
	Mon, 12 Jan 2026 13:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF1210E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 13:34:07 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-5eea2b345fbso1349083137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 05:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768224846; x=1768829646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mw1aKltaSTC5rf8Ujw6cZSHrtgE4MMBQjtQaAe26qy0=;
 b=MOZS2GByH2gJYaeSrfl8Y+rYTaMtHOvnz08rvkWKxdd8b49PRqw5/y5b17uMEROJfK
 uP5ECzvZWtzgIkmuErSoUWKqJNakk76Cl8mDvjLNUa9cHBxa06/RCGVD/TUjEyhStlkT
 oq+Vd9G5KnLE90bGHx63Sw4efk8XN2ZZg5+efE5NCwfVQ72t+eX4YYW1+XcW5flggMIJ
 4P8dsdNGDwieVpsoUZ4mrcY6uWOMrtZx6SrLYx8T1ONg1MT0biaYd7OzLlnHOsdCDK1M
 ZW48LTKWsmSbmFVB28/s5im6uadjzUswFMYQaMd49B2IL+HIZ1QHIv/Npt2ZcInEWZbV
 rpZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrqo+ld40/TPGOHsnGXHJpvA1HFL2aQ1BlqyyW5hxcf+4eB19BdXKN9miF2R0FFkVNfPsrAY31Gsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8U7AVR+YsO7iU0z2MNvAMLS3vlpHAZcyzCo+T3Ku0dUxFlaAG
 V8WdZg3tIh3vU16y+F/iuQg3NIBfRPHTfHQn+ANBpEl1jlvlRtqP+LM19yvYcurl
X-Gm-Gg: AY/fxX41GQcdApIEFtv63vX5lI5y4hXbPwwWG4Tp3bST8iUJYIC/wVw3UFBfMKDr56e
 YtyV1JEw/VEl2zvTT/sLWjfT/yZnQhfNZeO7aBD1839hRxxQafXnXTwa1pjg/MA1k8CPQzTcE7z
 oxMniqB5qh1kFvQhISqaXy0SvnKO2HOFX/uv0iGgWHF3O8gP5twSkNkXtZWu3nXNzVnHEapkthI
 ZMMU67M7MKnHQ8VT6TuxpsLKDcevn2PDcN8pcY3yi95ZyatSzUeO60ZMhCmYQh3wymQn8xEcryL
 aorCOognQrWXaSP4FK5hjKmCj3y8kcG5wQY+iOo4MI9vc8fcoB1T66nJ1itWAdj6nl1skfzM2kc
 RUyUrpcmTR3KKJw194qinGA36qr/XvdZThGFUglNKlsjPOldac3ASuKzrtXhplVFhT9sxYrG+Wx
 SshE3YFIRFBBRUoHmMW02OUFFTvZ5XyWy86/aOlUe1BuBLE4m7UJO4Hz904k8=
X-Google-Smtp-Source: AGHT+IFibrk3jV9kYvoWaHLB7dcjxEYUubBnm88nln1zcvJfUxEygK8MijVjIB2UR1OnaOWHM2Y2/w==
X-Received: by 2002:a05:6102:3908:b0:5ee:a6f8:f925 with SMTP id
 ada2fe7eead31-5eea6f90e16mr4505814137.8.1768224845897; 
 Mon, 12 Jan 2026 05:34:05 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ef15be79c6sm10147573137.12.2026.01.12.05.34.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 05:34:05 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-5eeaae02888so1000213137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 05:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVrFZcTgypPYyRxi1J8UXYYwKv6KY7MiJeVXnqFrpVFQZx89SPAnHb+ADgqz/Kn5XIL2m0D1ENhbmM=@lists.freedesktop.org
X-Received: by 2002:a67:e716:0:b0:5db:f615:1819 with SMTP id
 ada2fe7eead31-5ecb5cbba6cmr5928342137.3.1768224845221; Mon, 12 Jan 2026
 05:34:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
 <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
 <aWE8ikhsthB_0VQV@tom-desktop>
 <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
 <aWTYS9BjWn2bY5Lz@tom-desktop>
 <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
 <aWTiKQFBZT4hpaG_@tom-desktop>
In-Reply-To: <aWTiKQFBZT4hpaG_@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 14:33:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4hkcU6v4v9kSddyOftZnExZ6B5Q9DykRig1rosDT8bQ@mail.gmail.com>
X-Gm-Features: AZwV_QipiAWkh5RwyVe2WxFleu8eNUYqxvAWPYb1wspLI2J-Wc5fAFHMdZBQFTI
Message-ID: <CAMuHMdV4hkcU6v4v9kSddyOftZnExZ6B5Q9DykRig1rosDT8bQ@mail.gmail.com>
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

On Mon, 12 Jan 2026 at 13:00, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Mon, Jan 12, 2026 at 12:35:15PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 12 Jan 2026 at 12:18, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Fri, Jan 09, 2026 at 06:59:12PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
> > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > > > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > > > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > > > > > >
> > > > > > > > > To accommodate these differences, a SoC-specific
> > > > > > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > > > > > RZ/G3E SoC.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > > > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > > > @@ -28,6 +28,7 @@ properties:
> > > > > > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > > > > > >
> > > > > > > > >        - enum:
> > > > > > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > > > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > > > > > >
> > > > > > > > >    reg:
> > > > > > > > > @@ -84,6 +85,13 @@ properties:
> > > > > > > > >            - const: pclk
> > > > > > > > >            - const: vclk
> > > > > > > > >            - const: lpclk
> > > > > > > > > +      - items:
> > > > > > > > > +          - const: pllrefclk
> > > > > > > > > +          - const: aclk
> > > > > > > > > +          - const: pclk
> > > > > > > > > +          - const: vclk1
> > > > > > > > > +          - const: vclk2
> > > > > > > > > +          - const: lpclk
> > > > > > > >
> > > > > > > > Why are you creating completely new lists every time?
> > > > > > > >
> > > > > > > > No, come with unified approach.
> > > > > > >
> > > > > > > The intent is not to create a completely new clock list per IP, but to keep a
> > > > > > > unified clock definition that can scale with feature differences.
> > > > > > >
> > > > > > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > > > > > DSI input ports.
> > > > > > >
> > > > > > > Because of this added capability, the hardware naturally introduced an
> > > > > > > additional clock.
> > > > > > >
> > > > > > > Can you please suggest how to handle it?
> > > > > >
> > > > > > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > > > > > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
> > > > >
> > > > > Testing a bit your suggestion
> > > > > we can do:
> > > > >
> > > > >   clock-names:
> > > > >     oneOf:
> > > > >       - items:
> > > > >           - const: pllclk
> > > > >           - const: sysclk
> > > > >           - const: aclk
> > > > >           - const: pclk
> > > > >           - const: vclk
> > > > >           - const: lpclk
> > > > >       - minItems: 5
> > > > >         items:
> > > > >           - const: pllrefclk
> > > > >           - const: aclk
> > > > >           - const: pclk
> > > > >           - const: vclk
> > > > >           - const: lpclk
> > > > >           - const: vclk2
> > > > >
> > > > > Then later into the compatible if switch we can do:
> > > > >
> > > > >
> > > > >   - if:
> > > > >       properties:
> > > > >         compatible:
> > > > >           contains:
> > > > >             const: renesas,r9a09g047-mipi-dsi
> > > > >     then:
> > > > >       properties:
> > > > >         clocks:
> > > > >           items:
> > > > >             - description: DSI PLL reference input clock
> > > > >             - description: DSI AXI bus clock
> > > > >             - description: DSI Register access clock
> > > > >             - description: DSI Video clock
> > > > >             - description: DSI D-PHY Escape mode transmit clock
> > > > >             - description: DSI Video clock (2nd input clock)
> > > >
> > > > All descriptions belong at the top level. Just add the 6th one.
> > >
> > > Please correct me if I'm wrong but if we move up:
> > >
> > >         - description: DSI Video clock (2nd input clock)
> > >
> > > To the top level description we will have 6 clocks for G3E and 6 for
> > > RZ/G2L. With that I think dt_binding_check will fail ("is valid under
> > > each of") because of the oneOf.
> >
> > RZ/G2L and RZ/V2H need "maxItems: 5" in their if-sections.
>
> RZ/V2H -> maxItems: 5 is fine.
> RZ/G2L -> needs 6 clocks no?
>
> Please correct me if I'm wrong.

Sorry, RZ/G2L indeed has 6 clocks, as it has sysclk.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
