Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A450699E9C1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 14:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251B010E579;
	Tue, 15 Oct 2024 12:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fKG2kQ2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2356810E094
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 12:26:28 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6e377e4aea3so19311937b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728995187; x=1729599987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ug4CIhvI9c7efoiVjwADMKle6ML6zboAC9qottYj1qg=;
 b=fKG2kQ2GEzlyINRgJUFvkVv3pl+z72Gc69DNqCgxFDQPW4/bmbND6FmEL572HoRq7s
 XDY5R9PYIQVzwenJ7F1UgpfwsP6ZtzZrnOPCop7dImYvVVXWVEwYUvz0FeNyWRrdZAqx
 vl1n2rnxzecehIQ4tKLlAPxf3FF01AO30wrrwatgINlzsf3zfH3FKPznjD9TFj21HtlA
 0EHjWM6NfvAn+iSRfl/skRIgCD6Nyjucb1QOCoNzl6grwPnmx35bLub1k2dPsKnH1VyF
 /TVaKgAii/QUi+MzloweMFDnfAjEQvbG1NLZvxqVN36lDgqx/TWe16D20jUUYAV2UEj2
 mq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728995187; x=1729599987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ug4CIhvI9c7efoiVjwADMKle6ML6zboAC9qottYj1qg=;
 b=DYLuvuSzTYXtcfeAei3g98/WA2sKejJnl7fQO7A908jKqSSS6MbhINpOLwZ7jCcXNs
 R91rIbLIDGaiWtN7PXffwc1r1ChHXfGdsw0vitp8+NXeVEciSeZ2IcrLBEoh3zlqTsWg
 4aeGrh63BC5kN7S5xSZfuksNr5UVSp58PK7Fgq1DF2PPSE/y969Z+YYn2969jRAvcivp
 XDsFezixRZhvB9qk6zQOK2LA3oM7unZnpWglQYPqKScCBawREzrGxWQkLuTZDotDh4Nc
 4vEVJ74a4ENIYyyLTabxvk9mcR5q0fzmTap8pKNf/TucVdfzgaHgBSG1JTw7Lxp2ul+M
 k/SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBetMxOEjWCXJ/sGbf6THrMPgYJcZB/svSBrmuaGEzkFJ9zlpKgbXmpra+w0l4tDmCxqJINjthuZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRlNpAiBVDAlxsYtbzfoV/shd8L7LUXQKgInHj7mSa0n3JocBi
 qq0m6XmB+KUENi23mUkG9rQKU7z1TeWNz7rdmTWHXzm6nAPA3caErFAOBbD1cmeL4RcMQiDZjYc
 Bgf0Kn8CryRNGA66q+rk6U1k+nehNtd+HJmi1rw==
X-Google-Smtp-Source: AGHT+IE2uEu5425yw6JXhtzkTXiIwiLHa2uxraMUMytCqyA0U+XKYqEdiFVahWOa8TyQsjCe2gI8WVQTReMheBwdMyM=
X-Received: by 2002:a05:690c:dc7:b0:6dd:d2c5:b2c with SMTP id
 00721157ae682-6e364107ef0mr79205637b3.4.1728995187172; Tue, 15 Oct 2024
 05:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
 <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
 <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
 <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com>
 <CAA8EJppMu5o7juhKUN2Y_4CRYKtaWN9G01aPU2ZfksE_tzjqCQ@mail.gmail.com>
 <CABymUCNbwY5hoaOxydPccFAdbnCQgUMspJLHkNziQyf=NxOj2A@mail.gmail.com>
In-Reply-To: <CABymUCNbwY5hoaOxydPccFAdbnCQgUMspJLHkNziQyf=NxOj2A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 15 Oct 2024 15:26:22 +0300
Message-ID: <CAA8EJpo9XMo9EGKMzVaDrS7tPZ6CHw6RkqROF4-k94KpFXVjfw@mail.gmail.com>
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

