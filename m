Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97713211CD4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDD46EA54;
	Thu,  2 Jul 2020 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF6E6E04A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:44:21 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id e64so19357116iof.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 02:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fGeQt73YLZDSgkNvInP41dA5HOJzHtYDGii2eUndiOY=;
 b=LlPGQTYAL31mGCANG3wjaxWf3sJMnxYPD0V54qxdNESAnD8RGtq8nAH63/V2tIS9Cl
 rnihv9FgZ5EGCaLh8X118pNyQ+kKVM9d74KLLy8T7ri8GWpRqn/8rRO90pQxkqfUP/k+
 QhLOvw18ncTYjxqVaUmQptsTBY1GwvcyoCOuiKddHIUEVJ36AIfwH6HEJCwluGxzLSoz
 C5dbnTMAUfqN4IL9Wjf6CAzA4uGll1CqFaqa6Mwxv1k32HjdHZUG9Sieplachr0OOlPm
 8yRhGAwwFoH954yX6R0U1CQEkN78x04aN6cnXEbH/t6ckbgNHdLZamvHQSX7FCITA9Ec
 OetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fGeQt73YLZDSgkNvInP41dA5HOJzHtYDGii2eUndiOY=;
 b=dVTtgK6764dvETGgqrN6Zr1tBdLbFQwg68VVY5EvbjqF5xYQ6qwAxBBG9vw08ZRtBJ
 +4CzcH2tUKlYPZ3UoP4jqH6ivT4oVJQ/yv5AIM/fzdOexACahNEmOCysbkBdpKOtmGF8
 SMAwd2RAlySDauFXAznchbZa03sPBHbCvTv9CL8Xh+9L2jKpsQ0r4ljsLDKjc8PGW19G
 eftDMwiRszosiQ1xsdSSg7XrSMD4vcuGg8bBcssFG7U8RB3dntFcQV8kkpimk6vKo6Lm
 aMJ35xgUiQT9+CeoFZ8awiEdOGAKna3mHFde7EPlnC7fySf+PsGqiRCwg8CXdHv1BXi1
 rpUA==
X-Gm-Message-State: AOAM532/apekCckoUMqVjubG5a7kTc0SyT06ajtfvR0T7b3FQ/CTTQeS
 iWk7ojmsWj8z4MJX36RXczv4YzP0NdpVKeIkriI=
X-Google-Smtp-Source: ABdhPJyLwaoEkVL7usLojRTWsM93a32sjtPqscU6Q6KkjBbOQEl3c+/u6Q1GKlUvBUgntUzj9LMYvgmfyqZC7o51uGY=
X-Received: by 2002:a05:6602:2e81:: with SMTP id
 m1mr1360470iow.147.1593596660576; 
 Wed, 01 Jul 2020 02:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200701070344.6330-1-simhavcs@gmail.com>
 <20200701091940.GB266726@ravnborg.org>
In-Reply-To: <20200701091940.GB266726@ravnborg.org>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Wed, 1 Jul 2020 15:14:09 +0530
Message-ID: <CAGWqDJ51_QRHLP0mUyaCJCiKMJkGmbwuR9y2rZ=t=Mo7gCdb1w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-binding: Add DSI/LVDS TC358775 bridge bindings
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris.Cheng@taec.toshiba.com,
 Ken-Sue.Tan@taec.toshiba.com, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Bhushan.Patel@taec.toshiba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sam,

I rechecked, but did not find any indents are too spaced.
This is taken from a working dts tree.

I had given two examples for a purpose. One for single lvds
configuration single link mode,
another is for dual lvds configurations dual-link mode and port mappings.

