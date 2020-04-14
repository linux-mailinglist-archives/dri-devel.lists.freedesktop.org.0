Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF31A8A07
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569406E52A;
	Tue, 14 Apr 2020 18:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026A26E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:47:19 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b13so764460oti.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jI5GQiLVOxKQgJGoRbru3LLxPgI3+K1oaKOVEty/3Gc=;
 b=qYMY/7I9mpZxOU6gTS64gk/1z7SuD1BzmyTykCHf6CDDG3H8Ez6lyfpdh/QruzQSVt
 tvDp+uf1ca59uCXToXag0acgeuyWfkEwX085rRt1NH8mS9PqMq9RvjcrjNXBdzjdx9+X
 XcM0N9isZmNugnhIl6XGe6dutw/faSqxQQk6FVlKHomypLicQi9l5xkfwiGYGIYzFxpG
 zPlmRH+52rcBLRju3Jmq1JsX4TAZzoUrsgfVWGyqWTcbCPT8Ac7ZiRtQN7u145l0Lai6
 TqFJTxuiho9OH4ipdzn/GdmCxYvlFKfttFfN5L6E9Tyqf7TYKuvqO/EsZ+C1HmyQTjqC
 mVVA==
X-Gm-Message-State: AGi0PubvSM13Y98Z55jF5O1bW+Tnh5nHYDu+RtDmbnWCFD+XGKoLIGnf
 Srd67svMzX5hHVeA+DtHlg==
X-Google-Smtp-Source: APiQypICVMAJ3rUfhOIX9QOG379C3kowOxUgsspLa6RJ13MfZvbl1Khu/1vpylQacO61qM/Cgu56jg==
X-Received: by 2002:a05:6830:1d98:: with SMTP id
 y24mr19609176oti.76.1586890038231; 
 Tue, 14 Apr 2020 11:47:18 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h14sm2009616oov.11.2020.04.14.11.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:47:17 -0700 (PDT)
Received: (nullmailer pid 31211 invoked by uid 1000);
 Tue, 14 Apr 2020 18:47:16 -0000
Date: Tue, 14 Apr 2020 13:47:16 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 23/36] dt-bindings: display: convert samsung,s6e8aa0
 to DT Schema
Message-ID: <20200414184716.GA22496@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-24-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-24-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 09:50:56PM +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/samsung,s6e8aa0.txt         | 56 -----------
>  .../display/panel/samsung,s6e8aa0.yaml        | 96 +++++++++++++++++++
>  2 files changed, 96 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
> deleted file mode 100644
> index 9e766c5f86da..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
> -
> -Required properties:
> -  - compatible: "samsung,s6e8aa0"
> -  - reg: the virtual channel number of a DSI peripheral
> -  - vdd3-supply: core voltage supply
> -  - vci-supply: voltage supply for analog circuits
> -  - reset-gpios: a GPIO spec for the reset pin
> -  - display-timings: timings for the connected panel as described by [1]
> -
> -Optional properties:
> -  - power-on-delay: delay after turning regulators on [ms]
> -  - reset-delay: delay after reset sequence [ms]
> -  - init-delay: delay after initialization sequence [ms]
> -  - panel-width-mm: physical panel width [mm]
> -  - panel-height-mm: physical panel height [mm]
> -  - flip-horizontal: boolean to flip image horizontally
> -  - flip-vertical: boolean to flip image vertically
> -
> -The device node can contain one 'port' child node with one child
> -'endpoint' node, according to the bindings defined in [2]. This
> -node should describe panel's video bus.
> -
> -[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
> -[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	panel {
> -		compatible = "samsung,s6e8aa0";
> -		reg = <0>;
> -		vdd3-supply = <&vcclcd_reg>;
> -		vci-supply = <&vlcd_reg>;
> -		reset-gpios = <&gpy4 5 0>;
> -		power-on-delay= <50>;
> -		reset-delay = <100>;
> -		init-delay = <100>;
> -		panel-width-mm = <58>;
> -		panel-height-mm = <103>;
> -		flip-horizontal;
> -		flip-vertical;
> -
> -		display-timings {
> -			timing0: timing-0 {
> -				clock-frequency = <57153600>;
> -				hactive = <720>;
> -				vactive = <1280>;
> -				hfront-porch = <5>;
> -				hback-porch = <5>;
> -				hsync-len = <5>;
> -				vfront-porch = <13>;
> -				vback-porch = <1>;
> -				vsync-len = <2>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> new file mode 100644
> index 000000000000..67c99b0492e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
> +
> +maintainers:
> +  - Andrzej Hajda <a.hajda@samsung.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e8aa0
> +
> +  reg: true
> +  reset-gpios: true
> +  display-timings: true
> +
> +  vdd3-supply:
> +    description: core voltage supply
> +
> +  vci-supply:
> +    description: voltage supply for analog circuits
> + 
> +  power-on-delay:
> +    description: delay after turning regulators on [ms]
> +
> +  reset-delay:
> +    description: delay after reset sequence [ms]

Needs a type ref.

> +
> +  init-delay:
> +    description: delay after initialization sequence [ms]

Same here.

> +
> +  panel-width-mm:
> +    description: physical panel width [mm]
> +
> +  panel-height-mm:
> +    description: physical panel height [mm]
> +
> +  flip-horizontal:
> +    description: boolean to flip image horizontally

type: boolean

> +
> +  flip-vertical:
> +    description: boolean to flip image vertically

type: boolean

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd3-supply 
> +  - vci-supply
> +  - reset-gpios
> +  - display-timings
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel {

panel@0

> +            compatible = "samsung,s6e8aa0";
> +            reg = <0>;
> +            vdd3-supply = <&vcclcd_reg>;
> +            vci-supply = <&vlcd_reg>;
> +            reset-gpios = <&gpy4 5 0>;
> +            power-on-delay= <50>;
> +            reset-delay = <100>;
> +            init-delay = <100>;
> +            panel-width-mm = <58>;
> +            panel-height-mm = <103>;
> +            flip-horizontal;
> +            flip-vertical;
> +
> +            display-timings {
> +                timing0: timing-0 {
> +                    clock-frequency = <57153600>;
> +                    hactive = <720>;
> +                    vactive = <1280>;
> +                    hfront-porch = <5>;
> +                    hback-porch = <5>;
> +                    hsync-len = <5>;
> +                    vfront-porch = <13>;
> +                    vback-porch = <1>;
> +                    vsync-len = <2>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
