Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E40DB0D8DA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 14:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E59E10E668;
	Tue, 22 Jul 2025 12:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHpK7gm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE7710E668
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:04:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M83m0M010525
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +XG90C/um6yxXD5+3AqDRLT4qWkqNRjAHgyLRjePWmw=; b=iHpK7gm01yqL68ho
 w6aYJlpsBxQGMZxx07WGAIQDw6Pi1yVgXo2GVTyHu+NIzq2acs18/7n1qPRZaXmt
 EPOBGNJ/rey0N22VULsXpgGZGucedm6UabuVM4SN9EEm7B80jBpQKOU0nA1mUfwE
 lTKkLsGqehH1c8jqLamXg2h3Uy/X5LoauF1mRy9IQC3iKLXaJGGxfBRpdDtyu7/+
 GwQ2NPAuhTTGpp2oJ7pM5N+80YPNfmRv75DCSlTEugFwWdm79R7jfVHn06Tb0g0R
 u4tMjMVmeFV7gQaTXPjMzigGSuPBs3OKtpEY92SkuRzwN2YvqDTdJL+OVM/sjxpZ
 2XQvqQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t18pa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:04:21 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-73c874ac31dso6191353a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 05:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753185861; x=1753790661;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+XG90C/um6yxXD5+3AqDRLT4qWkqNRjAHgyLRjePWmw=;
 b=XkoM90X+FTxnU6rsGw4gJpRpwkKAYGtE9QfJgfYl8vmDX2bmnYyFInVq+xhNbL0NfR
 AZ+yTFHIDmrQzJXLgTyCxWnfzU2M9aE+3KWpomdscdIMTEoeyM/1T14Lt1Llmf3o7fqB
 hffFuk/F4domFTFEmRHUwcogQvV0TqFq7Vc58dGhANw6GCjIcIjc4om3kN/lpK7nuqOM
 ke5KUwgPa8+JJ/2/tL/ndZjYAPJAVZVJUAXqMID9vW9gJcbWJnEMkoMnpTkqCW3ZvXWQ
 tZpG5kpJnQ8r9LI3svzyubKqX/OmXc/BhWIbXU7b43PHzFVN+2vhVTcgT8PTuz8s1Ors
 LZwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvqjOcOxtOiZy5XF8H8V1aLCG5R9GnxG1x5n2AUdU/96rA8PL9BcJ1qCjGD/5LlSF/OOALXU22dMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI2/0wRHtUKt8Fu7oTS3c9LVnJVARRV5uqB1AiWIBELVms6Lna
 XmwMgtUFmoY3krU/e1sB+i4kc6mXfamzneMcGciVP++XD1YQnWidNhfrxXAFcyRRVE7dYGbA8ss
 r/cKUmVnRpup+c+AinvOdxeVnQAkUbOmnisYW/thZ4f0ump8RfOfbnHXUySB87d241kizBOs=
X-Gm-Gg: ASbGncsZ/O7vlvDFX0aQaW73HfbK+9gf5qZGetqXDnzk8MNRWdfTv4GkF2Ie7UOUZx0
 vujkdr+SuhTg5k5zK974ZaJSYotTrX44cbPdkFzris6MqgjgVQlqNYJjDH1V0WnLcgGg73Sm3s2
 g8jzpGnZir/EK975xN31sZjOcAc4dsBTAJnQZshpoKw9/RJi49o5Y0gpsF+F1XbQ+M3DnG9HgU2
 Vi+AVrZ7XkvN6P3PuLTaN06UJmXevStuC9uCMZO4FNx5GSQDysHfaS5/Hmz47xANabCIFE/PYEM
 3bSGfRIpUOotNEglOot18G/zRS9Y/BYPIYvd/VJs7e8syDb+zml8y18OGgxnOXsLxlrQCxUcdhw
 c09OVUmFjp5FVInPFlgClKEj14trtH2AFEeHrV8C6N5X/nJ75b8Ng
X-Received: by 2002:a05:6808:2384:b0:407:59ac:d73f with SMTP id
 5614622812f47-41cefe09d5cmr17438879b6e.21.1753185860641; 
 Tue, 22 Jul 2025 05:04:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtOpeAIrEejTxoISQ16qIfCCckK6NW452J8VXPtxZ/pM+GeGglMjw99eFXvizXAXL3yitDqg==
