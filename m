Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE631B1732B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 16:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF0110E7A9;
	Thu, 31 Jul 2025 14:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HP6v7tO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D4810E7A9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:22:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDfUdN022949
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cumxPydGaXdXr23M62zK+6ZluXCGoN/6cCZO+k/JB8U=; b=HP6v7tO3AFX6IRe8
 27RHXPTsdKlABuhd2sg9E8bhobybkTW3CPQ0nX/KIJzg5CsLUDfJ96TNjoaJvmJ2
 ojHz5Lsi8cM8iN2YwwQWuDnqIg9PoR7C2e2qbIEaKAUMxqBZS4KbKfOLZFaDjFsp
 6L6RVXnEGLuANzlo2s6KBwvGhVfjn9pJPe234K6oxCcEySkTAoIOCh3ItmApnZFf
 qOLo2YmUAqqv7yPKLvc/8Qjx8nZyS0HR/NGCnrbt5UMuaXRWu2j2YM94a5aD1Goy
 oHtEgHDILyc+V4oCoTeRGHwvD7ydLyY1GqMqp2YZj6E0njJ46hOUMD/Gi+bffIu9
 Lld74w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrg8ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:22:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-4e7f71f7b23so1239978137.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 07:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753971776; x=1754576576;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cumxPydGaXdXr23M62zK+6ZluXCGoN/6cCZO+k/JB8U=;
 b=m83KA7xTBVhASmmOItw/0mgVuHzf5p2DKD5oGmyYn9nd64T2tUoZ9PZT98D15REMpl
 v4VNzN3z+4MCKG0FVxnHH69xpXEGE1IDnrk+asbR05pK8mZ5M4Ucu3pKQEnT0mzx5FEG
 LU+RH37yxsemL6rm0rub0MSa0rwT7dlVOoX+WTRkmcApkgq1KzCK77Tu/YJ0aBBt3JrG
 Q3/yGCGzkyA4O2PwTLSwyJTaelr6zg6c8YzIF1Qy84I5ASZd4NqbYPAjZh4YUHE5ruUX
 NmOQVJoDdU0PnI9MXuehVLwiE9/1cgk7iVbUAB/tm2nQPXzc4gD+mRV0BdlSti2YCNsk
 ibQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlXvUmcWkRfYXSYO1LuDmNeT4k4+w5ER0Oj6OPEJdyR5nO6Qg68dNyhM8LOJWsTVDHD1Bs61IHO9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMExo5ewC+Mr3yTaSyYyxL64uYDG6xSvdb2NU0YQ5vED8MBCJ8
 EOqm7puZMxCs0FuyGfjg2JkXjsmV++labYDd2HU0Ix1H5tZJDe1R9O/flpL19O5Zs+RoMiDwHhI
 a3G7EtJi/jF/czBRV8joj8NA6vcbWd2JOnQe6Al2Br2IcCHuVmOP2lXYLJmGV+dk/pCKMMEE=
X-Gm-Gg: ASbGnctmw+yfHwMs59uvBXLjVWdje4uMyQq5wbJxolgU7BXwHBxbPmcFYJXQOCisyDO
 izegp404H1J4aNjNf1vdWD7C1HARRWTrpVF7nHIW1bouiTyO4f9ZahQyrk24MBPNJ7aFjnW3rlh
 CrxywxiPMcg/ql0ZQhtjZD6fbQCwxjiWEeIY31pBH7LyA+Sgklu5N91ZIea07YqajpWY9cSDllW
 mPGDgLmg5A+Ojp52m+Or1/PY0TgTS6SkU3Lvv3ApWlgucJ9lQ7UvN6yFtcUgnBsXT2LgzLZOKcF
 ZS1dYNeNDy27dUqlGda5SWKfHbdYFfQ70r73O7NVFeIsdbz1xwTEViQTxaj/K3tTlhZM7MeNo9u
 OQN3M7shhqgfhkw==
X-Received: by 2002:a05:6102:1481:b0:4ec:c548:e57b with SMTP id
 ada2fe7eead31-4fbe7ad20fcmr6593380137.0.1753971776173; 
 Thu, 31 Jul 2025 07:22:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUzF0IvMTj4layT1beeEm79lTgU6LMGRnuAthR7tiThgTb6+mNFKQ4kHWPNL1F3QFE+XZnnQ==
