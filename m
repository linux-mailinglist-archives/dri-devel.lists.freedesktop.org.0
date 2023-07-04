Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D2746699
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 02:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56F210E258;
	Tue,  4 Jul 2023 00:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F6F10E258;
 Tue,  4 Jul 2023 00:31:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3640RViQ031436; Tue, 4 Jul 2023 00:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=odOgB5sghkc+sTvvAO6Io+cwsB5AXiNckk/K4bsGfP4=;
 b=gb/F/2TMDixK7a8uv8syULfUytxlVw8q8IXCWtA8o4EzfjBE0IcTLMRg6wYVcdtlJNMm
 kGXOIqQTBrR/ibz4Rq+/QGLmlq/MeygJTYup7nkVqrghYhc/eNTh8mBsznJyOToCF/W+
 JD5TA+fCd/0dcTHMHSl4/sS3BWY+5iUCIeOZpzRTvouKLq+ggK9hvz82Me5y33x+8Wvb
 ERDyCg0e5aSSerR+eVfuvZhg0/6pZycemRrEVxP8/SRWqGyp1Iz5eOXEoq+17TuzBjvI
 l1CKX2IhLcJvngdBJhLgRDCcn+zwU2GPvkb4rPX4+EIkLDR7co8j6LQXufyH1XdwJdia Kw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm8v9g06t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 00:31:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3640VgkG016871
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 00:31:42 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 17:31:42 -0700
Message-ID: <6be5a835-ce9b-5417-43a9-a267eabc111b@quicinc.com>
Date: Mon, 3 Jul 2023 17:31:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/8] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s
 stop_req param
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-6-dmitry.baryshkov@linaro.org>
 <61760ea5-92a4-2150-033f-7d8a9b167eb7@quicinc.com>
 <CAA8EJprDwLhVQv1peOt71t-RTDBx2k72WqS0kpOsQudav=dhtw@mail.gmail.com>
 <ecad5268-e867-c472-40d1-e22ad102ba99@quicinc.com>
 <CAA8EJpo5jy=XM8v3xVFWxHcy3s4q_a4g6GuKxaKqzgXJLH144w@mail.gmail.com>
 <e4e49b8a-80de-0e3a-d563-6bdd0e8f7c0e@quicinc.com>
 <CAA8EJprHnAVHkT81tnpuZj14qeL1AgoRXyFVFGDFAanKi9UE5A@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprHnAVHkT81tnpuZj14qeL1AgoRXyFVFGDFAanKi9UE5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VTxWbQhp6JozAAIFwCfClxG3ojrU8dq-
X-Proofpoint-GUID: VTxWbQhp6JozAAIFwCfClxG3ojrU8dq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_17,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307040002
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/3/2023 5:28 PM, Dmitry Baryshkov wrote:
> On Tue, 4 Jul 2023 at 02:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/3/2023 4:01 PM, Dmitry Baryshkov wrote:
>>> On Tue, 4 Jul 2023 at 01:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 7/3/2023 3:53 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 4 Jul 2023 at 01:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
>>>>>>> The stop_req is true only in the dpu_crtc_disable() case, when
>>>>>>> crtc->enable has already been set to false. This renders the stop_req
>>>>>>> argument useless. Remove it completely.
>>>>>>>
>>>>>>
>>>>>> What about the enable case?
>>>>>>
>>>>>> That time dpu_crtc->enabled  will be false but you need valid clock and
>>>>>> BW that time when you want to enable.
>>>>>
>>>>> Maybe I'm missing something here. The driver sets dpu_crtc->enabled in
>>>>> atomic_enable, while dpu_core_perf_crtc_update() is called further,
>>>>> during atomic_flush, or from the CRTC event handler. And both these
>>>>> cases have stop_req as false.
>>>>>
>>>>
>>>> But the first enable will happen with a commit too right?
>>>
>>> Which one? Could you please point to it?
>>>
>>
>> My question was that
>>
>> drm_atomic_helper_commit_planes which calls
>> drm_crtc_helper_funcs::atomic_flush (which calls
>> dpu_core_perf_crtc_update) is called before
>> drm_crtc_helper_funcs::atomic_enable which gets called only during
>> drm_atomic_helper_commit_modeset_enables in msm_atomic_commit_tail
>>
>> Wouldnt that get broken now?
> 
> No, crtc->enabled is false, as you pointed out, so (crtc->enabled &&
> !stop_req) will be false too.
> 

