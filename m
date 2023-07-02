Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C8744CD8
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 11:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93210E008;
	Sun,  2 Jul 2023 09:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E02E10E008
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 09:04:55 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-570877f7838so40281057b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 02:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688288693; x=1690880693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0rKPpyZ8Vpl4zrPLQreT82vhpL2lp3WXuUoTDayFbI=;
 b=lx8GbA7heb+zMtWVT1f3yGapSxqWA/xA2zy1jo0kw974P5dQ24w4zaOBr6NA0yedkE
 HWF1MhaC+VVwVXCSCgbBmntojezdxNQ3BGHhS0PIYFb1oobuA7aU3B1UwvOoanSYUGtN
 Z654n9vn/nU/7ugOpjG6m91qoaMFwxCeQXnUkTFF0Y5jByOevS1jwL1XigWx1wdjnqB3
 QwbOoab6XhWkB++wkmeGlHUip30T9TD0CDmP2Iuok4G1mFZkbWrjTrdyD0Ml59tD0wPJ
 u/4JZehL/xMrfmwCEcAliq0hlvusez2smInIYIPfKsnnzEyrQgsRzOToEg9UiPPyQf3J
 //iw==
X-Gm-Message-State: ABy/qLZkmfWSnYXDIye/osaX/kivQd1F1P6uyoxP5u4UKSeKKw/MWeZk
 yxFbxPImGFgqyN7hCfsEcw/e+z7pUYe3Tu4I
X-Google-Smtp-Source: APBJJlFhqLdk+chi8PhmBAKqRCNlS50Pqt8KrF0Or4W3B1hGWFOs3E/Fb2bIT15bhLszASM6/8Ux4A==
X-Received: by 2002:a81:4904:0:b0:577:4975:c114 with SMTP id
 w4-20020a814904000000b005774975c114mr5664918ywa.0.1688288693573; 
 Sun, 02 Jul 2023 02:04:53 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 w67-20020a0ded46000000b0054f83731ad2sm2858010ywe.0.2023.07.02.02.04.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 02:04:52 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-570877f7838so40280807b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 02:04:52 -0700 (PDT)
X-Received: by 2002:a0d:d649:0:b0:570:65df:21dc with SMTP id
 y70-20020a0dd649000000b0057065df21dcmr7384264ywd.3.1688288692547; Sun, 02 Jul
 2023 02:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-3-javierm@redhat.com>
 <2e1af219-a31c-4284-b50a-662f65c8a736@app.fastmail.com>
In-Reply-To: <2e1af219-a31c-4284-b50a-662f65c8a736@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 2 Jul 2023 11:04:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQ3FcmyCd-mWOWVAXzgoOX8wBD8-LbRwjNkC=sz3y27g@mail.gmail.com>
Message-ID: <CAMuHMdWQ3FcmyCd-mWOWVAXzgoOX8wBD8-LbRwjNkC=sz3y27g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: Make fbdev emulation select FB_CORE instead
 of depends on FB
To: Arnd Bergmann <arnd@arndb.de>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Sun, Jul 2, 2023 at 12:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Sat, Jul 1, 2023, at 23:44, Javier Martinez Canillas wrote:
> > Now that the fbdev core has been split in FB_CORE and FB, make DRM fbde=
v
> > emulation layer to just select the former.
> >
> > This allows to disable the CONFIG_FB option if is not needed, which wil=
l
> > avoid the need to explicitly disable each of the legacy fbdev drivers.
> >
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> >
> > Changes in v2:
> > - Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann)=
.
> >
> >  drivers/gpu/drm/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index afb3b2f5f425..d9b1710e3ad0 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -132,7 +132,7 @@ config DRM_DEBUG_MODESET_LOCK
> >  config DRM_FBDEV_EMULATION
> >       bool "Enable legacy fbdev support for your modesetting driver"
> >       depends on DRM_KMS_HELPER
> > -     depends on FB=3Dy || FB=3DDRM_KMS_HELPER
> > +     select FB_CORE
>
> This will unfortunately force FB_CORE=3Dy even with DRM=3Dm, it would be =
nice
> to allow both to be loadable modules. Any of these should work:
>
> a) Add another hidden symbol like
>
> config DRM_FB_CORE
>       def_tristate DRM && DRM_FBDEV_EMULATION
>       select FB_CORE

More complexity to keep track of...

>
> b) move the 'select' to DRM
>
> config DRM
>       tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI su=
pport)"
>       select FB_CORE if DRM_FBDEV_EMULATION

I prefer this one, as it keeps the select close to the user.

BTW, the tristate help text can use some overhaul ;-)

> c) Remove the 'select' and instead use the default
>
> config FB_CORE
>      def_tristate FB || (DRM && DRM_FBDEV_EMULATION)

Adding it here means this patch would touch two subsystems.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
