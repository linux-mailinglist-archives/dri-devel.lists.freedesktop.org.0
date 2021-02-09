Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC031540D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 17:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE6F6EB75;
	Tue,  9 Feb 2021 16:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31BB6EB75
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 16:38:24 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id 123so4381426ooi.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 08:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQ88ktMveXLIFjVYi4XLJQTN5XKyqacXyZXIGcsGiCs=;
 b=uX6chGICeQ5H3ZfF0WCHcl8pYJQjqLp8CnKEvy5cB4iGOltfrDXdqyBhlgD/VUxIdz
 psYm7DWvwALqBFB5kS2eDAkSQhmgzGbicBJSEXOkstYcX3O3YieEKV3FIQhK8SXZTMCx
 4Fu5tra+6r2tBwADjKLz1LpvsaWOrzjyqLqIoytMv9soVwtMtrJ8IvVxmIicJBDWeqM+
 y299mTOgjmW/XCFlDBsO2n7/zvHRsyljoTeFfZPO+dxrnnAS68dFlWruZYyrgUlV3ct7
 R1+mm9v0AOPLubw9hFzUd2LzMUupKm22SEKOqnmx6V6qUs/CWVBbhe/aLSWKdFjHFdOB
 OjAg==
X-Gm-Message-State: AOAM530stYLDe7VjtV8ZyyUTolm3I8MufyDNksG2CCPiQMNCmXqNny1W
 NTI/p3uBS+3wKpL7gY3xtA==
X-Google-Smtp-Source: ABdhPJyVYqJkRSlVwkuaXSCn5iGg2F2ZS9AACtrBVl6W1FRn+PDFWJy5SUmUPRPoMrkPqrR4nEHY2w==
X-Received: by 2002:a4a:424c:: with SMTP id i12mr16605365ooj.85.1612888704019; 
 Tue, 09 Feb 2021 08:38:24 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e30sm48346ooh.32.2021.02.09.08.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 08:38:22 -0800 (PST)
Received: (nullmailer pid 3898734 invoked by uid 1000);
 Tue, 09 Feb 2021 16:38:20 -0000
Date: Tue, 9 Feb 2021 10:38:20 -0600
From: Rob Herring <robh@kernel.org>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Add documentation for
 LT8912
Message-ID: <20210209163820.GB3892603@robh.at.kernel.org>
References: <20210124150835.1522899-1-adrien.grassein@gmail.com>
 <20210124150835.1522899-3-adrien.grassein@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210124150835.1522899-3-adrien.grassein@gmail.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 airlied@linux.ie, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 24, 2021 at 04:08:34PM +0100, Adrien Grassein wrote:
> Lontium LT8912 is a DSI to HDMI bridge.
> 
> Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
> ---
>  .../display/bridge/lontium,lt8912.yaml        | 92 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +
>  2 files changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
> new file mode 100644
> index 000000000000..ed1a6ddaab2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt8912.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT8912 MIPI to HDMI Bridge
> +
> +maintainers:
> +  - Adrien Grassein <adrien.grassein@gmail.com>
> +
> +description: |
> +  The LT8912 is a bridge device which convert DSI to HDMI
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lontium,lt8912
> +
> +  reg:
> +    maxItems: 1
> +
> +  ddc-i2c-bus:

This belongs in an hdmi-connector node.

> +    maxItems: 1
> +    description: i2c bus used to read EDID of the connected display.
> +
> +  dsi-lanes:
> +    maxItems: 1
> +    description: dsi lanes count interconnected with lt8912.

'data-lanes' in the graph is the standard way to do this.

You'll need video-interfaces.yaml which is pending in the media tree.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active high RESET pin.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Primary MIPI port-1 for MIPI input

You're going to need a port for the connector.

> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - ddc-i2c-bus
> +  - dsi-lanes
> +  - reg
> +  - reset-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c4 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hdmi-bridge@48 {
> +        compatible = "lontium,lt8912";
> +        reg = <0x48>;
> +        reset-gpios = <&max7323 0 GPIO_ACTIVE_LOW>;
> +        dsi-lanes = <4>;
> +        ddc-i2c-bus = <&ddc_i2c_bus>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            hdmi_out_in: endpoint {
> +              remote-endpoint = <&mipi_dsi_out>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +    ddc_i2c_bus: i2c5 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5aa18cbfb883..01e7e356bfac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10472,6 +10472,11 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>  F:	drivers/hid/hid-lg-g15.c
>  
> +LONTIUM LT8912 MIPI TO HDMI BRIDGE
> +M:	Adrien Grassein <adrien.grassein@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
> +
>  LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
>  M:	Sathya Prakash <sathya.prakash@broadcom.com>
>  M:	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
