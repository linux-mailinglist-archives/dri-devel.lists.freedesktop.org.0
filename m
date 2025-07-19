Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D83B0AF64
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 12:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E161D10E1F6;
	Sat, 19 Jul 2025 10:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsd8+FBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2D10E1F6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:50:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56JALDZf015752
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8bWRC+nyUTbnELtrQkJApxVg
 RlBOEUvNmWuQElnY2wg=; b=hsd8+FBb47O/w+UmniIXkxeCpDvF7pKn7BFkHm0L
 jSVY0uFMYAc9Xe/AAubuo3x0atiOU+pLs8QeEiZGzvEXwsIQW9M5EzcKnIaB4z4o
 1HsAr+yidzY+1GC1JLLzuCnzHHsom3mjKXg0qNbpkJlKUH3m00jcqJC6ZxkB07/h
 rHjwaeWUnyIGfYrpGucBQue26DNN2osr01O7Juwq44hcqphZoqTR5Z38D8PlsMsz
 TPxIA4MmGX/xg8sr40c3K72dOxJ6F53bdUxnp1zv0drjwrIy5guTYqdHp3xxm3NE
 lWvWWkqx6cpbR3r1bdRMD8NXV+dHHvmtjLdJ3mWu+pjjjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045h8h22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:50:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ab76d734acso67730111cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 03:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752922252; x=1753527052;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bWRC+nyUTbnELtrQkJApxVgRlBOEUvNmWuQElnY2wg=;
 b=tiamRvdfMv0+Acvk5iuVaozLhYZxkH39H+BJN3z9mxd5ovEaBXW/gsKmado7XfkmIQ
 rwIwyL7HN/hFfvwuCXdedIukR4d3tfcM2Ycl9W+LML92Y3Rs28e78AWYmvtTvWe95t7n
 XwHBLaXc5ZiO/5VNKvrLQS+/XFZRprMtd6PlsxGvvW6V3RXF59d+2Kzxf5fceXSXscvZ
 5pcCaZifkMLOuMzFp0CBVaVw4kGLjB5w3Es2GbIxRluJXeMfFD9ASS9gsPL6mVfH2xFq
 U+8aqvV1VTPkjRmKITJK8CQLK32ZcG/iYE+u1+O0Yw42RpQMesdmS45jSU5hJt1B2z5g
 aAPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEu7r3r8ZI3hWC8B1JV7sBE9rXNr9PmzdDD4mNBSk0PovPtdxtcqqt0x8+75aYT3HHxnl+6LpQNBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiAxHAN10rukRyv/wp//B+X+wLPZilIeAPUQ1S8C0kYgasJ/0Z
 mDaW+HD/+8/qi/CeWSPkrEAScOQQHEIo9Vzt/bMGK2GJ9bjI50xmeC/wZbqqelji9IRBjUMXBDA
 +TdDDYiH9KFKG31Yj1Z5piVT2XDwEtB6s6f/W04MbSzX/+Zvz6NlXsc83rn7o1IPY5HlcnrY=
X-Gm-Gg: ASbGnctn5FAuEljvS1ZcJtA+wrlYWwb6CYnfj2lz+s/iOjrZJz3iWaGk4I+6yP9PjOE
 NWQkUEGTnWCQD7Bw9o6ARwCiVpSIQ5Y8rbgkKmqjiXeOrrLRYkF7EGcaQITGT2mOS9ZACTOpeUj
 PVBJtGicJeIlfzdDrKF/bbyWBdPZz/bWrA39MU4SrKyIjzeXt2hx3GH7631BfgM5rqRpinAQiBn
 aweiYo1KXQ7cP6FiA/IsgMm7vbaWWbsx8+nOTnH0my1w2jbwIHorvA8NKNKrwASmtUrO0Daw3J/
 /sGS79NWnoaRaR7wcpo7zIesiqRu0yaIJZw/H7WbBpbEJXawnDtLT9GE5xC4FpJf6Osz5NXV4f7
 enSluQe1X54+vzV0pKRKeyL3bMMX8MpQyxJss8nSXSQIAMiedNnDZ
X-Received: by 2002:a05:622a:4898:b0:4ab:622b:fffb with SMTP id
 d75a77b69052e-4abb078731emr123876321cf.5.1752922251478; 
 Sat, 19 Jul 2025 03:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELvC0t2DoePnMMUcCjwnNp/NwYyNzJMw/LSjDMY6XQx3gX8ifMzX4kwnCHJthxZrRbYsOq9A==
X-Received: by 2002:a05:622a:4898:b0:4ab:622b:fffb with SMTP id
 d75a77b69052e-4abb078731emr123875991cf.5.1752922250968; 
 Sat, 19 Jul 2025 03:50:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d9122fsm667474e87.152.2025.07.19.03.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 03:50:50 -0700 (PDT)
Date: Sat, 19 Jul 2025 13:50:48 +0300
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
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support
 for DisplayPort
