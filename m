Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9292AA45
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 22:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E9710E405;
	Mon,  8 Jul 2024 20:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VkZgCMuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DA110E2FC;
 Mon,  8 Jul 2024 20:04:38 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7163489149eso3201395a12.1; 
 Mon, 08 Jul 2024 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720469078; x=1721073878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4W49Ts2h7IXoKSnNhKTlkJLMbVTeV+7YxvdVcGt2FXk=;
 b=VkZgCMuUTfp7pqGPHW65KFNBjN/5XfAraj/oQn/1wfGZvPU+VN/MXvAVBBmLeHOUQf
 n+l9RQDkUInSFwt3OmakGBb2304gWPS1rQ15fjpv2iBSpoY5rpS49/+2Ya9QyH+emFfW
 wDOwe08SZzpr5AFCvDNb5yQPEJv6u/vONxnAFO4YuYf+Ncvzzxz9cORf4Lqd12qI282A
 65bhyIk2Tt58gjHd8KufQA717pnK5nerqaDkBkqRmeYutPkAEFrfEV5Uw4raHp9UYbEh
 o6+Gq8q5gtswwaRjHWjTeiwb2wQ3IhSI5WoeUubGw7cCaSjhtJVwHa2vromgbDB2bGFe
 /vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720469078; x=1721073878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4W49Ts2h7IXoKSnNhKTlkJLMbVTeV+7YxvdVcGt2FXk=;
 b=Y/ff9CMvINnj+0FEm+w2t/tmkd0AOXytz5Pp2p+vEzhibUNh07Vt1TIOR90KlJFf5E
 rOiWlxD5wOlZBrcTZNcEhp7OpTYzmjtNULeslKkhQ47FAU1X2X0EDV2ZLxDdduMOq9fZ
 nqbR0KlhXwRrFvzcjEaY8tN8eTXeFDdnuL7dVinXGSZPJYs2XAnXfrgzJ0PCI4/55J9J
 H+sJisDGRWEEaXNpYmyK91Ln9uwy9PNCu0x/o8XUmc6xRdlHUtQG0uKadJ3QGp5P+/ZD
 aG3L3uY6kjv4TJGF4vA0aKo1tI8XaKnWC4ohI7Y3FOMboahInAzPa7WTc/7THvVFW6qB
 Cb3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXLvSORDwVdYu6WloU05Do1ex9bJ7mDMVWo+zfS5WCcERTzxVy8sqP+GhEsjL06r6BVfogAhIzBM0EQPkUvizTt2+lYeLnKzkwW8tDlCLdxx0ROZA0aqsrpMevJMrSdQd5M6K1queyYf9P6inhig==
X-Gm-Message-State: AOJu0YzRAh2nAYlXKpxnPVFchU2zLLiCqv1l9WcJfiAPP+CLyAOnlXX2
 LlhJykyEeX1ByJqSQLzgJb5XlfxULJpXsXSmQoxI/q+SPjWycKlmg1/K0wNK/qGMBj3xgBZEyZe
 f4i2psXTOqAxHUAxYk3U3geY/NsLCxA==
X-Google-Smtp-Source: AGHT+IG+RG9sKH282j1PUR1uFtwEkAUIQDyBg0mzm5Zr7D1Y3mFiNCPk0xP+P9igu7ELI0aPhLclO7bBMc3MaJ4qawk=
X-Received: by 2002:a17:90b:1fcd:b0:2c8:db8b:7247 with SMTP id
 98e67ed59e1d1-2ca35be7c77mr668245a91.9.1720469078305; Mon, 08 Jul 2024
 13:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240630165949.117634-1-wuhoipok@gmail.com>
 <20240630165949.117634-7-wuhoipok@gmail.com>
 <3ecb6fb4-ff60-4c49-8199-b76b4f297ecf@suse.de>
In-Reply-To: <3ecb6fb4-ff60-4c49-8199-b76b4f297ecf@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2024 16:04:26 -0400
Message-ID: <CADnq5_NNhVZ481RJMcAchxh-66vCOqcp_kOx9HLO2g2agyWOKA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/radeon: change drm_dev_alloc to
 devm_drm_dev_alloc
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Wu Hoi Pok <wuhoipok@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Applied the series.  Thanks!

Alex

