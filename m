Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C26F0C0B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 20:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB50510E377;
	Thu, 27 Apr 2023 18:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833710E377
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 18:37:08 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-b8f510fecf4so13396006276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682620627; x=1685212627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFyU6RzzaWKzYQaB6d+4t8LyXp1LdQYNUdPNzYi7/h8=;
 b=HtY/DrgzGk3h4mFu2d6z33PwyHYydkJ+NBB4QlHY2snwb9ss1G8DMKOSNLZYSfMBrf
 L9HrRa7Qi91+ewz4uCqmCXi6PffsNxEgyy27JYm4IaOHWpQO1iFnJ39HPj7ADkgWhgXu
 oO783CuL8Er/66b5OhJW0YrvGmtuekT+MqSgaRTW7JXAz7wWq8YUVAH1Q43yvLQszZnf
 D1dVCT7sFkmekVAl/Jq4Ynk1RUeiK6oMDAqkk81qX2oJO5f0YuuUkuj5x4LhVtaW0r26
 oa+BqOF/W4Hub1s/EKssPZgNx3t1rhfbFZe1tRO3R1ig17jjLn1SrheUS06MwRtb8fWp
 JHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682620627; x=1685212627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFyU6RzzaWKzYQaB6d+4t8LyXp1LdQYNUdPNzYi7/h8=;
 b=Y209L5+jisZqrBNdbgbQOP8fK+2IECBSg4sPfkZpkXTtUAtcZLXhrtCEDPAhljAF1t
 PpP2l679kI5nt8NvIVnZg8twJTyyvHmE2oQEllM2Tf0XeqsTSdgJAd7pUONRPFqjt0km
 i71TUmvumO/wbYg3+nFWwUWkWoNOimUl/Ijqw1F4SJvofb+xU4MBtaRdoUUdytDWrQ+2
 xSwXYw17U0Ixoz0wty9K99ivasRqjmRJogTONpqtJaW+AUi916S/KZwg1hRNn+dHTKdt
 mm/E3DFyV4PgKMXwWusRuK9qBTi4119iQlsfngmuIFYvYUyEX18QKdGfuggp+IXCp6dx
 Avtg==
X-Gm-Message-State: AC+VfDxxsL4MwmCCTFyRVNQHyVh2Noztu8nIfzby2yWtar4q20EJu9EO
 +9kjboBUgdWPSDyibyUAyDtH/zxalXAt8t26lyk=
X-Google-Smtp-Source: ACHHUZ5kfpWpgI8QLz6dJm1lPtmJAogFkq7qb2Shv4MtdtAmRW5KuuaGfUGAHEbHc0k1Nb7jmHOxyKxgQj4ClUZRznA=
X-Received: by 2002:a25:4907:0:b0:b92:2a56:bcc5 with SMTP id
 w7-20020a254907000000b00b922a56bcc5mr1589957yba.56.1682620626836; Thu, 27 Apr
 2023 11:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
 <1682535272-32249-3-git-send-email-justinpopo6@gmail.com>
 <20230427171625.GA3172205-robh@kernel.org>
In-Reply-To: <20230427171625.GA3172205-robh@kernel.org>
From: Justin Chen <justinpopo6@gmail.com>
Date: Thu, 27 Apr 2023 11:36:55 -0700
Message-ID: <CAJx26kUGs7B=v10YEPAP3jPu6FXSBTn0oBhQkfoiGY0E-PvUjA@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch,
 linux@armlinux.org.uk, netdev@vger.kernel.org, richardcochran@gmail.com,
 hkallweit1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, justin.chen@broadcom.com, edumazet@google.com,
 opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, christian.koenig@amd.com,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 10:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 26, 2023 at 11:54:28AM -0700, Justin Chen wrote:
