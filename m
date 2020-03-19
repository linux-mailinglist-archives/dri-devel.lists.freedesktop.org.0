Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ABF18AAE2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 03:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9826E0CD;
	Thu, 19 Mar 2020 02:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD186E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 02:54:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id e20so311056ios.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 19:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jRhELSIFosVhDEfSNhPBf3PHkVl8ZbRKQYUpPQ7wXzU=;
 b=iL5nyke4uGRkgzMFdir9PU4041tW0i/nJKFCyOtzY1uHL5lFonC2GCgIilhnpUGJaK
 nhdOwMotwG7dHJ5s9GswQ2inxQ12vPKnSw1dmdp85veSMJOJFlYHExh05pNbKyOvIjvn
 CZYr9WRcVUc6zDNP0emie5t4A2v1eSOLr2TzsSFUrSwVUSVw42EGT1OQ0n/V1enKp3/o
 bV5On1TiEChCyt8kdhYTRdGkVkyxzlsNYIrM/GiN8QcWV48I0G0yQ9p1boQre4TVLtEF
 faR1haUVPgpydT20W/V8XoYQolTX61OEQ7+RyxL0+tAeBn0UYHFvOAmqOfPGoEEfrcgK
 5X3g==
X-Gm-Message-State: ANhLgQ1cIAl4Lv6f9VdVU2mIf/+Wb25pp77RMVzjA0gDwYqXFTNPJflh
 7jytq+a3Wz+5ShxbBoYIbw==
X-Google-Smtp-Source: ADFU+vvO6YKwIA3nl5Aq0cvBeeEaRXfOPZCSBBGG5GRV0LI81AIikeYB18kU3nz/ODE3APMAgXW1Kg==
X-Received: by 2002:a02:7714:: with SMTP id g20mr1134154jac.88.1584586440057; 
 Wed, 18 Mar 2020 19:54:00 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id n23sm323694ild.34.2020.03.18.19.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 19:53:59 -0700 (PDT)
Received: (nullmailer pid 19802 invoked by uid 1000);
 Thu, 19 Mar 2020 02:53:56 -0000
Date: Wed, 18 Mar 2020 20:53:56 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 12/36] dt-bindings: display: convert jdi,lt070me05000
 to DT Schema
Message-ID: <20200319025356.GC29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-13-sam@ravnborg.org>
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

On Sun, Mar 15, 2020 at 02:43:52PM +0100, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/jdi,lt070me05000.txt        | 31 ---------
>  .../display/panel/jdi,lt070me05000.yaml       | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> deleted file mode 100644
> index 4989c91d505f..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -JDI model LT070ME05000 1200x1920 7" DSI Panel
> -
> -Required properties:
> -- compatible: should be "jdi,lt070me05000"
> -- vddp-supply: phandle of the regulator that provides the supply voltage
> -  Power IC supply (3-5V)
> -- iovcc-supply: phandle of the regulator that provides the supply voltage
> -  IOVCC , power supply for LCM (1.8V)
> -- enable-gpios: phandle of gpio for enable line
> -  LED_EN, LED backlight enable, High active
> -- reset-gpios: phandle of gpio for reset line
> -  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> -  XRES, Reset, Low active
> -- dcdc-en-gpios: phandle of the gpio for power ic line
> -  Power IC supply enable, High active
> -
> -Example:
> -
> -	dsi0: qcom,mdss_dsi@4700000 {
> -		panel@0 {
> -			compatible = "jdi,lt070me05000";
> -			reg = <0>;
> -
> -			vddp-supply = <&pm8921_l17>;
> -			iovcc-supply = <&pm8921_lvs7>;
> -
> -			enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
> -			reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
> -			dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
> new file mode 100644
> index 000000000000..e0abf68ecb19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/jdi,lt070me05000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: JDI model LT070ME05000 1200x1920 7" DSI Panel
> +
> +maintainers:
> +  - Vinay Simha BN <simhavcs@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: jdi,lt070me05000
> +
> +  enable-gpios: true
> +  reg: true
> +  reset-gpios: true
> +
> +  vddp-supply:
> +    description: |
> +      The regulator that provides the supply voltage Power IC supply (3-5V)
> +
> +  iovcc-supply:
> +    description: |
> +      The regulator that provides the supply voltage IOVCC,
> +      power supply for LCM (1.8V)
> +
> +  dcdc-en-gpios:
> +    description: |
> +      phandle of the gpio for power ic line
> +      Power IC supply enable, High active
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddp-supply
> +  - iovcc-supply
> +  - enable-gpios
> +  - reset-gpios
> +  - dcdc-en-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi: qcom,mdss_dsi@4700000 {

dsi {

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "jdi,lt070me05000";
> +            reg = <0>;
> +
> +            vddp-supply = <&pm8921_l17>;
> +            iovcc-supply = <&pm8921_lvs7>;
> +
> +            enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
> +            dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
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
