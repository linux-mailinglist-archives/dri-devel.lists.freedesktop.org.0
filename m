Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2836EA3BA87
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 10:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2B910E7A4;
	Wed, 19 Feb 2025 09:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jmtUx3np";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B1010E7A8;
 Wed, 19 Feb 2025 09:43:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J7e2GY002691;
 Wed, 19 Feb 2025 09:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BRmVuOElVxUTeRDyEZ3ekSWRHBkhEe7aS51JcoAJOjQ=; b=jmtUx3npP5Pl5qsG
 TpVsj9sH4/ADHpNfABczpXPUAkxd3OJKnfWn8Jn2rMkdPLi0josfanIB4q5AGmKe
 Ao+bpJT5ecZnKBzFochJbEck8KWrruBvykDmxSZUowVPCICBOZUjWTZt/XmG+PIA
 zD0oOxUckkJC4SK1d+4m8r3Qq29uZ/JcDpiQ5bC4bvQp9BeW/dh0DY4l+kjm+hRN
 GxMYMrFKte4sRlAIFKBnQgmBRuxRerpL9rb2LvQdRCnTr0A3qp7FXkr3e5K0XWwP
 MMRZchP1nnMiqOgHTXC8bAa2EDbEOR2PdpwjxbROW1yGJ14Yn3Qq7YhYqeHYeuu6
 nwWOGw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy29yqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 09:43:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J9hHLe003295
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 09:43:17 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 01:43:10 -0800
Message-ID: <d45d9832-31b3-4a23-bcc2-8313d2fccec7@quicinc.com>
Date: Wed, 19 Feb 2025 17:43:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <531a23fe-940a-4e9a-b023-5f1789ac65a5@kernel.org>
 <10d83c88-9f72-4577-95ba-bb1fd1ef36d1@quicinc.com>
 <5fd75e3d-ee87-439e-b6d4-dd0dd9a0ea2d@kernel.org>
 <c4850349-e0d7-4976-a6dc-9c690905abf3@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <c4850349-e0d7-4976-a6dc-9c690905abf3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wiU1kxTL0LrvIcw-0lzCg0AnIbycbzrZ
X-Proofpoint-GUID: wiU1kxTL0LrvIcw-0lzCg0AnIbycbzrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190077
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



On 2025/2/12 21:44, Konrad Dybcio wrote:
> On 12.02.2025 12:28 PM, Krzysztof Kozlowski wrote:
>> On 12/02/2025 12:13, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/2/12 16:35, Krzysztof Kozlowski wrote:
>>>> On 12/02/2025 08:12, Yongxing Mou wrote:
>>>>> We need to enable mst for qcs8300, dp0 controller will support 2 streams
>>>>> output. So not reuse sm8650 dp controller driver and will add a new driver
>>>>> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
>>>>> to compatible with the qcs8300-dp.
>>>>>
>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> NAK. You just said qcs8300 is compatible with sm8650. I did not ask
>>>> about drivers, I asked about hardware.
>>>>
>>>> This is messy approach. Describe properly the hardware first, instead of
>>>> sending two conflicting patchsets.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Hi, Krzysztof, thanks for reviewing, i want to explain why i submitted
>>> this patch. Patch
>>> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com/
>>> and
>>> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-2-1687e7842125@quicinc.com/
>>> is the qcs8300 display enablement changes. It base on current linux base
>>> code and it only support SST mode, so in the SST mode, qcs8300 dp
>>> controller driver is quite same with sm8650, struct msm_dp_desc only
>>> have 3 members(io_start, id and wide_bus_supported) and they are same
>>> both in qcs8300 and sm8650, so we reuse it. BTW, for dp phy hardware
>>> version, qcs8300 and sm8650 is different.
>>
>> No. In one patchset you claim hardware is like that, in other patchset
>> you say hardware is different.
>>
>> Sorry, hardware does not change based on your patchsets.
>>
>> Sort out this before posting new versions.
> 
> In other words, fallback compatibles must be chosen with features that
> are present in hardware, but not yet supported upstream in mind.
> 
> It's totally fine (and even preferred/expected) to describe hardware resources
> (such as MST clocks here) when initially creating bindings for a piece of hw,
> even though the drivers don't use them yet at that moment.
> 
> dt-bindings are supposed to give the OS a complete representation of the
> hardware and ideally be immutable (which is a struggle, but we're getting
> better). Driver specifics should not influence your decisions (or at least
> do so very minimally) when adding these.
> 
> Now you're in a """good""" position as the display bindings haven't been merged
> yet, so you can still upload a new patchset where the description is more
> accurate. If it was merged, we'd have to break the ABI or add some crazy
> workarounds..
> 
> Please coalesce this patchset with the "add 8300 display support" one.
> 
> Please also describe all 4 MST clocks and whatever other clocks/resets that
> may be necessary down the line.
>   
> Konrad
Thanks, will update it in this patch "add 8300 display support". Because 
this will depend on this change: 
https://patchwork.freedesktop.org/series/142016/. we will first fix our 
dependecy comments and then repost it.