On Tue, 15 Oct 2024 at 11:27, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:13=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, 11 Oct 2024 at 10:11, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B4=
10=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:03=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Fri, 11 Oct 2024 at 09:40, Jun Nie <jun.nie@linaro.org> wrote:
> > > > >
> > > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=
=B9=B410=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > > >
> > > > > > On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > > > > > > Blend pipes by set of mixer pair config. The first 2 pipes ar=
e for left
> > > > > > > half screen with the first set of mixer pair config. And the =
later 2 pipes
> > > > > > > are for right in quad pipe case.
> > > > > > >
> > > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 +++++++++++=
+++++++-----------
> > > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > > > >  2 files changed, 25 insertions(+), 14 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drive=
rs/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > index 43d9817cd858f..66f745399a602 100644
> > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(s=
truct drm_crtc *crtc,
> > > > > > >       const struct msm_format *format;
> > > > > > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > > > > > >
> > > > > > > -     uint32_t lm_idx, i;
> > > > > > > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> > > > > > >       bool bg_alpha_enable =3D false;
> > > > > > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > > > > > >
> > > > > > > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer=
(struct drm_crtc *crtc,
> > > > > > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && form=
at->alpha_enable)
> > > > > > >                       bg_alpha_enable =3D true;
> > > > > > >
> > > > > > > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > > > > -                     if (!pstate->pipe[i].sspp)
> > > > > > > -                             continue;
> > > > > > > -                     set_bit(pstate->pipe[i].sspp->idx, fetc=
h_active);
> > > > > > > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > > > > > -                                                mixer, cstat=
e->num_mixers,
> > > > > > > -                                                pstate->stag=
e,
> > > > > > > -                                                format, fb ?=
 fb->modifier : 0,
> > > > > > > -                                                &pstate->pip=
e[i], i, stage_cfg);
> > > > > > > +             /* loop pipe per mixer pair */
> > > > > > > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE /=
 2; lm_pair++) {
> > > > > > > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i+=
+) {
> > > > > > > +                             pipe_idx =3D i + lm_pair * PIPE=
S_PER_LM_PAIR;
> > > > > > > +                             if (!pstate->pipe[pipe_idx].ssp=
p)
> > > > > > > +                                     continue;
> > > > > > > +                             set_bit(pstate->pipe[pipe_idx].=
sspp->idx, fetch_active);
> > > > > > > +                             _dpu_crtc_blend_setup_pipe(crtc=
, plane,
> > > > > > > +                                                        mixe=
r, cstate->num_mixers,
> > > > > > > +                                                        psta=
te->stage,
> > > > > > > +                                                        form=
at, fb ? fb->modifier : 0,
> > > > > > > +                                                        &pst=
ate->pipe[pipe_idx], i,
> > > > > > > +                                                        &sta=
ge_cfg[lm_pair]);
> > > > > > > +                     }
> > > > > > >               }
> > > > > > >
> > > > > > >               /* blend config update */
> > > > > > > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct =
drm_crtc *crtc)
> > > > > > >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> > > > > > >       struct dpu_hw_ctl *ctl;
> > > > > > >       struct dpu_hw_mixer *lm;
> > > > > > > -     struct dpu_hw_stage_cfg stage_cfg;
> > > > > > > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
> > > > > >
> > > > > > After seeing this code, can we define STAGES_PER_PLANE (and
> > > > > > also keep PLANES_PER_STAGE defined to 2)?
> > > > > >
> > > > > Could you elaborate it? Stages describe how many layers to be ble=
nded.
> > > > > Plane is a DRM concept that describe a buffer to be display in sp=
ecific
> > > > > display driver. Plane is already mapped to SSPP/multi-rect in DPU=
 driver
> > > > >  in blending stage level. So I am confused here.
> > > >
> > > > We have dpu_hw_stage_cfg, you are adding a second instance of it. S=
o
> > > > we now have two stages per plane.
> > >
> > > So you suggest to replace LM_PAIRS_PER_PLANE with STAGES_PER_PLANE,
> > > right? I assume a stage is coupled with a LM pair.
> > >
> > > But for PLANES_PER_STAGE, I am still confused. A stage or a LM pair c=
an
> > > involve many SSPP layers. How it related to planes? Plane is a concep=
ts from
> > > higher level.
> >
> > PIPES_PER_STAGE, excuse me.
>
> Do you mean to keep PIPES_PER_STAGE and do not introduce PIPES_PER_LM_PAI=
R,
> or use both? Looks like they are equal in hardware nature. A stage
> structure serves
> a mixer pair with 2 pipes. We can use PIPES_PER_LM_PAIR and add comment t=
o
>  indicate it, thus avoid defining too many macro.

Yes, don't introduce PIPES_PER_LM_PAIR and just add STAGES_PER_PLANE.

>
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