ah okay, no further concerns,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>>
>>
>>>>
>>>> Thats the one I am referring to.
>>>>
>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ++++++------
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +--
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +++---
>>>>>>>      3 files changed, 10 insertions(+), 11 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> index f8d5c87d0915..773e641eab28 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> @@ -277,7 +277,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>>>>>>>      }
>>>>>>>
>>>>>>>      int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>>>>>> -             int params_changed, bool stop_req)
>>>>>>> +                           int params_changed)
>>>>>>>      {
>>>>>>>          struct dpu_core_perf_params *new, *old;
>>>>>>>          bool update_bus = false, update_clk = false;
>>>>>>> @@ -301,13 +301,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>>>>>>          dpu_crtc = to_dpu_crtc(crtc);
>>>>>>>          dpu_cstate = to_dpu_crtc_state(crtc->state);
>>>>>>>
>>>>>>> -     DRM_DEBUG_ATOMIC("crtc:%d stop_req:%d core_clk:%llu\n",
>>>>>>> -                     crtc->base.id, stop_req, kms->perf.core_clk_rate);
>>>>>>> +     DRM_DEBUG_ATOMIC("crtc:%d enabled:%d core_clk:%llu\n",
>>>>>>> +                     crtc->base.id, crtc->enabled, kms->perf.core_clk_rate);
>>>>>>>
>>>>>>>          old = &dpu_crtc->cur_perf;
>>>>>>>          new = &dpu_cstate->new_perf;
>>>>>>>
>>>>>>> -     if (crtc->enabled && !stop_req) {
>>>>>>> +     if (crtc->enabled) {
>>>>>>>                  /*
>>>>>>>                   * cases for bus bandwidth update.
>>>>>>>                   * 1. new bandwidth vote - "ab or ib vote" is higher
>>>>>>> @@ -337,7 +337,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>>>>>>          }
>>>>>>>
>>>>>>>          trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
>>>>>>> -             new->core_clk_rate, stop_req, update_bus, update_clk);
>>>>>>> +             new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
>>>>>>>
>>>>>>>          if (update_bus) {
>>>>>>>                  ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
>>>>>>> @@ -355,7 +355,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>>>>>>          if (update_clk) {
>>>>>>>                  clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
>>>>>>>
>>>>>>> -             trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
>>>>>>> +             trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
>>>>>>>
>>>>>>>                  clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
>>>>>>>                  ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>>>> index 2bf7836f79bb..c29ec72984b8 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>>>> @@ -58,11 +58,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>>>>>>>       * dpu_core_perf_crtc_update - update performance of the given crtc
>>>>>>>       * @crtc: Pointer to crtc
>>>>>>>       * @params_changed: true if crtc parameters are modified
>>>>>>> - * @stop_req: true if this is a stop request
>>>>>>>       * return: zero if success, or error code otherwise
>>>>>>>       */
>>>>>>>      int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>>>>>> -             int params_changed, bool stop_req);
>>>>>>> +                           int params_changed);
>>>>>>>
>>>>>>>      /**
>>>>>>>       * dpu_core_perf_crtc_release_bw - release bandwidth of the given crtc
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>> index ff5d306b95ed..214229d11e3e 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>> @@ -718,7 +718,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
>>>>>>>      void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>>>>>>>      {
>>>>>>>          trace_dpu_crtc_complete_commit(DRMID(crtc));
>>>>>>> -     dpu_core_perf_crtc_update(crtc, 0, false);
>>>>>>> +     dpu_core_perf_crtc_update(crtc, 0);
>>>>>>>          _dpu_crtc_complete_flip(crtc);
>>>>>>>      }
>>>>>>>
>>>>>>> @@ -884,7 +884,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
>>>>>>>                  return;
>>>>>>>
>>>>>>>          /* update performance setting before crtc kickoff */
>>>>>>> -     dpu_core_perf_crtc_update(crtc, 1, false);
>>>>>>> +     dpu_core_perf_crtc_update(crtc, 1);
>>>>>>>
>>>>>>>          /*
>>>>>>>           * Final plane updates: Give each plane a chance to complete all
>>>>>>> @@ -1100,7 +1100,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>>>>>>>                  atomic_set(&dpu_crtc->frame_pending, 0);
>>>>>>>          }
>>>>>>>
>>>>>>> -     dpu_core_perf_crtc_update(crtc, 0, true);
>>>>>>> +     dpu_core_perf_crtc_update(crtc, 0);
>>>>>>>
>>>>>>>          drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
>>>>>>>                  dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
> 
> 
> 