Message-ID: <skvceiwrg77ysx74bmywp6buk6yp6dlllrwpkfea4brposrveh@2rqtawpiaikk>
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-6-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718062619.99-6-kernel@airkyi.com>
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687b788c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=ikJCsuYIIW8Wf-eC7T4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwNyBTYWx0ZWRfX43sgxYVbDqsF
 ry7I/8+Mvr0k2//oo1Uc6cBPcSYI5LMtiGI7BlmH/dgg6Zc0wyodEp5rYrZ0sAASmFwGGfuNnAu
 beuvG/XAcfs5H55A0D3XgAbIt0XRa4dUD7H7vjhklbeAFPGQZkksMwViJ1OXP+/U6PjdgRUNxNF
 tKbbllTmHZNWVY+6ff6cz1h/F2JwcPv1Jcl+2A06uJVrUNfy2pgt+aIf6XCE5QTy2ygolfXQsU5
 9wajk8g5dhr0qB4g8WGwNhzFN1nXYx7Y2cj2IwcX8lU2YtjQrwNRUl3Uu/vTnGKF67c+DVvhSaM
 xHWotsannBP4nKTv5obzj9nQ1NUUk2C6Fe8Ys/zaQj0GvDS9uYZK1S5+Sp7IKUmM8AhW/zxDbqx
 uqHWH1dRsMsfeBMrC4rO9GLWZMUz786s1Zvf1EdkXLCIqtQFaxayuGPb5H+Q4V1XS/6qlmUe
X-Proofpoint-GUID: 3WNEGnGwRyX1n8520rCJel9lBxhf7Brh
X-Proofpoint-ORIG-GUID: 3WNEGnGwRyX1n8520rCJel9lBxhf7Brh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190107
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

On Fri, Jul 18, 2025 at 02:26:19PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The RK3399 EVB IND board has a Type-C interface DisplayPort.
> It use fusb302 chip as Type-C controller.
> 
> fusb302 chip ---> USB/DP PHY0 <----> CDN-DP controller
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Add endpoint to link DP PHY and DP controller.
> - Fix devicetree coding style.
> 
>  .../boot/dts/rockchip/rk3399-evb-ind.dts      | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> index 70aee1ab904c..997b822a57ff 100644
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
> @@ -19,6 +20,21 @@ chosen {
>  		stdout-path = "serial2:1500000n8";
>  	};
>  
> +	sound: sound {
> +		compatible = "rockchip,rk3399-gru-sound";
> +		rockchip,cpu = <&i2s0 &spdif>;
> +	};
> +
> +	vbus_typec: regulator-vbus-typec {
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
> @@ -31,6 +47,11 @@ vcc5v0_sys: regulator-vcc5v0-sys {
>  	};
>  };
>  
> +&cdn_dp {
> +	phys = <&tcphy0_dp>;
> +	status = "okay";
> +};
> +
>  &cpu_b0 {
>  	cpu-supply = <&vdd_cpu_b>;
>  };
> @@ -55,6 +76,12 @@ &cpu_l3 {
>  	cpu-supply = <&vdd_cpu_l>;
>  };
>  
> +&dp_out {
> +	dp_controller_output: endpoint {
> +		remote-endpoint = <&dp_phy_in>;
> +	};
> +};
> +
>  &emmc_phy {
>  	status = "okay";
>  };
> @@ -341,6 +368,63 @@ regulator-state-mem {
>  	};
>  };
>  
> +&i2c4 {
> +	i2c-scl-rising-time-ns = <475>;
> +	i2c-scl-falling-time-ns = <26>;
> +	status = "okay";
> +
> +	usbc0: typec-portc@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
> +		vbus-supply = <&vbus_typec>;
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
> +			altmodes {
> +				displayport {
> +					svid = /bits/ 16 <0xff01>;
> +					vdo = <0xffffffff>;

I don't think that this VDO is correct. Please adjust it according to
the spec.

> +				};
> +			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
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
> @@ -354,6 +438,16 @@ &io_domains {
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
> @@ -400,10 +494,48 @@ &sdmmc {
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
>  	status = "okay";
>  };
>  
> +&tcphy0_dp {
> +	mode-switch;

But not an orientation-switch? Shouldn't it also note the SBU pins
orientation? Or DP lanes orientation?

> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		tcphy_dp_altmode_switch: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&dp_mode_sw>;
> +		};
> +
> +		dp_phy_in: endpoint@1 {
> +			reg = <1>;
> +			remote-endpoint = <&dp_controller_output>;
> +		};
> +	};
> +};
> +
> +&tcphy0_usb3 {
> +	orientation-switch;


Hmmm.

> +
> +	port {
> +		tcphy0_orientation_switch: endpoint {
> +			remote-endpoint = <&usbc0_orien_sw>;
> +		};
> +	};
> +};
> +
>  &tcphy1 {
>  	status = "okay";
>  };
> @@ -461,6 +593,7 @@ &usb_host1_ohci {
>  };
>  
>  &usbdrd_dwc3_0 {
> +	usb-role-switch;

This is an SoC-level property.

>  	status = "okay";
>  };
>  
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry
