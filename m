Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F4047066C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 17:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEFF10E431;
	Fri, 10 Dec 2021 16:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B485510E431
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:53:21 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so10217331otl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 08:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f2wp1hAWgrRC49VCftrTow4JceyJ/E3jGWRhqUONy3E=;
 b=bNISxH0PoevuO7EjhMp3w6VIqmasNK6btMjHVkdIRrHPjd2GSffTOxnA+m4Vbbn3nW
 dD61Pf6m7kOMhpXpj7PHv0jA/oTZxZl8n9viHLIZnBO90R14AAkiYxErKCdGKiUYdjza
 hmn8WPYpdN7XoucfYfhE6/Wp7SepApVDnWpOriOzFOmdVfNIPapSpMZs+H1x7cGZ/LDE
 jVAmtAWdXxjLEyqdqj/VxJ6i1CR7ndnbbLqZQm594f4NaNlhjswwGIgkri4jgwsB/B4R
 DQiSyzfndF02G05QfuXo4mk7qjDq2D7Y3mTs69uATKjLg3aSfmG+cc0bOYVeMgt89gYL
 wGzA==
X-Gm-Message-State: AOAM533C7wLrjTfS2BoV3iggCp4YRBLuWEmSabCVlB/QMsK+pv89H0l+
 UKgaFQz2TpdjwpoljVArdQ==
X-Google-Smtp-Source: ABdhPJxhzRUkJAKFVqmngli/4xluAGV/SNq6SdpzNQU9xFUHh/yAnJa6IWohu6L2xwq0z1bo5kLV7A==
X-Received: by 2002:a9d:6d98:: with SMTP id x24mr11507597otp.371.1639155200962; 
 Fri, 10 Dec 2021 08:53:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f9sm587878oto.56.2021.12.10.08.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 08:53:20 -0800 (PST)
Received: (nullmailer pid 1513473 invoked by uid 1000);
 Fri, 10 Dec 2021 16:53:18 -0000
Date: Fri, 10 Dec 2021 10:53:18 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v11 3/8] dt-bindings: display: Add ingenic, jz4780-dw-hdmi
 DT Schema
Message-ID: <YbOF/pwib/VXoqkx@robh.at.kernel.org>
References: <cover.1638470392.git.hns@goldelico.com>
 <ac147196cd7744a7d50cf25197fe08bf9e81f88a.1638470392.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac147196cd7744a7d50cf25197fe08bf9e81f88a.1638470392.git.hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 07:39:48PM +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   | 78 +++++++++++++++++++
>  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> new file mode 100644
> index 0000000000000..49ae1130efded
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ingenic,jz4780-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |
> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
> +  TX controller IP with accompanying PHY IP.
> +
> +allOf:
> +  - $ref: synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: ingenic,jz4780-dw-hdmi
> +
> +  reg-io-width:
> +    const: 4
> +
> +  clocks:
> +    maxItems: 2
> +
> +  hdmi-5v-supply:
> +    description: regulator to provide +5V at the connector

Being part of the connector, that belongs in a connector node.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

You need to define what each 'port' node is.

> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - hdmi-5v-supply
> +  - ports
> +  - reg-io-width
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ingenic,jz4780-cgu.h>
> +
> +    hdmi: hdmi@10180000 {
> +        compatible = "ingenic,jz4780-dw-hdmi";
> +        reg = <0x10180000 0x8000>;
> +        reg-io-width = <4>;
> +        ddc-i2c-bus = <&i2c4>;
> +        interrupt-parent = <&intc>;
> +        interrupts = <3>;
> +        clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
> +        clock-names = "iahb", "isfr";
> +        hdmi-5v-supply = <&hdmi_power>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            hdmi_in: port@0 {
> +                reg = <0>;
> +                dw_hdmi_in: endpoint {
> +                    remote-endpoint = <&jz4780_lcd_out>;
> +                };
> +            };
> +            hdmi_out: port@1 {
> +                reg = <1>;
> +                dw_hdmi_out: endpoint {
> +                    remote-endpoint = <&hdmi_con>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> index 9be44a682e67a..9cbeabaee0968 100644
> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -50,6 +50,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  ddc-i2c-bus:
> +    description: An I2C interface if the internal DDC I2C driver is not to be used

That too is already defined to be part of the connector node.

> +
>  additionalProperties: true
>  
>  ...
> -- 
> 2.33.0
> 
> 
