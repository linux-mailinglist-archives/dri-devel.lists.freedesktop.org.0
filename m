Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9AF6113C0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 15:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB4D10E840;
	Fri, 28 Oct 2022 13:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B1410E840;
 Fri, 28 Oct 2022 13:57:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11EDBB82A38;
 Fri, 28 Oct 2022 13:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974DFC433D6;
 Fri, 28 Oct 2022 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666965442;
 bh=68AdUumEuf7Kqp2Im/gtt+S8SZW3EUB8HDavcQSGJLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pHRHEFC99L308YV3BxPrWBpBKibqRfHG8eaaKtFK8S+2ZiM/rnzl5mga8aweUU/x0
 siK5MDJrQgu/Ad8BYndkjR1yA/U2aVXTcuamWm+eYoyd+qU//pjoGuVy/gqwJOkjUT
 1yN7ocsMZxkKn3ck1QiRh1rE5DwI/tKitJgcWg0TkKw54ktvgHZ/p+XFsKyZysyHkA
 hsvgDi9qTQX9aclmHQfdFy3f10zPDrXKHL22zQ49gpfcooXqxtSRUwL7/7+2L+SB+2
 7mtabVC3uUUuSkwWToXYI4zQn6MjKzsmidEbQOtAx6wxeyta5h1prWIkLDNBpDdmp9
 VQyXVF9KUYsIw==
Date: Fri, 28 Oct 2022 08:57:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
Message-ID: <20221028135718.4pmh6moee2wx2lpf@baldur>
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-10-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028120812.339100-10-robert.foss@linaro.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 02:08:12PM +0200, Robert Foss wrote:
> The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> 
> In order to toggle the board to enable the HDMI output,
> switch #7 & #8 on the rightmost multi-switch package have
> to be toggled to On.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 106 ++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 6e07feb4b3b2..6666b38b58f8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -20,6 +20,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -29,6 +40,32 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	lt9611_1v2: lt9611-1v2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";
> +
> +		vin-supply = <&vph_pwr>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;

Why is this always-on?

> +	};
> +
> +	lt9611_3v3: lt9611-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_3V3";
> +
> +		vin-supply = <&vreg_bob>;
> +		gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>  };
>  
>  &adsp {
> @@ -220,6 +257,15 @@ &dispcc {
>  &dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
>  };
>  
>  &dsi0_phy  {
> @@ -231,6 +277,48 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&i2c15 {
> +	status = "okay";

Please keep status last. (Yes I see that it goes against the convention
in this file, so let's update that at some point as well)

> +	clock-frequency = <400000>;
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +		status = "okay";

This is the default, you can omit it.

> +
> +		interrupts-extended = <&tlmm 50 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +
> +		};
> +	};
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> @@ -248,6 +336,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_2 {
> +	status = "okay";
> +};
> +
>  &slpi {
>  	status = "okay";
>  	firmware-name = "qcom/sm8350/slpi.mbn";
> @@ -544,4 +636,18 @@ usb_hub_enabled_state: usb-hub-enabled-state {
>  		drive-strength = <2>;
>  		output-low;
>  	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio48";
> +		function = "normal";
> +
> +		output-high;
> +		input-disable;
> +	};
> +
> +	lt9611_irq_pin: lt9611-irq {

pinctrl state nodes should be suffixed with "-state".

And you can lump the two pins into a single -state, with rst-pins and
irq-pins as subnodes, defining the two pins.

Regards,
Bjorn

> +		pins = "gpio50";
> +		function = "gpio";
> +		bias-disable;
> +	};
>  };
> -- 
> 2.34.1
> 
