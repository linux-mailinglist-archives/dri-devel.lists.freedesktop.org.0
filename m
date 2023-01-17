Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA21466E78F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 21:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC20B10E348;
	Tue, 17 Jan 2023 20:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B5A10E348
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:17:05 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id r9so2718757oig.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 12:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWeHEeDhyytvt0z9wAJVJnP5zvi6qEzhrzvFt2FSXKo=;
 b=Z/W0gTyeXcZZbiNAidcE2nrQVHB6lHxPP6O6gXq5Nx2mbXd54B4nqJaHuQvlkAOvdP
 +pK+5n3kTVrT25lH5Bj8N4MZxfpkOlrN+vK+rnqP4spKv9u2ZSjN9pGxyDQzmtmeFj5D
 +TEw8l5EykJl4p4kxC0fueb/zXylEdLpqBgNVC7QkhaB3FTdrQ1++S8fG7T60QaK40FR
 K8oeFTWyGAA5aeaWHvG3lYjEnZKkHJEeANYy2Brv+k5n2vY3vaWIXCRzoZOgfZyjxM8c
 +La20kUDE4jmzxsvzTrBDaIc9kDEs2AyDGB+gKn1sL7hJhZM/vNLRIryGlPMenZ9NFi6
 pvpQ==
X-Gm-Message-State: AFqh2kp5fSMp3P6HQXMinOloxc1dBQvH/Kga+CZM1qdCnlDhHZX075sl
 9AziMIgsel98UmtXZFQifA==
X-Google-Smtp-Source: AMrXdXvN97KhxW15va857G2nD7sxVdqeGZh+s1NP2CQrFacIO7mFtVEcuvxG4t9ucxbdl0jh4jbfPw==
X-Received: by 2002:a05:6808:b31:b0:360:ceb6:1f6f with SMTP id
 t17-20020a0568080b3100b00360ceb61f6fmr1910323oij.54.1673986624462; 
 Tue, 17 Jan 2023 12:17:04 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bu10-20020a0568300d0a00b0066eb4e9242esm17229273otb.67.2023.01.17.12.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 12:17:03 -0800 (PST)
Received: (nullmailer pid 3636832 invoked by uid 1000);
 Tue, 17 Jan 2023 20:17:03 -0000
Date: Tue, 17 Jan 2023 14:17:03 -0600
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add GPIO display
 mux binding
Message-ID: <20230117201703.GA3555326-robh@kernel.org>
References: <20230116110820.2615650-1-treapking@chromium.org>
 <20230116110820.2615650-2-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116110820.2615650-2-treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 07:08:19PM +0800, Pin-yen Lin wrote:
> From: Nicolas Boichat <drinkcat@chromium.org>
> 
> Add bindings for Generic GPIO mux driver.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
> Changes in v2:
> - Referenced existing dt-binding schemas from graph.yaml
> - Added ddc-i2c-bus into the bindings
> 
>  .../bindings/display/bridge/gpio-mux.yaml     | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> new file mode 100644
> index 000000000000..da29ba078f05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic display mux (1 input, 2 outputs)
> +
> +maintainers:
> +  - Nicolas Boichat <drinkcat@chromium.org>
> +
> +description: |
> +  This bindings describes a simple display (e.g. HDMI) mux, that has 1
> +  input, and 2 outputs. The mux status is controlled by hardware, and
> +  its status is read back using a GPIO.
> +
> +properties:
> +  compatible:
> +    const: gpio-display-mux
> +
> +  detect-gpios:
> +    maxItems: 1
> +    description: GPIO that indicates the active output

What are we detecting? That implies an input, but this is selecting the 
output path, right? Or what does 'mux status is controlled by hardware' 
mean exactly? Something else? That does not sound very generic.

In any case, we have a common mux binding so any kind of mux control 
could be used here, not just GPIO. Then you can make this just a generic 
display mux.

> +
> +  ddc-i2c-bus:
> +    description: phandle link to the I2C controller used for DDC EDID probing
> +    $ref: /schemas/types.yaml#/definitions/phandle

This belongs in the connector node(s). 

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: |
> +          Video port for input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: |
> +          2 video ports for output.
> +          The reg value in the endpoints matches the GPIO status: when
> +          GPIO is asserted, endpoint with reg value <1> is selected.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - detect-gpios
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    hdmi_mux: hdmi_mux {
> +      compatible = "gpio-display-mux";
> +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&hdmi_mux_pins>;
> +      ddc-i2c-bus = <&hdmiddc0>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 { /* input */
> +          reg = <0>;
> +
> +          hdmi_mux_in: endpoint {
> +            remote-endpoint = <&hdmi0_out>;
> +          };
> +        };
> +
> +        port@1 { /* output */
> +          reg = <1>;
> +
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          hdmi_mux_out_anx: endpoint@0 {
> +            reg = <0>;
> +            remote-endpoint = <&dp_bridge_in>;
> +          };
> +
> +          hdmi_mux_out_hdmi: endpoint@1 {
> +            reg = <1>;
> +            remote-endpoint = <&hdmi_connector_in>;
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 
