Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D971D172942
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 21:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADC36E0AF;
	Thu, 27 Feb 2020 20:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF076E0AF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 20:10:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 50BA52001F;
 Thu, 27 Feb 2020 21:09:55 +0100 (CET)
Date: Thu, 27 Feb 2020 21:09:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 01/56] ARM: dts: omap: add channel to DSI panels
Message-ID: <20200227200953.GA27592@ravnborg.org>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-2-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=e5mUnYsNAAAA:8 a=Y3ATfXyG3fzIK_nDLswA:9 a=_nfsKp1MpfXwnxTL:21
 a=4RnELFkA-wuGaJ5Y:21 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian.

On Tue, Feb 25, 2020 at 12:20:31AM +0100, Sebastian Reichel wrote:
> The standard binding for DSI requires, that the channel number
> of the panel is encoded in DT. This adds the channel number in
> all OMAP3-5 boards, in preparation for using common infrastructure.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 +++-
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi             | 3 ++-
>  arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
>  arch/arm/boot/dts/omap3.dtsi                                | 3 +++
>  arch/arm/boot/dts/omap4-sdp.dts                             | 6 ++++--
>  arch/arm/boot/dts/omap4.dtsi                                | 6 ++++++
>  arch/arm/boot/dts/omap5.dtsi                                | 6 ++++++
>  7 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> index dce48eb9db57..f92d5c9adfc5 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> @@ -3,6 +3,7 @@ Generic MIPI DSI Command Mode Panel
>  
>  Required properties:
>  - compatible: "panel-dsi-cm"
It is not direct related to this patch - but you touch the file...
This binding should require a specific + a generic binding.
So any panel that in the beginng can fallback only on the generic
handling can later fallback to some panel specific quirks.

This is easy to express in .yaml format like this:
properties:
  compatible:
    description:
      Shall contain a panel specific compatible and "panel-dps-cm"
      in that order.
    items:
      - {}
      - const: panel-dsi-cm

This will not prevent a user from using:

    compatible: "foo,bar","panel-dsi-cm"

But then there is documentation for a specific compatible.

On top of this - no changes to .txt files in panel/
You need to convert to DT Schema and then patch the binding.
(Not a global fixed rule - but something I try to enforce to get the
rest converted).

	Sam

> +- reg: DSI channel number
>  
>  Optional properties:
>  - label: a symbolic name for the panel
> @@ -15,9 +16,10 @@ Required nodes:
>  Example
>  -------
>  
> -lcd0: display {
> +lcd0: panel@0 {
>  	compatible = "tpo,taal", "panel-dsi-cm";
>  	label = "lcd0";
> +	reg = <0>;
>  
>  	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
>  
> diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> index 85665506f4f8..a5e4ba7c8dab 100644
> --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> @@ -199,8 +199,9 @@ dsi1_out_ep: endpoint {
>  		};
>  	};
>  
> -	lcd0: display {
> +	lcd0: panel@0 {
>  		compatible = "panel-dsi-cm";
> +		reg = <0>;
>  		label = "lcd0";
>  		vddi-supply = <&lcd_regulator>;
>  		reset-gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
> diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3-n950.dts
> index 31d47a1fad84..80cf4e1177da 100644
> --- a/arch/arm/boot/dts/omap3-n950.dts
> +++ b/arch/arm/boot/dts/omap3-n950.dts
> @@ -225,8 +225,9 @@ dsi_out_ep: endpoint {
>  		};
>  	};
>  
> -	lcd0: display {
> +	lcd0: panel@0 {
>  		compatible = "nokia,himalaya", "panel-dsi-cm";
> +		reg = <0>;
>  		label = "lcd0";
>  
>  		pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
> index 634ea16a711e..409d434a9b18 100644
> --- a/arch/arm/boot/dts/omap3.dtsi
> +++ b/arch/arm/boot/dts/omap3.dtsi
> @@ -820,6 +820,9 @@ dsi: encoder@4804fc00 {
>  				ti,hwmods = "dss_dsi1";
>  				clocks = <&dss1_alwon_fck>, <&dss2_alwon_fck>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			rfbi: encoder@48050800 {
> diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
> index 91480ac1f328..8a8307517dab 100644
> --- a/arch/arm/boot/dts/omap4-sdp.dts
> +++ b/arch/arm/boot/dts/omap4-sdp.dts
> @@ -662,8 +662,9 @@ dsi1_out_ep: endpoint {
>  		};
>  	};
>  
> -	lcd0: display {
> +	lcd0: panel@0 {
>  		compatible = "tpo,taal", "panel-dsi-cm";
> +		reg = <0>;
>  		label = "lcd0";
>  
>  		reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;	/* 102 */
> @@ -687,8 +688,9 @@ dsi2_out_ep: endpoint {
>  		};
>  	};
>  
> -	lcd1: display {
> +	lcd1: panel@0 {
>  		compatible = "tpo,taal", "panel-dsi-cm";
> +		reg = <0>;
>  		label = "lcd1";
>  
>  		reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;	/* 104 */
> diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
> index 9a87440d0b9d..a75734065cac 100644
> --- a/arch/arm/boot/dts/omap4.dtsi
> +++ b/arch/arm/boot/dts/omap4.dtsi
> @@ -465,6 +465,9 @@ dsi1: encoder@58004000 {
>  				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
>  					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			dsi2: encoder@58005000 {
> @@ -479,6 +482,9 @@ dsi2: encoder@58005000 {
>  				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
>  					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			hdmi: encoder@58006000 {
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index d0ecf54d5a23..5c7462e04716 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -333,6 +333,9 @@ dsi1: encoder@58004000 {
>  				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
>  					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			dsi2: encoder@58005000 {
> @@ -347,6 +350,9 @@ dsi2: encoder@58005000 {
>  				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
>  					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			hdmi: encoder@58060000 {
> -- 
> 2.25.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
