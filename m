Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A986E1FE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474B310EDB4;
	Fri,  1 Mar 2024 13:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hRNmi28/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F1710EDB2;
 Fri,  1 Mar 2024 13:30:13 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5cedfc32250so1780729a12.0; 
 Fri, 01 Mar 2024 05:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709299813; x=1709904613; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HHckA948ZmaGkyMViYat8ojP3Slv0abWxwkHxBmiobA=;
 b=hRNmi28/MLPQFUGAWK618f0OcBaOTkLCSW3DX7184qyr010d1WKJtibAxD+UCBbPgD
 3ne+PPvIpq7289w+t7jtB4UdLgdi/hu4yCC/pybkcEO/NvqOnT6vAdOJSqb+vuSItjB2
 Nub01WRcsmhTa+k30ULTedZfJz9Rueg4H0PN/h43vrSnb42gKiJ+fvxgGCAp1gBwazp7
 g0K2h8CTUt4jCogQAKxd9RQYsd/7F72wtfw6qin55yUokGrI+cgqIlhXkHsnKxCP1jyy
 rdGnBo51ruKmUrBmZa6D8YL7uZdplSF2OACnKSkaNerQ2dOjYqvABsQPbsVw0slM+C5H
 zc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709299813; x=1709904613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HHckA948ZmaGkyMViYat8ojP3Slv0abWxwkHxBmiobA=;
 b=MABajPVDv17Xfk7MIxBxygeYJ57hMyr5zEaXQy/Sb+b45oAsT2IaRTf2S6AlMiF8Hp
 C3MA5Cp+4bpVFJNuT1wO46uHv8Qcu/BqaKsiTFzNEWcqVpSaPMtvQzNCOSGXKcgd3x8Z
 +UaFQEpz/lkWFCB9nPZfz1EF8w+8+ceKDR5L5RwbBaK4LaIvap3r+6KCyS3mzXcAvMzz
 BTnoJNGOJCp/XBbcaVbAg2lP1YKevHB5Wrc3GJ7RebldT2yXbc8JEqRy2q2dBOEUN7H1
 i5zkZ9AnYWytFYIQz843aLA4f1xCb/UwHyiHjRhB60arAvG0GMBAvWKQORn++JNd3/gn
 19Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS7DI9B3wbMt1LPeExzPujNwCKULOQHe+u8HqZVYkLIt60LzP95X3I6+MgvT4UmnAMMac/7KcS1jic1a9djlZNOvRXWTgi92AKXaF+e+L+lkDYvQqwvUaCidBu2CkRbVbpTjzKZjiURBif5Y9mQA==
X-Gm-Message-State: AOJu0YyiQ67mqfvm6tAUz1cKwdcwz4jqckTpPPAPpS5IgcOpacU5TY7Y
 TcEJT98WH8pgpqLW5g/wO5kcV/wfPxvL3+rQjj/H36m/NbE03Wm3WJ7QI6JWYw/TRjK8vOuyafq
 ekFbz2MWYiPdeMhWzMVKyuJLg/Gw=
X-Google-Smtp-Source: AGHT+IFjPiaNvT7Wmp/5bfnXXjIvPQWaa0U3BGSTH5v/V1+baHlSVrYfIKXQxO+DT5ucIicUHZPSIsOYQ1+VUT2jHHs=
X-Received: by 2002:a17:90a:4981:b0:29b:6a7:c52c with SMTP id
 d1-20020a17090a498100b0029b06a7c52cmr1588418pjh.38.1709299812985; Fri, 01 Mar
 2024 05:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20240229195532.7815-1-christian.gmeiner@gmail.com>
 <2d65be7ae251221bd7524871e0cbf4b22d16a9f9.camel@pengutronix.de>
In-Reply-To: <2d65be7ae251221bd7524871e0cbf4b22d16a9f9.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 1 Mar 2024 14:30:01 +0100
Message-ID: <CAH9NwWe3r1sbB7BqW1zmFGxjnzOOg8Z-LBzhAP7x_kq=o9T=0A@mail.gmail.com>
Subject: Re: [PATCH] etnaviv: Restore some id values
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Christian Gmeiner <cgmeiner@igalia.com>,
 stable@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Lucas,

>
> prefix for etnaviv kernel patches should be "drm/etnaviv: ..."

Ah yeah .. corrected in v2.

>
> Am Donnerstag, dem 29.02.2024 um 20:55 +0100 schrieb Christian Gmeiner:
> > From: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > The hwdb selection logic as a feature that allows it to mark some fields
> > as 'don't care'. If we match with such a field we memcpy(..)
> > the current etnaviv_chip_identity into ident.
> >
> > This step can overwrite some id values read from the GPU with the
> > 'don't care' value.
> >
> > Fix this issue by restoring the affected values after the memcpy(..).
> >
> > As this is crucial for user space to know when this feature works as
> > expected increment the minor version too.
>
> Uh, right. Lying to userspace about the GPU identity doesn't seem like
> a good idea.
>
> >
> > Fixes: 4078a1186dd3 ("drm/etnaviv: update hwdb selection logic")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c  |  2 +-
> >  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 14 ++++++++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > index 6228ce603248..9a2965741dab 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -494,7 +494,7 @@ static const struct drm_driver etnaviv_drm_driver = {
> >       .desc               = "etnaviv DRM",
> >       .date               = "20151214",
> >       .major              = 1,
> > -     .minor              = 3,
> > +     .minor              = 4,
> >  };
> >
> >  /*
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > index 67201242438b..1e38d66702f1 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > @@ -265,6 +265,9 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
> >  bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
> >  {
> >       struct etnaviv_chip_identity *ident = &gpu->identity;
> > +     const u32 product_id = ident->product_id;
> > +     const u32 customer_id = ident->customer_id;
> > +     const u32 eco_id = ident->eco_id;
> >       int i;
> >
> >       for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
> > @@ -278,6 +281,17 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
> >                        etnaviv_chip_identities[i].eco_id == ~0U)) {
> >                       memcpy(ident, &etnaviv_chip_identities[i],
> >                              sizeof(*ident));
> > +
> > +                     /* Restore some id values if ~0U aka 'don't care' is used. */
> > +                     if (etnaviv_chip_identities[i].product_id == ~0U)
>
> You can drop all those if clauses. Either the hwdb value is an exact
> match and the value is the same or it's the don't care value and you
> want to restore it, so a simple unconditional assignment would make
> this a bit more compact.
>

Makes sense - thanks for your review!

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
