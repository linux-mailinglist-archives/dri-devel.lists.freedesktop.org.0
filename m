Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124D5680EB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 10:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2375110F1C1;
	Wed,  6 Jul 2022 08:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9D910E0E4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 08:17:45 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t24so24628299lfr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zxEgUQKShb0lRQRTiY8pzzMuqPlmMV7N3JPs4Nr+3+4=;
 b=CVGN96LaQ0iwJhHVVj9woXp+Ne8W8/vdvDhLGI2yNvMW6TRNcRRVCd+ku4LHWajtty
 1s50NI3FLn/T4kHsHyk4gaLStGA+FBg0gKoFmiUqiFp8WQ80Y2JeuC1honizgMVVAZ5c
 ww/rw/Lm09dffF4HBlw2q9EdJ2CPMma7QFBPC/sgFt/7rwR2+Lka5RICHyfv4rDTXN1f
 ckgsadObgw05UV6ixaT418mLTDXyM9U2LZauU6NdCb9tgfbpM2u4MEeWgghGA8bzMhPG
 EAGOGq7LOPkxYlX9kCtllE1rHiAye/Ad2aiNogRoV0jvnV/RMZ1OTVxXd0KqX5TF0oa+
 GE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zxEgUQKShb0lRQRTiY8pzzMuqPlmMV7N3JPs4Nr+3+4=;
 b=oVGzefXVb59Dajz/IG7UiLVjyc+MPSr7Dl/w8UYflA7XmxXBGf7XlCukiKJUArPiKn
 72kE0fRwPHuHycfzaySskjQ/Lf5/LmJ6crzig5gQq/S0GFGb0tBZ3gP+RBpLGDMoHyQ/
 k6rljNuZo6A6m7ZF/KXU5gTQiht/ZYKn74GfSDGWRGpy5sb8HSWo3/1X0p5pGbZMvrSR
 6cGolPmZCxOIZwSqn0nUfm89wcfR1EQJRbi4CNQqZK2f6j7dkY3NoW4Lmf9o9B4APj37
 GC15nCInCFwbb6Cs3pm2iVwTGSEuWJpTnFdKhbsdcVMqZABHUH0j1AhfT3QmaiFrrfbz
 db4A==
X-Gm-Message-State: AJIora981EstzmlaJFqBmQEarIx/ScW4sgHZooXQkJpH0XHXiPmLG4N8
 BjyBrlHC6F4GAPOT7OfNJ88+Vw==
X-Google-Smtp-Source: AGRyM1urd3EIKHZti9p5ALjQH1gHIijjenH6NzPZZaDzIclsoYWzXLldRVcoKJmrr5Ng/rstORLdyw==
X-Received: by 2002:ac2:4bcb:0:b0:47f:87a0:b638 with SMTP id
 o11-20020ac24bcb000000b0047f87a0b638mr26011486lfq.313.1657095463934; 
 Wed, 06 Jul 2022 01:17:43 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a2ea26a000000b0025bbf597b8asm5199567ljm.71.2022.07.06.01.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:17:42 -0700 (PDT)
Message-ID: <2f809ae4-a7cc-4210-b56f-bd09e3f2a599@linaro.org>
Date: Wed, 6 Jul 2022 10:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 1/5] dt-bindings: display: bridge: Convert cdns, dsi.txt
 to yaml
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220705121116.24121-1-r-ravikumar@ti.com>
 <20220705121116.24121-2-r-ravikumar@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705121116.24121-2-r-ravikumar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 jpawar@cadence.com, lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2022 14:11, Rahul T R wrote:
