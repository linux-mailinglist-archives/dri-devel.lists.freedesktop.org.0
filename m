Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F334E4952
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 23:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7205110E12D;
	Tue, 22 Mar 2022 22:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068F310E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 22:46:44 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d19so19389969pfv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 15:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y3+yW0Y/V0IdtjUi2oJO6+GLRdAvHHve31rrBFDbfNI=;
 b=NvNV9MHkzhlUu8fHHWI38xoia6dcctyi5CJ5Lu3D0irboqNPPvY47wkV/3MwbS/4zI
 3Umv0Y+CSP8+z1yA2K2sHBqj/yLEdMbgckXamhVVRdru8AsQYLRhOj38E1UFnQpqMyt0
 RSOFAailSEdsArc6+4LE2GJ20D9+Vy7ADzgSFTsS3aW4bSBUtoiPT4FvqrvPKy8UTJYg
 IMc9+WCteR9CyuZH3TsfEnzR8wwuiTEpzDCgvRD+gRwGPfygGfS91f5d/a3byT3Gvkxy
 3+JzRDyM95av2cHABglLJwQoovJs6m+0A6SSoCNavoWlZVHGpnJl2kwRzCrBCvD8pLk8
 mRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y3+yW0Y/V0IdtjUi2oJO6+GLRdAvHHve31rrBFDbfNI=;
 b=oDF5lJrmdTLMxuS3ry1g4PzPsy5boE0BYsRsZnptHX34JGZP3iKjPynieUUZBJfTLq
 +QiYqOB78l25uilM+AvIwWjCkRrqH7Fcrds8AK0Inb2vOKj0jw4v4iJGYL7wtrFufcNp
 Zx1T55wTtel62D9vgHAfez4B3qMsZRxHGAy8IyEP0u58aPyLydDYwbNVUCJxY8nWvvlU
 Ch3uPSPa+enw577ub7MzJ3TDUrqkfC+dPo03tOjaEDJmIo94wu89jqMuyBU3Dik5lv5F
 CqwJd2BaMbweLtcE/G6BCggPax1BhhRBVF4WhJYnZUcS33BY/KlnR3V8pAiLEmsK/zKY
 KtuA==
X-Gm-Message-State: AOAM532omMODzNI5Pu7/7SKY7PJ+vr47Bx9/EUrw8VPyJS80TEDeA3CH
 meXZ1DYkZONcl6rcN+0eEdI1m5OJ2kr0ACYBxwUBU7O3
X-Google-Smtp-Source: ABdhPJwQ1EhTM7T03QYZ6tcjRnMuicKVTMEVBAYKwcBT3hBvxjp9JwEdcpw9PdhXuxm0wXi7q1Z1tzAN3+0CoKVD7ck=
X-Received: by 2002:a63:e20:0:b0:385:fe08:52f9 with SMTP id
 d32-20020a630e20000000b00385fe0852f9mr2219734pgl.99.1647989203473; Tue, 22
 Mar 2022 15:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
 <20220322131742.11566-7-patrik.r.jakobsson@gmail.com>
 <66cc3cd8-e737-e032-9135-bed05db2f401@suse.de>
In-Reply-To: <66cc3cd8-e737-e032-9135-bed05db2f401@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 22 Mar 2022 23:46:32 +0100
Message-ID: <CAMeQTsa5p7iqXk0D5xjUuVm5AjRFe0ULg6KBSTwjTmdU1WeJMA@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/gma500: Add crtc prefix to vblank functions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 8:36 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 22.03.22 um 14:17 schrieb Patrik Jakobsson:
> > These functions operate on a crtc and should be prefixed properly.
> >
> > Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>
> For the whole patchset:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> If you like, please consider the few comments I had.

Thanks for the review.

>
> Best regards
> Thomas
>
>
> > ---
> >   drivers/gpu/drm/gma500/gma_display.c | 6 +++---
> >   drivers/gpu/drm/gma500/psb_irq.c     | 6 +++---
> >   drivers/gpu/drm/gma500/psb_irq.h     | 6 +++---
> >   3 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma=
500/gma_display.c
> > index 369bc1f751cb..34ec3fca09ba 100644
> > --- a/drivers/gpu/drm/gma500/gma_display.c
> > +++ b/drivers/gpu/drm/gma500/gma_display.c
> > @@ -575,9 +575,9 @@ const struct drm_crtc_funcs gma_crtc_funcs =3D {
> >       .set_config =3D gma_crtc_set_config,
> >       .destroy =3D gma_crtc_destroy,
> >       .page_flip =3D gma_crtc_page_flip,
> > -     .enable_vblank =3D gma_enable_vblank,
> > -     .disable_vblank =3D gma_disable_vblank,
> > -     .get_vblank_counter =3D gma_get_vblank_counter,
> > +     .enable_vblank =3D gma_crtc_enable_vblank,
> > +     .disable_vblank =3D gma_crtc_disable_vblank,
> > +     .get_vblank_counter =3D gma_crtc_get_vblank_counter,
> >   };
> >
> >   /*
> > diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/=
psb_irq.c
> > index 2e8ded532930..e6e6d61bbeab 100644
> > --- a/drivers/gpu/drm/gma500/psb_irq.c
> > +++ b/drivers/gpu/drm/gma500/psb_irq.c
> > @@ -371,7 +371,7 @@ void gma_irq_uninstall(struct drm_device *dev)
> >       free_irq(pdev->irq, dev);
> >   }
> >
> > -int gma_enable_vblank(struct drm_crtc *crtc)
> > +int gma_crtc_enable_vblank(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev =3D crtc->dev;
> >       unsigned int pipe =3D crtc->index;
> > @@ -404,7 +404,7 @@ int gma_enable_vblank(struct drm_crtc *crtc)
> >       return 0;
> >   }
> >
> > -void gma_disable_vblank(struct drm_crtc *crtc)
> > +void gma_crtc_disable_vblank(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev =3D crtc->dev;
> >       unsigned int pipe =3D crtc->index;
> > @@ -428,7 +428,7 @@ void gma_disable_vblank(struct drm_crtc *crtc)
> >   /* Called from drm generic code, passed a 'crtc', which
> >    * we use as a pipe index
> >    */
> > -u32 gma_get_vblank_counter(struct drm_crtc *crtc)
> > +u32 gma_crtc_get_vblank_counter(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev =3D crtc->dev;
> >       unsigned int pipe =3D crtc->index;
> > diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/=
psb_irq.h
> > index c22878914f5b..b51e395194ff 100644
> > --- a/drivers/gpu/drm/gma500/psb_irq.h
> > +++ b/drivers/gpu/drm/gma500/psb_irq.h
> > @@ -20,9 +20,9 @@ void gma_irq_postinstall(struct drm_device *dev);
> >   int  gma_irq_install(struct drm_device *dev, unsigned int irq);
> >   void gma_irq_uninstall(struct drm_device *dev);
> >
> > -int  gma_enable_vblank(struct drm_crtc *crtc);
> > -void gma_disable_vblank(struct drm_crtc *crtc);
> > -u32  gma_get_vblank_counter(struct drm_crtc *crtc);
> > +int  gma_crtc_enable_vblank(struct drm_crtc *crtc);
> > +void gma_crtc_disable_vblank(struct drm_crtc *crtc);
> > +u32  gma_crtc_get_vblank_counter(struct drm_crtc *crtc);
> >   void gma_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, =
u32 mask);
> >   void gma_disable_pipestat(struct drm_psb_private *dev_priv, int pipe,=
 u32 mask);
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
