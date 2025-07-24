Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C0B0FE86
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 03:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763D310E1B8;
	Thu, 24 Jul 2025 01:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aa6eMdhk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4F910E1A9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 01:56:34 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-70e23e9aeefso4131067b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 18:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753322194; x=1753926994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOLfWvZXIi1bXtQsm6sEiFLMn1a8WPbYK1vjSZWD4IQ=;
 b=aa6eMdhkyT+1aUuvO/TKQgIWiJHC6AjR0fdycHj4YIMevfte7iQGIREEq1pyv1a0aM
 BraJ+5aj67ADwTaZ3uYpbbBcDEkmUGEP6RH2LmBQKDDnloagCTTPDMy/DytPoqsVca1N
 Q1jnyvHCCYZRx4/ATZrxOxLHVp9Y0kRVxJkrm7g7BbPE4O/Q97rH52K6Z8Pk4TRYbxKT
 NCWd0QDFK0dNedBzN6vYh/urpwNisQailnthWLc50QdCqBqN/SZe/JkLO6Vc+mrvbklZ
 lEAO/3erlIjrZciBWaFze8NNxEii0FgulKXOZdwO3ZlbzBFzZUOeYFr59PFtVG2xfLMs
 mAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753322194; x=1753926994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOLfWvZXIi1bXtQsm6sEiFLMn1a8WPbYK1vjSZWD4IQ=;
 b=aOpnRgPqgpM9daiapVKt9GqGN+LmTXJpuqeOcEZt11X92pbvNH3CmfmC0K1g4bAPL7
 IYoj/Y/FMF7hra0AxwBn0SF+EiDybxhfAftpDB+k9Qbo9v90sIDc9fBdKi5dw0gP7msW
 nV0FthSFcE9QO/9WswqjqLC/1cEWQdNcCnAq9qJ3dbsz33b4jHj6mEoxUy9jgzsAGSsL
 ZzNvH/q+w1vcTJw9S1xX2y3xwVtt5BydWmtPpWnPvEb9K03zEH0LgyrwCELZAHZYOpXA
 SQ/NJnweWcNyDtUvGOrowXY1KpxiHpMx6j3UN1RK0bBHFAU7ZcOu7NiD5yV/xTVhBfzu
 SutQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAh7/FSLCTTLVvwErPLBu1PirrJM/7LcmscizRfhcmyF2G+ZDTIun78Gs8xxahEDBjSiaaaJcg1IU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy68z577vMX14y3R3bk78Np92xiKKbgCWGj1pgyVlBRGuqNwM8O
 9VjziryU8yYTLDLPueikBesHyK7rZtDhXeFzKeqxCe28XEBR5822PHfuadlZj61GV0XZe4BdrRs
 FpX/tsErCxkm8CTIQ0hm5S1KcJ+qY+EI2wBvXKAu99A==
X-Gm-Gg: ASbGncvsYLGHZIoBifs5LgCww4mw8W0lzlanYdfslBs2QlnC1B0tjPdp5ovZX5L6yLp
 PTaJNrQO2XwRU4+cGouQ5LWCtfLaV0Xrg2GhVwkq+weUvSIyJTL2sMpHIQiYhrDD0gjWscmA8o2
 c9X6W5MTUnhLFcm5wGm71kAQ6Art1nIicfyXKNb5ReWuzQh7L2aVShlM9dEu5D56qVNaQnB6rZD
 MKONqQH0EpyhwSu9w==
X-Google-Smtp-Source: AGHT+IE3aNPu4epCKeBz9TfCW7Jg6WVpqjMnhJsKdNXfaxWgU6NabDiWgLOJJ6GhLV96ByPIrDZSCFE6rARdNR3ARMg=
X-Received: by 2002:a05:690c:7084:b0:708:be8b:841e with SMTP id
 00721157ae682-719b433cbb2mr69994687b3.36.1753322193618; Wed, 23 Jul 2025
 18:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
 <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
 <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
 <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
 <bxual3dbzffgbe6vziwumaqpyxrnjbvnljy2pg2o5mtgixufbm@mjvg5em2xklf>
