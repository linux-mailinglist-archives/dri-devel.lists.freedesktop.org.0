Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B53AEAAD1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 01:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D295C10E92A;
	Thu, 26 Jun 2025 23:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgdXzffg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A88010E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:46:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKDZjL009483
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7KegPe8W7T2gpH9g2ETCWHauXeLTwZBk9lVvzRO/WrQ=; b=JgdXzffgjuyd+i5J
 R6tI2q7XvuRCnRScdCiGMG4Zd5e7MzRk2gJKF7Jz41ybocbS1OzZ7BjYriZwMHHO
 aHpJ0URto5VO2Mi/EeuXYWpv2+RBNy4o4zetjwDnYDKJ8xykbA7zZzxss3UXxfZ5
 Kd7gi+vSr8uB2GyjDucIlUIB3v3UN6q5Jx+F/smE2r5moTprdM6Ltz7bxkai62xw
 Kwq+A90LkcqGNOFBHGCr1vxnB59SVMPNU0t7mC0oAK30+5i1x6LNT+SbZoof8Pd1
 /FXmOxthtucg0gcCWb/fXFhAvH0m9D3mfRxsynMQBj33Ky511SPRkejCRURr96cK
 Pvb5jA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdeueh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:46:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fd75e60875so23734526d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 16:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750981599; x=1751586399;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7KegPe8W7T2gpH9g2ETCWHauXeLTwZBk9lVvzRO/WrQ=;
 b=Gfn9QRh9+Pu4uZnOopcX3gEj6RxPibbUWNO9bUN9o6af+luDZ4Bw+KePbZMpTeFTwA
 noQr3G6GGcxiDGtRqE6VKNOooaKQEzzH7lwqgLNdpru4P1uHoPQd5cp/RTB+7Tg5ARsM
 VJJGYCr3Au/7K8i0N7C8DSh8PVOsUqlw46ns/FakvEu19MoGCj9Qz985xWWe3by9WVMn
 dszCNmMlYVKf/UPQ0eqUEISZ1ND6ycUwSKPrn+81CXD9cmBvC84CWWXd3dkHNwO2BWvE
 F4DPsKUOVZOEmjh0gFC1c9czT4jOoj4LonI3sPGbOBBJky7qv1RBj6iDbRxC7GkPA0xt
 YvBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMip7HHyDrU2M6GRAUFqiN4kFCowTGovJnMCzhk9UalQNVZh9rYwNE30nmMs84jBGy2kretL7Opdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMyFlzI8WseLYLSCB2TTe+Wz9DFueQNlTE4asdKQcYM8hnE+aK
 jvtwb6OS6CYKUkrmzN5RXA8elKlylECUzpQ3bWPE6sJRd0RHYV+wHTxB6wPAbpdVrVmcZ7A8a1v
 njhK1z7tc13rsKvmnIJK8NTvQOx39aXSAaLiKgHQYfO/i8ToZ9OAQncGPi1H/IgNdrkbujWs=
X-Gm-Gg: ASbGncv7HNeerGbzVs4CNHUKL4/nOET8Iy+Mcy2/RXBCx0g47DsytFIf/628MAb/Vbt
 yKtOPfy1CXrNtLaQ1xG18MojH9yhBdJHxtIjPnQpF/DCOFqHrfVoHMekSWk96CVyowpL+LnzY15
 pIo0A+dLjirRaUKRhBhC5v2z8OdH4/4iY/44xzaakplV6MtuVM6OJ9cXr3W14KJ12doTmzIv7wQ
 2W3L4+XOgOH9WJELL6/gb1Ax0Abbh2jIBwEnJ6JDDzmMvNfxR8mvEO7O9CDBUNBfT8+9ra6FBGU
 PGKp9cKnCPu9OUzILGh9WD9IgY7EpG+dgMvHwtBqadX4+3cLhSGg5Gqof+38cqAMYJ/6ulC00j1
 XSLak9kKCx9r2iGpdOaOiCAwEMe2B2B5px4w=
X-Received: by 2002:a05:6214:2f87:b0:6ff:664f:c4ca with SMTP id
 6a1803df08f44-70001d66704mr24208936d6.12.1750981599059; 
 Thu, 26 Jun 2025 16:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6V3S1K8u35BRIWj4UvPY2uDUKmwFKq2ypmoKF6aUR+WTdlzRmdvuzitBWJTCwteFsgHOszg==
