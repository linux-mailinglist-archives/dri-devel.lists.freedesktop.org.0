Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D5578D63
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 00:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA671127E7;
	Mon, 18 Jul 2022 22:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94D41127E7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 22:13:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id m9so12666294ljp.9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 15:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a33Qw4o2GwiupPnD3JLXL5y0DKLG1ElEVAAgwe0B5Bo=;
 b=ao0wowMsVpLPxy3ybBR+HAH3Q6OYlCisAE8fvCweQhGE70BNOfO/n4E8fl3TdXrvBF
 3VJutmdZUvV/Q4ZJXhbKCDifMZBv7vP2EpaGs0DU3L/NzuRrMv8d7Hgp3S+aDgtqRcZr
 yJlOuJ0E9gpYwNFfHvLRYGNXhEE+UAI8VDBNIJLdf4JcmiR9iAfBI1/wjElO1DXRkEE2
 6Ysz00ioL00RfVGtsXZQuWlUhYk+zJIx0OgRVqnJ5JJej1YsKnFWGaPFh4e3Oz0bUyiF
 j5B/JexALOH7jczOSSBFM7GXuKRZ6GbBzYBcldg0C/5MPnGHSy6RmIgNquqt14sdFkgW
 Oeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a33Qw4o2GwiupPnD3JLXL5y0DKLG1ElEVAAgwe0B5Bo=;
 b=u9dHdv4LyLRklgEN7agy5ZKj/4XswXQ4tzDteaB5OwZlpINFRqTIy3YdaqjEivV7dd
 jSBNRLbR0E73zGQdXhHSAWlGeIBlgo0vi/QaQ7vCz7fSv+NuUZurmJOMRbCduL9dCRuV
 yZSpN2anC2EYMfrhsTUAYye11K0NTmsl55n7A9lHIkYZ5DT0gavIa5SVAKCZhkqgB8iX
 4kdC9b3A6Wbu0lNUTVzh4yD/mPl+A4yUkSWuwttv1ubvuGtzZibmFcq1yH2siiZuwsmQ
 xxjY+YEY0saMI9nqbFKyiwfypzsdxpJkeW2rtPd13IjjrQKYQEZxwHEvoXh3W9mKZYxk
 EyEA==
X-Gm-Message-State: AJIora/3i+RH2i/ozcbe4OVBIHmgl7/oGZjcezPpyURLs88XNyfuhiDS
 aQ62cslyJsQi4ebp1E4fp/RRYclZsvFEpQ==
X-Google-Smtp-Source: AGRyM1sAc32xiETAC4EkGghttf/KuN3+IrhF59X4Km0ADF/Ex7Y45lggmThZeLwkUM11zMyP296KUw==
X-Received: by 2002:a05:651c:204a:b0:25d:4ef0:80a9 with SMTP id
 t10-20020a05651c204a00b0025d4ef080a9mr13875280ljo.319.1658182419767; 
 Mon, 18 Jul 2022 15:13:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05651234d000b00485caa0f5dfsm2847754lfr.44.2022.07.18.15.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 15:13:39 -0700 (PDT)
