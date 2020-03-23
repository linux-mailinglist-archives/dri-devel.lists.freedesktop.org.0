Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574E1900E8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 23:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB1689EAE;
	Mon, 23 Mar 2020 22:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E646E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 22:09:11 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id h3so14936106ils.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 15:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vZ81zxCZMIgmSeBafIK/lYfMctImcol2Rgukq3RX2VQ=;
 b=I2p91JRl0HNCcVytIopD2UySNhYWl5Z3IPmuoNd7VKELKLNSFRMY3EdtLvaP4O5ZoH
 AQQ/XMiBcz48KV4MMh/ZkLSqoNv6nTyhey7vaPrPSzpCSZThQWYt3r0GuwGR0thhIhQF
 1fyswyov1n6Reb+RBdhqVZyVbhKh0ySd1HoJCbKVVTI0RNuuW0mWoQvP2K5f9L/VJqD6
 HrlmKyear9XtvUhcWVDLTNYN4gXbApYITrHqmCMSjg/3xwYQuqPVQ40lICwFuQAMchBu
 M3Rt4ST3zCAyLfPbDL0GDSJdTuJ2+ieVLS+9iAEydRXws8T+r61Zp6JGOAImNAkpUGqw
 Eo8g==
X-Gm-Message-State: ANhLgQ3/O9TcNTvGA0CmkdO9HWvrnkqP9jgFMC9QkeFy+e3CIZaXTHQy
 ZZWU/Mbnbf5PVrxE5w+bxw==
X-Google-Smtp-Source: ADFU+vsd05AO0Mnjm8m1n+SJIbnJIylZaJUIeQ09QPhBI7256Cv2qE4OXA4s9daeooy1ivHTyfr2Uw==
X-Received: by 2002:a92:8510:: with SMTP id f16mr23770430ilh.208.1585001350772; 
 Mon, 23 Mar 2020 15:09:10 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id 82sm920263iou.54.2020.03.23.15.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:09:10 -0700 (PDT)
Received: (nullmailer pid 24507 invoked by uid 1000);
 Mon, 23 Mar 2020 22:09:05 -0000
Date: Mon, 23 Mar 2020 16:09:05 -0600
From: Rob Herring <robh@kernel.org>
To: Phong LE <ple@baylibre.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bridge: add it66121 bindings
Message-ID: <20200323220905.GA17573@bogus>
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
 Laurent.pinchart@ideasonboard.com, mchehab+samsung@kernel.org,
 sam@ravnborg.org, heiko.stuebner@theobroma-systems.com, icenowy@aosc.io,
 devicetree@vger.kernel.org, stephan@gerhold.net, jonas@kwiboo.se,
 broonie@kernel.org, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, jernej.skrabec@siol.net,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

Drop this. Supplies are always a single item.

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

Not a valid property if this is boolean.

> +    description: enable pclk dual edge mode.
> +
> +  port:

You should have an output port to a connector node.

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

i2c {

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
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
