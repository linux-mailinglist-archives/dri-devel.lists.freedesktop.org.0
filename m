Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2579C999D59
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D7110EA53;
	Fri, 11 Oct 2024 07:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BRK6DyQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFED110EA53
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:03:03 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6e305c2987bso16316877b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728630183; x=1729234983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/WrAkYmWTzQpnkkGqkA3T9eZ4D5Jk8JiEoDs0ZQrAM=;
 b=BRK6DyQV7mpvGa2hWMbhJDYwGa69COXLCOlGxGyjTUHCMUr0cTPt1Ai+azjsqXdGN1
 Xn/pZ7EybLJWnkodAOzc81ZN0czQWcbPCqgCZ5IPGft0Anwy5sh4KJndSF5ocATQnHa4
 cRZ3UoKQxpHGLg3r4YYp2M/94+0ex+TQqqJNv0eM550THQNomSy9Ij5kt55blhIq4zTt
 IZhROL7Wyi6geADLxGn8Iz1yeuV5dUC9M7b8VYAJURE/GO9Joq1F4R5Xhu3iPmR8LeO4
 /SmcxsSn5E3kzLzKPlzY7E5kNh7ODg6dTDQdwDf7RIkSASC++uhdre0mzAG+GOYsnV9G
 cc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728630183; x=1729234983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e/WrAkYmWTzQpnkkGqkA3T9eZ4D5Jk8JiEoDs0ZQrAM=;
 b=RXZVuWSLKI6IwmgK4cuPUuljb49F1X003IaDqO4UNbmb1CHmrmomK5EsC6TRD+P1HV
 /AUv5gLYQx3fSmQ1BMHAxixR7NF/HFJbhzpE1LOpXY5LuDRArmDpBqCkzDBeT/V9JMCf
 rZQNTe9K91cYd7Uh0pJA8dX60hyv7R3NeSoI2lJJKDyRMCsABNzug/YP8ANIhvFOnxea
 LBs5w+TIOKqfsgqd0X/9nn1d4oIDyNUq3EVoX0IW1KP1c0qvc3dC2UURJEQhete/oQWs
 3sCILWBdlk9UmelWQ5TPBe7rMuneUmzmd6LpMrZTZrzRZLeQrxlP3zfTTONwrvOMHw3M
 85Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxtyBBSp96r/Z+BKkyRp1EIgqL/LJkQpYr+KchPXR1d+XxaIK7brPfzrw8lmy8ZHXrAHVGoGEnSU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxutx0x6LkV2krVtvY4NNEef1shT6YMeO0eKZ2McvNVzzuBSn2
 D2R9BwW3cGGbuVUDjotiMAg9cGSjbtBWOqH4+AVbXXR1C3hPGDf82qVPl6yzEAo6IMH8nXjx49u
 ymnQb66GNZ+9tOQYlGt2Z5/KutG1MayyezAt+Aw==
X-Google-Smtp-Source: AGHT+IExrPlFUulHFd/PrfCfhS/4BHjHsolgjvVdCJaeB+YAMnpZ8ogCYZHPoFPVad1Xx04WRVGP4lRAtqTIlIKyqzc=
X-Received: by 2002:a05:690c:4e09:b0:6dd:bbb4:bcc7 with SMTP id
 00721157ae682-6e347c4de20mr8741367b3.44.1728630182736; Fri, 11 Oct 2024
 00:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
 <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
In-Reply-To: <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 10:02:52 +0300
Message-ID: <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/msm/dpu: blend pipes per mixer pairs config
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

On Fri, 11 Oct 2024 at 09:40, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > > Blend pipes by set of mixer pair config. The first 2 pipes are for le=
ft
> > > half screen with the first set of mixer pair config. And the later 2 =
pipes
> > > are for right in quad pipe case.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++-=
----------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > >  2 files changed, 25 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 43d9817cd858f..66f745399a602 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct dr=
m_crtc *crtc,
> > >       const struct msm_format *format;
> > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > >
> > > -     uint32_t lm_idx, i;
> > > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> > >       bool bg_alpha_enable =3D false;
> > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > >
> > > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct =
drm_crtc *crtc,
> > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->alph=
a_enable)
> > >                       bg_alpha_enable =3D true;
> > >
> > > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > -                     if (!pstate->pipe[i].sspp)
> > > -                             continue;
> > > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_active=
);
> > > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > -                                                mixer, cstate->num_m=
ixers,
> > > -                                                pstate->stage,
> > > -                                                format, fb ? fb->mod=
ifier : 0,
> > > -                                                &pstate->pipe[i], i,=
 stage_cfg);
> > > +             /* loop pipe per mixer pair */
> > > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2; lm_p=
air++) {
> > > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > +                             pipe_idx =3D i + lm_pair * PIPES_PER_LM=
_PAIR;
> > > +                             if (!pstate->pipe[pipe_idx].sspp)
> > > +                                     continue;
> > > +                             set_bit(pstate->pipe[pipe_idx].sspp->id=
x, fetch_active);
> > > +                             _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > +                                                        mixer, cstat=
e->num_mixers,
> > > +                                                        pstate->stag=
e,
> > > +                                                        format, fb ?=
 fb->modifier : 0,
> > > +                                                        &pstate->pip=
e[pipe_idx], i,
> > > +                                                        &stage_cfg[l=
m_pair]);
> > > +                     }
> > >               }
> > >
> > >               /* blend config update */
> > > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc=
 *crtc)
> > >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> > >       struct dpu_hw_ctl *ctl;
> > >       struct dpu_hw_mixer *lm;
> > > -     struct dpu_hw_stage_cfg stage_cfg;
> > > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
> >
> > After seeing this code, can we define STAGES_PER_PLANE (and
> > also keep PLANES_PER_STAGE defined to 2)?
> >
> Could you elaborate it? Stages describe how many layers to be blended.
> Plane is a DRM concept that describe a buffer to be display in specific
> display driver. Plane is already mapped to SSPP/multi-rect in DPU driver
>  in blending stage level. So I am confused here.

We have dpu_hw_stage_cfg, you are adding a second instance of it. So
we now have two stages per plane.

>
> -  Jun



--=20
With best wishes
Dmitry
