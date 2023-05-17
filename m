Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7D70769E
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B2E10E4AB;
	Wed, 17 May 2023 23:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C89510E035;
 Wed, 17 May 2023 23:53:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HNbfXg029403; Wed, 17 May 2023 23:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mpxz3jeY/B46qeI4HbNhXtuU9VYiebUbnv4RkVFXRyU=;
 b=hP5isYQT7Dq2YVsfDqAw+1h52n5gBkrgYEmSxfaDV4vbFaWS+3l2pW2EvtIR1DPKfmKH
 20VKkfBgpOvErbMn14CZ0u4t22/tnNWOVIG1dwxN8xRtYO2ac7HiE+ZsKlMf5gDIqKsP
 yDR0cPJPg2IscOsSCgiV43FRJcrKopgDScxRFPwaho4R/TWf1s8K+jyxl9jdUKIie59E
 IUP6ZgVsD0R6Bsxe1Dm5DDbbpqyfwCq+ArpyVg21fkhJHtfhm/3JJedd3XeW2ExcXLlV
 szJ1xKyjsF6KngqHs6xgqfcNMA5aYbGFPtE1j2VQtC/PdQMKC0IxsyzZxwHUzct9RV0d 4A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn8a601vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 23:53:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HNrVHC000556
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 23:53:31 GMT
Received: from [10.110.94.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 16:53:31 -0700
Message-ID: <7b385f62-7818-a28c-0d88-a825f3b58dce@quicinc.com>
Date: Wed, 17 May 2023 16:53:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v2 05/13] drm/msm/dpu: get rid of struct
 dpu_rm_requirements
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-6-dmitry.baryshkov@linaro.org>
 <a1ba90c2-8144-ccf3-b38e-0dbb549a7481@quicinc.com>
 <CAA8EJppAaXWpSNMMWTRKVa8=oNyAP7K1LcwusmEY4L-5-nqLow@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppAaXWpSNMMWTRKVa8=oNyAP7K1LcwusmEY4L-5-nqLow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: l_Yp6UvRuJLo3TRQv7Flg2AklP8W8PMd
