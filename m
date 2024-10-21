Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE909A6F17
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 18:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D723110E045;
	Mon, 21 Oct 2024 16:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ohu6QUyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BA310E045
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 16:11:15 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6e2e3e4f65dso50197857b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729527074; x=1730131874;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLarjVGAZYFr9G6LDtG3NeEVj6TR9gyCIIm1pC11MuQ=;
 b=Ohu6QUyLp3KyT0xXCtTykKaZiEqE63ThhnJu2HUymQEyDJrGp6ryDUCUxA4KIeiM4Q
 pWut+T2aaKMwr9nv/v1Amv1QXoAyW6um6STWYFBzPee3/nlRURw38Vc46446AEZlIK8y
 KTJyLI246w1m90+FgYjRpqNpvs7LBAvGt4quln+tETPB/bfr+Dho42f69gP9dkHNaqpi
 q9ERag/t1ECrGZZfkjo96sqoSg+RdDMv/vHuBA2JSRGfAv+1Er8+fR1XFe/+CqT4mgKS
 mLdPt44+Y5E38yJIa1rhAwdQlzVX/3w5Q0xOaqHoymDJBPJ4RNR54jDyOS+xZJsYTHmB
 dQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729527074; x=1730131874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLarjVGAZYFr9G6LDtG3NeEVj6TR9gyCIIm1pC11MuQ=;
 b=GnmTgzCArGBkzXbM31SqBUUm/Im2RmUcu6GF4uk3+4e7Owp5jUtC4wheOG+d/r3I+x
 l1XlYDXCx8dtDJ5doivZFWONmPzOEBPBOD6ffoY4Uc17UTr6LNAlfVvVBs/fWWq2HiWi
 oywunLF606JEkCdgKNbm+veUWVET3Mnl829a4mRyziqrviLsYJ8N3AMp6V82ZQkxSxjG
 CsNVWG6HfRS6VkfkcDu6OE+DOD6QbmKb92+yjn9m9z1TiLQVi9wIg5+IwuFR12heX1MN
 8Ty/qOXtLa3BZW32KwD6g4DAcTzX9eOVLRI/ln22cnlOC9HiCEqF6qAvP2wPrq04lIfo
 v9EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfMmubu6NtN3rFaGJ/u5LteMV2qICpJEhrNwbKYW+8X/XTwOOPKpccJZO/10lWQ1uBLkoNy0GmbDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXFmE0nJax8vuQfoVpZMfeRet40Nv+edWU3ijhfXgLwCKhlc+2
 q9IHev2GXhXejpbU+P9LNQZN00+OlJMmpZ36GhcBAE6ZOw7qq1dsgjvbr5UdT5FYEDW0PlEBrRG
 xH/mZSxPBCjtQ+3SQAmASGiqvIvE66EhKPQJcYA==
X-Google-Smtp-Source: AGHT+IH6DdrcYaXPP0mChPDBwLUR+WGY3uRjOTHPRavp++JQS8rWKbIt/tCRrjaIgu43SO89ByRFTbqpJEuDqSJqcxs=
X-Received: by 2002:a05:690c:a8d:b0:6db:cf6c:a7c4 with SMTP id
 00721157ae682-6e5bfd8b1acmr97052717b3.45.1729527074457; Mon, 21 Oct 2024
 09:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241002-vc4_fbdev_fix-v1-0-8737bd11b147@raspberrypi.com>
 <20241002-vc4_fbdev_fix-v1-1-8737bd11b147@raspberrypi.com>
 <b1d76661-41b9-4841-80f4-452654d9cd6b@igalia.com>
 <CAPY8ntDgkyQ6ijdgB2Qmd45ArtXqYFwfmpvYgQhobnw=bUnd-Q@mail.gmail.com>
In-Reply-To: <CAPY8ntDgkyQ6ijdgB2Qmd45ArtXqYFwfmpvYgQhobnw=bUnd-Q@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 21 Oct 2024 17:10:57 +0100
Message-ID: <CAPY8ntDc_s4pxBAVbSdDRDHMVWZHEdWw-283GxCiguz81NYBow@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vc4: Run default client setup for all variants.
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
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

Hi Maxime & Thomas.

Sorry, I'm still learning the processes.

This patch and the 3 from
https://patchwork.freedesktop.org/series/139716/ are in drm-misc-next,
but they are fixes needed for 6.12.
Am I right in thinking I need to "dim cherry-pick" them to
drm-misc-fixes so they get merged there?

Thanks

  Dave

On Wed, 9 Oct 2024 at 13:15, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Wed, 9 Oct 2024 at 12:02, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> >
> > Hi Dave,
> >
> > On 10/2/24 12:06, Dave Stevenson wrote:
> > > Commit 45903624e9fc ("drm/vc4: Run DRM default client setup")
> > > only added DRM_FBDEV_DMA_DRIVER_OPS for the vc4 (Pi0-3) driver
> > > definition, which caused an issue on vc5 (Pi4) as there was no
> > > fbdev_probe function defined.
> > >
> > > Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> Applied to drm-misc-next.
>
> > Best Regards,
> > - Ma=C3=ADra
> >
> > > ---
> > >   drivers/gpu/drm/vc4/vc4_drv.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_=
drv.c
> > > index 13a1ecddbca3..a238f76a6073 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_drv.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> > > @@ -238,6 +238,7 @@ const struct drm_driver vc5_drm_driver =3D {
> > >   #endif
> > >
> > >       DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vc5_dumb_create),
> > > +     DRM_FBDEV_DMA_DRIVER_OPS,
> > >
> > >       .fops =3D &vc4_drm_fops,
> > >
> > >
