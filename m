Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E1A68AD9E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 01:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76F810E0F6;
	Sun,  5 Feb 2023 00:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BCA10E0E0;
 Sun,  5 Feb 2023 00:36:39 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3150Tn7g006574; Sun, 5 Feb 2023 00:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WgM0W+aObmmjy1v7Zkc+1t2W1bWQ3m5yY7AOH8yvVGI=;
 b=g3IbTYG9uvuWRxkngKkqQcK2Kn37SC4G9RsqaYgLzbfZZDbgQVlvGRKkzQHJKH4/c4kB
 f57+WIXgq2j5t+pcUbzGc+FzH0+KbXm9OjxNS1KuwJPKgO13NblWUhrbEFLO/J88dvaG
 DcRaRW2jIU6HZ4iIeZYHPYLhybaZ8c1RD5OTKgDLXd5YC4BNE7+CuBpfmFtto2/LknjT
 9ueWQSJdAt19Is+LP6q7ub8wfngGuiT9Q2/UEBPfunzw/e7srEaCt+E/Uawv07Be8v+E
 C9MVfQEBAURpNczVrtEl7QrAusWBpqfbf4MAsNVV1owF3mO79xvGvULFJ+Q2P78nlF1a iw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhfres44a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Feb 2023 00:36:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3150aWOi004564
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 5 Feb 2023 00:36:32 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sat, 4 Feb 2023
 16:36:31 -0800
Message-ID: <42cd459a-2c44-eeb3-ff6f-daac54ae467d@quicinc.com>
Date: Sat, 4 Feb 2023 16:36:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
 <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
 <3754a9a9-8b64-62ae-0b0d-f379debefa16@linaro.org>
 <ddb0de30-9e29-f6f0-028c-48530bee4a6b@quicinc.com>
 <42e6237d-9fae-0679-1354-7df74594a9db@linaro.org>
 <d89a1735-4351-a9b5-c6e3-d0d05af9d283@quicinc.com>
 <6d171f4b-9a49-ea90-8cf3-518bea0964b3@linaro.org>
 <edc1aab6-b38f-c0ec-9339-01117d037ebf@quicinc.com>
 <5d482d65-858f-7c6c-1f93-dabc6e2f4be9@linaro.org>
 <616460ed-2385-cefb-5bb5-491fa42f1e54@quicinc.com>
 <CAA8EJpqEq4Wirj0SmxcJYbiw0taUmbLpC8RYFCzkBfsPxc-aZA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqEq4Wirj0SmxcJYbiw0taUmbLpC8RYFCzkBfsPxc-aZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6Qxuw0zE3bkV1H_WcJeqCataR4yZ16Ze
