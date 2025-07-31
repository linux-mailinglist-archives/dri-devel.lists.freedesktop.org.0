Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60251B16FDE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 12:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5E910E775;
	Thu, 31 Jul 2025 10:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WfOh1RtF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3422410E775
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:52:39 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e8fd86363cfso167900276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753959158; x=1754563958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sj/cic72rW3vzkgaoo3LbEi14h1ZdonLVH0p9rxyNnY=;
 b=WfOh1RtFSZw4x0FXFffdQjqrxrvh3Q+GXGngN2AEBU/z0lVI4708kFYDaAlKrzduhh
 NFUcaq8Yas9TiqkGmz7ur+hFuthAavSuWaTgAcopJs0RhRARXYJaXYn3VpHmlJoB6ZHL
 CGj9L72B0L+yiD6IpRUnUxYd11X1X/UXsUnSVI4SE6pn7O3lB4wRmxu7SdnF3v4DIj/C
 64um3fvohAkJYXrmDad41Ox5B/UfmUW7lBIGNrmfghZH5omq9EgxOpPNtQTw7f2aL5Tv
 eu8CrF+dCvmNt4J+qhUrpBCbKh33cvYgADCy6lDY3fjZ/W7otqcFTaVAkA6XjyzYDtyE
 DdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753959158; x=1754563958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sj/cic72rW3vzkgaoo3LbEi14h1ZdonLVH0p9rxyNnY=;
 b=eNJ/xq3aSLWW3CGvrNdbzoO8MjMP994QuAGb52ZVh6Hd/gMv9BlrqFZ2W7v/ghjuCW
 e9Q/reErWEconcmmq4qI0i1hISWTC2HzaZ+JTgfcKO2tdN25jcsZw+A84TK/a1HqK3/Z
 0QKCK2Zeg+Nr+aBl35a0fTj4YpGafQRIUw/sZtFf9DeDdQc39rEKLZyQb1uQBPU9B3HM
 69hyUc5n5+HuLQ1vgmoSKEUfqSGgwcDNXMR2D1qYcLVHlqFBz6jBqY6ujBJayVZBuc+4
 fXUTWpsprdD/LFpSNdVAbToyIBeuaFiUj4HR4g3yWs20KtglNjjfb0oMhOVbX6y7ZFtS
 5Zhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn1Bx0AvLDWHTEkQppoX/+m3fg5BhqlbGBGritO3wIC9++gyPYRw9HR6bvw1ZN1WJ08ILAj486QkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVIOotfQGgjE+YEDwxery82L1D7WYdrpKPTlo6A83OdWktTPln
 QZrFS6+gtmwGwn9YlYn+z871l94x0H0h3nMjjNlIURODsmoJpmQs9PjG9Y2B0fd8YMppSHA6cx8
 QiWlgx3iOlkvNApT4EackX/XCv28oJc/al0xMqpWFbw==
X-Gm-Gg: ASbGncvX0e0bVRhOvgvBEUI+ZhsE4rt29kVhWLCncvD8Zi1UJ+Ege+my1SY3lS7KLAK
 cBvb2BnmpMqyZijjDWBaFQybZFtwkdpUg2TPhdhD/QzH1E2qEg47GNgNeofCyr6wktLePl7yqaw
 Thc8cNXAXUi4z21Aj5Xq9i723JE+IMO6BWWj1gS1ZIBZj6JL3Qw1sdrk0Cm0DvvsRRdKfGvMvCQ
 go8YIxJNwU0xh2Ohw==
X-Google-Smtp-Source: AGHT+IHR/XhhCQrku5Wtt42Uzh/v8VDjDa79z/Pt9EIzsoR3dvddrg+UUlc63lIi9/3QIboav8AxkR0sSCS4QFuaMxg=
X-Received: by 2002:a05:6902:1204:b0:e8f:d693:9ab with SMTP id
 3f1490d57ef6-e8fd6930e27mr1286944276.13.1753959157975; Thu, 31 Jul 2025
 03:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
 <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
