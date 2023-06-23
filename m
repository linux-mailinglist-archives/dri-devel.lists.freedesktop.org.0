Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A30D73BB6E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52DF10E655;
	Fri, 23 Jun 2023 15:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D1010E655
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:19:59 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-78cdb90aa66so275962241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 08:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687533598; x=1690125598;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILQtktcDzZ1jDAABaDuOMKEHo85IkfnjEuCD0npTbLY=;
 b=IKL5j+bTDLU08F9KyY3GelYX5E9Da9GkS20XTGTFWtyW4X0quWMbgHioRHHbbAY8xs
 iUAql3V+sXqiVjh38zCBqiEbTUrKTI2pdv76z3se3+4SdIy10mYATFoz2yn70YRHU6dO
 dVfUqhUmw3TRyJrScGGsm+kD0TTnWW0QA7/BgmSf26/JT/uOhAMTKD3cWgpwrytDMRj0
 0t8YxqNB76mwbdOy9UGx140LJTuuw1aQW7YZdUrRuY76AlUr3dE+UhQ2O9Y73V0AYdua
 HMKj4i4Fp/OZUL2wrKIesGa8t1Ylbv2jIMo+ejM45cZmGhJ5pYbq2G3jYElLtOZ9DeGD
 X/5Q==
X-Gm-Message-State: AC+VfDwYg70PaT2xZY0CybrhwJlA3OmcpSAoL6216oyk9koC4zFTUchR
 dwzzeEj31FNzM09JARS5/jV7vCvb5kvkqg==
X-Google-Smtp-Source: ACHHUZ4R3Lm245YeAMARHXH+eaG9eqF7i4Dgerq58Z/Xi6NY2XKns/3oR4jP49QoQqr8T3TMkwgs7g==
X-Received: by 2002:a1f:45c4:0:b0:471:8ca7:88c3 with SMTP id
 s187-20020a1f45c4000000b004718ca788c3mr8809005vka.6.1687533598083; 
 Fri, 23 Jun 2023 08:19:58 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180]) by smtp.gmail.com with ESMTPSA id
 bk14-20020a0561220e0e00b00471b8254130sm727175vkb.17.2023.06.23.08.19.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 08:19:57 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-471632450d1so304081e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 08:19:57 -0700 (PDT)
X-Received: by 2002:a1f:da87:0:b0:476:3544:773 with SMTP id
 r129-20020a1fda87000000b0047635440773mr1046946vkg.11.1687533596966; Fri, 23
 Jun 2023 08:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2259ff548f007afcb5a315a4c95c83a0ee4b7e03.1687423204.git.geert+renesas@glider.be>
 <20230623144312.GE2112@pendragon.ideasonboard.com>
In-Reply-To: <20230623144312.GE2112@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jun 2023 17:19:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdknNczxXod7b6znBHSgXVEb9oNZCAajKCc0Spm1SrYQ@mail.gmail.com>
Message-ID: <CAMuHMdXdknNczxXod7b6znBHSgXVEb9oNZCAajKCc0Spm1SrYQ@mail.gmail.com>
Subject: Re: [PATCH 01/39] dt-bindings: display: Add Renesas SH-Mobile LCDC
 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Jun 23, 2023 at 4:43=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
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
>
> I'd be happy if you co-maintained this with me :-) Or even took
> ownership completely.

OK. Thinking about it ;-)

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
>
> Switching to per-item descriptions would allow documenting which clock
> applies to which SoC.
>
> Are enum items unique by default ?

Given how about all clocks but fck are optional, it's a bit hard
to handle this in a perfect way.
Note that "pattern: '^dclkin\.[0123]$'" in renesas,du.yaml has the same iss=
ue.

> This would allow a combination of clocks that doesn't include the fck
> clock, that's not right.

Right. But when fixing the first to "fck", you have to duplicate all others=
.
So it should become something like:

  - const: fck
  - enum: [ media, lclk, hdmi, video ]
  - enum: [ media, lclk, hdmi, video ]
  - enum: [ media, lclk, hdmi, video ]
  - enum: [ media, lclk, hdmi, video ]

>
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
> it's available in YAML form now. I'd just drop the "specified in ...".

OK.

> > +      The number of ports and their assignment are model-dependent.
> > +      Each port shall have a single endpoint.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: LCD port (R-Mobile A1 and SH-Mobile AG5)
> > +        unevaluatedProperties: false
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: HDMI port (R-Mobile A1 LCDC1 and SH-Mobile AG5)
> > +        unevaluatedProperties: false
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MIPI-DSI port (SH-Mobile AG5)
> > +        unevaluatedProperties: false
>
> Let's condition the ports on the compatible value to enable automatic
> validation.
>
> > +
> > +    required:
> > +      - port@0
>
> Based on the above, port@1 is required too as it's present on all
> supported SoCs. Let's condition this on the compatible value too.

It does not depend solely on the SoC, but also on the LCDC instance.
port@1 is not available on R-Mobile A1 LCDC0, only on LCDC1.

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
