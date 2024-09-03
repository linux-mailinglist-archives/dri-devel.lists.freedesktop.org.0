Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C652B969864
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C593D10E36C;
	Tue,  3 Sep 2024 09:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e9Q5filZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB82010E07E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:12:10 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6c91f9fb0d7so47270967b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725354730; x=1725959530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/ta3uuFBPiaBh9lCEDL9Di51UHek4DoFtVES2+06H0=;
 b=e9Q5filZrNthsdqfW5wvaoUaCfxBROm6JT2fkFWWre7ncncePo7+NYerAb+jrTjdKT
 4GEE8+3AnL2Q31AsT9WkMTjs4NbY4gsqcM9jF+NlZAFAdI89dHokdc81crju6wQhIKah
 9Lsstt2JkZCOSds3tqSF13qp+Hq1tYuXBvuzbtJT0AFxUf/NIuSVzYmh/UBrLQ2eITq/
 hwL7tYw4FPP/tAeVRBn6iLPdg+H0e1H6M+sPseiQ3ltP8x2HilKFyrica3spklo+/Cqn
 lL7yvjks45JCKNiSetc7ZWhWpqNYUEZRufpPkD4zQgDtfzo791tJQTryHqvQj1ca++kr
 v2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725354730; x=1725959530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/ta3uuFBPiaBh9lCEDL9Di51UHek4DoFtVES2+06H0=;
 b=G+3zokIe06nBO5Q5bX9etpJ8zXaQ8nWQ1iYNfpL/ogwWAZb60e+Ty24bJeTBNpy+Ok
 CKxFyBiOuqVSkum5VdvbOPZYgIrngXtWhAACLXqzShNy8wuF73y0L97O7JNyeN/RyRRn
 oLdZp+hk5YtdC+mKaGfll97RzRviPl0jpZHRWs4+pDjEz+U03C+UofXxmoTNzMG+/dDx
 AeJoF6NeS5p4Tpg6xIgJhPWcWLrDf9A/cgxsAFpKREWBktXmxsD9I59E9SBAREfBDOEa
 r551JfCFEHQ0f8jme964xOn2dWr1CTR/1L2tQCSn0WNdcbHB/Ox/8wqgKWG+4IsFdPlZ
 VOxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfnH2ntDx/Myekijq4XChpOb9XlHBx/8yOKni0Z9VrDA4NMh1N+Blr2lKbtYrNmZ5gCrHOl/hjQG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGVU5iEvUggCZiKCvfYVljQ4TbK09uB1kaNgbAtniKyTU2kmxO
 nOs5ZaO8hPN/JpbOohL1F4WPvCugf7fC3tuW44ESLkf2gfxq0EDi8/tI32HjuRR03Rmx84R2CxO
 7I/JUa97U7juvPxiTsCtfr87X+Dhz78XxNmX2/A==
X-Google-Smtp-Source: AGHT+IEb9jQ5qw60pC+3SsofsZgMNd8KJnoJD/AFd0pFQMqyVKD5minDKNeHUibGRXpas1sBxOmrGY3L1DJDYOVo5lc=
X-Received: by 2002:a05:690c:6703:b0:6ae:528f:be36 with SMTP id
 00721157ae682-6d40dc7b873mr165283987b3.12.1725354729654; Tue, 03 Sep 2024
 02:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-18-bdb05b4b5a2e@linaro.org>
 <CAA8EJpoj6vs1JsDWgqof9Ogt-0Zq6hUpuaK42YwByDGrpUopnw@mail.gmail.com>
 <CABymUCOOWSSUnk3wdh4bKiOJb8k44_F2-ik9MeKuB1kF66576A@mail.gmail.com>
In-Reply-To: <CABymUCOOWSSUnk3wdh4bKiOJb8k44_F2-ik9MeKuB1kF66576A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 12:11:58 +0300
Message-ID: <CAA8EJppd36417E2vprowz9UJZ5C+WgPPacbY91PFoa2fjSvkXg@mail.gmail.com>
Subject: Re: [PATCH 18/21] drm/msm/dpu: blend pipes by left and right
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
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

