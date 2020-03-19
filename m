Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7418AB1E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 04:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818906E959;
	Thu, 19 Mar 2020 03:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6D46E959
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:22:28 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id w15so909772ilq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 20:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PKvd37vyAwPPIJhqFLDoBYloHbAC6NbPFy6rsa6ssic=;
 b=ii5tH2awo67rJDdApJql6/KlYh0TrWH2NR/856SivQCeGobkNSXjlfTOzICz6o6G0Y
 WlpmQRUemlY/d03s+hFAGcBrgrYyqRLAXnWpATwcCIGI79TrGjmuIyLK7ivdLMpE1pkF
 WLp//H5/J5LMiOJtPCl4sbLZJBWo7UPeDswQlEJhoxsItMNcUdcQM6LK4L5MU6OMPSGC
 JV/KDV/eAnvXR9bGn0IN95ASsOKbCu1Zk+xZCVTDZaXXIu71aiS5F7wPeG0CJOcetkoH
 /kaOf/lXgLA5WFYUTcROYjM41WmpPjPCZ3WdMQ6ajAiI9rtkmL2Vlfc+1sesW03sdWZZ
 tdPA==
X-Gm-Message-State: ANhLgQ0qr2JRAfWptkPWcsn/H4yFFjQKLC7r1jeW9qdSMXqHqC5jiziK
 bCs66giTnf9i7ObJxsCNKw==
X-Google-Smtp-Source: ADFU+vvwzqFRFORRH0szoEb9SOitQ3nRweLaQw0NI9PHb4vwXsrwi9AziirF/1fIeC0vv+qBVX4yHg==
X-Received: by 2002:a92:894b:: with SMTP id n72mr1354938ild.138.1584588148015; 
 Wed, 18 Mar 2020 20:22:28 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id s69sm339878ill.73.2020.03.18.20.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 20:22:27 -0700 (PDT)
Received: (nullmailer pid 26783 invoked by uid 1000);
 Thu, 19 Mar 2020 03:22:22 -0000
Date: Wed, 18 Mar 2020 21:22:22 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 18/36] dt-bindings: display: convert raydium,rm67191
 to DT Schema
Message-ID: <20200319032222.GK29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-19-sam@ravnborg.org>
 <20200319025814.GE29911@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319025814.GE29911@bogus>
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

On Wed, Mar 18, 2020 at 08:58:15PM -0600, Rob Herring wrote:
> On Sun, Mar 15, 2020 at 02:43:58PM +0100, Sam Ravnborg wrote:
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Robert Chiras <robert.chiras@nxp.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../display/panel/raydium,rm67191.txt         | 41 ----------
> >  .../display/panel/raydium,rm67191.yaml        | 75 +++++++++++++++++++
> >  2 files changed, 75 insertions(+), 41 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
> > deleted file mode 100644
> > index 10424695aa02..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -Raydium RM67171 OLED LCD panel with MIPI-DSI protocol
> > -
> > -Required properties:
> > -- compatible: 		"raydium,rm67191"
> > -- reg:			virtual channel for MIPI-DSI protocol
> > -			must be <0>
> > -- dsi-lanes:		number of DSI lanes to be used
> > -			must be <3> or <4>
> > -- port: 		input port node with endpoint definition as
> > -			defined in Documentation/devicetree/bindings/graph.txt;
> > -			the input port should be connected to a MIPI-DSI device
> > -			driver
> > -
> > -Optional properties:
> > -- reset-gpios:		a GPIO spec for the RST_B GPIO pin
> > -- v3p3-supply:		phandle to 3.3V regulator that powers the VDD_3V3 pin
> > -- v1p8-supply:		phandle to 1.8V regulator that powers the VDD_1V8 pin
> > -- width-mm:		see panel-common.txt
> > -- height-mm:		see panel-common.txt
> > -- video-mode:		0 - burst-mode
> > -			1 - non-burst with sync event
> > -			2 - non-burst with sync pulse
> > -
> > -Example:
> > -
> > -	panel@0 {
> > -		compatible = "raydium,rm67191";
> > -		reg = <0>;
> > -		pinctrl-0 = <&pinctrl_mipi_dsi_0_1_en>;
> > -		pinctrl-names = "default";
> > -		reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> > -		dsi-lanes = <4>;
> > -		width-mm = <68>;
> > -		height-mm = <121>;
> > -
> > -		port {
> > -			panel_in: endpoint {
> > -				remote-endpoint = <&mipi_out>;
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> > new file mode 100644
> > index 000000000000..b78b66a4336f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/raydium,rm67191.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Raydium RM67171 OLED LCD panel with MIPI-DSI protocol
> > +
> > +maintainers:
> > +  - Robert Chiras <robert.chiras@nxp.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: raydium,rm67191
> > +
> > +  reg: true
> > +  port: true
> > +  reset-gpios: true
> > +  width-mm: true
> > +  height-mm: true
> > + 
> > +  dsi-lanes:
> > +    description: Number of DSI lanes to be used must be <3> or <4>
> > +    enum: [3, 4]
> > +
> > +  v3p3-supply:
> > +    description: phandle to 3.3V regulator that powers the VDD_3V3 pin
> > +
> > +  v1p8-supply:
> > +    description: phandle to 1.8V regulator that powers the VDD_1V8 pin
> > +
> > +  video-mode:
> > +    description: |
> > +      0 - burst-mode
> > +      1 - non-burst with sync event
> > +      2 - non-burst with sync pulse
> > +    enum: [0, 1, 2]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - dsi-lanes
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        panel {
> 
> panel@0
> 
> I thought our dsi bus binding would catch this...

Uhhh, it's looking for dsi-controller(@.*)? which is not the common 
case found in dts files. We should fix that to dsi(@.*)?.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
