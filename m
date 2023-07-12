Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5B751155
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 21:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4DE10E5D6;
	Wed, 12 Jul 2023 19:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD09A10E5D6;
 Wed, 12 Jul 2023 19:37:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36CIcSKq027515; Wed, 12 Jul 2023 19:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mQpAgPXqOnK5Q6ehzXqT0NQNlqgQwo8dAPzxa3vo5Co=;
 b=csvYED9Zrae9KAI3thMi0dAmz9Ia46MJqm4hDVwSnAJyawcpiz4Qp5UQi1pNDbp4TsiP
 LY42ez+IxtQipRIp93G2ciF6DxpSzne07qKE4GicHE2JdsZ9oMGSSXGalo/kpe/zydCQ
 +FoEN9XQad6AOxw953lPIVd4qkhiyrgFZHr93CeSxLCupasQt/J5r/6llLoQlWk3hC5b
 mEvdtpVr+Un0Ae27NNKAHKVOHLgLwAN4sUgyo7hZukVYlXpAeVNwDqpKoBuQnXEdNZsI
 MUj52SbCyXOLcGR8r/apxlx3+dv0B/gwlR6n5MP8+bUnkCIk+DTIKfZdncMQZ5F/P3Zz FA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsfeq2d14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 19:37:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36CJbiVJ000549
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 19:37:44 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 12 Jul
 2023 12:37:44 -0700
Message-ID: <4f83d398-fbc2-bd3b-2df8-8d2aa7c8de63@quicinc.com>
Date: Wed, 12 Jul 2023 12:37:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 04/11] drm/msm/dpu: drop separate dpu_core_perf_tune
 overrides
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
 <20230707193942.3806526-5-dmitry.baryshkov@linaro.org>
 <729de13d-6fb7-ff1c-8660-4710d914258b@quicinc.com>
 <a25b58b4-9b94-928b-cdde-eccd56f1e444@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a25b58b4-9b94-928b-cdde-eccd56f1e444@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vVMLJzO6bfiaCpB4wJyLk6nu3HJ7SpbZ
X-Proofpoint-GUID: vVMLJzO6bfiaCpB4wJyLk6nu3HJ7SpbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120173
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/10/2023 7:34 PM, Dmitry Baryshkov wrote:
> On 11/07/2023 05:31, Abhinav Kumar wrote:
>>
>>
>> On 7/7/2023 12:39 PM, Dmitry Baryshkov wrote:
>>> The values in struct dpu_core_perf_tune are fixed per the core perf
>>> mode. Drop the 'tune' values and substitute them with known values when
>>> performing perf management.
>>>
>>> Note: min_bus_vote was not used at all, so it is just silently dropped.
>>>
>>
>> Interesting ..... should bring this back properly. Will take it up.
> 
> Ack, thanks.
> 
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 ++++++++-----------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  4 ---
>>>   2 files changed, 12 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> index 05d340aa18c5..348550ac7e51 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>> @@ -235,7 +235,7 @@ static int _dpu_core_perf_crtc_update_bus(struct 
>>> dpu_kms *kms,
>>>   {
>>>       struct dpu_core_perf_params perf = { 0 };
>>>       int i, ret = 0;
>>> -    u64 avg_bw;
>>> +    u32 avg_bw;
>>
>> avg_bw seems unused in this patch, so unrelated change?
>>
>>>       if (!kms->num_paths)
>>>           return 0;
>>> @@ -291,10 +291,16 @@ void dpu_core_perf_crtc_release_bw(struct 
>>> drm_crtc *crtc)
>>>   static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>>>   {
>>> -    u64 clk_rate = kms->perf.perf_tune.min_core_clk;
>>> +    u64 clk_rate;
>>>       struct drm_crtc *crtc;
>>>       struct dpu_crtc_state *dpu_cstate;
>>> +    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
>>> +        return kms->perf.fix_core_clk_rate;
>>> +
>>> +    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
>>> +        return kms->perf.max_core_clk_rate;
>>> +
>>>       drm_for_each_crtc(crtc, kms->dev) {
>>>           if (crtc->enabled) {
>>>               dpu_cstate = to_dpu_crtc_state(crtc->state);
>>> @@ -305,11 +311,6 @@ static u64 
>>> _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>>>           }
>>>       }
>>> -    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
>>> -        clk_rate = kms->perf.fix_core_clk_rate;
>>> -
>>> -    DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
>>> -
>>
>> Why dont you move both FIXED and MINIMUM handling below instead of above.
>>
>> So that they will just override the clk_rate and you can keep this 
>> useful log here and it matches where the function is.
> 
> I can keep the log in the next version. The logic was quite simple: 
> there is no need to loop over CRTCs if we know that we are overriding 
> the value.
> 

Yes I understood that part. I wanted to keep the log and the function 
together that way we are logging whats the value its going to return.

This patch is logging it at the caller. Thats the only difference.

I am fine either way. Once the avg_bw change is removed, I can ack this.

>>
>> This chunk looks better that way.
>>
>> <skipping the rest as it LGTM>
> 

