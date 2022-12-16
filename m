Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C564F0F1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 19:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B65410E14A;
	Fri, 16 Dec 2022 18:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6661710E14A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 18:25:45 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so1853241otu.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 10:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KuwCiAYMxgpqfg3j/89AggQseXRIj2WM/6mFNO2e0M=;
 b=BbHEbzmBO5B/ymiMJNOFGSDWY6TfEGP1kCWoYAvrBD5mCmCe0Z3bUFva7A5elKBy9V
 a+X6n7ty1fuVPPRGOm/bkdDYyXbDFrcTLevPftOh607eBW4KmPfKLW28Nq7+SgA0oFQQ
 HL5zp/fo90zbXdb6Fh8f+zG/JVNc5OMwfpqISGzdO0tAb5XJ1RE+Ar9HB9ftTUuRqa9+
 gpKrHIJq3tolF2JmuWmyoAdZj9Ikek2cEmoaQMWzEwe6ZjnM2kl13PkSMFEQ6xqKmRuG
 QCxsmGqbEPf7aI1RpJYAj8dEwW58AG+mb1ttj2Kx6d8ZMJ8cuiHw8/CEdfnTAJ8RF8j1
 LKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KuwCiAYMxgpqfg3j/89AggQseXRIj2WM/6mFNO2e0M=;
 b=J6VTAX0+Mt8fCCaqKcydWvVK7Fm86LJF9wakMTtg+r+wfjuNz9ntKZYoO1VIp2P9Bd
 aj4E9aR8uYANHDJBq/EQRR+pi4FLa1VytBCgIzsMARUaCSQ+E9R7yOM7efvi36N2TGCU
 COOJeTcfjI4PQROn6n3OIKRnECJkgaAczj7pOUBbk2BsSX6S0iAcvRM7gvf3czkBJ7h4
 2Gk1QjV15YD5QOl67CqULLb9Kd7eN8J0RQMlSq1mzamGIixKjiP1AvC+ior/WdPm8zxN
 ymf9got0a/HiZVH23ACxFfPdhfK+oz4x67ZSs9mn0WitCoHX46WlSBucc6+arcD1GE8J
 3e5w==
X-Gm-Message-State: AFqh2kqVsAmoYVZ2V4HZYGbEnWBlbixPJjgPlQeMIi1NRPgaY3Mj7/Le
 wD+UYKr0UkXnZjFKge22bEESzsEkGh1O+NBs1Dk=
X-Google-Smtp-Source: AMrXdXvhWA2ADg9mlBIIz3FCyU6LuDB/f/xHuv4E/HqirQvel+umvcBtFvr1SND3EB2X6MNz1VHiBg4SqxeD+u48CPo=
X-Received: by 2002:a9d:194:0:b0:675:cde9:90b9 with SMTP id
 e20-20020a9d0194000000b00675cde990b9mr349477ote.123.1671215144225; Fri, 16
 Dec 2022 10:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
 <12b18ff8-532e-66bd-1c34-2880c1762a22@suse.de>
 <20221216181134.c5d7rsojb22w2c2g@pengutronix.de>
In-Reply-To: <20221216181134.c5d7rsojb22w2c2g@pengutronix.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Dec 2022 13:25:32 -0500
Message-ID: <CADnq5_OnzKtwO-CJchsF-dCKYZ-BFLOYLFy_=6XNNmuUdokxBQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 16, 2022 at 1:11 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Mon, Nov 28, 2022 at 07:16:11PM +0100, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 12.09.22 um 11:15 schrieb Uwe Kleine-K=C3=B6nig:
> > > While working on a drm driver that doesn't need the i2c algobit stuff=
 I
> > > noticed that DRM selects this code even tough only 8 drivers actually=
 use
> > > it. While also only some drivers use i2c, keep the select for I2C for=
 the
> > > next cleanup patch. Still prepare this already by also selecting I2C =
for
> > > the individual drivers.
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > > Changes since v1
> > > (20210514100142.1182997-1-u.kleine-koenig@pengutronix.de) from
> > > 2021-05-14:
> > >
> > >   - rebased to next-20220909
> > >     was something around v5.13-rc2 before, required to fix context
> > >     changes in the nouveau Kconfig file. git am -3 handled it just fi=
ne.
> > >
> > > I reverified that no new drivers were added that need a corresponding
> > > select.
> > >
> > > Best regards
> > > Uwe
> > >
> > >   drivers/gpu/drm/Kconfig                 | 5 ++++-
> > >   drivers/gpu/drm/ast/Kconfig             | 2 ++
> > >   drivers/gpu/drm/gma500/Kconfig          | 2 ++
> > >   drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
> > >   drivers/gpu/drm/i915/Kconfig            | 2 ++
> > >   drivers/gpu/drm/mgag200/Kconfig         | 2 ++
> > >   drivers/gpu/drm/nouveau/Kconfig         | 2 ++
> > >   7 files changed, 16 insertions(+), 1 deletion(-)
> >
> > amdgpu and radeon also include <linux/i2c-algo-bit.h>. Are they special=
 in
> > some way?
>
> You wonder why there is no change in drivers/gpu/drm/amd/amdgpu/Kconfig
> and drivers/gpu/drm/radeon/Kconfig, right?
>
> Yes, amdgpu and radeon are special because their toplevel Kconfig
> symbols (DRM_AMDGPU and DRM_RADEON respectively) are defined in
> drivers/gpu/drm/Kconfig. For the other 6 drivers it's in their own
> Kconfig file.

FWIW, these moved into their own for 6.2.

Alex

>
> If that isn't your concern, please retry explaining it to me.
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
