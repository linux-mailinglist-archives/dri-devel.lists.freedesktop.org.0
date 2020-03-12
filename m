Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BE2182DDB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 11:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54576E0E4;
	Thu, 12 Mar 2020 10:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBCD6E0E4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 10:35:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200312103500euoutp017481b171212e17de1a4ed70378ab39bf~7iBEMQZAJ2423424234euoutp01U
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 10:35:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200312103500euoutp017481b171212e17de1a4ed70378ab39bf~7iBEMQZAJ2423424234euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584009300;
 bh=AiOwCiA5oENJbiCHlPl0UpmDzAqEPqryxHVgvTC19wg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=L5dm9i9tomU8x3kHzl9LBdBJnThr3zNCnFB/NaH8Omzjdd+fKJDamzmoduFfR7dLz
 gLreFCfMM1XoOJxJ03u46xPyM2zJZ7vhesxnhy4lHqelIBV2WpVatUu394ANNrErFL
 I/Q/wqu2JFNoRBwJiZlfGCn78yhgVn5XQIAmmTsc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200312103500eucas1p12967ea27427738d5ae7909845814ebaa~7iBEAaqFV0146001460eucas1p1w;
 Thu, 12 Mar 2020 10:35:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E9.7C.60698.4501A6E5; Thu, 12
 Mar 2020 10:35:00 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200312103500eucas1p218e348ce77ea151b242c14ba0f537f85~7iBDuGq3U1187611876eucas1p2y;
 Thu, 12 Mar 2020 10:35:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200312103500eusmtrp13b891e36b3f717d378584d6713e99866~7iBDteKoo1916019160eusmtrp1Z;
 Thu, 12 Mar 2020 10:35:00 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-c7-5e6a1054625d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BE.13.07950.4501A6E5; Thu, 12
 Mar 2020 10:35:00 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200312103459eusmtip2e6281c38db6d2828e4bfe0828417dd13~7iBDAKM2Q1315613156eusmtip2K;
 Thu, 12 Mar 2020 10:34:59 +0000 (GMT)
Subject: Re: [PATCH 1/2] dt-binding: Add DSI/LVDS tc358775 bridge bindings
To: Vinay Simha BN <simhavcs@gmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <a721cdd3-72e7-a1ef-6b45-d4dcc2787de6@samsung.com>
Date: Thu, 12 Mar 2020 11:34:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87ohAllxBofnylv0njvJZDH/yDlW
 iytf37NZdE5cwm5xedccNovWvUfYLT5ffsnmwO6xc9Zddo/ZHTNZPTat6mTz2P7tAavH/e7j
 TB6fN8kFsEVx2aSk5mSWpRbp2yVwZSxfdJOxoFG9Yuu+iSwNjO9kuhg5OSQETCRWvnjJ3MXI
 xSEksIJRYsGE7ywQzhdGibblz1lAqoQEPjNKTFug08XIAdaxqpcfomY5o8SXP4fYIZy3jBKP
 T31iBWkQFvCSOL1iCTuILSIQL7F3+SqwqcwC3UwS038/ACtiE9CU+Lv5JhuIzStgJ/Fkcy8T
 iM0ioCpxes4CsLioQITEtO3/GCFqBCVOznwCdhGngJPElVcHwGxmAXmJ7W/nMEPY4hK3nsxn
 gvhtH7vEpes6ELaLxL1uiOMkBIQlXh3fwg5hy0icntzDAmHXS9xf0QIOCwmBDkaJrRt2MkMk
 rCXunPvFBvI+M9DR63fpQ4QdJU7272KFhAqfxI23ghAn8ElM2jadGSLMK9HRJgRRrShx/+xW
 qIHiEksvfGWbwKg0C8ljs5A8MwvJM7MQ9i5gZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yf
 u4kRmIpO/zv+dQfjvj9JhxgFOBiVeHgnfM6IE2JNLCuuzD3EKMHBrCTCGy+fHifEm5JYWZVa
 lB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs1NSC1CKYLBMHp1QDo3+tHFO9muLMFZw3d85j
 enva+ZvpRt4NK+qmFNysYLzaYRuvnbHL805zHe90F6UPjYX/bvJtX5+9e0fUxYZtrY0e//ms
 d3p7Lvp6eHL/5HOLVn21/KGspPDp02LjB7vY+qy/W6kXrdikPm/TOY3EDQLPPdTPzukwvzmt
 +u0OoVmFAao5S8N+SSuxFGckGmoxFxUnAgC9eWvMQQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7ohAllxBq+PcFr0njvJZDH/yDlW
 iytf37NZdE5cwm5xedccNovWvUfYLT5ffsnmwO6xc9Zddo/ZHTNZPTat6mTz2P7tAavH/e7j
 TB6fN8kFsEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp
 2yXoZSxfdJOxoFG9Yuu+iSwNjO9kuhg5OCQETCRW9fJ3MXJxCAksZZR48PoQYxcjJ1BcXGL3
 /LfMELawxJ9rXWwgtpDAa0aJxb/zQWxhAS+J0yuWsIPYIgLxEsv2vmUEGcQs0MsksWHreiaI
 qVMZJTp3fGMCqWIT0JT4u/km2CReATuJJ5t7weIsAqoSp+csAIuLCkRIPJ7YzghRIyhxcuYT
 FhCbU8BJ4sqrA2A2s4C6xJ95l5ghbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELSsoCR
 ZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZg/G079nPLDsaud8GHGAU4GJV4eCd8zogTYk0s
 K67MPcQowcGsJMIbL58eJ8SbklhZlVqUH19UmpNafIjRFOi5icxSosn5wNSQVxJvaGpobmFp
 aG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB0c+gWb11QZ0K2+Wd5bPF/T/u5A50
 epIh6zonV3hzvpj8f98p4o381ysP3FUMXLZ65vbaB6pPuO6+i1iw6X7AjEdC0RJnVh69dnrf
 rcySv9wCrjNnHLgYMutI3p9n+9U3y2TYSdVnfmbXf65gNPE4V7XizzsclgoX5I2tQr6/0tg0
 a3bJjMwNYUosxRmJhlrMRcWJAFxbiqfVAgAA
X-CMS-MailID: 20200312103500eucas1p218e348ce77ea151b242c14ba0f537f85
X-Msg-Generator: CA
X-RootMTR: 20200312080849eucas1p2ebc25fb87cc917986ba0f268272ef2ed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200312080849eucas1p2ebc25fb87cc917986ba0f268272ef2ed
References: <CGME20200312080849eucas1p2ebc25fb87cc917986ba0f268272ef2ed@eucas1p2.samsung.com>
 <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay,

Next time add patch version to de subject of email.


On 11.03.2020 10:48, Vinay Simha BN wrote:
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
> +$id: https://protect2.fireeye.com/url?k=cc9be7f9-9155e4b4-cc9a6cb6-000babff24ad-2a6ce73e1e41d358&u=http://devicetree.org/schemas/display/bridge/toshiba-tc358775.yaml#
> +$schema: https://protect2.fireeye.com/url?k=293d6151-74f3621c-293cea1e-000babff24ad-793c0a803cb80d71&u=http://devicetree.org/meta-schemas/core.yaml#
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


As Laurent commented earlier, it would be better to use two ports. See
for example for input LVDS ports in:

Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt

Both should be defined in bindings but the 2nd can be optional in dts.


Regards

Andrzej


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


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
