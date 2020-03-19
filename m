Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3EE18AAE5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 03:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA146E0D1;
	Thu, 19 Mar 2020 02:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD02B6E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 02:56:08 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e20so314405ios.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 19:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PPkja5C25VerS45bxtKqwCdIAsJE8Q53wltiW2Ahl8s=;
 b=D7a+we9s3HPk4MB8FPQ94aYKu3lvUKWut9XWYNq5nXxbOYAVonnkOFeNRPTdwuX48e
 KA0nEkThsHFPY7sMdH3p9Qq+nV5expvB/zjsYZg3g572lHZvzbQJ/0XH5fBhvBIRV0jE
 cJ+bE8iuomEa4HLmyWw2Cl26n7RWUpOXY8g8ksYFJ0/KVCRyaZrhhhE/PsI37M11FhU9
 5wEwC6NvakRae0D92nLNf/eeuMT2XIuzD7M4km9vkLcv2odc4/Nb8O37lNTu9Ii2U7Nw
 mQkh9GZUAA6MuIShD6hNx5bGO0MSy7hhZWjPjVAKKQOACFjgl27obTSYqTgDFGBKMegF
 zcsQ==
X-Gm-Message-State: ANhLgQ1XPkSjzr/DmPXJ3QhNAW5gJIdiRCE19gD8kfmuHl97+kw48XTd
 EtwQDmZKMk01s+67hyN+HQ==
X-Google-Smtp-Source: ADFU+vu8Zs4sikgQ9qOl1rtXnWnxbh11VSlCCgp2VF3kXoJHSN0x4GdzUn913Ju/MZHC3HITrrVJBw==
X-Received: by 2002:a02:9608:: with SMTP id c8mr1114138jai.68.1584586566760;
 Wed, 18 Mar 2020 19:56:06 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id q17sm314741ilm.85.2020.03.18.19.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 19:56:06 -0700 (PDT)
Received: (nullmailer pid 22642 invoked by uid 1000);
 Thu, 19 Mar 2020 02:56:01 -0000
Date: Wed, 18 Mar 2020 20:56:01 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 16/36] dt-bindings: display: convert lg,lg4573 to DT
 Schema
Message-ID: <20200319025601.GD29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-17-sam@ravnborg.org>
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

On Sun, Mar 15, 2020 at 02:43:56PM +0100, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Heiko Schocher <hs@denx.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/lg,lg4573.txt      | 19 ---------
>  .../bindings/display/panel/lg,lg4573.yaml     | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,lg4573.txt b/Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
> deleted file mode 100644
> index 824441f4e95a..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -LG LG4573 TFT Liquid Crystal Display with SPI control bus
> -
> -Required properties:
> -  - compatible: "lg,lg4573"
> -  - reg: address of the panel on the SPI bus
> -
> -The panel must obey rules for SPI slave device specified in document [1].
> -
> -[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
> -
> -Example:
> -
> -	lcd_panel: display@0 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		compatible = "lg,lg4573";
> -		spi-max-frequency = <10000000>;
> -		reg = <0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml b/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
> new file mode 100644
> index 000000000000..b5b475cf8406
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lg,lg4573.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LG LG4573 TFT Liquid Crystal Display with SPI control bus
> +
> +maintainers:
> +  - Heiko Schocher <hs@denx.de>
> +
> +allOf:
> +  - $ref: ../../spi/spi-slave.yaml#
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: lg,lg4573
> +
> +  reg: true
> +  spi-max-frequency: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    spi {
> +        compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";

Better to drop this or it's going to fail when there's a schema for this 
spi controller.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        lcd_panel: display@0 {
> +            compatible = "lg,lg4573";
> +            spi-max-frequency = <10000000>;
> +            reg = <0>;
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
