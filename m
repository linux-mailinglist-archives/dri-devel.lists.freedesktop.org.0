Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ED97040BD
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 00:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91A010E2A2;
	Mon, 15 May 2023 22:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DDE10E2A2;
 Mon, 15 May 2023 22:10:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FM6i68019307; Mon, 15 May 2023 22:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8p/+tJH763+HQsFFKhVi7cFo8dJjV6cN7cXoghCMbXc=;
 b=W2Llc6uvv4Y+k86s21/MZe9oTwBWGk3iJ527KW7pnigCFAPL2wXblAD2Lh926FROTA/8
 YVvy+ZS+kqfNXXp1a1UepUhNVdAshOulFq2d+dx9BTlrh5QZGTVG81fL3POQ30xmcDkn
 aASXrQBkiOG19iglKpgsZsNxJJSPOZGTMGJLQ3dlD6xXUx/q+Fm6niz/hejZbWDyhGy9
 ra4BgzfcojYXpOvn6XkDfLN6zNfBNgl3r4lNmOafhHH1751gTPJV8JPDa1cqWqWCnLxA
 BfaDLkML2WHdfziL6Fu8uYSSuvFC6tPPTkSX+cG2RTVqjOHcE0moXPb4L+dl7Z9V+GiO gA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkqg8rqxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 22:10:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FMA4CE024389
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 22:10:04 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 15:10:03 -0700
Message-ID: <ae5b3df7-07cf-cded-1005-328660adea2d@quicinc.com>
Date: Mon, 15 May 2023 15:10:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v8 7/8] drm/msm/dpu: add DSC 1.2 hw blocks for
 relevant chipsets
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Marijn Suijten <marijn.suijten@somainline.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-8-git-send-email-quic_khsieh@quicinc.com>
 <cmoqfe5nunreajdvu2vk3ztwkbjesivgejjoi2wmsxske5gq3q@lr25iuwmuevb>
 <ccef1e88-5c38-0759-523a-c957854697ef@quicinc.com>
