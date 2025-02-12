Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA122A31FD7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3BB10E7C5;
	Wed, 12 Feb 2025 07:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LKnHOvWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69DB10E7C4;
 Wed, 12 Feb 2025 07:18:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BLLxC7025705;
 Wed, 12 Feb 2025 07:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mwUlC2aKZRSlNQSNnZwqh13wOODDDXjJ7+xJpiK0pCs=; b=LKnHOvWcwLX0zHP5
 HeA0gKn+af0/wHtPubeyydNMuIQQTY/2C6+V4oWRtEgABMoSwxn54f+nxX7Sc7q1
 PxylMqcub0u/AJsIq0msEjjWFTMRjSbJrQPgpkB5upzzcypxo6NiF4lWuC7LFOHM
 T3MjZGVCH8A0y/2zTz3z4sL0o9a1dh0B4Cqq1fwYsrAdZJneDp/AUtOSqW3q4lnn
 789SoCEFckTLWx2hTQa0CtvBk6aqBxKxLdQw7mKhkLfegqmelVxw5SfQPs7of86I
 Hq75h4pQQ637312y2q8MJOXmn3pAIzgGG3z/8mBjgxbtbS+UOjirA8f2uyVV+183
 Y5amrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5avc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2025 07:18:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C7IBrb017512
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2025 07:18:11 GMT
Received: from [10.216.10.188] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 23:18:04 -0800
Message-ID: <c80ef960-7dc6-42bf-89a1-79e43be2bce0@quicinc.com>
Date: Wed, 12 Feb 2025 12:48:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
 <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
 <271e7b4f-454c-426e-a3f6-dcb55389374e@quicinc.com>
 <iymxe2hmjobctdimupp656xeyhctwd4yswbp2wobaneuzgxedu@cyhjb5ibkqmj>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <iymxe2hmjobctdimupp656xeyhctwd4yswbp2wobaneuzgxedu@cyhjb5ibkqmj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: I2PG4Q58doEJGIEy3-24I5DTXcJ29dI8
X-Proofpoint-GUID: I2PG4Q58doEJGIEy3-24I5DTXcJ29dI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120055
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

On 2/12/2025 5:30 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 11, 2025 at 06:41:39PM +0530, Akhil P Oommen wrote:
>> On 2/9/2025 9:59 PM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
>>>> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>
>>>>> Enable GPU for sa8775p-ride platform and provide path for zap
>>>>> shader.
>>>>>
>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> index 0c1b21def4b6..4901163df8f3 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> @@ -407,6 +407,14 @@ queue3 {
>>>>>  	};
>>>>>  };
>>>>>  
>>>>> +&gpu {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&gpu_zap_shader {
>>>>> +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
>>>>> +};
>>>>> +
>>>>>  &i2c11 {
>>>>>  	clock-frequency = <400000>;
>>>>>  	pinctrl-0 = <&qup_i2c11_default>;
>>>>>
>>>>
>>>> Bjorn,
>>>>
>>>> Please ignore this patch for now. This is probably not the right
>>>> platform dtsi file where gpu should be enabled. I am discussing about
>>>> this internally. Will send a revision or a new patch based on the
>>>> conclusion.
>>>
>>> Akhil, any updates on this?
>>>
>>
>> I am still waiting for the discussion about QCS9075 board dts files [1]
>> to conclude.
>>
>> [1]
>> https://lore.kernel.org/lkml/Z3eMxl1Af8TOAQW%2F@hu-wasimn-hyd.qualcomm.com/T/
> 
> Why? We currently have several boards supported. We can enable GPU on
> those as your patches are pretty fine. Then we can land Wasim's patches.
> Not to mention that the discussion seems to be dead, last message was
> sent almost a month ago.
> 

sa8775p is an automotive-grade chipset which has a pretty different
non-HLOS firmware. One of the major difference is that it has a SAFETY
monitoring system (using SAIL IP block) which monitors different
parameters like GPU frequency for eg and it takes control of the entire
system when it detects an anomaly. That means we cannot use GPU DCVS,
passive thermal mitigation etc there.

QCS9075 uses the same SoC but has different NHLOS firmwares that has
SAIL disabled to make it behave like our regular chipsets. I am aware of
only QCS9075 boards' GPU spec at the moment. I don't know the complete
details of the impact of SAIL/SAFE features on GPU and other specs yet,
so I can't disturb sa8775p-ride/qcs9100-ride boards.

I can see that Wazim is still discussing about board DTS internally.
Hopefully he will send out another revision of his series soon.

-Akhil

