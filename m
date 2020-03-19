Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEED18AAF3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 04:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26266E965;
	Thu, 19 Mar 2020 03:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B26E6E965
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:03:52 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id j69so850300ila.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 20:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CND1werjXjnr3pVIsMouNWnu+A/2qN84WfMPPBk4tFs=;
 b=nlMZmFLl/uJOMabqLThpDbxRwiOdZjdjWBpeQrlSYVxL5TE8+x08oY3eV9MExhR7Bm
 cZTTR2hbN/mKPkSoKCqc7xqL+SxszyOuWp1XE/QEZxPjfDl2DRqKBRDA6JehtVrvehsR
 51iezRBS4iWkp5q3txgkVoNxYNjpxxj8aUqFzuiYG8i41uc4MqQtSyYD7PJTjG2FwakK
 0qFkazukeLapv9xkLHNcKO3vKf9y9mvgiAEM+k4a9sk8U8wqFysM6jF5daHEwrNwkRSX
 cpJxdBjHOLq+cez/sC24uuAfPP39UD+IF1ufjp5AEpc2JwIHCuX515qb1WPNGcLza+nY
 6/1Q==
X-Gm-Message-State: ANhLgQ0L2QGv8mRGJw04zuzPXDU/eEe/r7mtPYcjwBcl43iUec1hm4UC
 GqnEBS1YDqVTUC2J1lGTSg==
X-Google-Smtp-Source: ADFU+vvvaIyQmliyGtnvNHkWxNq15ZE9edlH7I0JSMtircoI1Ajn5rZI1LeIcw4jrt1tPg3sa58WBw==
X-Received: by 2002:a92:aa0e:: with SMTP id j14mr1277521ili.52.1584587031724; 
 Wed, 18 Mar 2020 20:03:51 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id w22sm325250ili.71.2020.03.18.20.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 20:03:51 -0700 (PDT)
Received: (nullmailer pid 922 invoked by uid 1000);
 Thu, 19 Mar 2020 03:03:45 -0000
Date: Wed, 18 Mar 2020 21:03:45 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 26/36] dt-bindings: display: convert sony, acx565akm to
 DT Schema
Message-ID: <20200319030345.GG29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-27-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-27-sam@ravnborg.org>
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

On Sun, Mar 15, 2020 at 02:44:06PM +0100, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/sony,acx565akm.txt | 30 -----------
>  .../display/panel/sony,acx565akm.yaml         | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
> deleted file mode 100644
> index e12333280749..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Sony ACX565AKM SDI Panel
> -========================
> -
> -Required properties:
> -- compatible: "sony,acx565akm"
> -
> -Optional properties:
> -- label: a symbolic name for the panel
> -- reset-gpios: panel reset gpio
> -
> -Required nodes:
> -- Video port for SDI input
> -
> -Example
> --------
> -
> -acx565akm@2 {
> -	compatible = "sony,acx565akm";
> -	spi-max-frequency = <6000000>;
> -	reg = <2>;
> -
> -	label = "lcd";
> -	reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
> -
> -	port {
> -		lcd_in: endpoint {
> -			remote-endpoint = <&sdi_out>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> new file mode 100644
> index 000000000000..a0b1abb9f33d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx565akm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony ACX565AKM SDI Panel
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: ../../spi/spi-slave.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,acx565akm
> +
> +  label: true
> +  reset-gpios: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - port
> +
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        acx565akm@2 {

panel@2

> +            compatible = "sony,acx565akm";
> +            spi-max-frequency = <6000000>;
> +            reg = <2>;
> +
> +            label = "lcd";
> +            reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
> +
> +            port {
> +                lcd_in: endpoint {
> +                    remote-endpoint = <&sdi_out>;
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
