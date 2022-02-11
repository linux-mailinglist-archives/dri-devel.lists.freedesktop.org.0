Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2674B26E0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CB910EC20;
	Fri, 11 Feb 2022 13:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C0410EC20
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 13:12:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63270B82A35;
 Fri, 11 Feb 2022 13:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B75C340E9;
 Fri, 11 Feb 2022 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644585165;
 bh=mxPPHCFOv9wOqSJ+SKD7smQ5QOZ5zf1PCwR9hM57WiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SrdpEBXGjpXGCE1/I22U/bhwSgvIVifVhrGZcXx+2Bx5fldw8oE+99TGhztEcMZee
 gCceMWSfCKqYd20VeyRNb5Lj9oIZO9Qne588kkxSVBP6ZXkBdme/dxEvd+Vl/3I+E9
 7uPDrliKfMD5myPHEgq5MmM/97R4+xDyd+q57hYgCGGLFWu1wbYhg/euMgIqG3GIWC
 Hl0T3OJtuahsIXrfzEd0Nm+rgw5Q35v6pDB5y+2o4aDVbSTdIlSSAd8/2L2Mo4yPNz
 4ZY6xuTH16dESAr5c/txEju5evKmdeJ6tlJKUY6vXDn7bp+djDIWdGz2hrtaE5E700
 CoBakB84ijVoA==
Date: Fri, 11 Feb 2022 21:12:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 2/5] ARM: dts: imx6dl-prtvt7: Add missing tvp5150
 video decoder node
Message-ID: <20220211131237.GW4909@dragon>
References: <20220131102841.1955032-1-o.rempel@pengutronix.de>
 <20220131102841.1955032-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131102841.1955032-3-o.rempel@pengutronix.de>
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

On Mon, Jan 31, 2022 at 11:28:38AM +0100, Oleksij Rempel wrote:
> From: Robin van der Gracht <robin@protonic.nl>
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>

Please write up some commit log.  Also your SoB is missing.

Shawn

> ---
>  arch/arm/boot/dts/imx6dl-prtvt7.dts | 42 +++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-prtvt7.dts b/arch/arm/boot/dts/imx6dl-prtvt7.dts
> index be7c4cb339e7..baaa6ffc4df9 100644
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
> @@ -295,6 +308,31 @@ sgtl5000: audio-codec@a {
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
> +
> +			tvp5150_comp0_in: endpoint {
> +				remote-endpoint = <&comp0_out>;
> +			};
> +		};
> +
> +		/* Output port 2 is video output pad */
> +		port@2 {
> +			reg = <2>;
> +
> +			tvp5151_to_ipu1_csi0_mux: endpoint {
> +				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
> +			};
> +		};
> +	};
>  };
>  
>  &i2c3 {
> @@ -322,6 +360,10 @@ &ipu1_di0_disp0 {
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
