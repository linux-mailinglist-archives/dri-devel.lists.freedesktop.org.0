Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E58B1A92
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E853610F8F0;
	Thu, 25 Apr 2024 06:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MCowIvOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9348112AF6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 06:03:36 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-60274726da6so406489a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1714025016; x=1714629816;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=we8SwMWsVnahAxA+g6ZwCnrdC+4iaxLV0QA7xR7Bic8=;
 b=MCowIvOukLg1l/pXAfhwn9x7G4JtheSl2W0+4nI15cp+JRZp3GUjBJu0onU5ci/Kmo
 22sxmoy6twFpLUxb/pX+k0FE4vhVT6NLVRXpmWIrKXTe+hoXrPrwyBugvtOWyijhYWx6
 pEcBhsBNgu/FP+H5SMjbw+Z2Ddp8cCVOnSCf1EapKfBlltflqh+FqrbLeWccH3IvNIaK
 5O4sb9+8ncI9it1xdFT05iqhopXcIgc/KHjHCpYlooazMayAe/LbKXG9IBg0TkoU4LkY
 mA7B9oBPace3xhuNjPkEk57fiCTmx7OtQpMf2KnJWyA8dewvDVFuh/Tt42u3LiuMUiDK
 Hgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714025016; x=1714629816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=we8SwMWsVnahAxA+g6ZwCnrdC+4iaxLV0QA7xR7Bic8=;
 b=I2HG6SeioTgWCJr0PQ3sBpS791K+by/O5oPQzuzF5KWDLeGJhzHSZi8dzyyUodQ8ho
 hNKd5A3hhQwV7hw/pOrAI04tBXaxbox0BG/axy+vVwBS0YYQvlHC0N++Iu8oL66r0P1I
 JHVKMSj0Slc7JwYC5M1LxZ+d1Do1XYPl/ayZMBz5ENc6WOiNUpbcwqmJsxwKpxF2fav1
 7zWL3Q5F6GahkzaZcyOnycczLNAs3jXHfWChaoKbqfOiMrjjgKdHMKySisKNYJeawxaR
 0Gpw8KCWa+t+LkNGJQl8PF5JqrV4djPIVv5gRB7jd2Ljll0oye+uGqWnAoBzMpuoZmb4
 Z/PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXO52BQ+nBiukYuJu51kP9uOc88KmasW8Pz/u0rkfuL6Ivd17j/5eK5Q7GBpgRybfBROuQFXXcBZmUcydadAZUy83h6L3g7sG43eotnFxT
X-Gm-Message-State: AOJu0Yz1MZrnujp0cJhmz8wa3v2WWQGbGfjhuYvLI2TMPRVav7//2Dbs
 dHxV/7L6FuShzfMq+Kmt6cIC+If8e0B/qtNSq/Rt7yUl1r4osFBhyBopWTkf+4AWFQcJHtPtAKK
 Xp+SA4rICWJovfGBz0tIgoQhY5wlwOXSIamYvC0Xv8Fy4NWmSIZ8=
X-Google-Smtp-Source: AGHT+IF7qX9dIVjUowtjxF7HpR9qCwpQY5qpxku9xN6Xlx30uiowBPfvdZuaC5oQisi4HPEoMhVeOhiK9r2JKs/3+TQ=
X-Received: by 2002:a17:90a:66cf:b0:2a5:3ec5:cecd with SMTP id
 z15-20020a17090a66cf00b002a53ec5cecdmr4452869pjl.12.1714025015799; Wed, 24
 Apr 2024 23:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
 <20240424023010.2099949-2-yangcong5@huaqin.corp-partner.google.com>
 <20240424-spelling-float-9b881cb80992@spud>
In-Reply-To: <20240424-spelling-float-9b881cb80992@spud>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 25 Apr 2024 14:03:24 +0800
Message-ID: <CAHwB_NLb9ENfCj-oJ2mV_DwFJ0h6TGSi1byUdd6Bri3gDsCo5Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
To: Conor Dooley <conor@kernel.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, linus.walleij@linaro.org, 
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

Hi,

Thanks for review.

Conor Dooley <conor@kernel.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8825=E6=97=A5=
=E5=91=A8=E5=9B=9B 00:55=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Apr 24, 2024 at 10:30:04AM +0800, Cong Yang wrote:
> > In V1, discussed with Doug and Linus [1], we need break out as separate
> > driver for the himax83102-j02 controller. Beacuse "starry,himax83102-j0=
2"
> > and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
> > controller, they have some common CMDS. So add new documentation for
> > this panels.
>
> It'd be good to note in the commit message that the 3v3 supply is not
> present on these panels, given it was present in the other binding and
> not here.

Got it, fix in V4,thanks.

>
> > [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aS=
AZQvdMV95r3zRUw@mail.gmail.com
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> > Chage since V3:
> >
> > - Update commit message.
> >
> > V2: https://lore.kernel.org/all/20240422090310.3311429-2-yangcong5@huaq=
in.corp-partner.google.com
> >
> > ---
> >  .../display/panel/boe,tv101wum-nl6.yaml       |  2 -
> >  .../bindings/display/panel/himax,hx83102.yaml | 73 +++++++++++++++++++
> >  2 files changed, 73 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/him=
ax,hx83102.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101w=
um-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-=
nl6.yaml
> > index 906ef62709b8..53fb35f5c9de 100644
> > --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.=
yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.=
yaml
> > @@ -32,8 +32,6 @@ properties:
> >        - innolux,hj110iz-01a
> >          # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
> >        - starry,2081101qfh032011-53g
> > -        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> > -      - starry,himax83102-j02
> >          # STARRY ili9882t 10.51" WUXGA TFT LCD panel
> >        - starry,ili9882t
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83=
102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.ya=
ml
> > new file mode 100644
> > index 000000000000..2e0cd6998ba8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yam=
l
>
> Filename matching a compatible please. What you've done here makes it
> seem like there's a fallback compatible missing, given this looks like
> the LCD panel controller and the starry compatible below is an LCD panel.

So change the filename to starry,himax83102-j02.yaml?

>
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/himax,hx83102.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Himax HX83102 MIPI-DSI LCD panel controller
> > +
> > +maintainers:
> > +  - Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> > +      - starry,himax83102-j02
> > +
> > +  reg:
> > +    description: the virtual channel number of a DSI peripheral
> > +
> > +  enable-gpios:
> > +    description: a GPIO spec for the enable pin
> > +
> > +  pp1800-supply:
> > +    description: core voltage supply
> > +
> > +  avdd-supply:
> > +    description: phandle of the regulator that provides positive volta=
ge
> > +
> > +  avee-supply:
> > +    description: phandle of the regulator that provides negative volta=
ge
> > +
> > +  backlight:
> > +    description: phandle of the backlight device attached to the panel
>
> I'm not sure why this was given a description when port or rotation
> was not.

So change it to backlight: true ?

Thanks.

>
> Otherwise, this looks fine to me.
>
> Cheers,
> Conor.
>
> > +
> > +  port: true
> > +  rotation: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - enable-gpios
> > +  - pp1800-supply
> > +  - avdd-supply
> > +  - avee-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        panel@0 {
> > +            compatible =3D "starry,himax83102-j02";
> > +            reg =3D <0>;
> > +            enable-gpios =3D <&pio 45 0>;
> > +            avdd-supply =3D <&ppvarn_lcd>;
> > +            avee-supply =3D <&ppvarp_lcd>;
> > +            pp1800-supply =3D <&pp1800_lcd>;
> > +            backlight =3D <&backlight_lcd0>;
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint =3D <&dsi_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.25.1
> >