On Wed, Jul 3, 2024 at 4:55=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
>
>
> Am 30.06.24 um 18:59 schrieb Wu Hoi Pok:
> > "drm_dev_alloc" is deprecated, in order to use the newer "devm_drm_dev_=
alloc",
> > the "drm_device" is stored inside "radeon_device", by changing "rdev_to=
_drm(rdev)"
> > other functions still gain access to the member "drm_device". Also, "de=
vm_drm_dev_alloc"
> > is now allocating "radeon_device", allocation inside "radeon_driver_loa=
d_kms" has to be
> > removed.
> >
> > In "radeon_device_init", it originally assigned "rdev->dev" etc. Howeve=
r it is already
> > done right after "devm_drm_dev_alloc" as you can see down below. It is =
better remove them.
> >
> > Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon.h        |  4 ++--
> >   drivers/gpu/drm/radeon/radeon_device.c |  3 ---
> >   drivers/gpu/drm/radeon/radeon_drv.c    | 12 +++++++++---
> >   drivers/gpu/drm/radeon/radeon_kms.c    |  8 +-------
> >   4 files changed, 12 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/r=
adeon.h
> > index ae35c102a487..fd8a4513025f 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct radeon_devic=
e*, uint32_t, uint32_t);
> >
> >   struct radeon_device {
> >       struct device                   *dev;
> > -     struct drm_device               *ddev;
> > +     struct drm_device               ddev;
> >       struct pci_dev                  *pdev;
> >   #ifdef __alpha__
> >       struct pci_controller           *hose;
> > @@ -2478,7 +2478,7 @@ void cik_mm_wdoorbell(struct radeon_device *rdev,=
 u32 index, u32 v);
> >
> >   static inline struct drm_device *rdev_to_drm(struct radeon_device *rd=
ev)
> >   {
> > -     return rdev->ddev;
> > +     return &rdev->ddev;
> >   }
> >
> >   /*
> > diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/r=
adeon/radeon_device.c
> > index 32851632643d..554b236c2328 100644
> > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > @@ -1285,9 +1285,6 @@ int radeon_device_init(struct radeon_device *rdev=
,
> >       bool runtime =3D false;
> >
> >       rdev->shutdown =3D false;
> > -     rdev->dev =3D &pdev->dev;
> > -     rdev->ddev =3D ddev;
> > -     rdev->pdev =3D pdev;
> >       rdev->flags =3D flags;
> >       rdev->family =3D flags & RADEON_FAMILY_MASK;
> >       rdev->is_atom_bios =3D false;
> > diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/rade=
on/radeon_drv.c
> > index 7b8aa8406751..f36aa71c57c7 100644
> > --- a/drivers/gpu/drm/radeon/radeon_drv.c
> > +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> > @@ -260,6 +260,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
> >   {
> >       unsigned long flags =3D 0;
> >       struct drm_device *ddev;
> > +     struct radeon_device *rdev;
> >       int ret;
> >
> >       if (!ent)
> > @@ -300,9 +301,14 @@ static int radeon_pci_probe(struct pci_dev *pdev,
> >       if (ret)
> >               return ret;
> >
> > -     ddev =3D drm_dev_alloc(&kms_driver, &pdev->dev);
> > -     if (IS_ERR(ddev))
> > -             return PTR_ERR(ddev);
> > +     rdev =3D devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev=
), ddev);
> > +     if (IS_ERR(rdev))
> > +             return PTR_ERR(rdev);
> > +
> > +     rdev->dev =3D &pdev->dev;
> > +     rdev->pdev =3D pdev;
> > +     ddev =3D rdev_to_drm(rdev);
> > +     ddev->dev_private =3D rdev;
> >
> >       ret =3D pci_enable_device(pdev);
> >       if (ret)
> > diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/rade=
on/radeon_kms.c
> > index a16590c6247f..645e33bf7947 100644
> > --- a/drivers/gpu/drm/radeon/radeon_kms.c
> > +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> > @@ -104,15 +104,9 @@ void radeon_driver_unload_kms(struct drm_device *d=
ev)
> >   int radeon_driver_load_kms(struct drm_device *dev, unsigned long flag=
s)
> >   {
> >       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> > -     struct radeon_device *rdev;
> > +     struct radeon_device *rdev =3D dev->dev_private;
> >       int r, acpi_status;
> >
> > -     rdev =3D kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
> > -     if (rdev =3D=3D NULL) {
> > -             return -ENOMEM;
> > -     }
> > -     dev->dev_private =3D (void *)rdev;
> > -
> >   #ifdef __alpha__
> >       rdev->hose =3D pdev->sysdata;
> >   #endif
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