X-Received: by 2002:a05:6214:2f87:b0:6ff:664f:c4ca with SMTP id
 6a1803df08f44-70001d66704mr24208586d6.12.1750981598593; 
 Thu, 26 Jun 2025 16:46:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2ec5deasm3701091fa.58.2025.06.26.16.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 16:46:37 -0700 (PDT)
Date: Fri, 27 Jun 2025 02:46:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 11/12] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <54unag6whlbkjujjirsgqqiukadudgbcfsol2jwdbc523ebas7@3shvc3yepkmq>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-11-c3af7190613d@linaro.org>
 <5hmgt4v4nop3xpqt34wq4yyfjnypkrnlrr5fnt6r72k5c6r4vn@ykmg5ni6hjyt>
 <CABymUCOx-kJ0FpZnvTPAT9i-kvcA8Bs8WxFZZWQXbLZ2Koobpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOx-kJ0FpZnvTPAT9i-kvcA8Bs8WxFZZWQXbLZ2Koobpg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685ddbe0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=2m9aEEAoIjJPnTDgS3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwNCBTYWx0ZWRfX+83b+LKtgWF8
 N+FM22kc4xorbEq6yb+Or9u+MvzT1uYYkXJlpaBnTc7J/jv6A1h+o4iDSNDGQ3D6HZiSe0of3i3
 6DQvkvtdmZ+L2D7tY6YNL/3cjH0/G/EZRPs0q/D+ob9F4SibQMdAPgckgx3oXdVQSiJREfWYWMQ
 S6FqB4TQnkr1d+/Lrmu2uM+lvnGO+cgDfqyjugY73NvpwS6liOAdrtJJLWPscrov3EdaXgnGE3K
 6nLXxU0BGpNKmbdOj8/yrIPvOC/LJGyXiplkWhlchvz023Gx+iYEiKrDALqauAoxDbSIIwl32mz
 CmcR2Oh+eunyrm3PyJw7vW/7v6lsDhZg14KnWtLKGvRF2fHu6zmYrdsvM0QeyWckA3e8G3JdNlr
 kAA7CllO0pXuuM4vGYu4y7onF6TnGTND9Ta1MvcE7NkVo0Val8MqpT4OPeWXm1vquViRPIAW
X-Proofpoint-GUID: cwo-1P4oJfAGx3TM36Mx3SIOzLBTsdNa
X-Proofpoint-ORIG-GUID: cwo-1P4oJfAGx3TM36Mx3SIOzLBTsdNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260204
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

On Thu, Jun 12, 2025 at 03:44:32PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年6月3日周二 18:24写道：
> >
> > On Tue, Jun 03, 2025 at 03:10:10PM +0800, Jun Nie wrote:
> > > The content of every half of screen is sent out via one interface in
> > > dual-DSI case. The content for every interface is blended by a LM
> > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > that cross the half of screen in this case. Clip plane into pipes per
> > > left and right half screen ROI if topology is quad pipe case.
> > >
> > > The clipped rectangle on every half of screen is futher handled by two
> > > pipes if its width exceeds a limit for a single pipe.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
> > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > >
> > > @@ -886,35 +887,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > >
> > >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> > >
> > > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > > +     drm_rect_rotate(&init_pipe_cfg.src_rect,
> > >                       new_plane_state->fb->width, new_plane_state->fb->height,
> > >                       new_plane_state->rotation);
> > >
> > > -     if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > -          _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > > -                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > > -                     return -E2BIG;
> > > +     /*
> > > +      * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> > > +      * configs for left and right half screen in case of 4:4:2 topology.
> > > +      * But we may have 2 rect to split wide plane that exceeds limit with 1
> > > +      * config for 2:2:1. So need to handle both wide plane splitting, and
> > > +      * two halves of screen splitting for quad-pipe case. Check dest
> > > +      * rectangle left/right clipping first, then check wide rectangle
> > > +      * splitting in every half next.
> > > +      */
> > > +     num_stages = (num_lm + 1) / 2;
> >
> > I thought we agreed to loop over all stages, dropping the need for
> > num_lm.
> 
> num_stages is needed here, so that the plane can be cropped into left/right
> half of LCD and result pipe will be handled by 2 stages in quadpipe case.
> While only 1 stage is involved in 1 or 2 pipe case and the crop operation
> does not make a real impact. If we do not care num_lm and use 2 stages
> by default, then we are forcing quad-pipe. Do you have any suggestion?

