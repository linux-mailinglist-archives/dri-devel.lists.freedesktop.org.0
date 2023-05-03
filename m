Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854756F5F7F
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 21:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E68710E15F;
	Wed,  3 May 2023 19:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33FC10E15F;
 Wed,  3 May 2023 19:58:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343JOU6M006258; Wed, 3 May 2023 19:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UCOhXWCZzsXVE1aRTaRL66l6NR89OJhY/cqL2K78T4o=;
 b=bmSSJIsr/lTaIj7MnMRByLsQybF/1CZxfchFpL1pFkq2PzgzAErxeVhpZjPnaCUvRQqR
 iyfNyLxsMFwxTTa8VEHNvQuP8mEm4JRpeHsomJjQUPMT8HrzkoPtNBiDmGl+lenz4bws
 yMf0fWTvRvu56i6flbEkchQnL6gg12vNj+SxWSjmeLZDts0juXVfn1EDmH7R9UAUMRua
 BLkEkT7f9LuySOgp4iHTYApqb/I4mE/KLY+9K9PRbpL4eAD6IXITiDKOtPlN5/lrjXmf
 31mhz4gtrjr3ZiyfBsyOKHiiV9Zx0K3wtZpEu5pz5CYLmJcpIyEZGIgiLzTuFNxxm33h Zg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qb9bhtra4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 19:58:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343Jw2AT006878
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 19:58:02 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 12:58:01 -0700
Message-ID: <fe691246-93ee-7d84-aa6b-3d4ef51a6381@quicinc.com>
Date: Wed, 3 May 2023 12:58:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/7] drm/msm/dpu: add DPU_PINGPONG_DSC bits into PP_BLK
 and PP_BLK_TE marcos
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-4-git-send-email-quic_khsieh@quicinc.com>
 <4315e96f-ed29-92aa-9549-d6fc9d820de6@linaro.org>
 <648e7cca-8bb1-73f0-2bbb-0a6b81df3882@quicinc.com>
 <a40c72c2-3483-020c-907e-6c7d84e88fbd@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <a40c72c2-3483-020c-907e-6c7d84e88fbd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NCubpt8ns_d3_3WbCZ13bunCw8m2fhg9
X-Proofpoint-ORIG-GUID: NCubpt8ns_d3_3WbCZ13bunCw8m2fhg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_14,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030171
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/3/2023 11:55 AM, Dmitry Baryshkov wrote:
> On 03/05/2023 20:45, Kuogee Hsieh wrote:
>>
>> On 5/2/2023 3:42 PM, Dmitry Baryshkov wrote:
>>> On 03/05/2023 00:02, Kuogee Hsieh wrote:
>>>> At legacy chipsets, it required DPU_PINGPONG_DSC bit be set to 
>>>> indicate
>>>> pingpong ops functions are required to complete DSC data path setup if
>>>> this chipset has DSC hardware block presented. This patch add
>>>> DPU_PINGPONG_DSC bit to both PP_BLK and PP_BLK_TE marcos if it has DSC
>>>> hardware block presented.
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 12 +++++-----
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 +++----
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 26 
>>>> ++++++++++------------
>>>>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 
>>>> ++++++++++----------
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 26 
>>>> ++++++++++------------
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
>>>>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  8 +++----
>>>>   9 files changed, 54 insertions(+), 58 deletions(-)
>>>>
>>>> diff --git 
>>>> a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> index 17f821c..b7cd746 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> @@ -112,16 +112,16 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>>>>   };
>>>>     static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, 
>>>> sdm845_pp_sblk_te,
>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 
>>>> BIT(DPU_PINGPONG_DSC), 0,
>>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, 
>>>> sdm845_pp_sblk_te,
>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 
>>>> BIT(DPU_PINGPONG_DSC), 0,
>>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, 0, sdm845_pp_sblk,
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, 0, sdm845_pp_sblk,
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>
>>> Just to doublecheck: why don't we have DPU_PINGPONG_DSC for PP_3/_4? 
>>> We do have them on sdm845. Is it because we should not use DSC with 
>>> thos PINGPONG blocks?
>>>
>> I think it only have two DSPP connect to pp blocks
>
> So, can they be connected to PP3/4 or not?

no, my previous reply is not correct.

original i though pp_3/_4 are for write back.

but this not correct, 2 dspp can connect to pp_3/_4 also.

I will add DPU_PINGPONG_DSC to pp_3/_4.


>
>>>>   };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>> index ceca741..8888bd9 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>> @@ -110,16 +110,16 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>>>>   };
>>>>     static const struct dpu_pingpong_cfg sdm845_pp[] = {
>>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, 
>>>> sdm845_pp_sblk_te,
>>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 
>>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, 
>>>> sdm845_pp_sblk_te,
>>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 
>>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 
>>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk,
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 
>>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk,
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>>
>>>
>>> [skipped the rest, looks good to me]
>>>
>
