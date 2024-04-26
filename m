Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3FA8B2FC4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 07:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDD711AA96;
	Fri, 26 Apr 2024 05:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="wfl7a+2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274B711AA95
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 05:36:22 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6184acc1ef3so17211287b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 22:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1714109782;
 x=1714714582; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fun5634FSrpPfbO99ypFnP0OQqLiNPobqGLz/86CEto=;
 b=wfl7a+2FLOAUEkAzl6PPdKLD7XRkwa1NH/UwQ3P7559dFbvOYuaxEGSNVHOxPJq2Ru
 XviytFfijKYzhDqCBtVEzT5FJo0KwJkKBaKnM0cKNCPWKdvnATR4kGb2NXLffwGxQSOB
 XapXyMOdfo8N5FU1gvZERRFZ4xehlAP47GYnK4MxtFgH/ALteSy+3sNYDve3nEz4voGJ
 HTSQTX6z5Ytmj4cZ3dip+z/BkuUmL8APGg0toCjFhSdHKlcMOCfyhV9rPzMU3z07UJpM
 V73WeP2job+u2LJb/+Bzphn4KxIlFinoxFzchqDlbQq+jlgFZNBxjsbnrFC3bsZNIkcj
 Jklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714109782; x=1714714582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fun5634FSrpPfbO99ypFnP0OQqLiNPobqGLz/86CEto=;
 b=GhkT2etnOC3iTqKnH6/qfylqDI80az36Fpv011TmwEW0lcCUw5OXt+5e7kCSYY5YU/
 +FDgVkOJ6Y3HNp4QqBpLbn9xAsNHpa/SKHpE1RRGHEcbAZzIcyAfpi2vScfLuESG2Idl
 03j1+NwRKLlzirsz08afgufDqZmsOQcSPVGa9b392W650fJYjo0q5fWRWbc/+3N7jFhh
 Q7XbyW3mb1RPRxadAImG1/oCrIMKTeo7opoVXDnoPwqLQfe03NUIvPZ2lQ8NhrQJHLwg
 KmG6ab31WfTq0OYRk8IpnM8saygD5Hltw2dbheA0XO9RqgIgL7hC1EZcsqHj1JYMsz3e
 OYsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWzRrPuc6O++3ztCmUbUuMsvCXFAnpUxSIBd1K/GMwXFC/1lcS6f1PHriv/dtlXBpBUIwFcgJoOZ/iN4OgoJaFvwhpGZUVQ7Z4A2n2YkSJ
X-Gm-Message-State: AOJu0Yx6zvxBfSxTHa1hRijd17x/GvHexfEhbd8rLILxbqPBfcLsQ7ZJ
 nnM066BvSDKfaNiAZ71bgtTrbZxfNqhYf0FrgpOuBxTWo2jmgPXBEtYDl8z8NIst/H0ItEclrPi
 DPSVLnQ==
X-Google-Smtp-Source: AGHT+IF3ls/mjCRJ30I66R83iw73rQNPxACKPDmcKyfaRu51lO5eg+QzbKr8v8zOwFBqcUyiRv8DvQ==
X-Received: by 2002:a05:690c:6485:b0:615:16a1:4a04 with SMTP id
 hs5-20020a05690c648500b0061516a14a04mr2175073ywb.31.1714109781693; 
 Thu, 25 Apr 2024 22:36:21 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 a6-20020a81bc06000000b0061440b93ce5sm3873391ywi.37.2024.04.25.22.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 22:36:21 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-de477949644so1938510276.1; 
 Thu, 25 Apr 2024 22:36:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+s2dMrzom5GlFYbiyB0S8csAMTRY5Pg0XQHDSk3pOi7obTiUPm81bNXxWQbtc1kjlblbB/YH+xd4/R2JfI3UZGNvAwisUaLD9G9TeiUARes8+oNgwKlzLXZBfOoJpooTfAUihHkPem/SsRNHwRg==
X-Received: by 2002:a25:b31c:0:b0:de4:6c97:2156 with SMTP id
 l28-20020a25b31c000000b00de46c972156mr2009606ybj.39.1714109780639; Thu, 25
 Apr 2024 22:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <CAH9NwWdzeF0=USW_bckDhPSUrgTfnFuAq44m1OhEmTL4JnBzLg@mail.gmail.com>
In-Reply-To: <CAH9NwWdzeF0=USW_bckDhPSUrgTfnFuAq44m1OhEmTL4JnBzLg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 26 Apr 2024 07:36:09 +0200
X-Gmail-Original-Message-ID: <CAAObsKBjytOtVrDL5TKWqrBO3OuhQtRVk5Mn3MA801xyRczo+w@mail.gmail.com>
Message-ID: <CAAObsKBjytOtVrDL5TKWqrBO3OuhQtRVk5Mn3MA801xyRczo+w@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Thu, Apr 25, 2024 at 1:32=E2=80=AFPM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> Hi Tomeu,
>
> >
> > If we expose a render node for NPUs without rendering capabilities, the
> > userspace stack will offer it to compositors and applications for
> > rendering, which of course won't work.
> >
> > Userspace is probably right in not questioning whether a render node
> > might not be capable of supporting rendering, so change it in the kerne=
l
> > instead by exposing a /dev/accel node.
> >
> > Before we bring the device up we don't know whether it is capable of
> > rendering or not (depends on the features of its blocks), so first try
> > to probe a rendering node, and if we find out that there is no renderin=
g
> > hardware, abort and retry with an accel node.
> >
>
> I really love this idea of moving away from a render node. What needs to =
be done
> on the userspace side?

