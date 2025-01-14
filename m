Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D1A10531
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 12:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B58C10E186;
	Tue, 14 Jan 2025 11:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Am4SVgIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A3C10E186;
 Tue, 14 Jan 2025 11:21:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E86JpM020662;
 Tue, 14 Jan 2025 11:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QlOdxO3OmanBBTk+Gz46nfFMr/I29UEEjRPNmLHpDK0=; b=Am4SVgInlAdYnbXR
 V9vS3ytz5xm/h0T/VT9tW8DlN/fCUohj21Q1eotZeEXE42PlC6lX9OG4cO3iJxmp
 pd5Vn806SuAYnNt0PaeqVQvaP3Z5E9jqqZLHx7MoNnubq93b1LXVh0ZxH8qCECt9
 Oq3/2uBb64LPt2BJIxQw8Wus0F2CUyqJ4KuK/odspnwCOVsYbklX9Y/2JWzVZqok
 AhIukKctfiuv585h1szbhJRc5rE/jdYWFEx3NVMSrdmNglpWiq7VI0e3SO1qaUVa
 bNVK1Q1lkHtLCOB2GwH7dfloFcuo1UNaMPeitKhGWu6QQui/TQH3mxNRc3BJerrc
 Ji8xag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445m42gdt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 11:21:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50EBLbxk005570
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 11:21:37 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 03:21:31 -0800
Message-ID: <cf223355-3d9f-423a-acbe-55993ce9fcfc@quicinc.com>
Date: Tue, 14 Jan 2025 19:21:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, "Kishon Vijay
 Abraham I" <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>
 <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
 <CAA8EJppUEB-c5LbWN5dJoRh+6+nNFH3G9h_uwbuTo=B8kp_9oA@mail.gmail.com>
 <bda8dd18-3bed-427a-bd19-9cb011256c93@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <bda8dd18-3bed-427a-bd19-9cb011256c93@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8G77iWHE67xKFMIAseGtqeUg1yLxU39T
X-Proofpoint-GUID: 8G77iWHE67xKFMIAseGtqeUg1yLxU39T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 clxscore=1011 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140095
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



On 2025/1/14 18:11, Krzysztof Kozlowski wrote:
> On 14/01/2025 11:00, Dmitry Baryshkov wrote:
>> On Tue, 14 Jan 2025 at 09:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On Mon, Jan 13, 2025 at 04:03:10PM +0800, Yongxing Mou wrote:
>>>> +patternProperties:
>>>> +  "^display-controller@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,qcs8300-dpu
>>>> +          - const: qcom,sa8775p-dpu
>>>> +
>>>> +  "^displayport-controller@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,qcs8300-dp
>>>> +          - const: qcom,sm8650-dp
>>>
>>> Parts of qcs8300 display are compatible with sa8775p, other parts with
>>> sm8650. That's odd or even not correct. Assuming it is actually correct,
>>> it deserves explanation in commit msg.
>>
>> It seems to be correct. These are two different IP blocks with
>> different modifications. QCS8300's DP configuration matches the SM8650
>> ([1]), though the DPU is the same as the one on the SA8775P platform.
>>
>> [1] https://lore.kernel.org/dri-devel/411626da-7563-48fb-ac7c-94f06e73e4b8@quicinc.com/
> 
> That's the driver, so you claim that qcs8300, which is a sa8775p, is not
> compatible with sa8775p because of current driver code? You see the
> contradiction? sa8775p is not compatible with sa8775p because of current
> driver patch?
> 
> I don't think it is correct, but let's repeat: if you think otherwise,
> this should be explain in commit msg.
> 
> Best regards,
> Krzysztof

Hi,let me explain this: qcs8300 uses the same DPU as sa8775p, which is 
DPU_8_4. Therefore, for the DPU driver, qcs8300 reuses the driver of 
sa8775p. However, for the DisplayPort controller of qcs8300, it's 
different with sa8775p. qcs8300 only supports one DisplayPort output 
port, while sa8775p has two DPUs and supports four DisplayPort outputs. 
Therefore, the DisplayPort controller driver of sa8775p cannot be reused 
for qcs8300. Additionally, the base offset of qcs8300's DisplayPort 
controller is the same as that of sm8650, so the DisplayPort controller 
reuses "qcom,sm8650-dp". I explained this in the commit messages of the 
previous two bindings, but it might not have been explained in the 
commit message of this patch.i will update the commit msg in next patchset.

