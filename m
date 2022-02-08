Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E5B4AE38C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 23:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2080B10E4AC;
	Tue,  8 Feb 2022 22:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4180010E4BC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 22:23:46 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id 10so578446plj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 14:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vMaF5jT9/UaEWAfDk+2t6KL6ikIYvAUy+840Rteop/E=;
 b=j7gQSdsIWiZdmU//a2QwO46EbQ5SIOH5fWGlAvhnBWPyFq4bLW/fWbmZlxZwzUEr4f
 8jomGnNxVxG+1yeClJtxG+wNefH84zBQj8X1Q+/CXgcqGY0ThDT1+d0SNl+SrNbcDLGZ
 9bNGdlRDRHEbDB/cx8WWmOR4hrIdnDY9Pb6jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vMaF5jT9/UaEWAfDk+2t6KL6ikIYvAUy+840Rteop/E=;
 b=1yA/Sc7+vfZs7o1eEPiMyE0gpsCmVuwmUJXdsdQu9CogCs3ARA4sXAZpHYVkhJbaSG
 4aVh+Y++aOn4w1CXAo99aM6EPwEyf9OHIluCv/z4SoXcO3yeyTq3Kf9swfPHdBZvmpi5
 LHLFOx4eHi2MU3NbzX/DoCBcbBRDBQPuAfXjD+8yoOV8cY4C/LhJyq7QQLNgdpDDoclv
 pdLvtMVk7NHjbXIutHzzFRvEA71fUYIx7axa3mq0HnlRxVqHPSzQx0YTYRbTSmckDbH6
 XEzXda+NXsP2Be8zFzQfSE7LvjT/zBDmLJuBG00GSpllj+r7pHUw960y6wftQyZv4tRw
 abww==
X-Gm-Message-State: AOAM531k7ZzYCDVlkMd1RRf3P24lgcu0+DGdxdwvbXffffxAGsTxazTR
 0Uh7IIQKYK9HsAnrab/1DufqaQ==
X-Google-Smtp-Source: ABdhPJxcJ61KROyKtZBAr6c9l+ods/Vf3fMBBg9aC+tckxuWCgMKjcQOdpiGoKC76Uo39dfbYIvJFQ==
X-Received: by 2002:a17:90a:4811:: with SMTP id
 a17mr99117pjh.159.1644359025755; 
 Tue, 08 Feb 2022 14:23:45 -0800 (PST)
Received: from localhost ([2620:15c:202:201:23dc:d215:b887:777d])
 by smtp.gmail.com with UTF8SMTPSA id q2sm3684055pjj.32.2022.02.08.14.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:23:45 -0800 (PST)
Date: Tue, 8 Feb 2022 14:23:43 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Message-ID: <YgLtb8NCGKDi2uh4@google.com>
References: <1644333525-30920-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644333525-30920-3-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 agross@kernel.org, seanpaul@chromium.org, thierry.reding@gmail.com,
 swboyd@chromium.org, freedreno@lists.freedesktop.org, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 08:48:43PM +0530, Sankeerth Billakanti wrote:
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

nit: the other fixed regulator in sc7280-idp.dtsi is called
'nvme_3v3_regulator', if you wanted to be consistent you
could call this backlight_3v3_regulator.

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

nit: see above

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

should be before 'mdss_edp'.

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
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&edp_bl_pwm>;
> +};
> +
> +&pm8350c_gpios {

should be before 'pm8350c_pwm'

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
> +
> +		power-supply = <&backlight_power>;
> +		pwms = <&pm8350c_pwm 3 65535>;
> +	};
> +
> +	edp_panel: edp_panel {

in difference to labels node names should use dashes as separator, not
underscores (i.e. 'edp-panel')

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

This was just added a few days ago by commit 118cd3b8ec0d ("arm64: dts: qcom:
sc7280: Add edp_out port and HPD lines"). The patch assumes that the 'Hot
Plug Detect line (which functions as "panel ready" in eDP) is highly likely
to be used by boards.'. If that is indeed the case and the CRD is the
exception then it seems that deleting the two properties from the CRD DT
would be a better solution.
