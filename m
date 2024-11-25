Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCF19D7C0A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 08:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3413610E05A;
	Mon, 25 Nov 2024 07:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LRizIbrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1253510E05A;
 Mon, 25 Nov 2024 07:39:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP7W3Q4011503;
 Mon, 25 Nov 2024 07:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mhiI0THbvHUoezO4NczBF99yryboUFqA+Fx/oj+SIJA=; b=LRizIbrDmbvLK26q
 IJr9BOxlf/wLEVIIwXd3UAd/aXQXPY+b/hq9d1mBfzkd8zmSkh8s4JYtJxcLbZ9g
 mYlmbQkCLkf2amcikViEhav+oCnwrDYg+iiJPiKisuXNYR8WBogrjg8vu5gdbEVj
 43Db+uJ7+YQz+Q5NMETeh98dC1xBW6+FdKLgwqz5eEoCFHZwVBG42z72H2X/mqyb
 iJKkSG0HGI3DrjnnGFuJE8Xw23LVwS3PyANVxfJT7NmJ/1DTKnZIKOxvfFditdzM
 AFhvKf2WgwCjyP7forb+UBsXOx/bMAH9YktlUznMWLYfW94+bsk7PJmmde+DjKIs
 TyQLAw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434mx700fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2024 07:39:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP7d11T003539
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2024 07:39:01 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 23:38:54 -0800
Message-ID: <520419eb-cedf-465b-a14a-12d97ab257a0@quicinc.com>
Date: Mon, 25 Nov 2024 15:38:51 +0800
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
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <azdmcs7uafw3n6cqbq4ei66oybzhtyvdyz2xl4wtaf3u5zextb@vdhbs6wnbeg4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LtXWYAU7mSB5PXQCwLcitGJoSMnov67f
X-Proofpoint-ORIG-GUID: LtXWYAU7mSB5PXQCwLcitGJoSMnov67f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250064
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



On 2024/11/22 18:22, Dmitry Baryshkov wrote:
> On Fri, Nov 22, 2024 at 05:56:52PM +0800, Fange Zhang wrote:
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> Add display MDSS and DSI configuration for QCS615 RIDE board.
>> QCS615 has a DP port, and DP support will be added in a later patch.
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 76 ++++++++++++++++++++++++++++++++
>>   1 file changed, 76 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index ee6cab3924a6d71f29934a8debba3a832882abdd..cc7dadc411ab79b9e60ccb15eaff84ea5f997c4c 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -202,6 +202,82 @@ &gcc {
>>   		 <&sleep_clk>;
>>   };
>>   
>> +&i2c2 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	ioexp: gpio@3e {
>> +		compatible = "semtech,sx1509q";
>> +		reg = <0x3e>;
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <58 0>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		semtech,probe-reset;
>> +	};
>> +
>> +	i2c-mux@77 {
>> +		compatible = "nxp,pca9542";
>> +		reg = <0x77>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		i2c@0 {
>> +			reg = <0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			anx7625@58 {
>> +				compatible = "analogix,anx7625";
>> +				reg = <0x58>;
>> +				interrupt-parent = <&ioexp>;
>> +				interrupts = <0 0>;
>> +				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
>> +				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
>> +				wakeup-source;
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						anx_7625_in: endpoint {
>> +							remote-endpoint = <&mdss_dsi0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						anx_7625_out: endpoint {
>> +						};
> 
> Where is it connected? Is it DP port? USB-C? eDP?
yes, it's DP port
> 
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&vreg_l11a>;
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&anx_7625_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	vdds-supply = <&vreg_l5a>;
>> +	status = "okay";
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>>
>> -- 
>> 2.34.1
>>
> 

