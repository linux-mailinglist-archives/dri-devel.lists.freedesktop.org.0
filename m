Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE168A850
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 06:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1241610E0A9;
	Sat,  4 Feb 2023 05:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB0210E0A9;
 Sat,  4 Feb 2023 05:10:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3144tIu0013623; Sat, 4 Feb 2023 05:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=znG4lOz+eAJRJ3vPw67x7mxeSqeUpXZOVsl/k+Y3mzQ=;
 b=EuBdUOXZrwd5LrDwH5wAWNJjn0ntwps8Ikf5B431qrU4wQc/sVe8LOHfecok2m0s5dFH
 9Mozrq0uUqx3bb22hA9XhR9b/56XqV95d6RnEtEDN2nwgVAqAUX2va5oLXEe91ZxvsHR
 kgCydfZ+r88WHY8BjcxGphFfD/KkrNlJcdKybrWjMHPQq79HE2zEXKLw5TfdigVxpNrO
 5Iv2KTVMjp6/1Uy6yr6CWgsTYcsoMG0Nge631Kq0iXuuRRJyb8bXEnw/sjFCIDx74x6Y
 DkYykev045RqpabBqG0ed2zX8YXbib6ZDNcjGtxCKLgXOSpNzqGdNeqMc//YA9o6oAFL 3g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhd2q88gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 04 Feb 2023 05:10:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3145AilW019532
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 4 Feb 2023 05:10:44 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 21:10:43 -0800
Message-ID: <d89a1735-4351-a9b5-c6e3-d0d05af9d283@quicinc.com>
Date: Fri, 3 Feb 2023 21:10:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
 <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
 <3754a9a9-8b64-62ae-0b0d-f379debefa16@linaro.org>
 <ddb0de30-9e29-f6f0-028c-48530bee4a6b@quicinc.com>
 <42e6237d-9fae-0679-1354-7df74594a9db@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <42e6237d-9fae-0679-1354-7df74594a9db@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Otk24bxTQX8lK7-mjiyfDG5ws8EYN5IC
X-Proofpoint-GUID: Otk24bxTQX8lK7-mjiyfDG5ws8EYN5IC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-04_01,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302040047
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/2023 8:10 PM, Dmitry Baryshkov wrote:
> On 04/02/2023 04:43, Abhinav Kumar wrote:
>>
>>
>> On 2/3/2023 6:29 PM, Dmitry Baryshkov wrote:
>>> On 04/02/2023 01:35, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>> Downstream driver uses dpu->caps->smart_dma_rev to update
>>>>> sspp->cap->features with the bit corresponding to the supported 
>>>>> SmartDMA
>>>>> version. Upstream driver does not do this, resulting in SSPP subdriver
>>>>> not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
>>>>> feature bits to dpu hw catalog.
>>>>>
>>>>
>>>> While reviewing this patch, I had a first hand experience of how we 
>>>> are reusing SSPP bitmasks for so many chipsets but I think overall 
>>>> you got them right here :)
>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
>>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> index cf053e8f081e..fc818b0273e7 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> @@ -21,13 +21,16 @@
>>>>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>   #define VIG_SDM845_MASK \
>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>> BIT(DPU_SSPP_SCALER_QSEED3) |\
>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>   #define VIG_SC7180_MASK \
>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>> BIT(DPU_SSPP_SCALER_QSEED4) |\
>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>   #define VIG_SM8250_MASK \
>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>>> @@ -42,6 +45,7 @@
>>>>>   #define DMA_SDM845_MASK \
>>>>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | 
>>>>> BIT(DPU_SSPP_QOS_8LVL) |\
>>>>>       BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
>>>>>       BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>>>>>   #define DMA_CURSOR_SDM845_MASK \
>>>>
>>>> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other chipsets 
>>>> like 8250, 8450, 8550.
>>>>
>>>> At the moment, for visual validation of this series, I only have 
>>>> sc7180/sc7280. We are leaving the rest for CI.
>>>>
>>>> Was that an intentional approach?
>>>>
>>>> If so, we will need tested-by tags from folks having 
>>>> 8350/8450/8550/sc8280x,qcm2290?
>>>>
>>>> I am only owning the visual validation on sc7280 atm.
>>>
>>> I'm not quite sure what is your intent here. Are there any SoCs after 
>>> 845 that do not have SmartDMA 2.5? Or do you propose to enable 
>>> SmartDMA only for the chipsets that we can visually test? That sounds 
>>> strange.
>>>
>>
>> Yes I was thinking to enable smartDMA at the moment on chipsets which 
>> we can validate visually that display comes up. But I am not sure if 
>> thats entirely practical.
>>
>> But the intent was I just want to make sure basic display does come up 
>> with smartDMA enabled if we are enabling it for all chipsets.
> 
> I don't think it is practical or logical. We don't require validating 
> other changes on all possible chipsets, so what is so different with 
> this one?
> 

Thats because with smartDMA if the programming of stages goes wrong we 
could potentially just see a blank screen. Its not about other changes, 
this change in particular controls enabling a feature.

But thats just my thought. I am not going to request to ensure this or 
block this for this.

You can still have my

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

But think of the validations that have to be done before we merge it.
