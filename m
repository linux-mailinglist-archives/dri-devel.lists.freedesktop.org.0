Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F20B17571
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 19:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E3C10E28B;
	Thu, 31 Jul 2025 17:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEnTLPRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD3610E288
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 17:08:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDf8RH002397
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 17:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GtfRg6ZF4ZVfESZEfQJ18GzI3Pea+wsXgaYV5Vzg3Uw=; b=VEnTLPRfRIMHNcqu
 66Q7Zs226RstoCrhLSvCvOv8ga0NULtVA1FDUwRDM9AsNF6kXAWiuGak6iM1r0Yu
 vOfonC3ugN12iEhMs8GRBEUCqD4xVr68K+Wv4b9BiXTsWUwhIwbXPh/uvCzfJThN
 /7DWKfx3B6JYbapbGlkr1Xd2Nfqn7HyPIH83vwzESnz0gsHg64IHJFUQBNNWyQfS
 0/B9QDU6/ldy58qIkukyW+CPU5fNkqEMeK97IhnVY+wWrm69bJ0gGUbDaF1m9MAS
 ElfdZdpaUlVigm19fM2RSAmng+2gYWQ1Pj3LOej8iEot6qc3S+TSOoWE06mOrdc/
 aN/BPg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm8fqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 17:08:58 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-421e4901a49so121849b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753981737; x=1754586537;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GtfRg6ZF4ZVfESZEfQJ18GzI3Pea+wsXgaYV5Vzg3Uw=;
 b=rOo2FlfpwdOylkZ/wclx4rA8lrANi+e+jxTBJeH+FmGLc9WUB/csw8DMdbQOr84sjw
 sxPb8gRBNe2Pym9r/B2xShRXa5stjb43O63n2bhQDhXcwuAT99LcekJsPKgszg5swf8r
 pD2Nhy8rIG4aENK9yy00kh3JRvz7FROMiIJPauRcHCci80d5WpIMdylfX3iHKK//uJ0a
 g8fnf18MtzU0JU12XGd1VkS83E/BlAlNNFExnRSLXWKRZg1HHp4Rsmit/ijhQIbPTh57
 OysID/3dM+R/b6yDjAaeZNZkMAMiB69xnpN7+g2sgV27b62D3WfuSlGUNin15yFAYUiE
 ajTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW6h5EY/WwWzV/zrtQDslN8Y2F9LvlMCs5Rae9+P98Ye0ZaQVJbVBIRx9JouvnId3JZXcGiMOuRlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgQnSsQjklh+12ng8EzbfckAN1zPbQE6efsbjUgOUCbPtpAgQU
 lyLtMKmdPseux7vyd/KLpBlvGsYnRhJd9zVhFv4LpQPKcZF3ecWUUvEh/NiA1Uj0R8s/fu5R3FZ
 co9pC2uKUN77t2HTbSe1dcG05cfiiDF1KAd6i5iVJICbx8GtGrpUYAoKHmB0p67MGny77unE=
X-Gm-Gg: ASbGnctbTF1+2qeIljCutWQc844wqlBNeTutZp4qXXjoqMoFGY1PiNbNxslkZjmxA9B
 wd3vvvwDCtu06G6bXlCTCYzTonMk0wyr2OtzZ2mqW7ipZKfcOxJRNFmgQLC+hUU0sEJDaudtz6J
 L1vHqLk/WzsKIr+X5Uf+2a67OjqW4+xrgY+drCaa46SR9dG1QAEXRDUarHeznl3RqKAfOib85mT
 K0w80rMtfQrYWx1k7X2MtnCr63wnYy7QRjJse6sqnkrcRE+kefaI7CwAvxSXYv48CioiA+gHglo
 7ToeGP65MsQq3g/u3vUjBxpHp6z3Dw9smk8JbINl7t8oEmreTVAx8xQ5/e1bUQgKLfezZ+jr139
 a6v8tYOSFLl18vA==
X-Received: by 2002:a05:6808:1409:b0:41c:95a3:8180 with SMTP id
 5614622812f47-4319b43b6dbmr5283418b6e.20.1753981737169; 
 Thu, 31 Jul 2025 10:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+OypuAGGtVpznevK8exqeiiyeTVEUujNPDG8SbmILGSpx5BCp+glpBxBspqy2bxr4PhAjWw==
X-Received: by 2002:a05:6808:1409:b0:41c:95a3:8180 with SMTP id
 5614622812f47-4319b43b6dbmr5283376b6e.20.1753981736549; 
 Thu, 31 Jul 2025 10:08:56 -0700 (PDT)
