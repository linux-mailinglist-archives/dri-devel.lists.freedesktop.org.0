Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D818AADC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 03:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1F56E0CA;
	Thu, 19 Mar 2020 02:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2111D6E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 02:49:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id y24so710693ioa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 19:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I8iNR1+hmLqOvjeHPkSzzH6o4xUKxm3Foovicd7v/7c=;
 b=H+dIdzlIiVExX+z2eGmbdHfU7aYTkVr0lZ8XEIdsaDYjRPDJPkfCwF7MCjjrgwNVBo
 xa+RAYFAJ8BzIW7bVYM7O/AbP15D66i+HkSDy9GsBjDNfGsf8nKOa5WGCMT9tFSY9q0B
 FVTRrrZTj4SZOCNbrKAPCzKWZcD16Zu+aSXCVJjEzHoyFU+gGNb3tauzfNjf7cKdwJZ6
 ChCJvxJQjBDvsjxgXNSzR18C/qG2GfgkKFicAnTPnugGkL8ln970btJwSLsGDqlYWZCu
 /z+bze6slOkMMkMyDw0mzqTzLiUjhllsUBZi+qCYfVBK9ng+CZ3iCli22+5ttamA/cwt
 vkUw==
X-Gm-Message-State: ANhLgQ0NShJxtzCtllcPRhOOG25LbK2zx2/8HlNeUdDW/X7fjg71VbRf
 W1kxbzGyMAXYDk2shMs7HQ==
X-Google-Smtp-Source: ADFU+vssk5i7OAkbciAzXy4RqfIbgraA+MkHyU8BtSMwj1/iWgZCmjx9dUAao8lMFv+IAp1wgD1xUQ==
X-Received: by 2002:a6b:fc1a:: with SMTP id r26mr811247ioh.134.1584586139361; 
 Wed, 18 Mar 2020 19:48:59 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id r29sm307156ilk.76.2020.03.18.19.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 19:48:58 -0700 (PDT)
Received: (nullmailer pid 13019 invoked by uid 1000);
 Thu, 19 Mar 2020 02:48:56 -0000
Date: Wed, 18 Mar 2020 20:48:56 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 04/36] dt-bindings: display: convert
 arm,versatile-tft-panel to DT Schema
Message-ID: <20200319024856.GB29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-5-sam@ravnborg.org>
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

On Sun, Mar 15, 2020 at 02:43:44PM +0100, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/arm,versatile-tft-panel.txt | 31 -----------
>  .../panel/arm,versatile-tft-panel.yaml        | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
> deleted file mode 100644
> index 0601a9e34703..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -ARM Versatile TFT Panels
> -
> -These panels are connected to the daughterboards found on the
> -ARM Versatile reference designs.
> -
> -This device node must appear as a child to a "syscon"-compatible
> -node.
> -
> -Required properties:
> -- compatible: should be "arm,versatile-tft-panel"
> -
> -Required subnodes:
> -- port: see display/panel/panel-common.yaml, graph.txt
> -
> -
> -Example:
> -
> -sysreg@0 {
> -	compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
> -	reg = <0x00000 0x1000>;
> -
> -	panel: display@0 {
> -		compatible = "arm,versatile-tft-panel";
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&foo>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
> new file mode 100644
> index 000000000000..8ad7305887b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/arm,versatile-tft-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Versatile TFT Panels
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  These panels are connected to the daughterboards found on the
> +  ARM Versatile reference designs.
> +
> +  This device node must appear as a child to a "syscon"-compatible
> +  node.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: arm,versatile-tft-panel
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sysreg {
> +        compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
> +        reg = <0x00000 0x1000>;
> +
> +        panel: display@0 {

Drop the unit-address or add 'reg'.

> +            compatible = "arm,versatile-tft-panel";
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&foo>;
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
