Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0BA9C41DD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 16:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7571910E2F4;
	Mon, 11 Nov 2024 15:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="di29sS2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C070810E166
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 15:32:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4E7B6A4177B;
 Mon, 11 Nov 2024 15:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0C6C4CECF;
 Mon, 11 Nov 2024 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731339177;
 bh=1ThGkgVVbxMJiZ+Q+8T68/fF0P7HNWCG2mwC4Rtjf/s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=di29sS2yULUAMIlrvezh1QsvFESkjGfpd9LieoER3Xt3VSRhTW1nJdRtX/SA4O9UJ
 jhCS97UkJ326rdw/1nUCLApAAtK3hMNuh0ylfMoyR6wbgUyfO4VaA7zGldhOGSLl4s
 FYoyLHUzlfRtPoFcOTEiuJOLU67yDKxg1htMdeuNoqYju+QS1/UwWIjvJQ5k4sN3Kv
 GsUDxDvhuG6u+HaauLny5uBzV2Z/lNKuGLfGjFVPww7Y3TzJHp191h9JSBmPLyCdeJ
 YmrEDni5oG90Fn6P5mhJpNgwEgvuFrEWOBkiUDTxqt/Oo8Co5RJfPzHOCUe98+pIHh
 WTzDI9g2rEGFQ==
Date: Mon, 11 Nov 2024 09:32:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, Andreas Kemnade <andreas@kemnade.info>, 
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
 linux-hardening@vger.kernel.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Roger Quadros <rogerq@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