Doesn't seem that bad, here is a proof of concept:

https://gitlab.freedesktop.org/tomeu/mesa/-/tree/teflon-accel

Thanks for taking a look.

Tomeu

> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
>
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 46 ++++++++++++++++++++++-----
> >  1 file changed, 38 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/et=
naviv/etnaviv_drv.c
> > index 6500f3999c5f..8e7dd23115f4 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/uaccess.h>
> >
> > +#include <drm/drm_accel.h>
> >  #include <drm/drm_debugfs.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_file.h>
> > @@ -488,10 +489,10 @@ static const struct drm_ioctl_desc etnaviv_ioctls=
[] =3D {
> >         ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
> >  };
> >
> > -DEFINE_DRM_GEM_FOPS(fops);
> > +DEFINE_DRM_GEM_FOPS(render_fops);
> > +DEFINE_DRM_ACCEL_FOPS(accel_fops);
> >
> > -static const struct drm_driver etnaviv_drm_driver =3D {
> > -       .driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
> > +static struct drm_driver etnaviv_drm_driver =3D {
> >         .open               =3D etnaviv_open,
> >         .postclose           =3D etnaviv_postclose,
> >         .gem_prime_import_sg_table =3D etnaviv_gem_prime_import_sg_tabl=
e,
> > @@ -500,7 +501,6 @@ static const struct drm_driver etnaviv_drm_driver =
=3D {
> >  #endif
> >         .ioctls             =3D etnaviv_ioctls,
> >         .num_ioctls         =3D DRM_ETNAVIV_NUM_IOCTLS,
> > -       .fops               =3D &fops,
> >         .name               =3D "etnaviv",
> >         .desc               =3D "etnaviv DRM",
> >         .date               =3D "20151214",
> > @@ -508,15 +508,20 @@ static const struct drm_driver etnaviv_drm_driver=
 =3D {
> >         .minor              =3D 4,
> >  };
> >
> > -/*
> > - * Platform driver:
> > - */
> > -static int etnaviv_bind(struct device *dev)
> > +static int etnaviv_bind_with_type(struct device *dev, u32 type)
> >  {
> >         struct etnaviv_drm_private *priv;
> >         struct drm_device *drm;
> > +       bool is_compute_only =3D true;
> >         int ret;
> >
> > +       etnaviv_drm_driver.driver_features =3D DRIVER_GEM | type;
> > +
> > +       if (type =3D=3D DRIVER_RENDER)
> > +               etnaviv_drm_driver.fops =3D &render_fops;
> > +       else
> > +               etnaviv_drm_driver.fops =3D &accel_fops;
> > +
> >         drm =3D drm_dev_alloc(&etnaviv_drm_driver, dev);
> >         if (IS_ERR(drm))
> >                 return PTR_ERR(drm);
> > @@ -553,6 +558,18 @@ static int etnaviv_bind(struct device *dev)
> >
> >         load_gpu(drm);
> >
> > +       for (unsigned int i =3D 0; i < ETNA_MAX_PIPES; i++) {
> > +               struct etnaviv_gpu *g =3D priv->gpu[i];
> > +
> > +               if (g && (g->identity.minor_features8 & chipMinorFeatur=
es8_COMPUTE_ONLY) =3D=3D 0)
> > +                       is_compute_only =3D false;
> > +       }
> > +
> > +       if (type =3D=3D DRIVER_RENDER && is_compute_only) {
> > +               ret =3D -EINVAL;
> > +               goto out_unbind;
> > +       }
> > +
> >         ret =3D drm_dev_register(drm, 0);
> >         if (ret)
> >                 goto out_unbind;
> > @@ -571,6 +588,19 @@ static int etnaviv_bind(struct device *dev)
> >         return ret;
> >  }
> >
> > +/*
> > + * Platform driver:
> > + */
> > +static int etnaviv_bind(struct device *dev)
> > +{
> > +       int ret =3D etnaviv_bind_with_type(dev, DRIVER_RENDER);
> > +
> > +       if (ret =3D=3D -EINVAL)
> > +               return etnaviv_bind_with_type(dev, DRIVER_COMPUTE_ACCEL=
);
> > +
> > +       return ret;
> > +}
> > +
> >  static void etnaviv_unbind(struct device *dev)
> >  {
> >         struct drm_device *drm =3D dev_get_drvdata(dev);
> > --
> > 2.44.0
> >
>
>
> --
> greets
> --
> Christian Gmeiner, MSc
>
> https://christian-gmeiner.info/privacypolicy
