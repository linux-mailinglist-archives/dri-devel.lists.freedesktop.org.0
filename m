Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE4C0C03F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 07:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581E010E0A0;
	Mon, 27 Oct 2025 06:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lFJSsme2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5148810E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:59:05 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-63c3d913b3bso7246076a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761548344; x=1762153144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gORW6RzMgWR3pCXy5E9wgSn/fbVRWV9iD4rw/Tx62iw=;
 b=lFJSsme2vl7CRTKPxFyc0FzaGrRP5kFFIjFtB3RThbRH8REWRFeV0NPz7YrJKY8+c3
 0h9sONA8HjM5s9C6bEXY+Qj6h2B3wobsrYgAD0GqWedpytw8/iRkRaMH3RkfA9moYhkT
 sPgA76anfJFzj/NRXnUh9+6LuhzfGegHnEZN/Ba9I9oHeoJ3swzylwZZNMOUS9DX/kQo
 xzC3xjUwHFbrEUoQyY2524exyzl0D9+oAmUDeKL4J5DP8J6WXC0BdiOon10eTFixM0II
 Bjx2tfJQCfLrSCBxIQvgUxgFUTClv+0KjIU3wxnYJv/BR/Fwl+u2BI+aT73TfPflBGrw
 bejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761548344; x=1762153144;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gORW6RzMgWR3pCXy5E9wgSn/fbVRWV9iD4rw/Tx62iw=;
 b=WQCoXRglNZX4cROtkuymGxr37K60eKfZ07Qe+Y4zAIdwYH0x21NxJHq10g1pY9Uub5
 lAX39zBTs9RcXQ/+jWuTrJ+1Cy5ZRPOJ8oAkxNCrZAi72Of5Eu0XBiw+myDKijVWJx2m
 LTVDktQGBTp/5SxwAwmkSOnpHM+AMXB/RZPL4D7UEZhqr59DtFAPazaR9nP/iYBGmxCQ
 wer358wiihHCDrZ1ahDGrCOVKkwfA0oWCNgT/kBpUAUfFU7KLhXjvwdBTnV8w5qJf5up
 Rdo3bC3t5h0jEgINCu21JLhIuFNQzQYGpeozbePS3q7AN6c3YwQ0YqwxqoD26u9hVqAS
 VwwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEh3zqz6M9ES/s0+uvZ9OVExKGo3ya6N8d9ZysnaK59L66fivPWj7/6U0DUFvrVMLKMLD6JoBfVLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8zg7pS9UXmzfetzPkBDfAWjUP/y3qBtcTwoktoYt9evStuWBb
 cgG1H+R4rlPrXQe2fe3Al+fT8m9fDCVcmMwLWR4oVHb1arPbhliykW7hOYfZgx+B44BHKROyU4b
 XCOXRPrQ2H6svNCUQwjhPzT8hT+DmjyQ=
X-Gm-Gg: ASbGncvCD5J3v75Ac/9arG8+hU7ADG892jveQnovmt8YhoafJJ/0eZjEikK5D/Rk2SQ
 jeNFRsYR00Lmf+/ydhPWRlCKyQJHs9pCxfMGPUW+s1jqTtGFMfQRtgRizM3h7uHImc5njQLHsYy
 s3+SYikAS2fHnfq0h9ccXG7vYfttUHy2MN/7sel9Gbpw1eA9AszF17//bbakWKDuFMWNzRkk8XO
 yGnqS3NYNETT4Qs7HurL5Ct7tvtW8FZj4+kgCBH6lwcZkQKHoph9TxGpY1Zfz9xU5BTymQpbeSN
 7nNNBA==
X-Google-Smtp-Source: AGHT+IGj1lyRw0Om+NZfHG7wsV5wmbuah2URTGrz7PyOIc3h8h8uykLzVDyCv3r2N4k1sj1rNHO4xIqOF9SGnYYISNI=
X-Received: by 2002:a05:6402:1941:b0:634:cb54:810e with SMTP id
 4fb4d7f45d1cf-63e3e586b6cmr12920258a12.31.1761548343474; Sun, 26 Oct 2025
 23:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-2-caojunjie650@gmail.com>
 <c17c10d4-cc1f-46fd-8719-e7bb9ffa91ba@kernel.org>
