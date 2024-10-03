Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A398EBFE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 11:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEEC10E7D5;
	Thu,  3 Oct 2024 09:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KDObjsZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC05F10E7C0;
 Thu,  3 Oct 2024 09:02:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4934WPgV006976;
 Thu, 3 Oct 2024 09:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cyhMD9subqdRNWifinp10CFZ39Qn0LnQ5YpIkBebER0=; b=KDObjsZrx4+7lH+u
 RRmZkpjue1vcC0Zkh8BghSeOeB2ZBeCbxjG25VzwImo59/xcJEzgZE60btMiVhHM
 6xoXqxGNbkqB+cofjzC+3nlWla0X9hy3w03p2iJJa3NzUfUpk13+Qx78GzSOyAtY
 Yptc+G/F36izBscfveKzhuDX99qlOswtbjZW3whEKwvA6sx3o+ZyGB+WKwadGIXt
 BqAsbwxsBRobWvZFBfvpJ+QUurlARTFiNS7sRPcZkdM6GS8mtu6AjeQtuo87Ghz8
 7fF34BJZdc1T6WYPcuno2uTbMGRcX0KTS10/j+XST8xrrraZZ8PSyDQ/OxEG93Fz
 jfQCpQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xajfnrye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2024 09:02:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49392HfT000929
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 3 Oct 2024 09:02:17 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Oct 2024
 02:02:10 -0700
Message-ID: <2fe92521-acb5-410f-9838-9f34ac62026a@quicinc.com>
Date: Thu, 3 Oct 2024 14:32:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-1-d23284f45977@quicinc.com>
 <hieznomkoezdzmmvxfrvfrma3v5lixnkjkahh25fz5fttcpetv@t4pvd343j3ww>
Content-Language: en-US
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <hieznomkoezdzmmvxfrvfrma3v5lixnkjkahh25fz5fttcpetv@t4pvd343j3ww>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tWNAPNjobPhjxrKy2vlDazysiyS1S16B
X-Proofpoint-ORIG-GUID: tWNAPNjobPhjxrKy2vlDazysiyS1S16B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410030064
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


On 10/3/2024 1:23 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 01, 2024 at 12:11:36PM +0530, Mahadevan wrote:
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        const: qcom,sa8775p-dpu
>> +
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sa8775p-dp
> Where is this binding? The schema is incomplete.


This binding is added as part of following change.

https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/

I will mention the same in cover letter/commit message of subsequent patch.


>
> Best regards,
> Krzysztof

Thanks,
Mahadevan

