Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F724B0BE70
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F5210E491;
	Mon, 21 Jul 2025 08:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fGLPqxFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D910D10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 08:06:25 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e8d713e64c5so3545978276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 01:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753085185; x=1753689985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QXjZydoegZQ2ZsNWUnq3mbu0ARbwzLhTN1MMUw8Kewk=;
 b=fGLPqxFf9FjfkA28FiTVv1R9OdaQUUbM4vXtsCAsjQJnRh7lEfPT9BKudYC8i3ExnD
 AlxmvPMHDRJinI2zL+ErdXaNtqxmxs+Dax6mwJbdNYRKrA8jGEXAgS2cDTmeHmrQEhHu
 zRjmEH1iHdKKTmJmEG2PB+ViB2MmxX2TLhUZAsw+aCNYRkkS4iawcGCQohj81caBvD+U
 ELawuRC2ufyDLdVF64YOz8YjfG6eRNkJS5uQd89hOwCdkFH5JE8OHnSYtSGlGMpySNiE
 d4kSInVlYHhoxrSNBwKNxMOGMltdp15V3NekARsmc8ZDWbhZAroGX1lAsCVAHBU95LvO
 hIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753085185; x=1753689985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXjZydoegZQ2ZsNWUnq3mbu0ARbwzLhTN1MMUw8Kewk=;
 b=VG6m9ruVMD40Cr1SOskM7MykhhBQQ2tIF1sYVkuAgCasKstrmg5sUJB7Sh5y0RXsOF
 tZnGuwQv1zfvKIQMkI5siaMHRzhqxh+MZkzY0JEPmKCJZOERT4Vgx7dufpqEBYQYZy4s
 uJvrVr5NWZ5O3PHgOD5Xvrz9Csp3/C2EaGafxtpEhRPpeG/xQKB+xmhWN9qXzWd+LMjs
 5jCyLXMJ1seQyfrs4rK1UKuOuN+aHUdDd6SwIYFz7XmAUPaXpHq+kSjeBctVhNKiEP0n
 QxcpIq8IjM15WQBOA2TO1lB69Ib1eI0RJqYfUqjvoNr16eQdsp3Awi0qHCLgyPLIrbSZ
 Mulw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpT+DrFkmU3Ap4LavZfKPn6L6bq3Jj0WmT6nObhNSxCSp32Kg+Na6XFcc3SQlDiRTLoFwT9NjBUgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjt/QgFZbStOzjBAs+lmFqW7uiD4GHXYxsd0UV+dTsBqZPVdXZ
 kQfj/RAMFhYyEM2rY5wdA/d4idkWNpZsSp/f2O41fj72j80ofElB8+tz7+iO1ob0y2HeSeT3VtR
 u7mJyu0BHy8bzVRtRcLx9l60tDJ4kxnfp/oV4iVY+SQ==
X-Gm-Gg: ASbGnctZHuwX2GQpw+w/G03D+Yyqx6E3VlOXk5/8wEr10pDmXwd3le2iEDQriGCeKYC
 tLmKp/m4rWU2NRh05AptV9dS0Coe16Xd6Qe30Dc2GdM/Q4DE2IREyNnLBYyxbOyB0JrkLhGE4z0
 bn9ghashf99PZqwFxL1TXbPdsy8GeBFRx30Jv4fRonRzrC2VOetyK0VBQ0m4vRddumsEEqRbG5B
 KZ2GSQ=
X-Google-Smtp-Source: AGHT+IFQ1amy/ZZahM40X8cb+37Q8KwVejxmxIxsmKDog+M5sSU7+um7am/YJwzpORCNPb1FN60oKJvPa9bR+ya3E0E=
X-Received: by 2002:a05:6902:2289:b0:e8b:9ef1:f9ef with SMTP id
 3f1490d57ef6-e8d7a5c06e3mr14034257276.45.1753085184308; Mon, 21 Jul 2025
 01:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
 <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
 <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
