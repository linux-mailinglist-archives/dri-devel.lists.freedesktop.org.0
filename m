Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55B5964732
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B817F10E6B2;
	Thu, 29 Aug 2024 13:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF15610E6B2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:51:21 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-69483a97848so6526727b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724939479; x=1725544279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oO+LwtIAdtwbqPzFoJJxjo3VESdONs3yqV/pQ3ireRc=;
 b=f3mCqdwWQKNsUIM1NLYv4lYPE8o44OvzDiUl0Kt9Mhz59QiXsjB8TzFFPjXwuIAfnE
 XlVBXslT81OZh/GX6uWkDulSWH9ufxk5RSq12aaS048QiLod7y3Crkhs2b6KPvHJsB2P
 9Nr7O+IGOD4DfinT+6E5H9QCBKsjAxlBTWQMfkIhdr6rcGMw3ANVLO+sCErXV19w2x1A
 86Owqp7k7lTzsp54co9F+/gLWSJ1XiuGtmJCcpsoeVEwt0LxA40G/7bdOy/H51g0VEuT
 LTiPXcmpB2KmbT8+R5OXgUisJ5h3oUzRqrElwxTaPA+DWRDKqOxIir4pgtj9v8od61Bd
 vZRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbYBN62pQgpDhcHCK7JHojnuChsS+n3L39/OrkZ2VAQENUq1KP7ICdcJ2po6pEXCj0BPUhOfVf8io=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIkdrmHWL6zT50zRAtgqsgduG1GtY/1Fu1ZG0gAwhoBvG3ejrA
 1NMf8aBXvPNy5g2l7X0J9G1g7HzqfqCb8jXK1TyHWX9O0mwZSEMaRrsnFd9K
X-Google-Smtp-Source: AGHT+IEaF5Zzly96WFyGYFefs7PyQ8FW6bjaRwXwY7MlXoJiU+6CJmd3Ls+UpCAwDTuVzfpZCthPlQ==
X-Received: by 2002:a05:690c:288a:b0:63c:416f:182d with SMTP id
 00721157ae682-6d276403004mr26978007b3.12.1724939478931; 
 Thu, 29 Aug 2024 06:51:18 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6d2d57dedb5sm2468937b3.95.2024.08.29.06.51.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 06:51:17 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e13d5cbc067so721461276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:51:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGsg6JH4UPCnkWk2NkKw+w7QEmG56iEub7EFKpN6z73sl9S9lAJ1T4VenziOgeIiRrI04YId9BFYw=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1028:b0:e16:6785:1a5b with SMTP id
 3f1490d57ef6-e1a5ab72c0emr3573138276.14.1724939477651; Thu, 29 Aug 2024
 06:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <9c6116fd-d32d-4150-b0dd-91b8e1a539f2@linux.dev>
In-Reply-To: <9c6116fd-d32d-4150-b0dd-91b8e1a539f2@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 15:51:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_Uc+ghgXNiW_yvsYdR1_wdQ9_Vskw4GBthysWUCoiXw@mail.gmail.com>
Message-ID: <CAMuHMdW_Uc+ghgXNiW_yvsYdR1_wdQ9_Vskw4GBthysWUCoiXw@mail.gmail.com>
Subject: Re: drm: renesas: shmobile: Add drm_panic support
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org
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

Hi Sui,

On Wed, May 29, 2024 at 1:31=E2=80=AFPM Sui Jingfeng <sui.jingfeng@linux.de=
v> wrote:
> On 5/27/24 21:34, Geert Uytterhoeven wrote:
> > Add support for the drm_panic module, which displays a message on
> > the screen when a kernel panic occurs.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Thank you!

> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_d=
rm_plane_helper_funcs =3D {
> >       .atomic_disable =3D shmob_drm_plane_atomic_disable,
> >   };
> >
> > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_hel=
per_funcs =3D {
> > +     .atomic_check =3D shmob_drm_plane_atomic_check,
> > +     .atomic_update =3D shmob_drm_plane_atomic_update,
> > +     .atomic_disable =3D shmob_drm_plane_atomic_disable,
> > +     .get_scanout_buffer =3D drm_fb_dma_get_scanout_buffer,
> > +};
> > +
> >   static const struct drm_plane_funcs shmob_drm_plane_funcs =3D {
> >       .update_plane =3D drm_atomic_helper_update_plane,
> >       .disable_plane =3D drm_atomic_helper_disable_plane,
> > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct sh=
mob_drm_device *sdev,
>
>
> Maybe a shmob_drm_plane_create_primary_plane() plus a
> shmob_drm_plane_create_overlay().
>
> I remember Thomas told this way or something similiar, call untangle.

Hmm, that's what we had until commit c228823426ae509f ("drm:
renesas: shmobile: Unify plane allocation")...

>
> >       splane->index =3D index;
> >
> > -     drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs=
);
> > +     if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> > +             drm_plane_helper_add(&splane->base,
> > +                                  &shmob_drm_primary_plane_helper_func=
s);
> > +     else
> > +             drm_plane_helper_add(&splane->base,
> > +                                  &shmob_drm_plane_helper_funcs);
> >
> >       return &splane->base;
> >   }
>
>
> Anyway, it looks good to me.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
