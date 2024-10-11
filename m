Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987D999DDD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E417B10EA6C;
	Fri, 11 Oct 2024 07:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RobceiIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B0B10EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:26:31 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6db836c6bd7so16840957b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728631590; x=1729236390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KRuCN3Wszg2QXEKCcFwbTYEij+If8Oy9RBdgkJuqDs=;
 b=RobceiItT/CtyXbg8a6ygde4ul+6eQ4CUE8n+qf1OgDY0JebOwbsQIkfvWfMtR5H5Z
 sBzjnBsMz0H4tBp6NAXDXzGut9iBBbJ8Tlf0TRzJROmc4gBk+pwNb+j4jdLVr2qPeZdo
 9V/NhX6DB1gwvn+3476kLWhn7XAkoVZXzDxKqnCZK2NTjhC9lBNQUQnrnKFIK2UN/POm
 YJD19597Hmbnx2xPTZcAjUEE2Oj1HjPTbsdIMQ6Ssp1kQq8EtD1qWotrLHufJUvSTnHo
 1wTO8vTYlaanF05BRSGmV8LFB3fEThudOSITLyW/JPJZ+ytnBdV/nsG1jJ1e2CDV9k5w
 o/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728631590; x=1729236390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3KRuCN3Wszg2QXEKCcFwbTYEij+If8Oy9RBdgkJuqDs=;
 b=RgnPgqhUtqjvcLHQt39njCF4l83PxHhtnwTIldO1lA9IsFKZw9WseNPWnygGNU+8jR
 GrCwRIxGOHklh3M/2o8a4dtW29OyqQsQDTpaIFn9uPp6aRii++BXRUE0LNqldS83w25S
 P+29FWSmASXXMXGfzHuWzfjz7lk7vGBTE+Q4wJmdwwE44DF6myKwAMEhzMiVZMmir2ky
 G/jM5NCZAKT0f2Svilg31ZInk4JK9fhdFT2ZjYuwNAYuX9nJdShOwttgPlCidfK+K0gh
 4GzNw0jNzgQLE5AVGiCZBM74ULywVQ/C1fI1O9FWtdfXhyEXTjkEZ2uuXRaT2M3hYmMV
 d7Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPm18WlxXldXt3EZ0Et/CJsaCLYrNWncgaNuS2YLbsQYaYkyGklMSqA6L3iLCNtehLaPdbcq9ybDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH6QQKsibMs1wEkTWxnFeIIoAKowHe7pz6x7pgS2mpXngiMQzF
 lRpWrknJYk9AJIdPxhLLN2nNkK/LMtRE4dyapObdUcrjYUNtkOQyMC+hmsECTaxRjxE+bz0Jgn9
 j2rkvrJuH0XJxBOJ/irePNxKtoiNmDD8bfRn6iw==
X-Google-Smtp-Source: AGHT+IF9yE55X6l58J3RNnrTFZtOa9ykDPuHPCDzo0nhg8NLPI4TATmILM0MbYyzUxfj5WDMeIG3jJPO6IRzkfWrDI0=
X-Received: by 2002:a05:690c:4a91:b0:6e2:b263:105b with SMTP id
 00721157ae682-6e347c4e3c8mr8932157b3.41.1728631590675; Fri, 11 Oct 2024
 00:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-5-76d4f5d413bf@linaro.org>
 <kuvbcodnbgsgetkudbce32rajy6kg3lpxhcx6cvgm6bi7ekoki@smmnpdrwhbqn>
 <CABymUCOFV0Ze=55Ne23nKrN_4ES6cUT3_av7Q2xxtxT3Hw7ZJg@mail.gmail.com>
 <CAA8EJpqZ0X_DezzVPnWswwWoZCL8ZZJ4M-DHvUSo4qJXK6mQnQ@mail.gmail.com>
 <CABymUCMBQq2iGdqcSBhokDo6McFn6xc63zVrEe+2CNX_a1ejng@mail.gmail.com>
In-Reply-To: <CABymUCMBQq2iGdqcSBhokDo6McFn6xc63zVrEe+2CNX_a1ejng@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 10:26:19 +0300
Message-ID: <CAA8EJpqqeN3A3rfT+T9CRbhhOb_gzH7SNxTNGF9uh2jwBZrwQQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/msm/dpu: handle pipes as array
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

On Fri, 11 Oct 2024 at 10:18, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:10=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, 11 Oct 2024 at 09:49, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B4=
10=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:08=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Wed, Oct 09, 2024 at 04:50:18PM GMT, Jun Nie wrote:
> > > > > Store pipes in array with removing dedicated r_pipe. There are
> > > > > 2 pipes in a drm plane at most currently. While 4 pipes are
> > > > > needed for new usage case. This change generalize the handling
> > > > > to pipe pair and ease handling to another pipe pair later.
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  34 +++---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 ++++++++++++++++=
--------------
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h |  10 +-
> > > > >  4 files changed, 111 insertions(+), 112 deletions(-)
> > > > >

> > > > > @@ -1410,17 +1416,24 @@ static void _dpu_plane_atomic_disable(str=
uct drm_plane *plane)
> > > > >  {
> > > > >       struct drm_plane_state *state =3D plane->state;
> > > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state=
);
> > > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > > > +     struct dpu_sw_pipe *pipe;
> > > > > +     int i;
> > > > > +
> > > > > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > > > > +             pipe =3D &pstate->pipe[i];
> > > > > +             if (!pipe->sspp)
> > > > > +                     continue;
> > > > >
> > > > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > > > -                             pstate->pipe.multirect_mode);
> > > > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > > > +                                     pstate->pipe[i].multirect_m=
ode);
> > > > >
> > > > > -     if (r_pipe->sspp) {
> > > > > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > > > +             if (pipe->sspp && pipe->multirect_index =3D=3D DPU_=
SSPP_RECT_1) {
> > > >
> > > > if (i > 1)
> > >
> > > Is there any case that pipe->multirect_index =3D=3D DPU_SSPP_RECT_1 a=
nd i =3D=3D 0 ?
> >
> > You are converting the code. Please don't change the logic. Original
> > code had separate handling for r_pipe. After your conversion it should
> > be if (i =3D=3D 1) or if (i > 0), which means a typo in my review comme=
nt.
> >
> I see. You want to keep logic unchanged, with only handling the pipe in a=
rray.
> Handling to multiple pipe pairs can be added later.

Yes. Please never mix "rewrite" and "change the logic" together. It
complicates the review and is generally error-prone.

--=20
With best wishes
Dmitry