> Convert cdns,dsi.txt binding to yaml format
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../bindings/display/bridge/cdns,dsi.txt      | 112 ----------
>  .../bindings/display/bridge/cdns,dsi.yaml     | 198 ++++++++++++++++++
>  2 files changed, 198 insertions(+), 112 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> deleted file mode 100644
> index 525a4bfd8634..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -Cadence DSI bridge
> -==================
> -
> -The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI lanes.
> -
> -Required properties:
> -- compatible: should be set to "cdns,dsi".
> -- reg: physical base address and length of the controller's registers.
> -- interrupts: interrupt line connected to the DSI bridge.
> -- clocks: DSI bridge clocks.
> -- clock-names: must contain "dsi_p_clk" and "dsi_sys_clk".
> -- phys: phandle link to the MIPI D-PHY controller.
> -- phy-names: must contain "dphy".
> -- #address-cells: must be set to 1.
> -- #size-cells: must be set to 0.
> -
> -Optional properties:
> -- resets: DSI reset lines.
> -- reset-names: can contain "dsi_p_rst".
> -
> -Required subnodes:
> -- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
> -  2 ports are available:
> -  * port 0: this port is only needed if some of your DSI devices are
> -	    controlled through  an external bus like I2C or SPI. Can have at
> -	    most 4 endpoints. The endpoint number is directly encoding the
> -	    DSI virtual channel used by this device.
> -  * port 1: represents the DPI input.
> -  Other ports will be added later to support the new kind of inputs.
> -
> -- one subnode per DSI device connected on the DSI bus. Each DSI device should
> -  contain a reg property encoding its virtual channel.
> -
> -Example:
> -	dsi0: dsi@fd0c0000 {
> -		compatible = "cdns,dsi";
> -		reg = <0x0 0xfd0c0000 0x0 0x1000>;
> -		clocks = <&pclk>, <&sysclk>;
> -		clock-names = "dsi_p_clk", "dsi_sys_clk";
> -		interrupts = <1>;
> -		phys = <&dphy0>;
> -		phy-names = "dphy";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@1 {
> -				reg = <1>;
> -				dsi0_dpi_input: endpoint {
> -					remote-endpoint = <&xxx_dpi_output>;
> -				};
> -			};
> -		};
> -
> -		panel: dsi-dev@0 {
> -			compatible = "<vendor,panel>";
> -			reg = <0>;
> -		};
> -	};
> -
> -or
> -
> -	dsi0: dsi@fd0c0000 {
> -		compatible = "cdns,dsi";
> -		reg = <0x0 0xfd0c0000 0x0 0x1000>;
> -		clocks = <&pclk>, <&sysclk>;
> -		clock-names = "dsi_p_clk", "dsi_sys_clk";
> -		interrupts = <1>;
> -		phys = <&dphy1>;
> -		phy-names = "dphy";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				dsi0_output: endpoint@0 {
> -					reg = <0>;
> -					remote-endpoint = <&dsi_panel_input>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				dsi0_dpi_input: endpoint {
> -					remote-endpoint = <&xxx_dpi_output>;
> -				};
> -			};
> -		};
> -	};
> -
> -	i2c@xxx {
> -		panel: panel@59 {
> -			compatible = "<vendor,panel>";
> -			reg = <0x59>;
> -
> -			port {
> -				dsi_panel_input: endpoint {
> -					remote-endpoint = <&dsi0_output>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> new file mode 100644
> index 000000000000..ccedc73d8c18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> @@ -0,0 +1,198 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence DSI bridge
> +
> +maintainers:
> +  - Boris Brezillon <boris.brezillon@bootlin.com>
> +
> +description: |
> +   CDNS DSI is a bridge device which converts DPI to DSI
> +
> +properties:
> +  compatible:
> +    items:

These are not items and it does not make any sense, because you remove
it in second patch. Just make it an enum.

> +      - const: cdns,dsi
> +
> +  reg:
> +    items:
> +      - description:
> +          Register block for controller's registers.
> +
> +  clocks:
> +    items:
> +      - description: PSM clock, used by the IP
> +      - description: sys clock, used by the IP
> +
> +  clock-names:
> +    items:
> +      - const: dsi_p_clk
> +      - const: dsi_sys_clk
> +
> +  phys:
> +    maxItems: 1
> +    description: phandle link to the MIPI D-PHY controller.
> +
> +  phy-names:
> +    const: dphy
> +
> +  power-domains:
> +    maxItems: 1

This was not present in old bindings and your commit msg says it is only
a conversion.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +    description: PHY reset.
> +
> +  reset-names:
> +    const: dsi_p_rst
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port representing the DSI output. It can have
> +          most 4 endpoints. The endpoint number is directly encoding
> +          the DSI virtual channel used by this device.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port representing the DP bridge input.
> +
> +    required:
> +      - port@1
> +
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +

Best regards,
Krzysztof