X-Received: by 2002:a05:6808:2384:b0:407:59ac:d73f with SMTP id
 5614622812f47-41cefe09d5cmr17438811b6e.21.1753185860015; 
 Tue, 22 Jul 2025 05:04:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c6dcsm1937261e87.101.2025.07.22.05.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 05:04:19 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:04:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <bxual3dbzffgbe6vziwumaqpyxrnjbvnljy2pg2o5mtgixufbm@mjvg5em2xklf>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
 <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
 <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
 <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
X-Proofpoint-GUID: 9WmTD8OTGkVY13egWhgujHf7Luqz389h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5OCBTYWx0ZWRfX8/yIYHELrZEd
 sodAtsRao61wPZ/QXVebbY3UDaNaoTnjP1EzZ1NQkl33JSYxRKg0odeSbAsmRIRYaJjzm4n9Fyx
 GSp+E6QBK2PGH72oj262j0bzAJ0A/FHpimuIAuLtZbrQEZkqcdp7iJWVEgSSOjvwYpWUHGQH44c
 7n+Tz0myVWw/3IScS0UbtAB8Y96KM8Qq0To9iZNnSTuzPdOLj2uJrYVw5bPo1k5QoP8R2eh5kYZ
 dKPmA4WpToz8lLqhLUXsSBLiv+pEEFizbJW/imIYJL8Djy9t+axMuj+zrPhNjm//TB0suuBxudf
 L9heZjZ79mWgEV04sDL7Dfaq6WCazAzXZr0eJnr5ZVXDWPlxkc77dsVSWjd7ZGn7xWc+JxnKJgi
 rADtJADa7kO10TJv/auUQgkkwoa8ZG4KZUL4xtbSbUttwvZrJoFWBCE6w/NXbBm8fDGcEkXx
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687f7e45 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=S6PJxlnTzXtoPlSZMcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9WmTD8OTGkVY13egWhgujHf7Luqz389h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220098
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

On Mon, Jul 21, 2025 at 04:06:13PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月19日周六 18:09写道：
> >
> > On Mon, Jul 07, 2025 at 02:18:05PM +0800, Jun Nie wrote:
> > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > quad-pipe usage scenarios require four pipes and involve configuring
> > > two stages. In quad-pipe case, the first two pipes share a set of
> > > mixer configurations and enable multi-rect mode when certain
> > > conditions are met. The same applies to the subsequent two pipes.
> > >
> > > Assign SSPPs to the pipes in each stage using a unified method and
> > > to loop the stages accordingly.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 +++++++++++++++++++-----------
> > >  1 file changed, 89 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d65930075cc2a4b8a8a7d40b3d3c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > >  }
> > >
> > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > > +                                   struct dpu_sw_pipe **single_pipe,
> > > +                                   struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > > +                                   int *stage_index)
> > > +{
> > > +     int stage_idx, pipe_idx, i, valid_pipe = 0;
> > > +
> > > +     for (stage_idx = 0; stage_idx < STAGES_PER_PLANE; stage_idx++) {
> > > +             for (i = 0; i < PIPES_PER_STAGE; i++) {
> > > +                     pipe_idx = stage_idx * PIPES_PER_STAGE + i;
> > > +                     if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
> > > +                             valid_pipe++;
> > > +                             if (valid_pipe > 1)
> > > +                                     return false;
> > > +
> > > +                             *single_pipe = &pstate->pipe[pipe_idx];
> > > +                             *single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
> > > +                             *stage_index = stage_idx;
> > > +                     }
> > > +             }
> > > +     }
> > > +
> > > +     return valid_pipe == 1;
> > > +}
> > >
> > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >                                      struct drm_atomic_state *state,
> > > @@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> > >                                         const struct msm_format *fmt,
> > >                                         uint32_t max_linewidth)
> > >  {
> > > -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> > > -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> > > -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> > > -     struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> > > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> > > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> > >       const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
> > > +     int stage_index, prev_stage_index;
> > >       u16 max_tile_height = 1;
> > >
> > > -     if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> > > +     if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &stage_index))
> > > +             return false;
> > > +
> > > +     if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe,
> > > +                                    &prev_pipe_cfg, &prev_stage_index) ||
> > >           prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
> > >               return false;
> > >
> > > +     if (stage_index != prev_stage_index)
> > > +             return false;
> >
> > This should be handled other way around: save N pstates and then loop
> > over stage indices. If there is no rect at the corresponding stage for a
> > plane, skip assignment (and use prev_adjacent_pstate for the next plane).
> 
> You mean dpu_plane_virtual_assign_resources() shall notify its caller
> dpu_assign_plane_resources() to skip updating prev_adjacent_plane_state
> if dpu_plane_try_multirect_shared() return false? If so, we can add an
> argument "bool pipe_shared" in dpu_plane_virtual_assign_resources() to
> get the status. But that is an optimization to share pipes across multiple
> planes. Can we add new patches based on current patch set later?
> 
> Or my understanding is not aligned with your thoughts?

