Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3639434043
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 23:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0629A6E041;
	Tue, 19 Oct 2021 21:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17E26E041
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 21:14:21 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 b4-20020a9d7544000000b00552ab826e3aso3800327otl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rxPAMPXkEmgM/eAA416WKz8VLt+xRYrbLcupdEp4vW8=;
 b=SKa50YmriCPqLAbxXdNeu0NE/4DoYBnurx/LqL88ztpqQfXPHAoASCr9pwPQNOCg88
 tz5IVJPcR3zAa3/93qmK+N2CF06yLVnI3Fe9YSlMR7TKjmX6F/QSLlhCpoGVK29UZwxw
 JI+uodb9lqsRU4yI0f8PXNriFMBPDIhHsSrED7b8SGVeh58ve7PSJHQ/ZHRHUM/SIa4Q
 Rnkg1uOp+NqG2BWdMV3ZOUQPOMRoSkSxE3l5NVe4aC/eA+TeLfHqZuf4b1/htpjog94B
 Y4A+7gj/tfa5kTvmJ/eDDagRXmbRv2tWE8WVNgB9durpthjADUgDcLvkLkclbsGSAjL1
 dEgA==
X-Gm-Message-State: AOAM5328pwSb2Mkr8S3DssHdcjnQvQmv0RTeGiNRNM9wJjLi7nQKN+Kl
 JrBNipg2vJsyouppj7nEaQ==
X-Google-Smtp-Source: ABdhPJxTXk3YUcoJAZL3ZeINf+u/Q3Yq2PVlqXzt2+/j9wNmWvCLUfqzzxMnUJzQRgmUZ1kDOP+upA==
X-Received: by 2002:a05:6830:2316:: with SMTP id
 u22mr7131795ote.239.1634678061020; 
 Tue, 19 Oct 2021 14:14:21 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-67-78-118-34.sw.biz.rr.com.
 [67.78.118.34])
 by smtp.gmail.com with ESMTPSA id bg16sm53542oib.14.2021.10.19.14.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 14:14:20 -0700 (PDT)
Received: (nullmailer pid 852663 invoked by uid 1000);
 Tue, 19 Oct 2021 21:14:18 -0000
Date: Tue, 19 Oct 2021 16:14:18 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, ajaykumar.rs@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/bridge: ps8622: Convert to YAML
 binding
Message-ID: <YW81KhW1lL4prPnU@robh.at.kernel.org>
References: <20211007081930.84653-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007081930.84653-1-angelogioacchino.delregno@collabora.com>
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

On Thu, Oct 07, 2021 at 10:19:30AM +0200, AngeloGioacchino Del Regno wrote:
> Convert the Parade PS8622 eDP/DP to LVDS bridge documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/bridge/parade,ps8622.yaml         | 102 ++++++++++++++++++
>  .../bindings/display/bridge/ps8622.txt        |  31 ------
>  2 files changed, 102 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ps8622.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml b/Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml
> new file mode 100644
> index 000000000000..dda9ceeac60c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/parade,ps8622.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade PS8622 eDP/DP to LVDS bridge
> +
> +maintainers:
> +  - Ajay Kumar <ajaykumar.rs@samsung.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - parade,ps8622
> +      - parade,ps8625
> +
> +  reg:
> +    description: I2C address of the bridge
> +    maxItems: 1
> +
> +  lane-count:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description: Number of DP lanes to use
> +    maxItems: 1

It's a uint32, so it's already 1 item.

I'd assume only 1, 2, or 4 lanes are valid, so 'enum: [ 1, 2, 4 ]'. Or 
something similar.

> +
> +  use-external-pwm:
> +    type: boolean
> +    description: Backlight controlled by an external PWM
> +
> +  sleep-gpios:
> +    description: GPIO connected to the PD_ signal.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO connected to the RST_ signal.
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for LVDS output
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for eDP input
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - sleep-gpios
> +  - reset-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c1 {

i2c {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@48 {
> +        compatible = "parade,ps8622";
> +        reg = <0x48>;
> +        lane-count = <1>;
> +        sleep-gpios = <&gpc3 5 GPIO_ACTIVE_HIGH>;
> +        reset-gpios = <&gpy7 7 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            bridge_out: endpoint {
> +              remote-endpoint = <&panel_in>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            bridge_in: endpoint {
> +              remote-endpoint = <&dp_out>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/bridge/ps8622.txt b/Documentation/devicetree/bindings/display/bridge/ps8622.txt
> deleted file mode 100644
> index c989c3807f2b..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/ps8622.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -ps8622-bridge bindings
> -
> -Required properties:
> -	- compatible: "parade,ps8622" or "parade,ps8625"
> -	- reg: first i2c address of the bridge
> -	- sleep-gpios: OF device-tree gpio specification for PD_ pin.
> -	- reset-gpios: OF device-tree gpio specification for RST_ pin.
> -
> -Optional properties:
> -	- lane-count: number of DP lanes to use
> -	- use-external-pwm: backlight will be controlled by an external PWM
> -	- video interfaces: Device node can contain video interface port
> -			    nodes for panel according to [1].
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -	lvds-bridge@48 {
> -		compatible = "parade,ps8622";
> -		reg = <0x48>;
> -		sleep-gpios = <&gpc3 6 1 0 0>;
> -		reset-gpios = <&gpc3 1 1 0 0>;
> -		lane-count = <1>;
> -		ports {
> -			port@0 {
> -				bridge_out: endpoint {
> -					remote-endpoint = <&panel_in>;
> -				};
> -			};
> -		};
> -	};
> -- 
> 2.33.0
> 
> 