I'm sorry, it took me a while to respond.

No, this is fine.

> 
> >
> > > +     /* iterate mixer configs for this plane, to separate left/right with the id */
> > > +     for (stage_id = 0; stage_id < num_stages; stage_id++) {
> > > +             struct drm_rect mixer_rect = {
> > > +                     .x1 = stage_id * mode->hdisplay / num_stages,
> > > +                     .y1 = 0,
> > > +                     .x2 = (stage_id + 1) * mode->hdisplay / num_stages,
> 
> The crop window is calculated with num_stages here.

Ack.

> 
> > > +                     .y2 = mode->vdisplay
> > > +                     };
> > > +             int cfg_idx = stage_id * PIPES_PER_STAGE;
> > > +
> > > +             pipe_cfg = &pstate->pipe_cfg[cfg_idx];
> > > +             r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
> > > +
> > > +             drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > +             pipe_cfg->dst_rect = new_plane_state->dst;
> > > +
> > > +             DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> > > +                             " vs clip window " DRM_RECT_FMT "\n",
> > > +                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > > +                             DRM_RECT_ARG(&mixer_rect));
> > > +
> > > +             /*
> > > +              * If this plane does not fall into mixer rect, check next
> > > +              * mixer rect.
> > > +              */
> > > +             if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> > > +                                       &pipe_cfg->dst_rect,
> > > +                                       &mixer_rect)) {
> > > +                     memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
> > > +
> > > +                     continue;
> > >               }
> > >
> > > -             *r_pipe_cfg = *pipe_cfg;
> > > -             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > > -             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > > -             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > > -             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> > > -     } else {
> > > -             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> > > -     }
> > > +             pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
> > > +             pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
> > > +
> > > +             DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
> > > +                             DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
> > > +
> > > +             /* Split wide rect into 2 rect */
> > > +             if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > +                  _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
> > > +
> > > +                     if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > > +                             DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > > +                                             DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > > +                             return -E2BIG;
> > > +                     }
> > > +
> > > +                     memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
> > > +                     pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > > +                     pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > > +                     r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > > +                     r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> > > +                     DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> > > +                                     DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
> > > +                                     DRM_RECT_ARG(&pipe_cfg->src_rect),
> > > +                                     DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> > > +             } else {
> > > +                     memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
> > > +             }
> > >
> > > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > > -                         new_plane_state->fb->width, new_plane_state->fb->height,
> > > -                         new_plane_state->rotation);
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> > > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > > -                                 new_plane_state->fb->width, new_plane_state->fb->height,
> > > +             drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > > +                                 new_plane_state->fb->width,
> > > +                                 new_plane_state->fb->height,
> > >                                   new_plane_state->rotation);
> > >
> > > +             if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> > > +                     drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > > +                                         new_plane_state->fb->width,
> > > +                                         new_plane_state->fb->height,
> > > +                                         new_plane_state->rotation);
> > > +     }
> > > +
> > >       pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> > >
> > >       return 0;
> > > @@ -997,20 +1057,17 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >               drm_atomic_get_new_plane_state(state, plane);
> > >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> > >       struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > > -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> > > -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> > > -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> > > -     int ret = 0;
> > > -
> > > -     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> > > -                                       &crtc_state->adjusted_mode,
> > > -                                       new_plane_state);
> > > -     if (ret)
> > > -             return ret;
> > > +     struct dpu_sw_pipe *pipe;
> > > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > > +     int ret = 0, i;
> > >
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> > > -             ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
> > > +     for (i = 0; i < PIPES_PER_PLANE; i++) {
> > > +             pipe = &pstate->pipe[i];
> > > +             pipe_cfg = &pstate->pipe_cfg[i];
> > > +             if (!pipe->sspp)
> > > +                     continue;
> > > +             DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> > > +             ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> > >                                                 &crtc_state->adjusted_mode,
> > >                                                 new_plane_state);
> > >               if (ret)
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
