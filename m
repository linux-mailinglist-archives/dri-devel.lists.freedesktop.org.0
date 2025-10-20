Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5848BF19AC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 15:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6D310E43F;
	Mon, 20 Oct 2025 13:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bQ1+1cKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB5E10E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:46:00 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-63bea08a326so6005085a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 06:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760967959; x=1761572759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UsdSXxtK2e/jSRjlYL+PvN4ai9sNqYnnc+D+KNBqw4s=;
 b=bQ1+1cKRzP8QUuTkDejzm63ATPY3Ybbwg038dRvJLMvRIyBMAf+Xd6SjU3Xj3YOVIb
 pt1uOxjtOgfLxhr+e+yo1aqMrXz1tLXCWgghVn9u+lq/4liR3uKZNORq/L/jOWjokj85
 vqN5kkU5iTOXBT8alfGswl9QKVsISaqe6iAyc1lxqTcQ00+Zz5MafQ6YNxSfkzvYFAsu
 h6sjC00S0Alfb65XXk5GMg/LIHjW+A/xQO8poQG0sk0bpeLScanewLAS6j6SfnI6cjht
 pZtLi3Qy/f5GnFr/YsnvefOwBSBAV2BketjamsvUQEuogRuurWGZq2Jo3cYJPFfU9Mv7
 khEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760967959; x=1761572759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UsdSXxtK2e/jSRjlYL+PvN4ai9sNqYnnc+D+KNBqw4s=;
 b=gzrepj4dJS3JSe/QcPuf8YI7k0iIn7vTVvtHZQWwiAFAc/VMq8BmUJtR2+1BSGG94p
 NRLH76vs7IuQdB/psDtAMdXe275ggxhTYspCyCdVNkfCJ+sz4z3Vr8Q3dx3aKKIIZeXS
 TdG1O3BMv7RQflvmcxlo13mUB2L4iDIyxbMOKO86e8GzVdrXhSna4CcrQHIT1Lrd2lcc
 r0m/mFfcNuATxCVGQTTnyeOvsq4ekGlYF6/3D+O89fYW4wVYbIN5THjbnxckwmpWaz9t
 jiebY8Ff4oG+LM150DnU6WHdZPQ35dT9wFVJ0+r/a2Ny26HJ03EYNAUN/qJMIJpinIEV
 1Htg==
X-Gm-Message-State: AOJu0Ywo8EWZCiv1a5F58gIIwCCJ1urjM9bYxO/uh4FzRrekVK74oAaN
 URUlxPknKmfhc4dxpQOdFwKCOwQAilqamDD6ILLiRYjv4QH+u7HR2l3B4J5VPynASx8=
X-Gm-Gg: ASbGncuiM1O/+g3G3ZsgDdYde1TWOJXTKi1cWRs8fqkdlpSWhWjwdeRUbcd/Fl+sm04
 R9c+IjB/4JJaCaEJJQuBRlWGI/L6tIsIumoEQaPBVqlBcU4VVqsiCNV9YMl6+fF3CwFZlJA4wVe
 bqv+x5O5sNY2TQo5GIBF0/9r2nO7M/8XE0RX/+cj58IU7RCqOmZaYff2Dc86tUU9Q8o4WYhO4U7
 vo2lj+jjKF9D1EAdSRCj7u+3Z2rhdfPDljX0UgVzsPTlszooechfo6we2SJZLkVnxABeU4qeFlM
 1nN7fJLdPg6alQaGOt8RA7OmiL1gtb8zH5OOj6+atW1vR/QBRBfAic3pO8eSbnBoTlRaXWrNco4
 lUb2185x0FIwVmh79KMv0UShp3UcFQ43AFHQohleZ0tao5nsiOs9v/7TU5cCzb7xN9VE1eXh/Ae
 uWzaY1x1PUxoMpvUwpMEdSdoVmANtBxdSNLBAbwLTQXv+/7qkZtn4=
X-Google-Smtp-Source: AGHT+IGtChbu+BFRFgmruupaHMS+YTJq85VdKiOgnQsI1T0cofPdNHTi4Ln+S+OBz5ucIxqGiunGkw==
X-Received: by 2002:a17:907:94c1:b0:b4f:ee15:8ae8 with SMTP id
 a640c23a62f3a-b647453ff06mr1403971766b.58.1760967958539; 
 Mon, 20 Oct 2025 06:45:58 -0700 (PDT)
Received: from [192.168.1.36] (p5b29e551.dip0.t-ipconnect.de. [91.41.229.81])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb725f3fsm793159666b.68.2025.10.20.06.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 06:45:57 -0700 (PDT)
Message-ID: <aeb9a34a-d9ea-4027-9f61-beae73498266@linaro.org>
Date: Mon, 20 Oct 2025 15:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: sdm845-oneplus: Describe panel
 vci and poc supplies
Content-Language: en-US
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 16/10/2025 18:16, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> There are two additional supplies used by the panel, both are GPIO
> controlled and are left enabled by the bootloader for continuous splash.
> 
> Previously these were (incorrectly) modelled as pinctrl. Describe them
> properly so that the panel can control them.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")

This Fixes: is not correct, it should be the commit that first added the
panel to the DT since it was added after the initial DT.

The driver changes also need to be backported and may not apply properly
to stable kernels, so we should be careful with this.
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index dcfffb271fcf3..1cf03047dd7ae 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -162,6 +162,34 @@ ts_1p8_supply: ts-1p8-regulator {
>  		enable-active-high;
>  		regulator-boot-on;
>  	};
> +
> +	panel_vci_3v3: panel-vci-3v3-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LCD_VCI_3V";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&panel_vci_default>;
> +		pinctrl-names = "default";
> +		regulator-boot-on;
> +	};
> +
> +	panel_vddi_poc_1p8: panel-vddi-poc-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDI_POC";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&panel_poc_default>;
> +		pinctrl-names = "default";
> +		regulator-boot-on;
> +	};
>  };
>  
>  &adsp_pas {
> @@ -429,6 +457,8 @@ display_panel: panel@0 {
>  		reg = <0>;
>  
>  		vddio-supply = <&vreg_l14a_1p88>;
> +		vci-supply = <&panel_vci_3v3>;
> +		poc-supply = <&panel_vddi_poc_1p8>;
>  
>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  
> @@ -803,6 +833,20 @@ hall_sensor_default: hall-sensor-default-state {
>  		bias-disable;
>  	};
>  
> +	panel_vci_default: vci-state {
> +		pins = "gpio26";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_poc_default: poc-state {
> +		pins = "gpio25";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
>  	tri_state_key_default: tri-state-key-default-state {
>  		pins = "gpio40", "gpio42", "gpio26";
>  		function = "gpio";
> @@ -818,7 +862,7 @@ ts_default_pins: ts-int-state {
>  	};
>  
>  	panel_reset_pins: panel-reset-state {
> -		pins = "gpio6", "gpio25", "gpio26";
> +		pins = "gpio6";
>  		function = "gpio";
>  		drive-strength = <8>;
>  		bias-disable;
> 

-- 
// Casey (she/her)