X-Proofpoint-GUID: 6Qxuw0zE3bkV1H_WcJeqCataR4yZ16Ze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-04_13,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302050001
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/4/2023 4:29 PM, Dmitry Baryshkov wrote:
> On Sun, 5 Feb 2023 at 01:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/4/2023 1:08 PM, Dmitry Baryshkov wrote:
>>> On 04/02/2023 20:35, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 2/4/2023 2:43 AM, Dmitry Baryshkov wrote:
>>>>> On 04/02/2023 07:10, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 2/3/2023 8:10 PM, Dmitry Baryshkov wrote:
>>>>>>> On 04/02/2023 04:43, Abhinav Kumar wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2/3/2023 6:29 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On 04/02/2023 01:35, Abhinav Kumar wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>> Downstream driver uses dpu->caps->smart_dma_rev to update
>>>>>>>>>>> sspp->cap->features with the bit corresponding to the supported
>>>>>>>>>>> SmartDMA
>>>>>>>>>>> version. Upstream driver does not do this, resulting in SSPP
>>>>>>>>>>> subdriver
>>>>>>>>>>> not enbaling setup_multirect callback. Add corresponding
>>>>>>>>>>> SmartDMA SSPP
>>>>>>>>>>> feature bits to dpu hw catalog.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> While reviewing this patch, I had a first hand experience of how
>>>>>>>>>> we are reusing SSPP bitmasks for so many chipsets but I think
>>>>>>>>>> overall you got them right here :)
>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>>> ---
>>>>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
>>>>>>>>>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>> index cf053e8f081e..fc818b0273e7 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>> @@ -21,13 +21,16 @@
>>>>>>>>>>>        (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>>>>>>    #define VIG_SDM845_MASK \
>>>>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3) |\
>>>>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>>>>    #define VIG_SC7180_MASK \
>>>>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED4))
>>>>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED4) |\
>>>>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>>>>    #define VIG_SM8250_MASK \
>>>>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>>>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
>>>>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>>>>    #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>>>>>>>>> @@ -42,6 +45,7 @@
>>>>>>>>>>>    #define DMA_SDM845_MASK \
>>>>>>>>>>>        (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |
>>>>>>>>>>> BIT(DPU_SSPP_QOS_8LVL) |\
>>>>>>>>>>>        BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>>>>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
>>>>>>>>>>>        BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>>>>>>>>>>>    #define DMA_CURSOR_SDM845_MASK \
>>>>>>>>>>
>>>>>>>>>> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other
>>>>>>>>>> chipsets like 8250, 8450, 8550.
>>>>>>>>>>
>>>>>>>>>> At the moment, for visual validation of this series, I only have
>>>>>>>>>> sc7180/sc7280. We are leaving the rest for CI.
>>>>>>>>>>
>>>>>>>>>> Was that an intentional approach?
>>>>>>>>>>
>>>>>>>>>> If so, we will need tested-by tags from folks having
>>>>>>>>>> 8350/8450/8550/sc8280x,qcm2290?
>>>>>>>>>>
>>>>>>>>>> I am only owning the visual validation on sc7280 atm.
>>>>>>>>>
>>>>>>>>> I'm not quite sure what is your intent here. Are there any SoCs
>>>>>>>>> after 845 that do not have SmartDMA 2.5? Or do you propose to
>>>>>>>>> enable SmartDMA only for the chipsets that we can visually test?
>>>>>>>>> That sounds strange.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Yes I was thinking to enable smartDMA at the moment on chipsets
>>>>>>>> which we can validate visually that display comes up. But I am not
>>>>>>>> sure if thats entirely practical.
>>>>>>>>
>>>>>>>> But the intent was I just want to make sure basic display does
>>>>>>>> come up with smartDMA enabled if we are enabling it for all chipsets.
>>>>>>>
>>>>>>> I don't think it is practical or logical. We don't require
>>>>>>> validating other changes on all possible chipsets, so what is so
>>>>>>> different with this one?
>>>>>>>
>>>>>>
>>>>>> Thats because with smartDMA if the programming of stages goes wrong
>>>>>> we could potentially just see a blank screen. Its not about other
>>>>>> changes, this change in particular controls enabling a feature.
>>>>>>
>>>>>> But thats just my thought. I am not going to request to ensure this
>>>>>> or block this for this.
>>>>>>
>>>>>> You can still have my
>>>>>>
>>>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>
>>>>>> But think of the validations that have to be done before we merge it.
>>>>>
>>>>> The usual way: verify as much as feasible and let anybody else
>>>>> complain during the development cycle.
>>>>>
>>>>
>>>> Well, our perspective is to enable the feature on devices on which you
>>>> are able to test and not enable then wait for others to complain.
>>>
>>> This would not be really practical. There are plenty of people who can
>>> test things on obscure platforms, but unfortunately far less amount of
>>> people who tightly follow the development and can track which new
>>> feature applies to a particular platform. I hope to be able to fix that
>>> slightly with the hw catalog rework. However enabling features on other
>>> platforms definitely requires more knowledge than simply testing the
>>> kernel.
>>>
>>>>
>>>> I did not say test all devices. My point was to enable smartDMA on
>>>> devices which we are able to test.
>>>>
>>>> There are other examples of this, like inline rotation, writeback etc.
>>>> which are at the moment enabled only on devices which QC or others
>>>> have tested on.
>>>
>>> But at the time it was added, inline rotation 2.0 could only be
>>> supported on sc7280. Probably we should expand it not to sc8280xp and
>>> sm8[345]50.
>>>
>>> For WB I don't remember which platforms were supported at the moment it
>>> was added. But it's also worth expanding support to new platforms.
>>>
>>> And, as we speak about testing, is there an easy way to setup the plane
>>> with UBWC format modifier? Also, did the WB support patches land into
>>> libdrm?
>>>
>>
>> I will check the compositor code and update you on the UWBC format
>> modifier as I am not too familiar with it.
> 
> Ideally it would be nice to support ubwc planes in some simple tool,
> e.g. modetest.
> 
>>
>> libdrm always supported virtual encoder
>> https://github.com/grate-driver/libdrm/blob/master/include/drm/drm_mode.h#L352
>>
>> What other support patches are needed? Right now we only use IGT to
>> validate writeback.
> 
> I remember there was a patchset to make modeset to support using
> writeback. What was its fate?
> 

Once our intern finished his internship, noone could take up the pending 
review comments after that so its yet to be merged.

https://patchwork.kernel.org/project/dri-devel/list/?series=667290&archive=both

Once more item to the to-do list.

>>
>>>> So when i said my suggestion was not practical, yes because if you
>>>> want to go ahead with this change in the current form, you would have
>>>> to validate all the chipsets as you are enabling smartDMA on all of them.
>>>>
>>>> If you enable smartDMA only on the chipsets you OR others can validate
>>>> and give Tested-by for like I was planning to do for sc7280, then I am
>>>> not sure why it doesnt sound logical.
>>>>
>>>> But like I said, thats my perspective. I will let you decide as you
>>>> would know how confident you are with this getting enabled for all
>>>> chipsets upstream.
>>>
>>> I'd say, that once tested on some of the platforms and granted that even
>>> smalled (qcm2290, sm6115) platforms support smartdma, it will be safe to
>>> enable smart DMA globablly for every SoC >= sdm845. If I remember
>>> correctly, msm8998 (and sdm660/630) support smartdma/rect only on DMA
>>> planes. Is it correct?
>>>
>>>
>> Yes thats right msm8998 supports smartdma only on DMA sspps.
> 
> Good
> 
