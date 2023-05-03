Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544096F5E9D
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 20:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECAA10E339;
	Wed,  3 May 2023 18:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDE310E338;
 Wed,  3 May 2023 18:54:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343HM27F026874; Wed, 3 May 2023 18:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YEjZh2qjCaw25NotY4AtjmYiPaQuTZxGnA7/U7gZSSM=;
 b=DDJ+G6LTjC7tLcCwFyomdj2E5EAK+SH3Ltj33/FNBkWZQmkcs4M/FCNwDjxTzVatM39f
 69QMGNdeksrIQdi/avv4H7CJhVVcyJkZornOo4b+86FMAhvKRqzw8+h/CeQvoKCmTXuc
 xJE31QVa5mYD69eqNv4xd22RJg68vZChJ20V/TtENTFFhw3wp9oiSr5etf7UQfHxvztb
 vgao6FouxqQnvC8Uc+Jq9JJqQ9Ip3JL/APaVcP60CGBQQiP0FxJ1qTM41nQb1UAGNhj8
 vUb/eCXAlCsbvNiBGUwT/q9G/6qIIJrrB8AO4XtG3Er+Vq+VYlNznFppJ4F2pdC2JHBh cQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbae92gky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 18:54:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343Is4DP032701
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 18:54:04 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 11:54:03 -0700
Message-ID: <67e9b90d-195b-ce67-0302-7e846a580671@quicinc.com>
Date: Wed, 3 May 2023 11:54:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 7/7] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-8-git-send-email-quic_khsieh@quicinc.com>
 <1d390e6f-4ec3-bef3-4ad6-b86e5b07c709@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1d390e6f-4ec3-bef3-4ad6-b86e5b07c709@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FM253xAmNVPjmplyhIXkJ1ofdKaf1ubR
X-Proofpoint-ORIG-GUID: FM253xAmNVPjmplyhIXkJ1ofdKaf1ubR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_13,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030162
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
Cc: marijn.suijten@somainline.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/2/2023 2:42 PM, Dmitry Baryshkov wrote:
> On 03/05/2023 00:03, Kuogee Hsieh wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
>> feature flag information.  Each display compression engine (DCE) contains
>> dual hard slice DSC encoders so both share same base address but with
>> its own different sub block address.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Minor question below.
> 
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 14 +++++++++++
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 ++++++
>>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 16 +++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 14 +++++++++++
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 14 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 27 
>> ++++++++++++++++++++--
>>   6 files changed, 90 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index 4f6a965..f98c2a5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -153,6 +153,18 @@ static const struct dpu_merge_3d_cfg 
>> sm8350_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>>   };
>> +/*
>> + * NOTE: Each display compression engine (DCE) contains dual hard
>> + * slice DSC encoders so both share same base address but with
>> + * its own different sub block address.
>> + */
>> +static const struct dpu_dsc_cfg sm8350_dsc[] = {
>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>> +};
>> +
>>   static const struct dpu_intf_cfg sm8350_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> @@ -205,6 +217,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>>       .dspp = sm8350_dspp,
>>       .pingpong_count = ARRAY_SIZE(sm8350_pp),
>>       .pingpong = sm8350_pp,
>> +    .dsc = sm8350_dsc,
>> +    .dsc_count = ARRAY_SIZE(sm8350_dsc),
>>       .merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
>>       .merge_3d = sm8350_merge_3d,
>>       .intf_count = ARRAY_SIZE(sm8350_intf),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 6b2c7ea..3fd0498a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -93,6 +93,11 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>       PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, 
>> sc7280_pp_sblk, -1, -1),
>>   };
>> +/* NOTE: sc7280 only has one dsc hard slice encoder */
>> +static const struct dpu_dsc_cfg sc7280_dsc[] = {
>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>> +};
>> +
>>   static const struct dpu_intf_cfg sc7280_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> @@ -142,6 +147,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>>       .mixer = sc7280_lm,
>>       .pingpong_count = ARRAY_SIZE(sc7280_pp),
>>       .pingpong = sc7280_pp,
>> +    .dsc_count = ARRAY_SIZE(sc7280_dsc),
>> +    .dsc = sc7280_dsc,
>>       .intf_count = ARRAY_SIZE(sc7280_intf),
>>       .intf = sc7280_intf,
>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index 706d0f1..ce583eb 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -141,6 +141,20 @@ static const struct dpu_merge_3d_cfg 
>> sc8280xp_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>>   };
>> +/*
>> + * NOTE: Each display compression engine (DCE) contains dual hard
>> + * slice DSC encoders so both share same base address but with
>> + * its own different sub block address.
>> + */
>> +static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_2", DSC_4, 0x82000, 0x100, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_2", DSC_5, 0x82000, 0x100, 0, dsc_sblk_1),
> 
> Just checking: all other platforms have non-422 encoders first, then the 
> 422-enabled ones. Is there any reason why this platform has them in the 
> opposite order?
> 

