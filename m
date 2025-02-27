Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A803CA4730D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 03:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4DC10EA15;
	Thu, 27 Feb 2025 02:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m8j1/lhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4A410EA21
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 02:37:18 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6f77b9e0a34so3762307b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623837; x=1741228637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2/JikIOXuq+9YZgvX/I0sOxCDWRqOTZNtQmLEPFnPo=;
 b=m8j1/lhNfAAcG8bXP5ckqnd9RBBi2PFlkX3VJ/DhasG+/MhuFrC1Bmnn9RPpOrTyPO
 TBCPhPB20l7kepZTGL1PgUq77eKPj6noTS0PLPvsuQwTcxaChmgumpE9wtEUgPZQdAIa
 w2yhDh8yRJgM675QW9RmWIF/sJyJE5+2QSJbZG4yZwHM6solXbdkmTUaVmUgxJ57Fo9H
 T0lo15xbLAEpoKDq52pCOmichuVVDOpw4U6NL/YfPrnJIPyloRqsMlNCJOygL+oH5sue
 iiF44+WxDpVRLafm+DO8mbNs7qIIJHQUygRuqkUaRUWKaJpF25V88WU3DqY06Da1WQQv
 5ANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623837; x=1741228637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2/JikIOXuq+9YZgvX/I0sOxCDWRqOTZNtQmLEPFnPo=;
 b=lDovt//EXbmzaR93fmLK1eSMugu3pRXIOH7b7ZRfyAxDRl/JeZbKRsFfmoGHbVE6lz
 iS/jKCIZ6C/2cjARvKMBqJXUJ0/XcJo+cuRcaSXBURM7d2BPdomMKuLvUZixe8Bl4SIH
 zrvjwDzAug1H2+IpOUwM69IILb9/D4lcYDY4LMaS2x8M9eJX7xx/hArsPP/ll5sRq2Nd
 b1ED/s3slAf4a404b335VwR0TzMIWOlksdLt29u3C7nxWzF50WaHHl5+CKkqRlS1sldy
 4NGHVRPFTtDAsCqXqVtYDKYA9okR+Socvca0eTv/0U1F3FA5DzDhPt65kF0y+IXC98rt
 3e8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+/IB8e8ArFsFwQ8q6dK8xy1sWm2sR7JWhkw8xmO3PIDMaepd7N7xx9mFnNaN4ijSxv+b4zHvncgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd+chZmd/+XDjKPB1Ga9RHtyozUEn3TF9A/40upX1o98f06Ny3
 fu8zj/0BAXYb/xYxJOUOUstZffD7pVsQRVixbvas1RzSKEe3WeVkiGkaODaV+c/KeX/rrZHwQFK
 be+/YudA3QyBw7A49nnNgMwQGyw+6W2zTF8VSQw==
X-Gm-Gg: ASbGncuztdvtC95ChYI6o2LamsEPf+3822Hm3Mlt0YEuXoe7qBkZwV9WRkr6cyVsI04
 eQx7ChZ0BsTL8xGH7uLgIAiCvLcSgv2t7i35ytNhQ5EaxZkII2TlRqOtpVgtK/ixHNSixCVzlFn
 cDPh9i06iUtjRx
X-Google-Smtp-Source: AGHT+IGSw0gtdKcK4e/gjlWOJp54+6uLHAkVBNTZI2SEuatfi8tmEUqUfZLol5dS7eJGj3x1CROAqXjTXvG9Xlr25R0=
X-Received: by 2002:a05:690c:4512:b0:6f9:ac35:4483 with SMTP id
 00721157ae682-6fd2207a924mr52773417b3.25.1740623837083; Wed, 26 Feb 2025
 18:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
 <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-11-8d5f5f426eb2@linaro.org>
 <f7a1a1ef-bab7-4024-bfca-a9fa33f189b5@quicinc.com>
In-Reply-To: <f7a1a1ef-bab7-4024-bfca-a9fa33f189b5@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 27 Feb 2025 10:37:06 +0800
X-Gm-Features: AQ5f1JpajceI_JjtWnScexhP25AZZx5gURBP9Id9s4kjX02P38LidJgsE8Muoks
Message-ID: <CABymUCNgwWf8cvNB0thWP3AmHYK5WDv9AwyhhE1q5X7sYCArsA@mail.gmail.com>
Subject: Re: [PATCH v7 11/15] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B42=E6=9C=882=
7=E6=97=A5=E5=91=A8=E5=9B=9B 09:38=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2/26/2025 4:31 AM, Jun Nie wrote:
> > The stage contains configuration for a mixer pair. Currently the plane
> > supports just one stage and 2 pipes. Quad-pipe support will require
> > handling 2 stages and 4 pipes at the same time. In preparation for that
> > add a separate define, PIPES_PER_PLANE, to denote number of pipes that
> > can be used by the plane.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 14 +++++++-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
> >   4 files changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 193818b02197d0737c86de7765d98732fa914e8e..81474823e6799132db71c97=
12046d359e3535d90 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -463,7 +463,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_=
crtc *crtc,
> >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->alpha_=
enable)
> >                       bg_alpha_enable =3D true;
> >
> > -             for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> > +             for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> >                       if (!pstate->pipe[i].sspp)
> >                               continue;
> >                       set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index ba7bb05efe9b8cac01a908e53121117e130f91ec..5f010d36672cc6440c69779=
908b315aab285eaf0 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -34,6 +34,7 @@
> >   #define DPU_MAX_PLANES                      4
> >   #endif
> >
> > +#define PIPES_PER_PLANE                      2
> >   #define PIPES_PER_STAGE                     2
> >   #ifndef DPU_MAX_DE_CURVES
> >   #define DPU_MAX_DE_CURVES           3
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index ef44af5ab681c8f526333fa92531a2225983aa09..d67f2ad20b4754ca4bcb759=
a65a39628b7236b0f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1078,7 +1078,7 @@ static int dpu_plane_virtual_atomic_check(struct =
drm_plane *plane,
> >                * resources are freed by dpu_crtc_assign_plane_resources=
(),
> >                * but clean them here.
> >                */
> > -             for (i =3D 0; i < PIPES_PER_STAGE; i++)
> > +             for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >                       pstate->pipe[i].sspp =3D NULL;
> >
> >               return 0;
> > @@ -1129,7 +1129,7 @@ static int dpu_plane_virtual_assign_resources(str=
uct drm_crtc *crtc,
> >       pipe_cfg =3D &pstate->pipe_cfg[0];
> >       r_pipe_cfg =3D &pstate->pipe_cfg[1];
> >
> > -     for (i =3D 0; i < PIPES_PER_STAGE; i++)
> > +     for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >               pstate->pipe[i].sspp =3D NULL;
> >
> >       if (!plane_state->fb)
> > @@ -1241,7 +1241,7 @@ void dpu_plane_flush(struct drm_plane *plane)
> >               /* force 100% alpha */
> >               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> >       else {
> > -             for (i =3D 0; i < PIPES_PER_STAGE; i++)
> > +             for (i =3D 0; i < PIPES_PER_PLANE; i++)
>
> Hi Jun,
>
> Is there a reason why only this case was changed to PIPES_PER_PLANE but
> _dpu_plane_color_fill() only loops over PIPES_PER_STAGE?
>
> Similarly, I see that dpu_plane_danger_signal_ctrl() also only loops
> over PIPES_PER_STAGE.
>
> Thanks,
>
> Jessica Zhang
>
It is missed and should be converted to PIPES_PER_PLANE in
_dpu_plane_color_fill.
Thanks for pointing this out!

Regards,
Jun
