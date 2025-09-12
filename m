Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33794B56089
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6799810E125;
	Sat, 13 Sep 2025 11:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kdKe8mm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351DC10EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:54:18 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-ea0150ee46dso1244316276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 00:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757663657; x=1758268457; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xjuRsqHdcU4j53GUFw1Pl7XbbCPvtJQh1ErB89K8XOs=;
 b=kdKe8mm7/+e2PUlSqlSOUi6lc/6CcFVVp5E9FCydJ3HZXn+/8E6ouaH82ImSdFSmvS
 OI68cmhh2C8Tmcrx9vjU6XvycRTqbI4h9zTkvComZtk+FOAFx0zMGQDzY97lto2BYDKQ
 jci71PyU7oup/ynKJ4zGX02vSkD8DEQxT9KTu7hmJtrrJhZUPRDYDHN71Ei8vSnw6O/p
 VwUurAtsB5147t6NZm94A+3jEaR5ga1/qYdfV22TR0/s6TODxj63zuAsdvgeBNpKgSuR
 7gMOLVhdarZA5bKuf1wOR9h+/RmY4QzIpfw+hMknLHvWXVKdFEf9GdbwbWGcZrWXLb+J
 0v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757663657; x=1758268457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjuRsqHdcU4j53GUFw1Pl7XbbCPvtJQh1ErB89K8XOs=;
 b=vCeYAu01MTnHxB90kUXHI8GwGydCAIzu8iZ/tUGfRwiK+aHBHBaG+93zSw5fQcyI+S
 rKv+TEc/9C0BI+DZ3RJCArLKd3Ja3SouL8Yf2Za4QKToQllh+AzQynL5HVXcKPJcjkk4
 aIMguV3kT/5IRejBnsvfgupaDqW6PStVMN4JDxM9UO8/lzZrXLSpX2PhUB/9G/cojd8x
 FCHVGkSoms5EbAb0AtEhH9bCsCCdFM9fooldddk8gGID34LY+gDi1byu1kxj+86RqeMu
 slRlGOCywLjUSV8d065g8hAa2gWj5vQUyK9yk7bHvKJggse+JGhWe71YhUSxb5V5OrZ5
 x1sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuItmI3Z7O03BGpW1G0VpgUU/sKdBaKMXw582yWEYjuLRTrNg5XQRVv4odkhdC6ZHhZNvjvu53n6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH7gq6SFOIAnStSNigcTvz2wtFkmHqZrJoXY8YdkFE4UtiSxQL
 sEJ3ZNIbRVQ68xycP09zPSjz29XIHBMNqA1JDqV08RsMApYARSz0ksPF3DCn/1B6qpcMlOuVi1G
 kNCoStuxW92lvwVypj4Gbo+h30wvXS6A=
X-Gm-Gg: ASbGncs2rpLKF0pbwzSzBLi4lhCZc0QtobFdmMFtkAPD56Wfsr/glQaW+hQH9Q0KG1e
 BLn6026Z6TedATDvL+FJxfdcu7Tg25mxaSlJHv8264B33p/5y5ideab6v79Hv4tCKmiLo3jJEYV
 QGjxKi6WWXCHclw1uzd46F+Z5xTatvsdXq/yvregAwNpS6ZqC0ZEDfbFjR3UhK16xGWv1abQ+Jv
 +qDveNg04f3smY9Aw==
X-Google-Smtp-Source: AGHT+IE8+unssytBQ1SOk4XKYFDJkZtS2RYqGocxJxS92x7Kboc0Jmlrk5uoaHdUbNrabaNoKudlBW69K1l0SKFQeSI=
X-Received: by 2002:a25:b318:0:b0:e96:edb1:83e1 with SMTP id
 3f1490d57ef6-ea3d9a53003mr1176835276.30.1757663657050; Fri, 12 Sep 2025
 00:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-st7920-v2-0-409f4890fb5f@gmail.com>
 <20250909-st7920-v2-2-409f4890fb5f@gmail.com>
 <20250910-ant-of-angelic-vastness-b5caa5@kuoka>
In-Reply-To: <20250910-ant-of-angelic-vastness-b5caa5@kuoka>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 12 Sep 2025 09:54:06 +0200
X-Gm-Features: Ac12FXy9_6cG2MPPRC87qxo9hknhSzyQbNu-GNhShhmF__u_g4RQSIAwjbhmZUU
Message-ID: <CABdCQ=NKrXMqt+7Pj1oL2_6isi6w2q3bJLRrS8LFxLixNu+d9A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: sitronix,
 st7920: Add DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Sep 2025 11:45:22 +0000
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

El mi=C3=A9, 10 sept 2025 a las 13:35, Krzysztof Kozlowski
(<krzk@kernel.org>) escribi=C3=B3:
>
> On Tue, Sep 09, 2025 at 06:52:44PM +0200, Iker Pedrosa wrote:
> > Add binding for Sitronix ST7920 display.
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  .../bindings/display/sitronix,st7920.yaml          | 52 ++++++++++++++=
++++++++
> >  1 file changed, 52 insertions(+)
> >
>
> Please organize the patch documenting compatible (DT bindings) before the=
ir user.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation=
/devicetree/bindings/submitting-patches.rst#L46
>
> ...
>
> > +  reg:
> > +    description: The chip-select number for the device on the SPI bus.
>
> Drop description, obvious/redundant.
>
> > +    maxItems: 1
> > +
> > +  spi-max-frequency:
> > +    maximum: 600000
> > +
>
> I don't see how my comment about supply was addressed. You never
> responded, nothing explained in the changelog, nothing explained in the
> commit msg.

Sorry, I forgot to answer.

No supplies are needed. There's an optional contrast for the display,
but this isn't strictly needed.

>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - spi-max-frequency
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    // Example: ST7920 connected to an SPI bus
>
> Drop comment.
>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        display@0 {
> > +            compatible =3D "sitronix,st7920";
> > +            reg =3D <0>;
> > +            spi-max-frequency =3D <600000>;
> > +            spi-cs-high;
> > +        };
> > +    };
> >
> > --
> > 2.51.0
> >
