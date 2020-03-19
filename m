Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA818AAD6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 03:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A326E0C8;
	Thu, 19 Mar 2020 02:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537876E0C8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 02:47:16 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id p1so856755ils.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 19:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LFJUbgPmZnM/0vjLHNR92Cihn1D16v1W4tMgoyRC/8Y=;
 b=YBUOzDU+48BccSdRrfOHF5aTQTe392xkG/LiuEInJLel8E0V1uKjEGFH5QhMgZTY7L
 PzpcadEZEOCjsgDdwbcr56fRAgDRZL6agqOPeG9i/1l5BEEvpBNPsMBBw4Zuvf6Kv6kx
 k602X/ZSZ6Vxa+6tCz3uJeMyds37ZGfpPGvy+BEoiG+6ppj7xoUf7mQ/dX3m0OdgK/vW
 xZQ0PXONhjunJ/bWo8YFxB9265BoR4v4WUi5TOAlcZ6ALooYZXFCzyWbZOPbSUHqUiES
 Gre1LkXFSxaBfq9SeJF/x3bg52aC3RkmL3ahl9NvL6fFYZ8arMF9NBmDIgDPfCq4iFG0
 oHUA==
X-Gm-Message-State: ANhLgQ3PIWjv+mnQBkJYsJVfyCzmFId636p8qPw0vDxhSzFjweIbdzlA
 EHt5m2508U9yFIIgGrhpMA==
X-Google-Smtp-Source: ADFU+vvB25aqqRFdEbb7Rs8BlZEuCb7ybdlBskdooN3izD0G2f/Xld2e6bLFF84uTsuI9uz6YIKIDQ==
X-Received: by 2002:a92:2910:: with SMTP id l16mr1072231ilg.155.1584586035604; 
 Wed, 18 Mar 2020 19:47:15 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id p70sm309238ilk.53.2020.03.18.19.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 19:47:14 -0700 (PDT)
Received: (nullmailer pid 10673 invoked by uid 1000);
 Thu, 19 Mar 2020 02:47:11 -0000
Date: Wed, 18 Mar 2020 20:47:11 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 03/36] dt-bindings: display: convert samsung,s6e63m0
 to DT Schema
Message-ID: <20200319024711.GA29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-4-sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 15, 2020 at 02:43:43PM +0100, Sam Ravnborg wrote:
> The binding for this panel is a SPI slave.
> Reference spi-slave.yaml
> to avoid duplicating all properties.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jonathan Bakker <xc-racer2@live.ca>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/samsung,s6e63m0.txt         | 33 -----------
>  .../display/panel/samsung,s6e63m0.yaml        | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
> deleted file mode 100644
> index 9fb9ebeef8e4..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Samsung s6e63m0 AMOLED LCD panel
> -
> -Required properties:
> -  - compatible: "samsung,s6e63m0"
> -  - reset-gpios: GPIO spec for reset pin
> -  - vdd3-supply: VDD regulator
> -  - vci-supply: VCI regulator
> -
> -The panel must obey rules for SPI slave device specified in document [1].
> -
> -The device node can contain one 'port' child node with one child
> -'endpoint' node, according to the bindings defined in [2]. This
> -node should describe panel's video bus.
> -
> -[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
> -[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -		s6e63m0: display@0 {
> -			compatible = "samsung,s6e63m0";
> -			reg = <0>;
> -			reset-gpio = <&mp05 5 1>;
> -			vdd3-supply = <&ldo12_reg>;
> -			vci-supply = <&ldo11_reg>;
> -			spi-max-frequency = <1200000>;
> -
> -			port {
> -				lcd_ep: endpoint {
> -					remote-endpoint = <&fimd_ep>;
> -				};
> -			};
> -		};
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
> new file mode 100644
> index 000000000000..204ed76da84d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e63m0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung s6e63m0 AMOLED LCD panel
> +
> +maintainers:
> +  - Jonathan Bakker <xc-racer2@live.ca>
> +
> +allOf:
> +  - $ref: ../../spi/spi-slave.yaml#
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e63m0
> +
> +  reg: true
> +  reset-gpios: true
> +  port: true
> +
> +  vdd3-supply:
> +    description: VDD regulator
> +
> +  vci-supply:
> +    description: VCI regulator
> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - vdd3-supply
> +  - vci-supply

Shouldn't port be required? Not really clear in the binding doc, but in 
the driver it doesn't look like display data goes over spi.

Rob

> +
> +examples:
> +  - |
> +    spi {
> +        reg = <0xf00 0x20>;

Drop this or do 'spi@f00'. If it doesn't warn with W=1, it's only a 
matter of time.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        display@0 {
> +            compatible = "samsung,s6e63m0";
> +            reg = <0>;
> +            reset-gpios = <&mp05 5 1>;
> +            vdd3-supply = <&ldo12_reg>;
> +            vci-supply = <&ldo11_reg>;
> +            spi-max-frequency = <1200000>;
> +
> +            port {
> +                lcd_ep: endpoint {
> +                    remote-endpoint = <&fimd_ep>;
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
