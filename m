Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9848D0B31C
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD77B10E05F;
	Fri,  9 Jan 2026 16:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271A210E05F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:22:17 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-93f5905e60eso2681800241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 08:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767975736; x=1768580536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZubT71CRwOcTCIzcYS6e5AdXUs3dXA6+1fPYpwtqxhQ=;
 b=Csy+Ect3eVuwqu/DhPNi9W/ZaYjfvCVnIVjX81qpzjh+RSmBbSDm53GkVCXx+/K3xJ
 BmfhICmgggQi0RT6hzhUt2BHpFjjWWXn2OcEOZVzOovdApFtqkhlC4RqBLkr0hE+U9ks
 s/0v67XstXZKFAasMcx5pvz5OlODKxByQj2+VSKVNVVoQsy2TmLiUMNpUd/CFeaSrp9W
 S5TrWEynz+/82SOMxSn76eyCmbIjcykquzymziM1rlq7YkzcwRb9CZ94NESGoFderrMO
 g8QMNlfJZj6HU1a43+Ez7pDb0fGBTV50QLrvQaflPbhwg7ET0NfSwI+L1jatSeabp3ZM
 y0aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaV2nchCBAwQ8weHDx1PFnLc3bTP+SxApl1Bx5zvY2Q8Ev3EHkLHVTWopVz16SaeRG0e3dPqWwjiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqxVxBv/MJ73AXJArSaQsKPSbVLHR3RV2Qz/E53ADB60ioLifb
 tNUKoEnhmPS0UnR5FctDWxquUXG1MuQgsk9Jov4uFoBh5Mdd8ofAAjZRTlsYzWeQ
X-Gm-Gg: AY/fxX7ArQj3/Ivutz0S9GxAC078tzRybSlUFu7h6QBp949rE19NIIq3StCahaTgD6m
 G/7V4IbXQ4m9x2SpwiOZ7iXR/Lyjp8El3EJNXZZD0kXaPHMaFgxq9Pufp3BLRr2IgSdmnvSDFBq
 VsCFG6QNurKXHRK7gUxhuEZOZFv8tlYW9qItqibtWxF/RLSD88/hvNR3PeM8+yXjwJ71Sz5kuU6
 ycIjL8+Pb0h6fciUSmejCEOSmuQBmxh4KMeuUg81YdyAnSeOxCa1jgqkrCIqO/qYUcmbPaiRaP0
 KUMj/QH/Pqxx5deDGSu8ItGvffaLKEhPajnC+7GZTX8fkqE5njGVPq/17PLokcfA0l39u487lmO
 3qzBQwTlteM5def0mzx1O+gcXA/Wpbrekl4LwGVxnG1mBKLOrEdCtFbgeekmLP0UD1nwRCnSBUS
 YeTTOLFvdd44DF91IaofZDH7RCcTpdbzp+XO+HJn/M6dFinh+KFJPI
X-Google-Smtp-Source: AGHT+IH16ET5GON1Rx/KmgGQdKu8qikrS6N8AcLit1BK7UNE+4aq6dXr/LQktI4xW/F+bkFJCyqlfw==
X-Received: by 2002:a05:6102:32c5:b0:5ef:a697:dc02 with SMTP id
 ada2fe7eead31-5efa697df47mr555451137.11.1767975735869; 
 Fri, 09 Jan 2026 08:22:15 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ed082abc75sm8563739137.1.2026.01.09.08.22.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 08:22:14 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-559f4801609so1736759e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 08:22:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJa956nCSeDVnxqbSS4jAY2cvWe2wCHNIEXMrmOgqpLfIPOqf7kj3bPig4trGY5dnkPoJvivuuSK4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:161e:b0:5e5:5ed7:60af with SMTP id
 ada2fe7eead31-5ecb90b08d7mr4011067137.38.1767975733803; Fri, 09 Jan 2026
 08:22:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
 <aWEnfJonv4egKhXo@tom-desktop>
In-Reply-To: <aWEnfJonv4egKhXo@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 17:22:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
X-Gm-Features: AZwV_QiF7IGNds3nroCU8C4Y7nT5yUExjbtpCqViVpA_Mph5jGaVHbhMlWChdXg
Message-ID: <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
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

On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > or vclk2 as DSI Video clock, depending on the selected port.
> > >
> > > To accommodate these differences, a SoC-specific
> > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > RZ/G3E SoC.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> > >  1 file changed, 101 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > index c20625b8425e..9917b494a9c9 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > @@ -28,6 +28,7 @@ properties:
> > >            - const: renesas,r9a09g057-mipi-dsi
> > >
> > >        - enum:
> > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > >
> > >    reg:
> > > @@ -84,6 +85,13 @@ properties:
> > >            - const: pclk
> > >            - const: vclk
> > >            - const: lpclk
> > > +      - items:
> > > +          - const: pllrefclk
> > > +          - const: aclk
> > > +          - const: pclk
> > > +          - const: vclk1
> > > +          - const: vclk2
> > > +          - const: lpclk
> >
> > Why are you creating completely new lists every time?
> >
> > No, come with unified approach.
>
> The intent is not to create a completely new clock list per IP, but to keep a
> unified clock definition that can scale with feature differences.
>
> The previous IP supports a single DSI input port, whereas this IP supports two
> DSI input ports.
>
> Because of this added capability, the hardware naturally introduced an
> additional clock.
>
> Can you please suggest how to handle it?

Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