> > From: Florian Fainelli <f.fainelli@gmail.com>
> >
> > Add a binding document for the Broadcom ASP 2.0 Ethernet
> > controller.
> >
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> > Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> > ---
> >  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 145 +++++++++++++=
++++++++
> >  1 file changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b=
/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> > new file mode 100644
> > index 000000000000..818d91692e6e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom ASP 2.0 Ethernet controller
> > +
> > +maintainers:
> > +  - Justin Chen <justinpopo6@gmail.com>
> > +  - Florian Fainelli <f.fainelli@gmail.com>
> > +
> > +description: Broadcom Ethernet controller first introduced with 72165
> > +
> > +properties:
> > +  '#address-cells':
> > +    const: 1
> > +  '#size-cells':
> > +    const: 1
> > +
> > +  compatible:
> > +    enum:
> > +      - brcm,asp-v2.0
> > +      - brcm,bcm72165-asp-v2.0
> > +      - brcm,asp-v2.1
> > +      - brcm,bcm74165-asp-v2.1
>
> You have 1 SoC per version, so what's the point of versions? If you have
> more coming, then fine, but I'd expect it to be something like this:
>
> compatible =3D "brcm,bcm74165-asp-v2.1", "brcm,asp-v2.1";
>
> Also, the version in the SoC specific compatible is redundant. Just
> "brcm,bcm74165-asp" is enough.
>
> v2.1 is not compatible with v2.0? What that means is would a client/OS
> that only understands what v2.0 is work with v2.1 h/w? If so, you should
> have fallback compatible.
>
v2.1 is not compatible with v2.0 unfortunately. So no, a client/OS
that only understands v2.0 will not work with v2.1 h/w.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  ranges: true
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    items:
> > +      - description: RX/TX interrupt
> > +      - description: Port 0 Wake-on-LAN
> > +      - description: Port 1 Wake-on-LAN
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  ethernet-ports:
>
> The ethernet-switch.yaml schema doesn't work for you?
>
Technically it is not a switch. But it might work... If we use port to
reference the unimac and reg to reference the ethernet channel. I
rather not though, just cause it is not a switch, so calling it an
ethernet-switch is confusing.

> > +    type: object
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^port@[0-9]+$":
> > +        type: object
> > +
> > +        $ref: ethernet-controller.yaml#
> > +
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +            description: Port number
> > +
> > +          channel:
> > +            maxItems: 1
> > +            description: ASP channel number
>
> Not a standard property, so it needs a type and vendor prefix. However,
> what's the difference between channel and port? Can the port numbers
> correspond to the channels?
>
Port refers to the unimac. In our case we currently have a maximum of
2. Channel refers to the ethernet hardware channel proper, in which we
have many. So yes, you can have a port correlate to any channel.

> > +
> > +        required:
> > +          - reg
> > +          - channel
> > +
> > +    additionalProperties: false
> > +
> > +patternProperties:
> > +  "^mdio@[0-9a-f]+$":
> > +    type: object
> > +    $ref: "brcm,unimac-mdio.yaml"
>
> Drop quotes.
>
> > +
> > +    description:
> > +      ASP internal UniMAC MDIO bus
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    ethernet@9c00000 {
> > +        compatible =3D "brcm,asp-v2.0";
> > +        reg =3D <0x9c00000 0x1fff14>;
> > +        interrupts =3D <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> > +        ranges;
> > +        clocks =3D <&scmi 14>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        mdio@c614 {
> > +            compatible =3D "brcm,asp-v2.0-mdio";
> > +            reg =3D <0xc614 0x8>;
>
> You have 1:1 ranges, is that really what you want? That means 0xc614 is
> an absolute address.
Ack, will fix.

Thanks for the review,
Justin

>
> > +            reg-names =3D "mdio";
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            phy0: ethernet-phy@1 {
> > +                reg =3D <1>;
> > +            };
> > +       };
> > +
> > +        mdio@ce14 {
> > +            compatible =3D "brcm,asp-v2.0-mdio";
> > +            reg =3D <0xce14 0x8>;
> > +            reg-names =3D "mdio";
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            phy1: ethernet-phy@1 {
> > +                reg =3D <1>;
> > +            };
> > +        };
> > +
> > +        ethernet-ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                channel =3D <8>;
> > +                phy-mode =3D "rgmii";
> > +                phy-handle =3D <&phy0>;
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                channel =3D <9>;
> > +                phy-mode =3D "rgmii";
> > +                phy-handle =3D <&phy1>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.7.4
> >