This turned out to be a mistake due to a confusion in the internal 
documents.

So this should be updated to :

DSC_0 pair -> only RGB
DSC_1 pair -> DPU_DSC_NATIVE_422_EN
DSC_2 pair -> only RGB

There was a generic statement in the document that with 3 DSC pairs 
first two are YUV 422 capable and third one is RGB. I assumed that was 
true for all chipsets with 3 DSC pairs and made this change but i was 
wrong as that was specific to some other chipset not present in this 
catalog yet.

Rest of the chipsets are correct as they have only two DSC pairs.

Will update this one.

>> +};
>> +
>>   /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for 
>> now */
>>   static const struct dpu_intf_cfg sc8280xp_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> @@ -196,6 +210,8 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>>       .dspp = sc8280xp_dspp,
>>       .pingpong_count = ARRAY_SIZE(sc8280xp_pp),
>>       .pingpong = sc8280xp_pp,
>> +    .dsc = sc8280xp_dsc,
>> +    .dsc_count = ARRAY_SIZE(sc8280xp_dsc),
>>       .merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
>>       .merge_3d = sc8280xp_merge_3d,
>>       .intf_count = ARRAY_SIZE(sc8280xp_intf),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index 4ecb3df..3950e7b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -161,6 +161,18 @@ static const struct dpu_merge_3d_cfg 
>> sm8450_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
>>   };
>> +/*
>> + * NOTE: Each display compression engine (DCE) contains dual hard
>> + * slice DSC encoders so both share same base address but with
>> + * its own different sub block address.
>> + */
>> +static const struct dpu_dsc_cfg sm8450_dsc[] = {
>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>> +};
>> +
>>   static const struct dpu_intf_cfg sm8450_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> @@ -213,6 +225,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>>       .dspp = sm8450_dspp,
>>       .pingpong_count = ARRAY_SIZE(sm8450_pp),
>>       .pingpong = sm8450_pp,
>> +    .dsc = sm8450_dsc,
>> +    .dsc_count = ARRAY_SIZE(sm8450_dsc),
>>       .merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
>>       .merge_3d = sm8450_merge_3d,
>>       .intf_count = ARRAY_SIZE(sm8450_intf),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index d0ab351..1b3f542 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -165,6 +165,18 @@ static const struct dpu_merge_3d_cfg 
>> sm8550_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
>>   };
>> +/*
>> + * NOTE: Each display compression engine (DCE) contains dual hard
>> + * slice DSC encoders so both share same base address but with
>> + * its own different sub block address.
>> + */
>> +static const struct dpu_dsc_cfg sm8550_dsc[] = {
>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>> +};
>> +
>>   static const struct dpu_intf_cfg sm8550_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       /* TODO TE sub-blocks for intf1 & intf2 */
>> @@ -218,6 +230,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>>       .dspp = sm8550_dspp,
>>       .pingpong_count = ARRAY_SIZE(sm8550_pp),
>>       .pingpong = sm8550_pp,
>> +    .dsc = sm8550_dsc,
>> +    .dsc_count = ARRAY_SIZE(sm8550_dsc),
>>       .merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>>       .merge_3d = sm8550_merge_3d,
>>       .intf_count = ARRAY_SIZE(sm8550_intf),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 6ea1e9d..83c0cd9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>> @@ -536,11 +536,34 @@ static const struct dpu_pingpong_sub_blks 
>> sc7280_pp_sblk = {
>>   /*************************************************************
>>    * DSC sub blocks config
>>    *************************************************************/
>> +static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
>> +    .enc = {.base = 0x100, .len = 0x100},
>> +    .ctl = {.base = 0xF00, .len = 0x10},
>> +};
>> +
>> +static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>> +    .enc = {.base = 0x200, .len = 0x100},
>> +    .ctl = {.base = 0xF80, .len = 0x10},
>> +};
>> +
>>   #define DSC_BLK(_name, _id, _base, _features) \
>>       {\
>>       .name = _name, .id = _id, \
>>       .base = _base, .len = 0x140, \
>> -    .features = _features, \
>> +    .features = BIT(DPU_DSC_HW_REV_1_1) | _features, \
>> +    }
>> +
>> +/*
>> + * NOTE: Each display compression engine (DCE) contains dual hard
>> + * slice DSC encoders so both share same base address but with
>> + * its own different sub block address.
>> + */
>> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>> +    {\
>> +    .name = _name, .id = _id, \
>> +    .base = _base, .len = _len, \
>> +    .features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>> +    .sblk = &_sblk, \
>>       }
>>   /*************************************************************
> 
