Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131349DC1E9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 11:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CA710EDD0;
	Fri, 29 Nov 2024 10:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mYtpBrzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269EF10EDD0;
 Fri, 29 Nov 2024 10:05:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMTpmX030292;
 Fri, 29 Nov 2024 10:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0RK466dDDRoGX8nSKTskyL8xXNBycPHs+DMBo1mabXo=; b=mYtpBrzvGa4PuRXI
 rxkSnpCTwqKME0l1JtkotOzki45DXFHAAYLCuxeVhC6WFLEy/UeQDu71W51HP31Y
 fOoKSF9Rn6n5vdU565Ol0PRUHBDary8oBunPiVBoxTaY20PszI4GIP606UJ49gFh
 hAZUabOxjDGO+OWjzWF/XWlOm88LCS2ia13pwI1NyglLTdl7LMrOhDuy9gChdK+h
 x9Jp11C/TqcSgLGWkxHGlaZoaxmFLIWWc7e+cTgW3+Jwggo6Va1cHp7qXlatfmNm
 cFf2iQyUAOwCNIzhJ2fhxIIWVKi6gceXEnfRkIn7LXGWLJT1fb3hFXgZkqtcqrT3
 bohRVQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 436h2mkv2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 10:05:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATA5CRr026841
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 10:05:12 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 02:05:06 -0800
Message-ID: <cd78a00f-b7ac-4125-8c8c-4363b1891daa@quicinc.com>
Date: Fri, 29 Nov 2024 18:05:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Display enablement changes for Qualcomm QCS8300
 platform
To: Krzysztof Kozlowski <krzk@kernel.org>, Ritesh Kumar
 <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <675c41cb-afa8-4386-8dc9-026a36bc1152@kernel.org>
 <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
 <e3c47041-51ab-403c-a217-a39f071e0d55@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <e3c47041-51ab-403c-a217-a39f071e0d55@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JpbzkP5XKEIiSxKdCkGXg7W37y12hEsQ
X-Proofpoint-ORIG-GUID: JpbzkP5XKEIiSxKdCkGXg7W37y12hEsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=977 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290081
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



On 2024/11/27 20:01, Krzysztof Kozlowski wrote:
> On 27/11/2024 11:54, Yongxing Mou wrote:
>>
>>
>> On 2024/11/27 15:13, Krzysztof Kozlowski wrote:
>>> On 27/11/2024 08:05, Yongxing Mou wrote:
>>>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>>>> and Display Processing Unit (DPU) for the Qualcomm QCS8300 target. It
>>>> includes the addition of the hardware catalog, compatible string,
>>>> relevant device tree changes, and their YAML bindings.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>> This series depends on following series:
>>>> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
>>>> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
>>> Above was not part of this merge window, so nothing from your patchset
>>> can be merged for this v6.14.
>>>
>>> If you want things to get merged, I suggest decoupling dependencies.
>>>
>> Thanks for reviewing.Can we keep the dependency on above changes and
>> merge our changes after the dependent changes are merged?
> So merged in 4 months? for v6.15-rc1? You can.
> 
Thank you for your reminder.agree with you that should decouple 
dependencies in next patchset.I will submit the drive changes and the 
dtsi changes separately.
> Best regards,
> Krzysztof

