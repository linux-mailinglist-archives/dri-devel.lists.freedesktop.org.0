Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E97B059A0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BD710E5AA;
	Tue, 15 Jul 2025 12:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5E23Pc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6884E10E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:11:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F65qNi012586
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NIGACv/TQ7bqRyy/PxlnetvI
 UcYh9t4jJhtdvHTuDJE=; b=B5E23Pc1HCFS3LLj6OvBQSBZUOR4c6EY32SQlq3j
 MfFZd2iPNzvNtr5UWDWfDwIkHh2R+GjaWOa7Ht05lGxT26d8ATyYVP5kauOEajiC
 IuNOlHzt0uysHQYxLSKRFpfoaDYuSjL4BAV23GqruAUsQEATDdgOjFRPlyYGAj8e
 en2yTB2i0T0e/nuTG0ZnnX/+kyO4OnrNYLb+TctSXdG6MzWDHYECxI/XCQCnJCup
 81Iw0sVu0DX7pvCSVIp+p5HskR0kLIbS3lNjee7PguS7jZUGG0Rm7DgM5dB8Y/mf
 M5c54JeRLifbZimgU2nsKaM3XsM2j/GOHx4bUXtvqLQEkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyjy39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:11:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d44a260e45so956177885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 05:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752581514; x=1753186314;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIGACv/TQ7bqRyy/PxlnetvIUcYh9t4jJhtdvHTuDJE=;
 b=kb+XYeszb1SdApiiCJYqnj76YdryyOVk3s2DQ7eSva68/2zXpsnc0v2FeCnZbtxMOT
 MFaVBsjFoIusRacbMXpOA+NxTqmU/iPZTquL2HEhfa35k6A1id8zXcxxJ7F3kqh9ZVM7
 NjU3BSjQvuIEwGT/WMb6pRxqN74Hl1pzJOtp32i/V4PDQSlXy7xe44+wS/ak/0o9+mC6
 bhdqqhHxfF8HkXPTC5pzK8dsDGDGdM2bHEl0PM+7kXL/gakkXzz4X9mmPLGx2YggPmfe
 tCIztSBpHSHubOQgcAoNdhAcWTbZ3Q+xBZYUkYUGfeP7VcMeNNeDl8k7uHDg3J5UjZgO
 xqug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl2eV8RAcD7JDKOp1BtrYzrJVsJvWFzLrDMCmBTE6QGstM0cQMUcbc/Dqd3udfo1mp9GrQxE8BVrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpdgKK8roy4Vzpm+spjAO9QoHT45pMEA4PAVpL4+OQWdxmm9f8
 /gQKnpz3w7ZQ5pZWd8Kf2qig6u/vZivzSBNk3jdkR6ERRxuS2QgEnHAX0PtEzl8/1TA7KK711Vg
 Uqvy1u4YeZYrjAJIwsmV/JT8F8h0aRcsNPUrQsNiqJUtXaMZ1r0PuniHKEg07MM2bvng1Diw=
X-Gm-Gg: ASbGncttzRLxDsVYMLsWLvvMCfOjrH9sXUEqZVx2fup1jzM5LWqc/rP9BkKvgRBBEan
 eVIBP0bpCJwB62Da9KOEsG5IPh2OAch3JirqD59REoC31h+dZywTWV60hFoZWrSwSOGdtgmgCse
 3oGnEyCHm4cyszWUzZZgbQ20lYjWTGvP7Gy4YcRxfqG333x0d1dOHYIoKYGW9u3g8Vq6W9hcnC+
 HlvuLDwBbR0tVpBkS5VMV5FXrbkPXtgcsai7nacgnjClenF3qzjpK+DJdaleteEVBChFp6X2ptO
 Q5hfbAdrnt/tdrjY339uzWMbK2sY7oKVn7lpElowMcL/kHnNtPYIErphJpIrW9+TGbLNDoLhdrn
 JPuiO/3uj2miYf/Kv4QEprmm3xWMm5i45jLfLgoj5bh1aA5bO5fD1
X-Received: by 2002:a05:620a:4e9a:b0:7d3:a4fa:ee06 with SMTP id
 af79cd13be357-7e337b853a9mr367283685a.29.1752581514261; 
 Tue, 15 Jul 2025 05:11:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmF+y4l+jOb95aKZxJ7DfbPfnTn84DO87g2W9GzSKv0rFVZnPjZcECn3fW8CZwMFIojixCWQ==
X-Received: by 2002:a05:620a:4e9a:b0:7d3:a4fa:ee06 with SMTP id
 af79cd13be357-7e337b853a9mr367279885a.29.1752581513627; 
 Tue, 15 Jul 2025 05:11:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b736d5sm2263762e87.213.2025.07.15.05.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 05:11:52 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:11:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support
 for DisplayPort
