Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB7RHbQ/lGlfBQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:15:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD93F14AB99
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9041D10E143;
	Tue, 17 Feb 2026 10:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.b="TLc63z9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9744210E143
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 10:15:10 +0000 (UTC)
Received: from [IPV6:2a02:f000:10bd:e301::1d7] (unknown
 [IPv6:2a02:f000:10bd:e301::1d7])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 9851B5340602;
 Tue, 17 Feb 2026 11:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1771323306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qf3xXdt06hjsqXbVAHMi3GSkZagvu9CTJh8dfs1FkaA=;
 b=TLc63z9YlJH5YKwzfYYK16fE5yd/JloyNtRNLuzEyV4uuHDKYOkL3Tp8Zvage4nUJJfz7v
 XpHihtbuCivlbsx3ofCIX7d68MYgyY5Aei6EEF8MBYQRVPCykCwXPEILYQ2Q2dgOqjcebW
 qfJthI2qB0A9hTnQLvQ9DiYb+ujVPZA=
Message-ID: <0b0fcaaf-0c29-4145-b9cb-aaa401514ed9@ixit.cz>
Date: Tue, 17 Feb 2026 11:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sdm670-google: add common device
 tree include
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-6-mailingradian@gmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20260217000854.131242-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[david@ixit.cz,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ixit.cz:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CD93F14AB99
X-Rspamd-Action: no action

On 17/02/2026 01:08, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   ...le-sargo.dts => sdm670-google-common.dtsi} |  18 +-
>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 710 +-----------------
>   2 files changed, 21 insertions(+), 707 deletions(-)
>   copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> similarity index 97%
> copy from arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> copy to arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index 2e86bed9ea8c..c47e78aeef9e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -6,8 +6,6 @@
>    * Copyright (c) 2022, Richard Acayan. All rights reserved.
>    */
>   
> -/dts-v1/;
> -
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> @@ -28,9 +26,6 @@
>   /delete-node/ &gpu_mem;
>   
>   / {
> -	model = "Google Pixel 3a";
> -	compatible = "google,sargo", "qcom,sdm670";
> -
>   	aliases { };
>   
>   	battery: battery {
> @@ -38,7 +33,6 @@ battery: battery {
>   
>   		voltage-min-design-microvolt = <3312000>;
>   		voltage-max-design-microvolt = <4400000>;
> -		charge-full-design-microamp-hours = <3000000>;
>   	};
>   
>   	chosen {
> @@ -50,11 +44,9 @@ chosen {
>   
>   		framebuffer: framebuffer@9c000000 {
>   			compatible = "simple-framebuffer";
> -			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
> -			width = <1080>;
> -			height = <2220>;
> -			stride = <(1080 * 4)>;
> +			/* dimensions and size are in specific device trees */
>   			format = "a8r8g8b8";
> +			status = "disabled";
>   		};
>   	};
>   
> @@ -518,8 +510,6 @@ rmi4-f01@1 {
>   
>   		rmi4_f12: rmi4-f12@12 {
>   			reg = <0x12>;
> -			touchscreen-x-mm = <62>;
> -			touchscreen-y-mm = <127>;
>   			syna,sensor-type = <1>;
>   		};
>   	};
> @@ -534,7 +524,7 @@ &mdss_dsi0 {
>   	status = "okay";
>   
>   	panel: panel@0 {
> -		compatible = "samsung,s6e3fa7-ams559nk06";
> +		/* compatible is provided in specific device trees */
>   		reg = <0>;
>   
>   		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> @@ -544,6 +534,8 @@ panel: panel@0 {
>   
>   		power-supply = <&vreg_l6b_3p3>;
>   
> +		status = "disabled";
> +
>   		port {
>   			panel_in: endpoint {
>   				remote-endpoint = <&mdss_dsi0_out>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> index 2e86bed9ea8c..7a3e24997232 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> @@ -1,715 +1,37 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Device tree for Google Pixel 3a, adapted from google-blueline device tree,
> - * xiaomi-lavender device tree, and oneplus-common device tree.
> + * Device tree for Google Pixel 3a (non-XL).
>    *
> - * Copyright (c) 2022, Richard Acayan. All rights reserved.
> + * Copyright (c) 2023, Richard Acayan. All rights reserved.

You can happily omit the year in the copyright (and updates are 
discouraged).

>    */
>   
>   /dts-v1/;
>   
> -#include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/input/input.h>
> -#include <dt-bindings/leds/common.h>
> -#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> -#include <dt-bindings/power/qcom-rpmpd.h>
> -#include "sdm670.dtsi"
> -#include "pm660.dtsi"
> -#include "pm660l.dtsi"
> -
> -/delete-node/ &mpss_region;
> -/delete-node/ &venus_mem;
> -/delete-node/ &wlan_msa_mem;
> -/delete-node/ &cdsp_mem;
> -/delete-node/ &mba_region;
> -/delete-node/ &adsp_mem;
> -/delete-node/ &ipa_fw_mem;
> -/delete-node/ &ipa_gsi_mem;
> -/delete-node/ &gpu_mem;
> +#include "sdm670-google-common.dtsi"
>   
>   / {
>   	model = "Google Pixel 3a";
>   	compatible = "google,sargo", "qcom,sdm670";
> -
> -	aliases { };
> -
> -	battery: battery {
> -		compatible = "simple-battery";
> -
> -		voltage-min-design-microvolt = <3312000>;
> -		voltage-max-design-microvolt = <4400000>;
> -		charge-full-design-microamp-hours = <3000000>;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		framebuffer: framebuffer@9c000000 {
> -			compatible = "simple-framebuffer";
> -			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
> -			width = <1080>;
> -			height = <2220>;
> -			stride = <(1080 * 4)>;
> -			format = "a8r8g8b8";
> -		};
> -	};
> -
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -		autorepeat;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&vol_up_pin>;
> -
> -		key-vol-up {
> -			label = "Volume Up";
> -			linux,code = <KEY_VOLUMEUP>;
> -			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> -		};
> -	};
> -
> -	reserved-memory {
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -
> -		mpss_region: mpss@8b000000 {
> -			reg = <0 0x8b000000 0 0x9800000>;
> -			no-map;
> -		};
> -
> -		venus_mem: venus@94800000 {
> -			reg = <0 0x94800000 0 0x500000>;
> -			no-map;
> -		};
> -
> -		wlan_msa_mem: wlan-msa@94d00000 {
> -			reg = <0 0x94d00000 0 0x100000>;
> -			no-map;
> -		};
> -
> -		cdsp_mem: cdsp@94e00000 {
> -			reg = <0 0x94e00000 0 0x800000>;
> -			no-map;
> -		};
> -
> -		mba_region: mba@95600000 {
> -			reg = <0 0x95600000 0 0x200000>;
> -			no-map;
> -		};
> -
> -		adsp_mem: adsp@95800000 {
> -			reg = <0 0x95800000 0 0x2200000>;
> -			no-map;
> -		};
> -
> -		ipa_fw_mem: ipa-fw@97a00000 {
> -			reg = <0 0x97a00000 0 0x10000>;
> -			no-map;
> -		};
> -
> -		ipa_gsi_mem: ipa-gsi@97a10000 {
> -			reg = <0 0x97a10000 0 0x5000>;
> -			no-map;
> -		};
> -
> -		gpu_mem: gpu@97a15000 {
> -			reg = <0 0x97a15000 0 0x2000>;
> -			no-map;
> -		};
> -
> -		framebuffer-region@9c000000 {
> -			reg = <0 0x9c000000 0 0x2400000>;
> -			no-map;
> -		};
> -
> -		/* Also includes ramoops regions */
> -		debug_info_mem: debug-info@a1800000 {
> -			reg = <0 0xa1800000 0 0x411000>;
> -			no-map;
> -		};
> -	};
> -
> -	/*
> -	 * The touchscreen regulator seems to be controlled somehow by a gpio.
> -	 * Model it as a fixed regulator and keep it on. Without schematics we
> -	 * don't know how this is actually wired up...
> -	 */
> -	ts_1p8_supply: ts-1p8-regulator {
> -		compatible = "regulator-fixed";
> -		regulator-name = "ts_1p8_supply";
> -
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -
> -		gpio = <&pm660_gpios 12 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	vph_pwr: vph-pwr-regulator {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vph_pwr";
> -		regulator-min-microvolt = <3312000>;
> -		regulator-max-microvolt = <3312000>;
> -
> -		regulator-always-on;
> -		regulator-boot-on;
> -	};
> -
> -	/*
> -	 * Supply map from xiaomi-lavender specifies this as the supply for
> -	 * ldob1, ldob9, ldob10, ldoa2, and ldoa3, while downstream specifies
> -	 * this as a power domain. Set this as a fixed regulator with the same
> -	 * voltage as lavender until display is needed to avoid unneccessarily
> -	 * using a deprecated binding (regulator-fixed-domain).
> -	 */
> -	vreg_s2b_1p05: vreg-s2b-regulator {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vreg_s2b";
> -		regulator-min-microvolt = <1050000>;
> -		regulator-max-microvolt = <1050000>;
> -	};
> -
> -	cam_front_ldo: cam-front-ldo-regulator {
> -		compatible = "regulator-fixed";
> -		regulator-name = "cam_front_ldo";
> -		regulator-min-microvolt = <1352000>;
> -		regulator-max-microvolt = <1352000>;
> -		regulator-enable-ramp-delay = <135>;
> -
> -		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -
> -		pinctrl-0 = <&cam_front_ldo_pin>;
> -		pinctrl-names = "default";
> -	};
> -
> -	cam_vio_ldo: cam-vio-ldo-regulator {
> -		compatible = "regulator-fixed";
> -		regulator-name = "cam_vio_ldo";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -		regulator-enable-ramp-delay = <233>;
> -
> -		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -
> -		pinctrl-0 = <&cam_vio_pin>;
> -		pinctrl-names = "default";
> -	};
> -};
> -
> -&apps_rsc {
> -	regulators-0 {
> -		compatible = "qcom,pm660-rpmh-regulators";
> -		qcom,pmic-id = "a";
> -
> -		vdd-s1-supply = <&vph_pwr>;
> -		vdd-s2-supply = <&vph_pwr>;
> -		vdd-s3-supply = <&vph_pwr>;
> -		vdd-s4-supply = <&vph_pwr>;
> -		vdd-s5-supply = <&vph_pwr>;
> -		vdd-s6-supply = <&vph_pwr>;
> -
> -		vdd-l1-l6-l7-supply = <&vreg_s6a_0p87>;
> -		vdd-l2-l3-supply = <&vreg_s2b_1p05>;
> -		vdd-l5-supply = <&vreg_s2b_1p05>;
> -		vdd-l8-l9-l10-l11-l12-l13-l14-supply = <&vreg_s4a_2p04>;
> -		vdd-l15-l16-l17-l18-l19-supply = <&vreg_bob>;
> -
> -		/*
> -		 * S1A (FTAPC0), S2A (FTAPC1), S3A (HFAPC1) are managed
> -		 * by the Core Power Reduction hardened (CPRh) and the
> -		 * Operating State Manager (OSM) HW automatically.
> -		 */
> -
> -		vreg_s4a_2p04: smps4 {
> -			regulator-min-microvolt = <1808000>;
> -			regulator-max-microvolt = <2040000>;
> -			regulator-enable-ramp-delay = <200>;
> -		};
> -
> -		vreg_s6a_0p87: smps6 {
> -			regulator-min-microvolt = <1224000>;
> -			regulator-max-microvolt = <1352000>;
> -			regulator-enable-ramp-delay = <150>;
> -		};
> -
> -		/* LDOs */
> -		vreg_l1a_1p225: ldo1 {
> -			regulator-min-microvolt = <1200000>;
> -			regulator-max-microvolt = <1250000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l2a_1p0: ldo2 {
> -			regulator-min-microvolt = <1000000>;
> -			regulator-max-microvolt = <1000000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l3a_1p0: ldo3 {
> -			regulator-min-microvolt = <1000000>;
> -			regulator-max-microvolt = <1000000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l5a_0p848: ldo5 {
> -			regulator-min-microvolt = <800000>;
> -			regulator-max-microvolt = <800000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l6a_1p3: ldo6 {
> -			regulator-min-microvolt = <1248000>;
> -			regulator-max-microvolt = <1304000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l7a_1p2: ldo7 {
> -			regulator-min-microvolt = <1200000>;
> -			regulator-max-microvolt = <1200000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l8a_1p8: ldo8 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-enable-ramp-delay = <250>;
> -			regulator-always-on;
> -		};
> -
> -		vreg_l9a_1p8: ldo9 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l10a_1p8: ldo10 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l11a_1p8: ldo11 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l12a_1p8: ldo12 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l13a_1p8: ldo13 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l14a_1p8: ldo14 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l15a_1p8: ldo15 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <2950000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l16a_2p7: ldo16 {
> -			regulator-min-microvolt = <2696000>;
> -			regulator-max-microvolt = <2696000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l17a_1p8: ldo17 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <2950000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l19a_3p3: ldo19 {
> -			regulator-min-microvolt = <3000000>;
> -			regulator-max-microvolt = <3312000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -	};
> -
> -	regulators-1 {
> -		compatible = "qcom,pm660l-rpmh-regulators";
> -		qcom,pmic-id = "b";
> -
> -		vdd-s1-supply = <&vph_pwr>;
> -		vdd-s2-supply = <&vph_pwr>;
> -		vdd-s3-s4-supply = <&vph_pwr>;
> -		vdd-s5-supply = <&vph_pwr>;
> -
> -		vdd-l1-l9-l10-supply = <&vreg_s2b_1p05>;
> -		vdd-l2-supply = <&vreg_bob>;
> -		vdd-l3-l5-l7-l8-supply = <&vreg_bob>;
> -		vdd-l4-l6-supply = <&vreg_bob>;
> -		vdd-bob-supply = <&vph_pwr>;
> -
> -		/* LDOs */
> -		vreg_l1b_0p925: ldo1 {
> -			regulator-min-microvolt = <880000>;
> -			regulator-max-microvolt = <900000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l2b_2p95: ldo2 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <2960000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l3b_3p0: ldo3 {
> -			regulator-min-microvolt = <2850000>;
> -			regulator-max-microvolt = <3008000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l4b_2p95: ldo4 {
> -			regulator-min-microvolt = <2960000>;
> -			regulator-max-microvolt = <2960000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l5b_2p95: ldo5 {
> -			regulator-min-microvolt = <2960000>;
> -			regulator-max-microvolt = <2960000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l6b_3p3: ldo6 {
> -			regulator-min-microvolt = <3008000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l7b_3p125: ldo7 {
> -			regulator-min-microvolt = <3088000>;
> -			regulator-max-microvolt = <3100000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		vreg_l8b_3p3: ldo8 {
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3312000>;
> -			regulator-enable-ramp-delay = <250>;
> -		};
> -
> -		/*
> -		 * Downstream specifies a fixed voltage of 3.312 V, but the
> -		 * PMIC4 BOB ranges don't support that. Widen the range a
> -		 * little to avoid adding a new BOB regulator type.
> -		 */
> -		vreg_bob: bob {
> -			regulator-min-microvolt = <3296000>;
> -			regulator-max-microvolt = <3328000>;
> -			regulator-enable-ramp-delay = <500>;
> -		};
> -	};
> -};
> -
> -&camss {
> -	vdda-phy-supply = <&vreg_l1a_1p225>;
> -	vdda-pll-supply = <&vreg_s6a_0p87>;
> -
> -	status = "okay";
> -};
> -
> -&camss_port1 {
> -	camss_endpoint1: endpoint {
> -		data-lanes = <0 1 2 3>;
> -		remote-endpoint = <&cam_front_endpoint>;
> -	};
> -};
> -
> -&cci {
> -	pinctrl-0 = <&cci1_default>;
> -	pinctrl-1 = <&cci1_sleep>;
> -	pinctrl-names = "default", "sleep";
> -
> -	status = "okay";
> -};
> -
> -&cci_i2c1 {
> -	camera@1a {
> -		compatible = "sony,imx355";
> -		reg = <0x1a>;
> -
> -		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> -
> -		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> -		assigned-clock-rates = <19200000>;
> -
> -		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> -
> -		avdd-supply = <&cam_front_ldo>;
> -		dvdd-supply = <&cam_front_ldo>;
> -		dovdd-supply = <&cam_vio_ldo>;
> -
> -		pinctrl-0 = <&cam_mclk2_default>;
> -		pinctrl-names = "default";
> -
> -		rotation = <270>;
> -		orientation = <0>;
> -
> -		port {
> -			cam_front_endpoint: endpoint {
> -				link-frequencies = /bits/ 64 <360000000>;
> -				remote-endpoint = <&camss_endpoint1>;
> -			};
> -		};
> -	};
> -};
> -
> -&gcc {
> -	protected-clocks = <GCC_QSPI_CORE_CLK>,
> -			   <GCC_QSPI_CORE_CLK_SRC>,
> -			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
> -};
> -
> -&gpi_dma1 {
> -	status = "okay";
> -};
> -
> -&gpu {
> -	status = "okay";
> -};
> -
> -&gpu_zap_shader {
> -	firmware-name = "qcom/sdm670/sargo/a615_zap.mbn";
> -};
> -
> -&i2c9 {
> -	clock-frequency = <100000>;
> -	status = "okay";
> -
> -	synaptics-rmi4-i2c@20 {
> -		compatible = "syna,rmi4-i2c";
> -		reg = <0x20>;
> -		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&touchscreen_default>;
> -
> -		vio-supply = <&ts_1p8_supply>;
> -
> -		syna,reset-delay-ms = <200>;
> -		syna,startup-delay-ms = <200>;
> -
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		rmi4-f01@1 {
> -			reg = <0x01>;
> -			syna,nosleep-mode = <1>;
> -		};
> -
> -		rmi4_f12: rmi4-f12@12 {
> -			reg = <0x12>;
> -			touchscreen-x-mm = <62>;
> -			touchscreen-y-mm = <127>;
> -			syna,sensor-type = <1>;
> -		};
> -	};
>   };
>   
> -&mdss {
> -	status = "okay";
> +&battery {
> +	charge-full-design-microamp-hours = <3000000>;
>   };
>   
> -&mdss_dsi0 {
> -	vdda-supply = <&vreg_l1a_1p225>;
> +&framebuffer {
> +	reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
> +	width = <1080>;
> +	height = <2220>;
> +	stride = <(1080 * 4)>;
>   	status = "okay";
> -
> -	panel: panel@0 {
> -		compatible = "samsung,s6e3fa7-ams559nk06";
> -		reg = <0>;
> -
> -		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&panel_default>;
> -
> -		power-supply = <&vreg_l6b_3p3>;
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&mdss_dsi0_out>;
> -			};
> -		};
> -	};
>   };
>   
> -&mdss_dsi0_out {
> -	remote-endpoint = <&panel_in>;
> -	data-lanes = <0 1 2 3>;
> -};
> -
> -&mdss_dsi0_phy {
> -	vdds-supply = <&vreg_l1b_0p925>;
> -	status = "okay";
> -};
> -
> -&mdss_mdp {
> +&panel {
> +	compatible = "samsung,s6e3fa7-ams559nk06";

newline

LGTM,

Reviewed-by: David Heidelberg <david@ixit.cz>

>   	status = "okay";
>   };
>   
> -&pm660_charger {
> -	monitored-battery = <&battery>;
> -	status = "okay";
> -};
> -
> -&pm660_gpios {
> -	cam_vio_pin: cam-vio-state {
> -		pins = "gpio13";
> -		function = "normal";
> -		power-source = <0>;
> -	};
> -};
> -
> -&pm660_rradc {
> -	status = "okay";
> -};
> -
> -&pm660l_flash {
> -	status = "okay";
> -
> -	led-0 {
> -		function = LED_FUNCTION_FLASH;
> -		color = <LED_COLOR_ID_WHITE>;
> -		led-sources = <1>, <2>;
> -		led-max-microamp = <500000>;
> -		flash-max-microamp = <1500000>;
> -		flash-max-timeout-us = <1280000>;
> -	};
> -};
> -
> -&pm660l_gpios {
> -	cam_front_ldo_pin: cam-front-state {
> -		pins = "gpio4";
> -		function = "normal";
> -		power-source = <0>;
> -	};
> -
> -	vol_up_pin: vol-up-state {
> -		pins = "gpio7";
> -		function = "normal";
> -		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> -		input-enable;
> -		bias-pull-up;
> -	};
> -};
> -
> -&pon_pwrkey {
> -	status = "okay";
> -};
> -
> -&pon_resin {
> -	linux,code = <KEY_VOLUMEDOWN>;
> -	status = "okay";
> -};
> -
> -&qupv3_id_1 {
> -	status = "okay";
> -};
> -
> -&sdhc_1 {
> -	supports-cqe;
> -	mmc-hs200-1_8v;
> -	mmc-hs400-1_8v;
> -	mmc-ddr-1_8v;
> -
> -	qcom,ddr-config = <0xc3040873>;
> -
> -	vmmc-supply = <&vreg_l4b_2p95>;
> -	vqmmc-supply = <&vreg_l8a_1p8>;
> -
> -	status = "okay";
> -};
> -
> -&tlmm {
> -	gpio-reserved-ranges = <0 4>, <81 4>;
> -
> -	panel_default: panel-default-state {
> -		te-pins {
> -			pins = "gpio10";
> -			function = "mdp_vsync";
> -			drive-strength = <2>;
> -			bias-pull-down;
> -		};
> -
> -		reset-pins {
> -			pins = "gpio75";
> -			function = "gpio";
> -			drive-strength = <8>;
> -			bias-disable;
> -		};
> -
> -		mode-pins {
> -			pins = "gpio76";
> -			function = "gpio";
> -			drive-strength = <8>;
> -			bias-disable;
> -		};
> -	};
> -
> -	touchscreen_default: ts-default-state {
> -		ts-reset-pins {
> -			pins = "gpio99";
> -			function = "gpio";
> -			drive-strength = <2>;
> -			bias-pull-up;
> -			output-high;
> -		};
> -
> -		ts-irq-pins {
> -			pins = "gpio125";
> -			function = "gpio";
> -			drive-strength = <2>;
> -			bias-disable;
> -		};
> -
> -		ts-switch-pins {
> -			pins = "gpio135";
> -			function = "gpio";
> -			drive-strength = <2>;
> -			bias-disable;
> -			output-low;
> -		};
> -	};
> -};
> -
> -&usb_1_hsphy {
> -	vdd-supply = <&vreg_l1b_0p925>;
> -	vdda-pll-supply = <&vreg_l10a_1p8>;
> -	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
> -
> -	status = "okay";
> -};
> -
> -&usb_1 {
> -	qcom,select-utmi-as-pipe-clk;
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
> -	/* Only peripheral works for now */
> -	dr_mode = "peripheral";
> -
> -	/* Do not assume that sdm670.dtsi will never support USB 3.0 */
> -	phys = <&usb_1_hsphy>;
> -	phy-names = "usb2-phy";
> -	maximum-speed = "high-speed";
> +&rmi4_f12 {
> +	touchscreen-x-mm = <63>;
> +	touchscreen-y-mm = <127>;
>   };

-- 
David Heidelberg

