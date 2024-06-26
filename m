Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B305B917733
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 06:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C567E10E1AC;
	Wed, 26 Jun 2024 04:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L7gTc0Sd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFB010E1AC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:16:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F3C86122C;
 Wed, 26 Jun 2024 04:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A17C2BD10;
 Wed, 26 Jun 2024 04:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719375397;
 bh=0hebWygg9tsCmkyf+fkAl70fxWVWa3kYkNFZjge3O1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L7gTc0SdkE4I6ZaW3/woROuS0mElIB7t99B9lGypdWhxVdNz/0DArnwJT0FSsYmvF
 Mn91xBTmm26oXMBVVtdtulsgncZUb/B7QtBIn2X2LO/UKIT2m2EYi+bafJA5Z4ioIG
 G7d+tKkVRqoLQE4FvVSCUbj+jySUa/93sJ9ikqWmmysjzgNNW5d85+DLjiiwRNWHuy
 AQAfL9juhI674AVaDEYEtxW+Aw33TJYnb1+Wo7VceqqYzXd6ow+MotbWwNkM6m1M7T
 As0Z8JnYyEpDyZYcjhY9rEK6J5Dlwe73R02VFGkkkYjdDS3uVaxo51r5OSStTdzJ0V
 qLsoALVJMrc0w==
Date: Tue, 25 Jun 2024 23:16:34 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Henrik Rydberg <rydberg@bitmath.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Frieder Hannenheim <frieder.hannenheim@proton.me>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: add OnePlus 8T (kebab)
Message-ID: <ckl554gpw74ot7x7ruce3ik2judbwg3ift2aiqr2wycgu6zhbh@jk5wp2so6pm7>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-7-388eecf2dff7@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-7-388eecf2dff7@postmarketos.org>
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

On Mon, Jun 24, 2024 at 03:30:31AM GMT, Caleb Connolly wrote:
> Initial support for USB, UFS, touchscreen, panel, wifi, and bluetooth.
> 

Nice.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
[..]
> +	vph_pwr: vph-pwr-regulator {

Please keep nodes sorted by address, then node name, then label (as
applicable). Perhaps making the -regulator suffix a regulator- prefix
instead (to keep them grouped).

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +		regulator-always-on;
> +	};
> +
> +	vreg_s4a_1p8: vreg-s4a-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
[..]
> +&adsp {
> +	status = "okay";

Per Documentation/devicetree/bindings/dts-coding-style.rst please keep
"status" as last property in your nodes.

> +	firmware-name = "qcom/sm8250/OnePlus/adsp.mbn";
> +};
> +
[..]
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l9a_1p2>;
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +		vddio-supply = <&vreg_l14a_1p8>;
> +		vdd-supply = <&vreg_l11c_3p3>;
> +		avdd-supply = <&panel_avdd_5p5>;

How do you know that the panel will have these properties, when you
don't give it a compatible here? Not a strong objection, but perhaps
this should be pushed out?

> +		/* FIXME: There is a bug somewhere in the display stack and it isn't
> +		 * possible to get the panel to a working state after toggling reset.
> +		 * At best it just shows one or more vertical red lines. So for now
> +		 * let's skip the reset GPIO.
> +		 */
> +		// reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&panel_reset_pins &panel_vsync_pins &panel_vout_pins>;
> +		pinctrl-names = "default";
> +
> +		status = "disabled";
> +
> +		port {
> +			panel_in_0: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +
> +};
[..]
> +&pm8150_gpios {
> +	gpio-reserved-ranges = <2 1>, <4 1>, <8 1>;

How come?

> +};
> +
[..]
> +&tlmm {
> +	gpio-reserved-ranges = <28 4>, <40 4>;
> +
> +	bt_en_state: bt-default-state {
> +		pins = "gpio21";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-low;
> +		bias-pull-up;
> +	};
> +
> +	wlan_en_state: wlan-default-state {
> +		wlan-en-pins {

Perhaps flatten this?

> +			pins = "gpio20";
> +			function = "gpio";
> +
> +			drive-strength = <16>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +	};
> +
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
[..]
> +&i2c13 {
[..]
> +};
> +
> +&display_panel {

'd' < 'i'

Regards,
Bjorn

> +	compatible = "samsung,amb655x";
> +	status = "okay";
> +};
> 
> -- 
> 2.45.0
> 
