Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D054693B8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BC67AC11;
	Mon,  6 Dec 2021 10:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F49738D5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 01:01:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A8B961167;
 Mon,  6 Dec 2021 01:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18E1C00446;
 Mon,  6 Dec 2021 01:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638752503;
 bh=1Ax4bw/oFgEbYRmnNjGtyxdgvFdAShGvQFfBYM1dS08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BQEDaomcnbagfGi3QeyaPWcJrRky02aArZQgoMdtvGVFAxHtkEi91nXFFboTdNO2V
 zhnPKLY+H3s05CfPOGUhDVAQmd967xC3/gxChqZJJC67kaHiG8t8+xsiwVkCAuadke
 bJLqb9fvU6YpcfWib3N6P+/kSukl/7Mg87DuP7IFRhb3sL6Hu2HquxlVnfbMMXAkO7
 P7TwsN9rD8qWa8AhoIDmbmNKz2Mwej5HVAu8YE5Y7Snl5UNEsv29xDFUj+BSNbTZ4B
 CVR2PVRAM5QKnAfMtVjBhmbmREhE4GtumQH5KEbLgJIV2G6fHrNvJmyh3Wal4vcdeR
 3steiktJUrLww==
Date: Mon, 6 Dec 2021 09:01:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 2/4] ARM: dts: imx6dl-prtvt7: Add missing tvp5150
 video decoder node
Message-ID: <20211206010137.GJ4216@dragon>
References: <20211122124310.2796505-1-o.rempel@pengutronix.de>
 <20211122124310.2796505-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122124310.2796505-2-o.rempel@pengutronix.de>
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
 David Airlie <airlied@linux.ie>, Robin van der Gracht <robin@protonic.nl>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 01:43:08PM +0100, Oleksij Rempel wrote:
> From: Robin van der Gracht <robin@protonic.nl>
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> ---
>  arch/arm/boot/dts/imx6dl-prtvt7.dts | 40 +++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-prtvt7.dts b/arch/arm/boot/dts/imx6dl-prtvt7.dts
> index be7c4cb339e7..02b53df03e6f 100644
> --- a/arch/arm/boot/dts/imx6dl-prtvt7.dts
> +++ b/arch/arm/boot/dts/imx6dl-prtvt7.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  #include "imx6dl.dtsi"
>  #include "imx6qdl-prti6q.dtsi"
> +#include <dt-bindings/display/sdtv-standards.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/sound/fsl-imx-audmux.h>
> @@ -171,6 +172,18 @@ panel_in: endpoint {
>  		};
>  	};
>  
> +	connector {
> +		compatible = "composite-video-connector";
> +		label = "Composite0";
> +		sdtv-standards = <SDTV_STD_PAL_B>;
> +
> +		port {
> +			comp0_out: endpoint {
> +				remote-endpoint = <&tvp5150_comp0_in>;
> +			};
> +		};
> +	};
> +
>  	reg_bl_12v0: regulator-bl-12v0 {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -295,6 +308,29 @@ sgtl5000: audio-codec@a {
>  		VDDIO-supply = <&reg_3v3>;
>  		VDDD-supply = <&reg_1v8>;
>  	};
> +
> +	video@5c {
> +		compatible = "ti,tvp5150";
> +		reg = <0x5c>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;

Have a newline between property and child node.

Shawn

> +			tvp5150_comp0_in: endpoint {
> +				remote-endpoint = <&comp0_out>;
> +			};
> +		};
> +
> +		/* Output port 2 is video output pad */
> +		port@2 {
> +			reg = <2>;
> +			tvp5151_to_ipu1_csi0_mux: endpoint {
> +				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
> +			};
> +		};
> +	};
>  };
>  
>  &i2c3 {
> @@ -322,6 +358,10 @@ &ipu1_di0_disp0 {
>  	remote-endpoint = <&display_in>;
>  };
>  
> +&ipu1_csi0_mux_from_parallel_sensor {
> +	remote-endpoint = <&tvp5151_to_ipu1_csi0_mux>;
> +};
> +
>  &pwm1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pwm1>;
> -- 
> 2.30.2
> 