Message-ID: <2bfaqx6unfejlqg53jaw47s6qzymdcvyiy6wuqgua43mnitzbt@5wfqp6ucxcsx>
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-6-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112456.101-6-kernel@airkyi.com>
X-Proofpoint-ORIG-GUID: OQOJTLqPJjCXxfxfL3a7beOyKZm6B20F
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6876458b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=ikJCsuYIIW8Wf-eC7T4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMSBTYWx0ZWRfXw9r8yYp3ijvZ
 IXXoFMfG/DsoFRFqLpPkr6bMIFau7bOzpQT7fLGWa/1oS8ATKCktHrCeQqyOZvz9xh+0plOrBkC
 ABlVOE1uv4itDeMvWtaj40HZUK0/X6YQLIdbPzDTLotBXkmi5V82EhUbqn9oJLktmOzw8ZBeVxs
 hKYL4d6o0CCaLkM9c8qjLyzIxnuSvKC4WXNM+0Qc+FZdDSdRiFEO0b7AzGryVBtAVwwuM8F8TM4
 1ieatL+nGy1nK7gckR2Iqcmj0yePNRnOfQ6qh3s+iv4YEH+m/DjpvBIiuaIqn7ShGnUqqjpak0K
 uwUXcwTgiZdrIge3SWZNe8sBqEN39MqgP8tC5iqMwkpv2hVZXSXmO9SbK+DehNXIRacO5KyJoSK
 DfC9DjUuU+GfEv0V1R1u84QW5gMTUxE2pHxWDh83gq/nBbSNyQGreRa35EjBCBJ445g7Krrt
X-Proofpoint-GUID: OQOJTLqPJjCXxfxfL3a7beOyKZm6B20F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150111
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

On Tue, Jul 15, 2025 at 07:24:56PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The RK3399 EVB IND board has a Type-C interface DisplayPort.
> It use fusb302 chip as Type-C controller.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  .../boot/dts/rockchip/rk3399-evb-ind.dts      | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> index 70aee1ab904c..9ceda32456a0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> @@ -4,6 +4,7 @@
>   */
>  
>  /dts-v1/;
> +#include <dt-bindings/usb/pd.h>
>  #include "rk3399.dtsi"
>  
>  / {
> @@ -19,6 +20,16 @@ chosen {
>  		stdout-path = "serial2:1500000n8";
>  	};
>  
> +	vbus_typec: vbus-typec-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc5v0_typec0_en>;
> +		regulator-name = "vbus_typec";
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
>  	vcc5v0_sys: regulator-vcc5v0-sys {
>  		compatible = "regulator-fixed";
>  		enable-active-high;
> @@ -29,6 +40,16 @@ vcc5v0_sys: regulator-vcc5v0-sys {
>  		regulator-max-microvolt = <5000000>;
>  		regulator-min-microvolt = <5000000>;
>  	};
> +
> +	sound: sound {
> +		compatible = "rockchip,rk3399-gru-sound";
> +		rockchip,cpu = <&i2s0 &spdif>;
> +	};
> +};
> +
> +&cdn_dp {
> +	status = "okay";
> +	phys = <&tcphy0_dp>;
>  };
>  
>  &cpu_b0 {
> @@ -341,6 +362,66 @@ regulator-state-mem {
>  	};
>  };
>  
> +&i2c4 {
> +	i2c-scl-rising-time-ns = <475>;
> +	i2c-scl-falling-time-ns = <26>;
> +	status = "okay";
> +
> +	usbc0: fusb302@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
> +		vbus-supply = <&vbus_typec>;
> +		status = "okay";
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +			try-power-role = "sink";
> +			op-sink-microwatt = <1000000>;
> +			sink-pdos =
> +				<PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
> +			source-pdos =
> +				<PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
> +
> +			displayport = <&cdn_dp>;
> +
> +			altmodes {
> +				displayport {
> +					svid = /bits/ 16 <0xff01>;
> +					vdo = <0xffffffff>;
> +				};
> +			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {

Which signals are described by these ports? port@0 should be used for
USB HS lines.

> +					reg = <0>;
> +
> +					usbc0_orien_sw: endpoint {
> +						remote-endpoint = <&tcphy0_orientation_switch>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					dp_mode_sw: endpoint {
> +						remote-endpoint = <&tcphy_dp_altmode_switch>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &i2s2 {
>  	status = "okay";
>  };
> @@ -354,6 +435,16 @@ &io_domains {
>  };
>  
>  &pinctrl {
> +	usb-typec {
> +		usbc0_int: usbc0-int {
> +			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
> +		vcc5v0_typec0_en: vcc5v0-typec0-en {
> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	pmic {
>  		pmic_int_l: pmic-int-l {
>  			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -400,8 +491,35 @@ &sdmmc {
>  	status = "okay";
>  };
>  
> +&sound {
> +	rockchip,codec = <&cdn_dp>;
> +	status = "okay";
> +};
> +
> +&spdif {
> +	status = "okay";
> +};
> +
>  &tcphy0 {
> +	mode-switch;
> +	orientation-switch;
>  	status = "okay";
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		tcphy0_orientation_switch: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&usbc0_orien_sw>;
> +		};
> +
> +		tcphy_dp_altmode_switch: endpoint@1 {
> +			reg = <1>;
> +			remote-endpoint = <&dp_mode_sw>;
> +		};
> +	};
> +
>  };
>  
>  &tcphy1 {
> @@ -461,6 +579,7 @@ &usb_host1_ohci {
>  };
>  
>  &usbdrd_dwc3_0 {
> +	usb-role-switch;
>  	status = "okay";
>  };
>  
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