In-Reply-To: <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 21 Jul 2025 16:06:13 +0800
X-Gm-Features: Ac12FXwkEB5hHMigCqH7XK813bTvGyxHvB3mIUQVlEvS1vlsVmEtmCJHtAk3gcQ
Message-ID: <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
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
7=E6=9C=8819=E6=97=A5=E5=91=A8=E5=85=AD 18:09=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 07, 2025 at 02:18:05PM +0800, Jun Nie wrote:
> > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > quad-pipe usage scenarios require four pipes and involve configuring
> > two stages. In quad-pipe case, the first two pipes share a set of
> > mixer configurations and enable multi-rect mode when certain
> > conditions are met. The same applies to the subsequent two pipes.
> >
> > Assign SSPPs to the pipes in each stage using a unified method and
> > to loop the stages accordingly.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 +++++++++++++++++++---=
--------
> >  1 file changed, 89 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d65930075cc=
2a4b8a8a7d40b3d3c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_capable=
(struct dpu_hw_sspp *sspp,
> >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidt=
h);
> >  }
> >
> > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > +                                   struct dpu_sw_pipe **single_pipe,
> > +                                   struct dpu_sw_pipe_cfg **single_pip=
e_cfg,
> > +                                   int *stage_index)
> > +{
> > +     int stage_idx, pipe_idx, i, valid_pipe =3D 0;
> > +
> > +     for (stage_idx =3D 0; stage_idx < STAGES_PER_PLANE; stage_idx++) =
{
> > +             for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> > +                     pipe_idx =3D stage_idx * PIPES_PER_STAGE + i;
> > +                     if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].sr=
c_rect) !=3D 0) {
> > +                             valid_pipe++;
> > +                             if (valid_pipe > 1)
> > +                                     return false;
> > +
> > +                             *single_pipe =3D &pstate->pipe[pipe_idx];
> > +                             *single_pipe_cfg =3D &pstate->pipe_cfg[pi=
pe_idx];
> > +                             *stage_index =3D stage_idx;
> > +                     }
> > +             }
> > +     }
> > +
> > +     return valid_pipe =3D=3D 1;
> > +}
> >
> >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >                                      struct drm_atomic_state *state,
> > @@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(struc=
t dpu_plane_state *pstate,
> >                                         const struct msm_format *fmt,
> >                                         uint32_t max_linewidth)
> >  {
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe *prev_pipe =3D &prev_adjacent_pstate->pipe[0];
> > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg =3D &prev_adjacent_pstate->=
pipe_cfg[0];
> > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> >       const struct msm_format *prev_fmt =3D msm_framebuffer_format(prev=
_adjacent_pstate->base.fb);
> > +     int stage_index, prev_stage_index;
> >       u16 max_tile_height =3D 1;
> >
> > -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> > +     if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &stage_i=
ndex))
> > +             return false;
> > +
> > +     if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe,
> > +                                    &prev_pipe_cfg, &prev_stage_index)=
 ||
> >           prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> >               return false;
> >
> > +     if (stage_index !=3D prev_stage_index)
> > +             return false;
>
> This should be handled other way around: save N pstates and then loop
> over stage indices. If there is no rect at the corresponding stage for a
> plane, skip assignment (and use prev_adjacent_pstate for the next plane).

You mean dpu_plane_virtual_assign_resources() shall notify its caller
dpu_assign_plane_resources() to skip updating prev_adjacent_plane_state
if dpu_plane_try_multirect_shared() return false? If so, we can add an
argument "bool pipe_shared" in dpu_plane_virtual_assign_resources() to
get the status. But that is an optimization to share pipes across multiple
planes. Can we add new patches based on current patch set later?

Or my understanding is not aligned with your thoughts?

