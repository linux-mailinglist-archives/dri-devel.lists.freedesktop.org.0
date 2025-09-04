Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE66B4781C
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45F10E412;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TLvW2506";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A82510E9FF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 11:27:14 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id
 ca18e2360f4ac-88432e2975cso36678839f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756985234; x=1757590034; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Omu2iDAjQIOjKg0DmAgEj8ICa8iVBrvJA7lXUZP/Pg=;
 b=TLvW2506isQH1XSF0B9mu0cnd0+dlDe7+SoE8a4toMQ+Q7tJwjm75GyXyMUdWuYTWk
 h5GU3XQuNXf07YcNQBi4ZHdAdYB0ECxOFGLeuPeCxbM6pshnztx1GbtXEFm7dW8yFW4I
 90qCVCkulWBMxLENljLDDq5YoU3RM6KrAUwqDyt7LFkgyGOF6rF8w9L7m/Vy0jzbe6Is
 r/94LZBGx5Dn0kyik0Nf3dFwoc4L5olJdI/Q4LxWoyejH2DOdulkTz+A3VUDc58PTaQ4
 +ec3Y/Fw9I4UpZFqrUQM67DXFeiTRr1IaMoDKoODHybEHH2w89POyBDWkM8SOlQt0496
 /D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756985234; x=1757590034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Omu2iDAjQIOjKg0DmAgEj8ICa8iVBrvJA7lXUZP/Pg=;
 b=qvUUXEz/UgRmUCrmk/yKbFN2CYnISRSkRjhcb33W2jRGd5mwsrW/mxB2/gDpaRXdW8
 +UF049QTNiFSs8dGLIAs+sedDh+CiT4Y1ts+wIimH0GYA1zR+ubZD7zKM2mzWAb1ldKZ
 acZMb9K0cDiZnnCC70sWTeoMww2g6guQa7BsxMNPBsm3FaKTr0wvIXHgD0wPet+8Voi/
 2xHjHZZzx9+9+BNBlYC8rpxTftk13Q+DSybgR2nMxlKvLXMkW1pZAvF2J+P9eOz80b5V
 pSX9TMl4ELi0pZyeZQw0qtZyDhiQkiUatt2gG0fXZsTOHLZR4W3Vh6JEEpLcERcCpiAV
 ALkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuI4UoJ2vmSHprvzHdQRUoG2ZlqPZlwiJWaB8Fop55dTcGKmA+Yh9WbjAREpUZdiZ1j0q49AHsiYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNe8rQCoGP5x9vGorUdEdmktj1OId58ujpcWegr5Jw1muEzYvT
 aJqkj6zPYlMeUM5Tb1l/sDo1JY6eXBtsh3B4sBqj+/2aZrMlyVUiRqId+ifiRp6ZmV7v5uI18xM
 gcwK9SbtcMq53HK5u+l6KJT8hThWjJVg=
X-Gm-Gg: ASbGnctHB4TZD9JyDbiYKzMvDIvzmEBc1lZQPH22Pqi6DF1jCnlo0sccQYMULPiOfZV
 6mWPZktG8qa9kUHu25f9kGZoC0OFJubMtziiMXGwrwe9HaxDZu8Y5wEdOHtHEGMX2Qw4sw4eEKZ
 yLO+c2jI7/e+u1lnI6TismnfiXxvONznzQh5jxE6q54gPsCYu4oVpc2J+xGsqwX/L5dfZZL6Ayx
 jQgRzA=
X-Google-Smtp-Source: AGHT+IGwTHBUyBBmLkqWjAslRacNLUyP6rwDJEvQxuZzahg0BV3R26YS068p5u2POX62gnoxSFbFHAKFousXuOi5eqE=
X-Received: by 2002:a05:6e02:1a0e:b0:3f0:2c49:936d with SMTP id
 e9e14a558f8ab-3f400284d15mr144126505ab.12.1756985233526; Thu, 04 Sep 2025
 04:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <175691717884.2393851.6340903042726389490.robh@kernel.org>
 <20250904022524.1748587-1-syyang@lontium.com>
 <042523f7-2b75-4a04-8e0b-d1019ab84987@kernel.org>
 <CAFQXuNZpLBP3=MGmRRpwJu43ZtkNhrTzh8kOwFgKy20rqFiG7Q@mail.gmail.com>
 <20250904-aromatic-loon-of-honeydew-f7861e@kuoka>
