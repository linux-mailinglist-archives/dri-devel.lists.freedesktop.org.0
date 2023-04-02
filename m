Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5686D373D
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 12:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE1A10E23C;
	Sun,  2 Apr 2023 10:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD2810E23C;
 Sun,  2 Apr 2023 10:22:19 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id i22so18919828uat.8;
 Sun, 02 Apr 2023 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680430938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78mvPGTViVosqxILCdJJz132sdgbqpWpHt2BoCSXMOg=;
 b=FXXe+tnLNKmwBvuPN64jwW3rt7Sp6xpz7AtyFrnebOcNSaiEZOEPIudklrQfMO3HDf
 5/AP6zumg5kylxg8cq3VlXDN5HOcJqRuopMp8fCKm41MKD6r41sFZNpG/nWd2/OplnRM
 JWqcsVwkqqxpPYedeLbMOwsu69eIhn/qfeqVG1F2/I7i9CGOa/VEbvW+kKIwzZJV4oBq
 CAUr1vRhdKK9JWmFqVm336Q0/crRS5WeCkxmiFezRrFF4CTzUqClkMO89Moih1GcAls7
 vfhdF+A/YMwQZIPWG18JeIYKzlfpid/qraz3+mI5p+1U+xkd7p1gh2aEqi8zN56jIFVE
 h/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680430938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=78mvPGTViVosqxILCdJJz132sdgbqpWpHt2BoCSXMOg=;
 b=Ne4zAQmMi0TcDth8v7ifGAr88XJkVudSgTP7L8ZI0K6ih4KljqBlFZ1NacYffRhUOZ
 xrB6sVHuApTIJPaYGJQAint/8nBThLaNJm6XrSji+gjwuXAv1/Kz0cpdbfeGzdcqwpfa
 n1cGTEu4+ZU6ro7exgxWKnd48oDaSGq6PEMP47Z1R2igbd4aAoJoRnrLiL5qTVcmMA3H
 TZOONWH+qCcg4+FU9DKzl3xQb/6oAha5xK1RMZ47tUmULBN0JUTEx0+y0t0E3IF5TiUC
 wyQU0rulF2fhZAd5Sc9WT96Ya9ZSBpcrl/uB0QpKkSVn7IdO8ptkIRAmMEG7J0GaIF6K
 Yl1A==
X-Gm-Message-State: AAQBX9edmQqyzTij0FOeI/bKnmnKj7J7PUnUSL126nNuSvBldQjFyJgm
 CsOPDEcU12LTOw7hAqdgw05sRY5I5G2whiTd1zw=
X-Google-Smtp-Source: AKy350Zs0K8eGXtCBH4dIdNatjLteJ3QzMaSN+mH3XnRzETLN6JjDCKJI9Dj5Qa9ERUouU/dFyPa/4wE0ZxQBfcJiT4=
X-Received: by 2002:a1f:ad4b:0:b0:432:90b6:e626 with SMTP id
 w72-20020a1fad4b000000b0043290b6e626mr17524175vke.3.1680430938182; Sun, 02
 Apr 2023 03:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230314052711.4061652-1-harshit.m.mogalapalli@oracle.com>
 <CAKGbVbsh4AXo+E4=T0eHeHS_ZuY4QYgRBF+Nbt+BFFMoJOMo0g@mail.gmail.com>
In-Reply-To: <CAKGbVbsh4AXo+E4=T0eHeHS_ZuY4QYgRBF+Nbt+BFFMoJOMo0g@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 2 Apr 2023 18:22:07 +0800
Message-ID: <CAKGbVbvCk04h1y99o-uqZLnzjZBFzS6fzXzopnwH=sXKzBNRtQ@mail.gmail.com>
Subject: Re: [PATCH] drm/lima/lima_drv: Add missing unwind goto in
 lima_pdev_probe()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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
Cc: Simon Shields <simon@lineageos.org>, error27@gmail.com,
 lima@lists.freedesktop.org, Andreas Baierl <ichgeh@imkreisrum.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

On Tue, Mar 14, 2023 at 2:22=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote:
>
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> On Tue, Mar 14, 2023 at 1:27=E2=80=AFPM Harshit Mogalapalli
> <harshit.m.mogalapalli@oracle.com> wrote:
> >
> > Smatch reports:
> > drivers/gpu/drm/lima/lima_drv.c:396 lima_pdev_probe() warn:
> >         missing unwind goto?
> >
> > Store return value in err and goto 'err_out0' which has
> > lima_sched_slab_fini() before returning.
> >
> > Fixes: a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
> > Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> > ---
> > Only compile tested.
> > ---
> >  drivers/gpu/drm/lima/lima_drv.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lim=
a_drv.c
> > index 7b8d7178d09a..39cab4a55f57 100644
> > --- a/drivers/gpu/drm/lima/lima_drv.c
> > +++ b/drivers/gpu/drm/lima/lima_drv.c
> > @@ -392,8 +392,10 @@ static int lima_pdev_probe(struct platform_device =
*pdev)
> >
> >         /* Allocate and initialize the DRM device. */
> >         ddev =3D drm_dev_alloc(&lima_drm_driver, &pdev->dev);
> > -       if (IS_ERR(ddev))
> > -               return PTR_ERR(ddev);
> > +       if (IS_ERR(ddev)) {
> > +               err =3D PTR_ERR(ddev);
> > +               goto err_out0;
> > +       }
> >
> >         ddev->dev_private =3D ldev;
> >         ldev->ddev =3D ddev;
> > --
> > 2.38.1
> >
