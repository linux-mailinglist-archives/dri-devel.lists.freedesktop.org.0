Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EEC1E911F
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 14:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E4489DBA;
	Sat, 30 May 2020 12:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D278E89DBA
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 12:17:10 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id u7so3036495vsp.7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BeDeUy53zw3qDJdClH5bln6ot5ga8cNAQ3K8QRGw6RE=;
 b=T8pVPk/+wtG7NWZsP+XB9OREaii7sNG1fNk7kcYuMd/7q9yKkJxO+c16mAAD1RdF8u
 5+86p4yGcVB8eP1XPhrNEVG9Pmhef0caVB1lBnkqchrWrq3HluH8a5vhoNL8QgoOF26T
 G3DtDiZXauX1cVw37JzcWSs7drNJhmJONzWCgDdl+Lt0kwgkpC6FA2Kj5t14foRaoAKT
 XqKHS788OKz6ik4sMEnNKfQ5KurueBc8VKt7ye0xXucFhbMBoCs/WQKi+hf/9jGPtRBq
 ksprMyn77h5XPP3xrnZY4rNQ9BBArbatyttLLhXz+zBC3/8LnVoLRt89p0PaLDYvgwvT
 rhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BeDeUy53zw3qDJdClH5bln6ot5ga8cNAQ3K8QRGw6RE=;
 b=uFpTN6aDlirOiF6tWpwsEkbs8zdKb9L28NzBnpja9xaFuPb2Ab6d0vqm53vbdI9t0h
 krkpStKWFZd7VOA/MHPvthwxJdTuPpJtR8QNF8TtTqSQb4A6B+04YhfuQTr4Kd0bzBhX
 y0rEnj2YHq80qAUkILmlib7RbXqx3oWfC5oxUDXEy530hYV05YUnfwtbRMheqmzsCvuY
 ZqPVcEHIP8jrvRJ4zvSWsdFtVYToxxDFjnXIMD7mFOtckbFba5Ex7fmBw/gBYijfsRjG
 SBLWv3Je01AWoDJzpHSqMdmcPBLzFwAQSBsJ7x1+rRjdOI7/qc3SJXIHkPg9Rqd9SS/6
 lgWA==
X-Gm-Message-State: AOAM531+UmCxWzeQmATaAOh+tGinG03+eykCPs7+3eHIqG+1beRUQn4f
 2VxhzCrNUTl7G3WOKCjoLed4OJUMXutWloHbVv8=
X-Google-Smtp-Source: ABdhPJwiSIaMurOEEV0TnslMPHLT7GaLIuwuI/Sb/VnuDR6oRlKZ03CImQjwnBUo/c7RvZfVuhd/S4dPQ3ceiHrcxKQ=
X-Received: by 2002:a67:71c2:: with SMTP id m185mr9269940vsc.186.1590841029880; 
 Sat, 30 May 2020 05:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200529214807.3801851-1-emil.l.velikov@gmail.com>
 <20200529214807.3801851-2-emil.l.velikov@gmail.com>
 <20200530074830.GB70485@ravnborg.org>
In-Reply-To: <20200530074830.GB70485@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sat, 30 May 2020 13:13:58 +0100
Message-ID: <CACvgo51SN9GbypNOeiCZtSux4tx3m7hNrWJX92H5d+n+kuFDdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/auth: drop unnessesary variable assignments
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 May 2020 at 08:48, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Emil.
>
> On Fri, May 29, 2020 at 10:48:07PM +0100, Emil Velikov wrote:
> > The variables are already the exact same value or will be overwritten
> > shortly afterwords. In either case there's no functional difference.
> s/afterwords/afterwards/
>
> >
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_auth.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > index db701a9e9393..5ae5623f2482 100644
> > --- a/drivers/gpu/drm/drm_auth.c
> > +++ b/drivers/gpu/drm/drm_auth.c
> > @@ -215,7 +215,7 @@ drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> >  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
> >                       struct drm_file *file_priv)
> >  {
> > -     int ret = 0;
> > +     int ret;
>
> This was the redundant asignment I mentioned in first mail - good.
> >
> >       mutex_lock(&dev->master_mutex);
> >
> > @@ -282,7 +282,6 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> >
> >       if (file_priv->master->lessor != NULL) {
> >               DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
> > -             ret = -EINVAL;
> This is wrong. ret is 0 when this code is reached, so we loose the error
> value if this code-path is triggered.
> Or I miss something??
>
A few lines above [1] - there's unconditional ret = -EINVAL. Although
the set<>drop paths are pretty asymmetric and misleading.
Let me respin the series.

-Emil

[1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_auth.c?id=6015002ece38dac85a373f041e0302781de7474b#n293
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
