Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35BE14AA10
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 19:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388056E90B;
	Mon, 27 Jan 2020 18:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664696E90B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 18:49:41 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id r27so9423529otc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 10:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hGBm/FHBYQPO3SnIsbIyzOljZ22wv42ASP4mKhEoOFM=;
 b=G2yHwjTVt/P6cXojlHlvQJjPYpobPcHUcJd8dXRzXPw+bikGh01p6LJyW7qHu1o/CZ
 v/YJ3fexcurtRGu8d4a1XpNU91f9pVz3OnNFSFsdc+vWx15foYGlYy0c96Qf4/nkrSJe
 0aMag0XDN4Een82YEunGt9Hw3zCY+E1KE91WPmyNiPw8eXxWJsUrcTRfigAwPoYSwwee
 Ym7LZr9pje2PgHvRht/LH1Plg5qEZSBXcEZWRl2/+pqgk+CsqxSv+fe8+4POl7iPbxTB
 EjXcp7Paib1HnsrCa6Bvz1spWN0vUgDof6cBMQxzTX5u7gW7TYwBLIzXTMXJ2f8RN7t3
 hLSA==
X-Gm-Message-State: APjAAAWnieZGt1myrFrkCJhZMMXZbDTlFGzOpkWN05J3E9GYH3VIAmts
 RlZcoVQ75TqSf5aTfGF7sw==
X-Google-Smtp-Source: APXvYqyJiWy4dlUsawGnDmHPwC0KvTg3gRd2eqBgWW0mBSa+a6zqBV8eI8voaNEYtpy9DO4pEOPbkg==
X-Received: by 2002:a9d:784b:: with SMTP id c11mr13010105otm.246.1580150980656; 
 Mon, 27 Jan 2020 10:49:40 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w20sm3119264otj.21.2020.01.27.10.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 10:49:40 -0800 (PST)
Received: (nullmailer pid 11942 invoked by uid 1000);
 Mon, 27 Jan 2020 18:49:39 -0000
Date: Mon, 27 Jan 2020 12:49:39 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add documentation
 for Toshiba tc358768
Message-ID: <20200127184939.GA4237@bogus>
References: <20200127105634.7638-1-peter.ujfalusi@ti.com>
 <20200127105634.7638-2-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127105634.7638-2-peter.ujfalusi@ti.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, tomi.valkeinen@ti.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 12:56:33PM +0200, Peter Ujfalusi wrote:
> TC358768/TC358778 is a Parallel RGB to MIPI DSI bridge.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../display/bridge/toshiba,tc358768.yaml      | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> new file mode 100644
> index 000000000000..8dd8cca39a77
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358768.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toschiba TC358768/TC358778 Parallel RGB to MIPI DSI bridge
> +
> +maintainers:
> +  - Peter Ujfalusi <peter.ujfalusi@ti.com>
> +
> +description: |
> +  The TC358768/TC358778 is bridge device which converts RGB to DSI.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - toshiba,tc358768
> +      - toshiba,tc358778
> +
> +  reg:
> +    maxItems: 1
> +    description: base I2C address of the device
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active low RESX pin
> +
> +  vddc-supply:
> +    description: Regulator for 1.2V internal core power.
> +
> +  vddmipi-supply:
> +    description: Regulator for 1.2V for the MIPI.
> +
> +  vddio-supply:
> +    description: Regulator for 1.8V - 3.3V IO power.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: refclk
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          Video port for RGB input
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              data-lines:
> +                enum: [ 16, 18, 24 ]
> +
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          Video port for DSI output (panel or connector).
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddc-supply
> +  - vddmipi-supply
> +  - vddio-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c1 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      dsi_bridge: tc358768@0e {

Generic node names and no leading 0s:

dsi-bridge@e

> +        compatible = "toshiba,tc358768";
> +        reg = <0x0e>;
> +
> +        clocks = <&tc358768_refclk>;
> +        clock-names = "refclk";
> +
> +        /* GPIO line is inverted before going to the bridge */
> +        reset-gpios = <&pcf_display_board 0 1 /* GPIO_ACTIVE_LOW */>;

You just need to add the include for the define to work.

> +
> +        vddc-supply = <&v1_2d>;
> +        vddmipi-supply = <&v1_2d>;
> +        vddio-supply = <&v3_3d>;
> +
> +        dsi_bridge_ports: ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            rgb_in: endpoint {
> +              remote-endpoint = <&dpi_out>;
> +              data-lines = <24>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            dsi_out: endpoint {
> +              remote-endpoint = <&lcd_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +    
> -- 
> Peter
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
