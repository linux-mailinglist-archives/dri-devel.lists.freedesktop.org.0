Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F9999D84
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49E110EA5C;
	Fri, 11 Oct 2024 07:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YTbTQoP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA47F10EA5C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:11:35 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6e232e260c2so15999047b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728630695; x=1729235495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C40ackh5+59lB1uChyWsBrhuu/xdrVHdO52LObajoJw=;
 b=YTbTQoP0hU5uBRkuud2GT18OfjxQyTIi700esjcsJuWvRJ8QRGRisp4GCpuWXLGHAL
 KVw60s+UC4cP/A7MM080iErRTaW9NEGPh34lH1yv6tTOrCfUIY4LMQInpXs6ca1D2TKL
 VOk3jzQB+8zSoVM8DSRJWQFt01lW3TlEaB7MVGj6Gu5ht0kW0zyGNBOecvjpJzp3m1NF
 iEDmN8rEcpdcN2KWMnqN7vp0Q6rCvf3pDn12fFiciCshx+XEaE8qHCLTyCaA3VnTJkhW
 qVlbwTgXRsMBRV3dysUkAAGLmrbH8bKKy/J3NVuKNSs0//nzrnPQEoGYVxAUW9CEl9Vm
 2kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728630695; x=1729235495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C40ackh5+59lB1uChyWsBrhuu/xdrVHdO52LObajoJw=;
 b=YVltythlTJTofKf8bLt7FrwrQn9mJ7iUvjj44qwu4JASdPAIuDHfw3mYUnbcCBRzlE
 jI0m+yYPqljzdS4HvE/QAhnrzQtklonzYiZEG0hnd2mJrBfbTNFAdcFd3EP6Cp1qgZK0
 q3HZvzyQNra9YCYAvpx5D3EmHF5tsqRelZdUydKENZ0tv+jc+w+rL8PHsAPhOobXNec5
 +wCvUV2wR1ctTKNVg8w7GXq1kxPBcY27aQ8RUiDu9s06rxIoYBlV2Pd5DGWJA3wCO04T
 Um/XwFn6Jt+N8wreS8E3fobZ+yc4E8YXbRG4UHZixGl/eLeD5i6T4GnXOYkF8okVh9vr
 nNdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+1Ni8D9YpbAB8CcyqqR0gWxi1bFFmx3jZWaYid9vJT6xXHhyaP80+FsSAOLroAAV4XD5ztuBxFQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyaoUnUoh5pyNQ5A1IpJbnUeaADYYpbUaix1oynU5Jgr8or0lX
 aRUwGQdlxQKMKwA21MNjdAejVP+kScqOgwtZ8jZBHIaIH+ee0O2QjTVgm2QBqBcDUcenqvl2FJU
 g4aRxsbKdf+eqI9fJyiuhzWTE7r3eajP2r6IDnQ==
X-Google-Smtp-Source: AGHT+IGvh5dFeky+lN+LmTHTQrH7uCEZJuHJCuRHT6jJhmDL0yhXs+9P2KQ/px0KPGexmiSUFGpY1NS+sjiOtH64V1o=
X-Received: by 2002:a05:690c:d8a:b0:6e2:11e4:2f58 with SMTP id
 00721157ae682-6e3477c063emr9833107b3.7.1728630694861; Fri, 11 Oct 2024
 00:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
 <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
 <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
In-Reply-To: <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 15:11:23 +0800
Message-ID: <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/msm/dpu: blend pipes per mixer pairs config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 11 Oct 2024 at 09:40, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > > > Blend pipes by set of mixer pair config. The first 2 pipes are for =
left
> > > > half screen with the first set of mixer pair config. And the later =
2 pipes
> > > > are for right in quad pipe case.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 +++++++++++++++++=
+-----------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > >  2 files changed, 25 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index 43d9817cd858f..66f745399a602 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct =
drm_crtc *crtc,
> > > >       const struct msm_format *format;
> > > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > > >
> > > > -     uint32_t lm_idx, i;
> > > > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> > > >       bool bg_alpha_enable =3D false;
> > > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > > >
> > > > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struc=
t drm_crtc *crtc,
> > > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->al=
pha_enable)
> > > >                       bg_alpha_enable =3D true;
> > > >
> > > > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > -                     if (!pstate->pipe[i].sspp)
> > > > -                             continue;
> > > > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_acti=
ve);
> > > > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > > -                                                mixer, cstate->num=
_mixers,
> > > > -                                                pstate->stage,
> > > > -                                                format, fb ? fb->m=
odifier : 0,
> > > > -                                                &pstate->pipe[i], =
i, stage_cfg);
> > > > +             /* loop pipe per mixer pair */
> > > > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2; lm=
_pair++) {
> > > > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > +                             pipe_idx =3D i + lm_pair * PIPES_PER_=
LM_PAIR;
> > > > +                             if (!pstate->pipe[pipe_idx].sspp)
> > > > +                                     continue;
> > > > +                             set_bit(pstate->pipe[pipe_idx].sspp->=
idx, fetch_active);
> > > > +                             _dpu_crtc_blend_setup_pipe(crtc, plan=
e,
> > > > +                                                        mixer, cst=
ate->num_mixers,
> > > > +                                                        pstate->st=
age,
> > > > +                                                        format, fb=
 ? fb->modifier : 0,
> > > > +                                                        &pstate->p=
ipe[pipe_idx], i,
> > > > +                                                        &stage_cfg=
[lm_pair]);
> > > > +                     }
> > > >               }
> > > >
> > > >               /* blend config update */
> > > > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_cr=
tc *crtc)
> > > >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> > > >       struct dpu_hw_ctl *ctl;
> > > >       struct dpu_hw_mixer *lm;
> > > > -     struct dpu_hw_stage_cfg stage_cfg;
> > > > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
> > >
> > > After seeing this code, can we define STAGES_PER_PLANE (and
> > > also keep PLANES_PER_STAGE defined to 2)?
> > >
> > Could you elaborate it? Stages describe how many layers to be blended.
> > Plane is a DRM concept that describe a buffer to be display in specific
> > display driver. Plane is already mapped to SSPP/multi-rect in DPU drive=
r
> >  in blending stage level. So I am confused here.
>
> We have dpu_hw_stage_cfg, you are adding a second instance of it. So
> we now have two stages per plane.

So you suggest to replace LM_PAIRS_PER_PLANE with STAGES_PER_PLANE,
right? I assume a stage is coupled with a LM pair.

But for PLANES_PER_STAGE, I am still confused. A stage or a LM pair can
involve many SSPP layers. How it related to planes? Plane is a concepts fro=
m
higher level.

> --
> With best wishes
> Dmitry
