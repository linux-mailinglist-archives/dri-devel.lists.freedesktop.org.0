Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F5969605
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6E310E420;
	Tue,  3 Sep 2024 07:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rOwR+ikS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B5710E421
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:49:38 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f50966c469so57164861fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725349776; x=1725954576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OstJSsZLDkrrd7yh8fzrQVQgwgOpUkY7Kn1i4f+Lsj8=;
 b=rOwR+ikSNKFfhIpxiw5aFOERySX0sFd6iaLwOo52lTd/x/ccpz3z6boeoPg5KP1Mvd
 xzkNLzARWzG/rnNUzA2sTC1H0RFpDZDnTuIFd1bEnbfCv9LBRnPjZrJ3VOY2dEoW9++F
 qLIoglMArq51QPEu8N0K9YtU1mO9GMQgzpYM2iDWuORebUCbGBbSROh/4B2hsFi6+xfb
 7GHmNzrvaAhVmh8QOp34SShv3vel4FSGy00XMzgvmeXHagyvKTsnOa9A7PPRNw2HINxK
 nkDIMrXLQxNDOiWLLlN4re2KywwEpKhOrbuTlLYf9LXajJZsxQEThJwhc61l67XILHZO
 cV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349776; x=1725954576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OstJSsZLDkrrd7yh8fzrQVQgwgOpUkY7Kn1i4f+Lsj8=;
 b=mSQ0P4A6y7qCZd95ekWL7gGXMil70jrKdwqNqUciSIVEKyX38txAGaVEGK7InUK5Jx
 NnBY7n6LNNPBdnIut8+edfW58hFJT14GAKWK75yeQAUrsTnW/E4N+al8ctl3FvYAIMDE
 owJNd5J1e3fB1z8KOo4W2bB9ugFi5Eb1CCvTDjDfeF+qFk7/CWPAXQnaKb0Hgg+NpeI3
 JJ6XOiLgglkxEMGurhxRS5UaF0oMBHA0qYoZ7fFbZ5LrlPvfNsT+v3nakMQdNRZcug9T
 pUNwhMZNLxKRUM8v4fdjnMCJnAan8uyLYaP6ndtpu7y6w6YYyElAcSjihFr76rHkBe6w
 PipQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Nll0jb4xZgVP8DP4jWfrT/3sG0WYgHzJbyPy++88An2hI0B1ITStyqm3bc9ebP2T21jD9EHnLjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+vGjPKywwFnruBLtKS2yJ+zz9QWurqIjX67xH+v1BxA5nx7c3
 kOrrSjBzOZ9Zrh1qGn5QbdKaWFuO2ZoNoknfNea5F0I0jWoRH8x6g08AVw4TZJOmupFvOfY23y7
 QCnikLgPZH6qY7Il49UYRaYhpwWJUxSl/eR7xbg==
X-Google-Smtp-Source: AGHT+IHZTmC8S+kG9iip3sLPfabh0C79/xWqZy7wFuhEn+n4AL7xKCJk4/ercF5tgsgzV0a8uyNtQqdEtz/mAEA2f1U=
X-Received: by 2002:a05:651c:502:b0:2f6:1424:6e70 with SMTP id
 38308e7fff4ca-2f62906faa0mr65498301fa.26.1725349776160; Tue, 03 Sep 2024
 00:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-9-bdb05b4b5a2e@linaro.org>
 <CAA8EJppAaHtwaDLQVG6f4zTmhpkpuuF0-NK9-iB7UzFcwO3hdw@mail.gmail.com>
In-Reply-To: <CAA8EJppAaHtwaDLQVG6f4zTmhpkpuuF0-NK9-iB7UzFcwO3hdw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:49:24 +0800
Message-ID: <CABymUCPdX6fdM4-qEAs5P__hauTUKQSpSeo6hrs0eZrrTi+Rzw@mail.gmail.com>
Subject: Re: [PATCH 09/21] drm/msm/dpu: request more mixer for 4K+ DSC case
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
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > request more mixer for the case that hdisplay exceeding 4096
> > and DSC enabled.
>
> This doesn't seem to match the code. And it misses the _reason_ to do it.

Right. The DSC limitation should be 2560. And the reason is to support 4:4:=
2
quad-pipe topology. Because we prefer to use 4 layer mixer for dual DSI cas=
e.
The resolution is always higher and more DSC is power optimal. That's my
understanding.

> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++++++++++++++++++++-=
---
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 05b203be2a9bc..33cfd94badaba 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -59,6 +59,7 @@
> >  #define IDLE_SHORT_TIMEOUT     1
> >
> >  #define MAX_HDISPLAY_SPLIT 1080
> > +#define MAX_HDISPLAY_DSC_SPLIT 2560
> >
> >  /* timeout in frames waiting for frame done */
> >  #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
> > @@ -588,15 +589,19 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >
> >         /* Datapath topology selection
> >          *
> > -        * Dual display
> > +        * Dual display without DSC
> >          * 2 LM, 2 INTF ( Split display using 2 interfaces)
> >          *
> > +        * Dual display with DSC
> > +        * 4 LM, 2 INTF ( Split display using 2 interfaces)
>
> This doesn't match the code
>
Yeah, just use 4:4:2 case for DSC+dualDSI case is a simpler logic. I
can skip the DSC limitation
test in next version.