In-Reply-To: <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 31 Jul 2025 18:52:26 +0800
X-Gm-Features: Ac12FXy4uMWg6MVwlItUiDaEBwOnGEiMYLHy6vqLkyh8oXU__oPmyxki3UUHino
Message-ID: <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
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
7=E6=9C=8831=E6=97=A5=E5=91=A8=E5=9B=9B 02:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
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
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++----=
--------
> >  1 file changed, 99 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f460=
d62901dced65e3a9e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capable=
(struct dpu_hw_sspp *sspp,
> >  }
> >
> >
> > +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state =
*pstate,
> > +                                            struct dpu_sw_pipe **singl=
e_pipe,
> > +                                            struct dpu_sw_pipe_cfg **s=
ingle_pipe_cfg,
> > +                                            int stage_index)
> > +{
> > +     int pipe_idx, i, valid_pipe =3D 0;
> > +
> > +     for (i =3D 0; i < PIPES_PER_STAGE; i++) {
>
> Why do you need to loop here? Is there a case when pipe 0 is not
> assigned, but pipe 1 is?

Loop the pipe in a stage to count the valid pipes. If there are 2 valid
pipes in stage of the current plane, this function will return false.
Or you prefer the below coding?

1029         pipe_idx =3D stage_index * PIPES_PER_STAGE;
1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) !=3D =
0 &&
1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
1].src_rect) =3D=3D 0) {
1032                         if (single_pipe)
1033                                 *single_pipe =3D &pstate->pipe[pipe_id=
x];
1034                         if (single_pipe_cfg)
1035                                 *single_pipe_cfg =3D
&pstate->pipe_cfg[pipe_idx];
1036                 return true;
1037         }
1038
1039         return false;

