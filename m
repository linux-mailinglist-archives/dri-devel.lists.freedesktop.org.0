Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D39DC1EF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 11:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE2810EDD3;
	Fri, 29 Nov 2024 10:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ap9xPIpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA310EDCA;
 Fri, 29 Nov 2024 10:07:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMP29p008881;
 Fri, 29 Nov 2024 10:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FuqEPMr3yJ2WoSGhOwobCFy8dOjlepO8z+V4KVGYV38=; b=ap9xPIpJ3xkQeyFn
 7cOCdfLx0uTxXppUhz/iY8zg+d+P3CQGHg1FNTvi+9C4YqWZBGF5pTNfaG6snBHY
 EVC49GfJn0Mkqk3WI8bhbWar8BEEhtn2w6zGj/J8DyHhEs9hBo/CHPsYkxAja5x3
 DwHMQ9XyQOT8G4wx9wSzXXT/EC356fyDyiZeZ3XHRYFNELe4WENyx63eoSNOXE5B
 XEQEIQONr6fxtaC2yBadf4rzg/cqJ1+8bd8qGTNOxWt4EaLcDLS9C8SEtmXl5NXM
 i9opHEuPlclUOqOaar2KhdRrxn5ZY6lso1LsWOV8wcE4Ugf49fCjQ9maxA5s+HHp
 y8COuA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xy53km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 10:07:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATA6YKT019834
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 10:06:34 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 02:06:28 -0800
Message-ID: <acb85352-78fd-4c78-93a0-e8acf9432485@quicinc.com>
Date: Fri, 29 Nov 2024 18:06:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Display enablement changes for Qualcomm QCS8300
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Ritesh Kumar
 <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <675c41cb-afa8-4386-8dc9-026a36bc1152@kernel.org>
 <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
 <amhqdc6kv6vd66bwwyhozlqptqjzuefddiabgw5ndko3rj2gwv@5choqknbpeb2>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <amhqdc6kv6vd66bwwyhozlqptqjzuefddiabgw5ndko3rj2gwv@5choqknbpeb2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NCETI47nTAGV-ZrzYsytx2dxC9exI2bU
X-Proofpoint-ORIG-GUID: NCETI47nTAGV-ZrzYsytx2dxC9exI2bU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=895
 mlxscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290083
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



On 2024/11/27 21:51, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 06:54:10PM +0800, Yongxing Mou wrote:
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
>> Thanks for reviewing.Can we keep the dependency on above changes and merge
>> our changes after the dependent changes are merged?
> 
> Just drop _all_dependencies from display/msm patches. Otherwise I won't
> be able to pick them up until 6.15-rc. Use ephemeral DT nodes in the
> examples.
> 
Thanks, got it. will update it in next patchset.

