Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB829DBF22
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 05:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD77310EDA0;
	Fri, 29 Nov 2024 04:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pP34Ozw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A3F10E49C;
 Fri, 29 Nov 2024 04:55:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMBJFV005202;
 Fri, 29 Nov 2024 04:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PfeJXRYiD6OxAQIRHwQBONi9OeXoG+H3tiX8WCnNxPc=; b=pP34Ozw09qTZDNRm
 q4+Fm4D3woD5y2XTk1NaDRNNerZQygoRLrtDr0Jf0EY6AwyiaaV49K8SC5qt6Mw9
 fXo20Sp56RG8oYn7q5PT4rJlDDhl8AUPXAb9+ng6wgXbK7aS6vFsLSpFECjGN6wZ
 1UMC9Nsm0g2yTIVoQDfx42hmYNYmXVf/WKO7my9r9UGTiSpEBjL1ogUvKEAu0mR+
 sZxYJY7WxBFRVcUSEc6KAh2iOBDbpOzuaj69s99Ih24/zsjZLj3BIO7vZiOSfu+K
 7AS78GYdzBkYcGYw0ZNNiTNtiUjxtGFII8nCJdXmmsgm/NxsrUj1et3CmhRDfZLa
 G9jWrA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xxmfru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 04:55:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT4tBrH006092
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 04:55:11 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 20:55:05 -0800
Message-ID: <ce4210dc-9bd6-4b21-a7ff-f6a9afa22741@quicinc.com>
Date: Fri, 29 Nov 2024 12:55:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] arm64: dts: qcom: Add display support for QCS615
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
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Li Liu
 <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>
 <azdmcs7uafw3n6cqbq4ei66oybzhtyvdyz2xl4wtaf3u5zextb@vdhbs6wnbeg4>
 <520419eb-cedf-465b-a14a-12d97ab257a0@quicinc.com>
 <CAA8EJpqvkeMWgeWCx9D-HcJhRfipZJdEvpvag0wk-WXazkPahA@mail.gmail.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <CAA8EJpqvkeMWgeWCx9D-HcJhRfipZJdEvpvag0wk-WXazkPahA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wSxIzY7Q56qwHsCqgxI6Muy0vK8xA0Tf
X-Proofpoint-ORIG-GUID: wSxIzY7Q56qwHsCqgxI6Muy0vK8xA0Tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290037
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



On 2024/11/26 6:08, Dmitry Baryshkov wrote:
> On Mon, 25 Nov 2024 at 09:39, fange zhang <quic_fangez@quicinc.com> wrote:
>>
>>
>>
>> On 2024/11/22 18:22, Dmitry Baryshkov wrote:
>>> On Fri, Nov 22, 2024 at 05:56:52PM +0800, Fange Zhang wrote:
>>>> From: Li Liu <quic_lliu6@quicinc.com>
>>>>
>>>> Add display MDSS and DSI configuration for QCS615 RIDE board.
>>>> QCS615 has a DP port, and DP support will be added in a later patch.
>>>>
>>>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>>>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 76 ++++++++++++++++++++++++++++++++
>>>>    1 file changed, 76 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> index ee6cab3924a6d71f29934a8debba3a832882abdd..cc7dadc411ab79b9e60ccb15eaff84ea5f997c4c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> @@ -202,6 +202,82 @@ &gcc {
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
+ remote-endpoint = <&dp_connector_out>;
>>>> +                                            };
>>>
>>> Where is it connected? Is it DP port? USB-C? eDP?
>> yes, it's DP port
> 
> So, I'd expect to see a dp-connector node at the end, not the
> unterminated anx7625.
got it, will add it in next patch
+       dp-connector {
+               compatible = "dp-connector";
+               label = "DP";
+               type = "mini";
+
+               port {
+                       dp_connector_out: endpoint {
+                               remote-endpoint = <&anx_7625_out>;
+                       };
+               };
+       };
> 
>>>
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

