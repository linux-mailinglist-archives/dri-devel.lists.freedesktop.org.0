Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4EBBDA72
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055AE10E3E3;
	Mon,  6 Oct 2025 10:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxSwDEyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E24810E3E5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:16:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NIKl6008732
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 10:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J7xKo6sf5t7NdPV3xuhArRC2
 khe1y/xdABGS5JQwT04=; b=YxSwDEyTZlRrodNvH1t6uC5oJH86m2/EVQwMYsfv
 n27o62Vut+x4pjB+Kun2xvYIuy24JNSP9PZC8BfZGJYhtvwQHrQqUO+FJ04dVxxq
 iOrK3gj/lOAgWi8nKMctCa6Ja95boX/yLoLxS1NMVM27nbVhl+LKHbH65PX4w3qL
 72XtUxcCeJh7vXwtTViNOch3oUWIR7SUUnX0d6wkJb+SxfgqE/TY++urd6XxxyeD
 sCxWYUE7LUCkLglzCv9gO2R8bhTuT3brYSiqisqsFVsCCx7XT/OolT3szJstyIxq
 bjSzNRGGm1KH1Q9QY3BFWiTaQkmXNKlo2qV1OGowNheDDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhkd1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:16:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e5739a388bso102168681cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 03:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745810; x=1760350610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7xKo6sf5t7NdPV3xuhArRC2khe1y/xdABGS5JQwT04=;
 b=WlLX9OcLgbg6f0BJHfSvIcAFc7veCt50ptu2RlgknjI36oO6aHfxlNAe2ZWjQOB/Pb
 xknTJ6+UBHfedAhkXg8WFaQiaeOL6GLbsX4rzF/3wPhXSRZ1fxzBhjvgM+/TtMplpzfW
 0stwDK1UabdA5WtV5V4Os2NetV6gEdLpxCAGmRc2fRTcGBkOdvBUebVaXDXL+rxUmYkB
 2LM1z9nyT6HD3ppQoN2m7hUVCmjC093oQ6zTj6Y2WIXhYuZzEeOTMPFmC1IumCa863vG
 hue/RQq98wzFXD9NCTPh86CgMj/p6vmnbT64hx3jLX/xSGxffRWSU5oztBPxmOHj/cYL
 7CGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu0cyJstN2bljLUNLQZcFfozc3+jyummI80C3+uD/1MKcNDp/Z5/QcZm99yMLelEoadrgLgvdoWzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5A5Efxr97LWfXRuyKzmSqiK/VtHOxUg5BHGhlGIF9a97stc64
 1qwKtytNSxh4n5z09E/7ce9uvlVU51WGbu2YKPWWyJdY/UqDgosNx0D1D5+3MIPYiy5Ft3Syh40
 NauYkZMthl4fgEDnDbuDjKj2X31Z8rDwsP9T/sb/xYFxJiaVyLQOLOMAwOVT52/JKwmz90ks=
X-Gm-Gg: ASbGncsq61NtN6FB1nTwS3A+S6qsCY1NNgycJ3I9oAvXWR0SSD0lW+DHRakzZC/b7kV
 WXMVZgoX8zP2am+bp6OSpe/qkHDFLfiSlgI0ET9Ke17O7EVObdFVvXQKMGEceEr5g3Va4DOlLKb
 D5joYXf9gRwuvmoD0sldQEEHp0It9DidID2FBBhMl9puFtkuA19WVRL1TCTw5pslBixaYUK4C4w
 Ec6naLoSs2JwWEI3pl4TZtvLz8nm92KEvtOF9rbc3wp3xhHzMUbVPsQOAQLXDvInVv0DDlTQWxX
 L7PFzdodo8ilH9gaIE6jKexQGyJJEGv9ZXnRRVwMfg8TcaK8WqFrI4GoiCfAmG2UsGGvdeC5ylv
 AHhiDmozvgAq7Mb0l85zAeeRLxIri1Jv3LWViA2sO/cB/1y5IP8j9tGX0uA==