Received: from [10.148.43.238] (87-95-32-33.bb.dnainternet.fi. [87.95.32.33])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8899f897sm298252e87.49.2025.07.31.10.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 10:08:54 -0700 (PDT)
Message-ID: <c7346b52-c5a0-4aa2-a8d4-92761e33b011@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 20:08:53 +0300
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
 <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
 <CABymUCO63-V7MoWpgCTEV_8R_4rVHM-1=eyRP34=OdKGpYSLDQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCO63-V7MoWpgCTEV_8R_4rVHM-1=eyRP34=OdKGpYSLDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688ba32a cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=H8T8cKqSsIHj2cBiWKmgXw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=uxWrRjmYTHnT6oAD6TgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDExOSBTYWx0ZWRfX5tXb+hQW2eri
 UKEx4KjomKcLjV80Gl4Ref5wNqpVbGa2cg7Y55flcw+C+5mg8F6RGbXs0YriAIXKvJycJUyjYwr
 Icf1ukKLTg6jiB0N9rAcmE9iOmH1R2BB6s2aI2KbVNZH04qZisvnceH+Pb+xa+no60gGbMUfhG8
 /qlz65IYClRLtqzxOp97lCDAaPQJ0js+tZvBri01wY0C/L2H+pJx01P2+DUWFclhOyoABA2wUlm
 1JUR22JKU5FVFELFydTHO6ypHVCYNhN913QfdA0i8xJbbO1Obqi6BrU+D72y7Ez8dJwrE06NVhQ
 nh5rAC3s/lmXqQZLJNo5Xhu+CDCLztUs0mmfF0eU3zROruBSVl//fPgcZtGfFEbL1Ip1Y9fXntg
 7U+5M4suHPxjjoqIdc+E+dWqN4AALVRA3A0qZQsGGoweOuueWfdtcEJVEhgvgYh6ozZ9/uiz
X-Proofpoint-ORIG-GUID: cc15AJFaDTU24sBIgrui5RMgjLwznnUn
X-Proofpoint-GUID: cc15AJFaDTU24sBIgrui5RMgjLwznnUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310119
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

