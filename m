Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85945C57F49
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9E210E829;
	Thu, 13 Nov 2025 14:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Klc2p11L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EF210E829
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:34:00 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-5dbde7f4341so1512977137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763044440; x=1763649240; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qv/JrdhbRZlCEd1ubK+jM9jWPBpAjvw/CP7fZPI2C48=;
 b=Klc2p11LSccIT3/b/KHREmqPPcHeYHI1w9YBN0FJGcBpe8NCN3d6+qejsVWAMF9uVH
 coM81K7VVPGNFePte5bYgZvPWpmKJ194qCa468wgCzvDxXh/DySlWROLl3CCnXwDXbLh
 uuVpDqdF9t5FO671euBzwo3xWseczzJG9BAYTp8wf1yy4aRqBO+FBTgndS7HL6/eL91w
 vIuJ2vxTVbQhnQK15Xrx1vPOxWPea49CNYlqirYwAttdLxvjIWdXdmob72WCgr22b2CG
 o4GlCiMSyjZsHMJBIUdHxuVHNhzuWEVP9YGg1I2xiX0079edHlzGgXF2RPhtZQsfM6H4
 tLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763044440; x=1763649240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qv/JrdhbRZlCEd1ubK+jM9jWPBpAjvw/CP7fZPI2C48=;
 b=Hqs65nEFb0M6WKvM6okyo/I9Zy8pCO2PVJ1oAi2eVBA4Pw2JVetHHMpBqyqZ7HGrb2
 DrCWQWYjXkE8kADZRtFMBSnLagEouDSRhXc3DZMXRaDRRfamIBloaxirPgQuQbg+5kDx
 Ram7fUZJbM1vZV4VALbjalYpVtefmh2oFNtkh37f+iD0e06si3fxsKcb+UVPwuK55Ivh
 /hvpHWrwXPlLNYtSE9ZioO5BRIykqKs4ca4CH9oAAXn+mdQAfYib5WG8TEXZgT10O0Ua
 TxRmP5eNx619vYsIHPA9hFdmg/GtpSfrLwfXD4bFIQNI+8oFahbYUU0t42mcxV1DAOY6
 kcPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwjJPBhXDqy352vTBWthwFcRQvH2EWLtgafJn6tm0pOMzDflkQQA9Wp1TOVK/1pHetDjVJsnmJios=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM02XplKGriLBcAdJSXP1hq3jp+wiuC6sD20u1k83vaYbTFG0k
 Y7GsS1+76p7E6nXnzDx/LsvsgkUtQ8X55zHOJG3kHcKv4pYuWPVEIKHcQznG2Q6Unlh0CWChJms
 ZxkeUR2AAiub3Ix6blCHpZKqsfnZnOSvoiZxzQsI=
X-Gm-Gg: ASbGncul9FAK7+LZk1Qc235YtDakAXOmXJUN9n4km7ZAhJwkDl3F8ySNrxcUFZpn0YN
 1RWqblwq3QOi1wNPtkEJcfOTLaKUp9NFOZNCqNVg9aHlMgBguxbn496wlrl9yJrJl2coR1Ka44U
 VqGyQMhP8IH338kFn+cGbB8I2rN5ZaFGCuZBDeQE5J8i7TR2bWHyEX5FAye679O5wcvXpje2aR1
 XZOLwnGFcO9AQYC0cL+5oB1ns2GBJFykLNJ4c215HV9nMGBOzw3vzmvLj4=
X-Google-Smtp-Source: AGHT+IFxA8P7U0p67nbntMP+AJ/1Ive98feU9XP0hJpbEsfyGiZ2cTCG1H/uw7OcCvUbNCvlNz2awdpPad36suAN8GQ=
X-Received: by 2002:a05:6102:38ce:b0:5db:1e4e:6b04 with SMTP id
 ada2fe7eead31-5dfb40e9347mr1377780137.18.1763044439813; Thu, 13 Nov 2025
 06:33:59 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
 <CAAQKjZNCpK4rq6DFUtiQ2rxCeb_34Mp54quVto+9LRJMH3=ZhQ@mail.gmail.com>
 <000101dc5380$e33e1c10$a9ba5430$@samsung.com>
In-Reply-To: <000101dc5380$e33e1c10$a9ba5430$@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 13 Nov 2025 23:33:21 +0900
X-Gm-Features: AWmQ_blbp07LBsfmhZq6Hj3qdkeaTe0fO1yFd3NukemDqBNNd4mt1U2vsVx-eHg
Message-ID: <CAAQKjZM23M3hr6Xqk6_f9whWw+CQB5oyvs=JEkBQPp2H3-ocag@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and
 drop manual cleanup