In-Reply-To: <bxual3dbzffgbe6vziwumaqpyxrnjbvnljy2pg2o5mtgixufbm@mjvg5em2xklf>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 24 Jul 2025 09:56:21 +0800
X-Gm-Features: Ac12FXx1caG2qAaxZT0HB5wYp9EX_aKTJtG2R6dSGdEAkMaAeQ9pAlH_ISLWYKU
Message-ID: <CABymUCOgnOMTM=XYEMbE_8h_x+zeC1OnMKGMH5ZEP+Zuhz4PKw@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
7=E6=9C=8822=E6=97=A5=E5=91=A8=E4=BA=8C 20:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 21, 2025 at 04:06:13PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B47=E6=9C=8819=E6=97=A5=E5=91=A8=E5=85=AD 18:09=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jul 07, 2025 at 02:18:05PM +0800, Jun Nie wrote:
> > > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > > quad-pipe usage scenarios require four pipes and involve configurin=
g
> > > > two stages. In quad-pipe case, the first two pipes share a set of
> > > > mixer configurations and enable multi-rect mode when certain
> > > > conditions are met. The same applies to the subsequent two pipes.
> > > >
> > > > Assign SSPPs to the pipes in each stage using a unified method and
> > > > to loop the stages accordingly.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 ++++++++++++++++++=
+-----------
> > > >  1 file changed, 89 insertions(+), 54 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d659300=
75cc2a4b8a8a7d40b3d3c 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_cap=
able(struct dpu_hw_sspp *sspp,
> > > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_line=
width);
> > > >  }
> > > >
> > > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *psta=
te,
> > > > +                                   struct dpu_sw_pipe **single_pip=
e,
> > > > +                                   struct dpu_sw_pipe_cfg **single=
_pipe_cfg,
> > > > +                                   int *stage_index)
> > > > +{
> > > > +     int stage_idx, pipe_idx, i, valid_pipe =3D 0;
> > > > +
> > > > +     for (stage_idx =3D 0; stage_idx < STAGES_PER_PLANE; stage_idx=
++) {
> > > > +             for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> > > > +                     pipe_idx =3D stage_idx * PIPES_PER_STAGE + i;
> > > > +                     if (drm_rect_width(&pstate->pipe_cfg[pipe_idx=
].src_rect) !=3D 0) {
> > > > +                             valid_pipe++;
> > > > +                             if (valid_pipe > 1)
> > > > +                                     return false;
> > > > +
> > > > +                             *single_pipe =3D &pstate->pipe[pipe_i=
dx];
> > > > +                             *single_pipe_cfg =3D &pstate->pipe_cf=
g[pipe_idx];
> > > > +                             *stage_index =3D stage_idx;
> > > > +                     }
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return valid_pipe =3D=3D 1;
> > > > +}
> > > >
> > > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > > >                                      struct drm_atomic_state *state=
,
> > > > @@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(s=
truct dpu_plane_state *pstate,
> > > >                                         const struct msm_format *fm=
t,
> > > >                                         uint32_t max_linewidth)
> > > >  {
> > > > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > > > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > -     struct dpu_sw_pipe *prev_pipe =3D &prev_adjacent_pstate->pipe=
[0];
> > > > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg =3D &prev_adjacent_psta=
te->pipe_cfg[0];
> > > > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > > > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> > > >       const struct msm_format *prev_fmt =3D msm_framebuffer_format(=
prev_adjacent_pstate->base.fb);
> > > > +     int stage_index, prev_stage_index;
> > > >       u16 max_tile_height =3D 1;
> > > >
> > > > -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> > > > +     if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &sta=
ge_index))
> > > > +             return false;
> > > > +
> > > > +     if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pi=
pe,
> > > > +                                    &prev_pipe_cfg, &prev_stage_in=
dex) ||
> > > >           prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> > > >               return false;
> > > >
> > > > +     if (stage_index !=3D prev_stage_index)
> > > > +             return false;
> > >
> > > This should be handled other way around: save N pstates and then loop
> > > over stage indices. If there is no rect at the corresponding stage fo=
r a
> > > plane, skip assignment (and use prev_adjacent_pstate for the next pla=
ne).
> >
> > You mean dpu_plane_virtual_assign_resources() shall notify its caller
> > dpu_assign_plane_resources() to skip updating prev_adjacent_plane_state
> > if dpu_plane_try_multirect_shared() return false? If so, we can add an
> > argument "bool pipe_shared" in dpu_plane_virtual_assign_resources() to
> > get the status. But that is an optimization to share pipes across multi=
ple
> > planes. Can we add new patches based on current patch set later?
> >
> > Or my understanding is not aligned with your thoughts?
>
> Not quite. I think we need to store all NUM_STAGES 'prev_adjancent' state=
s and
> update them as the driver loops through the stages for each plane.
>

I see. So the prev_adjacent_plane_state in dpu_assign_plane_resources()
shall be converted into an array, and map to prev_adjacent_pstate[N] in
dpu_plane_virtual_assign_resources(). Then check new single pipe plane
vs every member in the prev_adjacent_pstate[N] to confirm stage index is
aligned before sharing SSPP.  Right?

If so, that is the optimization for the dual stage case. It does not introd=
uce
regression to the existing single stage case with current implementation.
Can we just merge this patch first, then add the optimization for the
dual stages case in new patch set? As this patch set focus on quad-pipe
with 2 stages, without hurting existing usage cases. And it changes lots
of code and involve rebase effort from time to time. While the optimization
for the dual stage case will limit the change in plane, though several revi=
ew
cycle may be needed.

Regards,
Jun

