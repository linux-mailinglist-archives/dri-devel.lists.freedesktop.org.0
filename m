Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167CA076D1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448510EDC3;
	Thu,  9 Jan 2025 13:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="h9TUdCY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB6110EDC3;
 Thu,  9 Jan 2025 13:13:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509CBb1S002551;
 Thu, 9 Jan 2025 13:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1gQktWs35Nmmkh/sMqLzL8W2a4Lz5CykJx6IWqAG9OQ=; b=h9TUdCY3TyGO1rvb
 Lg/PLJ3pXAi2rqaHVzz48wD7BhXBmDLHpe6uLPGS4dsfeYCRp/KyilNMFMeJpAq4
 HiCuPsBre0966UgFvKDlAi7SANKIJgjlyYLZ661qzY+kVhT5xU8IPZjyVu19yPKb
 GC9baDS2tDl2vCPtpPyXV9YRWoOd0WN4GF/ZeMyISZDRPV0Eo3ruLElhZPJGiKYo
 1G1qtxdignNR8HZZCt19oeAkj7FuLohQKHqknufoM1ToAy25+jfw3j4J8YeS4ntO
 jp7vhSG1k1Ym5wuStVZAXMskxgvn3HCJYr2ihwrTAUiz2bDBIUY1tRFyc+lpdTz0
 0CAGBQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442e8cg4ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 13:13:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509DDES3002039
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 13:13:14 GMT
Received: from [10.206.104.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 05:13:07 -0800
Message-ID: <d23fe626-4025-4a6c-8916-1771641b2a78@quicinc.com>
Date: Thu, 9 Jan 2025 18:43:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-5-08a5efaf4a23@quicinc.com>
 <67mvekrysu2ms5dsvjyh37wbl5dmcnk2r3xnow2e5xeeqahhrr@ar5zsq3wzip3>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <67mvekrysu2ms5dsvjyh37wbl5dmcnk2r3xnow2e5xeeqahhrr@ar5zsq3wzip3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3_pSrayeErXbfbNvNBO-6K67rUMmKZxn
X-Proofpoint-ORIG-GUID: 3_pSrayeErXbfbNvNBO-6K67rUMmKZxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090105
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

On 1/9/2025 1:36 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 09, 2025 at 02:10:01AM +0530, Akhil P Oommen wrote:
>> Add a new schema which extends opp-v2 to support a new vendor specific
>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
>> property called "qcom,opp-acd-level" carries a u32 value recommended
>> for each opp needs to be shared to GMU during runtime.
>>
>> Also, update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml.
>>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  1 +
>>  2 files changed, 98 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>> new file mode 100644
>> index 000000000000..de1f7c6c4f0e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>> @@ -0,0 +1,97 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Adreno compatible OPP supply
>> +
>> +description:
>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
>> +  ACD related information tailored for the specific chipset. This binding
>> +  provides the information needed to describe such a hardware value.
>> +
>> +maintainers:
>> +  - Rob Clark <robdclark@gmail.com>
>> +
> 
> You need select: here. See bot's warnings and other schemas, like
> primecell, how they do it.

Somehow this error is not reproducible on my setup. I have upgraded both
Dtschema (2024.11) and and yamllint.

Anyway, could you please confirm if the below addition would be sufficient?

select:
  required:
    - compatible
  properties:
    compatible:
      contains:
        const: operating-points-v2-adreno

-Akhil

> 
> Best regards,
> Krzysztof
> 

