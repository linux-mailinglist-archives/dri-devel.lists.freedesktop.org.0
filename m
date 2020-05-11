Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF91CE8C7
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 01:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B3D6E7DD;
	Mon, 11 May 2020 23:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FEC6E7DD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:05:04 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id k110so9022074otc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 16:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ITRYcPcWlonHrPE5qtDXeTHw7EP1LYK528y4/wZgsuU=;
 b=InFfqgrePMQrqduQ61c/XE0sa/Twp4zttG7JnQjetKHOE4vHa7UqmOwrqG55/Jek/+
 vHz+AV14KiRfIWhc3jH9LMs5BRMPyUDvu9PThc2hisFRUu3aWhypK1XEAyUiT4QWzng6
 /OqHRgLk8deAItD9VgIBYz6qQWvxnV9KEuvZEqI+a5ZifJB+PNqLAiDCuIjX10Ox2wO4
 beq4zWPEtyvNLihG57Wr0ZtmhUBlYif4sZSGEM4yoGwncn5STFfIEdXLrOZoLqLQHK7+
 1D0SDTPykyirOAPsTXBTdNgkeZO969946b4dV2yavT8joyzYXCAOovgZDdLYJdevIRdb
 DUsw==
X-Gm-Message-State: AGi0PuZ9OZxvdE6ME3fMy4ZV7Z28Y0kVgftRR0yZUb7gsw+Tx2x7AXXn
 ldc4BIW0OO/t+5Pj1Z6XRcx7DpY=
X-Google-Smtp-Source: APiQypIoY6kUC5CLLTgHsDsYf7d1b4AOMQ8Y25i9EikLDhE7xahbnoqgxdxYueOeAZkbPmnLTpOxvg==
X-Received: by 2002:a9d:7e7:: with SMTP id 94mr14201369oto.82.1589238304172;
 Mon, 11 May 2020 16:05:04 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 33sm2820423otx.31.2020.05.11.16.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:05:03 -0700 (PDT)
Received: (nullmailer pid 22115 invoked by uid 1000);
 Mon, 11 May 2020 23:05:02 -0000
Date: Mon, 11 May 2020 18:05:02 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 8/8] dt-bindings: display: Convert ingenic, lcd.txt to YAML
Message-ID: <20200511230502.GA21320@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-8-paul@crapouillou.net>
 <LS4I9Q.A1ZGRSEVADNN1@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LS4I9Q.A1ZGRSEVADNN1@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 04:12:21PM +0200, Paul Cercueil wrote:
> This one patch will need a V2, I messed up with the clocks.

Looks fine otherwise.

> =

> -Paul
> =

> =

> Le dim. 26 avril 2020 =E0 20:58, Paul Cercueil <paul@crapouillou.net> a =
=E9crit
> :
> > Convert the ingenic,lcd.txt to a new ingenic,lcd.yaml file.
> > =

> > In the process, the new ingenic,jz4780-lcd compatible string has been
> > added.
> > =

> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> >  .../bindings/display/ingenic,lcd.txt          |  45 -------
> >  .../bindings/display/ingenic,lcd.yaml         | 113 ++++++++++++++++++
> >  2 files changed, 113 insertions(+), 45 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/ingenic,lcd.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > =

> > diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > deleted file mode 100644
> > index 01e3261defb6..000000000000
> > --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -Ingenic JZ47xx LCD driver
> > -
> > -Required properties:
> > -- compatible: one of:
> > -  * ingenic,jz4740-lcd
> > -  * ingenic,jz4725b-lcd
> > -  * ingenic,jz4770-lcd
> > -- reg: LCD registers location and length
> > -- clocks: LCD pixclock and device clock specifiers.
> > -	   The device clock is only required on the JZ4740.
> > -- clock-names: "lcd_pclk" and "lcd"
> > -- interrupts: Specifies the interrupt line the LCD controller is
> > connected to.
> > -
> > -Example:
> > -
> > -panel {
> > -	compatible =3D "sharp,ls020b1dd01d";
> > -
> > -	backlight =3D <&backlight>;
> > -	power-supply =3D <&vcc>;
> > -
> > -	port {
> > -		panel_input: endpoint {
> > -			remote-endpoint =3D <&panel_output>;
> > -		};
> > -	};
> > -};
> > -
> > -
> > -lcd: lcd-controller@13050000 {
> > -	compatible =3D "ingenic,jz4725b-lcd";
> > -	reg =3D <0x13050000 0x1000>;
> > -
> > -	interrupt-parent =3D <&intc>;
> > -	interrupts =3D <31>;
> > -
> > -	clocks =3D <&cgu JZ4725B_CLK_LCD>;
> > -	clock-names =3D "lcd";
> > -
> > -	port {
> > -		panel_output: endpoint {
> > -			remote-endpoint =3D <&panel_input>;
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > new file mode 100644
> > index 000000000000..8e9c851dc7c5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ingenic SoCs LCD controller devicetree bindings
> > +
> > +maintainers:
> > +  - Paul Cercueil <paul@crapouillou.net>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^lcd-controller@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    enum:
> > +      - ingenic,jz4740-lcd
> > +      - ingenic,jz4725b-lcd
> > +      - ingenic,jz4770-lcd
> > +      - ingenic,jz4780-lcd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Module clock
> > +      - description: Pixel clock
> > +    minItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: lcd
> > +      - const: lcd_pclk
> > +    minItems: 1
> > +
> > +  port:
> > +    type: object
> > +    description:
> > +      A port node with endpoint definitions as defined in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +required:
> > +    - compatible
> > +    - reg
> > +    - interrupts
> > +    - clocks
> > +    - clock-names
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - ingenic,jz4740-lcd
> > +          - ingenic,jz4780-lcd
> > +then:
> > +  properties:
> > +    clocks:
> > +      minItems: 2
> > +    clock-names:
> > +      minItems: 2
> > +else:
> > +  properties:
> > +    clocks:
> > +      maxItems: 1
> > +    clock-names:
> > +      maxItems: 1
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/jz4740-cgu.h>
> > +    lcd-controller@13050000 {
> > +      compatible =3D "ingenic,jz4740-lcd";
> > +      reg =3D <0x13050000 0x1000>;
> > +
> > +      interrupt-parent =3D <&intc>;
> > +      interrupts =3D <30>;
> > +
> > +      clocks =3D <&cgu JZ4740_CLK_LCD>, <&cgu JZ4740_CLK_LCD_PCLK>;
> > +      clock-names =3D "lcd", "lcd_pclk";
> > +
> > +      port {
> > +        endpoint {
> > +          remote-endpoint =3D <&panel_input>;
> > +        };
> > +      };
> > +    };
> > +
> > +  - |
> > +    #include <dt-bindings/clock/jz4725b-cgu.h>
> > +    lcd-controller@13050000 {
> > +      compatible =3D "ingenic,jz4725b-lcd";
> > +      reg =3D <0x13050000 0x1000>;
> > +
> > +      interrupt-parent =3D <&intc>;
> > +      interrupts =3D <31>;
> > +
> > +      clocks =3D <&cgu JZ4725B_CLK_LCD>;
> > +      clock-names =3D "lcd";
> > +
> > +      port {
> > +        endpoint {
> > +          remote-endpoint =3D <&panel_input>;
> > +        };
> > +      };
> > +    };
> > --
> > 2.26.2
> > =

> =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