- Jun
>
> > +
> >       if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
> >           !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cf=
g, prev_fmt))
> >               return false;
> > @@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(struct=
 dpu_plane_state *pstate,
> >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> >               max_tile_height =3D max(max_tile_height, prev_fmt->tile_h=
eight);
> >
> > -     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > -
> > -     r_pipe->sspp =3D NULL;
> > -
> >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &=
&
> >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_li=
newidth) &&
> >           (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 ||
> > @@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(struct=
 drm_plane *plane,
> >       return 0;
> >  }
> >
> > +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe=
,
> > +                                           struct dpu_sw_pipe_cfg *pip=
e_cfg,
> > +                                           struct drm_plane_state *pla=
ne_state,
> > +                                           struct dpu_global_state *gl=
obal_state,
> > +                                           struct drm_crtc *crtc,
> > +                                           struct dpu_rm_sspp_requirem=
ents *reqs)
> > +{
> > +     struct drm_plane *plane =3D plane_state->plane;
> > +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > +     struct dpu_sw_pipe *r_pipe =3D pipe + 1;
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D pipe_cfg + 1;
> > +
> > +     if (drm_rect_width(&pipe_cfg->src_rect) !=3D 0) {
> > +             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global_s=
tate, crtc, reqs);
> > +             if (!pipe->sspp)
> > +                     return -ENODEV;
> > +     }
> > +
> > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pi=
pe_cfg,
> > +                                           pipe->sspp,
> > +                                           msm_framebuffer_format(plan=
e_state->fb),
> > +                                           dpu_kms->catalog->caps->max=
_linewidth)) {
> > +             goto stage_assinged;
> > +     }
> > +
> > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> > +             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global=
_state, crtc, reqs);
> > +             if (!r_pipe->sspp)
> > +                     return -ENODEV;
> > +             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +     }
> > +
> > +stage_assinged:
> > +     return 0;
> > +}
> > +
> >  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >                                             struct dpu_global_state *gl=
obal_state,
> >                                             struct drm_atomic_state *st=
ate,
> > @@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       struct dpu_rm_sspp_requirements reqs;
> >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> >       struct dpu_sw_pipe *pipe;
> > -     struct dpu_sw_pipe *r_pipe;
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> >       const struct msm_format *fmt;
> > -     int i;
> > +     int i, stage_id, ret;
> >
> >       if (plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > @@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> >
> > -     pipe =3D &pstate->pipe[0];
> > -     r_pipe =3D &pstate->pipe[1];
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -
> >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >               pstate->pipe[i].sspp =3D NULL;
> >
> > @@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >
> >       reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> >
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) =3D=3D 0) {
> > -             if (!prev_adjacent_pstate ||
> > -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent=
_pstate, fmt,
> > -                                                 dpu_kms->catalog->cap=
s->max_linewidth)) {
> > -                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, =
global_state, crtc, &reqs);
> > -                     if (!pipe->sspp)
> > -                             return -ENODEV;
> > -
> > -                     r_pipe->sspp =3D NULL;
> > -
> > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > -
> > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > -             }
> > -     } else {
> > -             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global_s=
tate, crtc, &reqs);
> > -             if (!pipe->sspp)
> > -                     return -ENODEV;
> > -
> > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_p=
ipe, r_pipe_cfg,
> > -                                                   pipe->sspp,
> > -                                                   msm_framebuffer_for=
mat(plane_state->fb),
> > -                                                   dpu_kms->catalog->c=
aps->max_linewidth)) {
> > -                     /* multirect is not possible, use two SSPP blocks=
 */
> > -                     r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm=
, global_state, crtc, &reqs);
> > -                     if (!r_pipe->sspp)
> > -                             return -ENODEV;
> > -
> > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +     if (prev_adjacent_pstate &&
> > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, =
fmt,
> > +                                         dpu_kms->catalog->caps->max_l=
inewidth)) {
> > +             goto assigned;
> > +     }
> >
> > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > -             }
> > +     for (stage_id =3D 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> > +             pipe =3D &pstate->pipe[stage_id * PIPES_PER_STAGE];
> > +             pipe_cfg =3D &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE=
];
> > +             ret =3D dpu_plane_assign_resource_in_stage(pipe, pipe_cfg=
,
> > +                                                      plane_state,
> > +                                                      global_state,
> > +                                                      crtc, &reqs);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> > +assigned:
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >  }
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
