Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69440A13700
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 10:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4B810E91C;
	Thu, 16 Jan 2025 09:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ABHGOroQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39CC10E91D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 09:51:59 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e46ebe19489so1056267276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737021119; x=1737625919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHkHmJVyVw2q8SHd/lGtIIaMHF7t+fsEzhn65ZBqGG0=;
 b=ABHGOroQElHoV+dzKUoQbhUVxFjE+dPazpiIy4Z7Afoz/3sQQpMj7hPu4yZ49kgYgx
 5TkrtBdxLmEPxZuRi6BE9MNZpTPBvt9mt0yQ1o8rs1loVt7/qoe2sPjYUlEEmTx/YNYI
 vmNfZpCZ2OUTrwQ0ZjnEuNf2Q5GADdzDehZBMCiQRdnnplA9tpLxIZxQSh5c/2pXwDG2
 WAOZVNexcZGXJeTChhOMJyVEIrUsb5pvnyQ/eaZ5a2w/jmFwEpfR/ct0zSphImZRZIqE
 bX9yjKaYcPqbQ6lkUe9usiJ4dcAVLxkNSnPe3oicbonAG01R4vNtdTjjmOVdlf/wty6E
 cjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737021119; x=1737625919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHkHmJVyVw2q8SHd/lGtIIaMHF7t+fsEzhn65ZBqGG0=;
 b=GLjtxOi9b66PFfOg+g0Mo4IC+FL8sqQPWnBf+KqUzEcVm1SRdrUG2rtq7VcPeaH9jo
 5fUoF3/8lvaikqrWB1BpTN0YMJubm7RoPVMV18xGyzoYvU77AxFFJxaScE0cA30cosep
 vWRCK01MVt/a2b+wSwcC10IxO8/pDz5IHfJQaJ/fmKCmUdswSb0Q0fm03Wf96pUM5aaT
 EZw/HK+TVVjoU4KZew6JcFCo36YUKkjCDbcEUJ2KVWdpt9dtzhwf2OKi63tj5wJkrxHO
 gWucFTH/Qq7s7Bs0o6P958Fc4r9LZPEQ0uWVT5P/9iuaoCuo7vtr1waR57DtLGr0Q0bJ
 LwoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgJW+LTG1qWJYHY1A4f4Zu6L2gQg6Ka/iHyQFuY33iPVFHelTMzj/rjilNC1Rx4Gs3qnbFVBzKvPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypbpjHXHoKIrj/+ioqydp4pAVXbl6X3QUuGc4PMsogR+joolNT
 bpE+MBPtJjz7GA7W2UKAQvR7yMQ0+6gpToHd9bnOKY1nj2QJI3TFBbm3O6upyJ47r6CszTegSLZ
 jg/wMXPJoOkEZaKn+08WqKAHTadnzbEsWXwVe46rQCQiSNx/v38qUhknM
X-Gm-Gg: ASbGncu+OxmrBBY5Vr3Er01SNGWqRGf+r09ISGMKalVKES6t2SBUV1FWk4CYXeoVp7d
 7pCfJ3S2d0BCMToPUC4h2ScwaHCDuoVdtBBEzFg==
X-Google-Smtp-Source: AGHT+IEPamgQ8A4umLwLWvzdOq5abqzsKPymyE869UdE7JGW5hBM/FhvB7/cu7uZnuZjcd4X4d8keygBo36mKeTM5aA=
X-Received: by 2002:a05:6902:2001:b0:e38:c0ed:8128 with SMTP id
 3f1490d57ef6-e54edf4181emr26876714276.3.1737021119084; Thu, 16 Jan 2025
 01:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
 <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
In-Reply-To: <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 17:51:48 +0800
X-Gm-Features: AbW1kvZx8A6GtE-n-Wp7iPIdMM92jpshgFLQ0sM3KOw4L6IGEW1Av757xu2vCFE
Message-ID: <CABymUCPeaG0PVBhNdvhXp=GK9RGqsqDfLLv0w+icBmHwn_hiKg@mail.gmail.com>
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

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=9C=8816=E6=97=A5=E5=
=91=A8=E5=9B=9B 17:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:00=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > > Store pipes in array with removing dedicated r_pipe. There are
> > > 2 pipes in a drm plane at most currently, while 4 pipes are
> > > required for quad-pipe case. Generalize the handling to pipe pair
> > > and ease handling to another pipe pair later.
> >
> > With the first sentence being moved to the end of the commit message:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Minor issues below, please address them in the next version.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++---=
----------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > >  3 files changed, 112 insertions(+), 102 deletions(-)
> >
> > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> > >               return -EINVAL;
> > >       }
> > >
> > > +     /* move the assignment here, to ease handling to another pairs =
later */
> >
> > Is it a TODO comment? It reads like an order.
> >
> > > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > >       /* state->src is 16.16, src_rect is not */
> > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > >
> >
> > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct =
drm_plane *plane)
> > >  {
> > >       struct drm_plane_state *state =3D plane->state;
> > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > +     struct dpu_sw_pipe *pipe;
> > > +     int i;
> > >
> > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > -                             pstate->pipe.multirect_mode);
> > > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > > +             pipe =3D &pstate->pipe[i];
> > > +             if (!pipe->sspp)
> > > +                     continue;
> > >
> > > -     if (r_pipe->sspp) {
> > > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > +                                     pstate->pipe[i].multirect_mode)=
;
> > >
> > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > +             /*
> > > +              * clear multirect for the right pipe so that the SSPP
> > > +              * can be further reused in the solo mode
> > > +              */
> > > +             if (pipe->sspp && i =3D=3D 1) {
> >
> > Wouldn't it be better to `&& i % 2 !=3D 0`? Then, I think, this conditi=
on
> > can stay even in quad-pipe case.
>
> If all pipes are in solo mode, there is no need to test ' i %2 !=3D 0 '. =
Below
> test shall be better, right?
> if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_RECT_1)

See your comments for later patch. Let's keep it as:
i % PIPES_PER_STAGE !=3D 0
>
> >
> > > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > > +
> > > +                     if (pipe->sspp->ops.setup_multirect)
> > > +                             pipe->sspp->ops.setup_multirect(pipe);
> > > +             }
> > >       }
> > >
> > >       pstate->pending =3D true;
> >
> > --
> > With best wishes
> > Dmitry
