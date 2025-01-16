Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12973A13DD4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEA010E9B0;
	Thu, 16 Jan 2025 15:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CUNqGxVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3D210E5A1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:37:32 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e3a0acba5feso1521735276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737041792; x=1737646592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gu0YL2cR5qf4RDKaSc6EL4rrNDHMX6AlalCb9gr7/tY=;
 b=CUNqGxVLp40psuBp6/z3TATwQSl01gQMzRaCqUVF+gnkiT9PBYuDCHaSmylyRftn6t
 7m6nSjdJIvu340D5DpfiaAOemdprn/kigj+arlBvNqwjS39P9vHKCd1snJCai2R16d70
 9X0s2PQZdbodF7fdGGaKAjFObzY0bdUpkTKJCbJtX1zDPD3zsRRBfRSxMtxeO/spTgbO
 0txTs4/M51zbp8nbM1laSs4WxbL8HHKWUwGDC+u26TGyIuPmuHjM6bBTt0dxnsOk1TK1
 F2ZJ7k9/Kf/fCIOTH7Cl0FoZr9/HHl5COEmX8ThDmv38OT5IjqQ2MY815xq2iTQ5paOy
 3kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737041792; x=1737646592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gu0YL2cR5qf4RDKaSc6EL4rrNDHMX6AlalCb9gr7/tY=;
 b=QvKsC7+BT8OYvAe90MgSewJyO+q+57J7Z6EBPW2jQOZPlVNRwIVsdjKrc2RrFhK4M2
 0o88aE69QeWXBCHRVQP1qZpHy7GIW+1qR2X12c0K/HgqjJqMXzvcfmEI/xRIeKDFnaQ5
 2C9Q4+dlgbj4ucSMPes2Q1zEzOqsD9npQGdb+Ch7UD9bZfR79op2B5mhaKCBUc6o4B8g
 goVrUWkIaM7wG29e/sTKWbwlIds3I5dqsCpP2AwmVTp12FRclF4Qpkmk0ZmhTi/LbFx1
 Mk3cgJ/AQvdVdP8YK2KsROd3B4ic/u1k8J4haU7OXZjosVb3KdgP1Uy5uSC7c6/hACtU
 WH9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe9wCK+O30ht1Uk6v4Ckw0DWXniWQCzOoa+UQv9iVyEKsUG0MCulkK5zqNJcrH8TPxfw0FWjbyEYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2nXxNk83rAay7Qc4UJQRcEB3kYcCx5+Rh7AqX8SyRm5+I1uHU
 Z6X7ydPetuAa9JympbxLYukuVDM7f+07MtLhdCJ7/NQA2zsaEKPMohQVGgTZEmhSmHqIiy5nJop
 7j3elTCnBHXsdPyFhJKJ1LXwrq5pbRZ6VHw/DSw==
X-Gm-Gg: ASbGncsP17d49obaCXXfPQIdZH/U3FRWVcUdziIAxU0r+U7WItMXlMpI319XfYL1xrJ
 W9qR0XAPp0Qwtc7New9GBTQGHNm5UWMJUWsr6Yw==
X-Google-Smtp-Source: AGHT+IE2lu1RJ+81fEpNx2WS29TXGJpZrv6nZSZo1ywtrcEHqUGGQ7ZOJqu97lvj99DQhbFcEkOqg4s+u5+aR73vUwE=
X-Received: by 2002:a05:6902:1502:b0:e4b:25c6:54f1 with SMTP id
 3f1490d57ef6-e54ee1ece4fmr27894249276.33.1737041791741; Thu, 16 Jan 2025
 07:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
 <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
 <gj6lxrclgabwuww3rl2ynw5qmaq4lx6xycxrazcwnnf5fbezjb@oijoszqsrdps>
In-Reply-To: <gj6lxrclgabwuww3rl2ynw5qmaq4lx6xycxrazcwnnf5fbezjb@oijoszqsrdps>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 23:36:21 +0800
X-Gm-Features: AbW1kvYXwuBEDYTg5kJTxrLDV19dmEanvAhgmxnLYFZRVVWyY8KWs11jybEQtzk
Message-ID: <CABymUCPa_k7OriJcDNZmCER9zhK-vk78NaK5HpV8-+Ta+MQQMg@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 18:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 05:49:43PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=
=E6=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:00=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > > > Store pipes in array with removing dedicated r_pipe. There are
> > > > 2 pipes in a drm plane at most currently, while 4 pipes are
> > > > required for quad-pipe case. Generalize the handling to pipe pair
> > > > and ease handling to another pipe pair later.
> > >
> > > With the first sentence being moved to the end of the commit message:
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Minor issues below, please address them in the next version.
> > >
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-=
------------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > > >  3 files changed, 112 insertions(+), 102 deletions(-)
> > >
> > > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct=
 drm_plane *plane,
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > +     /* move the assignment here, to ease handling to another pair=
s later */
> > >
> > > Is it a TODO comment? It reads like an order.
> > >
> > > > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > >       /* state->src is 16.16, src_rect is not */
> > > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src=
);
> > > >
> > >
> > > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struc=
t drm_plane *plane)
> > > >  {
> > > >       struct drm_plane_state *state =3D plane->state;
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > > +     struct dpu_sw_pipe *pipe;
> > > > +     int i;
> > > >
> > > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > > -                             pstate->pipe.multirect_mode);
> > > > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > > > +             pipe =3D &pstate->pipe[i];
> > > > +             if (!pipe->sspp)
> > > > +                     continue;
> > > >
> > > > -     if (r_pipe->sspp) {
> > > > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > > +                                     pstate->pipe[i].multirect_mod=
e);
> > > >
> > > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > > +             /*
> > > > +              * clear multirect for the right pipe so that the SSP=
P
> > > > +              * can be further reused in the solo mode
> > > > +              */
> > > > +             if (pipe->sspp && i =3D=3D 1) {
> > >
> > > Wouldn't it be better to `&& i % 2 !=3D 0`? Then, I think, this condi=
tion
> > > can stay even in quad-pipe case.
> >
> > If all pipes are in solo mode, there is no need to test ' i %2 !=3D 0 '=
. Below
> > test shall be better, right?
> > if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_RECT_1)
>
> Again, this will not work as expected for the SSPP-sharing case as it
> will then clear pipe 0 for the sharing planes.
>
> Let me think a bit... This code resets multirect for right pipes. It was
> added back in 4.9 to fix the case of 'master' aka RECT_0 not being a
> part of the atomic update. However I don't think this is applicable
> anymore. We use z_pos normalization, so all planes for a CRTC are added
> to the commit. Please drop this piece in a separate commit.

You mean only testing sspp as below? We have to handle the default
 non-shared case as existing implementation. Maybe we add a flag after
sharing SSPP among planes? Otherwise, how to distinct the shared
SSPP case and disable multi-rect mode in non-shared case?

               if (pipe->sspp) {

>
> >
> > >
> > > > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> > > > +
> > > > +                     if (pipe->sspp->ops.setup_multirect)
> > > > +                             pipe->sspp->ops.setup_multirect(pipe)=
;
> > > > +             }
> > > >       }
> > > >
> > > >       pstate->pending =3D true;
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
