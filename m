Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51750D1758A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68F310E398;
	Tue, 13 Jan 2026 08:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC4210E398
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:43:41 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id
 ada2fe7eead31-5eef115c781so1959803137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768293820; x=1768898620;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E1oQ15jpRcmphl58tx08AUKGIdjS+7SOa3S3k4/U/kw=;
 b=oGRcj2HDEgTZRJIkU7CkqchEq7ylOxgo3pHAfwivKmILnYujcXsjnywXiYSGko4agH
 1oqVu32DfTIrlUs5mdMlgZowf2Okonpuhz+O3KLAm1uRmqJhV5k1/BaI+0ug1/l+BNFp
 vN61z53IZwChbksnxH0bFp7I8frX3qKlbQxJ/upB85yyIpy260D0d0untG+p2cOnW/rx
 eOY2R7yO/ZIGG+QPkVvy0vQNxdXlh5c/1SA2rPB2Dq2/68B06/Fn7mZ2JRxW/UBLUQAf
 MJcPvZOBAGAQtijZiXPDfSApyAsDnj/Q8IdHti5EtsqXJMoY1VCM9u3BCSxI9eiCVN9M
 EuEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmE6n2x68y4XKr9f1hWnJbztPYfGKQaNCP4DBpRdGSW0tO8F6FCaD4Z1oqLjOEaJ/n5CtrFwcqdcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhQCX6TABQvdSy3pIYtFejBpDdmUi2wUHXQn8WFB3JM1PxYaoo
 Z9SEc9J6mpcJdHBPcD7XtferlOmCX19umfN8gNKX5Ca9uOte7LELCfBktsWZ06HC
X-Gm-Gg: AY/fxX72IjO2B0uoCWuqGDwC/h8hBWgsLgL1yaRKS4UzisUDltpnuvPUTrXw8Yc9P4F
 M2wpnUK6YjdMHJOaeZd22bIduX0IknVHHlPEyQJcXHAxE1lhvIpeP4hR+NTEnc1O6PEu5fU7/xE
 S1Podv1iLKPeVU2ixmvp3Dv8C1efT+OkdvRi/Ecm6sZ5HMwXmpjDaFC88B4W0g6/5KGmIfz+R27
 tL4HagcDtic1eyiEY4e3qT7eq5NeC73U6o89BlyWd714epcqvfYnjzNDy2bzZsEc/pUAs+ouS6K
 8on+TFQcq++Gt0ISc0omyme5E7scTd0NF6int0kbHZsBTib5zKJINjyYmmNMfIh9qSgjsYQq17T
 qc6pGiYZuR9+Y1S0yOW33s3TeGDJZb7fK/8b1EN4s7JSvQQX6xpJh0DAyvFPdfpIoGfiwjIl0GV
 LFEpiT9wtQKGm56JyKdFkIfX/7k8nwI9FX8WBZDEczt/jjO9U6
X-Google-Smtp-Source: AGHT+IFe2Cp7nxG2YC/+e9eqsNbEXDezMSi0NOoy/n4e54B5VnY1s294Mx5zuXm5iB3rDLSTbXQ4bw==
X-Received: by 2002:a67:e704:0:b0:5ea:62ee:1b5b with SMTP id
 ada2fe7eead31-5ecb1e924a9mr7590513137.10.1768293819810; 
 Tue, 13 Jan 2026 00:43:39 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec77064e86sm20034380137.7.2026.01.13.00.43.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 00:43:39 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-93f63d46f34so2242173241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:43:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/BLYBM6EsVZK5vaGTnTcSFU109ZU3+NFcSqwf+AQ8SQIRAG/vt0Ty//jeA/kgSmd2Ou3Xc3R0xrg=@lists.freedesktop.org
X-Received: by 2002:a05:6102:290d:b0:5ef:b3fa:c89a with SMTP id
 ada2fe7eead31-5efb3facb2bmr3596566137.32.1768293818629; Tue, 13 Jan 2026
 00:43:38 -0800 (PST)
MIME-Version: 1.0
References: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
 <20260112174945.GC26365@pendragon.ideasonboard.com>
In-Reply-To: <20260112174945.GC26365@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 09:43:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVH9v_Yn4+UA8TAyPu3st55yWFEPFmA6-ZeGkkxs44O+g@mail.gmail.com>
X-Gm-Features: AZwV_QgQdMvlnOnaTNIaFzNr0xfqYvjdFzLdwf3uc17UQjijTlMqSdyHwcT5Hzk
Message-ID: <CAMuHMdVH9v_Yn4+UA8TAyPu3st55yWFEPFmA6-ZeGkkxs44O+g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: nxp,
 tda998x: Add missing clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org
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

Hi Laurent,

On Mon, 12 Jan 2026 at 18:50, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 12, 2026 at 05:02:40PM +0100, Geert Uytterhoeven wrote:
> > Some TDA998x variants (e.g. TDA19988) have an OSC_IN pin, to connect
> > an external oscillator circuit or clock source.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This fixes "make dtbs_check":
> >
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >
> > This patch can be considered v3 of "[PATCH v2 2/3] [RFC] arm64: dts:
> > renesas: cat874: Drop bogus clocks property"[1], as the pin is actually
> > connected to a clock source on that board.  On BeagleBone Black, it is
> > also connected to a clock source, but not described in DT.
> >
> > The linux driver does not use this clock directly, but I suspect[2] the
> > use of this pin is controlled through the AP_ENA register value, as
> > specified in the second cell of the the audio-ports property.
> >
> > [1] https://lore.kernel.org/97b949cddd7e30e9c05873800330dccd3483b12b.1663165552.git.geert+renesas@glider.be
> > [2] I do not have access to the programming manual.
> > ---
> >  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml        | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > index 3fce9e698ea1d2dd..1205c8e9de329bbc 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > @@ -19,6 +19,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  clocks:
> > +    maxItems: 1
> > +
>
> I wonder if we should add a compatible string for the variants with a
> clock pin, to let drivers manage the clock.

I am not sure if that is necessary, as the clock is optional, and thus
devm_clk_get_optional() can just be added to the driver.

> If the clock does not need to be controlled, an alternative would be to

I think the driver should control the clock. Currently it works by
accident, as on (at least) cat874 and boneblack the external clock is
a fixed clock that is always running.

A simple solution would be to use e.g. devm_clk_get_optional_enabled().
A more complex solution would probably involve using the AP_ENA
register value.  Anyone who has the programming manual for tda998x?

> drop the clocks property from
> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts.

Cfr. my RFC v2 linked above[1] ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
