Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39312A898AF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D4910E6BD;
	Tue, 15 Apr 2025 09:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MLiGagr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1004010E6BD;
 Tue, 15 Apr 2025 09:53:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCuO025061;
 Tue, 15 Apr 2025 09:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u7ktH7RchoLSd4+j3e7VfuxneDgbBb4+i1jD70cLUZM=; b=MLiGagr9Wg60UcUh
 QLlqWWMS0Cf4qO+23XARBWk2ZMiqmkzdxOiudf3cELMTTtsOq56gH1144kAwruWR
 osHCjzR71VvAFr21J2X3vqaEbXH2LS4Xmic9M1DYCj2eWRM0M14+a7q9dvHWh6Fw
 dPlWMzf9WKphAm83PzR5NtTYZ4fmNlPSilA8DuqpGlT4sLKyOqg0bkJcjscYJHOz
 bWaFpaC79HuBKXxjeFzdg3rwBR0YvH/2IQGwq7ZolIAvFVOd0to+q9M8jt9mPM2X
 t+u/D8nZpDlW5DfeRN+d0Bk8ok/zMOQo/gSI9PlwhCb9T9nmthOWteID1S2ltRW2
 09Qylg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wfju0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Apr 2025 09:52:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53F9qoRG019542
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Apr 2025 09:52:50 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Apr
 2025 02:52:43 -0700
Message-ID: <e291fe72-bec0-48b9-9384-7d1d9469a8e7@quicinc.com>
Date: Tue, 15 Apr 2025 15:22:40 +0530
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
 <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
 <7b876428-6f54-4c40-a234-57443eb97ecb@oss.qualcomm.com>
 <a2b44f41-bb54-4d88-bba0-f5b86b8186b5@quicinc.com>
 <ebfbc145-eb8f-4354-b6b6-ad7ecec5856b@oss.qualcomm.com>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <ebfbc145-eb8f-4354-b6b6-ad7ecec5856b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe2c73 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=-Qs8Zf1C4SQ5IM_3ssQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4eRD5Ev1FvMZWzWep9voiF4hm-LYudRw
X-Proofpoint-GUID: 4eRD5Ev1FvMZWzWep9voiF4hm-LYudRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150069
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

