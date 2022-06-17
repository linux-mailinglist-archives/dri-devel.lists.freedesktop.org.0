Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C854F575
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF5611A94C;
	Fri, 17 Jun 2022 10:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BAA11A94C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:35:46 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id p69so4160763iod.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rOxytpr3JE53RNJSPRdeBWhwwL5aBsV68OtuK0gPSKc=;
 b=VXLvhpaQU0zgeMjKkkqDHD1I+K0rIshiGzQkNBPk2HQGNqDDUZT5LxEKFLtoSchSaZ
 fKpgnNsU0HTiilSwtx0LgLcenSKqGXiW3QiesMvmIoG8bZYBxjvxIm4ZMCMJssMi06O7
 DmqBTjSMvAsNPKw0iZwY8THSaeWRxbZvzA5XCoxwOMwh8aFihG4t0lDRFgRD8H/l72fJ
 4WO9j/DcS912xHkAAyWAdl+uQmxw6JQHU9ZhlfeMjFsP+HiYKJpSZDjCjXLCjJ4UMtG5
 sj63siSb6Jqs6FXFchQDLzzEq6UOf/Duny841OrK6jdAGRvH8toYDeFHZA1bsbuZ+Yvc
 ewGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rOxytpr3JE53RNJSPRdeBWhwwL5aBsV68OtuK0gPSKc=;
 b=yZNPNhNwXzQIlSBWhFLrV4G0zurZnt+guS1wTE3HbPkOgaEMaESVSoUAjMlRu0y8Bm
 KhYdTsnxHD4sMgYUh9FRw++d6cr3731ce0LbYhF4FcgiZpNJAQRRbmy1gmAhnwTeYn/J
 vlfsc3TxqqqFBXMBe9JdENqjtO34GXaY8uJaPg9ym2JcFKRwwRScP2+O6i9QsV+ERyy6
 kA5grBK7xPehux+Ph7UuFq/srRCjab8P3vesWYyEAzCnmN/MZ8bQQr7dh3TU0mqTu073
 LU1CSDBs+9yBzKdZYzgsavKfZncGmEM2DCtqxEq/1jiyiGi5DjjI8wAtfy26UwR8Dx8b
 XoFg==
X-Gm-Message-State: AJIora/nYXJBWQkMlsLtmsULNTJequ5CzEVzeKu7ttuIqTsWOvqA54OK
 9kaQSJoIUhfGsILTxJr4tzIySkpcsnbUqMJ+rn4=
X-Google-Smtp-Source: AGRyM1udgMHgKDiQMYRnn7E3oN5h0pbJ2A1MrxTn2OBrvOJsKft+xj/e2gq23SyVxC5kFN9WD040jXi32G7pqDTUjpk=
X-Received: by 2002:a05:6638:2113:b0:331:feae:af81 with SMTP id
 n19-20020a056638211300b00331feaeaf81mr4897345jaj.196.1655462146064; Fri, 17
 Jun 2022 03:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-6-peterwu.pub@gmail.com>
 <9c38f708-1376-aa89-2c56-c08d320bcf2b@linaro.org>
In-Reply-To: <9c38f708-1376-aa89-2c56-c08d320bcf2b@linaro.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 18:35:34 +0800
Message-ID: <CABtFH5KhijZDRA+K=stpOV0t8K3cqCMoLXpLShcdm9F8emrKCA@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] dt-bindings: backlight: Add Mediatek MT6370
 backlight
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 szunichen@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thanks for your helpful feedback, I have some questions want to
confirm with you below.

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B46=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=B8=85=E6=99=A85:13=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 13/06/2022 04:11, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add mt6370 backlight binding documentation.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  .../backlight/mediatek,mt6370-backlight.yaml  | 107 ++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/me=
diatek,mt6370-backlight.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,=
mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/me=
diatek,mt6370-backlight.yaml
> > new file mode 100644
> > index 000000000000..25a05e607e83
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-=
backlight.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-back=
light.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT6370 Backlight
> > +
> > +maintainers:
> > +  - ChiaEn Wu <chiaen_wu@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6370 MFD device.
> > +  The MT6370 Backlight WLED driver supports up to a 29V output voltage=
 for
