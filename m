Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19344A35714
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 07:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E851210E479;
	Fri, 14 Feb 2025 06:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DbL5GRhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6298010E479
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 06:29:37 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso11038195e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739514576; x=1740119376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0DNrIkpi+rgWunP8esx8b13URNUv1qzTHQGLBvyHZQ=;
 b=DbL5GRhcIYBcuRnWsaqGMe1PMcdKEhKpur3oD8hNo5y/ImnQUKySf76lQQ3jVNqxrG
 yYaK2mqYmLVwCOx8zDpvDJCXX+4SZs05xp1QVzidWrgdcnfgjl9KD3byPj8adkCdMopn
 BG95+p01eZdXzmhFlBFqvN07/DX5h4irvrCA1CCpNL7Z5hv1DEfdKjWnARahDfuv7Db6
 RQvTeHI+/m2OII3djjbcj+0rL4xAqiLvg7WybL5H79SGPu1gG0nyeRHim18TdIMxFnqQ
 OpNHMaJRoE/ocLkjERIpW3tL7hrAaUFqu0+p+wmhhp5IuIHv0zIZgVQ2991fXoHsHgGt
 tESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739514576; x=1740119376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0DNrIkpi+rgWunP8esx8b13URNUv1qzTHQGLBvyHZQ=;
 b=Mvd9wlmIkewrJEFfxu2dSi1rwE0uATFZl7EmtdrcYLkzvIEz5uOcoaOsocE1hlOD6e
 w53gVxy5cQCyBTgvxRcmCkEeJbh870TGw4OPCmeGIrYoZzxs73o+RdA2ofaK4KpO5Jnh
 pMZaJV9m57IQTBv6ZEyQltF6hp9nnAjhDql+lOofSanjpdugJrILLaUk/+1Qql6jboJ8
 z1BC7qjqvlHzbf9yleslg2lR32pLg61yRLNfzyWl4nVmdDRTU2FymfJxW9xSMykX9UM4
 KVAFk50i20emN5covqu/Y10wH5JciWk70mimrzo5Or5D282AO7Qh5EnZsjU1r9bXidQv
 H7QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhGipojEvGsej5EvxEFxDjoU9vyLIIHL6OkTgGR+YE2NMTso4FYs16o71xstzc86NPpnXiqvWzJTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+ti/uOAL1kJFmvzPr/eLnn97TDaow8rZwnRIX2y4RWuh1UOrj
 5fz0xkH1KJVMlvp+Z5a6wlydtXEN8OJLcDs9BPeIXWraNhB9UD7VvS5uMmxFEpqYDuQkCZgQdoe
 EicyvNxTLqJ1m3cKeU6GhCy0IVgs=
X-Gm-Gg: ASbGnctEOanuC5+OPNL/4Q/T9Tr+PYj8oefwfYjC5ddGzvGU6jyUZu+ny9NrfQRSw9o
 YNKBqZ35JhHnUGy9G0QdVwJnpcyue7lYSQmQmmoR4UZ5GFJRIhH9m1tCcEYCJH0beW+H+I0wtRQ
 ==
X-Google-Smtp-Source: AGHT+IGY5xLuVN8j9KsxRf6bcc1+me7BVeaaH17aSLDBupkE+g+TY2Q6JdeoAWh5pe090nZSLG814Kwqa2FtZu049v4=
X-Received: by 2002:a05:600c:870a:b0:439:42c6:f11f with SMTP id
 5b1f17b1804b1-43960169268mr80052915e9.4.1739514575486; Thu, 13 Feb 2025
 22:29:35 -0800 (PST)
MIME-Version: 1.0
References: <20250213135605.157650-1-clamor95@gmail.com>
 <20250213135605.157650-2-clamor95@gmail.com>
 <20250213-pumice-overcrowd-6c22b0d5d66c@spud>
