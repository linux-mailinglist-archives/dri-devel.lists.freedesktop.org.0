Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853FA136F8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 10:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB08910E91B;
	Thu, 16 Jan 2025 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K4Fuqnhd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C084A10E91C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 09:50:54 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e3a0acba5feso1007349276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737020994; x=1737625794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpI6PkeKxs4La2peZtwi+NZrR6YCbXN2P1PW0muNPlo=;
 b=K4Fuqnhd7uxWFkIOyWS39bkk2mgLyEtHDBUFGS5muI/Mhy0qn3VXpWY4OVZ6LLfpFa
 906K+fY0hq94ZgRHI5s6JHgDNSXUlEEA2b4huDPb2/rpD90W4DP8BBIW+VQDmnhRL8Hk
 HEK5M45rosDDa0X8e1f1YdiXJt8vPWpF/PkPuqSycYSERyZBP26GqOBMZ89hGf2xOFI7
 KR7eBTC6Wz9blgBwLoBy2Dj55qIx68Jbm884rQByZ5x6ASJQONolCPoWl4ul26MLEisg
 ahrPvl5gqxCpUBQlL4Yo0/SuPmIZg49blRt9U2OrYOf1gk3YrwihdPMCuulXQpzEQ9Qf
 +Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737020994; x=1737625794;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpI6PkeKxs4La2peZtwi+NZrR6YCbXN2P1PW0muNPlo=;
 b=Z1Zk+JNW7I4nmajKX6FQdMnLpOmfx2GVI4+vG5ElU3tLdRW0vXwXZ6F5K3x7aB3lmM
 lIFOphHSUifJh2d4p1j6lfC27z2d4/8LLtSL2ZbfE/B6JCzSLCoq4Ov9XXQYXfeYmGB3
 zBeB3aSzzL/cKcMN9NY1QqnO9dgPquOPBO15sbxTbAmP1GjFAlFEqZfGnJO/tE6s7VRb
 sm/dTjkKcX2PTi1De64ks+O+kSwLtXJz6jEeny3cCAvuMPhQ9gfCatlywLaX2vVajX1V
 p5txzrgNl0MOecquNztt6eyLrLT+tdC+vGbOLEdkTcmu6nkeSZWp2rwnVmDSKrOqSvD2
 UKuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL2hbcxNQI7NeiLo4LpioOpVg5VdQcleRMQw8cK1k5E1dSrr8a/78N9aweTvw4pSJxyPopLJiFxBQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAXgxzSPWFeck94hkinAtlkBs/hwDaueXm4gmiai9Koxx2PodM
 qg9La5Pi4+5JtDlleQC/dfxlbkJKe9h5xmASaW4d+2ZkDy9PgHjwQZG4p3vgiR6nSkVE53dJoXP
 fI9yU2FvINMzC0G3hAfPMW0TIaUX6JDxfTX7cJA==
X-Gm-Gg: ASbGncslLtFo9lhnksZQOFwozti3Z3COAG+51Ci7ODCRCX9Z+wgNWyH90O9K80UK6wo
 k6rf0ipYrv3DZCkFJaEBc0B/CHTdNWX9L/0eOag==
X-Google-Smtp-Source: AGHT+IHsUYmbTKsUERg4PfYdjvqQT5L0zUvj7zKKOodZZe9rrGFoJnyZOZnpy+8qKbTSyrG2OPRnZ2rr1I1fJULeFAw=
X-Received: by 2002:a05:6902:1209:b0:e57:8814:1399 with SMTP id
 3f1490d57ef6-e5788141813mr6478134276.44.1737020993767; Thu, 16 Jan 2025
 01:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
In-Reply-To: <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 17:49:43 +0800
X-Gm-Features: AbW1kvaD57nyzT6yujFT9rwov5zHgBxS9AhICFkcPyff2wmU_ZFd8JowLM7kwEE
Message-ID: <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
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
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > Store pipes in array with removing dedicated r_pipe. There are
> > 2 pipes in a drm plane at most currently, while 4 pipes are
> > required for quad-pipe case. Generalize the handling to pipe pair
> > and ease handling to another pipe pair later.
>
> With the first sentence being moved to the end of the commit message:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Minor issues below, please address them in the next version.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-----=
--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> >  3 files changed, 112 insertions(+), 102 deletions(-)
>
> > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
> >               return -EINVAL;
> >       }
> >
> > +     /* move the assignment here, to ease handling to another pairs la=
ter */
>
> Is it a TODO comment? It reads like an order.
>
> > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> >       /* state->src is 16.16, src_rect is not */
> >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> >
>
> > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct dr=
m_plane *plane)
> >  {
> >       struct drm_plane_state *state =3D plane->state;
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > +     struct dpu_sw_pipe *pipe;
> > +     int i;
> >
> > -     trace_dpu_plane_disable(DRMID(plane), false,
> > -                             pstate->pipe.multirect_mode);
> > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > +             pipe =3D &pstate->pipe[i];
> > +             if (!pipe->sspp)
> > +                     continue;
> >
> > -     if (r_pipe->sspp) {
> > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +             trace_dpu_plane_disable(DRMID(plane), false,
> > +                                     pstate->pipe[i].multirect_mode);
> >
> > -             if (r_pipe->sspp->ops.setup_multirect)
> > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > +             /*
> > +              * clear multirect for the right pipe so that the SSPP
> > +              * can be further reused in the solo mode
> > +              */
> > +             if (pipe->sspp && i =3D=3D 1) {
>
> Wouldn't it be better to `&& i % 2 !=3D 0`? Then, I think, this condition
> can stay even in quad-pipe case.

If all pipes are in solo mode, there is no need to test ' i %2 !=3D 0 '. Be=
low
test shall be better, right?
if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_RECT_1)

>
> > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +
> > +                     if (pipe->sspp->ops.setup_multirect)
> > +                             pipe->sspp->ops.setup_multirect(pipe);
> > +             }
> >       }
> >
> >       pstate->pending =3D true;
>
> --
> With best wishes
> Dmitry
