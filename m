Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5764910DC7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75C910EB31;
	Thu, 20 Jun 2024 16:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867A110EB31
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:57:14 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6316253dc2aso10846517b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 09:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718902633; x=1719507433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S5itu45x4aHLX6PVq+0Re8ZrEKkBuHZebf/C6/EpUMs=;
 b=o1EUeK4pmRzSqwhjr/hwtyv80dktPy2YZEjMmWbr4A6rQmq9abCq6/pxesChgAVGR2
 F3WRPnBWs8BLgGbMNRlT2KWXTMQOLqd+LsyRzKUk96KNFPX5HDqk0sSt3EiWA4UlBn1s
 e/96NzjZLcfM43LqskKAevAVGcY7DAn+WM3SxnmM8pU1Q6lUuf74LpLbYzQLLTGWIhlD
 Ri2JvLExSeE/hMLIhUgiNomQlCnMUeMIwImKHgdRKNPJEwOSzPOLb9rAs6x7eoLQ5YAK
 DHqUdw5SKTftTNjYjR66Ld0EF13pldoe5Od8RekdY33CKhbKcr/i8UHwTaJ7QjcUDw51
 D2rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdtAItIotox7Za7CcWOh8mfSKmef8J964DorWsuioodP5DcEB1euKCj74DshVCVoGZ2+yF/NXR/SsQzfh2KQ2mDfr+4xpk89odsXLil1XE
X-Gm-Message-State: AOJu0YzI2q9IfQjBQC2WOr0N95dpTkFjBO3NUcZiji3IAVf3rXnB8ean
 8xerUDIRS0BMjP7qfhvpO5w0tRLDq+QhYzrkIH3VETfcB9jfAZXwmwyqx7vk
X-Google-Smtp-Source: AGHT+IG27tjF+id/bM2RijK+Q5MVXx+LWZTR6H/bDsjL12d0Bc+JFdsyES7vU/JVuzPgAO3v5OqtBw==
X-Received: by 2002:a0d:ea55:0:b0:62d:a29:5384 with SMTP id
 00721157ae682-63b1cf08b7emr47182447b3.43.1718902632990; 
 Thu, 20 Jun 2024 09:57:12 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6311aa22c3asm31181737b3.120.2024.06.20.09.57.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 09:57:12 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dff26b612a9so1010066276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 09:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXKW+a5LIEdQ/AoV7Hr5Kp1d+EDwrUvGN25Jv6/0j93Q64tvazNQeJldCQXFS8IrZSIBsTt4het1ETpqxC6WEs9UUistl64IF+XPYbCu402
X-Received: by 2002:a25:aa4d:0:b0:e02:5186:a268 with SMTP id
 3f1490d57ef6-e02be1023e5mr6107160276.6.1718902632594; Thu, 20 Jun 2024
 09:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-5-jacopo.mondi@ideasonboard.com>
 <20240619194414.GD31507@pendragon.ideasonboard.com>
 <CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com>
 <hs52ylzaes26kx3yj6eqfksvmoldsvdn3e4emo4q7ijkhdbe2r@wyxempul6cxm>
In-Reply-To: <hs52ylzaes26kx3yj6eqfksvmoldsvdn3e4emo4q7ijkhdbe2r@wyxempul6cxm>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 18:57:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhp6mNintEM7Ys77=vGmCqBp6qSLzh+Joaf=2jtntN4A@mail.gmail.com>
Message-ID: <CAMuHMdWhp6mNintEM7Ys77=vGmCqBp6qSLzh+Joaf=2jtntN4A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: rcar-du: Add support for R8A779H0
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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

Hi Jacopo,

On Thu, Jun 20, 2024 at 6:48=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Thu, Jun 20, 2024 at 02:48:49PM GMT, Geert Uytterhoeven wrote:
> > On Wed, Jun 19, 2024 at 9:46=E2=80=AFPM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > On Wed, Jun 19, 2024 at 12:22:18PM +0200, Jacopo Mondi wrote:
> > > > Add support for R-Car R8A779H0 V4M which has similar characteristic=
s
> > > > as the already supported R-Car V4H R8A779G0, but with a single outp=
ut
> > > > channel.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > > > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > > > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > > > @@ -185,11 +187,16 @@ static void rcar_du_group_setup(struct rcar_d=
u_group *rgrp)
> > > >               dorcr |=3D DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> > > >       rcar_du_group_write(rgrp, DORCR, dorcr);
> > > >
> > > > -     /* Apply planes to CRTCs association. */
> > > > -     mutex_lock(&rgrp->lock);
> > > > -     rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> > > > -                         rgrp->dptsr_planes);
> > > > -     mutex_unlock(&rgrp->lock);
> > > > +     /*
> > > > +      * Apply planes to CRTCs association, skip for V4M which has =
a single
> > > > +      * channel.
> > >
> > > " and doesn't implement the DPTSR register."
> > >
> > > I'm pretty sure writing it is still harmless, but...
> > >
> > > > +      */
> > > > +     if (rcdu->info->gen < 4 || rgrp->num_crtcs > 1) {
> >
> > Looking at the R-Car Gen3 docs, this check seems to be wrong, and the
> > lack of a check might have been an issue before?
>
> Not sure I got from your comment what part is wrong.
>
> Reading below it seems you're suggesting that writes to DPTSR should
> be skipped for some Gen3 boards as well ?

Indeed.

> > Seems like the register (per pair) is only present if the second CRTC
> > of a CRTC pair is present, so R-Car V3M and V3H (single CRTC) do not
> > have DPTSR at all, and M3-W (triple CRTC) does not have it on the
> > second pair.  M3-N does have both, as it lacks the first CRTC of
> > second pair, but does have the second CRTC of the second pair.
> >
>
> /o\
>
> So far however, all Gen3 SoCs you mentioned seem to work with DPTSR
> being written and the BSP [1] only actually skips it for V4M.

I don't doubt it works, I was just reading the documentation.
Many nonexistent registers can be written zero to without ill effects...

> What would you suggesting in this case ? Addressing gen3 as well ?
> That's something that would require testing on all the above boards
> thought.

Ah, what if we could do without all this pesky testing? ;-)

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
