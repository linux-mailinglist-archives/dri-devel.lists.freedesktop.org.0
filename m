Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A64A49A09
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF22610EC91;
	Fri, 28 Feb 2025 12:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uoOSByEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D10F10EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:56:23 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so1800931276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740747382; x=1741352182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTGCywFA/lKJ54Foy65iVuZAtehZv+71I6e9CYX3m94=;
 b=uoOSByEfedqdmR37G+aibpPh3IGDWvcHmiFyIbtVJPMjGZbLd/TAZepjp/Ze0efyZA
 bKKbnciq3oFdaV24/1eNn1HNT/iqAU2b/i7pR6L+RSeSwc9wz8G7hwWviHJ4kew4JFK0
 qTCDRLg05iWh67BXe7HWPEToHWET7+OmmWyJIJF84BS6bPCWxfB+40vwNYPIhnTY9emN
 zfIDseuOa/4SQ09lFWrPDlRL2ncTjqQKPusde/W19H50nNJXlIyN/irc+mE0J5CtcovL
 kAM6gRTP1s6UpollCZdv3cTnqfJssiMQ+fwzc576AIHSflcVlOSkZ5Qp0uC6uPMzJnXV
 SG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740747382; x=1741352182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTGCywFA/lKJ54Foy65iVuZAtehZv+71I6e9CYX3m94=;
 b=YxnkEZhKPM6Ire0m8M3uQZOm2DI2qwBUvBKIZXwxKqsSwoEgXXuyPceOR8fOJwOL2t
 tM5j++da5+hyr0FtMchBzbc3qQGFuzZxdPgBSvmACJa+BObQRdSTy60OJ63K+Tz4aPaM
 9pTDOuLolhhEWNGJMomMnIWZY3IEf6F4qRfmV6nyL9LMxdRYFE5Aa6ZrytzG0U0TFkrG
 EXXhPqUaM2NNENpN0qHv6m7F0H8hXrfgLR4+1bPXB01yeeOeodjjTtT+zj6m0woSRsrS
 wfHW/31f2YcxN4QGElDNBAVr+Z12disf1uszQ97m3fNGRSBQoR5fr94tPgwpbJcEuM9J
 I0qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr2Mf4qUj4j6WMzHzeR6OKO2rGtZdNhhOL4kPioLsSRd1mYbNiEJb2toguf2LtE8SjuWHQLCAcFLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYcmHaPm1uiTABW9tRFratz/7bwbMnjGavU9wSkxYj2S+lhmD0
 hFT1DTJY4pIObzEtWO8xnwy4nwHrpCvyqlPSWhs9hmChsrYbL72xjZhiDqv5tCEjIr++UkUoYPx
 79ei9PBOr/9JTjUTe0vMHX28WjC4KGscroQaJlA==
X-Gm-Gg: ASbGncvke6zgaz4q3Q2B62A7+e44aTj+s4ogpnhJva4pB+KM7HdHzSqp3J0umsfm18+
 ejHkvv3U8JdLV4YdETIWgxXy+FwB5MHGfaBkXxaweCEqmUYuh8tRE3vyvSmVmZ/cO9Oh9k/jD5e
 lI4rI2TXU=
X-Google-Smtp-Source: AGHT+IEgx8PWrXk4YwKsz1DBhe40DKB5Jr6qJyXMx6+X/MoJZz0+V/5dbn2iAtmsHRF32R5oGfjBLaMrRbF4zGOeWbI=
X-Received: by 2002:a05:6902:26c9:b0:e60:983e:f3d6 with SMTP id
 3f1490d57ef6-e60b2eb2a54mr3178855276.22.1740747382106; Fri, 28 Feb 2025
 04:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
 <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
 <ca2xiobwbga3bet6u4ktsyo62p2l7vvzetkyzkr7ovu6soo4fb@uprexbwa7z6w>
