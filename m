Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEDD7638C1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 16:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391BD10E174;
	Wed, 26 Jul 2023 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B220110E174
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:14:19 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-584243f84eeso22097567b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690380858; x=1690985658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYmXF6+fhXjo5iXeYGhM12iR95vAqcFzUbgaNOIrO3o=;
 b=B1OqYYKdYxIj/kmcjSdzeZxE/JCjMNNpTZvhInIUDW7ybBglFN/znzYRqNlF+g5Wp3
 sYscvym5LJ+vD0WLkmAhHGP3klv2Tsj12itsGN08DorrR2i5/fAZgstGj/eYzDMSNwdr
 JpC2zVLzQaIgWnSsD/Y/x4yToDANe6yjrvbWrAo09JJZyEzHkUaT2TSfvsA2uEpLwHjS
 GyyH3lPhoe+EILQqm1YmcStpwG+FJbUUNv1HnR4Wu96vb42P+29fvQsfjv/B3vEZscBk
 +rf8xC7zG84Cxq0o3VXlPqUpMJpLEcpNwLF2T4msLZqr8TtRYGQF+yzFzqpkZ4aRFvSs
 CAvQ==
X-Gm-Message-State: ABy/qLZYRQdK29sndtUy0LLYu/BEebnfSNcc3bMyUr/FrOnU9T8V31Ky
 KH8ui4JWJ9r+AE1tDOTwMRIaSO5+bItJ/g==
X-Google-Smtp-Source: APBJJlFFfbVWKDUKs7wpAoO42W2Lm3rrVmoDa6hj79BMWd88JJvWzJ4P4JFR8aZ92PFuZkoJ0k3DUQ==
X-Received: by 2002:a0d:d3c7:0:b0:573:8567:3bdd with SMTP id
 v190-20020a0dd3c7000000b0057385673bddmr1895905ywd.23.1690380858564; 
 Wed, 26 Jul 2023 07:14:18 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 m13-20020a819c0d000000b0057085b18cddsm4171413ywa.54.2023.07.26.07.14.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 07:14:17 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-d0728058651so5095020276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:14:17 -0700 (PDT)
X-Received: by 2002:a25:828c:0:b0:d0b:5a37:1aa0 with SMTP id
 r12-20020a25828c000000b00d0b5a371aa0mr1586828ybk.36.1690380856985; Wed, 26
 Jul 2023 07:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
 <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
 <874jlqlv5v.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdX+J848ckG2JqsuDkRcWzRypw_Kv=0G+Hc329xstu_nqQ@mail.gmail.com>
 <g6bu3b26evk464x4cn77xnzjiuotsq7pfvyakfvwnir5e3ihnk@2jh4dd56fsza>
In-Reply-To: <g6bu3b26evk464x4cn77xnzjiuotsq7pfvyakfvwnir5e3ihnk@2jh4dd56fsza>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jul 2023 16:14:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX54sYfv2HJQZxMD_O2XT_nmuoQEE2iTbWkJ9-QvfAWYQ@mail.gmail.com>
Message-ID: <CAMuHMdX54sYfv2HJQZxMD_O2XT_nmuoQEE2iTbWkJ9-QvfAWYQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, Jul 26, 2023 at 3:54=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Wed, Jul 26, 2023 at 02:33:06PM +0200, Geert Uytterhoeven wrote:
> > > >> Also, Javier pointed me to a discussion you had on IRC about using=
 devm
> > > >> allocation here. We can't really do that. KMS devices are only fre=
ed
> > > >> once the last userspace application closes its fd to the device fi=
le, so
> > > >> you have an unbounded window during which the driver is still call=
able
> > > >> by userspace (and thus can still trigger an atomic commit) but the
> > > >> buffer would have been freed for a while.
> > > >
> > > > It should still be safe for (at least) the data_array buffer. That
> > > > buffer is only used to store pixels in hardware format, and immedia=
tely
> > > > send them to the hardware.  If this can be called that late, it wil=
l
> > > > fail horribly, as you can no longer talk to the hardware at that po=
int
> > > > (as ssd130x is an i2c driver, it might actually work; but a DRM dri=
ver
> > > >  that calls devm_platform_ioremap_resource() will crash when writin=
g
> > > >  to its MMIO registers)?!?
> > >
> > > At the very least the SPI driver will fail since the GPIO that is use=
d to
> > > toggle the D/C pin is allocated with devm_gpiod_get_optional(), but a=
lso
> > > the regulator, backlight device, etc.
> > >
> > > But in any case, as mentioned it is only relevant if the data_array b=
uffer
> > > is allocated at probe time, and from Maxime's explanation is more cor=
rect
> > > to do it in the .atomic_check handler.
> >
> > You need (at least) data_array for clear_screen, too, which is called
> > from .atomic_disable().
>
> I'm not sure I get what your concern is?
>
> Even if we entirely disable the plane, the state will not have been
> destroyed yet so you still have at least access to the data_array from
> the old state.

Currently, clearing the screen is done from the plane's .atomic_disable()
callback, so the plane's state should be fine.

But IIUIC, DRM allows the user to enable/disable the display without
creating any plane first, so clearing should be handled in the CRTC's
.atomic_disable() callback instead? Then, would we still have access
to valid plane state?

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
