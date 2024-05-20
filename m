Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D008C9A46
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 11:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D9610E579;
	Mon, 20 May 2024 09:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="Sp8OTkTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354B410E579
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:24:40 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-61e01d5ea74so22816797b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 02:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1716197079;
 x=1716801879; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTP4n3yhXyuKsvb8V/x0lwx2q2Y2QVn77xnb/moq0rY=;
 b=Sp8OTkTcR79Az0vOOJTYoKO5WnaAvLtIrY/wq5s3Un+2cG6+aCWBBIU+dFxEA34Aea
 kW0MmDCpLZUg3uQmqcerPxWNAtOfb/Xvv4Zsp2IZJGTLKB6B8cDjdSKbqLNpvQzMI1nk
 3Uf5uj9R3yq9UO1agN2AEs+1GockkrBMTO0cGNcdrNSLHS09pOoKFzJaxcknuULIkoBk
 SRKLzM8t0D3SiMwwO9Yb4vNDv+FBsQHqHQYyUZ6haRstb+gQ/zQIuTFlr87Gr77oPjJx
 613l3Vp3AGHYlkUyhL3/dZtGaal8k9VQL4UYB+kc0JdbOh34Hyx71230ph+P7Voyck40
 BWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716197079; x=1716801879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTP4n3yhXyuKsvb8V/x0lwx2q2Y2QVn77xnb/moq0rY=;
 b=OUqJxDvIsaHRzSynrZLntvLVliw9HHoOLaiItto0EmELU7bPWuNEnKNJzgUgZH41uw
 2IoNqSp57jJM2rCxO9xLNfF7pYin+A1UN3dPrB+P1Ehe+30lTSo+TD07lHqX4Rm1R+4Z
 vyiCAa+M1SlCd8RCUtPyRFlO7Fy/JO2ySCoxRnxwIOLp9Tz9LFB3s1sMMmCPaI8vRTan
 9d+K6e3TfwsBihBLlTfUKXOFQNFQLXdZ/xbaMEaz6ipAlpsuS0t2XWFBGpY+JopIDaG2
 W1wxDcNIbF5Os7ys4q8K2CVGU4I6WMhyAKaAV6SNWDYXix9kEj2kionjfuy10wCIjBSs
 tV2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS/6aszNW0JdeOam2EKC0J+F56uPHlRYVSmE5b2b5q0oGjObgqA2QYXioW5xSA1lYJqYUrddzXkdWQwTqHEGpmxLoYjWK7PKIgUFSZPQNb
X-Gm-Message-State: AOJu0YwxKepciqvK+6XuSqu9n27OWb2ulzgklZSz7fhtCYklPqB9Hc3e
 lt+PxxGK6zvzuevAWwXWn6eqTF+irCWRWm9hh1ToXOuybIyzrOWZf8+6aN8pfZs=
X-Google-Smtp-Source: AGHT+IFE2SMCvN2YPd4R6sUHGkGhI6S/QevN5IFPTiM3rXjefgKuyx/eE12+xBj9GKHICEhWePwwRQ==
X-Received: by 2002:a81:a092:0:b0:615:1dc3:9596 with SMTP id
 00721157ae682-622affa699fmr275934127b3.28.1716197078868; 
 Mon, 20 May 2024 02:24:38 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6209e26e94dsm47987357b3.69.2024.05.20.02.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 02:24:38 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-de604ca3cfcso1990845276.3; 
 Mon, 20 May 2024 02:24:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPRTE+CFtqBDLvLQLWRcMkuL0wzdcFZUZIN1gx5f9xttaCjSDftBsha58Ua+86kTi08wWx9+dYWZN0tTVHyTR7VjfipLRnQsTAFGgDbsBAfmvpu6ey0zxZZgFr1M36Ih/gWPXPqAdeRa9D9+9Cfg==
X-Received: by 2002:a25:84c4:0:b0:df3:88ee:799c with SMTP id
 3f1490d57ef6-df388ee85a4mr13302743276.7.1716197077534; Mon, 20 May 2024
 02:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
In-Reply-To: <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 20 May 2024 11:24:26 +0200
X-Gmail-Original-Message-ID: <CAAObsKDFDNV48XF1DobvVv04Q+DfBY=weBJPKbBewJPbPibRVA@mail.gmail.com>
Message-ID: <CAAObsKDFDNV48XF1DobvVv04Q+DfBY=weBJPKbBewJPbPibRVA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, May 10, 2024 at 10:34=E2=80=AFAM Lucas Stach <l.stach@pengutronix.d=
e> wrote:
>
> Hi Tomeu,
>
> Am Mittwoch, dem 24.04.2024 um 08:37 +0200 schrieb Tomeu Vizoso:
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
> I thought about this for a while. My opinion is that this is the wrong
> approach. We are adding another path to the kernel driver, potentially
> complicating the userspace side, as now the NPU backend needs to look
> for both render and accel nodes.

