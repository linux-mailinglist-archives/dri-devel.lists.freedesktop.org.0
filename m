Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C369F5D55
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 04:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CCC10E64D;
	Wed, 18 Dec 2024 03:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HuQed8pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FEF10E637;
 Wed, 18 Dec 2024 03:18:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHKdkXD001491;
 Wed, 18 Dec 2024 03:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MY4bThfd3nHovNrRAuLqu4dGpe6E0cynHU9jcVwEij4=; b=HuQed8pp07PEh9Dv
 UUghu+uZvjhmU9aPQtf6Thx+UiLI1hgiGbURJV4wWUd2j7KjrkH57KK5mWRnzCD5
 Ig4Pt/rKI/qa6nNNJzb+l1B+h9FObKumV36o1S4MYJwA7G2goE3ARRCwdJ2s9Z2s
 KRs5vTx8E6PcRHb0kOOMbBMwztG14XtbMysm95uN9pSQNZxmK1oC2nq+pkFsrv6G
 zr7o6R3wkYHqjOyOOvW5Xe2bWAfeGfkiyStvXANomrbi/ar7RvtTG6QtnahiUtdT
 MCEjwEY+XtEiPafdzoaD7CBa1HTRNqmwMvEscOaK76BsR2tjMTrKf9g8znxqU5EE
 jVTm9w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kghk0qmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 03:18:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI3IA19009355
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 03:18:10 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 19:18:04 -0800
Message-ID: <baab6fc5-755a-4675-a42d-ba7ba7facf0c@quicinc.com>
Date: Wed, 18 Dec 2024 11:18:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Liu Li
 <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
 <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn>
 <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
 <CAA8EJpqyM-r3jvY7sTpG-KKRHP9K7c3q0xfoLb_f0th7vunPYw@mail.gmail.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <CAA8EJpqyM-r3jvY7sTpG-KKRHP9K7c3q0xfoLb_f0th7vunPYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: p98UkB7seudijRo0Vqo4k0l5gySZ6_zn
X-Proofpoint-ORIG-GUID: p98UkB7seudijRo0Vqo4k0l5gySZ6_zn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180023
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



On 2024/12/13 18:19, Dmitry Baryshkov wrote:
> On Fri, 13 Dec 2024 at 11:21, fange zhang <quic_fangez@quicinc.com> wrote:
>>
>>
>>
>> On 2024/12/10 19:02, Dmitry Baryshkov wrote:
>>> On Tue, Dec 10, 2024 at 02:54:00PM +0800, Fange Zhang wrote:
>>>> From: Li Liu <quic_lliu6@quicinc.com>
>>>>
>>>> Add display MDSS and DSI configuration for QCS615 RIDE board.
>>>> QCS615 has a DP port, and DP support will be added in a later patch.
>>>>
>>>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>>>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 89 ++++++++++++++++++++++++++++++++
>>>>    1 file changed, 89 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> index a25928933e2b66241258e418c6e5bc36c306101e..694719a09ac46bfa2fe34f1883c0970b9d0902be 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> @@ -32,6 +32,18 @@ xo_board_clk: xo-board-clk {
>>>>                       #clock-cells = <0>;
>>>>               };
>>>>       };
>>>> +
>>>> +    dp-connector {
>>>> +            compatible = "dp-connector";
>>>> +            label = "DP";
>>>> +            type = "mini";
>>>> +
>>>> +            port {
>>>> +                    dp_connector_out: endpoint {
>>>> +                            remote-endpoint = <&anx_7625_out>;
>>>> +                    };
>>>> +            };
>>>> +    };
>>>>    };
>>>>
>>>>    &apps_rsc {
>>>> @@ -202,6 +214,83 @@ &gcc {
>>>>                <&sleep_clk>;
>>>>    };
>>>>
>>>> +&i2c2 {
>>>> +    clock-frequency = <400000>;
>>>> +    status = "okay";
>>>> +
>>>> +    ioexp: gpio@3e {
>>>> +            compatible = "semtech,sx1509q";
>>>> +            reg = <0x3e>;
>>>> +            interrupt-parent = <&tlmm>;
>>>> +            interrupts = <58 0>;
>>>
>>> Use IRQ flags instead of just 0 (here and further on). Also it might be
>>> better to use interrupts-extended instead.
>> Got it, will use interrupts-extended instead
>> -               interrupt-parent = <&tlmm>;
>> -               interrupts = <58 0>;
>> +               interrupts-extended = <&tlmm 58 IRQ_TYPE_NONE>;
>>>
>>>> +            gpio-controller;
>>>> +            #gpio-cells = <2>;
>>>> +            interrupt-controller;
>>>> +            #interrupt-cells = <2>;
>>>> +            semtech,probe-reset;
>>>> +    };
>>>> +
>>>> +    i2c-mux@77 {
>>>> +            compatible = "nxp,pca9542";
>>>> +            reg = <0x77>;
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>
>>> Add empty line before device nodes (here and furher on).
>> Sorry, will add it in next patch.
>>>
>>>> +            i2c@0 {
>>>> +                    reg = <0>;
>>>> +                    #address-cells = <1>;
>>>> +                    #size-cells = <0>;
>>>> +
>>>> +                    anx7625@58 {
>>>> +                            compatible = "analogix,anx7625";
>>>> +                            reg = <0x58>;
>>>> +                            interrupt-parent = <&ioexp>;
>>>> +                            interrupts = <0 0>;
>> will change it to interrupts-extended in next patch
>> -               interrupt-parent = <&ioexp>;
>> -               interrupts = <0 0>;
>> +               interrupts-extended = <&ioexp 0 IRQ_TYPE_NONE>;
> 
> Yes, much better. BTW: are you sure that it's really IRQ_TYPE_NONE?
We extensively tested FALLING and BOTH type, and they all work. However, 
I believe it’s better to use the default type, which is the same as the 
downstream approach. This way, it will be more stable.
> 
>>>> +                            enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
>>>> +                            reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
>>>> +                            wakeup-source;
>>>> +
>>>> +                            ports {
>>>> +                                    #address-cells = <1>;
>>>> +                                    #size-cells = <0>;
>>>> +
>>>> +                                    port@0 {
>>>> +                                            reg = <0>;
>>>> +                                            anx_7625_in: endpoint {
>>>> +                                                    remote-endpoint = <&mdss_dsi0_out>;
>>>> +                                            };
>>>> +                                    };
>>>> +
>>>> +                                    port@1 {
>>>> +                                            reg = <1>;
>>>> +                                            anx_7625_out: endpoint {
>>>> +                                                    remote-endpoint = <&dp_connector_out>;
>>>> +                                            };
>>>> +                                    };
>>>> +                            };
>>>> +                    };
>>>> +            };
>>>> +    };
>>>> +};
>>>> +
>>>> +&mdss {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&mdss_dsi0 {
>>>> +    vdda-supply = <&vreg_l11a>;
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&mdss_dsi0_out {
>>>> +    remote-endpoint = <&anx_7625_in>;
>>>> +    data-lanes = <0 1 2 3>;
>>>> +};
>>>> +
>>>> +&mdss_dsi0_phy {
>>>> +    vdds-supply = <&vreg_l5a>;
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>>    &qupv3_id_0 {
>>>>       status = "okay";
>>>>    };
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
> 
> 

