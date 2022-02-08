Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE6B4AE5A4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 00:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DF810E332;
	Tue,  8 Feb 2022 23:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC85910E301
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 23:50:42 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id y23so749766oia.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 15:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZfjRDOxBlYHHE14BCEgNLKQP/YKV4fajU6/9Z4+F+7A=;
 b=BS1mRT/hnJZLCPbRnmOQrH/RP9NXql41p4yiX3I3vTpbaWa9H2QX9ueT/PbbIIpBuO
 wKqnqoM3msoIl9hG3IiOugSaK1fQ8hoYA+r15JyTQPHg8hfVsy9t1ilb+jSAzpn6wcMK
 gAS/tWHJXvWOtI1yFKDxXFYr2mF3e/kdxYNAAeEeMGFHRkJwhl3TCK59jaVEx76efa3A
 DaCnejo/My5XGJocCbE3m5k8l7o9LKYrF0frYXql9fHASVIExKIvafASKEGaBPqk/WJR
 /4Tthh1oC+i21lhVB8JNUmUR187U/N30084/wUF/y8Noy8UWZtM8jrTTKwcemIGn34+C
 AIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZfjRDOxBlYHHE14BCEgNLKQP/YKV4fajU6/9Z4+F+7A=;
 b=XZhIm8Mk3YqftzvEsGkhfjvT61wm/CO/7lkftm6ZPdq1LnifZK5DlYDIHiAmT0mTPx
 /kIRGXoVCkwowKH880bbn9/J23ue9PA3tV7z0wfifoo+MQUoacA2xtuVOAULEjzf8XJq
 pgaTRjLV23TuYj0yo+WSiGp/IHVzyOkbWbmCxUdR9wuNgqwGOKiGHqWRaN8mp7kXZkb2
 di3N6O/1bo6eKyk2cay5aVc4I/3ULHHFyyTIElmz1+fWumo/VV+5tYf2ukwKWBmhmZ1A
 y5sg06L0DW6gESDArNLrsz5bNdnSk4jmK5r7XZ1vsCzcoScLLOmfqoM2of5JNp3AC4zZ
 vlFw==
X-Gm-Message-State: AOAM532raYqQt9KEb44C1zkoR3JKIMc00S/AIVUtxQ4TXSN8OTI2jCFK
 vDDH95SebXCiY+E5x6vgy8M+hw==
X-Google-Smtp-Source: ABdhPJwsbbOsQ2Ax/QBE65F8Xax4Q1ry58y4ohjRKiITBFnYm47y1u0Jiw5XKGU8I+Mz56JLFI6/nA==
X-Received: by 2002:a05:6808:1920:: with SMTP id
 bf32mr177216oib.304.1644364241902; 
 Tue, 08 Feb 2022 15:50:41 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id d22sm5729003otp.79.2022.02.08.15.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 15:50:41 -0800 (PST)
Date: Tue, 8 Feb 2022 15:52:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Message-ID: <YgMCW9GrY6SRteOU@ripper>
References: <1644333525-30920-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644333525-30920-3-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644333525-30920-3-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, dianders@chromium.org,
 sam@ravnborg.org, krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, agross@kernel.org,
 seanpaul@chromium.org, thierry.reding@gmail.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 08 Feb 07:18 PST 2022, Sankeerth Billakanti wrote:

> Enable the eDP display panel support without HPD on sc7280 platform.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 
> Changes in v2:
>   - sort node references alphabetically
>   - improve readability
>   - move the pwm pinctrl to pwm node
>   - move the regulators to root
>   - define backlight power
>   - remove dummy regulator node
>   - cleanup pinctrl definitions
> 
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 122 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    |   2 -
>  2 files changed, 122 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index e2efbdd..bff2707 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -21,6 +21,34 @@
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	backlight_power: backlight-power {
> +		compatible = "regulator-fixed";
> +		regulator-name = "backlight_power";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edp_bl_power>;
> +	};
> +
> +	edp_power: edp-power {
> +		compatible = "regulator-fixed";
> +		regulator-name = "edp_power";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edp_panel_power>;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -76,6 +104,42 @@ ap_ts_pen_1v8: &i2c13 {
>  	};
>  };
>  
> +&edp_out {

Sorry for missing this while merging changes in sc7280.dtsi. But it
would be really nice if this was labeled mdss_edp_out instead (or
possibly defined within the &mdss_edp node).

Now you will have &edp_out and &dp_out floating around away from the edp
and dp nodes...

> +	remote-endpoint = <&edp_panel_in>;
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_edp {
> +	status = "okay";
> +
> +	vdda-1p2-supply = <&vreg_l6b_1p2>;
> +	vdda-0p9-supply = <&vreg_l10c_0p8>;
> +};
> +
> +&mdss_edp_phy {
> +	status = "okay";
> +
> +	vdda-1p2-supply = <&vreg_l6b_1p2>;
> +	vdda-0p9-supply = <&vreg_l10c_0p8>;
> +};
> +
> +&mdss_dp {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&dp_hot_plug_det>;
> +	data-lanes = <0 1>;
> +	vdda-1p2-supply = <&vreg_l6b_1p2>;
> +	vdda-0p9-supply = <&vreg_l1b_0p8>;
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>  &nvme_3v3_regulator {
>  	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>  };
> @@ -84,7 +148,65 @@ ap_ts_pen_1v8: &i2c13 {
>  	pins = "gpio51";
>  };
>  
> +&pm8350c_pwm {

This label doesn't exist, so I won't be able to merge this patch.

> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&edp_bl_pwm>;
> +};
> +
> +&pm8350c_gpios {
> +	edp_bl_power: edp-bl-power {
> +		pins = "gpio7";
> +		function = "normal";
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	edp_bl_pwm: edp-bl-pwm {
> +		pins = "gpio8";
> +		function = "func1";
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		bias-disable;
> +		output-low;
> +	};
> +};
> +
> +&soc {
> +	edp_backlight: edp-backlight {
> +		compatible = "pwm-backlight";

This is not a device on the mmio bus, so it should not love within the
&soc.

> +
> +		power-supply = <&backlight_power>;
> +		pwms = <&pm8350c_pwm 3 65535>;
> +	};
> +
> +	edp_panel: edp_panel {

Ditto.

Regards,
Bjorn

> +		compatible = "sharp,lq140m1jw46";
> +
> +		power-supply = <&edp_power>;
> +		backlight = <&edp_backlight>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +				edp_panel_in: endpoint {
> +					remote-endpoint = <&edp_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &tlmm {
> +	edp_panel_power: edp-panel-power {
> +		pins = "gpio80";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
> +
>  	tp_int_odl: tp-int-odl {
>  		pins = "gpio7";
>  		function = "gpio";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3572399..f8fa716 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3012,8 +3012,6 @@
>  
>  			mdss_edp: edp@aea0000 {
>  				compatible = "qcom,sc7280-edp";
> -				pinctrl-names = "default";
> -				pinctrl-0 = <&edp_hot_plug_det>;
>  
>  				reg = <0 0xaea0000 0 0x200>,
>  				      <0 0xaea0200 0 0x200>,
> -- 
> 2.7.4
> 
