Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB97245678
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 09:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712766E101;
	Sun, 16 Aug 2020 07:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8B26E101
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 07:28:07 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1526E804D0;
 Sun, 16 Aug 2020 09:28:05 +0200 (CEST)
Date: Sun, 16 Aug 2020 09:28:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 5/8] ARM: dts: imx: Fix LCDIF compatible strings
Message-ID: <20200816072803.GF1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-6-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=vAfjA9iV6H3j0_Dc_b4A:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 04:29:07AM +0300, Laurent Pinchart wrote:
> The LCDIF in the i.MX6 SoCs has additional features compared to the
> i.MX28. Replace the fsl,imx28-lcdif fallback compatible string with
> fsl,imx6sx-lcdif to reflect that.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  arch/arm/boot/dts/imx6sl.dtsi  | 2 +-
>  arch/arm/boot/dts/imx6sll.dtsi | 2 +-
>  arch/arm/boot/dts/imx6sx.dtsi  | 4 ++--
>  arch/arm/boot/dts/imx6ul.dtsi  | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
> index 911d8cf77f2c..deeb647ffc3f 100644
> --- a/arch/arm/boot/dts/imx6sl.dtsi
> +++ b/arch/arm/boot/dts/imx6sl.dtsi
> @@ -769,7 +769,7 @@ epdc: epdc@20f4000 {
>  			};
>  
>  			lcdif: lcdif@20f8000 {
> -				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
> diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
> index edd3abb9a9f1..c51072bb43ba 100644
> --- a/arch/arm/boot/dts/imx6sll.dtsi
> +++ b/arch/arm/boot/dts/imx6sll.dtsi
> @@ -644,7 +644,7 @@ pxp: pxp@20f0000 {
>  			};
>  
>  			lcdif: lcd-controller@20f8000 {
> -				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif";
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
> diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
> index 94e3df47d1ad..67da3a2d48ec 100644
> --- a/arch/arm/boot/dts/imx6sx.dtsi
> +++ b/arch/arm/boot/dts/imx6sx.dtsi
> @@ -1241,7 +1241,7 @@ csi2: csi@221c000 {
>  				};
>  
>  				lcdif1: lcdif@2220000 {
> -					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> +					compatible = "fsl,imx6sx-lcdif";
>  					reg = <0x02220000 0x4000>;
>  					interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
>  					clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
> @@ -1253,7 +1253,7 @@ lcdif1: lcdif@2220000 {
>  				};
>  
>  				lcdif2: lcdif@2224000 {
> -					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> +					compatible = "fsl,imx6sx-lcdif";
>  					reg = <0x02224000 0x4000>;
>  					interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>;
>  					clocks = <&clks IMX6SX_CLK_LCDIF2_PIX>,
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index 5379a03391bd..b16cce1680a9 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -978,7 +978,7 @@ csi: csi@21c4000 {
>  			};
>  
>  			lcdif: lcdif@21c8000 {
> -				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6ul-lcdif", "fsl,imx6sx-lcdif";
>  				reg = <0x021c8000 0x4000>;
>  				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6UL_CLK_LCDIF_PIX>,
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