X-Proofpoint-ORIG-GUID: l_Yp6UvRuJLo3TRQv7Flg2AklP8W8PMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305170196
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/14/2023 10:06 AM, Dmitry Baryshkov wrote:
> On Sat, 13 May 2023 at 01:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>> The struct dpu_rm_requirements was used to wrap display topology and
>>> hw resources, which meant INTF indices. As of commit ef58e0ad3436
>>> ("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
>>> resources struct was removed, leaving struct dpu_rm_requirements
>>> containing a single field (topology). Remove the useless wrapper.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Irrespective of where we plan to have the topology, this change doesn't
>> seem incorrect as such.
>>
>> The only thing I can think of is when we need more information to be
>> passed to the RM to allocate the blocks in addition to the topology this
>> struct could have been expanded.
>>
>> So one example I can think of is lets say I want to add CDM block
>> support. Then that information is outside of topology today because I
>> will use CDM if my output format is yuv. It has nothing to do with
>> topology but that block still needs to come from RM.
> 
> I'd say, it is a part of the topology. CDM blocks are a part of the
> pipeline, aren't they?
> 
> If you prefer, we can rename msm_display_topology to dpu_rm_requirements itself.
> 

I am fine with renaming msm_display_topology to dpu_rm_requirements.

Because making CDM part of topology wont be right.

>> I know that usually I have lost on these type of discussions saying that
>> if the code is not there yet, it should be dropped but I do have a plan
>> to add that support soon probably by the next cycle. That time we will
>> need some sort of wrapper to hold the topology and "extra" information
>> to allocate the blocks.
>>
>> One alternative ofcourse is to expand dpu_rm_reserve() to accept
>> something like "needs_cdm" but this is not scalable.
>>
>> Thoughts?
>>
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 69 +++++++--------------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
>>>    3 files changed, 23 insertions(+), 50 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 4ee708264f3b..a2cb23dea0b8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -638,7 +638,7 @@ static int dpu_encoder_virt_atomic_check(
>>>
>>>                if (!crtc_state->active_changed || crtc_state->enable)
>>>                        ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>>> -                                     drm_enc, crtc_state, topology);
>>> +                                     drm_enc, crtc_state, &topology);
>>>        }
>>>
>>>        trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index f4dda88a73f7..952e139c0234 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -24,15 +24,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
>>>        return res_map[idx] && res_map[idx] != enc_id;
>>>    }
>>>
>>> -/**
>>> - * struct dpu_rm_requirements - Reservation requirements parameter bundle
>>> - * @topology:  selected topology for the display
>>> - * @hw_res:     Hardware resources required as reported by the encoders
>>> - */
>>> -struct dpu_rm_requirements {
>>> -     struct msm_display_topology topology;
>>> -};
>>> -
>>>    int dpu_rm_destroy(struct dpu_rm *rm)
>>>    {
>>>        int i;
>>> @@ -329,14 +320,13 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
>>>     *      mixer in rm->pingpong_blks[].
>>>     * @dspp_idx: output parameter, index of dspp block attached to the layer
>>>     *      mixer in rm->dspp_blks[].
>>> - * @reqs: input parameter, rm requirements for HW blocks needed in the
>>> - *      datapath.
>>> + * @topology:  selected topology for the display
>>>     * Return: true if lm matches all requirements, false otherwise
>>>     */
>>>    static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>>>                struct dpu_global_state *global_state,
>>>                uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
>>> -             struct dpu_rm_requirements *reqs)
>>> +             struct msm_display_topology *topology)
>>>    {
>>>        const struct dpu_lm_cfg *lm_cfg;
>>>        int idx;
>>> @@ -361,7 +351,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>>>        }
>>>        *pp_idx = idx;
>>>
>>> -     if (!reqs->topology.num_dspp)
>>> +     if (!topology->num_dspp)
>>>                return true;
>>>
>>>        idx = lm_cfg->dspp - DSPP_0;
>>> @@ -383,7 +373,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>>>    static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>                               struct dpu_global_state *global_state,
>>>                               uint32_t enc_id,
>>> -                            struct dpu_rm_requirements *reqs)
>>> +                            struct msm_display_topology *topology)
>>>
>>>    {
>>>        int lm_idx[MAX_BLOCKS];
>>> @@ -391,14 +381,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>        int dspp_idx[MAX_BLOCKS] = {0};
>>>        int i, j, lm_count = 0;
>>>
>>> -     if (!reqs->topology.num_lm) {
>>> -             DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
>>> +     if (!topology->num_lm) {
>>> +             DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
>>>                return -EINVAL;
>>>        }
>>>
>>>        /* Find a primary mixer */
>>>        for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
>>> -                     lm_count < reqs->topology.num_lm; i++) {
>>> +                     lm_count < topology->num_lm; i++) {
>>>                if (!rm->mixer_blks[i])
>>>                        continue;
>>>
>>> @@ -407,7 +397,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>
>>>                if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
>>>                                enc_id, i, &pp_idx[lm_count],
>>> -                             &dspp_idx[lm_count], reqs)) {
>>> +                             &dspp_idx[lm_count], topology)) {
>>>                        continue;
>>>                }
>>>
>>> @@ -415,7 +405,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>
>>>                /* Valid primary mixer found, find matching peers */
>>>                for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
>>> -                             lm_count < reqs->topology.num_lm; j++) {
>>> +                             lm_count < topology->num_lm; j++) {
>>>                        if (!rm->mixer_blks[j])
>>>                                continue;
>>>
>>> @@ -428,7 +418,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>                        if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
>>>                                        global_state, enc_id, j,
>>>                                        &pp_idx[lm_count], &dspp_idx[lm_count],
>>> -                                     reqs)) {
>>> +                                     topology)) {
>>>                                continue;
>>>                        }
>>>
>>> @@ -437,7 +427,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>                }
>>>        }
>>>
>>> -     if (lm_count != reqs->topology.num_lm) {
>>> +     if (lm_count != topology->num_lm) {
>>>                DPU_DEBUG("unable to find appropriate mixers\n");
>>>                return -ENAVAIL;
>>>        }
>>> @@ -446,7 +436,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>                global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
>>>                global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
>>>                global_state->dspp_to_enc_id[dspp_idx[i]] =
>>> -                     reqs->topology.num_dspp ? enc_id : 0;
>>> +                     topology->num_dspp ? enc_id : 0;
>>>
>>>                trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
>>>                                         pp_idx[i] + PINGPONG_0);
>>> @@ -539,44 +529,30 @@ static int _dpu_rm_make_reservation(
>>>                struct dpu_rm *rm,
>>>                struct dpu_global_state *global_state,
>>>                struct drm_encoder *enc,
>>> -             struct dpu_rm_requirements *reqs)
>>> +             struct msm_display_topology *topology)
>>>    {
>>>        int ret;
>>>
>>> -     ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, reqs);
>>> +     ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
>>>        if (ret) {
>>>                DPU_ERROR("unable to find appropriate mixers\n");
>>>                return ret;
>>>        }
>>>
>>>        ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
>>> -                             &reqs->topology);
>>> +                                topology);
>>>        if (ret) {
>>>                DPU_ERROR("unable to find appropriate CTL\n");
>>>                return ret;
>>>        }
>>>
>>> -     ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
>>> +     ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
>>>        if (ret)
>>>                return ret;
>>>
>>>        return ret;
>>>    }
>>>
>>> -static int _dpu_rm_populate_requirements(
>>> -             struct drm_encoder *enc,
>>> -             struct dpu_rm_requirements *reqs,
>>> -             struct msm_display_topology req_topology)
>>> -{
>>> -     reqs->topology = req_topology;
>>> -
>>> -     DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
>>> -                   reqs->topology.num_lm, reqs->topology.num_dsc,
>>> -                   reqs->topology.num_intf);
>>> -
>>> -     return 0;
>>> -}
>>> -
>>>    static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
>>>                                  uint32_t enc_id)
>>>    {
>>> @@ -608,9 +584,8 @@ int dpu_rm_reserve(
>>>                struct dpu_global_state *global_state,
>>>                struct drm_encoder *enc,
>>>                struct drm_crtc_state *crtc_state,
>>> -             struct msm_display_topology topology)
>>> +             struct msm_display_topology *topology)
>>>    {
>>> -     struct dpu_rm_requirements reqs;
>>>        int ret;
>>>
>>>        /* Check if this is just a page-flip */
>>> @@ -625,13 +600,11 @@ int dpu_rm_reserve(
>>>        DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
>>>                      enc->base.id, crtc_state->crtc->base.id);
>>>
>>> -     ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
>>> -     if (ret) {
>>> -             DPU_ERROR("failed to populate hw requirements\n");
>>> -             return ret;
>>> -     }
>>> +     DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
>>> +                   topology->num_lm, topology->num_dsc,
>>> +                   topology->num_intf);
>>>
>>> -     ret = _dpu_rm_make_reservation(rm, global_state, enc, &reqs);
>>> +     ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
>>>        if (ret)
>>>                DPU_ERROR("failed to reserve hw resources: %d\n", ret);
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> index d62c2edb2460..f05697462856 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> @@ -71,7 +71,7 @@ int dpu_rm_reserve(struct dpu_rm *rm,
>>>                struct dpu_global_state *global_state,
>>>                struct drm_encoder *drm_enc,
>>>                struct drm_crtc_state *crtc_state,
>>> -             struct msm_display_topology topology);
>>> +             struct msm_display_topology *topology);
>>>
>>>    /**
>>>     * dpu_rm_reserve - Given the encoder for the display chain, release any
> 
> 
> 
