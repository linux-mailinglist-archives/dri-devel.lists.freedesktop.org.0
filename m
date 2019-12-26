Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65612AF30
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2019 23:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F1889D60;
	Thu, 26 Dec 2019 22:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA34889D60
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 22:24:51 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n11so17592630iom.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 14:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=37uqwtRwSPKrS7mePUoQwRbRxVBQ1BJulsNk0ZshgZ4=;
 b=ThFMArXNYMfT4zy0j9X/rm8wluZgdB7LzDJ31TNjTa4l9TDqOdLZUy+LWys/2QJuFE
 daVq2WS+a3WBvnZsnX+OSGViWraaj7BbRVGqA2NshKzxnkT94xk5y9pk+uCQX2mZoUf0
 L5659e/bLhorHRXPQR1s5wOEZhLVrQppKked5Q2WdivFIwR+a5rLrpx6YBNiLzxazz5Z
 bvFSya77B9GZHqobZFUtG+C2+hcVQx7JCUIDUAyg8BtZGzfWajH9mEWVaL+D6RtlvWOk
 hGKh4VXQxxmtv6c+VBwb6PKpaEjBhA6XksvZOKEELwVB3CErDzOD+xTB/cQrgJQqrDWf
 BIXw==
X-Gm-Message-State: APjAAAVp0VM3dosvZEUg5KS3HibwRMgSYqjkMQXdSehF9lLHu29NJ6E0
 zeZeP4Vr6O1nZUXrTrtSFg==
X-Google-Smtp-Source: APXvYqwpmWnPzmhjJucVegrp/qxb0MG6G7PSqjM7NScWUgWQvP5DpgC4uYsIS18fm8wbuiIy81ilQg==
X-Received: by 2002:a5d:8996:: with SMTP id m22mr33343498iol.141.1577399091059; 
 Thu, 26 Dec 2019 14:24:51 -0800 (PST)
Received: from localhost ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id m24sm8970619ioc.37.2019.12.26.14.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 14:24:50 -0800 (PST)
Date: Thu, 26 Dec 2019 15:24:49 -0700
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Add documentation for
 Toshiba tc358768
Message-ID: <20191226222449.GA8816@bogus>
References: <20191217101506.18910-1-peter.ujfalusi@ti.com>
 <20191217101506.18910-2-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217101506.18910-2-peter.ujfalusi@ti.com>
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
 tomi.valkeinen@ti.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 12:15:05PM +0200, Peter Ujfalusi wrote:
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
> index 000000000000..8f96867caca0
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
> +    maxItems: 1

Drop this. Not an array. *-supply doesn't need further constraints.

> +    description: Regulator for 1.2V internal core power.
> +
> +  vddmipi-supply:
> +    maxItems: 1
> +    description: Regulator for 1.2V for the MIPI.
> +
> +  vddio-supply:
> +    maxItems: 1
> +    description: Regulator for 1.8V - 3.3V IO power.

Blank line here.

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

No additionalProperties on this one?

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
> +        compatible = "toshiba,tc358768";
> +        reg = <0x0e>;
> +
> +        clocks = <&tc358768_refclk>;
> +        clock-names = "refclk";
> +
> +        /* GPIO line is inverted before going to the bridge */
> +        reset-gpios = <&pcf_display_board 0 1 /* GPIO_ACTIVE_LOW */>;
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