To: hy_fifty.lee@samsung.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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

2025=EB=85=84 11=EC=9B=94 12=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 12:03,=
 <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > -----Original Message-----
> > From: Inki Dae <daeinki@gmail.com>
> > Sent: Monday, November 10, 2025 2:22 PM
> > To: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> > <kyungmin.park@samsung.com>; David Airlie <airlied@gmail.com>; Simona
> > Vetter <simona@ffwll.ch>; Krzysztof Kozlowski <krzk@kernel.org>; Alim
> > Akhtar <alim.akhtar@samsung.com>; dri-devel@lists.freedesktop.org; linu=
x-
> > arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linu=
x-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init()
> > and drop manual cleanup
> >
> > 2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:5=
4, Hoyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91
> > =EC=84=B1:
> > >
> > > Switch mode-config initialization to drmm_mode_config_init() so that
> > > the lifetime is tied to drm_device. Remove explicit
> > > drm_mode_config_cleanup() from error and unbind paths since cleanup i=
s
> > now managed by DRM.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > index 6cc7bf77bcac..1aea71778ab1 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > @@ -257,7 +257,7 @@ static int exynos_drm_bind(struct device *dev)
> > >         dev_set_drvdata(dev, drm);
> > >         drm->dev_private =3D (void *)private;
> > >
> > > -       drm_mode_config_init(drm);
> > > +       drmm_mode_config_init(drm);
> > >
> > >         exynos_drm_mode_config_init(drm);
> > >
> > > @@ -297,7 +297,6 @@ static int exynos_drm_bind(struct device *dev)
> > >  err_unbind_all:
> > >         component_unbind_all(drm->dev, drm);
> > >  err_mode_config_cleanup:
> > > -       drm_mode_config_cleanup(drm);
> >
> > In the current implementation, there is a potential dereference issue
> > because the private object may be freed before to_dma_dev(dev) is calle=
d.
> > When drmm_mode_config_init() is invoked, it registers
> > drm_mode_config_cleanup() as a managed action. This means that the clea=
nup
> > function will be automatically executed later when
> > drm_dev_put() is called.
> >
> > The problem arises when drm_dev_put() is called without explicitly
> > invoking drm_mode_config_cleanup() first, as in the original code. In t=
hat
> > case, the managed cleanup is performed later, which allows
> > to_dma_dev(dev) to be called after the private object has already been
> > released.
> >
> > For reference, the following sequence may occur internally when
> > drm_mode_config_cleanup() is executed:
> > 1. drm_mode_config_cleanup() is called.
> > 2. During the cleanup of FBs, planes, CRTCs, encoders, and connectors,
> > framebuffers or GEM objects may be released.
> > 3. At this point, Exynos-specific code could invoke to_dma_dev(dev).
> >
> > Therefore, the private object must remain valid until
> > drm_mode_config_cleanup() completes.
> > It would be safer to adjust the code so that kfree(private) is performe=
d
> > after drm_dev_put(drm) to ensure the private data remains available dur=
ing
> > cleanup.
> >
> > Thanks,
> > Inki Dae
> >
> > >         exynos_drm_cleanup_dma(drm);
> > >         kfree(private);
> > >         dev_set_drvdata(dev, NULL);
> > > @@ -317,7 +316,6 @@ static void exynos_drm_unbind(struct device *dev)
> > >         drm_atomic_helper_shutdown(drm);
> > >
> > >         component_unbind_all(drm->dev, drm);
> > > -       drm_mode_config_cleanup(drm);
> >
> > Ditto.
> >
> > >         exynos_drm_cleanup_dma(drm);
> > >
> > >         kfree(drm->dev_private);
> > > --
> > > 2.34.1
> > >
> > >
>
> Hi, Inki
> Thanks for the review and for pointing out the to_dma_dev() path
>
> If I understand you correctly, fine with using DRMM, but kfree(priv) shou=
ld occur after drm_dev_put(drm)
> That would mean releasing the drm_device first and freeing dev_private af=
terwards.
> Of course, we will also need to adjust the probe() error-unwind (err_free=
) order accordingly.
> Do you anticipate any side effects from this ordering change? I=E2=80=99d=
 appreciate your thoughts.
>

Yes, that is correct. Also, changing the order of the cleanup steps
should not introduce any issues, because this simply restores the
original sequence that the code previously followed. In fact, the
current patch is, strictly speaking, altering the existing behavior I
think.

Thanks,
Inki Dae

> BRs,
> Hoyoung Lee
>
>
