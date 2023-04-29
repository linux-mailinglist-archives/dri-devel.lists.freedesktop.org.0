Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AFC6F21D1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 03:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D60110EE36;
	Sat, 29 Apr 2023 01:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA82810EE31;
 Sat, 29 Apr 2023 01:05:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SNSg5T008840; Sat, 29 Apr 2023 01:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/dUJb8KVSpsLqRemf0hRWASNuEJTJ5lXooue93Jl58k=;
 b=fqLc3BBbyuPLNltKQ9OFdAOUE2YIrirSAlxRl5X/S2WUGZye8k/YQJxwr/oUPHLIGyvw
 GNgiyeiyui9Nekg3D0pZqocLbWChtiA4KmhK9gD1JmgPUDh0pq8KZLh3XQaWgSVVkB57
 PFdxexFldQspMOx9MjJt8WSf9qfNlktkJDrOy118VrXm8pQmLTBw9SPTYti2whWpKIyT
 lJcUZ/IwXO7+grPDNCL6nhjPEUMUTSdPHmbGeymwcfYX4C6vsMOCMR/zt/HrYDvE8JeR
 7JRTJoZwl5nmfuPdLEuBw/fW3xlhKo5WXP7wQTPZw5kgZmJuTBuC/y6yp+T3Nkl6x8Er EA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8b38tbej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 01:05:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33T15ajA027188
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 01:05:36 GMT
Received: from [10.110.119.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 28 Apr
 2023 18:05:35 -0700
Message-ID: <203d2c34-d1aa-f0eb-1791-eb778db11b6e@quicinc.com>
Date: Fri, 28 Apr 2023 18:05:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 4/7] drm/msm/dpu: add dsc blocks for
 remaining chipsets in catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-5-git-send-email-quic_khsieh@quicinc.com>
 <1ef1388d-4dc3-273d-3ba6-10614ce6426c@linaro.org>
 <d25d506a-4d56-e16e-ca58-7bc96f2941a5@quicinc.com>
 <9da0d71c-209e-f1fd-97c8-ef7b36c7e12b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <9da0d71c-209e-f1fd-97c8-ef7b36c7e12b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BKRyLs6nxlHjeL0TR9r3hOKIQZ222AqK
X-Proofpoint-ORIG-GUID: BKRyLs6nxlHjeL0TR9r3hOKIQZ222AqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304290008
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/28/2023 6:04 PM, Dmitry Baryshkov wrote:
> On 29/04/2023 04:03, Abhinav Kumar wrote:
>>
>>
>> On 4/28/2023 5:35 PM, Dmitry Baryshkov wrote:
>>> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> In preparation of calling ping-pong DSC related functions only
>>>> for chipsets which have such a design add the dsc blocks for the
>>>> chipsets for which DSC is present but was not added in the catalog.
>>>
>>> Why/how is it prearing us for such calling?
>>>
>>> The change itself LGTM.
>>
>> The next change adds DPU_PINGPONG_DSC feature flag to chipsets where 
>> it is supported. But when I checked there were many chipsets where DSC 
>> is present but were not added in catalog.
>>
>> Without doing that, the next change was originally adding 0 to the 
>> feature flags of those chipsets which didnt seem right to me.
>>
>> This seemed like the right way to do it to first add the DSC blocks 
>> for those chipsets and add the feature flag to them in the next change.
> 
> I'd write something like 'for completeness, add DSC blocks for platforms 
> which missed them'.
> 

Sure, ack.

>>
>>>
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 
>>>> +++++++++++
>>>>   2 files changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> index 2b3ae84..17f821c 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg 
>>>> msm8998_pp[] = {
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>>   };
>>>> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
>>>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>>>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>>>> +};
>>>> +
>>>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>>>>       DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
>>>>            &msm8998_dspp_sblk),
>>>> @@ -191,6 +196,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>>>       .dspp = msm8998_dspp,
>>>>       .pingpong_count = ARRAY_SIZE(msm8998_pp),
>>>>       .pingpong = msm8998_pp,
>>>> +    .dsc_count = ARRAY_SIZE(msm8998_dsc),
>>>> +    .dsc = msm8998_dsc,
>>>>       .intf_count = ARRAY_SIZE(msm8998_intf),
>>>>       .intf = msm8998_intf,
>>>>       .vbif_count = ARRAY_SIZE(msm8998_vbif),
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>> index e3bdfe7..5bb9882 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>> @@ -142,6 +142,15 @@ static const struct dpu_merge_3d_cfg 
>>>> sc8180x_merge_3d[] = {
>>>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>>>>   };
>>>> +static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>>>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>>>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>>>> +    DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>>>> +    DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>>>> +    DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
>>>> +    DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
>>>> +};
>>>> +
>>>>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>>>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 
>>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>>>       INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, 
>>>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>>> @@ -192,6 +201,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>>>>       .mixer = sc8180x_lm,
>>>>       .pingpong_count = ARRAY_SIZE(sc8180x_pp),
>>>>       .pingpong = sc8180x_pp,
>>>> +    .dsc_count = ARRAY_SIZE(sc8180x_dsc),
>>>> +    .dsc = sc8180x_dsc,
>>>>       .merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
>>>>       .merge_3d = sc8180x_merge_3d,
>>>>       .intf_count = ARRAY_SIZE(sc8180x_intf),
>>>
> 