> > +  4 channels of 8 series WLEDs. Each channel supports up to 30mA of cu=
rrent
> > +  capability with 2048 current steps (11 bits) in exponential or linea=
r
> > +  mapping curves.
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6370-backlight
> > +
> > +  default-brightness:
> > +    minimum: 0
> > +    maximum: 2048
> > +
> > +  max-brightness:
> > +    minimum: 0
> > +    maximum: 2048
> > +
> > +  enable-gpios:
> > +    description: External backlight 'enable' pin
> > +    maxItems: 1
> > +
> > +  mediatek,bled-pwm-enable:
> > +    description: |
> > +      Enable external PWM input for backlight dimming
> > +    type: boolean
> > +
> > +  mediatek,bled-pwm-hys-enable:
> > +    description: |
> > +      Enable the backlight input-hysteresis for PWM mode
> > +    type: boolean
> > +
> > +  mediatek,bled-pwm-hys-input-bit:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    enum: [0, 1, 2, 3]
> > +    description: |
> > +      The selection of the upper and lower bounds threshold of backlig=
ht
> > +      PWM resolution. If we choose selection 3 (6 bits), the variation=
 of PWM
> > +      resolution needs over than 64 steps (2^6).
> > +      value mapping:
> > +        - 0: 1
> > +        - 1: 2
> > +        - 2: 4
> > +        - 3: 6
>
> Nope, I said last time:
> "In any case you cannot have values mapping"
>
> Please use proper real world value, not some register bits. The property
> name also needs fixing.

I so apologized for misunderstanding your meaning...
I try to modify it like below.
--------
mediatek,bled-pwm-hys-input-threshold-steps:
  $ref: /schemas/types.yaml#/definitions/uint8
  enum: [1, 4, 16, 64]
  description: |
    The selection of the upper and lower bounds threshold of backlight
    PWM resolution. If we choose selection 64, the variation of PWM
    resolution needs over 64 steps.
--------
If these changes meet your expectations, I will try to modify
"bled-ovp-microvolt" and "bled-ocp-microamp" in the same way.
Thank you so much.

>
> > +
> > +  mediatek,bled-ovp-shutdown:
> > +    description: |
> > +      Enable the backlight shutdown when OVP level triggered
> > +    type: boolean
> > +
> > +  mediatek,bled-ovp-microvolt:
> > +    enum: [0, 1, 2, 3]
> > +    description: |
> > +      Backlight OVP level selection.
> > +      value mapping:
> > +        - 0: 17000000
> > +        - 1: 21000000
> > +        - 2: 25000000
> > +        - 3: 29000000
>
> No. Please test your bindings.
>
> microvolt cannot be 1 mV. It's 21000000, not 1. No value mappings.
>
> > +
> > +  mediatek,bled-ocp-shutdown:
> > +    description: |
> > +      Enable the backlight shutdown when OCP level triggerred.
> > +    type: boolean
> > +
> > +  mediatek,bled-ocp-microamp:
> > +    enum: [0, 1, 2, 3]
> > +    description: |
> > +      Backlight OC level selection.
> > +      value mapping:
> > +        - 0: 900000
> > +        - 1: 1200000
> > +        - 2: 1500000
> > +        - 3: 1800000
>
> Nope.
>
> > +
> > +  mediatek,bled-channel-use:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: |
> > +      Backlight LED channel to be used.
> > +      Each bit mapping to:
> > +        - 0: CH4
> > +        - 1: CH3
> > +        - 2: CH2
> > +        - 3: CH1
> > +    minimum: 1
> > +    maximum: 15
> > +
> > +required:
> > +  - compatible
> > +  - mediatek,bled-channel-use
> > +
> > +additionalProperties: false
>
>
> Best regards,
> Krzysztof

Best regards,
ChiaEn Wu