X-Received: by 2002:a05:6102:1481:b0:4ec:c548:e57b with SMTP id
 ada2fe7eead31-4fbe7ad20fcmr6593274137.0.1753971775558; 
 Thu, 31 Jul 2025 07:22:55 -0700 (PDT)
Received: from [10.148.43.238] (87-95-32-33.bb.dnainternet.fi. [87.95.32.33])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88caf72esm250931e87.160.2025.07.31.07.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 07:22:54 -0700 (PDT)
Message-ID: <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 17:22:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
 <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
 <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA5NyBTYWx0ZWRfX3ykujA0E9zrO
 +R2K4QBDT0dhAcILWbI7HRGW9TzUKXwg0k9BvjJYZ82Wlwo3iDnn639YURC6OLKGcL46Wo+XwbO
 TqGwePX1WaHuYVucDLjV8FrX37+diCPQxeObHqFM7KVr7g8dBqfhIAZD+rOy/q1gE1jvgUhzqNy
 ahraK7/FsvkMNwG8Sfbd98KZQilF+iWYShgWAm6/TbaKZ+ToWrbiCroxiDkdPsCKrG17tfs6EL4
 EFOaUoA7qLnknQ5URyN9F33drWKsIWPxLxsiKrFvCTVpyenJOPxz6bbB68qPgGQHA3hMBqYwVZ5
 HtPssa8HMTGDeKNBNq2tu4ijRfCooHYig+JLXXr7uQSpb5eEfuZoH9E1lZ/QogV90syMCtg0Ruj
 j/n8GOSb4LG0kIZSUJczLHqxTouySxrwZrBO7dkorHiWQ2wnMOX7xn6x2kwJDrIL9XHGKksE
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688b7c41 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=H8T8cKqSsIHj2cBiWKmgXw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=ralHBGxwcQxE1AFxrOYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KxBIGNJFyqf3v5ypeKYdqVtRid_3woeP
X-Proofpoint-ORIG-GUID: KxBIGNJFyqf3v5ypeKYdqVtRid_3woeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_02,2025-07-31_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310097
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/07/2025 13:52, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 02:52写道：
>>
>> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
>>> Currently, SSPPs are assigned to a maximum of two pipes. However,
>>> quad-pipe usage scenarios require four pipes and involve configuring
>>> two stages. In quad-pipe case, the first two pipes share a set of
>>> mixer configurations and enable multi-rect mode when certain
>>> conditions are met. The same applies to the subsequent two pipes.
>>>
>>> Assign SSPPs to the pipes in each stage using a unified method and
>>> to loop the stages accordingly.
>>>
>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++------------
>>>   1 file changed, 99 insertions(+), 61 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f460d62901dced65e3a9e 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>>>   }
>>>
>>>
>>> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state *pstate,
>>> +                                            struct dpu_sw_pipe **single_pipe,
>>> +                                            struct dpu_sw_pipe_cfg **single_pipe_cfg,
>>> +                                            int stage_index)
>>> +{
>>> +     int pipe_idx, i, valid_pipe = 0;
>>> +
>>> +     for (i = 0; i < PIPES_PER_STAGE; i++) {
>>
>> Why do you need to loop here? Is there a case when pipe 0 is not
>> assigned, but pipe 1 is?
> 
> Loop the pipe in a stage to count the valid pipes. If there are 2 valid
> pipes in stage of the current plane, this function will return false.
> Or you prefer the below coding?
> 
> 1029         pipe_idx = stage_index * PIPES_PER_STAGE;
> 1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0 &&
> 1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
> 1].src_rect) == 0) {

Yes, this is better from my POV. But the bigger question is why do you 
need it at all? What is wrong with the existing check? Can it be that 
pipe0 is not used, but pipe1 is used?

> 1032                         if (single_pipe)

You don't need these ifs. You always pass a valid pointer.

> 1033                                 *single_pipe = &pstate->pipe[pipe_idx];
> 1034                         if (single_pipe_cfg)
> 1035                                 *single_pipe_cfg =
> &pstate->pipe_cfg[pipe_idx];
> 1036                 return true;
> 1037         }
> 1038
> 1039         return false;
> 
>>
>>> +             pipe_idx = stage_index * PIPES_PER_STAGE + i;
>>> +             if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
>>> +                     valid_pipe++;
>>> +                     if (valid_pipe > 1)
>>> +                             return false;
>>> +
>>> +                     if (single_pipe)
>>> +                             *single_pipe = &pstate->pipe[pipe_idx];
>>> +                     if (single_pipe_cfg)
>>> +                             *single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
>>> +             }
>>> +     }
>>> +
>>> +     return valid_pipe == 1;
>>> +}
>>> +
>>>   static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>>>                                       struct drm_atomic_state *state,
>>>                                       const struct drm_crtc_state *crtc_state)
>>> @@ -1023,17 +1047,20 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
>>>   static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>>>                                          struct dpu_plane_state *prev_adjacent_pstate,
>>>                                          const struct msm_format *fmt,
>>> -                                       uint32_t max_linewidth)
>>> +                                       uint32_t max_linewidth, int stage_index)
>>>   {
>>> -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
>>> -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
>>> -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
>>> -     struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
>>> -     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
>>> +     struct dpu_sw_pipe *pipe, *prev_pipe;
>>> +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
>>>        const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
>>>        u16 max_tile_height = 1;
>>>
>>> -     if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
>>> +     if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
>>> +                                             &pipe_cfg, stage_index))
>>> +             return false;
>>> +
>>> +     if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
>>> +                                             &prev_pipe, &prev_pipe_cfg,
>>> +                                             stage_index) ||
>>>            prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>>>                return false;
>>>
>>> @@ -1048,11 +1075,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>>>        if (MSM_FORMAT_IS_UBWC(prev_fmt))
>>>                max_tile_height = max(max_tile_height, prev_fmt->tile_height);
>>>
>>> -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> -
>>> -     r_pipe->sspp = NULL;
>>> -
>>>        if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
>>>            dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
>>>            (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
>>> @@ -1181,36 +1203,69 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>>>        return 0;
>>>   }
>>>
>>> +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
>>> +                                           struct dpu_sw_pipe_cfg *pipe_cfg,
>>> +                                           struct drm_plane_state *plane_state,
>>> +                                           struct dpu_global_state *global_state,
>>> +                                           struct drm_crtc *crtc,
>>> +                                           struct dpu_rm_sspp_requirements *reqs)
>>> +{
>>> +     struct drm_plane *plane = plane_state->plane;
>>> +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>> +     struct dpu_sw_pipe *r_pipe = pipe + 1;
>>> +     struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
>>> +
>>> +     if (drm_rect_width(&pipe_cfg->src_rect) != 0) {
>>> +             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
>>> +             if (!pipe->sspp)
>>> +                     return -ENODEV;
>>> +             pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> +     }
>>> +
>>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
>>> +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
>>> +                                           pipe->sspp,
>>> +                                           msm_framebuffer_format(plane_state->fb),
>>> +                                           dpu_kms->catalog->caps->max_linewidth))
>>> +             goto stage_assinged;
>>> +
>>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
>>> +             r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
>>> +             if (!r_pipe->sspp)
>>> +                     return -ENODEV;
>>> +             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> +             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> +     }
>>> +
>>> +stage_assinged:
>>> +     return 0;
>>> +}
>>> +
>>>   static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>                                              struct dpu_global_state *global_state,
>>>                                              struct drm_atomic_state *state,
>>>                                              struct drm_plane_state *plane_state,
>>> -                                           struct drm_plane_state *prev_adjacent_plane_state)
>>> +                                           struct drm_plane_state **prev_adjacent_plane_state)
>>>   {
>>>        const struct drm_crtc_state *crtc_state = NULL;
>>>        struct drm_plane *plane = plane_state->plane;
>>>        struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>>        struct dpu_rm_sspp_requirements reqs;
>>> -     struct dpu_plane_state *pstate, *prev_adjacent_pstate;
>>> +     struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_PER_PLANE];
>>>        struct dpu_sw_pipe *pipe;
>>> -     struct dpu_sw_pipe *r_pipe;
>>>        struct dpu_sw_pipe_cfg *pipe_cfg;
>>> -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
>>>        const struct msm_format *fmt;
>>> -     int i;
>>> +     int i, ret;
>>>
>>>        if (plane_state->crtc)
>>>                crtc_state = drm_atomic_get_new_crtc_state(state,
>>>                                                           plane_state->crtc);
>>>
>>>        pstate = to_dpu_plane_state(plane_state);
>>> -     prev_adjacent_pstate = prev_adjacent_plane_state ?
>>> -             to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
>>> -
>>> -     pipe = &pstate->pipe[0];
>>> -     r_pipe = &pstate->pipe[1];
>>> -     pipe_cfg = &pstate->pipe_cfg[0];
>>> -     r_pipe_cfg = &pstate->pipe_cfg[1];
>>> +     for (i = 0; i < STAGES_PER_PLANE; i++)
>>> +             prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
>>> +                     to_dpu_plane_state(prev_adjacent_plane_state[i]) : NULL;
>>>
>>>        for (i = 0; i < PIPES_PER_PLANE; i++)
>>>                pstate->pipe[i].sspp = NULL;
>>> @@ -1225,42 +1280,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>
>>>        reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>>>
>>> -     if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
>>> -             if (!prev_adjacent_pstate ||
>>> -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
>>> -                                                 dpu_kms->catalog->caps->max_linewidth)) {
>>> -                     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>> -                     if (!pipe->sspp)
>>> -                             return -ENODEV;
>>> -
>>> -                     r_pipe->sspp = NULL;
>>> +     for (i = 0; i < STAGES_PER_PLANE; i++) {
>>> +             if (!prev_adjacent_pstate[i])
>>> +                     goto assignment;
>>>
>>> -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> -
>>> -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> -             }
>>> -     } else {
>>> -             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>> -             if (!pipe->sspp)
>>> -                     return -ENODEV;
>>> -
>>> -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
>>> -                                                   pipe->sspp,
>>> -                                                   msm_framebuffer_format(plane_state->fb),
>>> -                                                   dpu_kms->catalog->caps->max_linewidth)) {
>>> -                     /* multirect is not possible, use two SSPP blocks */
>>> -                     r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>> -                     if (!r_pipe->sspp)
>>> -                             return -ENODEV;
>>> +             if (dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate[i], fmt,
>>> +                                                dpu_kms->catalog->caps->max_linewidth,
>>> +                                                i))
>>> +                     continue;
>>
>>
>> if (prev_adjacent_pstate[i] &&
>>      dpu_plane_try_multirect_shared())
>>          continue;
>>
>> No need for the goto.
> 
> Right, it will be simpler.
>>
>>>
>>> -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> +assignment:
>>> +             if (dpu_plane_get_single_pipe_in_stage(pstate, NULL, NULL, i))
>>> +                     prev_adjacent_plane_state[i] = plane_state;
>>>
>>> -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>> -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> -             }
>>> +             pipe = &pstate->pipe[i * PIPES_PER_STAGE];
>>> +             pipe_cfg = &pstate->pipe_cfg[i * PIPES_PER_STAGE];
>>> +             ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
>>> +                                                      plane_state,
>>> +                                                      global_state,
>>> +                                                      crtc, &reqs);
>>> +             if (ret)
>>> +                     return ret;
>>>        }
>>>
>>>        return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>>> @@ -1273,7 +1313,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>>>                               unsigned int num_planes)
>>>   {
>>>        unsigned int i;
>>> -     struct drm_plane_state *prev_adjacent_plane_state = NULL;
>>> +     struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
>>>
>>>        for (i = 0; i < num_planes; i++) {
>>>                struct drm_plane_state *plane_state = states[i];
>>> @@ -1284,11 +1324,9 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>>>
>>>                int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>>>                                                             state, plane_state,
>>> -                                                          prev_adjacent_plane_state);
>>> +                                                          &prev_adjacent_plane_state[0]);
>>
>> It's exactly the prev_adjacent_plane_state.
> 
> Yes, I will change it.
> 
>>
>>>                if (ret)
>>>                        break;
>>> -
>>> -             prev_adjacent_plane_state = plane_state;
>>>        }
>>>
>>>        return 0;
>>>
>>> --
>>> 2.34.1
>>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