Message-ID: <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org>
Date: Tue, 19 Jul 2022 01:13:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: add sdm845-google-blueline (Pixel 3)
Content-Language: en-GB
To: Caleb Connolly <caleb@connolly.tech>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Kalle Valo <kvalo@kernel.org>
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-3-caleb@connolly.tech>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220718213051.1475108-3-caleb@connolly.tech>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2022 00:30, Caleb Connolly wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> This adds an initial dts for the Blueline (Pixel 3). Supported
> functionality includes display, Debug UART, UFS, USB-C (peripheral), WiFi,
> Bluetooth and modem.
> 
> Bootloader compatible board and msm IDs are needed for the kernel to boot
> with Pixel3 bootloader, so those are added.
> 
> GPIOs 0 through 3 and 81 through 84 are configured to not be accessible
> from the application CPUs, so we mark them as reserved to allow the Pixel 3
> to boot.
> 
> The reserved-memory locations where obtained from downstream using
> kernel logs:
> https://gist.github.com/calebccff/090d10bfac3cb9e9bd98dda30b054c96
> 
> The rmtfs region is allocated with UIO, making it technically "dynamic".
> It's address and size can be read from sysfs:
> 
> blueline:/ # cat /sys/class/uio/uio0/name
> rmtfs
> at /sys/class/uio/uio0/maps/map0/addr
> 0x00000000f2701000
> blueline:/ # cat /sys/class/uio/uio0/maps/map0/size
> 0x0000000000200000
> 
> Like the OnePlus 6, it needs 1kB reserved on either side of the rmtfs
> memory to workaround some XPU bug which would otherwise cause erroneous
> XPU violations when accessing the rmtfs_mem region.
> 
> For wifi, the pixel 3 reports a board-id of 0xFF, and downstream
> only includes a single bdwlan file. The qcom,ath10k-calibration-variant
> property is set to ensure that the correct calibration data is used.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [AmitP: Cherry-picked and refactored from Bjorn's db845c dts
>          ("arm64: dts: qcom: Add Dragonboard 845c") https://lkml.org/lkml/2019/6/6/7]
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> [sumits: merged commits to add board and msm ids, gpio range reservation,
>    ufs device-reset gpio and adaptation to v5.5+ changes]
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> [vinod: Add display nodes]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> [caleb: remove db845c bits, cleanup, add reserved-memory for modem/wifi]
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

Thanks for your patch, few minor items to improve.

> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   .../boot/dts/qcom/sdm845-google-blueline.dts  | 652 ++++++++++++++++++
>   2 files changed, 653 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 2f8aec2cc6db..c151e17e6eb7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -100,6 +100,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> new file mode 100644
> index 000000000000..dec979ad9209
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -0,0 +1,652 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sdm845.dtsi"
> +#include "pm8998.dtsi"
> +#include "pmi8998.dtsi"
> +
> +/delete-node/ &mpss_region;
> +/delete-node/ &venus_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &mba_region;
> +/delete-node/ &slpi_mem;
> +/delete-node/ &spss_mem;
> +/delete-node/ &rmtfs_mem;
> +
> +/ {
> +	model = "Google Pixel 3";
> +	compatible = "google,blueline", "qcom,sdm845";
> +	qcom,board-id = <0x00021505 0>;
> +	qcom,msm-id = <321 0x20001>;
> +
> +	aliases {
> +		serial0 = &uart9;
> +		serial1 = &uart6;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	volume-keys {
> +		compatible = "gpio-keys";
> +		label = "Volume keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&volume_up_gpio>;
> +
> +		vol-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

These properties are already part of the sdm845.dtsi, so no need to have 
them here.

> +
> +		mpss_region: memory@8e000000 {
> +			reg = <0 0x8e000000 0 0x9800000>;
> +			no-map;
> +		};
> +
> +		venus_mem: venus@97800000 {
> +			reg = <0 0x97800000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp-mem@97D00000 {
> +			reg = <0 0x97D00000 0 0x800000>;
> +			no-map;
> +		};
> +
> +		mba_region: mba@98500000 {
> +			reg = <0 0x98500000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: slpi@98700000 {
> +			reg = <0 0x98700000 0 0x1400000>;
> +			no-map;
> +		};
> +
> +		spss_mem: spss@99B00000 {
> +			reg = <0 0x99B00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		/* rmtfs lower guard */
> +		memory@f2700000 {
> +			reg = <0 0xf2700000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@f2701000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xf2701000 0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
> +		/* rmtfs upper guard */
> +		memory@f2901000 {
> +			reg = <0 0xf2901000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vreg_s4a_1p8: vreg-s4a-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&adsp_pas {
> +	status = "okay";
> +
> +	firmware-name = "qcom/sdm845/pixel3/adsp.mbn";

What about using "qcom/sdm845/blueline/adsp.mbn" instead?

Bjorn, Amit?

> +};
> +
> +&apps_rsc {
> +	pm8998-rpmh-regulators {
> +		compatible = "qcom,pm8998-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-s9-supply = <&vph_pwr>;
> +		vdd-s10-supply = <&vph_pwr>;
> +		vdd-s11-supply = <&vph_pwr>;
> +		vdd-s12-supply = <&vph_pwr>;
> +		vdd-s13-supply = <&vph_pwr>;
> +		vdd-l1-l27-supply = <&vreg_s7a_1p025>;
> +		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
> +		vdd-l3-l11-supply = <&vreg_s7a_1p025>;
> +		vdd-l4-l5-supply = <&vreg_s7a_1p025>;
> +		vdd-l6-supply = <&vph_pwr>;
> +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> +		vdd-l9-supply = <&vreg_bob>;
> +		vdd-l10-l23-l25-supply = <&vreg_bob>;
> +		vdd-l13-l19-l21-supply = <&vreg_bob>;
> +		vdd-l16-l28-supply = <&vreg_bob>;
> +		vdd-l18-l22-supply = <&vreg_bob>;
> +		vdd-l20-l24-supply = <&vreg_bob>;
> +		vdd-l26-supply = <&vreg_s3a_1p35>;
> +		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
> +
> +		vreg_s3a_1p35: smps3 {
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +		};
> +
> +		vreg_s5a_2p04: smps5 {
> +			regulator-min-microvolt = <1904000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +
> +		vreg_s7a_1p025: smps7 {
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <1028000>;
> +		};
> +
> +		vdda_mipi_dsi0_pll:

Do we need this alias?

> +		vreg_l1a_0p875: ldo1 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_l5a_0p8: ldo5 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12a_1p8: ldo12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a_1p8: ldo7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a_2p95: ldo13 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14a_1p88: ldo14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */

Any idea, what is the issue here? Do you have the datasheet for the panel?

> +			regulator-always-on;
> +		};
> +
> +		vreg_l17a_1p3: ldo17 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l19a_3p3: ldo19 {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3312000>;
> +			qcom,init-voltage = <3300000>;
> +			qcom,initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			/*
> +			 * The touchscreen needs this to be 3.3v, which is apparently
> +			 * quite close to the hardware limit for this LDO (3.312v)
> +			 * It must be kept in high power mode to prevent TS brownouts
> +			 */
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l20a_2p95: ldo20 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2968000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l21a_2p95: ldo21 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2968000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l24a_3p075: ldo24 {
> +			regulator-min-microvolt = <3088000>;
> +			regulator-max-microvolt = <3088000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l25a_3p3: ldo25 {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdda_mipi_dsi0_1p2:

Do we need this alias?

> +		vreg_l26a_1p2: ldo26 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_l28a_3p0: ldo28 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;
> +		};
> +	};
> +
> +	pmi8998-rpmh-regulators {
> +		compatible = "qcom,pmi8998-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3600000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-bypass;
> +		};
> +	};
> +
> +	pm8005-rpmh-regulators {
> +		compatible = "qcom,pm8005-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +
> +		vreg_s3c_0p6: smps3 {
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <600000>;
> +		};
> +	};
> +};
> +
> +&cdsp_pas {
> +	status = "okay";
> +	firmware-name = "qcom/sdm845/pixel3/cdsp.mbn";
> +};
> +
> +&dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lg_sw43408_in_0>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +
> +	panel@0 {
> +		compatible = "lg,sw43408";
> +		reg = <0>;
> +
> +		vddi-supply = <&vreg_l14a_1p88>;
> +		vpnl-supply = <&vreg_l28a_3p0>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_pmgpio_pins>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lg_sw43408_in_0: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&dsi0_out {
> +	remote-endpoint = <&lg_sw43408_in_0>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +};
> +
> +&gcc {
> +	protected-clocks = <GCC_QSPI_CORE_CLK>,
> +			   <GCC_QSPI_CORE_CLK_SRC>,
> +			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sdm845/pixel3/a630_zap.mbn";
> +	};
> +};
> +
> +&ipa {
> +	status = "okay";
> +
> +	firmware-name = "qcom/sdm845/pixel3/ipa_fws.mbn";
> +};
> +
> +&mss_pil {
> +	status = "okay";
> +	firmware-name = "qcom/sdm845/pixel3/mba.mbn", "qcom/sdm845/pixel3/modem.mbn";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};

Not necessary, it is a default state since the commit 4a5622c1d975 
("arm64: dts: qcom: sdm845: Don't disable MDP explicitly")

> +
> +&pm8998_gpio {
> +	volume_up_gpio: vol-up-active {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		qcom,drive-strength = <0>;
> +	};
> +
> +	panel_pmgpio_pins: panel-pmgpio-active {
> +		pins = "gpio2", "gpio5";
> +		function = "normal";
> +		input-enable;
> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&pm8998_pon {
> +	resin {
> +		compatible = "qcom,pm8941-resin";
> +		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +		debounce = <15625>;
> +		bias-pull-up;
> +		linux,code = <KEY_VOLUMEDOWN>;
> +	};

Please move the (disabled, labelled) resin device to pm8998.dtsi and 
just add status = "okay" here.

> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&qup_uart6_default {
> +	pinmux {
> +		pins = "gpio45", "gpio46", "gpio47", "gpio48";
> +		function = "qup6";
> +	};
> +
> +	cts {
> +		pins = "gpio45";
> +		bias-disable;
> +	};
> +
> +	rts-tx {
> +		pins = "gpio46", "gpio47";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rx {
> +		pins = "gpio48";
> +		bias-pull-up;
> +	};
> +};
> +
> +&qup_uart9_default {
> +	pinconf-tx {
> +		pins = "gpio4";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	pinconf-rx {
> +		pins = "gpio5";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;
> +
> +	panel_te_pin: panel-te {
> +		mux {
> +			pins = "gpio12";
> +			function = "mdp_vsync";
> +			drive-strength = <2>;
> +			bias-disable;
> +			input-enable;
> +		};
> +	};
> +
> +	panel_reset_pins: panel-active {
> +		mux {
> +			pins = "gpio6", "gpio52";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-disable = <0>;
> +		};
> +	};
> +
> +	panel_suspend: panel-suspend {
> +		mux {
> +			pins = "gpio6", "gpio52";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +
> +	touchscreen_reset: ts-reset {
> +		mux {
> +			pins = "gpio99";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +			//output-high;

debug, can be removed?

> +		};
> +	};
> +
> +	touchscreen_pins: ts-pins {
> +		mux {
> +			pins = "gpio125";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
> +	touchscreen_i2c_pins: qup-i2c2-gpio {
> +		pins = "gpio27", "gpio28";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
> +&uart6 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		vddxo-supply = <&vreg_l7a_1p8>;
> +		vddrf-supply = <&vreg_l17a_1p3>;
> +		vddch0-supply = <&vreg_l25a_3p3>;
> +		max-speed = <3200000>;
> +	};
> +};
> +
> +&uart9 {
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	status = "okay";
> +
> +	vdd-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +
> +	qcom,imp-res-offset-value = <8>;
> +	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> +	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +};
> +
> +&usb_1_qmpphy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l26a_1p2>;
> +	vdda-pll-supply = <&vreg_l1a_0p875>;
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_2_hsphy {
> +	status = "okay";
> +
> +	vdd-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +
> +	qcom,imp-res-offset-value = <8>;
> +	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_22_8_MA>;
> +};
> +
> +&usb_2_qmpphy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l26a_1p2>;
> +	vdda-pll-supply = <&vreg_l1a_0p875>;
> +};
> +
> +&ufs_mem_hc {
> +	status = "okay";
> +
> +	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l20a_2p95>;
> +	vcc-max-microamp = <800000>;
> +};
> +
> +&ufs_mem_phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +};
> +
> +&venus {
> +	status = "okay";
> +	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";

Why are you using the oneplus6 here?

> +};
> +
> +&wifi {
> +	status = "okay";
> +
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +
> +	qcom,snoc-host-cap-8bit-quirk;
> +	qcom,ath10k-calibration-variant = "google_blueline";

Ideally Kalle Valo should bless this string, added him to the Cc list. 
Could you please submit the board file to the ath10k (see [1] for the 
description and [2] for an example).


[1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles
[2] 
https://lore.kernel.org/ath10k/CAA8EJpphUrxr5gtW0=-tZh-DrKXmHkfFxWMvYRpTUGuCesGCbw@mail.gmail.com/T/#u

> +};


-- 
With best wishes
Dmitry
