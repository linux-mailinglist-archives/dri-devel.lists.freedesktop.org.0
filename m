Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715656538C8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 23:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55E610E08E;
	Wed, 21 Dec 2022 22:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246FF10E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:36:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 519D461988
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0514C43392
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671662171;
 bh=M/tRY0dtlLHanEM4j2N/f3MgAV3UJcjYrwR7A8LA+gs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mVUrEkg8zRQ7TSOkQUBdp7TE8RNclfXYOvxwJiCqdcEnXqCcogUVKz4dJyuKzdbdm
 fYgrFNzIXPUSFq1dJKKsa8EnqAkOyF+WLEhFp07WZOG7+crDHchayR9j2X4FSBPrtO
 ujaxValndvnwlMPyb6FJgfxbOOrQOQcj0rqQo7FoC7ICwM0uBuXemzqx+qTqbeEVTa
 yazso3peS/sYGtlt0qxwSfakN1zXY6TkTT+w1KYI2MNqymgCeN6+taqP8hdbg5pPr/
 Bu4G/3STagQV9C/a5DeT69RLHGxVJa+L3QSwwecy7tepR949nm+iiwLVkeq3nMnVC9
 GCtNdBlRwljRw==
Received: by mail-vs1-f41.google.com with SMTP id i2so165213vsc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 14:36:11 -0800 (PST)
X-Gm-Message-State: AFqh2kq8hhonfBeGZnAstJK2TpArz7YbYxhcVMmbRZAXYnMeA+BHIEw/
 BwBJ4MJqYdEol3MLS0k82Tv7A+q/jO3GyKjkDQ==
X-Google-Smtp-Source: AMrXdXuD7TYLmW0mSW/mYJAckH7H6ZU+Lruhm+3KZIf50DE0jUjltL5AsbTqRq+isZxtINz6jEQbpY5Y06hr4ebaBW0=
X-Received: by 2002:a67:6185:0:b0:3bf:3dbe:50aa with SMTP id
 v127-20020a676185000000b003bf3dbe50aamr478388vsb.26.1671662170541; Wed, 21
 Dec 2022 14:36:10 -0800 (PST)
MIME-Version: 1.0
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
 <fc68bedc-ff93-13bc-aa06-7920f5e53de6@gmail.com>
In-Reply-To: <fc68bedc-ff93-13bc-aa06-7920f5e53de6@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 21 Dec 2022 16:35:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLzrMtVBY3vSsykakKp8b_AzhQehOGj3T+RH_NqaTitXg@mail.gmail.com>
Message-ID: <CAL_JsqLzrMtVBY3vSsykakKp8b_AzhQehOGj3T+RH_NqaTitXg@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] dt-bindings: usb: convert fcs,
 fusb302.txt to yaml
To: Johan Jonker <jbx6244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 21, 2022 at 12:23 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Convert fcs,fusb302.txt to yaml.
>
> Changed:
>   Add vbus-supply property
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/usb/fcs,fusb302.txt   | 34 ----------
>  .../devicetree/bindings/usb/fcs,fusb302.yaml  | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/fcs,fusb302.yaml
>
> diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
> deleted file mode 100644
> index 60e465429..000000000
> --- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Fairchild FUSB302 Type-C Port controllers
> -
> -Required properties :
> -- compatible             : "fcs,fusb302"
> -- reg                    : I2C slave address
> -- interrupts             : Interrupt specifier
> -
> -Required sub-node:
> -- connector : The "usb-c-connector" attached to the FUSB302 IC. The bindings
> -  of the connector node are specified in:
> -
> -       Documentation/devicetree/bindings/connector/usb-connector.yaml
> -
> -
> -Example:
> -
> -fusb302: typec-portc@54 {
> -       compatible = "fcs,fusb302";
> -       reg = <0x54>;
> -       interrupt-parent = <&nmi_intc>;
> -       interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> -
> -       usb_con: connector {
> -               compatible = "usb-c-connector";
> -               label = "USB-C";
> -               power-role = "dual";
> -               try-power-role = "sink";
> -               source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> -               sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> -                            PDO_VAR(3000, 12000, 3000)
> -                            PDO_PPS_APDO(3000, 11000, 3000)>;
> -               op-sink-microwatt = <10000000>;
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.yaml b/Documentation/devicetree/bindings/usb/fcs,fusb302.yaml
> new file mode 100644
> index 000000000..9b172fda9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Fairchild FUSB302 Type-C Port controller
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>

Why me? I don't care, but that's kind of the default.

> +
> +properties:
> +  compatible:
> +    const: fcs,fusb302
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vbus-supply:
> +    description: VBUS power supply
> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#

       unevaluatedProperties: false

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vbus-supply
> +  - connector
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/usb/pd.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      fusb302: typec-portc@54 {

Drop unused labels.

> +        compatible = "fcs,fusb302";
> +        reg = <0x54>;
> +        interrupt-parent = <&nmi_intc>;
> +        interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +        vbus-supply = <&vbus_typec>;
> +
> +        usb_con: connector {
> +          compatible = "usb-c-connector";
> +          label = "USB-C";
> +          power-role = "dual";
> +          try-power-role = "sink";
> +          source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +          sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +                       PDO_VAR(3000, 12000, 3000)
> +                       PDO_PPS_APDO(3000, 11000, 3000)>;
> +          op-sink-microwatt = <10000000>;
> +        };
> +      };
> +    };
> --
> 2.20.1
>
