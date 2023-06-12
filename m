Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377572BA74
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 10:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9216510E1BD;
	Mon, 12 Jun 2023 08:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AF210E1CF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:27:16 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-394c7ba4cb5so1355115b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 01:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686558435; x=1689150435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xikwqy7ib7Y/mLLKEHOpPpi9POvMQl+h0IGLdxi4N9U=;
 b=KsyMH9/MoeCg+v8cg6r8OjYR61AIwAKyhvUrcMuYAffmyRLxCgH+w48FsbrSj1aK0l
 qcjriEynL48YMZIAkIxC2R663TrHTr2BbNi73r6EtgWeWrY+cpy+vT7UtC4PhiB07CNn
 whMjA65vORVPQ2W7IUkKN7rCyNRpBI4JjcfEMz/nqW66B45LAwW5S6ylNIh+SYMTTli6
 OYjEybFkAkjG6CY664be8UcKlLB3KLTBr7xbZl1zXFOylyqCzg375pvX35dhQyXiPzrk
 MU4VlYXJD6FpZ+OyPupaHUtyMqeGgJ7MwW7ssHW0TDW1II13qfr8KMSMjb3st+QtOHFN
 Lm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686558435; x=1689150435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xikwqy7ib7Y/mLLKEHOpPpi9POvMQl+h0IGLdxi4N9U=;
 b=kzEj+YFjXvchkgVcswEZ3kv3nagZvkb9Bl9ezAQfeZqS3pX3cyGvuMeX5aHViTiR80
 cU8svA8sC6uCnM7rjalNeiZdgd86uwpVO9wGetW+hS29u1GRzvENUP272Foi86yeO5sL
 JnfM9FML92LsEiodEJtLuJXw11QWHbpXuTxY+5cTZ8eG95RoG7AciCOXz2KVFPz5dPXv
 gJtFPoV1XJcrXgTzTyG7Gs98Y78k4BEp0P6uOrxN0/qHl0KR1uD7svs4hVg2i/2FP2Jd
 Z1SF6FrNUKv0/uys8/YHOvhginkn9MzWWUx+LNwvHMIoW6tVAnHPfSZthbRpceOry3jM
 pszw==
X-Gm-Message-State: AC+VfDx0HTfAVLKTCudpUaQsYcdOY2V88q9D6t0/ZmRZKKpobu7+9fqg
 Ya6zIlaAJxbJhordpO4OLK8wgU02ThiTMWVfXGs=
X-Google-Smtp-Source: ACHHUZ5PeWjNQYGhP+GgnE/uYa/TsyjNfpKhY52fPwatib+iyfRzatSAMiiqZ+nFktQ+zaynY7gy+K1FPifNbpu1nJw=
X-Received: by 2002:a05:6808:1cf:b0:398:560c:a4c5 with SMTP id
 x15-20020a05680801cf00b00398560ca4c5mr3611988oic.55.1686558435218; Mon, 12
 Jun 2023 01:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230612075530.681869-1-victor.liu@nxp.com>
 <20230612080400.GA1212744@ravnborg.org>
In-Reply-To: <20230612080400.GA1212744@ravnborg.org>
From: Ying Liu <gnuiyl@gmail.com>
Date: Mon, 12 Jun 2023 16:27:03 +0800
Message-ID: <CAOcKUNXqMA7YfgY=gjPs477eLUcTktGxZUqShyDMJ7Xk1nn3MA@mail.gmail.com>
Subject: Re: [PATCH] drm/mxsfb: Disable overlay plane in
 mxsfb_plane_overlay_atomic_disable()
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: marex@denx.de, Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 4:04=E2=80=AFPM Sam Ravnborg <sam@ravnborg.org> wro=
te:
>
> Hi Liu Ying.

Hi Sam,

>
> On Mon, Jun 12, 2023 at 03:55:30PM +0800, Liu Ying wrote:
> > When disabling overlay plane in mxsfb_plane_overlay_atomic_update(),
> > overlay plane's framebuffer pointer is NULL.  So, dereferencing it woul=
d
> > cause a kernel Oops(NULL pointer dereferencing).  Fix the issue by
> > disabling overlay plane in mxsfb_plane_overlay_atomic_disable() instead=
.
>
> Reading the above I had expected that some code was dropped from
> mxsfb_plane_overlay_atomic_update().

Yes, the offending commit cb285a5348e7 dropped mxsfb_get_fb_paddr()
which contains an important !fb check to avoid the NULL pointer
dereferencing.

> I do not know the driver code, but was confused so decided to give
> feedback.

drm_fb_{cma, dma}_get_gem_addr() called by
mxsfb_plane_primary_atomic_update() don't do !fb check but directly
dereference fb.  That's why the NULL pointer dereferencing issue
happens.

With this patch, mxsfb_plane_overlay_atomic_disable() is used
to disable overlay plane, not mxsfb_plane_primary_atomic_update().
Please see funcs->atomic_{disable, update}  in
drm_atomic_helper_commit_planes().

Regards,
Liu Ying

>
>         Sam
>
> >
> > Fixes: cb285a5348e7 ("drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm=
_fb_cma_get_gem_addr()")
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/=
mxsfb_kms.c
> > index 3bcc9c0f2019..7ed2516b6de0 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > @@ -611,6 +611,14 @@ static void mxsfb_plane_overlay_atomic_update(stru=
ct drm_plane *plane,
> >       writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
> >  }
> >
> > +static void mxsfb_plane_overlay_atomic_disable(struct drm_plane *plane=
,
> > +                                            struct drm_atomic_state *s=
tate)
> > +{
> > +     struct mxsfb_drm_private *mxsfb =3D to_mxsfb_drm_private(plane->d=
ev);
> > +
> > +     writel(0, mxsfb->base + LCDC_AS_CTRL);
> > +}
> > +
> >  static bool mxsfb_format_mod_supported(struct drm_plane *plane,
> >                                      uint32_t format,
> >                                      uint64_t modifier)
> > @@ -626,6 +634,7 @@ static const struct drm_plane_helper_funcs mxsfb_pl=
ane_primary_helper_funcs =3D {
> >  static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_=
funcs =3D {
> >       .atomic_check =3D mxsfb_plane_atomic_check,
> >       .atomic_update =3D mxsfb_plane_overlay_atomic_update,
> > +     .atomic_disable =3D mxsfb_plane_overlay_atomic_disable,
> >  };
> >
> >  static const struct drm_plane_funcs mxsfb_plane_funcs =3D {
> > --
> > 2.37.1
