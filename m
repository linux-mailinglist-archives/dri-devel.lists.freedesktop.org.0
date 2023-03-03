Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CC96A96A3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 12:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D748110E2CA;
	Fri,  3 Mar 2023 11:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B16710E121
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 11:43:10 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m6so3212147lfq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 03:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nPkAb4XsT1KDKFDrCSOIgbqSyJOcRefL1nDaNi4VEO0=;
 b=nUYoPgMPxZNPeL1KcFTEU+drcTyShLHp+uDhVEf+YXxz5ks12oG2PkR0xfWj4PSrdA
 m/SzVx7NVW6auAHU+8MWqIo7sx9lqzKIwPuxfzl7NJ3Iltb9QXvApCNNadLHRsBSZ00d
 5JgB4j8XFXbrAAvorTumKzW7M31N3JRsg7RbWNWNsWcdCfp/UaEA0hZPM5FsZrHo0ZMn
 YXFHuzqcrHZ1xTKJgE9LucvovgSH4J9QR7tF++wZ1365Dwr872svyCmW6QCQe7UDhrGN
 QACsk7Lich6rkKe0HKShqEPrVQEwZOdHB1LAO2/YaOTeXOUAnlFiavwmd50yoiNNc8VO
 DQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nPkAb4XsT1KDKFDrCSOIgbqSyJOcRefL1nDaNi4VEO0=;
 b=F8/ommBaYDp0l4V1S+U7VTWWKS6rIU+F8kxMQfENzTYYClnGvEeVohyVFhuPEhbCVC
 2snA/jSuyPWZLbhZslGH8hgLSUSwNe5Q0ilyWXLmIK7Xxi7dvXmX8hS42+jPRe43tAkh
 jZxE8l1sDQXpoWWH9O8mJnnG5xCLj+vzXSx5YezfRd/Gq9bk9WlR8gI1+nGDPGy9FbbB
 gfjPEJTca1y8opiRRabz5P0mOKF4xkvu2uWIJbkwZSycpVTolTNjF3hYonnng6noEtJm
 2y2DoyfPBuz7J3x4akYvJtL4rDyQHPagajlsiUEKTTxzqH8GaLIfM56oJiTP4cGYMK89
 UU5Q==
X-Gm-Message-State: AO0yUKX7BR9rEzVnTvX2xpEJCsvxiHcb7EKWEKiTWuI67AQQSt+qFms+
 5Dfyk69sG7sP9WXUkYJsrc7bfA==
X-Google-Smtp-Source: AK7set/x8bR/mdRY5iS2Rkumbm/P7bhpky40fiwF7k0L14ZqKkA/x/B1yw3NO9rGMO24KrJZuu6RGQ==
X-Received: by 2002:ac2:5a19:0:b0:4b5:43ef:a555 with SMTP id
 q25-20020ac25a19000000b004b543efa555mr431382lfn.69.1677843788787; 
 Fri, 03 Mar 2023 03:43:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a19c513000000b004cc831acce1sm356267lfe.285.2023.03.03.03.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 03:43:08 -0800 (PST)
Message-ID: <84781db7-b3f2-2bc2-511f-f07e05a428de@linaro.org>
Date: Fri, 3 Mar 2023 13:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 15/27] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-16-dmitry.baryshkov@linaro.org>
 <121827e3-3ec4-c0fd-d3fb-771150e79717@quicinc.com>
 <269a9f0e-b9c2-427d-acc0-e18262c0c4ff@linaro.org>
 <fb94f386-22af-c2c6-9071-8dcbe8c547c1@quicinc.com>
 <005030a5-bcc3-14ea-121f-fba794555626@linaro.org>