In-Reply-To: <20250213-pumice-overcrowd-6c22b0d5d66c@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 14 Feb 2025 08:29:22 +0200
X-Gm-Features: AWEUYZn67J7NbLVEkrwrIx99cgEMyRnxO5YdBiYvqEdfxjG1cBd7qt5e9I3cnEU
Message-ID: <CAPVz0n1CpoAFvwwvoTOFQu4mgg57jCwS5W4GXCiUZ3eLEAdwZA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: Document Solomon
 SSD2825
To: Conor Dooley <conor@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

=D1=87=D1=82, 13 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 22:34 Cono=
r Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Feb 13, 2025 at 03:56:04PM +0200, Svyatoslav Ryhel wrote:
> > Add bindings for Solomon SSD2825 MIPI master bridge chip that connects =
an
> > application processor with traditional parallel LCD interface and an LC=
D
> > driver with MIPI slave interface. The SSD2825 supports both parallel RG=
B
> > interface and serial SPI interface.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/bridge/solomon,ssd2825.yaml       | 140 ++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/so=
lomon,ssd2825.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/solomon,s=
sd2825.yaml b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2=
825.yaml
> > new file mode 100644
> > index 000000000000..cd7ff971495c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.=
yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Solomon SSD2825 RGB to MIPI-DSI bridge
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: solomon,ssd2825
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  reset-gpios: true
> > +
> > +  dvdd-supply:
> > +    description: Regulator for 1.2V digital power supply.
> > +
> > +  avdd-supply:
> > +    description: Regulator for 1.2V analog power supply.
> > +
> > +  vddio-supply:
> > +    description: Regulator for 1.8V IO power supply.
> > +
> > +  spi-max-frequency:
> > +    maximum: 1000000
> > +
> > +  spi-cpha: true
> > +  spi-cpol: true
>
> Should these be required? Supplies should really be required too, since
> the device probably cannot function without them?
>

No, since spi-* define mode in which device works. If both are present
it is mode 3, if none it is mode 0.

About supplies, device cannot work without power supply obviously, but
often exact supplies are not known and I would like to not enforce
someone to add random regulators just because they are mandatory.

> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: tx_clk
>
> Drop the _clk, since this cannot be anything else! clock-names isn't
> really useful when you have just one, so I'd be inclined to say remove
> it entirely...
>

TX_CLK is the name which datasheet refers to hence I have included
clock name solely to have clear link between datasheet clock
references and clock used here.

> > +  solomon,hs-zero-delay-ns:
> > +    description:
> > +      HS zero delay period
> > +    default: 133
> > +
> > +  solomon,hs-prep-delay-ns:
> > +    description:
> > +      HS prep delay period
> > +    default: 40
>
> Do these two have limits? Use maximum/minimum to set them if so.
> Cheers,
> Conor.
>

Datasheet does not specify limits actually, only defaults. I will try
to calculate boundaries.

> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Video port for RGB input
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              bus-width:
> > +                enum: [ 16, 18, 24 ]
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Video port for DSI output (panel or connector)
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        dsi@2 {
> > +            compatible =3D "solomon,ssd2825";
> > +            reg =3D <2>;
> > +
> > +            spi-max-frequency =3D <1000000>;
> > +
> > +            spi-cpha;
> > +            spi-cpol;
> > +
> > +            reset-gpios =3D <&gpio 114 GPIO_ACTIVE_LOW>;
> > +
> > +            dvdd-supply =3D <&vdd_1v2>;
> > +            avdd-supply =3D <&vdd_1v2>;
> > +            vddio-supply =3D <&vdd_1v8_io>;
> > +
> > +            solomon,hs-zero-delay-ns =3D <300>;
> > +            solomon,hs-prep-delay-ns =3D <65>;
> > +
> > +            clocks =3D <&ssd2825_tx_clk>;
> > +            clock-names =3D "tx_clk";
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +
> > +                    bridge_input: endpoint {
> > +                        remote-endpoint =3D <&dpi_output>;
> > +                        bus-width =3D <24>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +
> > +                    bridge_output: endpoint {
> > +                        remote-endpoint =3D <&panel_input>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.43.0
> >
