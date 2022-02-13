Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8554B3962
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 06:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D77910F099;
	Sun, 13 Feb 2022 05:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADAE10F099
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 05:23:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64BF160F06;
 Sun, 13 Feb 2022 05:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85784C004E1;
 Sun, 13 Feb 2022 05:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644729794;
 bh=vYSNojDh0K1HAwwbXJB0icOSyWl3HotrRpbPrie1v5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H3LdzOx7+QWnaej7zbIzdXyjlSb1bUPGyzAX2Lf1O3YzS5/6+qceDTh1EMDAEmnsI
 6NPWuwdQd2kvzKnVnd8bly82gQC8ZB32iqvIFn2remJY6I+difRAhzwMDWRSczZJ+D
 5mdT/1dKEFRg3I9LBjdI+5q4+IPEbbKWmSh8RhiWQ5X5xvgeu8FoFkmZSEQLPkGtKj
 5eWSDiqaTvzfPHy/B9+JaejGLntTX3lwAk/WgYGBr54xhneleAfxCUA7/X0qneyDds
 xJJYOKBi8xkD/09xXUtkGVGVDLPoDZeevyQts+tsLDtH3KEhRtuHHSIDqNDWmFcpNi
 3Wc6GM89rPxWw==
Date: Sun, 13 Feb 2022 13:23:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v3 3/5] ARM: dts: imx6qdl-vicut1: add CAN termination
 support
Message-ID: <20220213052305.GP4909@dragon>
References: <20220211133035.2321330-1-o.rempel@pengutronix.de>
 <20220211133035.2321330-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211133035.2321330-4-o.rempel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 02:30:33PM +0100, Oleksij Rempel wrote:
> The gpio1 0 pin is controlling CAN termination, not USB H1 VBUS. So,
> remove wrong regulator and assign this gpio to new DT CAN termnation

Sigh, the typo is still there with a new version.

Fixed it up and applied the series.

Shawn

> property.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx6qdl-vicut1.dtsi | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> index b9e305774fed..1ac7e13249d2 100644
> --- a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> @@ -126,15 +126,6 @@ reg_3v3: regulator-3v3 {
>  		regulator-max-microvolt = <3300000>;
>  	};
>  
> -	reg_h1_vbus: regulator-h1-vbus {
> -		compatible = "regulator-fixed";
> -		regulator-name = "h1-vbus";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
>  	reg_otg_vbus: regulator-otg-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "otg-vbus";
> @@ -212,6 +203,8 @@ IMX_AUDMUX_V2_PTCR_SYN		IMX_AUDMUX_V2_PDCR_RXDSEL(0)
>  &can1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_can1>;
> +	termination-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	termination-ohms = <150>;
>  	status = "okay";
>  };
>  
> @@ -492,7 +485,6 @@ &uart5 {
>  };
>  
>  &usbh1 {
> -	vbus-supply = <&reg_h1_vbus>;
>  	pinctrl-names = "default";
>  	phy_type = "utmi";
>  	dr_mode = "host";
> -- 
> 2.30.2
> 
