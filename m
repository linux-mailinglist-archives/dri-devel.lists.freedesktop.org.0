Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE141D339E
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049266EB59;
	Thu, 14 May 2020 14:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514AB6EB59
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:54:35 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id o24so24773436oic.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yB9VTl8KywTt9Ux7iGL6NMMzFHRwNMMveEGo6bB/Nqs=;
 b=fd/EyXc6ha5aEoRF6/8WkepPtGtZLJd+PCficqlJULbj2EPRZTYAiKPJDIuW+Nmmwb
 39myDhK/SsWZ/X/h8o84YchByTAFU9ZNlBVvFMlCcUbaZiffCbBosw+LtziU8C+6yH5q
 xnyXcVrRdtcnSl9a1r8rGNMkk7432U+4RddcqXecPNw7W2kvUKQ7IDPWYfc67KjyhUaL
 j3twHdtWq1DmYBWAS0R3Ot+JypZWwGH5Ll62tbK+Q9p/LuF4FwDbxtLhIys1G1Rd7BkS
 xLybyjq65tra3dvEqfti+/ayAsxfWuZzQuOy4DcSUpwpyktTnQUATO5a++OCTQqoJt31
 zUWw==
X-Gm-Message-State: AGi0PuYMnI4+ayy+QkHGPUlohwF+Zb/7TNW92prPmvYpxnxhnWYvH3YS
 /Xrcji4cNkkwuDCTaRzJSg==
X-Google-Smtp-Source: APiQypKK3YHethFZkt7Xx5I2o7MWAZ0bYDIOxjjLF2SWgo5qkdd1iKlpLeZMoOaRUFuLjsQuL2Qxeg==
X-Received: by 2002:a05:6808:a93:: with SMTP id
 q19mr31602743oij.6.1589468074296; 
 Thu, 14 May 2020 07:54:34 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n9sm819299otl.76.2020.05.14.07.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 07:54:33 -0700 (PDT)
Received: (nullmailer pid 26910 invoked by uid 1000);
 Thu, 14 May 2020 14:54:32 -0000
Date: Thu, 14 May 2020 09:54:32 -0500
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Message-ID: <20200514145432.GA6091@bogus>
References: <cover.1588747998.git.xji@analogixsemi.com>
 <b720f7d2c5338813d31b7f715f59ca68c367d5a8.1588747998.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b720f7d2c5338813d31b7f715f59ca68c367d5a8.1588747998.git.xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Nicolas Boichat <drinkcat@google.com>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 06, 2020 at 03:04:20PM +0800, Xin Ji wrote:
> The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> for portable device. It converts MIPI to DisplayPort 1.3 4K.
> 
> You can add support to your board with binding.

We have an example in the binding, no reason to also put in the commit 
msg.

> 
> Example:
> 	anx7625_bridge: encoder@58 {
> 		compatible = "analogix,anx7625";
> 		reg = <0x58>;
> 		status = "okay";
> 		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> 		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			mipi2dp_bridge_in: port@0 {
> 				reg = <0>;
> 				anx7625_in: endpoint {
> 					remote-endpoint = <&mipi_dsi>;
> 				};
> 			};
> 
> 			mipi2dp_bridge_out: port@1 {
> 				reg = <1>;
> 				anx7625_out: endpoint {
> 					remote-endpoint = <&panel_in>;
> 				};
> 			};
> 		};
> 	};
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> new file mode 100644
> index 0000000..6e54176
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Analogix Semiconductor, Inc.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Analogix ANX7625 SlimPort (4K Mobile HD Transmitter)
> +
> +maintainers:
> +  - Xin Ji <xji@analogixsemi.com>
> +
> +description: |
> +  The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> +  designed for portable devices.
> +
> +properties:
> +  "#address-cells": true
> +  "#size-cells": true

These don't belong here.

> +
> +  compatible:
> +    items:
> +      - const: analogix,anx7625
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: used for interrupt pin B8.
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: used for power on chip control, POWER_EN pin D2.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: used for reset chip control, RESET_N pin B7.
> +    maxItems: 1
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description:
> +          Video port for MIPI DSI input.
> +
> +      port@1:
> +        type: object
> +        description:
> +          Video port for panel or connector.
> +
> +    required:
> +        - port@0
> +        - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        anx7625_bridge: encoder@58 {

Drop any unused labels.

> +            compatible = "analogix,anx7625";
> +            reg = <0x58>;
> +            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                mipi2dp_bridge_in: port@0 {
> +                    reg = <0>;
> +                    anx7625_in: endpoint {
> +                        remote-endpoint = <&mipi_dsi>;
> +                    };
> +                };
> +
> +                mipi2dp_bridge_out: port@1 {
> +                    reg = <1>;
> +                    anx7625_out: endpoint {
> +                        remote-endpoint = <&panel_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
