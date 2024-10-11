Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99635999D9B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6110EA5E;
	Fri, 11 Oct 2024 07:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MKlh8YFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37DA10EA5E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:13:18 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6de14e0f050so14714707b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728630798; x=1729235598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVy3cXzl86sH2JLHgiFtJxWYGEOPC7pnAO5jIndLRl4=;
 b=MKlh8YFHILPL24/5M6wnhif/Z0dgo8wTQgMf5NTEr5NHVlD2zfNfk/Is5YzSUZhJ4V
 RGSTPrEqO5D8SyodDpfvJLU93Kycxqvdi99adHpMpUjL2sHpo+HlcXmik2m7jAk5wHqv
 sZvB1cMd0GlcggBmhYAJvLApced6c2YSf0E7ZNp+O2joCPuHUUIHD5KjV3mDmLHObDeq
 bgcfi8/dlwNbSSwxVSVW8SjAJQxaIsks4kcO9D+iPiwErBDP6qKjYKl7iVw4HqMPEkck
 oKQhS8cKtpS8uqJm1K28tc/Dd6ACJLn34NNE3Ql2viatZxG1971F6aFMyicxSLWmwbjN
 fFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728630798; x=1729235598;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVy3cXzl86sH2JLHgiFtJxWYGEOPC7pnAO5jIndLRl4=;
 b=pNl5DHOoLg91K0gxHN0r+7D5QACcjXd77GyZTNS+rNFGp3m1pe5KcO2AR4mE8ii6Ac
 yZUTRDzeJ3AkRw8Pb1bwK+hwbWlBkmsjCgMRsg/RbxgBZl2DFD3BVR8FnANN1IH40FEg
 q54HvR8I4CJZ9pYSpgXvT09d2brL2lOTL5ICkb1XxGwkvsvsQ1KA765f81hhlsNQ51et
 ZKzGknSUX3sE4OaPnHpbBny6JQWkxNz5wij/nQEXINpc3CF5fr01o+XIIoange6SLpSC
 yodPVMmalBWP+G+gFzNhsRs1QVpuUFWf0vb9Y//J4W0mHcocvs1u9PEKx9t/GvH6A4WA
 uWhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI2fKffntkWzUGo/YULTIJLXiE4z9bqwWtDRV8HgUWIm/6JpUVQUtjBYIOLzw4jQlFHdW+5Txhhc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIE72vWRfLLu7eGOTXGJE7t/W4rk9Gh5YJ/Ms/Mu0hJIOuPrNf
 jPRS8a4rfMHWZfC7nU+nL5KjYTns1DOrom7GyE2QJQ4ZLsW2jvmJvomBuoO5evSEsWAd7D7SGBX
 kbt1n8J3laNHU2SivQFTdueea1C47UE9EDJBbeA==
X-Google-Smtp-Source: AGHT+IGDBtidaBjCA+V6TUtDSxl4XAawtegW2WS9EFKGFvRhSXTvKYz5awzj9XJntrNJqGu2AzyUvSFjTEPgOfOXMps=
X-Received: by 2002:a05:690c:6085:b0:6e3:15ad:a560 with SMTP id
 00721157ae682-6e3479b858amr12310937b3.12.1728630797790; Fri, 11 Oct 2024
 00:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
 <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
 <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
 <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com>
In-Reply-To: <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 10:13:07 +0300
Message-ID: <CAA8EJppMu5o7juhKUN2Y_4CRYKtaWN9G01aPU2ZfksE_tzjqCQ@mail.gmail.com>
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

On Fri, 11 Oct 2024 at 10:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:03=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, 11 Oct 2024 at 09:40, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B4=
10=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > > > > Blend pipes by set of mixer pair config. The first 2 pipes are fo=
r left
> > > > > half screen with the first set of mixer pair config. And the late=
r 2 pipes
> > > > > are for right in quad pipe case.
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 +++++++++++++++=
+++-----------
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > >  2 files changed, 25 insertions(+), 14 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index 43d9817cd858f..66f745399a602 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struc=
t drm_crtc *crtc,
> > > > >       const struct msm_format *format;
> > > > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > > > >
> > > > > -     uint32_t lm_idx, i;
> > > > > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> > > > >       bool bg_alpha_enable =3D false;
> > > > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > > > >
> > > > > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(str=
uct drm_crtc *crtc,
> > > > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->=
alpha_enable)
> > > > >                       bg_alpha_enable =3D true;
> > > > >
> > > > > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > > -                     if (!pstate->pipe[i].sspp)
> > > > > -                             continue;
> > > > > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_ac=
tive);
> > > > > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > > > -                                                mixer, cstate->n=
um_mixers,
> > > > > -                                                pstate->stage,
> > > > > -                                                format, fb ? fb-=
>modifier : 0,
> > > > > -                                                &pstate->pipe[i]=
, i, stage_cfg);
> > > > > +             /* loop pipe per mixer pair */
> > > > > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2; =
lm_pair++) {
> > > > > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > > +                             pipe_idx =3D i + lm_pair * PIPES_PE=
R_LM_PAIR;
> > > > > +                             if (!pstate->pipe[pipe_idx].sspp)
> > > > > +                                     continue;
> > > > > +                             set_bit(pstate->pipe[pipe_idx].sspp=
->idx, fetch_active);
> > > > > +                             _dpu_crtc_blend_setup_pipe(crtc, pl=
ane,
> > > > > +                                                        mixer, c=
state->num_mixers,
> > > > > +                                                        pstate->=
stage,
> > > > > +                                                        format, =
fb ? fb->modifier : 0,
> > > > > +                                                        &pstate-=
>pipe[pipe_idx], i,
> > > > > +                                                        &stage_c=
fg[lm_pair]);
> > > > > +                     }
> > > > >               }
> > > > >
> > > > >               /* blend config update */
> > > > > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_=
crtc *crtc)
> > > > >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> > > > >       struct dpu_hw_ctl *ctl;
> > > > >       struct dpu_hw_mixer *lm;
> > > > > -     struct dpu_hw_stage_cfg stage_cfg;
> > > > > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
> > > >
> > > > After seeing this code, can we define STAGES_PER_PLANE (and
> > > > also keep PLANES_PER_STAGE defined to 2)?
> > > >
> > > Could you elaborate it? Stages describe how many layers to be blended=
.
> > > Plane is a DRM concept that describe a buffer to be display in specif=
ic
> > > display driver. Plane is already mapped to SSPP/multi-rect in DPU dri=
ver
> > >  in blending stage level. So I am confused here.
> >
> > We have dpu_hw_stage_cfg, you are adding a second instance of it. So
> > we now have two stages per plane.
>
> So you suggest to replace LM_PAIRS_PER_PLANE with STAGES_PER_PLANE,
> right? I assume a stage is coupled with a LM pair.
>
> But for PLANES_PER_STAGE, I am still confused. A stage or a LM pair can
> involve many SSPP layers. How it related to planes? Plane is a concepts f=
rom
> higher level.

PIPES_PER_STAGE, excuse me.

--=20
With best wishes
Dmitry