On 4/15/2025 3:00 PM, Dmitry Baryshkov wrote:
> On 14/04/2025 16:54, Ayushi Makhija wrote:
>> On 4/14/2025 3:37 PM, Dmitry Baryshkov wrote:
>>> On 14/04/2025 12:56, Ayushi Makhija wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 4/11/2025 1:31 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
>>>>>> Hi Dmirity/Konard
>>>>>>
>>>>>> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
>>>>>>>> Add anx7625 DSI to DP bridge device nodes.
>>>>>>>>
>>>>>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>>>>>> ---
>>>>>>>>    arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>>>>>>>>    1 file changed, 207 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>>>>> index 175f8b1e3b2d..8e784ccf4138 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>>>>> @@ -28,6 +28,13 @@ chosen {
>>>>>>>>            stdout-path = "serial0:115200n8";
>>>>>>>>        };
>>>>>>>>    +    vph_pwr: vph-pwr-regulator {
>>>>>>>> +        compatible = "regulator-fixed";
>>>>>>>> +        regulator-name = "vph_pwr";
>>>>>>>> +        regulator-always-on;
>>>>>>>> +        regulator-boot-on;
>>>>>>>> +    };
>>>>>>>> +
>>>>>>>>        vreg_conn_1p8: vreg_conn_1p8 {
>>>>>>>>            compatible = "regulator-fixed";
>>>>>>>>            regulator-name = "vreg_conn_1p8";
>>>>>>>> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>>>>>>>>                };
>>>>>>>>            };
>>>>>>>>        };
>>>>>>>> +
>>>>>>>> +    dp-dsi0-connector {
>>>>>>>> +        compatible = "dp-connector";
>>>>>>>> +        label = "DSI0";
>>>>>>>> +        type = "full-size";
>>>>>>>> +
>>>>>>>> +        port {
>>>>>>>> +            dp_dsi0_connector_in: endpoint {
>>>>>>>> +                remote-endpoint = <&dsi2dp_bridge0_out>;
>>>>>>>> +            };
>>>>>>>> +        };
>>>>>>>> +    };
>>>>>>>> +
>>>>>>>> +    dp-dsi1-connector {
>>>>>>>> +        compatible = "dp-connector";
>>>>>>>> +        label = "DSI1";
>>>>>>>> +        type = "full-size";
>>>>>>>> +
>>>>>>>> +        port {
>>>>>>>> +            dp_dsi1_connector_in: endpoint {
>>>>>>>> +                remote-endpoint = <&dsi2dp_bridge1_out>;
>>>>>>>> +            };
>>>>>>>> +        };
>>>>>>>> +    };
>>>>>>>>    };
>>>>>>>>      &apps_rsc {
>>>>>>>> @@ -517,9 +548,135 @@ &i2c11 {
>>>>>>>>      &i2c18 {
>>>>>>>>        clock-frequency = <400000>;
>>>>>>>> -    pinctrl-0 = <&qup_i2c18_default>;
>>>>>>>> +    pinctrl-0 = <&qup_i2c18_default>,
>>>>>>>> +            <&io_expander_intr_active>,
>>>>>>>> +            <&io_expander_reset_active>;
>>>>>>>
>>>>>>> These pinctrl entries should go to the IO expander itself.
>>>>>>>
>>>>>>>>        pinctrl-names = "default";
>>>>>>>> +
>>>>>>>>        status = "okay";
>>>>>>>> +
>>>>>>>> +    io_expander: gpio@74 {
>>>>>>>> +        compatible = "ti,tca9539";
>>>>>>>> +        reg = <0x74>;
>>>>>>>> +        interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>>>>>> +        gpio-controller;
>>>>>>>> +        #gpio-cells = <2>;
>>>>>>>> +        interrupt-controller;
>>>>>>>> +        #interrupt-cells = <2>;
>>>>>>>> +
>>>>>>>> +        gpio2-hog {
>>>>>>>
>>>>>>> This needs a huuge explanation in the commit message. Otherwise I'd say
>>>>>>> these pins should likely be used by the corresponding anx bridges.
>>>>>>
>>>>>> Thanks, for the review.
>>>>>>
>>>>>> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
>>>>>> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
>>>>>> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
>>>>>> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.
>>>>>
>>>>> Please make sure that there are pinctrl entries for all pins.
>>>>>
>>>>
>>>> Thanks, for the review.
>>>>
>>>> While declaring the pinctrl entries inside the io_expander node, I am getting below error while checking the DTBS check against DT-binding.
>>>>
>>>> Error : /local/mnt/workspace/amakhija/linux_next_11042025/linux/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: gpio@74: 'dsi0-int-pin-state', 'dsi1-int-pin-state' do not match any of the regexes:
>>>>           '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+' from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>>>
>>> TCA9539 is a GPIO controller rather than a pinctrl device, so it doesn't use pinctrl functions. You don't need to describe properties of the pins that it provides. However, it can use some pins on its own (like reset-gpios). In such a case corresponding pin should have a pinctrl configuration under its pinctrl device.
>>>
>>
>> Hi Dmitry,
>>
>> Thanks, for the review.
>>
>>   ______________                  _____________________                       ___________________
>> |              |                |                     |                     |                   |
>> |       GPIO 98|---ioexp_intr-->|              GPIO 0 |------Reset--------->|RESET_N            |
>> |       GPIO 97|<--ioexp_reset--|              GPIO 1 |----power-enable---->|POWER_EN           |
>> |              |                |                     |                     |                   |
>> |    SOC       |                |  tca9539            |                     |    anx7625 bridge |
>> |  LeMans      |                |  io_expander        |                     |                   |
>> |              |                |              GPIO 2 |<----DSI0_INT_1P8_N--|ALERT_N/INTP       |
>> |______________|                |_____________________|                     |___________________|
>>
>>
>> Based on the above connection diagram, I have already configured the reset(gpio0), power-enable(gpio1) and interrupt (ALERT_N/INTP) (gpio2) for first instance of anx7625 bridge. Similarly I have configured the reset(gpio8), power-enable(gpio9) and interrupt (gpio10) for the second instance of the anx7625 bridge.
>>
>> bridge@58 {
>>               compatible = "analogix,anx7625";
>>               reg = <0x58>;
>>               interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
>>               enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
>>               reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
>>
>>
>> I think above configuration should be fine, we don't need any pinctrl for io expander's gpios going to anx7625 bridge.
>>
>> Other two RESET (gpio97) and INTR (gpio98) gpios, which is connecting SOC to io expander (tca9539), I have already declared them under tlmm node.
>>
>> io_expander_intr_active: io-expander-intr-active-state {
>>          pins = "gpio98";
>>          function = "gpio";
>>          drive-strength = <2>;
>>          bias-disable;
>> };
>>
>> io_expander_reset_active: io-expander-reset-active-state {
>>          pins = "gpio97";
>>          function = "gpio";
>>          drive-strength = <2>;
>>          bias-disable;
>>          output-high;
> 
> Yes, this this was I was looking for, thank you.
> 
Hi Dmitry,

Thanks for the clarification.

Thanks,
Ayushi
>> };
>>
>> Thanks,
>> Ayushi
>>
>>>>
>>>>           io_expander: gpio@74 {
>>>>                   compatible = "ti,tca9539";
>>>>                   reg = <0x74>;
>>>>                   interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>>                   gpio-controller;
>>>>                   #gpio-cells = <2>;
>>>>                   interrupt-controller;
>>>>                   #interrupt-cells = <2>;
>>>>
>>>>                   pinctrl-0 = <&io_expander_intr_active>,
>>>>                               <&io_expander_reset_active>;
>>>>                   pinctrl-names = "default";
>>>>
>>>>                   dsi0_int_pin: dsi0-int-pin-state {
>>>>                           pins = "gpio2";
>>>>                           input-enable;
>>>>                           bias-disable;
>>>>                   };
>>>>
>>>>                   dsi1_int_pin: dsi1-int-pin-state {
>>>>                           pins = "gpio10";
>>>>                           input-enable;
>>>>                           bias-disable;
>>>>                   };
>>>>
>>>>           };
>>>>
>>>> I couldn't find any devicetree example of tca9539 which is using pinctrl. The gpio-pca95xx.yaml DT binding does not match with any regex of the patterns properties.
>>>>
>>>> Thanks,
>>>> Ayushi
>>>
>>>
>>
> 
> 

