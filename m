Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520D6EB467
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 00:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303AE10E264;
	Fri, 21 Apr 2023 22:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0E610E264;
 Fri, 21 Apr 2023 22:05:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LLSlo2026114; Fri, 21 Apr 2023 22:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bTuKtHGTeLnEy77rrZuzHq6grMBEthzjY0RdJSovizQ=;
 b=gezY9NUmYUYqiMwkfJ71cGd5NtST1Y7lCHbSm+E1p8S5eBEK2KJqJGYgqVXpLtLNuLai
 9B65qbgaJo15gCja8zhSf8Rx95NopZAxVGQWJSwbRuuue4qa0m01kjEiCDoZ0SyWO2Qk
 ZBEWAj2P7UZZdqZKLcZ/KQvBms6WgSrAB0bkfGeFw+i4jkYejR3A6PQ8RlbTJj+Ocm/t
 GXvaoJoEyf9GSKNYlo2GzfeOfJPhJXREdNcN3faX6NMmeXF1C4T9KC58i6hMTEG4TSaC
 QZXvKEWZZ55d2W/uV+hsj10YRklyx7/UhtZlIbmIDydH1j8mvZtHjPsC3rnqUKQ05A0g IQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3tmqs7cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 22:05:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LM5fvF009059
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 22:05:41 GMT
Received: from [10.110.0.180] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 21 Apr
 2023 15:05:40 -0700
Message-ID: <3ee67248-c94c-5f3d-527e-914e8c8b4a31@quicinc.com>
Date: Fri, 21 Apr 2023 15:05:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 5/5] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-6-git-send-email-quic_khsieh@quicinc.com>
 <b26dfb22-bf97-b65e-ef06-62098c4eafec@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <b26dfb22-bf97-b65e-ef06-62098c4eafec@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oCjwfEqMgOxWu08l3yMN7gwYqwWBmTMi
X-Proofpoint-ORIG-GUID: oCjwfEqMgOxWu08l3yMN7gwYqwWBmTMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=940 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210193
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/2023 5:07 PM, Dmitry Baryshkov wrote:
> On 21/04/2023 02:25, Kuogee Hsieh wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add DSC 1.2 hardware blocks to the catalog with necessary
>> sub-block and feature flag information.
>> Each display compression engine (DCE) contains dual hard
>> slice DSC encoders so both share same base address but with
>> its own different sub block address.
>
> Please correct line wrapping. 72-75 is usually the preferred width
>
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 19 
>> +++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  | 11 +++++++++++
>>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    | 21 
>> +++++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  | 19 
>> +++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  | 19 
>> +++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 12 ++++++++++--
>>   6 files changed, 99 insertions(+), 2 deletions(-)
>>
>
>
> [I commented on sm8550, it applies to all the rest of platforms]
>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index 9e40303..72a7bcf 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -165,6 +165,23 @@ static const struct dpu_merge_3d_cfg 
>> sm8550_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
>>   };
>>   +static const struct dpu_dsc_sub_blks sm8550_dsc_sblk_0 = {
>> +    .enc = {.base = 0x100, .len = 0x100},
>> +    .ctl = {.base = 0xF00, .len = 0x10},
>> +};
>> +
>> +static const struct dpu_dsc_sub_blks sm8550_dsc_sblk_1 = {
>> +    .enc = {.base = 0x200, .len = 0x100},
>> +    .ctl = {.base = 0xF80, .len = 0x10},
>> +};
>
> Please keep sblk in dpu_hw_catalog for now.
>
>> +
>> +static const struct dpu_dsc_cfg sm8550_dsc[] = {
>> +    DSC_BLK_1_2("dsc_0", DSC_0, 0x80000, 0x100, 0, sm8550_dsc_sblk_0),
>> +    DSC_BLK_1_2("dsc_0", DSC_1, 0x80000, 0x100, 0, sm8550_dsc_sblk_1),
>
> Is there a reason why index in "dsc_N" doesn't match the DSC_n which 
> comes next to it?

usually each DCE (display compression engine) contains two hard slice 
encoders.

DSC_0 and DSC_1 (index) is belong to dsc_0.

If there are two DCE, then DSC_2 and DSC_3 belong to dsc_1

>
>> +    DSC_BLK_1_2("dsc_1", DSC_2, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), sm8550_dsc_sblk_0),
>> +    DSC_BLK_1_2("dsc_1", DSC_3, 0x81000, 0x100, 
>> BIT(DPU_DSC_NATIVE_422_EN), sm8550_dsc_sblk_1),
>> +};
>> +
>>   static const struct dpu_intf_cfg sm8550_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       /* TODO TE sub-blocks for intf1 & intf2 */
>> @@ -218,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
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
>> index 03f162a..be08158 100644
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
>>     #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>> @@ -540,7 +540,15 @@ static const struct dpu_pingpong_sub_blks 
>> sc7280_pp_sblk = {
>>       {\
>>       .name = _name, .id = _id, \
>>       .base = _base, .len = 0x140, \
>> -    .features = _features, \
>> +    .features = BIT(DPU_DSC_HW_REV_1_1) | _features, \
>> +    }
>> +
>> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>> +    {\
>> +    .name = _name, .id = _id, \
>> +    .base = _base, .len = _len, \
>> +    .features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>> +    .sblk = &_sblk, \
>>       }
>> /*************************************************************
>
