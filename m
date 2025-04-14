Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA3A87C8C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 11:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEAD10E539;
	Mon, 14 Apr 2025 09:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZHx+w8bl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71F510E50C;
 Mon, 14 Apr 2025 09:57:08 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qRt011398;
 Mon, 14 Apr 2025 09:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4VHC8WYpl+uLggBA75zLhVV+Fe7u1dbbrYvZ0DxrmwE=; b=ZHx+w8blJmgNpPdx
 ZuI3JHLeJJ0EpXJT9Ql1p0pzljSctU6IqOmkcWjmvFvL0DaVexXTM/08XA6ySM5o
 6HG3jxqUIinw+R9LFxJfIsiQrc6OmW+heO8sB77+Eromy1i4v2bJAxWJW4Cj3HcN
 ckbQYSU2r7BMkKd1v9pl7YtuUXV+rZyJOQ+qUCczugtsY0L7a2Jyut58Rn9W1iak
 YOvRUtKSc2/iq+enK+jjyQ2ovoYtw+BRn+CV2q3pHfbEXVRnMjPWtyLHX5uAjr1J
 clJV25yfr36AJRivRDT+/vO9tbJnVIsqHzlZ3R7bvHJGzJYP++Ji7hubdSa4xfWk
 b4V8Iw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wc2u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Apr 2025 09:56:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E9ur1R006022
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Apr 2025 09:56:53 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 02:56:46 -0700
Message-ID: <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Date: Mon, 14 Apr 2025 15:26:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <robdclark@gmail.com>, <dmitry.baryshkov@linaro.org>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <quic_abhinavk@quicinc.com>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
 <quic_jesszhan@quicinc.com>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
 <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
 <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
 <wzqct2y67h6bkazxv3se77slsheaw5rspgcrcfjm7ngr5t4alw@nktpqrt5woky>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <wzqct2y67h6bkazxv3se77slsheaw5rspgcrcfjm7ngr5t4alw@nktpqrt5woky>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fcdbe7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=8v7svmj6aq3A3Q3kazgA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8Z-j7vyNj4iUSOfE710VIG7ZGQwXoleI
X-Proofpoint-GUID: 8Z-j7vyNj4iUSOfE710VIG7ZGQwXoleI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140072
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

Hi Dmitry,

On 4/11/2025 1:31 AM, Dmitry Baryshkov wrote:
> On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
>> Hi Dmirity/Konard
>>
>> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
>>>> Add anx7625 DSI to DP bridge device nodes.
>>>>
>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>>>>  1 file changed, 207 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>> index 175f8b1e3b2d..8e784ccf4138 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>> @@ -28,6 +28,13 @@ chosen {
>>>>  		stdout-path = "serial0:115200n8";
>>>>  	};
>>>>  
>>>> +	vph_pwr: vph-pwr-regulator {
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "vph_pwr";
>>>> +		regulator-always-on;
>>>> +		regulator-boot-on;
>>>> +	};
>>>> +
>>>>  	vreg_conn_1p8: vreg_conn_1p8 {
>>>>  		compatible = "regulator-fixed";
>>>>  		regulator-name = "vreg_conn_1p8";
>>>> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>>>>  			};
>>>>  		};
>>>>  	};
>>>> +
>>>> +	dp-dsi0-connector {
>>>> +		compatible = "dp-connector";
>>>> +		label = "DSI0";
>>>> +		type = "full-size";
>>>> +
>>>> +		port {
>>>> +			dp_dsi0_connector_in: endpoint {
>>>> +				remote-endpoint = <&dsi2dp_bridge0_out>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +
>>>> +	dp-dsi1-connector {
>>>> +		compatible = "dp-connector";
>>>> +		label = "DSI1";
>>>> +		type = "full-size";
>>>> +
>>>> +		port {
>>>> +			dp_dsi1_connector_in: endpoint {
>>>> +				remote-endpoint = <&dsi2dp_bridge1_out>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>>  };
>>>>  
>>>>  &apps_rsc {
>>>> @@ -517,9 +548,135 @@ &i2c11 {
>>>>  
>>>>  &i2c18 {
>>>>  	clock-frequency = <400000>;
>>>> -	pinctrl-0 = <&qup_i2c18_default>;
>>>> +	pinctrl-0 = <&qup_i2c18_default>,
>>>> +		    <&io_expander_intr_active>,
>>>> +		    <&io_expander_reset_active>;
>>>
>>> These pinctrl entries should go to the IO expander itself.
>>>
>>>>  	pinctrl-names = "default";
>>>> +
>>>>  	status = "okay";
>>>> +
>>>> +	io_expander: gpio@74 {
>>>> +		compatible = "ti,tca9539";
>>>> +		reg = <0x74>;
>>>> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>> +		gpio-controller;
>>>> +		#gpio-cells = <2>;
>>>> +		interrupt-controller;
>>>> +		#interrupt-cells = <2>;
>>>> +
>>>> +		gpio2-hog {
>>>
>>> This needs a huuge explanation in the commit message. Otherwise I'd say
>>> these pins should likely be used by the corresponding anx bridges.
>>
>> Thanks, for the review.
>>
>> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
>> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
>> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
>> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.
> 
> Please make sure that there are pinctrl entries for all pins.
> 

Thanks, for the review.

While declaring the pinctrl entries inside the io_expander node, I am getting below error while checking the DTBS check against DT-binding.

Error : /local/mnt/workspace/amakhija/linux_next_11042025/linux/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: gpio@74: 'dsi0-int-pin-state', 'dsi1-int-pin-state' do not match any of the regexes:
        '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+' from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#

        io_expander: gpio@74 {
                compatible = "ti,tca9539";
                reg = <0x74>;
                interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
                gpio-controller;
                #gpio-cells = <2>;
                interrupt-controller;
                #interrupt-cells = <2>;

                pinctrl-0 = <&io_expander_intr_active>,
                            <&io_expander_reset_active>;
                pinctrl-names = "default";

                dsi0_int_pin: dsi0-int-pin-state {
                        pins = "gpio2";
                        input-enable;
                        bias-disable;
                };

                dsi1_int_pin: dsi1-int-pin-state {
                        pins = "gpio10";
                        input-enable;
                        bias-disable;
                };

        };

I couldn't find any devicetree example of tca9539 which is using pinctrl. The gpio-pca95xx.yaml DT binding does not match with any regex of the patterns properties.

Thanks,
Ayushi
