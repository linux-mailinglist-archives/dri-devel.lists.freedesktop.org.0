Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BCD18332D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 15:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F69E6EADD;
	Thu, 12 Mar 2020 14:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7526C6EADD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 14:33:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9FC65F;
 Thu, 12 Mar 2020 15:33:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584023590;
 bh=HcQB9Xy2uexkm38VBtX52etqOWXe+C3DlyJo4F6NXB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ujwItTFWan1VCw9gjNez+hwU1uYE5Q8fFPGn+HqVz7GGlwFMCNWOrM82L2bmzrDaJ
 yjHrilVwq8Xhi5XfevmbaYUeFl/mYXjdEiuUGJKSZN8LhwyVSeU9dDQTuoxShVda8q
 M0GjH+zB5oAfoFeMhmdlaBMhiqgg8CT+Vmtsxwm4=
Date: Thu, 12 Mar 2020 16:33:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vinay Simha BN <simhavcs@gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: Add DSI/LVDS tc358775 bridge bindings
Message-ID: <20200312143307.GC4876@pendragon.ideasonboard.com>
References: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Vinay,

Please take into account the review comments from v1. We can discuss
them in replies to v1 if you have any question. I'll skip reviewing this
version.

On Wed, Mar 11, 2020 at 03:18:24PM +0530, Vinay Simha BN wrote:
> Add yaml documentation for DSI/LVDS tc358775 bridge
> 
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> 
> ---
> v1:
>  Initial version
> ---
>  .../bindings/display/bridge/toshiba-tc358775.yaml  | 174 +++++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> new file mode 100644
> index 0000000..e9a9544
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/toshiba-tc358775.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +
> +title: Toshiba TC358775 DSI to LVDS bridge bindings
> +
> +maintainers:
> +	- Vinay Simha BN <simhavcs@gmail.com>
> +
> +description: |
> +	This binding supports DSI to LVDS bridge TC358775
> +
> +properties:
> + compatible:
> +	const: toshiba,tc358775
> +
> + reg:
> +   maxItems: 1
> +   description: i2c address of the bridge, 0x0f
> +
> + tc, dsi-lanes: 1
> +   maxItems: 1
> +   description: Number of DSI data lanes connected to the DSI host. It should
> +  be one of 1, 2, 3 or 4.
> +
> + tc, dual-link: 1
> +   maxItems: 1
> +   description: To configure the LVDS transmitter either as single-link or dual-link.
> +
> + vdd-supply:
> +   maxItems: 1
> +   description:  1.2V LVDS Power Supply
> +
> + vddio-supply:
> +   maxItems: 1
> +   description: 1.8V IO Power Supply
> +
> + stby-gpios:
> +   maxItems: 1
> +   description: Standby pin, Low active
> +
> + reset-gpios:
> +   maxItems: 1
> +   description: Hardware reset, Low active
> +
> + ports:
> +   type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          DSI Input. The remote endpoint phandle should be a
> +	  reference to a valid mipi_dsi_host device node.
> +      port@1:
> +        type: object
> +        description: |
> +          Video port for LVDS output (panel or connector).
> +
> +      required:
> +      - port@0
> +      - port@1
> +
> +required:
> + - compatible
> + - reg
> + - dsi-lanes
> + - vdd-supply
> + - vddio-supply
> + - stby-gpios
> + - reset-gpios
> + - ports
> +
> +examples:
> + - |
> +   i2c@78b8000 {
> +	/* On High speed expansion */
> +	label = "HS-I2C2";
> +	status = "okay";
> +
> +	tc_bridge: bridge@f {
> +		status = "okay";
> +
> +		compatible = "toshiba,tc358775";
> +		reg = <0x0f>;
> +
> +		tc,dsi-lanes = <4>;
> +		tc,dual-link = <0>;
> +
> +		vdd-supply = <&pm8916_l2>;
> +		vddio-supply = <&pm8916_l6>;
> +
> +		stby-gpio = <&msmgpio 99 GPIO_ACTIVE_LOW>;
> +		reset-gpio = <&msmgpio 72 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				d2l_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				d2l_out: endpoint {
> +					remote-endpoint = <&panel_in>;
> +				};
> +			};
> +		};
> +	};
> +  };
> +
> +  panel: auo,b101xtn01 {
> +		status = "okay";
> +		compatible = "auo,b101xtn01", "panel-lvds";
> +		power-supply = <&pm8916_l14>;
> +
> +		width-mm = <223>;
> +		height-mm = <125>;
> +
> +		data-mapping = "jeida-24";
> +
> +		panel-timing {
> +			/* 1366x768 @60Hz */
> +			clock-frequency = <72000000>;
> +			hactive = <1366>;
> +			vactive = <768>;
> +			hsync-len = <70>;
> +			hfront-porch = <20>;
> +			hback-porch = <0>;
> +			vsync-len = <42>;
> +			vfront-porch = <14>;
> +			vback-porch = <0>;
> +		};
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&d2l_out>;
> +			};
> +		};
> + };
> +
> +  mdss@1a00000 {
> +	status = "okay";
> +
> +	mdp@1a01000 {
> +		status = "okay";
> +	};
> +
> +	dsi@1a98000 {
> +		status = "okay";
> +		..
> +		ports {
> +			port@1 {
> +				dsi0_out: endpoint {
> +					remote-endpoint = <&d2l_in>;
> +					data-lanes = <0 1 2 3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	dsi-phy@1a98300 {
> +		status = "okay";
> +		..
> +	};
> + };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
