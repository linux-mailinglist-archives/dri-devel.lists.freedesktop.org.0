Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C77665A0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9B810E667;
	Fri, 28 Jul 2023 07:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7382E10E0E6;
 Thu, 27 Jul 2023 12:22:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36R9bmq4019837; Thu, 27 Jul 2023 12:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ShKGmiRxB3jreFZnddt7i7eSbG6FvqDQLB3DqUUxvHw=;
 b=bIwXi6M2vd8NygZ19MXgzEvn5JeC8pupn4HfSO0GrtcvqXn0gbTYtdO69vETENPh2wgc
 egokng4gUs6BXm2/bKsniCexTrz8s1OoV8MgjmdTSNRK+oAd1LPAeKEmWIoy7JpbRerm
 M/kGQdd2ANNIdHzWa0YDqGjOQILbgOG7n/e1HcbaPjmiS0TSrzYyaLWNun+IOJ+c0gK4
 Lo87jBoq0jtvVeOLINqUUtjkkdOPWNb9WJLucAZzEjFF/dfasPzKY5pS+HBwf9Chwq/o
 geMtKDyUDjeqKgEagYLLuFC2vK4IgAOMvfqD+qeF724PWubvwH11Y1OuCDjgQggF3SqS 6Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3n2k8hcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 12:21:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36RCLsGT016569
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 12:21:55 GMT
Received: from [10.216.40.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 05:21:42 -0700
Message-ID: <432ab1d3-0f9e-4072-ff4d-6362886584b8@quicinc.com>
Date: Thu, 27 Jul 2023 17:51:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] dt-bindings: qcom: Update RPMHPD entries for some SoCs
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh@kernel.org>
References: <1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com>
 <169045659774.1058731.6391693092002547810.robh@kernel.org>
 <fa84ec4f-bdb9-dace-c56a-46174a9b47ee@quicinc.com>
 <2edb92b8-a6a8-c115-757c-daccef6be5f0@linaro.org>
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
In-Reply-To: <2edb92b8-a6a8-c115-757c-daccef6be5f0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 52ITVeTb3FWiH_aNJVretgsD4WZy4OTk
X-Proofpoint-ORIG-GUID: 52ITVeTb3FWiH_aNJVretgsD4WZy4OTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270110
X-Mailman-Approved-At: Fri, 28 Jul 2023 07:44:51 +0000
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
Cc: ulf.hansson@linaro.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_vgarodia@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 marijn.suijten@somainline.org, linux-clk@vger.kernel.org, rfoss@kernel.org,
 jonathan@marek.ca, stanimir.k.varbanov@gmail.com, agross@kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 bhupesh.sharma@linaro.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, mchehab@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, mathieu.poirier@linaro.org,
 sboyd@kernel.org, andersson@kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 vladimir.zapolskiy@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/27/2023 5:15 PM, Krzysztof Kozlowski wrote:
> On 27/07/2023 13:19, Rohit Agarwal wrote:
>> On 7/27/2023 4:46 PM, Rob Herring wrote:
>>> On Thu, 27 Jul 2023 14:39:13 +0530, Rohit Agarwal wrote:
>>>> Update the RPMHPD references with new bindings defined in rpmhpd.h
>>>> for Qualcomm SoCs SM8[2345]50.
>>>>
>>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml   | 4 ++--
>>>>    Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml  | 4 ++--
>>>>    Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml    | 4 ++--
>>>>    Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml   | 4 ++--
>>>>    Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml  | 4 ++--
>>>>    Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml   | 4 ++--
>>>>    Documentation/devicetree/bindings/clock/qcom,videocc.yaml         | 4 ++--
>>>>    .../devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml          | 4 ++--
>>>>    .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 8 ++++----
>>>>    .../devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml          | 4 ++--
>>>>    .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 6 +++---
>>>>    .../devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml          | 4 ++--
>>>>    .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++----
>>>>    .../devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml          | 4 ++--
>>>>    .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++----
>>>>    Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml    | 4 ++--
>>>>    Documentation/devicetree/bindings/mmc/sdhci-msm.yaml              | 4 ++--
>>>>    Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 6 +++---
>>>>    18 files changed, 44 insertions(+), 44 deletions(-)
>>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dts:21:18: fatal error: dt-bindings/power/qcom,rpmhpd.h: No such file or directory
>>>      21 |         #include <dt-bindings/power/qcom,rpmhpd.h>
>>>         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> compilation terminated.
>>> make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dtb] Error 1
>>> make[2]: *** Waiting for unfinished jobs....
>>> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
>>> make: *** [Makefile:234: __sub-make] Error 2
>>>
>>> doc reference errors (make refcheckdocs):
>>>
>>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com
>>>
>>> The base for the series is generally the latest rc1. A different dependency
>>> should be noted in *this* patch.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit after running the above command yourself. Note
>>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>>> your schema. However, it must be unset to test all examples with your schema.
>> This should be ignored as the patch that creates the new header is
>> already applied.
>> Please follow this series
>>
>> https://lore.kernel.org/all/1689744162-9421-1-git-send-email-quic_rohiagar@quicinc.com/
> Please mention the dependency in patch changelog ---, so it is obvious
> for people applying it and also for the bot.
Sure. Will send a cover letter for this patch mentioning the changelogs 
and will
keep the version as v2 since there no change at all in the patch.

Thanks,
Rohit.
> Best regards,
> Krzysztof
>