Not quite. I think we need to store all NUM_STAGES 'prev_adjancent' states and
update them as the driver loops through the stages for each plane.

> 
> - Jun
> >
> > > +
> > >       if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
> > >           !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
> > >               return false;
> > > @@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> > >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> > >               max_tile_height = max(max_tile_height, prev_fmt->tile_height);
> > >
> > > -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -
> > > -     r_pipe->sspp = NULL;
> > > -
> > >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
> > >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
> > >           (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> > > @@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > >       return 0;
> > >  }
> > >
> > > +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
> > > +                                           struct dpu_sw_pipe_cfg *pipe_cfg,
> > > +                                           struct drm_plane_state *plane_state,
> > > +                                           struct dpu_global_state *global_state,
> > > +                                           struct drm_crtc *crtc,
> > > +                                           struct dpu_rm_sspp_requirements *reqs)
> > > +{
> > > +     struct drm_plane *plane = plane_state->plane;
> > > +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > +     struct dpu_sw_pipe *r_pipe = pipe + 1;
> > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
> > > +
> > > +     if (drm_rect_width(&pipe_cfg->src_rect) != 0) {
> > > +             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> > > +             if (!pipe->sspp)
> > > +                     return -ENODEV;
> > > +     }
> > > +
> > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> > > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > +                                           pipe->sspp,
> > > +                                           msm_framebuffer_format(plane_state->fb),
> > > +                                           dpu_kms->catalog->caps->max_linewidth)) {
> > > +             goto stage_assinged;
> > > +     }
> > > +
> > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> > > +             r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> > > +             if (!r_pipe->sspp)
> > > +                     return -ENODEV;
> > > +             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +     }
> > > +
> > > +stage_assinged:
> > > +     return 0;
> > > +}
> > > +
> > >  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >                                             struct dpu_global_state *global_state,
> > >                                             struct drm_atomic_state *state,
> > > @@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       struct dpu_rm_sspp_requirements reqs;
> > >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > >       struct dpu_sw_pipe *pipe;
> > > -     struct dpu_sw_pipe *r_pipe;
> > >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > >       const struct msm_format *fmt;
> > > -     int i;
> > > +     int i, stage_id, ret;
> > >
> > >       if (plane_state->crtc)
> > >               crtc_state = drm_atomic_get_new_crtc_state(state,
> > > @@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       prev_adjacent_pstate = prev_adjacent_plane_state ?
> > >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> > >
> > > -     pipe = &pstate->pipe[0];
> > > -     r_pipe = &pstate->pipe[1];
> > > -     pipe_cfg = &pstate->pipe_cfg[0];
> > > -     r_pipe_cfg = &pstate->pipe_cfg[1];
> > > -
> > >       for (i = 0; i < PIPES_PER_PLANE; i++)
> > >               pstate->pipe[i].sspp = NULL;
> > >
> > > @@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >
> > >       reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
> > >
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> > > -             if (!prev_adjacent_pstate ||
> > > -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> > > -                                                 dpu_kms->catalog->caps->max_linewidth)) {
> > > -                     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -                     if (!pipe->sspp)
> > > -                             return -ENODEV;
> > > -
> > > -                     r_pipe->sspp = NULL;
> > > -
> > > -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -
> > > -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -             }
> > > -     } else {
> > > -             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -             if (!pipe->sspp)
> > > -                     return -ENODEV;
> > > -
> > > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > -                                                   pipe->sspp,
> > > -                                                   msm_framebuffer_format(plane_state->fb),
> > > -                                                   dpu_kms->catalog->caps->max_linewidth)) {
> > > -                     /* multirect is not possible, use two SSPP blocks */
> > > -                     r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -                     if (!r_pipe->sspp)
> > > -                             return -ENODEV;
> > > -
> > > -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +     if (prev_adjacent_pstate &&
> > > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> > > +                                         dpu_kms->catalog->caps->max_linewidth)) {
> > > +             goto assigned;
> > > +     }
> > >
> > > -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -             }
> > > +     for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> > > +             pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
> > > +             pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
> > > +             ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
> > > +                                                      plane_state,
> > > +                                                      global_state,
> > > +                                                      crtc, &reqs);
> > > +             if (ret)
> > > +                     return ret;
> > >       }
> > >
> > > +assigned:
> > >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > >  }
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
