Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77E69DA675
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 12:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D54810E227;
	Wed, 27 Nov 2024 11:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LwvgfM4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0993310E227;
 Wed, 27 Nov 2024 11:03:01 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR8VR3L014036;
 Wed, 27 Nov 2024 11:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xxTVMs7EiXRpQddOUj2sdWVYYc7JjTdN36bHFOB8yKs=; b=LwvgfM4Q3GBPUUVx
 VmLI7+nb/xywNu4cBojhxosuivySKcfG7uEMuEef71TbaRu9csFd6mG9M9cedqzO
 1LoXLTfc6IYes9G4OvW+zwU5RNrfOXmYq8W1orzauNmLvjVpvLtKTQOEyN4Qjn2l
 gUAEMu2OsQ9FJxUe0uduB4ilGk0ssKcyPPSqVEa459eNYxE7E0zCB+/Q/oqkowJA
 whbTXvFPPh1+xhgvL+I4lD+FMmZBiTfU2xpJiIp7MJDYWRn7/yrzssJPQE33hkfL
 tM08M0UeCLuNTBzRIQ5/ZCwrzwSHgiJRqOVzY4wBpEK6yX5pbuL+LUzt8DnRAlC0
 WUHeSw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435epqb8tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 11:02:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARB2s8Z030733
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 11:02:54 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 03:02:48 -0800
Message-ID: <f433283d-e203-41f7-acc6-59fe606722a5@quicinc.com>
Date: Wed, 27 Nov 2024 19:02:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Maxime Ripard <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, "Rob
 Clark" <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, <freedreno@lists.freedesktop.org>,
 "Simona Vetter" <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <devicetree@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
 <173269567235.2233485.7286772244329561840.robh@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <173269567235.2233485.7286772244329561840.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: asWNzpC9PAqHrSdI-5PoY-sJBBxeMZ-4
X-Proofpoint-ORIG-GUID: asWNzpC9PAqHrSdI-5PoY-sJBBxeMZ-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270089
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



On 2024/11/27 16:21, Rob Herring (Arm) wrote:
> 
> On Wed, 27 Nov 2024 15:05:01 +0800, Yongxing Mou wrote:
>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 239 +++++++++++++++++++++
>>   1 file changed, 239 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dts:26:18: fatal error: dt-bindings/clock/qcom,qcs8300-gcc.h: No such file or directory
>     26 |         #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
Thank you for your checking. I rechecked this file and indeed found some 
issues. I will fix them in the next patchset. But i did not see issues 
related to this header file in local. Maybe it is dependency or tool 
issues. I will and update tool and recheck this issue and fix it in the 
next patchset.

