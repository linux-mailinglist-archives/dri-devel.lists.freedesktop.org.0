Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FE1B4781A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F23910E411;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bcfoB6Rq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D4A10E999
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 08:08:42 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id
 e9e14a558f8ab-3ecbe06f849so5674715ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756973321; x=1757578121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ly8rPu5Elk6gRUA9oOM6QiFvKyPaQYLkOhERLwvnX0k=;
 b=bcfoB6RqHBLgPd7KqIyZWnHqe87C+1cPujKH6AXVZRugnbnkGoOFCaKtxhRG7nuW8r
 l31CKC9xG87Znfvx2PRj2GzQIJb44NSYeWeg82QJNG9tVzILV2FmZX4mLDaNs+kUQm7N
 Rfjt+KEXwc6LwIPLmx3PeUjhbJnZhOM6CWUV4ajgr1vlG+hqr4WkaP6dhzQ4K8srvqaB
 bRJLd5CdhIz9fe1X2hQ5Hg+EdjiGe+7IbB/rB22HFlkIU68+URhs3g65GoCQ6l6cvVN9
 IPndesXZmOOvpWqLawIvNiRIo7+zUmAurntZo7mvAEfd/4gcQTeHQwwhhuo3S78fmjBs
 wW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973321; x=1757578121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ly8rPu5Elk6gRUA9oOM6QiFvKyPaQYLkOhERLwvnX0k=;
 b=EnwjvIY+oqvUqa/yStL2QizVnHqZTZWoTIcJmOxq//Qv4k4uoLaB6iLxjBsEfWTc+S
 t2joE9Wtz2V0bxP7pMACLFIvB/3QvHhKE66+fWgc399DkjD6+cFoDxwisprkKb5UfwMH
 YKpZJfob4c1IO/I7gUeDCXwIIDgHncf9BSoy/FW7w29BNXJnGQ8GaLlJLY/O6s6ksQYY
 L+QepN6Qo4aQpQ4/sKY17FTmOympacVwEQ9tCuioBrpJ2hu83r6yjACWxFt2WkkUk5a4
 oz/d4Dt8xGcPm0oHvjeM3wePSpIdwIhMquVgezbWem79awewgMydcocS1N25cMdfn+4h
 Bfaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp/35AGkA6MfQsPucmlUUgT4dQyVHHvaYaZZ7ZSgUjmL4+zQFfvGfBLP8gZfb/qrkiyTUvRkGjnU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySRCo6l+cl1p9yGBzELq8Nrj8b8JrexJLQZyFo0dQc6U8qvwej
 47rwm/YGRjDu0sITwi5FdX9v9PTQ86CSZzSflPVqQtwxf5YAGLD/7gxuAG/rC5U7V72JUZFOZHz
 4DMN5+srgAgx63obgknklwBO+ks1XZG0=
X-Gm-Gg: ASbGncuCPwy2vN//Xq/GZBygK4FTaAn3bIbHsexx+ha6b6JBZBOgnkX4Bkh2GXRHY5g
 RPlaEM5RrXMi85W/53beO7UmsccAw11EJKG+ICw+ohvPlgbZuRiT5TDc3H52wh0da5D4DnTtYr5
 zXfhSjk38dSSlR/TkjP+RdkiTdbB28aJJq/GL6b9rEGHOJF1zCb9Y241UXGm0xJYOrOahx2JXsP
 wvpr3xf/+7Onpn29g==
X-Google-Smtp-Source: AGHT+IGAucgTcZTwn46rpjl+cm6v0lSFEYGolR5lXmPUPEUGOC5/FpPQR9OBCkDWVEpJRTBXRcCbdn9ppWx5Lkla1OY=
X-Received: by 2002:a05:6e02:4702:b0:3f6:58b8:9c82 with SMTP id
 e9e14a558f8ab-3f658b89ca0mr52360525ab.12.1756973321505; Thu, 04 Sep 2025
 01:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <175691717884.2393851.6340903042726389490.robh@kernel.org>
 <20250904022524.1748587-1-syyang@lontium.com>
 <042523f7-2b75-4a04-8e0b-d1019ab84987@kernel.org>
