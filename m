Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24796F21C8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 03:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF21E10EE27;
	Sat, 29 Apr 2023 01:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B434510EE27;
 Sat, 29 Apr 2023 01:03:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33T0iwX0002831; Sat, 29 Apr 2023 01:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/xbb4kSPSrah4RtoqhbsGDqbN7qzihIIgJIzb+rmZ3w=;
 b=GCqCnkCeyUrgg34nrjoiYoRsrkxTdaGVoqjahQF1DbvaBBZAtaKQdX8UFMbyuUO5jhWR
 EHnPhpLvaSoBQjXahqIYbP0PEHCq0e6s7/ikM70XJv9x9neLLuYB6hXWNvqokoAuul7U
 W52uQb1O6+ji739CFmbr23vG6P3hfpFVzQNeLf4h7KryBuWAQUY9HEJYNHr/jtjmeUNK
 ciVt6gLtGY4LrKLuK4vh04lUOG21dCwjToaIylFpxThJxfcZhQHmZv1ASpCdfi1rml1Z
 G6lMDwY5QEdBf5HmdDT+8vO+kjf1twhzyclRcNYUaepGLU9eWe3cUea/Of7fBCud4hkt 0Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8rkwr27f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 01:03:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33T13I65000867
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 01:03:18 GMT
Received: from [10.110.119.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 28 Apr
 2023 18:03:17 -0700
Message-ID: <d25d506a-4d56-e16e-ca58-7bc96f2941a5@quicinc.com>
Date: Fri, 28 Apr 2023 18:03:16 -0700
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1ef1388d-4dc3-273d-3ba6-10614ce6426c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gmKG1LMEZXnzL5mKiowkYhtOdEU0BwBc
X-Proofpoint-GUID: gmKG1LMEZXnzL5mKiowkYhtOdEU0BwBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304290007
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



On 4/28/2023 5:35 PM, Dmitry Baryshkov wrote:
> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> In preparation of calling ping-pong DSC related functions only
>> for chipsets which have such a design add the dsc blocks for the
>> chipsets for which DSC is present but was not added in the catalog.
> 
> Why/how is it prearing us for such calling?
> 
> The change itself LGTM.

The next change adds DPU_PINGPONG_DSC feature flag to chipsets where it 
is supported. But when I checked there were many chipsets where DSC is 
present but were not added in catalog.

Without doing that, the next change was originally adding 0 to the 
feature flags of those chipsets which didnt seem right to me.

This seemed like the right way to do it to first add the DSC blocks for 
those chipsets and add the feature flag to them in the next change.

> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 
>> +++++++++++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index 2b3ae84..17f821c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg msm8998_pp[] 
>> = {
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>   };
>> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>> +};
>> +
>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>>       DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
>>            &msm8998_dspp_sblk),
>> @@ -191,6 +196,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>       .dspp = msm8998_dspp,
>>       .pingpong_count = ARRAY_SIZE(msm8998_pp),
>>       .pingpong = msm8998_pp,
>> +    .dsc_count = ARRAY_SIZE(msm8998_dsc),
>> +    .dsc = msm8998_dsc,
>>       .intf_count = ARRAY_SIZE(msm8998_intf),
>>       .intf = msm8998_intf,
>>       .vbif_count = ARRAY_SIZE(msm8998_vbif),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index e3bdfe7..5bb9882 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -142,6 +142,15 @@ static const struct dpu_merge_3d_cfg 
>> sc8180x_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>>   };
>> +static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +    DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +    DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +    DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +    DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +};
>> +
>>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> @@ -192,6 +201,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>>       .mixer = sc8180x_lm,
>>       .pingpong_count = ARRAY_SIZE(sc8180x_pp),
>>       .pingpong = sc8180x_pp,
>> +    .dsc_count = ARRAY_SIZE(sc8180x_dsc),
>> +    .dsc = sc8180x_dsc,
>>       .merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
>>       .merge_3d = sc8180x_merge_3d,
>>       .intf_count = ARRAY_SIZE(sc8180x_intf),
> 
