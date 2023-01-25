Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2EF67A779
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A3B10E0B7;
	Wed, 25 Jan 2023 00:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D2910E0AB;
 Wed, 25 Jan 2023 00:22:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30ONp4t2003555; Wed, 25 Jan 2023 00:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wuOEKONNmcrNMckJ3kmfj0LEpKYQ9vIZQCCwYwMwGRU=;
 b=aIr2DBVsbqvBTqOi+jipiZO5N14ViwGpVKp7uY3iFSEMdvdmkMKQn9fqZFNRI0lnYe3a
 DMovKjAC+qk1d8xPQfDnjXu0ZSXlHkG8GBn6iDbg9XZRDJQKrTAlkM2iyNATsfaQOzKv
 kUe/xhvqZpz57vWfMiysIPU4lxyPbLOzAmeDshDs+8gfbd4tdNRYxSxRLn4Y4YvrOQ/e
 LTQA4cgem0Nhmc3/tN8UmO4L7DmwzG2awCSG/CzWguBh6DRgUXd9yxDLH4kF3pTAzr34
 fwKlho28rGs1YIVsoAE2zMoLBVAaHdtxMdgjqu72G4DWCEkK3YsccGegcLAjrwggJLrP Gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nar2n84rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 00:22:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30P0MoAP000856
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 00:22:50 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 16:22:49 -0800
Message-ID: <1642c43b-9d71-17ee-402d-d1e415e1ecc8@quicinc.com>
Date: Tue, 24 Jan 2023 16:22:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: disable features unsupported by QCM2290
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230123071145.3056242-1-dmitry.baryshkov@linaro.org>
 <ecec7adb-a1ab-ba38-c38a-26f23f81cf68@quicinc.com>
 <df8a130f-2020-833c-d4f1-088c1fd7e5ef@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <df8a130f-2020-833c-d4f1-088c1fd7e5ef@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JxnJ1x4bkW5uYOCksTVT-0SKrR-43OVV
X-Proofpoint-GUID: JxnJ1x4bkW5uYOCksTVT-0SKrR-43OVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301250000
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/24/2023 12:22 AM, Dmitry Baryshkov wrote:
> On 24/01/2023 03:32, Abhinav Kumar wrote:
>>
>>
>> On 1/22/2023 11:11 PM, Dmitry Baryshkov wrote:
>>> QCM2290 doesn't seem to support reg-dma, smart-dma, UBWC, CDP, exclusion
>>> rectangles and CSC. Drop corresponding features being incorrectly
>>> enabled for qcm2290.
>>>
>>
>> Can you please point me to which vendor DT you are referring to for this?
>>
>> CSC is supported on the VIG SSPPs from what I can see.
> 
> https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi 
> 
> 
> No CSC, smart-dma, excl-rect, CDP, etc.

Sorry I am missing something here.

It has one Vig and one DMA

https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L68

If Vig is present, CSC is supported.

Even for smart DMA I can see it supported 
https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L76 
on the DMA SSPP.

Same for excl rectangle too 
https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L74


> 
>> QCM2290 should be using the same MDP version as 6115 from the HW version.
> 
> It is 6.3 vs 6.5 if I remember correctly.
> 
>>
>>
>>> Cc: Loic Poulain <loic.poulain@linaro.org>
>>> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
>>>   1 file changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 289fb11f99d1..1c3ffa922794 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -12,10 +12,14 @@
>>>   #include "dpu_hw_catalog.h"
>>>   #include "dpu_kms.h"
>>> -#define VIG_MASK \
>>> +#define VIG_BASE_MASK \
>>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>>> +    BIT(DPU_SSPP_TS_PREFILL))
>>> +
>>> +#define VIG_MASK \
>>> +    (VIG_BASE_MASK | \
>>>       BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
>>> -    BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
>>> +    BIT(DPU_SSPP_EXCL_RECT))
>>>   #define VIG_MSM8998_MASK \
>>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>> @@ -29,7 +33,7 @@
>>>   #define VIG_SM8250_MASK \
>>>       (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>> -#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>> +#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>   #define DMA_MSM8998_MASK \
>>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>>> @@ -50,6 +54,10 @@
>>>   #define DMA_CURSOR_MSM8998_MASK \
>>>       (DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
>>> +#define DMA_QCM2290_MASK \
>>> +    (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>>> +    BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1))
>>> +
>>>   #define MIXER_MSM8998_MASK \
>>>       (BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
>>> @@ -316,8 +324,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
>>>   static const struct dpu_caps qcm2290_dpu_caps = {
>>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>       .max_mixer_blendstages = 0x4,
>>> -    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
>>> -    .ubwc_version = DPU_HW_UBWC_VER_20,
>>>       .has_dim_layer = true,
>>>       .has_idle_pc = true,
>>>       .max_linewidth = 2160,
>>> @@ -1384,7 +1390,7 @@ static const struct dpu_sspp_sub_blks 
>>> qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>>>   static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>>>       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
>>>            qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_QCM2290_MASK,
>>>            qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>>   };
>>> @@ -2836,8 +2842,6 @@ static const struct dpu_mdss_cfg 
>>> qcm2290_dpu_cfg = {
>>>       .intf = qcm2290_intf,
>>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>>       .vbif = sdm845_vbif,
>>> -    .reg_dma_count = 1,
>>> -    .dma_cfg = &sdm845_regdma,
>>>       .perf = &qcm2290_perf_data,
>>>       .mdss_irqs = IRQ_SC7180_MASK,
>>>   };
> 