In-Reply-To: <c17c10d4-cc1f-46fd-8719-e7bb9ffa91ba@kernel.org>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Mon, 27 Oct 2025 14:58:51 +0800
X-Gm-Features: AWmQ_bn4pyB-a8JGS6VOEXrwwtzP__Kqn7eL_CWe8p8AnY7T1FRYBRpGwHrdOZQ
Message-ID: <CAK6c68gqHMR-FpH3MY9E_9R+V0J75V9zOii=x81e+bRcnBYOig@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org
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

On Sun, Oct 26, 2025 at 9:48=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/10/2025 13:39, Junjie Cao wrote:
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  enable-gpios:
> > +    description: GPIO to use to enable/disable the backlight (HWEN pin=
).
> > +    maxItems: 1
> > +
> > +  awinic,dim-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: >
> > +      Select dimming mode of the device.
> > +        0 =3D Bypass mode.
> > +        1 =3D DC mode.
> > +        2 =3D MIX mode.
> > +        3 =3D MIX-26k.
> > +    enum: [0, 1, 2, 3]
> > +    default: 1
> > +
> > +  awinic,sw-freq:
>
> Please use proper units, see:
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pr=
operty-units.yaml
> and other examples
>
> Same everywhere else.
>

ACK

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Boost switching frequency in kHz.
> > +    enum: [300, 400, 500, 600, 660, 750, 850, 1000, 1200, 1330, 1500, =
1700]
> > +    default: 750
> > +
> > +  awinic,sw-ilmt:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Switching current limitation in mA.
> > +    enum: [1500, 2000, 2500, 3000]
> > +    default: 3000
> > +
> > +  awinic,iled-max:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Maximum LED current setting in uA.
> > +    minimum: 5000
> > +    maximum: 50000
> > +    multipleOf: 500
> > +    default: 20000
> > +
> > +  awinic,uvlo-thres:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: UVLO(Under Voltage Lock Out) in mV.
> > +    enum: [2200, 5000]
> > +    default: 2200
> > +
> > +  awinic,fade-time:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Fade In/Out Time(per step) in us.
> > +    enum: [8, 16, 32, 64, 128, 256, 512, 1024]
>
> Why would this be fixed setting? This really looks like runtime, drop.
>

Yes, it is fixed. I am quoting this from the datasheet.
AW99706B provides Fade in/out mode to transform backlight from one brightne=
ss
to another or turn on/off backlight with a fixed slope. Writing 0b00 into
RAMP_CTR (CFG 0x06) to enter Fade in/out mode, and the the slope of current
transition can be set in FADE_TIME (CFG 0x06).

> > +    default: 16
> > +
> > +  awinic,slope-time:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Slope time in ms.
>
> Slope of what?
>

Ramp time in slope mode, it is retained from downstream drivers, it will
be more clear in the next version.

> > +    enum: [8, 24, 48, 96, 200, 300, 400, 500]
> > +    default: 300
> > +
> > +  awinic,ramp-ctl:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: >
> > +      Select ramp control and filter of the device.
> > +        0 =3D Fade in/fade out.
> > +        1 =3D Light filter.
> > +        2 =3D Medium filter.
> > +        3 =3D Heavy filter.
> > +    enum: [0, 1, 2, 3]
> > +    default: 2
> > +
> > +  awinic,brt-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: >
> > +      Select brightness control of the device.
> > +        0 =3D PWM.
> > +        1 =3D IIC.
> > +        2 =3D IIC x PWM.
> > +        3 =3D IIC x PWM(P-ramp).
> > +    enum: [0, 1, 2, 3]
> > +    default: 1
> > +
> > +  awinic,onoff-time:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Turn on/off time(per step) in ns.
> > +    enum: [250, 500, 1000, 2000, 4000, 8000, 16000]
>
> Not a DT property.
>

It is mandatory in the downstream driver, I keep it.

The following is the description about it,

If the value in ONOFF_CTR(CFG 0x08 [4:3]) is 0b00, the turning on/off ramp =
of
AW99706B is soft start and fast end. In this mode, the ramp time can be
programmed by ONOFF_TIME (CFG 0x08 [2:0]).

> > +    default: 2000
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - enable-gpios
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        aw99706@76 {
> > +            compatible =3D "awinic,aw99706";
> > +            reg =3D <0x76>;
> > +            enable-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
>
> Where are other properties from common.yaml? Looks like you re-invented
> some parts.
>

Sorry, I forgot it, when writing the bindings, I used ktz8866.yaml as a
template. I  should have dropped the common.yaml. This driver does
not require other properties in common.yaml.

Regards,
Junjie