In-Reply-To: <042523f7-2b75-4a04-8e0b-d1019ab84987@kernel.org>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 4 Sep 2025 16:08:30 +0800
X-Gm-Features: Ac12FXz_3Eda9GTnhCSIJ4uulYhw3s_gHBX5hgVGmYOzYtsyhg9ZR_eHPeUXbgE
Message-ID: <CAFQXuNZpLBP3=MGmRRpwJu43ZtkNhrTzh8kOwFgKy20rqFiG7Q@mail.gmail.com>
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
=97=A5=E5=91=A8=E5=9B=9B 13:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On 04/09/2025 04:25, syyang wrote:
> > Fix device tree binding validation errors reported by Rob Herring.
> >
> > v2:
>
> That's not the place where you put changelog.
>
I'm currently learning what to do. Thank you

> > - Fixed $id field to match actual filename (lontium,lt9611c.yaml)
> > - build pass
> >
> > Thanks to Rob Herring for the review and feedback.
>
> Please carefully read submitting patches.
>
I'm currently learning what to do. Thank you

> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
I'm currently learning what to do. Thank you.

> >
> > Signed-off-by: syyang <syyang@lontium.com>
> > ---
> >  .../display/bridge/lontium,lt9611c.yaml       | 121 ++++++++++++++++++
> >  1 file changed, 121 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/lo=
ntium,lt9611c.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,l=
t9611c.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt96=
11c.yaml
> > new file mode 100644
> > index 000000000000..712644da4f1d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.=
yaml
> > @@ -0,0 +1,121 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/lontium,lt9611c.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lontium LT9611C 2 Port MIPI to HDMI Bridge
> > +
> > +maintainers:
> > +  - Rob Herring <robh@kernel.org>
>
> No, how so?
>
I will change it to the email address I use when working at the
company.  (syyang@lontium.com)

> > +
> > +description: |
>
> Do not need '|' unless you need to preserve formatting.
>
Both lontium,lt9211.yaml and lontium,lt9611.yaml use "|", so please
confirm if they need to be removed.

> > +  The LT9611C are bridge devices which convert DSI to HDMI
>
> Why this cannot be added to lt9611 binding? Commit msg should clearly
> answer that.
>
The lt9611 and lt9611c are chips of different specifications, and
their related parameters are different.
The VDD-supply of lt9611c is 1.2V; the vdd-supply of lt9611uxc is also
1.2V, while the vdd-supply of lt9611 is 1.8V.
Now lt9611 and lt9611uxc are connected together. I'm not sure if this
is a problem.
If this lt9611c can also be bound to lt9611, and if you think it's
okay, then I have no problem.

> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - lontium,lt9611c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#sound-dai-cells":
>
> Missing dai-common ref.
>
I don't understand .   I referred to:
Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml

> > +    const: 0
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO connected to active high RESET pin.
> > +
> > +  vdd-supply:
> > +    description: Regulator for 1.2V MIPI phy power.
> > +
> > +  vcc-supply:
> > +    description: Regulator for 3.3V IO power.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Primary MIPI port-1 for MIPI input
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Additional MIPI port-2 for MIPI input, used in combination
> > +          with primary MIPI port-1 to drive higher resolution displays
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          HDMI port for HDMI output
> > +
> > +    required:
> > +      - port@0
> > +      - port@2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - vdd-supply
> > +  - vcc-supply
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c10 {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      hdmi-bridge@41 {
> > +        compatible =3D "lontium,lt9611c";
> > +        reg =3D <0x41>;
> > +        #sound-dai-cells =3D <0>;
> > +        interrupts-extended =3D <&pio 128 GPIO_ACTIVE_HIGH>;
> > +        reset-gpios =3D <&pio 127 GPIO_ACTIVE_HIGH>;
> > +        vdd-supply =3D <&lt9611_1v2>;
> > +        vcc-supply =3D <&lt9611_3v3>;
> > +        status =3D "okay";
>
> Nope, drop.
>
remove  status =3D "okay"  ?
>
>
> Best regards,
> Krzysztof