On Tue, 3 Sept 2024 at 10:53, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:51=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:21, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Blend pipes by left and right. The first 2 pipes are for
> > > left half screen and the later 2 pipes are for right in quad
> > > pipe case.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 19 +++++++++++++++++--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  4 +++-
> > >  4 files changed, 38 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 3b3cd17976082..8fd56f8f2851f 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -574,8 +574,17 @@ static void _dpu_crtc_blend_setup(struct drm_crt=
c *crtc)
> > >                         mixer[i].mixer_op_mode,
> > >                         ctl->idx - CTL_0);
> > >
> > > -               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > > -                       &stage_cfg);
> > > +               /*
> > > +                * call dpu_hw_ctl_setup_blendstage() to blend layers=
 per stage cfg.
> > > +                * There is 4 mixers at most. The first 2 are for the=
 left half, and
> > > +                * the later 2 are for the right half.
> > > +                */
> > > +               if (cstate->num_mixers =3D=3D 4 && i >=3D 2)
> > > +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm=
->idx,
> > > +                               &stage_cfg, true);
> > > +               else
> > > +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm=
->idx,
> > > +                               &stage_cfg, false);
> > >         }
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 76793201b984e..5d927f23e35b2 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -2049,9 +2049,13 @@ static void dpu_encoder_helper_reset_mixers(st=
ruct dpu_encoder_phys *phys_enc)
> > >                 if (phys_enc->hw_ctl->ops.update_pending_flush_mixer)
> > >                         phys_enc->hw_ctl->ops.update_pending_flush_mi=
xer(ctl, hw_mixer[i]->idx);
> > >
> > > -               /* clear all blendstages */
> > > -               if (phys_enc->hw_ctl->ops.setup_blendstage)
> > > -                       phys_enc->hw_ctl->ops.setup_blendstage(ctl, h=
w_mixer[i]->idx, NULL);
> > > +               /* clear all blendstages in both left and right */
> > > +               if (phys_enc->hw_ctl->ops.setup_blendstage) {
> > > +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> > > +                               hw_mixer[i]->idx, NULL, false);
> > > +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> > > +                               hw_mixer[i]->idx, NULL, true);
> > > +               }
> > >         }
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > index 602dfad127c2a..2072d18520326 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > @@ -478,12 +478,13 @@ static const struct ctl_blend_config ctl_blend_=
config[][2] =3D {
> > >  };
> > >
> > >  static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> > > -       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
> > > +       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg, bool righ=
t)
> > >  {
> > >         struct dpu_hw_blk_reg_map *c =3D &ctx->hw;
> > >         u32 mix, ext, mix_ext;
> > >         u32 mixercfg[5] =3D { 0 };
> > >         int i, j;
> > > +       int pipe_start, pipe_end;
> > >         int stages;
> > >         int pipes_per_stage;
> > >
> > > @@ -502,13 +503,27 @@ static void dpu_hw_ctl_setup_blendstage(struct =
dpu_hw_ctl *ctx,
> > >         if (!stage_cfg)
> > >                 goto exit;
> > >
> > > +       /*
> > > +        * For quad pipe case, blend pipes in right side separately. =
Otherwise,
> > > +        * all content is on the left half by defaut (no splitting ca=
se).
> > > +        */
> > > +       if (!right) {
> >
> > I think the approach to set PIPES_PER_STAGE to 4 is incorrect. It
> > complicates the code too much. Instead please use two separate
> > instances, each one representing a single LM pair and corresponding
> > set of SW pipes. Yes, you'd have to iterate over them manually.
> > However I think it's also going to make code simpler.
>
> OK. I can explore this method.
> >
> > > +               pipe_start =3D 0;
> > > +               pipe_end =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ?=
 2 : 1;
> >
> > pipe_end =3D pipes_per_stage
> >
> > > +       } else {
> > > +               pipe_start =3D 2;
> > > +               pipe_end =3D PIPES_PER_STAGE;
> >
> > So, the right part always has 2 pipes? What if the
> > DPU_MIXER_SOURCESPLIT isn't supported?
>
> Yeah, the case is missed. It should be like this for the right half:
> pipe_start =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ? 2 : 1;
> pipe_end =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ? PIPES_PER_STAGE : 2=
;

Well, we can be better than that and use
pipe_start =3D left ? 0 : 2
pipe_end =3D pipe_start + pipes_per_stage;

>
>
> >
> >
> > > +       }
> > > +
> > > +       DRM_DEBUG_ATOMIC("blend lm %d on the %s side\n", lm - LM_0,
> > > +                        right ? "right" : "left");
> > >         for (i =3D 0; i <=3D stages; i++) {
> > >                 /* overflow to ext register if 'i + 1 > 7' */
> > >                 mix =3D (i + 1) & 0x7;
> > >                 ext =3D i >=3D 7;
> > >                 mix_ext =3D (i + 1) & 0xf;
> > >
> > > -               for (j =3D 0 ; j < pipes_per_stage; j++) {
> > > +               for (j =3D pipe_start; j < pipe_end; j++) {
> > >                         enum dpu_sspp_multirect_index rect_index =3D
> > >                                 stage_cfg->multirect_index[i][j];
> > >                         enum dpu_sspp pipe =3D stage_cfg->stage[i][j]=
;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > index 557ec9a924f81..2dac7885fc5e7 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > @@ -25,6 +25,8 @@ struct dpu_hw_ctl;
> > >  /**
> > >   * struct dpu_hw_stage_cfg - blending stage cfg
> > >   * @stage : SSPP_ID at each stage
> > > + *          The first 2 in PIPES_PER_STAGE(4) are for the first SSPP=
.
> > > + *          The 3rd/4th in PIPES_PER_STAGE(4) are for the 2nd SSPP.
> > >   * @multirect_index: index of the rectangle of SSPP.
> > >   */
> > >  struct dpu_hw_stage_cfg {
> > > @@ -243,7 +245,7 @@ struct dpu_hw_ctl_ops {
> > >          * @cfg       : blend stage configuration
> > >          */
> > >         void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
> > > -               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
> > > +               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg, bool ri=
ght);
> > >
> > >         void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
> > >                 unsigned long *fetch_active);
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