Message-Id: <173133346307.1281672.16504840078570362330.robh@kernel.org>
Subject: Re: [PATCH v3 00/10] Initial support for Samsung Galaxy Tab 2 series
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 08 Nov 2024 20:04:29 +0000, Mithil Bavishi wrote:
> This series adds initial support for the Samsung Galaxy Tab 2
> (samsung-espresso7/10) series of devices. It adds support for 6 variants
> (P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
> based on 3G and WiFi, but since they use different panel, touch
> controllers, batteries, I decided to categorise them based on screen
> size as espresso7 and espresso10.
> 
> It adds basic functionality for both the models including panel, drm,
> sdcard, touchscreen, mmc, wifi, bluetooth, keys, battery, fuel gauge,
> pmic, sensors.
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
> Changes in v3
> - Use device tree from the correct branch
> - Fix commit subjects to matching the subsystem
> - Add Doestek vendor
> - Add compatible for LVDS encoder
> - Add compatibles for 7 and 10 inch panels
> - Clean up device tree using "make CHECK_DTBS=y"
> - Link to v2: https://lore.kernel.org/all/20241030211215.347710-1-bavishimithil@gmail.com/
> Changes in v2
> - Fix node names in common dtsi to have - instead of _
> - Removed import for twl6030.dtsi
> - Edited dts to completely use twl6032 nodes
> - Fixed typo ldosb -> ldousb
> - Link to v1: https://lore.kernel.org/all/20241030194136.297648-1-bavishimithil@gmail.com/
> 
> --
> Mithil Bavishi (10):
>   ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
>   dt-bindings: vendor-prefixes: Add Doestek
>   dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
>   dt-bindings: display: panel-lvds: Add compatible for Samsung
>     LTN070NL01 Panel
>   dt-bindings: display: panel-lvds: Add compatible for Samsung
>     LTN101AL03 Panel
>   ARM: dts: ti: omap: espresso-common: Add common device tree for
>     Samsung Galaxy Tab 2 series
>   dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
>   ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy
>     Tab 2 7.0
>   dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
>   ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy
>     Tab 2 10.1
> 
>  .../devicetree/bindings/arm/ti/omap.yaml      |   2 +
>  .../bindings/display/bridge/lvds-codec.yaml   |   1 +
>  .../bindings/display/panel/panel-lvds.yaml    |   4 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../omap/omap4-samsung-espresso-common.dtsi   | 680 ++++++++++++++++++
>  .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 +++
>  .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
>  arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  77 ++
>  8 files changed, 938 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
>  create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
>  create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
>  create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y ti/omap/omap4-samsung-espresso10.dtb ti/omap/omap4-samsung-espresso7.dtb' for 20241108200440.7562-1-bavishimithil@gmail.com:

arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: sram@40304000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: sram@40304000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: sram@40304000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap4-wugen-mpu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,omap4-l3-noc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000: failed to match any schema with compatible: ['ti,omap4-l4-wkup', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@4000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: prm@0: $nodename:0: 'prm@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: prm@0: clockdomains: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: prm@0: clocks: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0: failed to match any schema with compatible: ['ti,omap4-prm', 'simple-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/sys_clkin_ck@110: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/abe_dpll_bypass_clk_mux_ck@108: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/abe_dpll_refclk_mux_ck@10c: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/l4_wkup_clk_mux_ck@108: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/syc_clk_div_ck@100: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/usim_ck@1858: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/usim_fclk@1858: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/trace_clk_div_ck: failed to match any schema with compatible: ['ti,clkdm-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/bandgap_fclk@1888: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: emu_sys_clkdm: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clockdomains/emu_sys_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l4_wkup_cm@1800: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/l4_wkup_cm@1800: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/l4_wkup_cm@1800/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: emu_sys_cm@1a00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/emu_sys_cm@1a00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/emu_sys_cm@1a00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@300: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@300: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@400: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@400: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@500: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@500: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@600: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@600: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@700: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@700: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@f00: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@f00: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1000: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1000: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1100: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1100: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1200: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1200: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1300: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1300: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1400: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1400: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1600: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1600: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1700: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1700: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1900: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1900: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1b00: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1b00: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0: failed to match any schema with compatible: ['ti,omap4-scrm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_gate_ck@310: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_mux_ck@310: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_ck@310: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_gate_ck@314: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_mux_ck@314: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_ck@314: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_gate_ck@318: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_mux_ck@318: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_ck@318: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk3_src_gate_ck@31c: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk3_src_mux_ck@31c: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk3_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk3_ck@31c: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk4_src_gate_ck@320: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk4_src_mux_ck@320: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk4_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk4_ck@320: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk5_src_gate_ck@324: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk5_src_mux_ck@324: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk5_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk5_ck@324: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq0_ck@210: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq1_ck@214: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq2_ck@218: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq3_ck@21c: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq4_ck@220: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq5_ck@224: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@0/target-module@c000/scm@c000: failed to match any schema with compatible: ['ti,omap4-scm-wkup']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@10000: $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@10000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@10000/target-module@4000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@10000/target-module@4000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a300000/segment@10000/target-module@c000/keypad@0: failed to match any schema with compatible: ['ti,omap4-keypad']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: sram@40304000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: sram@40304000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: sram@40304000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@20000: $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@20000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: interconnect@4a000000: $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,omap4-l4-cfg', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: scm@0: $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap4-wugen-mpu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,omap4-scm-core', 'simple-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: scm_conf@0: compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/control-phy@300: failed to match any schema with compatible: ['ti,control-phy-usb2']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/control-phy@33c: failed to match any schema with compatible: ['ti,control-phy-otghs']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: cm1@0: $nodename:0: 'cm1@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: cm1@0: clockdomains: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: cm1@0: clocks: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0: failed to match any schema with compatible: ['ti,omap4-cm1', 'simple-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,omap4-l3-noc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/pad_clks_ck@108: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000: failed to match any schema with compatible: ['ti,omap4-l4-wkup', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/slimbus_clk@108: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@4000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: prm@0: $nodename:0: 'prm@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_ck@1e0: failed to match any schema with compatible: ['ti,omap4-dpll-m4xen-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: prm@0: clocks: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: prm@0: clockdomains: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_x2_ck@1f0: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_m2x2_ck@1f0: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/abe_clk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0: failed to match any schema with compatible: ['ti,omap4-prm', 'simple-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_m3x2_ck@1f4: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/core_hsd_byp_clk_mux_ck@12c: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_ck@120: failed to match any schema with compatible: ['ti,omap4-dpll-core-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_x2_ck: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m6x2_ck@140: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m2_ck@130: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/sys_clkin_ck@110: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m5x2_ck@13c: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/div_core_ck@100: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/abe_dpll_bypass_clk_mux_ck@108: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/div_iva_hs_clk@1dc: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/div_mpu_hs_clk@19c: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/abe_dpll_refclk_mux_ck@10c: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m4x2_ck@138: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_m2_ck@1f0: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m3x2_gate_ck@134: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m3x2_div_ck@134: failed to match any schema with compatible: ['ti,composite-divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/l4_wkup_clk_mux_ck@108: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m3x2_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m7x2_ck@144: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/iva_hsd_byp_clk_mux_ck@1ac: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/syc_clk_div_ck@100: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_iva_ck@1a0: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_iva_x2_ck: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/usim_ck@1858: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_iva_m4x2_ck@1b8: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_iva_m5x2_ck@1bc: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_mpu_ck@160: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/usim_fclk@1858: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_mpu_m2_ck@170: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/trace_clk_div_ck: failed to match any schema with compatible: ['ti,clkdm-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/l3_div_ck@100: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/l4_div_ck@100: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/bandgap_fclk@1888: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/ocp_abe_iclk@528: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: emu_sys_clkdm: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clockdomains/emu_sys_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: mpuss_cm@300: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/mpuss_cm@300: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/mpuss_cm@300/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: tesla_cm@400: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l4_wkup_cm@1800: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/tesla_cm@400: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/l4_wkup_cm@1800: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/tesla_cm@400/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: abe_cm@500: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/abe_cm@500: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/abe_cm@500/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/l4_wkup_cm@1800/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: cm2@0: $nodename:0: 'cm2@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: cm2@0: clockdomains: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: cm2@0: clocks: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: emu_sys_cm@1a00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0: failed to match any schema with compatible: ['ti,omap4-cm2', 'simple-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/emu_sys_cm@1a00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/per_hsd_byp_clk_mux_ck@14c: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/emu_sys_cm@1a00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_ck@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m2_ck@150: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_x2_ck@150: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@300: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@300: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m2x2_ck@150: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m3x2_gate_ck@154: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m3x2_div_ck@154: failed to match any schema with compatible: ['ti,composite-divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@400: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@400: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m3x2_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m4x2_ck@158: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m5x2_ck@15c: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@500: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@500: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m6x2_ck@160: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m7x2_ck@164: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_usb_ck@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@600: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@600: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_usb_clkdcoldo_ck@1b4: failed to match any schema with compatible: ['ti,fixed-factor-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_usb_m2_ck@190: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/ducati_clk_mux_ck@100: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@700: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@700: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/func_48m_fclk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@f00: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@f00: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/func_64m_fclk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/func_96m_fclk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/init_60m_fclk@104: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1000: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/per_abe_nc_fclk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1000: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/usb_phy_cm_clk32k@640: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_init_clkdm: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clockdomains/l3_init_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1100: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l4_ao_cm@600: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l4_ao_cm@600: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1100: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l4_ao_cm@600/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_1_cm@700: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_1_cm@700: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1200: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_1_cm@700/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1200: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_2_cm@800: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_2_cm@800: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_2_cm@800/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: ducati_cm@900: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1300: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/ducati_cm@900: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1300: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/ducati_cm@900/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_dma_cm@a00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_dma_cm@a00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_dma_cm@a00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1400: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1400: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_emif_cm@b00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_emif_cm@b00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_emif_cm@b00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1600: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: d2d_cm@c00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/d2d_cm@c00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1600: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/d2d_cm@c00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l4_cfg_cm@d00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1700: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l4_cfg_cm@d00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1700: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l4_cfg_cm@d00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_instr_cm@e00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_instr_cm@e00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_instr_cm@e00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1900: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: ivahd_cm@f00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1900: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/ivahd_cm@f00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/ivahd_cm@f00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: iss_cm@1000: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/iss_cm@1000: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1b00: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/iss_cm@1000/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/prm@1b00: failed to match any schema with compatible: ['ti,omap4-prm-inst', 'ti,omap-prm-inst']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_dss_cm@1100: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_dss_cm@1100: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_dss_cm@1100/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_gfx_cm@1200: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_gfx_cm@1200: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_gfx_cm@1200/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: l3_init_cm@1300: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_init_cm@1300: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0: failed to match any schema with compatible: ['ti,omap4-scrm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_init_cm@1300/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: clock@1400: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clock@1400: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clock@1400/clock@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clock@1400/clock@1a0: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_gate_ck@310: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@58000/hsi@0: failed to match any schema with compatible: ['ti,omap4-hsi']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@58000/hsi@0/hsi-port@2000: failed to match any schema with compatible: ['ti,omap4-hsi-port']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@58000/hsi@0/hsi-port@3000: failed to match any schema with compatible: ['ti,omap4-hsi-port']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_mux_ck@310: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@62000/usbhstll@0: failed to match any schema with compatible: ['ti,usbhs-tll']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@64000/usbhshost@0: failed to match any schema with compatible: ['ti,usbhs-host']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: ohci@800: $nodename:0: 'ohci@800' does not match '^usb(@.*)?'
	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: ehci@c00: $nodename:0: 'ehci@c00' does not match '^usb(@.*)?'
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@0/target-module@66000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@80000: $nodename:0: 'segment@80000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@80000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: usb_otg_hs@0: interface-type: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@2b000/usb_otg_hs@0: failed to match any schema with compatible: ['ti,omap4-musb']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@2d000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@59000/smartreflex@0: failed to match any schema with compatible: ['ti,omap4-smartreflex-mpu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_ck@310: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@5b000/smartreflex@0: failed to match any schema with compatible: ['ti,omap4-smartreflex-iva']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@5d000/smartreflex@0: failed to match any schema with compatible: ['ti,omap4-smartreflex-core']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_gate_ck@314: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_mux_ck@314: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@100000: $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@100000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_ck@314: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_gate_ck@318: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_mux_ck@318: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: omap4_padconf_global@5a0: $nodename:0: 'omap4_padconf_global@5a0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@100000/target-module@0/omap4_padconf_global@5a0/pbias_regulator@60: failed to match any schema with compatible: ['ti,pbias-omap4', 'ti,pbias-omap']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@4a000000/segment@100000/target-module@0/omap4_padconf_global@5a0/pbias_regulator@60: failed to match any schema with compatible: ['ti,pbias-omap4', 'ti,pbias-omap']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_ck@318: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk3_src_gate_ck@31c: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@180000: $nodename:0: 'segment@180000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@180000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@180000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@200000: $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@200000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk3_src_mux_ck@31c: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk3_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk3_ck@31c: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk4_src_gate_ck@320: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@280000: $nodename:0: 'segment@280000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@280000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@280000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@300000: $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@300000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk4_src_mux_ck@320: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk4_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 74, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[109]], 'interrupts-extended': [[1, 0, 74, 4], [110, 260]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk4_ck@320: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk5_src_gate_ck@324: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk5_src_mux_ck@324: failed to match any schema with compatible: ['ti,composite-mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk5_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk5_ck@324: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq0_ck@210: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq1_ck@214: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq2_ck@218: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq3_ck@21c: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'interrupts-extended': [[1, 0, 73, 4], [110, 220]], 'pinctrl-names': ['default'], 'pinctrl-0': [[116]], 'bluetooth': {'compatible': ['brcm,bcm4330-bt'], 'pinctrl-names': ['default'], 'pinctrl-0': [[117]], 'shutdown-gpios': [[118, 7, 0]], 'reset-gpios': [[119, 18, 1]], 'device-wakeup-gpios': [[119, 29, 0]], 'interrupt-parent': [[119]], 'interrupts': [[19, 2]]}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq4_ck@220: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclkreq5_ck@224: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: twl@48: Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@0/target-module@c000/scm@c000: failed to match any schema with compatible: ['ti,omap4-scm-wkup']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@10000: $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@10000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@10000/target-module@4000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@10000/target-module@4000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a300000/segment@10000/target-module@c000/keypad@0: failed to match any schema with compatible: ['ti,omap4-keypad']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@a5000/des@0: failed to match any schema with compatible: ['ti,omap4-des']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@20000: $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@20000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: interconnect@4a000000: $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@200000: $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@200000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,omap4-l4-cfg', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@48210000/mpu: failed to match any schema with compatible: ['ti,omap4-mpu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: interconnect@40100000: $nodename:0: 'interconnect@40100000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: scm@0: $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,omap4-scm-core', 'simple-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: scm_conf@0: compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/control-phy@300: failed to match any schema with compatible: ['ti,control-phy-usb2']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/control-phy@33c: failed to match any schema with compatible: ['ti,control-phy-otghs']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: cm1@0: $nodename:0: 'cm1@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: cm1@0: clocks: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: cm1@0: clockdomains: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0: failed to match any schema with compatible: ['ti,omap4-cm1', 'simple-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/pad_clks_ck@108: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/slimbus_clk@108: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: sham@0: 'ti,hwmods' is a required property
	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/regulator-abb-iva: failed to match any schema with compatible: ['ti,abb-v2']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap4-dss']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap4-dispc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@58000000/dss@0/target-module@3000/encoder@0: failed to match any schema with compatible: ['ti,omap4-venc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap4-dsi']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@58000000/dss@0/target-module@5000/encoder@0: failed to match any schema with compatible: ['ti,omap4-dsi']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@58000000/dss@0/target-module@6000/encoder@0: failed to match any schema with compatible: ['ti,omap4-hdmi']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_ck@1e0: failed to match any schema with compatible: ['ti,omap4-dpll-m4xen-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: /ocp/bandgap@4a002260: failed to match any schema with compatible: ['ti,omap4430-bandgap']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: thermal-zones: 'cpu_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_x2_ck@1f0: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_m2x2_ck@1f0: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/abe_clk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb: gpio-keys: 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_m3x2_ck@1f4: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/core_hsd_byp_clk_mux_ck@12c: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_ck@120: failed to match any schema with compatible: ['ti,omap4-dpll-core-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_x2_ck: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m6x2_ck@140: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m2_ck@130: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m5x2_ck@13c: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/div_core_ck@100: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/div_iva_hs_clk@1dc: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/div_mpu_hs_clk@19c: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m4x2_ck@138: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_abe_m2_ck@1f0: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m3x2_gate_ck@134: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m3x2_div_ck@134: failed to match any schema with compatible: ['ti,composite-divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m3x2_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_core_m7x2_ck@144: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/iva_hsd_byp_clk_mux_ck@1ac: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_iva_ck@1a0: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_iva_x2_ck: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_iva_m4x2_ck@1b8: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_iva_m5x2_ck@1bc: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_mpu_ck@160: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/dpll_mpu_m2_ck@170: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/l3_div_ck@100: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/l4_div_ck@100: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/clocks/ocp_abe_iclk@528: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: mpuss_cm@300: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/mpuss_cm@300: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/mpuss_cm@300/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: tesla_cm@400: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/tesla_cm@400: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/tesla_cm@400/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: abe_cm@500: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/abe_cm@500: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@4000/cm1@0/abe_cm@500/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: cm2@0: $nodename:0: 'cm2@0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: cm2@0: clocks: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: cm2@0: clockdomains: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0: failed to match any schema with compatible: ['ti,omap4-cm2', 'simple-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/per_hsd_byp_clk_mux_ck@14c: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_ck@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m2_ck@150: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_x2_ck@150: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m2x2_ck@150: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m3x2_gate_ck@154: failed to match any schema with compatible: ['ti,composite-no-wait-gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m3x2_div_ck@154: failed to match any schema with compatible: ['ti,composite-divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m3x2_ck: failed to match any schema with compatible: ['ti,composite-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m4x2_ck@158: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m5x2_ck@15c: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m6x2_ck@160: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_per_m7x2_ck@164: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_usb_ck@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_usb_clkdcoldo_ck@1b4: failed to match any schema with compatible: ['ti,fixed-factor-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/dpll_usb_m2_ck@190: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/ducati_clk_mux_ck@100: failed to match any schema with compatible: ['ti,mux-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/func_48m_fclk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/func_64m_fclk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/func_96m_fclk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/init_60m_fclk@104: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/per_abe_nc_fclk@108: failed to match any schema with compatible: ['ti,divider-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clocks/usb_phy_cm_clk32k@640: failed to match any schema with compatible: ['ti,gate-clock']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_init_clkdm: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clockdomains/l3_init_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l4_ao_cm@600: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l4_ao_cm@600: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l4_ao_cm@600/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_1_cm@700: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_1_cm@700: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_1_cm@700/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_2_cm@800: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_2_cm@800: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_2_cm@800/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: ducati_cm@900: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/ducati_cm@900: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/ducati_cm@900/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_dma_cm@a00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_dma_cm@a00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_dma_cm@a00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_emif_cm@b00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_emif_cm@b00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_emif_cm@b00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: d2d_cm@c00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/d2d_cm@c00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/d2d_cm@c00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l4_cfg_cm@d00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l4_cfg_cm@d00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l4_cfg_cm@d00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_instr_cm@e00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_instr_cm@e00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_instr_cm@e00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: ivahd_cm@f00: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/ivahd_cm@f00: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/ivahd_cm@f00/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: iss_cm@1000: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/iss_cm@1000: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/iss_cm@1000/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_dss_cm@1100: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_dss_cm@1100: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_dss_cm@1100/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_gfx_cm@1200: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_gfx_cm@1200: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_gfx_cm@1200/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: l3_init_cm@1300: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_init_cm@1300: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/l3_init_cm@1300/clk@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: clock@1400: '#clock-cells' is a dependency of 'clock-output-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clock@1400: failed to match any schema with compatible: ['ti,omap4-cm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clock@1400/clock@20: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clock@1400/clock@1a0: failed to match any schema with compatible: ['ti,clkctrl']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@58000/hsi@0: failed to match any schema with compatible: ['ti,omap4-hsi']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@58000/hsi@0/hsi-port@2000: failed to match any schema with compatible: ['ti,omap4-hsi-port']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@58000/hsi@0/hsi-port@3000: failed to match any schema with compatible: ['ti,omap4-hsi-port']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@62000/usbhstll@0: failed to match any schema with compatible: ['ti,usbhs-tll']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@64000/usbhshost@0: failed to match any schema with compatible: ['ti,usbhs-host']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: ohci@800: $nodename:0: 'ohci@800' does not match '^usb(@.*)?'
	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: ehci@c00: $nodename:0: 'ehci@c00' does not match '^usb(@.*)?'
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@0/target-module@66000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@80000: $nodename:0: 'segment@80000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@80000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: usb_otg_hs@0: interface-type: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@2b000/usb_otg_hs@0: failed to match any schema with compatible: ['ti,omap4-musb']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@2d000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@59000/smartreflex@0: failed to match any schema with compatible: ['ti,omap4-smartreflex-mpu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@5b000/smartreflex@0: failed to match any schema with compatible: ['ti,omap4-smartreflex-iva']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@5d000/smartreflex@0: failed to match any schema with compatible: ['ti,omap4-smartreflex-core']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@100000: $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@100000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: omap4_padconf_global@5a0: $nodename:0: 'omap4_padconf_global@5a0' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@100000/target-module@0/omap4_padconf_global@5a0/pbias_regulator@60: failed to match any schema with compatible: ['ti,pbias-omap4', 'ti,pbias-omap']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@4a000000/segment@100000/target-module@0/omap4_padconf_global@5a0/pbias_regulator@60: failed to match any schema with compatible: ['ti,pbias-omap4', 'ti,pbias-omap']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@180000: $nodename:0: 'segment@180000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@180000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@180000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@200000: $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@200000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@280000: $nodename:0: 'segment@280000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@280000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@280000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@300000: $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@300000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 74, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[109]], 'interrupts-extended': [[1, 0, 74, 4], [110, 260]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: synaptics-rmi4-i2c@20: Unevaluated properties are not allowed ('avdd-supply', 'touchscreen-size-x', 'touchscreen-size-y' were unexpected)
	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'interrupts-extended': [[1, 0, 73, 4], [110, 220]], 'pinctrl-names': ['default'], 'pinctrl-0': [[116]], 'bluetooth': {'compatible': ['brcm,bcm4330-bt'], 'pinctrl-names': ['default'], 'pinctrl-0': [[117]], 'shutdown-gpios': [[118, 7, 0]], 'reset-gpios': [[119, 18, 1]], 'device-wakeup-gpios': [[119, 29, 0]], 'interrupt-parent': [[119]], 'interrupts': [[19, 2]]}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: twl@48: Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@a5000/des@0: failed to match any schema with compatible: ['ti,omap4-des']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@200000: $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@200000: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@48210000/mpu: failed to match any schema with compatible: ['ti,omap4-mpu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: interconnect@40100000: $nodename:0: 'interconnect@40100000' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: sham@0: 'ti,hwmods' is a required property
	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/regulator-abb-iva: failed to match any schema with compatible: ['ti,abb-v2']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap4-dss']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap4-dispc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@58000000/dss@0/target-module@3000/encoder@0: failed to match any schema with compatible: ['ti,omap4-venc']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap4-dsi']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@58000000/dss@0/target-module@5000/encoder@0: failed to match any schema with compatible: ['ti,omap4-dsi']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@58000000/dss@0/target-module@6000/encoder@0: failed to match any schema with compatible: ['ti,omap4-hdmi']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: /ocp/bandgap@4a002260: failed to match any schema with compatible: ['ti,omap4430-bandgap']
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: thermal-zones: 'cpu_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb: gpio-keys: 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#





