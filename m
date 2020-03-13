Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE6184852
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 14:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50F86E9BD;
	Fri, 13 Mar 2020 13:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A896E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 13:40:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B60DD5F;
 Fri, 13 Mar 2020 14:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584106816;
 bh=F7N9mKjetm9h4v3eByCsaRQPgqXelP60n5xxonpCD5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wNjll5P4bFQRFi/OaEo6+XJQYs7WsNIgv6PVfVqfK+xbGXVXu3pywVy1PFlZdkTge
 3PaHsuL/FjN1dGV4CCjbqMwtEFH90pMnLUJ/csFSetiYKW1glllgtpoQ1KDDQ8P/Eu
 IkXjIu0BKDEqZ0l2FsA3NzqTWHsX/ZDMaMc2k43k=
Date: Fri, 13 Mar 2020 15:40:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Phong LE <ple@baylibre.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bridge: add it66121 bindings
Message-ID: <20200313134013.GC4751@pendragon.ideasonboard.com>
References: <20200311125135.30832-1-ple@baylibre.com>
 <20200311125135.30832-3-ple@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311125135.30832-3-ple@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 mchehab+samsung@kernel.org, sam@ravnborg.org,
 heiko.stuebner@theobroma-systems.com, icenowy@aosc.io,
 devicetree@vger.kernel.org, stephan@gerhold.net, jonas@kwiboo.se,
 robh+dt@kernel.org, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, jernej.skrabec@siol.net,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Phong,

Thank you for the patch.

On Wed, Mar 11, 2020 at 01:51:33PM +0100, Phong LE wrote:
> Add the ITE bridge HDMI it66121 bindings.
> 
> Signed-off-by: Phong LE <ple@baylibre.com>
> ---
>  .../bindings/display/bridge/ite,it66121.yaml  | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> new file mode 100644
> index 000000000000..1717e880d130
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it66121.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE it66121 HDMI bridge Device Tree Bindings
> +
> +maintainers:
> +  - Phong LE <ple@baylibre.com>
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The IT66121 is a high-performance and low-power single channel HDMI
> +  transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward compatible
> +  to DVI 1.0 specifications.
> +
> +properties:
> +  compatible:
> +    const: ite,it66121
> +
> +  reg:
> +    maxItems: 1
> +    description: base I2C address of the device
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active low reset
> +
> +  vrf12-supply:
> +    maxItems: 1
> +    description: Regulator for 1.2V analog core power.
> +
> +  vcn33-supply:
> +    maxItems: 1
> +    description: Regulator for 3.3V digital core power.
> +
> +  vcn18-supply:
> +    maxItems: 1
> +    description: Regulator for 1.8V IO core power.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  pclk-dual-edge:
> +    maxItems: 1
> +    description: enable pclk dual edge mode.

I'm having a bit of trouble understanding how this operates. Looking at
the driver code the property is only taken into account to calculate the
maximum allowed frequency. How is the IT66121 configured for single vs.
dual pixel clock edge mode ?

> +
> +  port:
> +    type: object
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        description: |
> +          Input endpoints of the bridge.
> +
> +    required:
> +      - endpoint

You should have two ports, one for the bridge input, and one for the
bridge output.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vrf12-supply
> +  - vcn33-supply
> +  - vcn18-supply
> +  - interrupts
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c6 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      it66121hdmitx: it66121hdmitx@4c {
> +        compatible = "ite,it66121";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&ite_pins_default>;
> +        vcn33-supply = <&mt6358_vcn33_wifi_reg>;
> +        vcn18-supply = <&mt6358_vcn18_reg>;
> +        vrf12-supply = <&mt6358_vrf12_reg>;
> +        reset-gpios = <&pio 160 1 /* GPIO_ACTIVE_LOW */>;
> +        interrupt-parent = <&pio>;
> +        interrupts = <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
> +        reg = <0x4c>;
> +        pclk-dual-edge;
> +
> +        port {
> +          it66121_in: endpoint {
> +            remote-endpoint = <&display_out>;
> +          };
> +        };
> +      };
> +    };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
