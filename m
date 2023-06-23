Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA75A73BE13
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEE010E04F;
	Fri, 23 Jun 2023 17:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D3910E04F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:51:21 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-57040e313c5so14961657b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687542680; x=1690134680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H7quSJ3+jB/PSLZA5wSTCCL319u6birtQAJa6S9m7Do=;
 b=QxrZvmGn5wUKiBNGYmKOgf7jrYTEUAsSOJt9o3F2dsCp2/WSdCZmEJc924pNMk1DDy
 oMHq8ePn67uZ2BIg4HO04hAJ3RTEUbBQ69P91BCjOigNKF0iPLro3LxkuDy6ManvJqJt
 /6Grk1v4wpskdk4tiFGUG5oUkvx5IEMGeP0/skyrOFSOxQ43dBxD4xH7OmWdcDyBQDQT
 TcEMU/1Kd3mNwXlWvt6muyD14dvEUm+ET8YOLVfj3DPjnHMCt9Z3fEU1RYwMVq6FBds2
 4udcXjdS40htKp0+dsnfeY7CnOf+KOKss3qny3JH00MZTz2OpjTJ50IZpf3stB3llrYc
 LQsg==
X-Gm-Message-State: AC+VfDyhK52h3/L9lGflOHeiZMByBKq3Fl1k1wW25rQbHXh8gMlrB8SA
 R3m3fzyAAFDQHpMGzZTmPZzqr88sicF5XA==
X-Google-Smtp-Source: ACHHUZ7SudpV1n3EJuv61a5U7VV1mFRlCZJtpqZLfCQxkFB/0BpLIPlDzgc9q5+rwjjwwvs3uGuXsg==
X-Received: by 2002:a0d:dfd0:0:b0:576:87b1:ae0d with SMTP id
 i199-20020a0ddfd0000000b0057687b1ae0dmr459380ywe.21.1687542679887; 
 Fri, 23 Jun 2023 10:51:19 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 d141-20020a814f93000000b00559f1cb8444sm2574632ywb.70.2023.06.23.10.51.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 10:51:19 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-bad0c4f6f50so1468225276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:51:19 -0700 (PDT)
X-Received: by 2002:a25:32c1:0:b0:bc6:263a:2fe with SMTP id
 y184-20020a2532c1000000b00bc6263a02femr22491980yby.29.1687542678947; Fri, 23
 Jun 2023 10:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687423204.git.geert+renesas@glider.be>
 <0032f38b474a8ff63a7cdfdbc8b73766c3561729.1687423204.git.geert+renesas@glider.be>
 <20230623163950.GA2112@pendragon.ideasonboard.com>
In-Reply-To: <20230623163950.GA2112@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jun 2023 19:51:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_gvs1+KtN14DxAMY+Qa2YTo8KL3L4VnL3yG2zYiH6JQ@mail.gmail.com>
Message-ID: <CAMuHMdU_gvs1+KtN14DxAMY+Qa2YTo8KL3L4VnL3yG2zYiH6JQ@mail.gmail.com>
Subject: Re: [PATCH 23/39] drm: renesas: shmobile: Move interface handling to
 connector setup
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Jun 23, 2023 at 6:39=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 22, 2023 at 11:21:35AM +0200, Geert Uytterhoeven wrote:
> > Move legacy interface handling to the connector setup code.
> > Set up bus_flags and bus_formats in display_info according to the
> > bus format and panel information from platform data, to make it more
> > similar with DT-based connector/bridge/panel setup.
> > This will allows us to use the same LCD interface setup code for both
>
> s/allows/allow/
>
> > legacy and DT-based systems.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > @@ -8,6 +8,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/media-bus-format.h>
> >  #include <linux/pm_runtime.h>
> >
> >  #include <drm/drm_crtc.h>
> > @@ -66,15 +67,65 @@ static void shmob_drm_crtc_setup_geometry(struct sh=
mob_drm_crtc *scrtc)
> >  {
> >       struct drm_crtc *crtc =3D &scrtc->crtc;
> >       struct shmob_drm_device *sdev =3D to_shmob_device(crtc->dev);
> > -     enum display_flags dpy_flags =3D sdev->connector.mode->flags;
> > +     const struct drm_display_info *info =3D &sdev->connector->display=
_info;
> >       const struct drm_display_mode *mode =3D &crtc->mode;
> >       u32 value;
> >
> > -     value =3D sdev->ldmt1r
> > -           | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : LDMT1R_VPOL)
> > -           | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : LDMT1R_HPOL)
> > -           | ((dpy_flags & DISPLAY_FLAGS_PIXDATA_POSEDGE) ? LDMT1R_DWP=
OL : 0)
> > -           | ((dpy_flags & DISPLAY_FLAGS_DE_LOW) ? LDMT1R_DIPOL : 0);
> > +     if (!info->num_bus_formats || !info->bus_formats) {
> > +             dev_warn(sdev->dev, "No bus format reported, using RGB888=
\n");
> > +             value =3D LDMT1R_MIFTYP_RGB24;
> > +     } else {
> > +             switch (info->bus_formats[0]) {
> > +             case MEDIA_BUS_FMT_RGB888_3X8:
> > +                     value =3D LDMT1R_MIFTYP_RGB8;
> > +                     break;
> > +
> > +             case MEDIA_BUS_FMT_RGB666_2X9_BE:
> > +                     value =3D LDMT1R_MIFTYP_RGB9;
> > +                     break;
> > +
> > +             case MEDIA_BUS_FMT_RGB888_2X12_BE:
> > +                     value =3D LDMT1R_MIFTYP_RGB12A;
> > +                     break;
> > +
> > +             case MEDIA_BUS_FMT_RGB444_1X12:
> > +                     value =3D LDMT1R_MIFTYP_RGB12B;
> > +                     break;
> > +
> > +             case MEDIA_BUS_FMT_RGB565_1X16:
> > +                     value =3D LDMT1R_MIFTYP_RGB16;
> > +                     break;
> > +
> > +             case MEDIA_BUS_FMT_RGB666_1X18:
> > +                     value =3D LDMT1R_MIFTYP_RGB18;
> > +                     break;
> > +
> > +             case MEDIA_BUS_FMT_RGB888_1X24:
> > +                     value =3D LDMT1R_MIFTYP_RGB24;
> > +                     break;
> > +
> > +             case MEDIA_BUS_FMT_UYVY8_1X16:
> > +                     value =3D LDMT1R_MIFTYP_YCBCR;
> > +                     break;
> > +
> > +             default:
> > +                     dev_warn(sdev->dev,
> > +                              "unsupported bus format 0x%x, using RGB8=
88\n",
> > +                              info->bus_formats[0]);
> > +                     value =3D LDMT1R_MIFTYP_RGB24;
> > +                     break;
> > +             }
>
> It's a bit annoying to lose the ability to validate the bus format at
> probe time. Can it be kept. I'm also OK with restoring it later in the
> series if it gets in the way of the conversion, in which case a mention
> in the commit message would be nice.

I guess I can keep it, somewhere.
Probably it should be validated for the DT case later, too.
BTW, drivers/gpu/drm/renesas/rcar-du/rcar_lvds.s doesn't check this
either, so I copied the bad example from the expert ;-)

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