In-Reply-To: <ccef1e88-5c38-0759-523a-c957854697ef@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lb3OkODaYddvWD8dm7R918_nhOBO7qJ_
X-Proofpoint-GUID: lb3OkODaYddvWD8dm7R918_nhOBO7qJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150182
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
Cc: sean@poorly.run, vkoul@kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, andersson@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/15/2023 3:03 PM, Abhinav Kumar wrote:
> 
> 
> On 5/15/2023 2:21 PM, Marijn Suijten wrote:
>> On 2023-05-12 11:00:22, Kuogee Hsieh wrote:
>>>
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
>>> feature flag information.  Each display compression engine (DCE) 
>>> contains
>>> dual hard slice DSC encoders so both share same base address but with
>>> its own different sub block address.
>>
>> Can we have an explanation of hard vs soft slices in some commit message
>> and/or code documentation?
>>
> 
> Not in this one. It wont look appropriate. I would rather remove "hard" 
> to avoid confusion.
> 
>>>
>>> changes in v4:
>>> -- delete DPU_DSC_HW_REV_1_1
>>> -- re arrange sc8280xp_dsc[]
>>>
>>> changes in v4:
>>> -- fix checkpatch warning
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 14 ++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 ++++++
>>>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 16 ++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 14 ++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 14 ++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 25 
>>> +++++++++++++++++++++-
>>>   6 files changed, 89 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> index 500cfd0..c4c93c8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> @@ -153,6 +153,18 @@ static const struct dpu_merge_3d_cfg 
>>> sm8350_merge_3d[] = {
>>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>>>   };
>>> +/*
>>> + * NOTE: Each display compression engine (DCE) contains dual hard
>>> + * slice DSC encoders so both share same base address but with
>>> + * its own different sub block address.
>>> + */
>>> +static const struct dpu_dsc_cfg sm8350_dsc[] = {
>>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
>>
>> Downstream says that the size is 0x10 (and 0x100 for the enc sblk, 0x10
>> for the ctl sblk).  This simply fills it up to the start of the enc sblk
>> so that we can see all registers in the dump?  After all only
>> DSC_CMN_MAIN_CNF is defined in the main register space, so 0x10 is
>> adequate.
>>
> 
> .len today is always only for the dump. and yes even here we have only 
> 0x100 for the enc and 0x10 for the ctl.
> 
> +static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
> +    .enc = {.base = 0x100, .len = 0x100},
> +    .ctl = {.base = 0xF00, .len = 0x10},
> +};
> 
> The issue here is that, the dpu snapshot does not handle sub_blk parsing 
> today. Its a to-do item. So for that reason, 0x100 was used here to 
> atleast get the full encoder dumps.
> 
>>> +    DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
>>
>> Should we add an extra suffix to the name to indicate which hard-slice
>> DSC encoder it is?  i.e. "dce_0_0" and "dce_0_1" etc?
> 
> Ok, that should be fine. We can add it.
> 
>>
>>> +    DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>>
> 
>> See comment below about loose BIT() in features.
> 
> Responded below.
>>
>>> +};
>>> +
>>>   static const struct dpu_intf_cfg sm8350_intf[] = {
>>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>> @@ -215,6 +227,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>>>       .dspp = sm8350_dspp,
>>>       .pingpong_count = ARRAY_SIZE(sm8350_pp),
>>>       .pingpong = sm8350_pp,
>>> +    .dsc = sm8350_dsc,
>>> +    .dsc_count = ARRAY_SIZE(sm8350_dsc),
>>
>> Count goes first **everywhere else**, let's not break consistency here.
>>
> 
> the order of DSC entries is swapped for all chipsets. Please refer to 
> dpu_sc8180x_cfg, dpu_sm8250_cfg etc.
> 
> So if you are talking about consistency, this is actually consistent 
> with whats present in other chipsets.
> 
> If you are very particular about this, then once this lands, you can 
> change the order for all of them in another change.
> 
> Same answer for all swap comments.

Actually, I am wrong here, I misread the entries. Sure, I can fix this up.

Please ignore this response and you can check the others.

> 
>>>       .merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
>>>       .merge_3d = sm8350_merge_3d,
>>>       .intf_count = ARRAY_SIZE(sm8350_intf),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> index 5646713..42c66fe 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> @@ -93,6 +93,11 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>>       PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, 
>>> sc7280_pp_sblk, -1, -1),
>>>   };
>>> +/* NOTE: sc7280 only has one dsc hard slice encoder */
>>
>> DSC
>>
>>> +static const struct dpu_dsc_cfg sc7280_dsc[] = {
>>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>>> +};
>>> +
>>>   static const struct dpu_intf_cfg sc7280_intf[] = {
>>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>> @@ -149,6 +154,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>>>       .mixer = sc7280_lm,
>>>       .pingpong_count = ARRAY_SIZE(sc7280_pp),
>>>       .pingpong = sc7280_pp,
>>> +    .dsc_count = ARRAY_SIZE(sc7280_dsc),
>>> +    .dsc = sc7280_dsc,
>>>       .intf_count = ARRAY_SIZE(sc7280_intf),
>>>       .intf = sc7280_intf,
>>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> index 808aacd..1901fff 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> @@ -141,6 +141,20 @@ static const struct dpu_merge_3d_cfg 
>>> sc8280xp_merge_3d[] = {
>>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>>>   };
>>> +/*
>>> + * NOTE: Each display compression engine (DCE) contains dual hard
>>> + * slice DSC encoders so both share same base address but with
>>> + * its own different sub block address.
>>> + */
>>> +static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_2", DSC_4, 0x82000, 0x100, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_2", DSC_5, 0x82000, 0x100, 0, dsc_sblk_1),
>>> +};
>>> +
>>>   /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for 
>>> now */
>>>   static const struct dpu_intf_cfg sc8280xp_intf[] = {
>>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>> @@ -216,6 +230,8 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>>>       .dspp = sc8280xp_dspp,
>>>       .pingpong_count = ARRAY_SIZE(sc8280xp_pp),
>>>       .pingpong = sc8280xp_pp,
>>> +    .dsc = sc8280xp_dsc,
>>> +    .dsc_count = ARRAY_SIZE(sc8280xp_dsc),
>>
>> Swap the two lines.
>>
>>>       .merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
>>>       .merge_3d = sc8280xp_merge_3d,
>>>       .intf_count = ARRAY_SIZE(sc8280xp_intf),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> index 1a89ff9..741d03f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> @@ -161,6 +161,18 @@ static const struct dpu_merge_3d_cfg 
>>> sm8450_merge_3d[] = {
>>>       MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
>>>   };
>>> +/*
>>> + * NOTE: Each display compression engine (DCE) contains dual hard
>>> + * slice DSC encoders so both share same base address but with
>>> + * its own different sub block address.
>>> + */
>>> +static const struct dpu_dsc_cfg sm8450_dsc[] = {
>>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>>> +};
>>> +
>>>   static const struct dpu_intf_cfg sm8450_intf[] = {
>>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>> @@ -223,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>>>       .dspp = sm8450_dspp,
>>>       .pingpong_count = ARRAY_SIZE(sm8450_pp),
>>>       .pingpong = sm8450_pp,
>>> +    .dsc = sm8450_dsc,
>>> +    .dsc_count = ARRAY_SIZE(sm8450_dsc),
>>
>> Another swap.
>>
>>>       .merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
>>>       .merge_3d = sm8450_merge_3d,
>>>       .intf_count = ARRAY_SIZE(sm8450_intf),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> index 497b34c..3ee6dc8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> @@ -165,6 +165,18 @@ static const struct dpu_merge_3d_cfg 
>>> sm8550_merge_3d[] = {
>>>       MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
>>>   };
>>> +/*
>>> + * NOTE: Each display compression engine (DCE) contains dual hard
>>> + * slice DSC encoders so both share same base address but with
>>> + * its own different sub block address.
>>> + */
>>> +static const struct dpu_dsc_cfg sm8550_dsc[] = {
>>> +    DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>>> +};
>>> +
>>>   static const struct dpu_intf_cfg sm8550_intf[] = {
>>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>> @@ -227,6 +239,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>>>       .dspp = sm8550_dspp,
>>>       .pingpong_count = ARRAY_SIZE(sm8550_pp),
>>>       .pingpong = sm8550_pp,
>>> +    .dsc = sm8550_dsc,
>>> +    .dsc_count = ARRAY_SIZE(sm8550_dsc),
>>
>> Swap.
>>
>>>       .merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>>>       .merge_3d = sm8550_merge_3d,
>>>       .intf_count = ARRAY_SIZE(sm8550_intf),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 78e4bf6..c1d7338 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -1,6 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>>    */
>>>   #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>>> @@ -522,6 +522,16 @@ static const struct dpu_pingpong_sub_blks 
>>> sc7280_pp_sblk = {
>>>   /*************************************************************
>>>    * DSC sub blocks config
>>>    *************************************************************/
>>> +static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
>>> +    .enc = {.base = 0x100, .len = 0x100},
>>> +    .ctl = {.base = 0xF00, .len = 0x10},
>>> +};
>>> +
>>> +static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>>> +    .enc = {.base = 0x200, .len = 0x100},
>>> +    .ctl = {.base = 0xF80, .len = 0x10},
>>> +};
>>> +
>>>   #define DSC_BLK(_name, _id, _base, _features) \
>>>       {\
>>>       .name = _name, .id = _id, \
>>> @@ -529,6 +539,19 @@ static const struct dpu_pingpong_sub_blks 
>>> sc7280_pp_sblk = {
>>>       .features = _features, \
>>>       }
>>> +/*
>>> + * NOTE: Each display compression engine (DCE) contains dual hard
>>> + * slice DSC encoders so both share same base address but with
>>> + * its own different sub block address.
>>> + */
>>> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>>
>> There are no address values here so this comment doesn't seem very
>> useful, and it is already duplicated on every DSC block array, where the
>> duplication is more visible.  Drop the comment here?
>>
> 
> _base is the address. So base address. Does that clarify things?
> 
>>> +    {\
>>> +    .name = _name, .id = _id, \
>>> +    .base = _base, .len = _len, \
>>
>> The len is always 0x100 (downstream says 0x10), should we hardcode it
>> here and drop _len?  We can always add it back if a future revision
>> starts changing it, but that's not the case currently.
>>
>>> +    .features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>>
>> We don't willy-nilly append bits like that: should there be global
>> feature flags?
> 
> So this approach is actually better. This macro is a DSC_1_2 macro so it 
> will have the 1.2 feature flag and other features like native_422 
> support of that encoder are ORed on top of it. Nothing wrong with this.
> 
>>
>> Or is this the start of a new era where we expand those defines in-line
>> and drop them altogether?  I'd much prefer that but we should first
>> align on this direction (and then also make the switch globally in a
>> followup).
>>
> 
> Its case by case. No need to generalize.
> 
> In this the feature flag ORed with the base feature flag of DSC_1_2 
> makes it more clear.
> 
>> - Marijn
>>
>>> +    .sblk = &_sblk, \
>>> +    }
>>> +
>>>   /*************************************************************
>>>    * INTF sub blocks config
>>>    *************************************************************/
>>> -- 
>>> 2.7.4
>>>