Forgot to mention in my earlier reply today that with the proposed
solution no changes are needed in the Gallium drivers, only in the
pipeloader component in Mesa, and in the Gallium frontends.

But those changes are needed anyway to support the upcoming
compute-only NPUs, such as Rockchip's.

These are the changes I needed to make to the userspace to go with
this kernel patch:

https://gitlab.freedesktop.org/tomeu/mesa/-/commit/6b0db4cce406c574d2b77102=
08df9c8bd1ab6345

Cheers,

Tomeu

> While currently accel and drm are
> pretty closely related and we can share most of the driver, it might
> still be a maintenance hassle in the long run.
>
> On the other hand we already have precedence of compute only DRM
> devices exposing a render node: there are AMD GPUs that don't expose a
> graphics queue and are thus not able to actually render graphics. Mesa
> already handles this in part via the PIPE_CAP_GRAPHICS and I think we
> should simply extend this to not offer a EGL display on screens without
> that capability.
>
> Regards,
> Lucas
>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
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
> >       ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
> >  };
> >
> > -DEFINE_DRM_GEM_FOPS(fops);
> > +DEFINE_DRM_GEM_FOPS(render_fops);
> > +DEFINE_DRM_ACCEL_FOPS(accel_fops);
> >
> > -static const struct drm_driver etnaviv_drm_driver =3D {
> > -     .driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
> > +static struct drm_driver etnaviv_drm_driver =3D {
> >       .open               =3D etnaviv_open,
> >       .postclose           =3D etnaviv_postclose,
> >       .gem_prime_import_sg_table =3D etnaviv_gem_prime_import_sg_table,
> > @@ -500,7 +501,6 @@ static const struct drm_driver etnaviv_drm_driver =
=3D {
> >  #endif
> >       .ioctls             =3D etnaviv_ioctls,
> >       .num_ioctls         =3D DRM_ETNAVIV_NUM_IOCTLS,
> > -     .fops               =3D &fops,
> >       .name               =3D "etnaviv",
> >       .desc               =3D "etnaviv DRM",
> >       .date               =3D "20151214",
> > @@ -508,15 +508,20 @@ static const struct drm_driver etnaviv_drm_driver=
 =3D {
> >       .minor              =3D 4,
> >  };
> >
> > -/*
> > - * Platform driver:
> > - */
> > -static int etnaviv_bind(struct device *dev)
> > +static int etnaviv_bind_with_type(struct device *dev, u32 type)
> >  {
> >       struct etnaviv_drm_private *priv;
> >       struct drm_device *drm;
> > +     bool is_compute_only =3D true;
> >       int ret;
> >
> > +     etnaviv_drm_driver.driver_features =3D DRIVER_GEM | type;
> > +
> > +     if (type =3D=3D DRIVER_RENDER)
> > +             etnaviv_drm_driver.fops =3D &render_fops;
> > +     else
> > +             etnaviv_drm_driver.fops =3D &accel_fops;
> > +
> >       drm =3D drm_dev_alloc(&etnaviv_drm_driver, dev);
> >       if (IS_ERR(drm))
> >               return PTR_ERR(drm);
> > @@ -553,6 +558,18 @@ static int etnaviv_bind(struct device *dev)
> >
> >       load_gpu(drm);
> >
> > +     for (unsigned int i =3D 0; i < ETNA_MAX_PIPES; i++) {
> > +             struct etnaviv_gpu *g =3D priv->gpu[i];
> > +
> > +             if (g && (g->identity.minor_features8 & chipMinorFeatures=
8_COMPUTE_ONLY) =3D=3D 0)
> > +                     is_compute_only =3D false;
> > +     }
> > +
> > +     if (type =3D=3D DRIVER_RENDER && is_compute_only) {
> > +             ret =3D -EINVAL;
> > +             goto out_unbind;
> > +     }
> > +
> >       ret =3D drm_dev_register(drm, 0);
> >       if (ret)
> >               goto out_unbind;
> > @@ -571,6 +588,19 @@ static int etnaviv_bind(struct device *dev)
> >       return ret;
> >  }
> >
> > +/*
> > + * Platform driver:
> > + */
> > +static int etnaviv_bind(struct device *dev)
> > +{
> > +     int ret =3D etnaviv_bind_with_type(dev, DRIVER_RENDER);
> > +
> > +     if (ret =3D=3D -EINVAL)
> > +             return etnaviv_bind_with_type(dev, DRIVER_COMPUTE_ACCEL);
> > +
> > +     return ret;
> > +}
> > +
> >  static void etnaviv_unbind(struct device *dev)
> >  {
> >       struct drm_device *drm =3D dev_get_drvdata(dev);
>
