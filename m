Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A864810F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 11:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D7F10E516;
	Fri,  9 Dec 2022 10:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFDF10E516;
 Fri,  9 Dec 2022 10:35:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B341F621F5;
 Fri,  9 Dec 2022 10:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D56C433EF;
 Fri,  9 Dec 2022 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670582108;
 bh=PbFsUHk4QB3SheUZeaBJ+DTccJM/jAn1azV/1OPQDew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QaV6YIgDXEc4jFY5js+aO1Ha8BsrodSkdpSfqjfqk6HIoC9G7JpHVvM7ErzIjmWb5
 VeuIcs7IrpxW3tADlxosfhxiZfasS/br6b03tMgE0EVwaNEif7vltZ0Wj5lD5yQngm
 byvLWIfYCnppwzl8BUlEWjVUWn20mdofspfEktEZc1ULBuxGdqaj8erYXKdt8BXLiO
 TN6Ibs3RrADv6iwuMN7i95z5RY8hTes/EtQmQ7btkEsO/lrkL7aRI6icla3dAHul1j
 xR2L4ycN77f9/+sETRb8FveqXRlxqROUBeUFcmHiZIar6uI4XlxFxlVtJJa2ZDYUf1
 ELoNcmBZ6DHYw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1p3aix-0003iO-Su; Fri, 09 Dec 2022 11:35:23 +0100
Date: Fri, 9 Dec 2022 11:35:23 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sc8280xp-crd: Enable EDP
Message-ID: <Y5MPa9l4btcDG9GP@hovoldconsulting.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-12-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207220012.16529-12-quic_bjorande@quicinc.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 07, 2022 at 02:00:11PM -0800, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The SC8280XP CRD has a EDP display on MDSS0 DP3, enable relevant nodes
> and link it together with the backlight control.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v4:
> - None
> 
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 72 ++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index f09810e3d956..a7d2384cbbe8 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -20,7 +20,7 @@ aliases {
>  		serial0 = &qup2_uart17;
>  	};
>  
> -	backlight {
> +	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&pmc8280c_lpg 3 1000000>;
>  		enable-gpios = <&pmc8280_1_gpios 8 GPIO_ACTIVE_HIGH>;
> @@ -34,6 +34,22 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_EDP_3P3";

Please use the net name from the schematics here (i.e. "VCC3LCD").

> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edp_reg_en>;
> +
> +		regulator-boot-on;
> +	};
> +
>  	vreg_edp_bl: regulator-edp-bl {
>  		compatible = "regulator-fixed";
>  
> @@ -230,6 +246,54 @@ vreg_l9d: ldo9 {
>  	};
>  };
>  
> +&dispcc0 {
> +	status = "okay";
> +};
> +
> +&mdss0 {
> +	status = "okay";
> +};
> +
> +&mdss0_dp3 {
> +	compatible = "qcom,sc8280xp-edp";
> +	status = "okay";

Please move the status property last (i.e. after data-lanes).

> +
> +	data-lanes = <0 1 2 3>;
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +			power-supply = <&vreg_edp_3p3>;
> +
> +			backlight = <&backlight>;
> +
> +			ports {
> +				port {
> +					edp_panel_in: endpoint {
> +						remote-endpoint = <&mdss0_dp3_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			mdss0_dp3_out: endpoint {
> +				remote-endpoint = <&edp_panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss0_dp3_phy {
> +	status = "okay";

Same here.

> +
> +	vdda-phy-supply = <&vreg_l6b>;
> +	vdda-pll-supply = <&vreg_l3b>;
> +};
> +
>  &pcie2a {
>  	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> @@ -496,6 +560,12 @@ hastings_reg_en: hastings-reg-en-state {
>  &tlmm {
>  	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
>  
> +	edp_reg_en: edp-reg-en-state {
> +		pins = "gpio25";
> +		function = "gpio";
> +		output-enable;

'output-enable' is not valid for tlmm and causes the settings to be
rejected:

	sc8280xp-tlmm f100000.pinctrl: pin_config_group_set op failed for group 25
	reg-fixed-voltage regulator-edp-3p3: Error applying setting, reverse things back

> +	};
> +
>  	kybd_default: kybd-default-state {
>  		disable-pins {
>  			pins = "gpio102";

Johan