>
> > +             pipe_idx =3D stage_index * PIPES_PER_STAGE + i;
> > +             if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) =
!=3D 0) {
> > +                     valid_pipe++;
> > +                     if (valid_pipe > 1)
> > +                             return false;
> > +
> > +                     if (single_pipe)
> > +                             *single_pipe =3D &pstate->pipe[pipe_idx];
> > +                     if (single_pipe_cfg)
> > +                             *single_pipe_cfg =3D &pstate->pipe_cfg[pi=
pe_idx];
> > +             }
> > +     }
> > +
> > +     return valid_pipe =3D=3D 1;
> > +}
> > +
> >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >                                      struct drm_atomic_state *state,
> >                                      const struct drm_crtc_state *crtc_=
state)
> > @@ -1023,17 +1047,20 @@ static bool dpu_plane_try_multirect_parallel(st=
ruct dpu_sw_pipe *pipe, struct dp
> >  static int dpu_plane_try_multirect_shared(struct dpu_plane_state *psta=
te,
> >                                         struct dpu_plane_state *prev_ad=
jacent_pstate,
> >                                         const struct msm_format *fmt,
> > -                                       uint32_t max_linewidth)
> > +                                       uint32_t max_linewidth, int sta=
ge_index)
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
> >       u16 max_tile_height =3D 1;
> >
> > -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> > +     if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
> > +                                             &pipe_cfg, stage_index))
> > +             return false;
> > +
> > +     if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
> > +                                             &prev_pipe, &prev_pipe_cf=
g,
> > +                                             stage_index) ||
> >           prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> >               return false;
> >
> > @@ -1048,11 +1075,6 @@ static int dpu_plane_try_multirect_shared(struct=
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
> > @@ -1181,36 +1203,69 @@ static int dpu_plane_virtual_atomic_check(struc=
t drm_plane *plane,
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
> > +             pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +             pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +     }
> > +
> > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pi=
pe_cfg,
> > +                                           pipe->sspp,
> > +                                           msm_framebuffer_format(plan=
e_state->fb),
> > +                                           dpu_kms->catalog->caps->max=
_linewidth))
> > +             goto stage_assinged;
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
> >                                             struct drm_plane_state *pla=
ne_state,
> > -                                           struct drm_plane_state *pre=
v_adjacent_plane_state)
> > +                                           struct drm_plane_state **pr=
ev_adjacent_plane_state)
> >  {
> >       const struct drm_crtc_state *crtc_state =3D NULL;
> >       struct drm_plane *plane =3D plane_state->plane;
> >       struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >       struct dpu_rm_sspp_requirements reqs;
> > -     struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > +     struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_PER_=
PLANE];
> >       struct dpu_sw_pipe *pipe;
> > -     struct dpu_sw_pipe *r_pipe;
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> >       const struct msm_format *fmt;
> > -     int i;
> > +     int i, ret;
> >
> >       if (plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >                                                          plane_state->c=
rtc);
> >
> >       pstate =3D to_dpu_plane_state(plane_state);
> > -     prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> > -             to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> > -
> > -     pipe =3D &pstate->pipe[0];
> > -     r_pipe =3D &pstate->pipe[1];
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > +     for (i =3D 0; i < STAGES_PER_PLANE; i++)
> > +             prev_adjacent_pstate[i] =3D prev_adjacent_plane_state[i] =
?
> > +                     to_dpu_plane_state(prev_adjacent_plane_state[i]) =
: NULL;
> >
> >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >               pstate->pipe[i].sspp =3D NULL;
> > @@ -1225,42 +1280,27 @@ static int dpu_plane_virtual_assign_resources(s=
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
> > +     for (i =3D 0; i < STAGES_PER_PLANE; i++) {
> > +             if (!prev_adjacent_pstate[i])
> > +                     goto assignment;
> >
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
> > +             if (dpu_plane_try_multirect_shared(pstate, prev_adjacent_=
pstate[i], fmt,
> > +                                                dpu_kms->catalog->caps=
->max_linewidth,
> > +                                                i))
> > +                     continue;
>
>
> if (prev_adjacent_pstate[i] &&
>     dpu_plane_try_multirect_shared())
>         continue;
>
> No need for the goto.

Right, it will be simpler.
>
> >
> > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +assignment:
> > +             if (dpu_plane_get_single_pipe_in_stage(pstate, NULL, NULL=
, i))
> > +                     prev_adjacent_plane_state[i] =3D plane_state;
> >
> > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > -             }
> > +             pipe =3D &pstate->pipe[i * PIPES_PER_STAGE];
> > +             pipe_cfg =3D &pstate->pipe_cfg[i * PIPES_PER_STAGE];
> > +             ret =3D dpu_plane_assign_resource_in_stage(pipe, pipe_cfg=
,
> > +                                                      plane_state,
> > +                                                      global_state,
> > +                                                      crtc, &reqs);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > @@ -1273,7 +1313,7 @@ int dpu_assign_plane_resources(struct dpu_global_=
state *global_state,
> >                              unsigned int num_planes)
> >  {
> >       unsigned int i;
> > -     struct drm_plane_state *prev_adjacent_plane_state =3D NULL;
> > +     struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLAN=
E] =3D { NULL };
> >
> >       for (i =3D 0; i < num_planes; i++) {
> >               struct drm_plane_state *plane_state =3D states[i];
> > @@ -1284,11 +1324,9 @@ int dpu_assign_plane_resources(struct dpu_global=
_state *global_state,
> >
> >               int ret =3D dpu_plane_virtual_assign_resources(crtc, glob=
al_state,
> >                                                            state, plane=
_state,
> > -                                                          prev_adjacen=
t_plane_state);
> > +                                                          &prev_adjace=
nt_plane_state[0]);
>
> It's exactly the prev_adjacent_plane_state.

Yes, I will change it.

>
> >               if (ret)
> >                       break;
> > -
> > -             prev_adjacent_plane_state =3D plane_state;
> >       }
> >
> >       return 0;
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