In-Reply-To: <ca2xiobwbga3bet6u4ktsyo62p2l7vvzetkyzkr7ovu6soo4fb@uprexbwa7z6w>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 28 Feb 2025 20:56:11 +0800
X-Gm-Features: AQ5f1JqP-1M6CXkD__nuPqEW9QDJY_QB45QigdFKQ_yi2VAR4ssCX691WtTs-2E
Message-ID: <CABymUCMuEY5XGyVuZ4OXLKenawRSTWn6Mk6VgBtz0-0oCMPC_A@mail.gmail.com>
Subject: Re: [PATCH v7 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8828=E6=97=A5=E5=91=A8=E4=BA=94 12:39=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Feb 26, 2025 at 08:31:02PM +0800, Jun Nie wrote:
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
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++++++---=
--------
> >  3 files changed, 58 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 0a053c5888262d863a1e549e14e3aa40a80c3f06..9405453cbf5d852e72a5f95=
4cd8c6aed3a222723 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1366,6 +1366,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >       return 0;
> >  }
> >
> > +/**
> > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > + * @state: Pointer to drm crtc state object
> > + */
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > +{
> > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > +
> > +     return cstate->num_mixers;
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d0=
9e11a43b9b4cf4153 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_ge=
t_client_type(
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > +
> >  #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index d67f2ad20b4754ca4bcb759a65a39628b7236b0f..d1d6c91ed0f8e1c62b757ca=
42546fbc421609f72 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >       struct dpu_rm_sspp_requirements reqs;
> >       struct dpu_plane_state *pstate;
> >       struct dpu_sw_pipe *pipe;
> > -     struct dpu_sw_pipe *r_pipe;
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> >       const struct msm_format *fmt;
> > -     int i;
> > +     int i, num_lm, stage_id, num_stages;
> >
> >       if (plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > @@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >
> >       pstate =3D to_dpu_plane_state(plane_state);
> >
> > -     pipe =3D &pstate->pipe[0];
> > -     r_pipe =3D &pstate->pipe[1];
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -
> >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >               pstate->pipe[i].sspp =3D NULL;
> >
> > @@ -1142,24 +1136,49 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >
> >       reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> >
> > -     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, cr=
tc, &reqs);
> > -     if (!pipe->sspp)
> > -             return -ENODEV;
> > -
> > -     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_p=
ipe_cfg,
> > -                                           pipe->sspp,
> > -                                           msm_framebuffer_format(plan=
e_state->fb),
> > -                                           dpu_kms->catalog->caps->max=
_linewidth)) {
> > -             /* multirect is not possible, use two SSPP blocks */
> > -             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global=
_state, crtc, &reqs);
> > -             if (!r_pipe->sspp)
> > -                     return -ENODEV;
> > -
> > -             pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -             pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > -
> > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +     num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> > +     num_stages =3D (num_lm + 1) / 2;
> > +     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> > +             for (i =3D stage_id * PIPES_PER_STAGE; i < (stage_id + 1)=
 * PIPES_PER_STAGE; i++) {
> > +                     struct dpu_sw_pipe *r_pipe;
> > +                     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +
> > +                     pipe =3D &pstate->pipe[i];
> > +                     pipe_cfg =3D &pstate->pipe_cfg[i];
> > +
> > +                     if (drm_rect_width(&pipe_cfg->src_rect) =3D=3D 0)
> > +                             break;
> > +
> > +                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, =
global_state, crtc, &reqs);
> > +                     if (!pipe->sspp)
> > +                             return -ENODEV;
> > +
> > +                     /* use solo SSPP for the 2nd pipe in pipe pair */
> > +                     if (i % PIPES_PER_STAGE !=3D 0)
> > +                             goto use_solo_sspp;
>
> With this in place, do we need the nested loops? Wouldn't it be enough
> to loop through the all pipes in a single run, as this condition will
> force solo SSPP for the second pipes?

Yeah, the internal loop for the 2 pipe in the stage can be expanded
and assign SSPP
directly if fail to use multi-rect mode. Will work on that.


Jun

>
> > +
> > +                     /*
> > +                      * Check multi-rect opportunity for the 2nd pipe =
in the
> > +                      * pair. SSPP multi-rect mode cross mixer pairs i=
s not
> > +                      * supported.
> > +                      */
> > +                     r_pipe =3D &pstate->pipe[i + 1];
> > +                     r_pipe_cfg =3D &pstate->pipe_cfg[i + 1];
> > +
> > +                     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 =
&&
> > +                         dpu_plane_try_multirect_parallel(pipe, pipe_c=
fg, r_pipe, r_pipe_cfg,
> > +                                                           pipe->sspp,
> > +                                                           msm_framebu=
ffer_format(plane_state->fb),
> > +                                                           dpu_kms->ca=
talog->caps->max_linewidth)) {
> > +                             i++;
> > +                             continue;
> > +                     }
> > +use_solo_sspp:
> > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +                     DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pip=
e %d.\n",
> > +                                     pipe->sspp->idx - SSPP_NONE, i);
> > +             }
> >       }
> >
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