On 31/07/2025 18:37, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 22:22写道：
>>
>> On 31/07/2025 13:52, Jun Nie wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 02:52写道：
>>>>
>>>> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
>>>>> Currently, SSPPs are assigned to a maximum of two pipes. However,
>>>>> quad-pipe usage scenarios require four pipes and involve configuring
>>>>> two stages. In quad-pipe case, the first two pipes share a set of
>>>>> mixer configurations and enable multi-rect mode when certain
>>>>> conditions are met. The same applies to the subsequent two pipes.
>>>>>
>>>>> Assign SSPPs to the pipes in each stage using a unified method and
>>>>> to loop the stages accordingly.
>>>>>
>>>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++------------
>>>>>    1 file changed, 99 insertions(+), 61 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f460d62901dced65e3a9e 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>>>>>    }
>>>>>
>>>>>
>>>>> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state *pstate,
>>>>> +                                            struct dpu_sw_pipe **single_pipe,
>>>>> +                                            struct dpu_sw_pipe_cfg **single_pipe_cfg,
>>>>> +                                            int stage_index)
>>>>> +{
>>>>> +     int pipe_idx, i, valid_pipe = 0;
>>>>> +
>>>>> +     for (i = 0; i < PIPES_PER_STAGE; i++) {
>>>>
>>>> Why do you need to loop here? Is there a case when pipe 0 is not
>>>> assigned, but pipe 1 is?
>>>
>>> Loop the pipe in a stage to count the valid pipes. If there are 2 valid
>>> pipes in stage of the current plane, this function will return false.
>>> Or you prefer the below coding?
>>>
>>> 1029         pipe_idx = stage_index * PIPES_PER_STAGE;
>>> 1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0 &&
>>> 1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
>>> 1].src_rect) == 0) {
>>
>> Yes, this is better from my POV. But the bigger question is why do you
>> need it at all? What is wrong with the existing check? Can it be that
>> pipe0 is not used, but pipe1 is used?
> 
> There is no case that pipe0 is not used, but pipe1 is used. Existing check
> does not filter the plane which contains single pipe in a stage, which can
> be a candidate for SSPP sharing. If the stage contains 2 valid pipes or
> no valid pipes, it is skipped in dpu_plane_try_multirect_shared(), or it is
> skipped to be stored in prev_adjacent_plane_state[].

Oh, I see, you need to check both pipes because you might need to skip 
it completely. I'd really prefer to have more explicit code:

- check for pipe0, skip this part of the plane if there is none
- check for pipe1, if there is none, it's a candidate for sharing.

If that becomes too ugly, then yes, explicit check for pipe0 and pipe1 
are better than a loop.

> 
>>
>>> 1032                         if (single_pipe)
>>
>> You don't need these ifs. You always pass a valid pointer.
> 
> OK, a valid pointer can be passed though the return value may not be needed.

You are always passing a valid pointer there. If at any point we add 
other usage, then we'd need to add this if.

>>
>>> 1033                                 *single_pipe = &pstate->pipe[pipe_idx];
>>> 1034                         if (single_pipe_cfg)
>>> 1035                                 *single_pipe_cfg =
>>> &pstate->pipe_cfg[pipe_idx];
>>> 1036                 return true;
>>> 1037         }
>>> 1038
>>> 1039         return false;
>>>
>>>>
>>>>> +             pipe_idx = stage_index * PIPES_PER_STAGE + i;
>>>>> +             if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
>>>>> +                     valid_pipe++;
>>>>> +                     if (valid_pipe > 1)
>>>>> +                             return false;
>>>>> +
>>>>> +                     if (single_pipe)
>>>>> +                             *single_pipe = &pstate->pipe[pipe_idx];
>>>>> +                     if (single_pipe_cfg)
>>>>> +                             *single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     return valid_pipe == 1;
>>>>> +}
>>>>> +
>>>>>    static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>>>>>                                        struct drm_atomic_state *state,
>>>>>                                        const struct drm_crtc_state *crtc_state)
>>>>> @@ -1023,17 +1047,20 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
>>>>>    static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>>>>>                                           struct dpu_plane_state *prev_adjacent_pstate,
>>>>>                                           const struct msm_format *fmt,
>>>>> -                                       uint32_t max_linewidth)
>>>>> +                                       uint32_t max_linewidth, int stage_index)
>>>>>    {
>>>>> -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
>>>>> -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
>>>>> -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
>>>>> -     struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
>>>>> -     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
>>>>> +     struct dpu_sw_pipe *pipe, *prev_pipe;
>>>>> +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
>>>>>         const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
>>>>>         u16 max_tile_height = 1;
>>>>>
>>>>> -     if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
>>>>> +     if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
>>>>> +                                             &pipe_cfg, stage_index))
>>>>> +             return false;
>>>>> +
>>>>> +     if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
>>>>> +                                             &prev_pipe, &prev_pipe_cfg,
>>>>> +                                             stage_index) ||
>>>>>             prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>>>>>                 return false;
>>>>>
>>>>> @@ -1048,11 +1075,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>>>>>         if (MSM_FORMAT_IS_UBWC(prev_fmt))
>>>>>                 max_tile_height = max(max_tile_height, prev_fmt->tile_height);
>>>>>
>>>>> -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> -
>>>>> -     r_pipe->sspp = NULL;
>>>>> -
>>>>>         if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
>>>>>             dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
>>>>>             (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
>>>>> @@ -1181,36 +1203,69 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>>>>>         return 0;
>>>>>    }
>>>>>
>>>>> +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
>>>>> +                                           struct dpu_sw_pipe_cfg *pipe_cfg,
>>>>> +                                           struct drm_plane_state *plane_state,
>>>>> +                                           struct dpu_global_state *global_state,
>>>>> +                                           struct drm_crtc *crtc,
>>>>> +                                           struct dpu_rm_sspp_requirements *reqs)
>>>>> +{
>>>>> +     struct drm_plane *plane = plane_state->plane;
>>>>> +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>>>> +     struct dpu_sw_pipe *r_pipe = pipe + 1;
>>>>> +     struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
>>>>> +
>>>>> +     if (drm_rect_width(&pipe_cfg->src_rect) != 0) {
>>>>> +             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
>>>>> +             if (!pipe->sspp)
>>>>> +                     return -ENODEV;
>>>>> +             pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> +     }
>>>>> +
>>>>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
>>>>> +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
>>>>> +                                           pipe->sspp,
>>>>> +                                           msm_framebuffer_format(plane_state->fb),
>>>>> +                                           dpu_kms->catalog->caps->max_linewidth))
>>>>> +             goto stage_assinged;
>>>>> +
>>>>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
>>>>> +             r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
>>>>> +             if (!r_pipe->sspp)
>>>>> +                     return -ENODEV;
>>>>> +             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> +             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> +     }
>>>>> +
>>>>> +stage_assinged:
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>>    static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>>>                                               struct dpu_global_state *global_state,
>>>>>                                               struct drm_atomic_state *state,
>>>>>                                               struct drm_plane_state *plane_state,
>>>>> -                                           struct drm_plane_state *prev_adjacent_plane_state)
>>>>> +                                           struct drm_plane_state **prev_adjacent_plane_state)
>>>>>    {
>>>>>         const struct drm_crtc_state *crtc_state = NULL;
>>>>>         struct drm_plane *plane = plane_state->plane;
>>>>>         struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>>>>         struct dpu_rm_sspp_requirements reqs;
>>>>> -     struct dpu_plane_state *pstate, *prev_adjacent_pstate;
>>>>> +     struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_PER_PLANE];
>>>>>         struct dpu_sw_pipe *pipe;
>>>>> -     struct dpu_sw_pipe *r_pipe;
>>>>>         struct dpu_sw_pipe_cfg *pipe_cfg;
>>>>> -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
>>>>>         const struct msm_format *fmt;
>>>>> -     int i;
>>>>> +     int i, ret;
>>>>>
>>>>>         if (plane_state->crtc)
>>>>>                 crtc_state = drm_atomic_get_new_crtc_state(state,
>>>>>                                                            plane_state->crtc);
>>>>>
>>>>>         pstate = to_dpu_plane_state(plane_state);
>>>>> -     prev_adjacent_pstate = prev_adjacent_plane_state ?
>>>>> -             to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
>>>>> -
>>>>> -     pipe = &pstate->pipe[0];
>>>>> -     r_pipe = &pstate->pipe[1];
>>>>> -     pipe_cfg = &pstate->pipe_cfg[0];
>>>>> -     r_pipe_cfg = &pstate->pipe_cfg[1];
>>>>> +     for (i = 0; i < STAGES_PER_PLANE; i++)
>>>>> +             prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
>>>>> +                     to_dpu_plane_state(prev_adjacent_plane_state[i]) : NULL;
>>>>>
>>>>>         for (i = 0; i < PIPES_PER_PLANE; i++)
>>>>>                 pstate->pipe[i].sspp = NULL;
>>>>> @@ -1225,42 +1280,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>>>
>>>>>         reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>>>>>
>>>>> -     if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
>>>>> -             if (!prev_adjacent_pstate ||
>>>>> -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
>>>>> -                                                 dpu_kms->catalog->caps->max_linewidth)) {
>>>>> -                     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>>>> -                     if (!pipe->sspp)
>>>>> -                             return -ENODEV;
>>>>> -
>>>>> -                     r_pipe->sspp = NULL;
>>>>> +     for (i = 0; i < STAGES_PER_PLANE; i++) {
>>>>> +             if (!prev_adjacent_pstate[i])
>>>>> +                     goto assignment;
>>>>>
>>>>> -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> -
>>>>> -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> -             }
>>>>> -     } else {
>>>>> -             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>>>> -             if (!pipe->sspp)
>>>>> -                     return -ENODEV;
>>>>> -
>>>>> -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
>>>>> -                                                   pipe->sspp,
>>>>> -                                                   msm_framebuffer_format(plane_state->fb),
>>>>> -                                                   dpu_kms->catalog->caps->max_linewidth)) {
>>>>> -                     /* multirect is not possible, use two SSPP blocks */
>>>>> -                     r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>>>> -                     if (!r_pipe->sspp)
>>>>> -                             return -ENODEV;
>>>>> +             if (dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate[i], fmt,
>>>>> +                                                dpu_kms->catalog->caps->max_linewidth,
>>>>> +                                                i))
>>>>> +                     continue;
>>>>
>>>>
>>>> if (prev_adjacent_pstate[i] &&
>>>>       dpu_plane_try_multirect_shared())
>>>>           continue;
>>>>
>>>> No need for the goto.
>>>
>>> Right, it will be simpler.
>>>>
>>>>>
>>>>> -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> +assignment:
>>>>> +             if (dpu_plane_get_single_pipe_in_stage(pstate, NULL, NULL, i))
>>>>> +                     prev_adjacent_plane_state[i] = plane_state;
>>>>>
>>>>> -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> -             }
>>>>> +             pipe = &pstate->pipe[i * PIPES_PER_STAGE];
>>>>> +             pipe_cfg = &pstate->pipe_cfg[i * PIPES_PER_STAGE];
>>>>> +             ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
>>>>> +                                                      plane_state,
>>>>> +                                                      global_state,
>>>>> +                                                      crtc, &reqs);
>>>>> +             if (ret)
>>>>> +                     return ret;
>>>>>         }
>>>>>
>>>>>         return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>>>>> @@ -1273,7 +1313,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>>>>>                                unsigned int num_planes)
>>>>>    {
>>>>>         unsigned int i;
>>>>> -     struct drm_plane_state *prev_adjacent_plane_state = NULL;
>>>>> +     struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
>>>>>
>>>>>         for (i = 0; i < num_planes; i++) {
>>>>>                 struct drm_plane_state *plane_state = states[i];
>>>>> @@ -1284,11 +1324,9 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>>>>>
>>>>>                 int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>>>>>                                                              state, plane_state,
>>>>> -                                                          prev_adjacent_plane_state);
>>>>> +                                                          &prev_adjacent_plane_state[0]);
>>>>
>>>> It's exactly the prev_adjacent_plane_state.
>>>
>>> Yes, I will change it.
>>>
>>>>
>>>>>                 if (ret)
>>>>>                         break;
>>>>> -
>>>>> -             prev_adjacent_plane_state = plane_state;
>>>>>         }
>>>>>
>>>>>         return 0;
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
