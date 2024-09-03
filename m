Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82177969600
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FA110E41F;
	Tue,  3 Sep 2024 07:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xVpM6oyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF36C10E41F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:48:49 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-533461323cdso6279703e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725349728; x=1725954528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Sv5UiL21b/b3TY87F39nvEWfHp31hMXSNIqU/zuTOg=;
 b=xVpM6oyJwdjczMmBWI5uh2FTzvn2a6SJwqi2q8vYqYNDp1yJHWKhHp3ZAeKyiwid11
 wiQc418iBO++CxG7EXJTAwH2JJ1EFt3u3UQy8c0eO8nmpyf7qejTjv9D7sqtm0zMZxdG
 sv630FlXygrSx2aTiqxgw36B/KFWwKRlTf3GUJ6ySfNeMzJ3wb3Yklh7dc6dZUh5pGUl
 huJhHPIKblpIjhmUzD1j7xrXGklliVZZsNcanrktuoN7pld86XFpBLvtjXV26KObppSA
 +lAjlrYreCf8gm+C5lAJJ6A3MYjIEyvaYxZ+kZDgGXl2+x5/wOIhHIYvINOAxl1vNAVm
 jILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349728; x=1725954528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Sv5UiL21b/b3TY87F39nvEWfHp31hMXSNIqU/zuTOg=;
 b=DpBVvtKPr1YKGSW8Uke5oMFxnLXkioy6HHo+cNbFhHFLNPHZEDTG2lEjp7HAWR9iFo
 PHp3HCU3G7tqrTTJlfHNHvkrOXXl9NvQOfS2urmmzQbhE9U1EGmTvu8fk5bOkyghbWmK
 ugOZvtCCSslOhjyygwgevcezc8CwPkNWttY3Rv7wxLHZjKKL5vywq65D61f4uICy7pyk
 QwXSAhnrvhnUXcJeaRV9JmTXz3LlLrsuhjFBjOtdh3jH2bamssr0tw38iY2yvRx3Xg9q
 5/B5tDSwFoUtNujcMNCwZ6C8v9v4vgmiJ5z2LtAZ5llhmubb1InLshSqKDindSf8/QUk
 qkew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn5tEBVwcLbYXGbmQJ8gEPVc1m7DW+lZ+Os+jh366Kf9QdAgs3HhYbQb271pWYFY5GGfTx2EvzSkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhpdOQZ+x7TalwCzV8x0FDQVKQy95pjip4/k4ONbo1nGapE4EY
 w6uAoQ/AemQjhFl+F8bdYV+Wt2YcXODcTCYfh1Z/GJ6RrnVfrSSrTLG2mwWzgyJUlVxTW7KOFRm
 0a+r9QFM4PHeGJ7Zo5xTPsLc3Z7ze6VvGft133w==
X-Google-Smtp-Source: AGHT+IFb2cMkBKbVeiCZ5IYK8mCct3VX/awajZsJGd8T3xn5cm3YhWirCQaajtw1ZZucaT8Vf7utkyeAzyWgGqbZRv8=
X-Received: by 2002:a05:6512:1282:b0:533:d3e:16fe with SMTP id
 2adb3069b0e04-53546b69245mr7439461e87.38.1725349727618; Tue, 03 Sep 2024
 00:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
 <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com>
In-Reply-To: <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:48:36 +0800
Message-ID: <CABymUCMCjYfXBOqXcLGZvH6CxU7Z_Qq1kKioZGC8PCORjtJM8Q@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Do not assume DSC number as 2. Because there are 4 DSC in
> > quad pipe case.
>
> Please expand the commit message. You prefer brevity, but your
> comments lack clarifications.

Is below message OK?

Current DSC number is fixed to 2 for any DSC usage case. While there are
more usage case that involve different number of DSC engine, such 4 in
quad-pipe case with bonded-DSI scenario. So retrieve the real number with
this change.

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 6bdd9c21ff3ed..05b203be2a9bc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *=
drm_enc)
> >                 if (dpu_enc->phys_encs[i])
> >                         intf_count++;
> >
> > -       /* See dpu_encoder_get_topology, we only support 2:2:1 topology=
 */
> > +       /* DSC and mixer are mapped 1:1, so reuse the mixer number */
>
> Why? DSCmerge is a valid topology even if it is not supported yet.

DSC merge is already supported in 2:2:1 topology without this patch
set. This change
is to get real DSC number in 4:4:2 topology, so that DSC merge can be
enabled for the
case.

>
> >         if (dpu_enc->dsc)
> > -               num_dsc =3D 2;
> > +               num_dsc =3D dpu_crtc_get_lm_num(drm_enc->crtc->state);
> >
> >         return (num_dsc > 0) && (num_dsc > intf_count);
> >  }
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
