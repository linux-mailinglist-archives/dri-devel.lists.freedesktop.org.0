Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7786B16D5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 00:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B648410E767;
	Wed,  8 Mar 2023 23:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EDA10E763;
 Wed,  8 Mar 2023 23:51:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328NWTbT010355; Wed, 8 Mar 2023 23:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Xz2v2TUnrNJfeVYw1yXS8iBzdIAGzd4ugE5Thj5v+/8=;
 b=HDjI51TMQXvVWZCJQlfXO0IkwflqXVIEmyf4/Y4RMegoYtqlYVuDIwB129Ba2WgcpgUx
 1vCxmdQpLp7QLlSmMFKp2rzyyZNBbtBdrUboWbeNcq8813WUehWhmofAjSwCdRxnGLyi
 ukIrs2arLG/ArFN83H2g+T9AT1voedDassndYLHBK3Afm8J4RSyYyp949Az8X4otCl9C
 QNzdYQuV7IhWPIdshPWaXtcHOf8ndK5P1EX5Zf8BPvAKX5IYGuclUiAvNa2+fVhGi1w8
 ytt8/RL7F/6kCTgUz6GTK3JFSJU1F2o4da2OTM6QrLASwvkAvcpqtod17llxB0Hy6VNM jA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6fetu5jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 23:51:05 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 328Np4oc008134
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Mar 2023 23:51:04 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 8 Mar 2023
 15:51:02 -0800
Message-ID: <ebc47ba2-4509-7b8a-b2aa-492f38a7dd89@quicinc.com>
Date: Wed, 8 Mar 2023 15:51:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, <robdclark@gmail.com>,
 <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
 <sean@poorly.run>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <agross@kernel.org>, <andersson@kernel.org>,
 <konrad.dybcio@somainline.org>,
 <angelogioacchino.delregno@somainline.org>, <loic.poulain@linaro.org>,
 <vkoul@kernel.org>, <a39.skl@gmail.com>, <quic_khsieh@quicinc.com>,
 <quic_vpolimer@quicinc.com>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <liushixin2@huawei.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 <vinod.koul@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-12-robert.foss@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20221230153554.105856-12-robert.foss@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: C4NhzUYjXzjOVtrmJTGZUU8JjvJHDuzN
X-Proofpoint-ORIG-GUID: C4NhzUYjXzjOVtrmJTGZUU8JjvJHDuzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080200
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



On 12/30/2022 7:35 AM, Robert Foss wrote:
> The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> 
> In order to toggle the board to enable the HDMI output,
> switch #7 & #8 on the rightmost multi-switch package have
> to be toggled to On.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> #SM8350 (HDK)

> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 105 ++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 1961f941ff83..6b21897c92dc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -20,6 +20,17 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
>   	vph_pwr: vph-pwr-regulator {
>   		compatible = "regulator-fixed";
>   		regulator-name = "vph_pwr";
> @@ -29,6 +40,31 @@ vph_pwr: vph-pwr-regulator {
>   		regulator-always-on;
>   		regulator-boot-on;
>   	};
> +
> +	lt9611_1v2: lt9611-1v2-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";
> +
> +		vin-supply = <&vph_pwr>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
> +	lt9611_3v3: lt9611-3v3-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_3V3";
> +
> +		vin-supply = <&vreg_bob>;
> +		gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>   };
>   
>   &adsp {
> @@ -220,6 +256,15 @@ &dispcc {
>   &mdss_dsi0 {
>   	vdda-supply = <&vreg_l6b_1p2>;
>   	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
>   };
>   
>   &mdss_dsi0_phy  {
> @@ -231,6 +276,46 @@ &gpi_dma1 {
>   	status = "okay";
>   };
>   
> +&i2c15 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +
> +		interrupts-extended = <&tlmm 50 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_state>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>   &mdss {
>   	status = "okay";
>   };
> @@ -248,6 +333,10 @@ &qupv3_id_0 {
>   	status = "okay";
>   };
>   
> +&qupv3_id_2 {
> +	status = "okay";
> +};
> +
>   &slpi {
>   	status = "okay";
>   	firmware-name = "qcom/sm8350/slpi.mbn";
> @@ -544,4 +633,20 @@ usb_hub_enabled_state: usb-hub-enabled-state {
>   		drive-strength = <2>;
>   		output-low;
>   	};
> +
> +	lt9611_state: lt9611-state {
> +		rst {
> +			pins = "gpio48";
> +			function = "normal";
> +
> +			output-high;
> +			input-disable;
> +		};
> +
> +		irq {
> +			pins = "gpio50";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +	};
>   };
> -- 
> 2.34.1
> 
