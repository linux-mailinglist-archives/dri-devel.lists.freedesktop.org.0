Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374D3C9AD8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CDC6E5A3;
	Thu, 15 Jul 2021 08:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5CB6E5A3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:48:17 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id p67so5753588oig.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DkcvonWLnhMMqKa/y2nSULzW4DKFzRwKecGJuhH/crI=;
 b=YUWWQj0Z5TCn7OLwLZ4IjryuzLXQ4Umv78OZZCTkL2lIRJuPt9h+pKNf5BnHt2NwzB
 hAu2+vUsRNwVdFUePtzxP+AecVoxFUO7pNqdbJMNaTPkKVq11pLF3e8Pa73TaJ90q0FO
 0uRa+DdJqW9PyF99MBbW+Bt/t8JgGfFVI6IXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DkcvonWLnhMMqKa/y2nSULzW4DKFzRwKecGJuhH/crI=;
 b=fvxSAD/2eNxu/klWyJpJbq6sBrtV/X5TymbOU/kyzGpmRZlwraiacjigt/xxHMO/3w
 P3eOAZt+8gLKjgvKVzNIE+dCK+1jMy2lHqu13IaBuhfpvGTp7bnOgu73Y/G1vNl5xDIV
 QyxmP3hwL/l3Epvss6YfLJvqIeAU6cp5d9WGd5/ImHfPp9HDlndBoBc1Z637zXc+Zc/o
 RKxqTk5fXvmEQFEurgubczsuWW/wCN6ngxVx6lQ+A4ewi6mqglxsWRSp66nBn46KfOD4
 qXGQOexmQ8S8XFqISQuMBNFGIk0BUMiXW/TD0ZDt0dHu19HpBFwUeppRhA7InzFRMXoO
 FZlA==
X-Gm-Message-State: AOAM532WKV1uqrD2ES26bw2fL4Hu2lKeD1kprS71F0i10eJFzGLK96NN
 OzEKWx99ul/0RFDpahspqbpRJFpmtiKKYm5c+lFbvw==
X-Google-Smtp-Source: ABdhPJwtCEFUxVjG4dJGgcyOUYmbQ2xc2m4aWQAQh1HhS9aWJkl61mTu4MVdwN2fYutjMniiYHnDa+RtwVO7RhGwROo=
X-Received: by 2002:aca:3085:: with SMTP id w127mr6913492oiw.101.1626338897093; 
 Thu, 15 Jul 2021 01:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210706073125.7689-1-tzimmermann@suse.de>
 <695f4a61-ef43-c08d-41d2-992059791cb8@suse.de>
In-Reply-To: <695f4a61-ef43-c08d-41d2-992059791cb8@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Jul 2021 10:48:06 +0200
Message-ID: <CAKMK7uHxxgRoN6UPUkYxVxCVjSfo8wxAUUY0yP3cGzcVRdHB8g@mail.gmail.com>
Subject: Re: [PATCH] drm/omapdrm: Remove outdated comment
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomba@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 10:13 AM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> ping for review
>
> Am 06.07.21 um 09:31 schrieb Thomas Zimmermann:
> > The comment refers to drm_irq_install() et al, which are not used by
> > omapdrm. The functions are part of the DRM IRQ midlayer and shouldn't
> > be used any longer. Remove the comment.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> > ---
> >   drivers/gpu/drm/omapdrm/omap_irq.c | 7 -------
> >   1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapd=
rm/omap_irq.c
> > index bb6e3fc18204..4aca14dab927 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_irq.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_irq.c
> > @@ -253,13 +253,6 @@ static const u32 omap_underflow_irqs[] =3D {
> >       [OMAP_DSS_VIDEO3] =3D DISPC_IRQ_VID3_FIFO_UNDERFLOW,
> >   };
> >
> > -/*
> > - * We need a special version, instead of just using drm_irq_install(),
> > - * because we need to register the irq via omapdss.  Once omapdss and
> > - * omapdrm are merged together we can assign the dispc hwmod data to
> > - * ourselves and drop these and just use drm_irq_{install,uninstall}()
> > - */
> > -
> >   int omap_drm_irq_install(struct drm_device *dev)
> >   {
> >       struct omap_drm_private *priv =3D dev->dev_private;
> > --
> > 2.32.0
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
