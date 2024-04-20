Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A927F8AB92A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 05:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08C110EE56;
	Sat, 20 Apr 2024 03:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jZ5HQKxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC8610EE56
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 03:07:10 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso2701329276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 20:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713582430; x=1714187230; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AuNvB5tC5KyVnpy2mxYeoJ+5FSs7w1BA/+1YOfbE0R4=;
 b=jZ5HQKxeRUclFIZIMKy+EYFpIOddNWlCy+82/PALdJejDdfDYuNQITUN5X8OdeqDur
 TcYLkgeJ0zlT5JC/vfPQUoiHsMzk1zSMBM6RNK5Ro2tPxoe6RNLllOPeN0jafYQIE+a2
 rR0J2Wb8qaa39UEHCMlcshTcF4y+dPS5CwOSOe3avDmuxhgtTrJCrmtfyLPMmfhhD9Cv
 AQtIMltznYyhN1SLZHzuKzAzbECs12k/3tirArpIURuW4zARjWSEPlt5YoSbo3VXCntv
 HI6IOvRa0hD3xWgkZnvn0S5K6FOHKkIUQb0XOAHStTMjt9FHSTqcN6U0yBCTr6KKtyJi
 t+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713582430; x=1714187230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AuNvB5tC5KyVnpy2mxYeoJ+5FSs7w1BA/+1YOfbE0R4=;
 b=pTXxqeZoYgfTo+cQv5oQ3nKxpv/D7+CbB4qPzRZyA+rPRtK1S4kUMjhc8fZb6VLP00
 FSbUm6pRu+fSPayUOZfhDoV+0chY1FDc7e5M71i0Uru00uZ0CAyH4+L2YwC5OxuW0spy
 vK1vcONkq5UugkK5w2KB1F5asImF690/1sGFE6L82zHss8Vu/BmT6Zxfiaezw7ka77iR
 eT4B+MNah91oLBTqiHbINlEJV+3cB6SD+nrGK5WoNau58z00eTuRJ9y0VzPzWnwHbLsp
 6xtZKLAjd7nMvnI7ZBD+UYd+auf00o0zWkyKWfTZE12t4L5QA1Ajj+z2zIMDrDyYVKfQ
 jlrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPRKIAAclRrvQ199AGwrYJR2nmqh29NiGXAE8glzyjONlKe98cRUVSqJ1GIdtvNouSgLY6AaSzE7vXj/QTE6+ornF5ToEAEymyP4SabPWf
X-Gm-Message-State: AOJu0YwZgSnZsXosEiEtHBFbcmP3ZWlALnkXZF2s83A2AJi1yrv+yiU+
 QkYX60ansJrB45Oc/T9MfEnAnuzlgDRR70EEqXehhjHGAiZqSvKzewZA70S+mYjpbtsKqCAG2nJ
 qZrnmU9t+OT6kC08tgP5N3KmXiryW83d7lutuEA==
X-Google-Smtp-Source: AGHT+IH+MIRQVLV/m6V0QaT4MfHL5Lfn7YeTnxIAAE1yv4y5WDVUxLaE/vqL6ieh78YIcOnm3fe499Q3oIOI1GPnSmM=
X-Received: by 2002:a25:7410:0:b0:dcd:4878:1f9 with SMTP id
 p16-20020a257410000000b00dcd487801f9mr3770629ybc.8.1713582429923; Fri, 19 Apr
 2024 20:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-9-d0fe6bf81bf1@linaro.org>
 <7198d419-2b46-b9e6-4404-64f86b0b54bb@quicinc.com>
In-Reply-To: <7198d419-2b46-b9e6-4404-64f86b0b54bb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 06:06:58 +0300
Message-ID: <CAA8EJpp-oz4U5nT9gv0RtLLx0bR4g6WJdRu2Vz8tPKsZdpn-Tw@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/msm/dpu: sync mode_config limits to the FB limits
 in dpu_plane.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 20 Apr 2024 at 06:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> > Lift mode_config limits set by the DPU driver to the actual FB limits as
> > handled by the dpu_plane.c.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 9 ++-------
> >   1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 7257ac4020d8..e7dda9eca466 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1136,13 +1136,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >       dev->mode_config.min_width = 0;
> >       dev->mode_config.min_height = 0;
> >
> > -     /*
> > -      * max crtc width is equal to the max mixer width * 2 and max height is
> > -      * is 4K
> > -      */
> > -     dev->mode_config.max_width =
> > -                     dpu_kms->catalog->caps->max_mixer_width * 2;
> > -     dev->mode_config.max_height = 4096;
> > +     dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
> > +     dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
> >
>
> Can you please explain a little more about why the previous limits did
> not work in the multi-monitor case?
>
> We support at the most using 2 LMs per display today. Quad pipe support
> is not there yet. So by bounding to 2 * mixer_width should have been
> same as rejecting the mixer width in atomic_check.

This is the framebuffer limit, not a CRTC size limit.

>
> >       dev->max_vblank_count = 0xffffffff;
> >       /* Disable vblank irqs aggressively for power-saving */
> >



-- 
With best wishes
Dmitry
