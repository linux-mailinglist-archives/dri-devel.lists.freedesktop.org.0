Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEF969757
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72910E397;
	Tue,  3 Sep 2024 08:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZZqgrPJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F97C10E397
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:39:04 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6d9f65f9e3eso11771287b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725352743; x=1725957543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SM1WY9R0jnBXvCH2B20Ux18/9VPyZZGXYMi6xyrsvoY=;
 b=ZZqgrPJgFHzF23w+IQ2PkeopuV+fEn3jwS6OLEEPXeDjHAEKY9x4W6vxxwF3Tiz6if
 imo3phkoO7tAOyB/CWhrXsekq3Qdpl28IpCIx6h5ym6V+PnyTq+I5Fo5ORD0wVcJieFl
 c4z8ZqEOv8Ze0IcLwhFZjC7pyMApWcp+zqylhvM8f1ZaJ2Y74Ie+FTXHzPQpiDyxTBtc
 muHwrkL1SQmmh8UrwMoK2M36U3P210VoOxy0OteJtKuEfFpVHaaq3n/j/NU7XhE1c6Kf
 loFI6n/D6Jn/38vGmDCaR1+MTD8C07wbK0JrZ7PE4Gii6w1UqnQgWG2Plhl+AG+75jOY
 LQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725352743; x=1725957543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SM1WY9R0jnBXvCH2B20Ux18/9VPyZZGXYMi6xyrsvoY=;
 b=UzCtXZF2yS6XB2JVks3+QxSBXQ//hLMJq/1xl7vEKJBUinCch33xB5OouabLzaARLe
 DXVv9C7Uq8QYgEevDMnArkrpvkfsYWh6Jp9cn+F+i5A6ooGHK0LZu0Mr+NZHHMw6u4eo
 BZj9v8/wQnUUsF0AoxgN3HCCpIbEq4+u+0jPzz5Grt4ZPG2fW9Dy/7OZetgIbpTnD06h
 6y2Jt+NWwxQIiV6Z/jxLLShykAKr0o2NZbUqR9w5Vpa5kvA0YaLi9Zhp7JuHYYYf00Cd
 g8G3fw6UQNtaGPq23G0nwTQf+RP7RBlhumX+fN4G4t2u4rBhCxK6s+6uNGlR5eMW+Lgl
 JGww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8sjLWRziUNvO2Dm1OYBxXMZZiwZluMz4Xw/Bbcz4cTAgzcb8DUENOeMs7M+3QBQiZ4gM8SeZleZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoUfN+LzADfNwaVCVFVDJBo9JS28rB14leEW7V+p/la6A2gdU0
 b445n4iNG7rc876kLNAxwH1/aoWf7wbZB5JITYsZa37r7ah0bWSvGPAnw77AEpzfoIVQcwO8+TR
 3ty31I836vUSFM+BDG68pfsg/koqGQ5PD62NSsw==
X-Google-Smtp-Source: AGHT+IFbM1gU4uS9xIx6y43JcKI8YAURVYh6pDj9pYXO/pSHTCFGSGpn1z9v/8HVe+Fc4cpzOy4crENudRNUXfcTqTk=
X-Received: by 2002:a05:690c:ed6:b0:65f:77c3:63a0 with SMTP id
 00721157ae682-6d40dd7035amr137045667b3.7.1725352743184; Tue, 03 Sep 2024
 01:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
 <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com>
 <CABymUCMCjYfXBOqXcLGZvH6CxU7Z_Qq1kKioZGC8PCORjtJM8Q@mail.gmail.com>
In-Reply-To: <CABymUCMCjYfXBOqXcLGZvH6CxU7Z_Qq1kKioZGC8PCORjtJM8Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 11:38:52 +0300
Message-ID: <CAA8EJpr1YxwFE5k3F3wjP2Gtf9H7ve7751OwJp3dVNKYiGsnZA@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
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

On Tue, 3 Sept 2024 at 10:48, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:10=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Do not assume DSC number as 2. Because there are 4 DSC in
> > > quad pipe case.
> >
> > Please expand the commit message. You prefer brevity, but your
> > comments lack clarifications.
>
> Is below message OK?
>
> Current DSC number is fixed to 2 for any DSC usage case. While there are
> more usage case that involve different number of DSC engine, such 4 in
> quad-pipe case with bonded-DSI scenario. So retrieve the real number with
> this change.

Please rewrite the last sentence. See
Documentation/process/submitting-patches.rst "Describe your changes".

>
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 6bdd9c21ff3ed..05b203be2a9bc 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder=
 *drm_enc)
> > >                 if (dpu_enc->phys_encs[i])
> > >                         intf_count++;
> > >
> > > -       /* See dpu_encoder_get_topology, we only support 2:2:1 topolo=
gy */
> > > +       /* DSC and mixer are mapped 1:1, so reuse the mixer number */
> >
> > Why? DSCmerge is a valid topology even if it is not supported yet.
>
> DSC merge is already supported in 2:2:1 topology without this patch
> set. This change
> is to get real DSC number in 4:4:2 topology, so that DSC merge can be
> enabled for the
> case.

Yep, 3DMerge, not DSC Merge. Basically the comment about 1:1 is
incorrect. See sde_rm.h

Also it's "number of mixers", not "mixer number" (two different things).

>
> >
> > >         if (dpu_enc->dsc)
> > > -               num_dsc =3D 2;
> > > +               num_dsc =3D dpu_crtc_get_lm_num(drm_enc->crtc->state)=
;
> > >
> > >         return (num_dsc > 0) && (num_dsc > intf_count);
> > >  }
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
