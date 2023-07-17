Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC8F7565A1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91FA10E257;
	Mon, 17 Jul 2023 13:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C2210E257
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 13:58:05 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-cada5e4e3f6so4585306276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689602284; x=1692194284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6GY8g2XJYhobD5XMmXXGSiDcdH93n2WuBZ9x5pzjlb0=;
 b=l81gsYJ4y0sZhCUcxMEVB+MkmfkPGYp9y70u2DOOE6++5lQr8Mqp5LG/FxyKlytxQm
 PBSDJofR5qzUHKdW5JzNoiCJHa7afh2RD2tLCZwyV35Wn5DPW+SW4XKVgfnxUewq0kCh
 uvGRYz/nmEytFNSgCkh2wwBjLcfgWsVWCMevQ51ITnvfZnInmQqMeqkOLum1T5AxJ1ac
 DfSJnJBjcc/c8kIVJkRsXAd7ix9jR6EGrUcHx6gNwAJWBMv/WhxSTU2zd8jZaB+9CqMD
 LhQPT5np71Gr1J0wtcfSSW1CV/ZX/1XWUmMXVCCRYd1mfesCspE5ivuaW0QbQKVwy13M
 Yh9Q==
X-Gm-Message-State: ABy/qLZb/LWFTS3La/fJ7SO2JgR/Qmh4HdbA4l2Fiw3naHyd8tkzN2VN
 DPV7acWgJBqxV5hNr+7fGCP9T1SDJrnY9g==
X-Google-Smtp-Source: APBJJlEfI5tqeV1U9GrYQR5pExTtgM+baFIPAqlymIRxd2MxXRzcAdL/HmxIqbhQUyUMOhzZY8Ac2g==
X-Received: by 2002:a25:aa0d:0:b0:c4c:ec2c:3c95 with SMTP id
 s13-20020a25aa0d000000b00c4cec2c3c95mr11512580ybi.4.1689602284391; 
 Mon, 17 Jul 2023 06:58:04 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 b8-20020a252e48000000b00c61af359b15sm2885284ybn.43.2023.07.17.06.58.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 06:58:03 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-ca3cc52ee62so4604997276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:58:03 -0700 (PDT)
X-Received: by 2002:a25:2105:0:b0:c14:68fd:6e30 with SMTP id
 h5-20020a252105000000b00c1468fd6e30mr9475180ybh.16.1689602283054; Mon, 17 Jul
 2023 06:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2259ff548f007afcb5a315a4c95c83a0ee4b7e03.1687423204.git.geert+renesas@glider.be>
 <20230622145213.GA1678457-robh@kernel.org>
In-Reply-To: <20230622145213.GA1678457-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 15:57:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1Y9jkKv+cOAzs6YibkNoTrvY-qDY4FOzgrSyA4pHynQ@mail.gmail.com>
Message-ID: <CAMuHMdX1Y9jkKv+cOAzs6YibkNoTrvY-qDY4FOzgrSyA4pHynQ@mail.gmail.com>
Subject: Re: [PATCH 01/39] dt-bindings: display: Add Renesas SH-Mobile LCDC
 bindings
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for your review!

On Thu, Jun 22, 2023 at 4:52=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Thu, Jun 22, 2023 at 11:21:13AM +0200, Geert Uytterhoeven wrote:
> > Add device tree bindings for the LCD Controller (LCDC) found in Renesas
> > SuperH SH-Mobile and ARM SH/R-Mobile SOCs.
> >
> > Based on a plain text prototype by Laurent Pinchart.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.y=
aml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/renesas,shmobile-lcdc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas SH-Mobile LCD Controller (LCDC)
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r8a7740-lcdc # R-Mobile A1
> > +      - renesas,sh73a0-lcdc  # SH-Mobile AG5
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 5
> > +    description:
> > +      Only the functional clock is mandatory.
> > +      Some of the optional clocks are model-dependent (e.g. "video" (a=
.k.a.
> > +      "vou" or "dv_clk") is available on R-Mobile A1 only).
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 5
> > +    items:
> > +      enum: [ fck, media, lclk, hdmi, video ]
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: |
> > +      The connections to the output video ports are modeled using the =
OF graph
> > +      bindings specified in Documentation/devicetree/bindings/graph.tx=
t.
>
> Please read this file.
>
> > +      The number of ports and their assignment are model-dependent.
> > +      Each port shall have a single endpoint.
>
> I'd just drop the whole description.
>
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: LCD port (R-Mobile A1 and SH-Mobile AG5)
> > +        unevaluatedProperties: false
>
> Don't need this.

You mean the "unevaluatedProperties: false"?
Or more?

Thanks again!

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