On Wed, Jul 1, 2020 at 2:49 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Vinay.
>
> On Wed, Jul 01, 2020 at 12:33:36PM +0530, Vinay Simha BN wrote:
> > This driver is tested with two panels with Apq8016-IFC6309 board
> > https://www.inforcecomputing.com/products/single-board-computers-sbc/qualcomm-snapdragon-410-inforce-6309-micro-sbc
> >
> > 1. 1366x768@60 auo,b101xtn01 data-mapping = "jeida-24"
> > 2. 800x480@60 innolux,at070tn92 data-mapping = "vesa-24"
> >
> > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> >
> > ---
> > v1:
> >  Initial version wast .txt file
> >
> > v2:
> >  From txt to yaml file format
> >
> > v3:
> > * Andrzej Hajda review comments incorporated
> >   dual port lvds implemented
> >
> > * Laurent Pinchart review comments incorporated
> >   dsi lanes property removed and it is dynamically
> >   picked from the dsi ports
> >   VESA/JEIDA format picked from panel-lvds dts
> > ---
> >  .../display/bridge/toshiba,tc358775.yaml      | 204 ++++++++++++++++++
> >  1 file changed, 204 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> > new file mode 100644
> > index 000000000000..ec53d62d408b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> > @@ -0,0 +1,204 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358775.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toshiba TC358775 DSI to LVDS bridge bindings
> > +
> > +maintainers:
> > + - Vinay Simha BN <simhavcs@gmail.com>
> > +
> > +description: |
> > + This binding supports DSI to LVDS bridge TC358775
> > +
> > +properties:
> > +  compatible:
> > +    const: toshiba,tc358775
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: i2c address of the bridge, 0x0f
> > +
> > +  vdd-supply:
> > +    maxItems: 1
> > +    description:  1.2V LVDS Power Supply
> > +
> > +  vddio-supply:
> > +    maxItems: 1
> > +    description: 1.8V IO Power Supply
> > +
> > +  stby-gpios:
> > +    maxItems: 1
> > +    description: Standby pin, Low active
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: Hardware reset, Low active
> > +
> > +  ports:
> > +    type: object
> > +    description:
> > +      A node containing input and output port nodes with endpoint definitions
> > +      as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        description: |
> > +          DSI Input. The remote endpoint phandle should be a
> > +          reference to a valid mipi_dsi_host device node.
> > +
> > +      port@1:
> > +        type: object
> > +        description: |
> > +          Video port for LVDS output (panel or connector).
> > +
> > +      port@2:
> > +        type: object
> > +        description: |
> > +          Video port for Dual link LVDS output (panel or connector).
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > + - compatible
> > + - reg
> > + - vdd-supply
> > + - vddio-supply
> > + - stby-gpios
> > + - reset-gpios
> > + - ports
> > +
> > +examples:
> > + - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c@78b8000 {
> > +        /* On High speed expansion */
> > +        label = "HS-I2C2";
> > +        reg = <0x078b8000 0x500>;
> > +        clock-frequency = <400000>; /* fastmode operation */
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        tc_bridge: bridge@f {
> > +            compatible = "toshiba,tc358775";
> > +            reg = <0x0f>;
> > +
> > +            vdd-supply = <&pm8916_l2>;
> > +            vddio-supply = <&pm8916_l6>;
> > +
> > +            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
> > +            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    d2l_in_test: endpoint {
> > +                        remote-endpoint = <&dsi0_out>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    lvds_out: endpoint {
> > +                        remote-endpoint = <&panel_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +    dsi@1a98000 {
> > +        reg = <0x1a98000 0x25c>;
> > +        reg-names = "dsi_ctrl";
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            port@1 {
> > +                reg = <1>;
> > +                dsi0_out: endpoint {
> > +                    remote-endpoint = <&d2l_in_test>;
> > +                        data-lanes = <0 1 2 3>;
> > +                };
> > +             };
> > +         };
> > +     };
> > +
> Fix indent. One of the '}' is indented one space too much.
>
>
> > + - |
> > +    i2c@78b8000 {
> > +        /* On High speed expansion */
> > +        label = "HS-I2C2";
> > +        reg = <0x078b8000 0x500>;
> > +        clock-frequency = <400000>; /* fastmode operation */
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> What is the purpose with the second example?
> Does it explain the binding better in some way?
>
> The examples shall help understanding the binding, not help
> understanding the HW. The latter is the role of the binding.
>
>
> > +
> > +        tc_bridge_dual: bridge@f {
> > +            compatible = "toshiba,tc358775";
> > +            reg = <0x0f>;
> > +
> > +            vdd-supply = <&pm8916_l2>;
> > +            vddio-supply = <&pm8916_l6>;
> > +
> > +            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
> > +            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    d2l_in_dual: endpoint {
> > +                        remote-endpoint = <&dsi0_out_dual>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    lvds0_out: endpoint {
> > +                        remote-endpoint = <&panel_in0>;
> > +                    };
> > +                };
> > +
> > +                port@2 {
> > +                    reg = <2>;
> > +                    lvds1_out: endpoint {
> > +                        remote-endpoint = <&panel_in1>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +    dsi@1a98000 {
> > +        reg = <0x1a98000 0x25c>;
> > +        reg-names = "dsi_ctrl";
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            port@1 {
> > +                reg = <1>;
> > +                dsi0_out_dual: endpoint {
> > +                    remote-endpoint = <&d2l_in_dual>;
> > +                        data-lanes = <0 1 2 3>;
> > +                };
> > +             };
> > +         };
> > +     };
> If this example is kept then fix indent of '}'.
>
>         Sam
> > +...
> > --
> > 2.17.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
regards,
vinaysimha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
