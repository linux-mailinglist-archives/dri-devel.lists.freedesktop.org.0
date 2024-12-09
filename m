Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FD69E8903
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 02:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251AF10E289;
	Mon,  9 Dec 2024 01:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CRdQVIiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2868610E27D;
 Mon,  9 Dec 2024 01:44:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9017xs012697;
 Mon, 9 Dec 2024 01:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mONfncm9hTek7jcougy3xSCm6rv4bmG3B6zaPol5p8s=; b=CRdQVIiVJoyJvgfP
 sNwJrCXjY0zLONqgfds4bqv3EyyGmMjgD45okpHdukbx7fb/MH9gXYxIcu0vHCgE
 aeDkX90GyuwF1jPUR6M3EUuKD3VdqsFPKG7WmXXi1JcgtP7fcncdYF08ZZO6HN64
 r/bvWnBERBZ4xPHX50JSRRhexDQ2+eNk6ni/dyM7j/gRou9MLLBI7M5anFUPhAdV
 7ZYXBzbSOO0zabPL1Y7qvJFG150maTpp4OiMs/Cq2skBSQLpNHssfpC3Z6L1Jnjm
 7ly3FVDqjZW6GfZn4scPciwGlimNLoIqBUDwrB8M56pB+P+0KhXS9q1fkqZo0Iog
 2MgtFA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetk03m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 01:44:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B91iSBn020361
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Dec 2024 01:44:28 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 17:44:22 -0800
Message-ID: <afd00fdf-af62-46b5-9131-ed360a93e094@quicinc.com>
Date: Mon, 9 Dec 2024 09:44:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: Add SM6150 support
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, "Li Liu" <quic_lliu6@quicinc.com>,
 Xiangxu Yin <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-5-35252e3a51fe@quicinc.com>
 <c1b2fe04-e43e-4ab7-b0f8-2bb2ce6e1313@quicinc.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <c1b2fe04-e43e-4ab7-b0f8-2bb2ce6e1313@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FwBFuB_mvjA8on_c0eMLzgSptP0zqSaY
X-Proofpoint-ORIG-GUID: FwBFuB_mvjA8on_c0eMLzgSptP0zqSaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090012
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



On 2024/12/7 4:17, Abhinav Kumar wrote:
> 
> 
> On 11/22/2024 1:56 AM, Fange Zhang wrote:
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> Add definitions for the display hardware used on the Qualcomm SM6150
>> platform.
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 263 +++++++++++ 
>> ++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>   4 files changed, 266 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/ 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..e8b7f694b885d69a9bbfaa85b0faf0c7af677a75
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>> @@ -0,0 +1,263 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef _DPU_5_3_SM6150_H
>> +#define _DPU_5_3_SM6150_H
>> +
>> +
> 
> <snip>
> 
>> +static const struct dpu_sspp_cfg sm6150_sspp[] = {
>> +    {
>> +        .name = "sspp_0", .id = SSPP_VIG0,
>> +        .base = 0x4000, .len = 0x1f0,
>> +        .features = VIG_SDM845_MASK,
> 
> This is not correct. Smartdma is supported on this chipset on both Vig 
> and DMA SSPPs.
> 
> Please use VIG_SDM845_MASK_SDMA and DMA_SDM845_MASK_SDMA respectively.
Got it, will replace them in next patch
> 
> 
>> +        .sblk = &dpu_vig_sblk_qseed3_2_4,
>> +        .xin_id = 0,
>> +        .type = SSPP_TYPE_VIG,
>> +        .clk_ctrl = DPU_CLK_CTRL_VIG0,
>> +    }, {
>> +        .name = "sspp_8", .id = SSPP_DMA0,
>> +        .base = 0x24000, .len = 0x1f0,
>> +        .features = DMA_SDM845_MASK,
>> +        .sblk = &dpu_dma_sblk,
>> +        .xin_id = 1,
>> +        .type = SSPP_TYPE_DMA,
>> +        .clk_ctrl = DPU_CLK_CTRL_DMA0,
>> +    }, {
>> +        .name = "sspp_9", .id = SSPP_DMA1,
>> +        .base = 0x26000, .len = 0x1f0,
>> +        .features = DMA_SDM845_MASK,
>> +        .sblk = &dpu_dma_sblk,
>> +        .xin_id = 5,
>> +        .type = SSPP_TYPE_DMA,
>> +        .clk_ctrl = DPU_CLK_CTRL_DMA1,
>> +    }, {
>> +        .name = "sspp_10", .id = SSPP_DMA2,
>> +        .base = 0x28000, .len = 0x1f0,
>> +        .features = DMA_CURSOR_SDM845_MASK_SDMA,
>> +        .sblk = &dpu_dma_sblk,
>> +        .xin_id = 9,
>> +        .type = SSPP_TYPE_DMA,
>> +        .clk_ctrl = DPU_CLK_CTRL_DMA2,
>> +    }, {
>> +        .name = "sspp_11", .id = SSPP_DMA3,
>> +        .base = 0x2a000, .len = 0x1f0,
>> +        .features = DMA_CURSOR_SDM845_MASK_SDMA,
>> +        .sblk = &dpu_dma_sblk,
>> +        .xin_id = 13,
>> +        .type = SSPP_TYPE_DMA,
>> +        .clk_ctrl = DPU_CLK_CTRL_DMA3,
>> +    },
>> +};
>> +
> 
> <snip>

