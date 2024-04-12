Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D708A2909
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 10:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F54B10F4CD;
	Fri, 12 Apr 2024 08:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kyv/hNu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4D10F4CA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 08:16:46 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6181d032bf9so6165487b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 01:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712909805; x=1713514605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxIoOs607/PxRGitnrSnw6t/rg2mvreQVe/CRG+IF7Y=;
 b=Kyv/hNu37QOnt/uZf56wCRzQbaG2sqNjlb/7nuFIO7I4+Gux0R0JI6pnXhudYl5P5D
 /dkAHmSLGvirhMnALAofIEmuDGsaVRCl2QCb9cNmmxkzUZ8FWPKc9cHHZbPQVDBj41lw
 IeNqJTaZNTDqe+rx8aA51rIr2j2Hwi5bDVMsedcUReErZoiEpT6dutNIkTQZzTBfo9H+
 VbxDJw8tCOcFshQwu1fTLGf6gSyBIK4gN3S/3QW7vzaxVyuIzZjQYCIq89QlwjpVaJtM
 TdF/kRvk6H8+nnIMMOSKAVhfsQZsJ5nYtDqbQtcoE7DQezzkaFalermLyNrmuvjkuaGB
 lESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712909805; x=1713514605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxIoOs607/PxRGitnrSnw6t/rg2mvreQVe/CRG+IF7Y=;
 b=ghMNkFLIOCciHrJS09xRtogROR3b77E+ZbQPF+web4uoEhb4NyTku0loI7jmS2IzYj
 r3JAmCsieN79a193WYh1HydOOaB4ROJYHYJQufJxh3WwLCQjG/yCgF9CiG01EDqt+VP9
 3Q0Ciccfc3h9gQ9uhhu9Hcwpr4Kmty2JKIp1ArLl+vZfohnjDsajni1gM0ACmUtUdH2H
 0/zzHw0chCzHelzT0CsjQjndllHDRbInJ6i9kW40HbUVaizF4ZvytVEQn3Tvj3UeJzYM
 I3u+wcoDNa1OxYKhb+JBlORb2S9bE4ESrhKl2+0SDbynZNm7JSzeFLcp5YI2HBsk6qV5
 pqtA==
X-Gm-Message-State: AOJu0Yw944aC1yXNpqZd5eB4gAbqPkIHX2vBK3DeExX9CzJ8wYoYfgXe
 agBVlzJG6QugivvPt81psQKRgV56CABGWobSFIvl5nq3PIILUDjUW9IFnt94DgextFFSi8uxZ7o
 8M27tN+d4XGte/lq9JiD/27eLalA=
X-Google-Smtp-Source: AGHT+IH7u2PvP2+p8qUnKnoK99AGmu85vItT8gexYgslSV2Pk6V0a9CTUG/9aUFcoMrFc4XVZaHJIxHP1Jc3+Wy9okI=
X-Received: by 2002:a81:af54:0:b0:618:6aeb:f790 with SMTP id
 x20-20020a81af54000000b006186aebf790mr1868095ywj.37.1712909805283; Fri, 12
 Apr 2024 01:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240412072409.27650-1-patrik.r.jakobsson@gmail.com>
 <0e57d2c2-6206-4c05-8960-ea188892a857@suse.de>
In-Reply-To: <0e57d2c2-6206-4c05-8960-ea188892a857@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 12 Apr 2024 10:16:34 +0200
Message-ID: <CAMeQTsYywSAfAkbyqVZuj-_r5-L_pZwxv=UxRhD7pNbwW_sGGw@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Check power status before accessing lid data
 in opregion
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Enrico Bartky <enrico.bartky@gmail.com>
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

On Fri, Apr 12, 2024 at 10:02=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi,
>
> the issue of hanging during boot is still resent.

Thanks for testing. Then it cannot be that psb_lid_timer_func runs
before initialization. The BUG from Enrico hints that the
set_brightness function is called before initialization. That might be
another place to look.

I'll see if I can do some testing on my own.

>
> Best regards
> Thomas
>
> Am 12.04.24 um 09:24 schrieb Patrik Jakobsson:
> > Due to changes in the order of initialization the psb_lid_timer_func
> > could get called without the device being powered. Fix this by checking
> > the power status before accessing the opregion.
> >
> > Cc: Enrico Bartky <enrico.bartky@gmail.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > ---
> >   drivers/gpu/drm/gma500/psb_lid.c | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_lid.c b/drivers/gpu/drm/gma500/=
psb_lid.c
> > index 58a7fe392636..eeb91d11336e 100644
> > --- a/drivers/gpu/drm/gma500/psb_lid.c
> > +++ b/drivers/gpu/drm/gma500/psb_lid.c
> > @@ -10,6 +10,7 @@
> >   #include "psb_drv.h"
> >   #include "psb_intel_reg.h"
> >   #include "psb_reg.h"
> > +#include "power.h"
> >
> >   static void psb_lid_timer_func(struct timer_list *t)
> >   {
> > @@ -20,9 +21,12 @@ static void psb_lid_timer_func(struct timer_list *t)
> >       u32 __iomem *lid_state =3D dev_priv->opregion.lid_state;
> >       u32 pp_status;
> >
> > -     if (readl(lid_state) =3D=3D dev_priv->lid_last_state)
> > +     if (!gma_power_begin(dev, false))
> >               goto lid_timer_schedule;
> >
> > +     if (readl(lid_state) =3D=3D dev_priv->lid_last_state)
> > +             goto power_end;
> > +
> >       if ((readl(lid_state)) & 0x01) {
> >               /*lid state is open*/
> >               REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) | POWER_TARGET=
_ON);
> > @@ -36,6 +40,7 @@ static void psb_lid_timer_func(struct timer_list *t)
> >                       psb_intel_lvds_set_brightness(dev, 100);
> >               } else {
> >                       DRM_DEBUG("LVDS panel never powered up");
> > +                     gma_power_end(dev);
> >                       return;
> >               }
> >       } else {
> > @@ -48,6 +53,9 @@ static void psb_lid_timer_func(struct timer_list *t)
> >       }
> >       dev_priv->lid_last_state =3D  readl(lid_state);
> >
> > +power_end:
> > +     gma_power_end(dev);
> > +
> >   lid_timer_schedule:
> >       spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
> >       if (!timer_pending(lid_timer)) {
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