X-Received: by 2002:a05:622a:2cf:b0:4db:e7be:b40b with SMTP id
 d75a77b69052e-4e576a7bb1emr149923571cf.23.1759745809583; 
 Mon, 06 Oct 2025 03:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdVkkz0Bvskg+SlQ4eiYj13Kfc4CHPGeJdiuBJRRdTSxJrU6Luy1zywIhFRnGiP29t5s4x8g==
X-Received: by 2002:a05:622a:2cf:b0:4db:e7be:b40b with SMTP id
 d75a77b69052e-4e576a7bb1emr149923121cf.23.1759745809020; 
 Mon, 06 Oct 2025 03:16:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d863sm4893943e87.70.2025.10.06.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:16:48 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:16:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI
 to DP bridge node
Message-ID: <vj3pwikzgbflzwqwkbvdfac44llinsmrhrqnvu6gx756xz4h3e@2lspa6zx5xgr>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-8-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-8-quic_amakhija@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfX9+7oOHp87cl8
 bDzlkLvi230HB1As4augxA9TEobkpNcWjeC3aafMCdI/JCcNdF/QeeiCuYNS413hirIDhkfNqZ6
 rXFCl13Ojui2kV9JqsiBhmZ+l8J/wbcMnF2XuDZAmnayqtlXmw3/HJrBwDZVWA/oZ6D8wpOowyy
 +M/ZUlcKkqMmaQ7BYJKtSX5CZqzCHnwNNbBfKxo+Rapmv1GrwEfi9FLvNRhgROuO9cuM0FLw3cW
 KfU17m8QoxfDquQhJ3kXmSGe3jsnTlXQ7IHhhf8+qSsHnbhU7XBNExxjPLPYdW+BOwLL2OeOhH1
 uWGs2Blt1ei1nTtpN8ng8g3pyjeGn+IA/iSmUbLtd6IUz2Aa4/xtxb2o4rgeYJzfLfApR3xxyZ0
 A1KTldRieUIOnVzgKE/Lz6trEGBSog==
X-Proofpoint-GUID: bjm7bBb4hl_s9hvA2dc4qYk7EGsroZiK
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e39713 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0vFitCv-P-mLjvDJNjQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bjm7bBb4hl_s9hvA2dc4qYk7EGsroZiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036
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

On Mon, Oct 06, 2025 at 07:09:24AM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 891e49602c97..5d4040376857 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -24,6 +24,64 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vreg_12p0: vreg-12p0-regulator {

Why are these nodes not in a correct place? Also, why are they named
differently from all other regulators in this board file?

> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_12P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
> +	vreg_5p0: vreg-5p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_5P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		vin-supply = <&vreg_12p0>;
> +	};
> +
> +	vreg_1p8: vreg-1p8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P8";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		vin-supply = <&vreg_5p0>;
> +	};
> +
> +	vreg_1p0: vreg-1p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1000000>;
> +		regulator-max-microvolt = <1000000>;
> +
> +		vin-supply = <&vreg_1p8>;
> +	};
> +
> +	vreg_3p0: vreg-3p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_3P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +
> +		vin-supply = <&vreg_12p0>;
> +	};
> +
>  	dp0-connector {
>  		compatible = "dp-connector";
>  		label = "DP0";
> @@ -36,6 +94,18 @@ dp0_connector_in: endpoint {
>  		};
>  	};
>  
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge_out>;
> +			};
> +		};
> +	};
> +
>  	regulator-usb2-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "USB2_VBUS";
> @@ -316,6 +386,70 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcs8300/a623_zap.mbn";
>  };
>  
> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 93 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		reset-gpios = <&tlmm 66 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&io_expander_intr_active>,
> +			    <&io_expander_reset_active>;
> +		pinctrl-names = "default";
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9543";
> +		#address-cells = <1>;
> +
> +		#size-cells = <0>;
> +		reg = <0x70>;

compatible
reg

#address-cells
#size-cells


> +

-- 
With best wishes
Dmitry
