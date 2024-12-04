Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FDF9E447A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 20:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C3810E556;
	Wed,  4 Dec 2024 19:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373BF10E556
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 19:21:01 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4af1578d288so9963137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 11:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733340059; x=1733944859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=inT4fZZhlTH1i9AqeiQIOnUqbVGNn3i6ScA8tNJSX0o=;
 b=SBW2XjjJ8I0bR7vnGtOXl68OcPIb3yilS7U9N1dqIb5PC+pRyjulTQLIGxliS75CQo
 tT1DzzQu7A1hI+2UEiDwNwPmnM2Ne8OypsKdgRQte02kWni79hKlaZq4XJ+RH59cSsGc
 CZ3kuWltCAUanNTgJ7zkA/sv2/2oHrahfU/xXJGN99GpNsKf5OxA0dA8IdUWAa/N2yxM
 ogejAIFBn8oJnDMAUOYi/+iifCKhprpJfHztlE7kA2XaS2ZuFUuyIbwMP5ii7D7HZ3oI
 llmR3iafPhkON0cib4HKGoKbtbsiB0OXCOjtb17YDZnnouigCcrXM3NjAx+bQ3Q1GFc6
 ZPHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQDm1CUYYLBhbzJOeWj3J7k7pI6gC+QuFZuaBTlfg6HS6RdNYtklyG9S6ENaSnDna8v2Ux5l6hR0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPra6VqH+j8U5pWTZU/wKT0eTYKQ9I7kkR5kyIS4qf6eK30TBH
 DbcShn3wJYSi+wCVMba94lKYggWLegdRvQ8s//ZtAeQavHE4Rs6nedshfWQP
X-Gm-Gg: ASbGncuAg8qhyHOJe/6YpgoQ6uxxZRo284xCX/jCGdeAkoqXw5aSXQOcrlcWraZ5Lqm
 KZE0Pk0Zh3SNyYzlbSdiKfuYsblL0NqunxXF752N+EMVE4HpaykDPrynqN6ikzbeMwsKBe1GNne
 SD+MlPxHXJiAbBfwpwJB9HGRBFNGJH9uiix06CHZkt8268teuk4OksNcKBimXJ3GKCRAu50fC1w
 vyEtY2vDOIAP4eCXehi8HQ0H+VT4pMAsZnw/h3NWAkBwfQaSR2FiFJwBTCKD7HV7YfhN3HgDUfU
 JrrZ93QLonlI
X-Google-Smtp-Source: AGHT+IGDTJOGr6h+daPDAXo1/XQbFA7yn2cS0Pvz3yNS4lHT9JEfDoRQGhDKoiGa2NNdRlMfNoWWuQ==
X-Received: by 2002:a05:6102:512c:b0:4af:3973:6b22 with SMTP id
 ada2fe7eead31-4af97375d68mr10163693137.22.1733340059224; 
 Wed, 04 Dec 2024 11:20:59 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4af59235208sm2517917137.28.2024.12.04.11.20.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 11:20:57 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-4af1578d288so9938137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 11:20:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXVU6IChW+ONUMoydwCOUhpJU0atFYa+0gg5Cj+S6LIka+0aIG5XGI6ZQCCKltk2ZqsObyqpGNMSck=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3054:b0:4a4:8d45:6839 with SMTP id
 ada2fe7eead31-4af97268516mr11708144137.13.1733340056024; Wed, 04 Dec 2024
 11:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com>
 <20241203093703.GL10736@pendragon.ideasonboard.com>
 <b9a07779-34c3-496f-ac04-d7f6e1e61d82@ideasonboard.com>
In-Reply-To: <b9a07779-34c3-496f-ac04-d7f6e1e61d82@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 20:20:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa0frtVLJcoz7QRe=ZHa24K9MxyV5-_Ce4AUJo+LDEGA@mail.gmail.com>
Message-ID: <CAMuHMdWa0frtVLJcoz7QRe=ZHa24K9MxyV5-_Ce4AUJo+LDEGA@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a779h0: Add display support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Tomi,

On Wed, Dec 4, 2024 at 5:04=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 03/12/2024 11:37, Laurent Pinchart wrote:
> > On Tue, Dec 03, 2024 at 10:01:42AM +0200, Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add the device nodes for supporting DU and DSI.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com=
>
> >> ---
> >>   arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 77 +++++++++++++++++++++=
++++++++++
> >>   1 file changed, 77 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/bo=
ot/dts/renesas/r8a779h0.dtsi
> >> index 12d8be3fd579..82df6ee98afb 100644
> >> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> @@ -1828,6 +1828,54 @@ csi41isp1: endpoint {
> >>                      };
> >>              };
> >>
> >> +            fcpvd0: fcp@fea10000 {
> >> +                    compatible =3D "renesas,fcpv";
> >> +                    reg =3D <0 0xfea10000 0 0x200>;
> >> +                    clocks =3D <&cpg CPG_MOD 508>;
> >> +                    power-domains =3D <&sysc R8A779H0_PD_C4>;
> >> +                    resets =3D <&cpg 508>;
> >> +            };
> >> +
> >> +            vspd0: vsp@fea20000 {
> >> +                    compatible =3D "renesas,vsp2";
> >> +                    reg =3D <0 0xfea20000 0 0x8000>;
> >> +                    interrupts =3D <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
> >
> > The documentation lists this interrupt as being LevelSensitive and
> > Negative. I wouldn't expect the VSP to work at all with a wrong polarit=
y
> > in DT, so the level may get inverted somewhere.
>
> Indeed... It's the same for V4H. And it also has IRQ_TYPE_LEVEL_HIGH in
> the dts. I tried changing it to LOW on V4H, but:
>
> genirq: Setting trigger mode 8 for irq 91 failed
> vsp1 fea20000.vsp: failed to request IRQ
>
> I didn't dig further yet.

Yeah, I don't think the GIC supports anything but IRQ_TYPE_LEVEL_HIGH.
Which brings us to the two ISP nodes on R-Car V4H and V4M, both using
IRQ_TYPE_LEVEL_LOW.
Niklas: looks like drivers/media/platform/renesas/rcar-isp.c doesn't
actually use the IRQ, so I guess that's how this could slip in?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
