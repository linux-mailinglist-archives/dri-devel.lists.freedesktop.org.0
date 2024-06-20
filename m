Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4E791047A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 14:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE03010E162;
	Thu, 20 Jun 2024 12:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B5210E162
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 12:49:02 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dff02b8a956so824746276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 05:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718887741; x=1719492541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dwTZvjStxcy8ANXhG9XqkhF8JycY3RLrE4qtHFN4Aik=;
 b=klvOk71FycSXB8E8Dvw9yJflOnoUETvjYTCRAz26RLxkwzAHxUjFT6PExDK8Ov105h
 gjDaUWBTl/wl+iF+PO06/DUXy8PGh1Kk2P5sU7tX9QOtcdmM3FY4F7mxdOgPxVaM5us9
 5qn6ukdPwOl4y2OtjjXQYHr0UTyB2mxmvWj3QnWfwfD1y0Mp8MzgJ6pwbKB+X8IGXM+n
 xR+B4j+F6pZc9rqfShZoRw+9WkkXya8perEKyZyGcuBN97R4H6wBnkoK2k1swEcDqXFJ
 3w9O0t5bb02NbkIlgDJHu8uw/ieXvWwMVdvwOkFJoGxgCKv90wNGRGz2uRPhR8sWg7gq
 xHzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5wPgpzXFgD0YCC0qpJT6Q2352WrfmYYg5S4qmMdLOiStO7iLNdIxBjVrUkL+gRw7xB+1yy26le4q1QfKKSeNx1r9TYGtESpL/IRpNKlim
X-Gm-Message-State: AOJu0Yy+ociQ1wJpOHkDXdebNBAXvA9a802t3JFW0blRWqa2fmSDQPaz
 pt/jLkco39CWqxG0IeOjj6J7aAU0HkHKyGlOKz1SyVyYbzUBLaqPW5khSWfZ
X-Google-Smtp-Source: AGHT+IH7XscTLWKYIwrJTvk3Dgj6j2HnQ8UglhT9YwQ9vVqxS/iJuqakkG1/22javcGFNm/mEPCs2w==
X-Received: by 2002:a25:bfc9:0:b0:df7:7096:88f2 with SMTP id
 3f1490d57ef6-e02be226ff7mr5356694276.55.1718887741201; 
 Thu, 20 Jun 2024 05:49:01 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-dff04a4d8absm3676553276.51.2024.06.20.05.49.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 05:49:01 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-632843cff4fso7870747b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 05:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIcmv+pXDXqEy9onptVx9JeohiHyD9nTCeykx3NZUMKF55BnxooN3y3pEf/ecvQ7KS4OU9qETecUpPbHOfco/VkSJInW1cTAcvMp5rL4MG
X-Received: by 2002:a81:9254:0:b0:618:2f6d:ca80 with SMTP id
 00721157ae682-63a8dfed4admr59007547b3.12.1718887740827; Thu, 20 Jun 2024
 05:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-5-jacopo.mondi@ideasonboard.com>
 <20240619194414.GD31507@pendragon.ideasonboard.com>
In-Reply-To: <20240619194414.GD31507@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 14:48:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com>
Message-ID: <CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: rcar-du: Add support for R8A779H0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>
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

Hi Laurent, Jacopo,

On Wed, Jun 19, 2024 at 9:46=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jun 19, 2024 at 12:22:18PM +0200, Jacopo Mondi wrote:
> > Add support for R-Car R8A779H0 V4M which has similar characteristics
> > as the already supported R-Car V4H R8A779G0, but with a single output
> > channel.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > @@ -185,11 +187,16 @@ static void rcar_du_group_setup(struct rcar_du_gr=
oup *rgrp)
> >               dorcr |=3D DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> >       rcar_du_group_write(rgrp, DORCR, dorcr);
> >
> > -     /* Apply planes to CRTCs association. */
> > -     mutex_lock(&rgrp->lock);
> > -     rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> > -                         rgrp->dptsr_planes);
> > -     mutex_unlock(&rgrp->lock);
> > +     /*
> > +      * Apply planes to CRTCs association, skip for V4M which has a si=
ngle
> > +      * channel.
>
> " and doesn't implement the DPTSR register."
>
> I'm pretty sure writing it is still harmless, but...
>
> > +      */
> > +     if (rcdu->info->gen < 4 || rgrp->num_crtcs > 1) {

Looking at the R-Car Gen3 docs, this check seems to be wrong, and the
lack of a check might have been an issue before?

Seems like the register (per pair) is only present if the second CRTC
of a CRTC pair is present, so R-Car V3M and V3H (single CRTC) do not
have DPTSR at all, and M3-W (triple CRTC) does not have it on the
second pair.  M3-N does have both, as it lacks the first CRTC of
second pair, but does have the second CRTC of the second pair.

> > +             mutex_lock(&rgrp->lock);
> > +             rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 1=
6) |
> > +                                 rgrp->dptsr_planes);
> > +             mutex_unlock(&rgrp->lock);
> > +     }
> >  }

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
