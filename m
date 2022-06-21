Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F91D552B7A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDC010FF06;
	Tue, 21 Jun 2022 07:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DAA10FDEE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 07:09:41 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-fe023ab520so17236806fac.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 00:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ezwPnqEAb9XxkVE6EHdU5akaM6B3QfniuvIAXM1ujs=;
 b=Zqk/6TEo4OCK6iXQpMW0KLFDZpGNGNKWTpAPHpsUkZSQiau3mmKGABguIhRI3x938b
 heektjv2/gYTq/vC/f5cRlH3QtIs7fr4iRvdOYM9FgeJJhHswFZCV+z1ePtYBNOdMNbS
 A88Vn2bI5FnDA2Vc3dGFD1FB8v5X57L5/jR7MLLmF+pxOu6apEojkL53+BaM6NCJf1FP
 5fN9gStRV/2pL3iJnlpSL3hRdiUmSdtWIZXHL+mZWkJBKPp8AnkVfvem77UY3+31OPb6
 c2twynmabAyz09IkooRT3TI/0p3frgsgchEJEK9C7RjJedBJbr5W7HtRzrQA1Ga6BoGK
 k23g==
X-Gm-Message-State: AJIora9yGF3FqVcJuhBEqVz6S28c9+z0nhVFABIbkRtYSHatcOS2mfQo
 TqvMLUh5wTQmrTyfLop18RHyCLOS+IvtLg==
X-Google-Smtp-Source: AGRyM1u7JDdksxaGv271LvQGuvRGyYvB8odCJ/I4Bm54X3qWzVhAD6BB9IH97/7BbrY2Q0Xi0eLkXw==
X-Received: by 2002:a05:6870:5809:b0:101:ce10:b267 with SMTP id
 r9-20020a056870580900b00101ce10b267mr7413580oap.83.1655795378952; 
 Tue, 21 Jun 2022 00:09:38 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52]) by smtp.gmail.com with ESMTPSA id
 q4-20020a9d57c4000000b0060b85231c4esm8775725oti.67.2022.06.21.00.09.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 00:09:38 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id
 a21-20020a9d4715000000b0060bfaac6899so10013099otf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 00:09:38 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr30754158ybh.36.1655795017074; Tue, 21
 Jun 2022 00:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
In-Reply-To: <20220620205654.g7fyipwytbww5757@mobilestation>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2022 09:03:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
Message-ID: <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
To: Serge Semin <fancer.lancer@gmail.com>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Mark Brown <broonie@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <mail@conchuod.ie>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine <dmaengine@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Serge,

On Mon, Jun 20, 2022 at 10:56 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> > width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> > this.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
> >  1 file changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > index e25d44c218f2..f2b9e3f062cd 100644
> > --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > @@ -135,19 +135,41 @@ properties:
> >        of the designware controller, and the upper limit is also subject to
> >        controller configuration.
> >
> > -patternProperties:
> > -  "^.*@[0-9a-f]+$":
> > -    type: object
> > -    properties:
> > -      reg:
> > -        minimum: 0
> > -        maximum: 3
> > -
> > -      spi-rx-bus-width:
> > -        const: 1
> > -
> > -      spi-tx-bus-width:
> > -        const: 1
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: snps,dwc-ssi-1.01a
> > +
> > +then:
> > +  patternProperties:
> > +    "^.*@[0-9a-f]+$":
> > +      type: object
> > +      properties:
> > +        reg:
> > +          minimum: 0
> > +          maximum: 3
> > +
> > +        spi-rx-bus-width:
> > +          const: 4
> > +
> > +        spi-tx-bus-width:
> > +          const: 4
> > +
> > +else:
> > +  patternProperties:
> > +    "^.*@[0-9a-f]+$":
> > +      type: object
> > +      properties:
> > +        reg:
> > +          minimum: 0
> > +          maximum: 3
> > +
> > +        spi-rx-bus-width:
> > +          const: 1
> > +
> > +        spi-tx-bus-width:
> > +          const: 1
>
> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> irrespective from the compatible string. The modern DW APB SSI
> controllers of v.4.* and newer also support the enhanced SPI Modes too
> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
> run-time there is no way to create a DT-schema correctly constraining
> the Rx/Tx SPI bus widths. So let's keep the
> compatible-string-independent "patternProperties" here but just extend
> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
> properties values.
>
> Note the DW APB SSI/AHB SSI driver currently doesn't support the
> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
> activated by means of the corresponding CSR. So most likely the DW AHB
> SSI controllers need some specific setups too.

That doesn't matter here, as DT describes hardware, not software
limitations.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
