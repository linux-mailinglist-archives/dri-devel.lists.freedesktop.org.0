Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875B67C12B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 00:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16E110E3AC;
	Wed, 25 Jan 2023 23:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064F110E3AC;
 Wed, 25 Jan 2023 23:50:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30PNddZo005868; Wed, 25 Jan 2023 23:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Xm7+7VfxhSdrQbLq2D/SLlWeNKxF8IKdK4IuGO82f44=;
 b=h8IBku641I1vuC2qS6iS7/yB3Qf/v1+djq2efDDDlNoUSAlt+iKKSG35VHMaBM2jWSZv
 FAjmkU3Z6lyTpmDjfk1E81neamDW6fmdsRfRrDlUcJ3nA+VJyOt1f5gvI0vmwzJill60
 kP9p9NO3t9dPiztSe/OhV9vLecvOIK0GxJCB2CAt9f8MNs7RdgVYYE3+gmf7V66D39/F
 W5Dxfc8FX0kqu7m3f17XgCtfPXH1DypxSQFFvJixRmXV34rrhfzKb1irmQBxzNsY1WH9
 0oPAekeX7UodahwxEo6FTgsYWPMlOqrRt7o7FgZfOuO9IbXAcuB1ukJJyY/Bka2k9SFQ IQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3najkhb2xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 23:50:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30PNo5Tt028834
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 23:50:05 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 15:50:04 -0800
Message-ID: <aac9b347-eef8-7aaf-3a5f-4da3a4ede66e@quicinc.com>
Date: Wed, 25 Jan 2023 15:50:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: disable features unsupported by
 QCM2290
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230123071145.3056242-1-dmitry.baryshkov@linaro.org>
 <ecec7adb-a1ab-ba38-c38a-26f23f81cf68@quicinc.com>
 <df8a130f-2020-833c-d4f1-088c1fd7e5ef@linaro.org>
 <1642c43b-9d71-17ee-402d-d1e415e1ecc8@quicinc.com>
 <CAA8EJpo+ARnJ29BrOVkrg1FkTOVKYXQJiqAqhBzhZyNVYZw2qQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpo+ARnJ29BrOVkrg1FkTOVKYXQJiqAqhBzhZyNVYZw2qQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dGhrVA86_Ulkhyaez6-UaWz0TCH350bB
X-Proofpoint-GUID: dGhrVA86_Ulkhyaez6-UaWz0TCH350bB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_13,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250212
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
Cc: Loic Poulain <loic.poulain@linaro.org>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/24/2023 10:46 PM, Dmitry Baryshkov wrote:
> Hi,
> 
> On Wed, 25 Jan 2023 at 02:22, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> On 1/24/2023 12:22 AM, Dmitry Baryshkov wrote:
>>> On 24/01/2023 03:32, Abhinav Kumar wrote:
>>>> On 1/22/2023 11:11 PM, Dmitry Baryshkov wrote:
>>>>> QCM2290 doesn't seem to support reg-dma, smart-dma, UBWC, CDP, exclusion
>>>>> rectangles and CSC. Drop corresponding features being incorrectly
>>>>> enabled for qcm2290.
>>>>>
>>>>
>>>> Can you please point me to which vendor DT you are referring to for this?
>>>>
>>>> CSC is supported on the VIG SSPPs from what I can see.
>>>
>>> https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi
>>>
>>>
>>> No CSC, smart-dma, excl-rect, CDP, etc.
>>
>> Sorry I am missing something here.
>>
>> It has one Vig and one DMA
>>
>> https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L68
> 
> Correct
> 
>>
>> If Vig is present, CSC is supported.
> 
> This actually puzzled me. Usually the dtsi has qcom,sde-sspp-csc-off
> and qcom,sde-csc-type properties. But not in this case.
> 
>>
>> Even for smart DMA I can see it supported
>> https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L76
>> on the DMA SSPP.
>>
>> Same for excl rectangle too
>> https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L74
> 
> Ack, my mistake. Maybe I was looking at the wrong dtsi then (or just
> mixed something). I'll add them back. And I see that CDP is also
> there.
> 
> So, this leaves us only with the question regarding CSC. Could you
> please doublecheck it?
> 
I went through the internal documents.

This chipset supports only RGB formats for Vig pipe and hence there is 
no CSC (surprise for me too).


> I also don't see the UBWC (qcom,sde-ubwc-version) and regdma
> (qcom,sde-reg-dma-off) properties. Are corresponding features present
> on the QCM2290?
> 

Yes UBWC is also not supported.

You can now go ahead and update v2.

>>>
>>>> QCM2290 should be using the same MDP version as 6115 from the HW version.
>>>
>>> It is 6.3 vs 6.5 if I remember correctly.
>>>
>>>>
>>>>
>>>>> Cc: Loic Poulain <loic.poulain@linaro.org>
>>>>> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
>>>>>    1 file changed, 12 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> index 289fb11f99d1..1c3ffa922794 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> @@ -12,10 +12,14 @@
>>>>>    #include "dpu_hw_catalog.h"
>>>>>    #include "dpu_kms.h"
>>>>> -#define VIG_MASK \
>>>>> +#define VIG_BASE_MASK \
>>>>>        (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>>>>> +    BIT(DPU_SSPP_TS_PREFILL))
>>>>> +
>>>>> +#define VIG_MASK \
>>>>> +    (VIG_BASE_MASK | \
>>>>>        BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
>>>>> -    BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
>>>>> +    BIT(DPU_SSPP_EXCL_RECT))
>>>>>    #define VIG_MSM8998_MASK \
>>>>>        (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>> @@ -29,7 +33,7 @@
>>>>>    #define VIG_SM8250_MASK \
>>>>>        (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>>>> -#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>>> +#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>>>    #define DMA_MSM8998_MASK \
>>>>>        (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>>>>> @@ -50,6 +54,10 @@
>>>>>    #define DMA_CURSOR_MSM8998_MASK \
>>>>>        (DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
>>>>> +#define DMA_QCM2290_MASK \
>>>>> +    (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>>>>> +    BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1))
>>>>> +
>>>>>    #define MIXER_MSM8998_MASK \
>>>>>        (BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
>>>>> @@ -316,8 +324,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
>>>>>    static const struct dpu_caps qcm2290_dpu_caps = {
>>>>>        .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>>        .max_mixer_blendstages = 0x4,
>>>>> -    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
>>>>> -    .ubwc_version = DPU_HW_UBWC_VER_20,
>>>>>        .has_dim_layer = true,
>>>>>        .has_idle_pc = true,
>>>>>        .max_linewidth = 2160,
>>>>> @@ -1384,7 +1390,7 @@ static const struct dpu_sspp_sub_blks
>>>>> qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>>>>>    static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>>>>>        SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
>>>>>             qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>>>>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>>>>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_QCM2290_MASK,
>>>>>             qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>>>>    };
>>>>> @@ -2836,8 +2842,6 @@ static const struct dpu_mdss_cfg
>>>>> qcm2290_dpu_cfg = {
>>>>>        .intf = qcm2290_intf,
>>>>>        .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>>>>        .vbif = sdm845_vbif,
>>>>> -    .reg_dma_count = 1,
>>>>> -    .dma_cfg = &sdm845_regdma,
>>>>>        .perf = &qcm2290_perf_data,
>>>>>        .mdss_irqs = IRQ_SC7180_MASK,
>>>>>    };
>>>
> 
> 
> 
