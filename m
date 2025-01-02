Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB019FF803
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 11:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578D410E3EE;
	Thu,  2 Jan 2025 10:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Mju+9lfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D548410E23A;
 Thu,  2 Jan 2025 10:29:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5024D4Ge031425;
 Thu, 2 Jan 2025 10:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g4APIvTeZywppftz7Aj+X4HSlzNOXiTdcpFnY81F0w0=; b=Mju+9lflaDc7iX4v
 67Ri0u/4r/BxPDWi6f1fH7YcKgsI5AKbQjYZImzoaCAS2T0dAOwf/WKvk5H6Jpt5
 DVSyWI9gO8fA+DJAdryUEXhHdJyttsOJKZl1Pm9gXso5LnFEJWXUDBnpsyOXDK2V
 SLvX0LICAzcKjJXKfZVBo/DTtDeL3EeoFEmkWEfp1XL5eXcj9pOe6z60IkeBVgZU
 EFDY7R0sb/Yi/h/mVvOSnmrxXxRQGSWuejzyXwA+60JokYWaHxqdhM2IJfeWqjkd
 Vc564uwyEkBip+PVtl/clHnsiLSDYVSI2g5ohamKVpBQPtYxzDr9+5ZBsbH9VvJM
 mjTgBA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wkjt8p2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jan 2025 10:29:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 502ASxH7015792
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Jan 2025 10:28:59 GMT
Received: from [10.216.23.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 02:28:52 -0800
Message-ID: <c16aeecd-8321-4df2-9db5-e9d5117200da@quicinc.com>
Date: Thu, 2 Jan 2025 15:58:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
To: Konrad Dybcio <konradybcio@gmail.com>, "Rob Herring (Arm)"
 <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Conor Dooley <conor+dt@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, <devicetree@vger.kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, Sean Paul
 <sean@poorly.run>, <freedreno@lists.freedesktop.org>, Bjorn Andersson
 <andersson@kernel.org>, <linux-pm@vger.kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 Rob Clark <robdclark@gmail.com>, <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, "David Airlie" <airlied@gmail.com>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-4-3ba73660e9ca@quicinc.com>
 <173559754709.2660868.7488137827927170444.robh@kernel.org>
 <a0fc7b6c-e68d-42a7-aff4-a11c88495f67@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <a0fc7b6c-e68d-42a7-aff4-a11c88495f67@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hX9BJLSvBDufzPZs1YUPaperp425gr50
X-Proofpoint-ORIG-GUID: hX9BJLSvBDufzPZs1YUPaperp425gr50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501020090
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

On 12/31/2024 3:09 PM, Konrad Dybcio wrote:
> On 30.12.2024 11:25 PM, Rob Herring (Arm) wrote:
>>
>> On Tue, 31 Dec 2024 02:41:05 +0530, Akhil P Oommen wrote:
>>> Add a new schema which extends opp-v2 to support a new vendor specific
>>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
>>> property called "qcom,opp-acd-level" carries a u32 value recommended
>>> for each opp needs to be shared to GMU during runtime.
>>>
>>> Also, update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml.
>>>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
>>>  MAINTAINERS                                        |  1 +
>>>  2 files changed, 98 insertions(+)
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml: ignoring, error parsing file
>> Traceback (most recent call last):
>>   File "/usr/bin/yamllint", line 33, in <module>
>>     sys.exit(load_entry_point('yamllint==1.29.0', 'console_scripts', 'yamllint')())
>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>   File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 228, in run
>>     prob_level = show_problems(problems, file, args_format=args.format,
> 
> You need to shift the closing '}':
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> index b7874f43aaf6..46fbffaf0a61 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> @@ -93,5 +93,4 @@ examples:
>              opp-peak-kBps = <2136719>;
>              /* Intentionally left out qcom,opp-acd-level property here */
>          };
> -
> -};
> +    };
> 

Thanks. Will update.

-Akhil

> 
> Konrad