In-Reply-To: <20250904-aromatic-loon-of-honeydew-f7861e@kuoka>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 4 Sep 2025 19:27:02 +0800
X-Gm-Features: Ac12FXwy1IO1UhmsmetaaHLdUnL-i9ZgD2TthvXT1YzMwKP3in7ctBXaHrxoB9c
Message-ID: <CAFQXuNaR+Y+PZG5h0_ETSs+hsepj6uUb2-ogZSNPT_C0JwGWDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] This patch adds a new device tree binding
 documentation.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: syyang <syyang@lontium.com>, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com, 
 andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=884=E6=
=97=A5=E5=91=A8=E5=9B=9B 16:26=E5=86=99=E9=81=93=EF=BC=9A

>
> On Thu, Sep 04, 2025 at 04:08:30PM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 wro=
te:
> > > > +
> > > > +description: |
> > >
> > > Do not need '|' unless you need to preserve formatting.
> > >
> > Both lontium,lt9211.yaml and lontium,lt9611.yaml use "|", so please
> > confirm if they need to be removed.
>
> Add code which is needed, not code which you found somewhere. Why '|' is
> needed here?
>
 '|' It feels more comfortable to me to write the description text
after a line break.  '|'  When there's only one line of description
text, it can be omitted.

> >
> > > > +  The LT9611C are bridge devices which convert DSI to HDMI
> > >
> > > Why this cannot be added to lt9611 binding? Commit msg should clearly
> > > answer that.
> > >
> > The lt9611 and lt9611c are chips of different specifications, and
> > their related parameters are different.
> > The VDD-supply of lt9611c is 1.2V; the vdd-supply of lt9611uxc is also
> > 1.2V, while the vdd-supply of lt9611 is 1.8V.
> > Now lt9611 and lt9611uxc are connected together. I'm not sure if this
> > is a problem.
> > If this lt9611c can also be bound to lt9611, and if you think it's
> > okay, then I have no problem.
>
> It is not a problem.
>

Do you think it can be merged with lt9611 and lt9611uxc?


> >
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - lontium,lt9611c
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#sound-dai-cells":
> > >
> > > Missing dai-common ref.
> > >
> > I don't understand .   I referred to:
> > Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> >
>
>
> You call this device a DAI, so your binding should reference dai-common
> schema, like every other one. You can check simple codecs for examples.
>
i will fix , thks

> > > > +    const: 0
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-gpios:
> > > > +    maxItems: 1
> > > > +    description: GPIO connected to active high RESET pin.
> > > > +
> > > > +  vdd-supply:
> > > > +    description: Regulator for 1.2V MIPI phy power.
> > > > +
> > > > +  vcc-supply:
> > > > +    description: Regulator for 3.3V IO power.
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description:
> > > > +          Primary MIPI port-1 for MIPI input
> > > > +
> > > > +      port@1:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description:
> > > > +          Additional MIPI port-2 for MIPI input, used in combinati=
on
> > > > +          with primary MIPI port-1 to drive higher resolution disp=
lays
> > > > +
> > > > +      port@2:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description:
> > > > +          HDMI port for HDMI output
> > > > +
> > > > +    required:
> > > > +      - port@0
> > > > +      - port@2
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - vdd-supply
> > > > +  - vcc-supply
> > > > +  - ports
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +
> > > > +    i2c10 {
> > > > +      #address-cells =3D <1>;
> > > > +      #size-cells =3D <0>;
> > > > +
> > > > +      hdmi-bridge@41 {
> > > > +        compatible =3D "lontium,lt9611c";
> > > > +        reg =3D <0x41>;
> > > > +        #sound-dai-cells =3D <0>;
> > > > +        interrupts-extended =3D <&pio 128 GPIO_ACTIVE_HIGH>;
> > > > +        reset-gpios =3D <&pio 127 GPIO_ACTIVE_HIGH>;
> > > > +        vdd-supply =3D <&lt9611_1v2>;
> > > > +        vcc-supply =3D <&lt9611_3v3>;
> > > > +        status =3D "okay";
> > >
> > > Nope, drop.
> > >
> > remove  status =3D "okay"  ?
>
> Yes. Instead of asking me, you can try to think about possibilities.
> Ask yourself yourself - why do you need it here? What changes if you
> have it? What changes if you drop it? Why reviewer asks for it - maybe
> there is something behind. That way you will learn more about this.
>
> I suggest to go through the slides of my OSSE25 talk about DT for
> beginners.
>
thanks,

> Best regards,
> Krzysztof
>