> > > > +
> > > >       if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt=
) ||
> > > >           !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pip=
e_cfg, prev_fmt))
> > > >               return false;
> > > > @@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(st=
ruct dpu_plane_state *pstate,
> > > >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> > > >               max_tile_height =3D max(max_tile_height, prev_fmt->ti=
le_height);
> > > >
> > > > -     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > > -
> > > > -     r_pipe->sspp =3D NULL;
> > > > -
> > > >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidt=
h) &&
> > > >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, ma=
x_linewidth) &&
> > > >           (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 ||
> > > > @@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(st=
ruct drm_plane *plane,
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *=
pipe,
> > > > +                                           struct dpu_sw_pipe_cfg =
*pipe_cfg,
> > > > +                                           struct drm_plane_state =
*plane_state,
> > > > +                                           struct dpu_global_state=
 *global_state,
> > > > +                                           struct drm_crtc *crtc,
> > > > +                                           struct dpu_rm_sspp_requ=
irements *reqs)
> > > > +{
> > > > +     struct drm_plane *plane =3D plane_state->plane;
> > > > +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > > > +     struct dpu_sw_pipe *r_pipe =3D pipe + 1;
> > > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D pipe_cfg + 1;
> > > > +
> > > > +     if (drm_rect_width(&pipe_cfg->src_rect) !=3D 0) {
> > > > +             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, glob=
al_state, crtc, reqs);
> > > > +             if (!pipe->sspp)
> > > > +                     return -ENODEV;
> > > > +     }
> > > > +
> > > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> > > > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, =
r_pipe_cfg,
> > > > +                                           pipe->sspp,
> > > > +                                           msm_framebuffer_format(=
plane_state->fb),
> > > > +                                           dpu_kms->catalog->caps-=
>max_linewidth)) {
> > > > +             goto stage_assinged;
> > > > +     }
> > > > +
> > > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> > > > +             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, gl=
obal_state, crtc, reqs);
> > > > +             if (!r_pipe->sspp)
> > > > +                     return -ENODEV;
> > > > +             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > +             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > > +     }
> > > > +
> > > > +stage_assinged:
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crt=
c,
> > > >                                             struct dpu_global_state=
 *global_state,
> > > >                                             struct drm_atomic_state=
 *state,
> > > > @@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resource=
s(struct drm_crtc *crtc,
> > > >       struct dpu_rm_sspp_requirements reqs;
> > > >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > > >       struct dpu_sw_pipe *pipe;
> > > > -     struct dpu_sw_pipe *r_pipe;
> > > >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > >       const struct msm_format *fmt;
> > > > -     int i;
> > > > +     int i, stage_id, ret;
> > > >
> > > >       if (plane_state->crtc)
> > > >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > > > @@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resource=
s(struct drm_crtc *crtc,
> > > >       prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> > > >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> > > >
> > > > -     pipe =3D &pstate->pipe[0];
> > > > -     r_pipe =3D &pstate->pipe[1];
> > > > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > > -
> > > >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> > > >               pstate->pipe[i].sspp =3D NULL;
> > > >
> > > > @@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resourc=
es(struct drm_crtc *crtc,
> > > >
> > > >       reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> > > >
> > > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) =3D=3D 0) {
> > > > -             if (!prev_adjacent_pstate ||
> > > > -                 !dpu_plane_try_multirect_shared(pstate, prev_adja=
cent_pstate, fmt,
> > > > -                                                 dpu_kms->catalog-=
>caps->max_linewidth)) {
> > > > -                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->=
rm, global_state, crtc, &reqs);
> > > > -                     if (!pipe->sspp)
> > > > -                             return -ENODEV;
> > > > -
> > > > -                     r_pipe->sspp =3D NULL;
> > > > -
> > > > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> > > > -
> > > > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOL=
O;
> > > > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT=
_NONE;
> > > > -             }
> > > > -     } else {
> > > > -             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, glob=
al_state, crtc, &reqs);
> > > > -             if (!pipe->sspp)
> > > > -                     return -ENODEV;
> > > > -
> > > > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg,=
 r_pipe, r_pipe_cfg,
> > > > -                                                   pipe->sspp,
> > > > -                                                   msm_framebuffer=
_format(plane_state->fb),
> > > > -                                                   dpu_kms->catalo=
g->caps->max_linewidth)) {
> > > > -                     /* multirect is not possible, use two SSPP bl=
ocks */
> > > > -                     r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms=
->rm, global_state, crtc, &reqs);
> > > > -                     if (!r_pipe->sspp)
> > > > -                             return -ENODEV;
> > > > -
> > > > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> > > > +     if (prev_adjacent_pstate &&
> > > > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_psta=
te, fmt,
> > > > +                                         dpu_kms->catalog->caps->m=
ax_linewidth)) {
> > > > +             goto assigned;
> > > > +     }
> > > >
> > > > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOL=
O;
> > > > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT=
_NONE;
> > > > -             }
> > > > +     for (stage_id =3D 0; stage_id < STAGES_PER_PLANE; stage_id++)=
 {
> > > > +             pipe =3D &pstate->pipe[stage_id * PIPES_PER_STAGE];
> > > > +             pipe_cfg =3D &pstate->pipe_cfg[stage_id * PIPES_PER_S=
TAGE];
> > > > +             ret =3D dpu_plane_assign_resource_in_stage(pipe, pipe=
_cfg,
> > > > +                                                      plane_state,
> > > > +                                                      global_state=
,
> > > > +                                                      crtc, &reqs)=
;
> > > > +             if (ret)
> > > > +                     return ret;
> > > >       }
> > > >
> > > > +assigned:
> > > >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > > >  }
> > > >
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