In-Reply-To: <005030a5-bcc3-14ea-121f-fba794555626@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 15/02/2023 02:08, Dmitry Baryshkov wrote:
> On 15/02/2023 01:25, Abhinav Kumar wrote:
>> Hi Dmitry
>>
>> Sorry for the late response on this one.
>>
>> On 2/3/2023 2:55 PM, Dmitry Baryshkov wrote:
>>> On 04/02/2023 00:44, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>> Move plane state updates from dpu_crtc_atomic_check() to the function
>>>>> where they belong: to dpu_plane_atomic_check().
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
>>>>>   3 files changed, 11 insertions(+), 31 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> index b485234eefb2..bd09bb319a58 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> @@ -1129,7 +1129,6 @@ static int dpu_crtc_atomic_check(struct 
>>>>> drm_crtc *crtc,
>>>>>                                         crtc);
>>>>>       struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>>>>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>>>>> -    struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>>>>       const struct drm_plane_state *pstate;
>>>>>       struct drm_plane *plane;
>>>>> @@ -1161,11 +1160,10 @@ static int dpu_crtc_atomic_check(struct 
>>>>> drm_crtc *crtc,
>>>>>       crtc_rect.x2 = mode->hdisplay;
>>>>>       crtc_rect.y2 = mode->vdisplay;
>>>>> -     /* get plane state for all drm planes associated with crtc 
>>>>> state */
>>>>> +    /* FIXME: move this to dpu_plane_atomic_check? */
>>>>>       drm_atomic_crtc_state_for_each_plane_state(plane, pstate, 
>>>>> crtc_state) {
>>>>>           struct dpu_plane_state *dpu_pstate = 
>>>>> to_dpu_plane_state(pstate);
>>>>>           struct drm_rect dst, clip = crtc_rect;
>>>>> -        int stage;
>>>>>           if (IS_ERR_OR_NULL(pstate)) {
>>>>>               rc = PTR_ERR(pstate);
>>>>> @@ -1179,8 +1177,6 @@ static int dpu_crtc_atomic_check(struct 
>>>>> drm_crtc *crtc,
>>>>>           dpu_pstate->needs_dirtyfb = needs_dirtyfb;
>>>>> -        dpu_plane_clear_multirect(pstate);
>>>>> -
>>>>>           dst = drm_plane_state_dest(pstate);
>>>>>           if (!drm_rect_intersect(&clip, &dst)) {
>>>>>               DPU_ERROR("invalid vertical/horizontal destination\n");
>>>>> @@ -1189,18 +1185,6 @@ static int dpu_crtc_atomic_check(struct 
>>>>> drm_crtc *crtc,
>>>>>                     DRM_RECT_ARG(&dst));
>>>>>               return -E2BIG;
>>>>>           }
>>>>> -
>>>>> -        /* verify stage setting before using it */
>>>>> -        stage = DPU_STAGE_0 + pstate->normalized_zpos;
>>>>> -        if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
>>>>> -            DPU_ERROR("> %d plane stages assigned\n",
>>>>> -                    dpu_kms->catalog->caps->max_mixer_blendstages 
>>>>> - DPU_STAGE_0);
>>>>> -            return -EINVAL;
>>>>> -        }
>>>>> -
>>>>> -        to_dpu_plane_state(pstate)->stage = stage;
>>>>> -        DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
>>>>> -
>>>>>       }
>>>>>       atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> index 1b3033b15bfa..5aabf9694a53 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> @@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct 
>>>>> dpu_plane *pdpu,
>>>>>       return 0;
>>>>>   }
>>>>> -void dpu_plane_clear_multirect(const struct drm_plane_state 
>>>>> *drm_state)
>>>>> -{
>>>>> -    struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
>>>>> -
>>>>> -    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> -    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> -}
>>>>> -
>>>>>   int dpu_plane_validate_multirect_v2(struct 
>>>>> dpu_multirect_plane_states *plane)
>>>>>   {
>>>>>       struct dpu_plane_state *pstate[R_MAX];
>>>>> @@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct 
>>>>> drm_plane *plane,
>>>>>       if (!new_plane_state->visible)
>>>>>           return 0;
>>>>> +    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> +    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> +
>>>>
>>>> But I am not sure if clearing the multirect belongs here and now I 
>>>> want to clarify one thing about 
>>>> https://patchwork.freedesktop.org/patch/521354/?series=99909&rev=4 
>>>> which was R-bed in the v1 and carried fwd since then.
>>>>
>>>> So prior to that change, we were only clearing the multirects of the 
>>>> planes that were staged to the crtc and we were getting those from 
>>>> the crtc state. But now we are clearing the multirect of all the 
>>>> planes.
>>>>
>>>> Dont we have to keep that in the crtc_atomic_check() since we do 
>>>> that on all the planes attached to a certain CRTC.
>>>>
>>>> In that case shouldnt we keep this in the crtc_atomic_check() and 
>>>> bring back pipe_staged[] without the multirect and source split 
>>>> cases ofcourse.
>>>
>>> What for? In other words, what would be the difference?
>>>
>>
>> So, please correct my understanding here. drm_plane's atomic_check() 
>> will be called for all the planes which are getting updated in this 
>> atomic commit using for_each_oldnew_plane_in_state() and drm_crtc's 
>> atomic_check() will be called for all the CRTC's in this atomic update 
>> using for_each_new_crtc_in_state() >
>> If the plane is not connected to any CRTC, why do we need to clear the 
>> multirect pstates.
> 
> If the plane is not connected to any CRTC, then we just don't care what 
> is there in the multirect state, so we might clear it as well.
> 
>>
>> OR in that case would atomic_commit not even be called if the plane is 
>> not connected to any CRTC?
>>
>> One case i can think of is the disable commit where the no planes will 
>> be connected to the CRTC so in that case, before this change we would 
>> explicitly clear out all the planes connected to the CRTC but now with 
>> this change is there a possibility that only if the plane state 
>> changed we would clear it out?
> 
> Ah. Maybe I understand your point. I think 
> drm_atomic_add_affected_planes() will ensure that all planes attached to 
> CRTCs are also a part of the atomic state.

Checked, it works as expected. But on the other hand, this pointed me to 
a possible issue in dpu_plane_atomic_disable. Probably we should drop 
the multirect setup there.

> 
> Regarding the change itself. Think about encapsulation. CRTC should not 
> care about plane's multirect state. It is a plane implementation detail. 
> As we delve upon a path of using rect1 and then even using different 
> SSPPs for the plane, these implementation details will change (mostly) 
> behind CRTC's back.
> 
>>
>>
>>>>
>>>>> +    pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>>>>> +    if (pstate->stage >= 
>>>>> pdpu->catalog->caps->max_mixer_blendstages) {
>>>>> +        DPU_ERROR("> %d plane stages assigned\n",
>>>>> +                pdpu->catalog->caps->max_mixer_blendstages - 
>>>>> DPU_STAGE_0);
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>
>>>> I agree that this check belongs to the plane_atomic_check().
>>>>
>>>>>       src.x1 = new_plane_state->src_x >> 16;
>>>>>       src.y1 = new_plane_state->src_y >> 16;
>>>>>       src.x2 = src.x1 + (new_plane_state->src_w >> 16);
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> index 228db401e905..a08b0539513b 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> @@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct 
>>>>> drm_device *dev,
>>>>>    */
>>>>>   int dpu_plane_validate_multirect_v2(struct 
>>>>> dpu_multirect_plane_states *plane);
>>>>> -/**
>>>>> - * dpu_plane_clear_multirect - clear multirect bits for the given 
>>>>> pipe
>>>>> - * @drm_state: Pointer to DRM plane state
>>>>> - */
>>>>> -void dpu_plane_clear_multirect(const struct drm_plane_state 
>>>>> *drm_state);
>>>>> -
>>>>>   /**
>>>>>    * dpu_plane_color_fill - enables color fill on plane
>>>>>    * @plane:  Pointer to DRM plane object
>>>
> 

-- 
With best wishes
Dmitry

