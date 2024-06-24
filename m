Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754349151CA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1CE10E4B1;
	Mon, 24 Jun 2024 15:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JhU9Fpqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2DE10E4B2;
 Mon, 24 Jun 2024 15:15:55 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-48f37e28bdaso1006040137.0; 
 Mon, 24 Jun 2024 08:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719242154; x=1719846954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6XxZIGYzmHYKk5hBAwXmEAGY4eTfn+xjzR45XBe2AU=;
 b=JhU9FpqtIDm22zP/Cu7d8BFRgeKBCUkwqpHMeJZkxJrULV6YZMVRMHjMYu6IXXazfW
 qQHHXdjVmpunHzy/L8PyF4L4UQjYQIK0JgsJqFuDnPKROTcIRKnVItSS6DHllVONso9h
 ozAnCwZMlXIOAd5XXZbm5O42DeXneqK58fB/G3IRaZEDiLXeKzFfQEauf2xwrVdqXISL
 ljiAoe/4tTGLF0WDJHIIJaWjTXLWhPdCa9W2ZRsMdEf9lKFiODP1X0i+TqwI9n3Wtbra
 RTopRz5X2uEemDGbmGx/EBCrXup6CNcQuJKRLRwEh/sr1yzoz25uaHw5G5uCcrJ1ncAL
 UMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719242154; x=1719846954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6XxZIGYzmHYKk5hBAwXmEAGY4eTfn+xjzR45XBe2AU=;
 b=Vs0tYUzFFR2mqapaLm3jbrmN64BgfJUVp1pfL8dOfxT9APLkVFM1pJIVdjOJgEqQ+R
 5pHYX6KCO/EivQBbRCI+B3Y0uHTyIzoTXNBx7uoqRcJM0bEnrRCqKJoO3sgCAizdYoXD
 P9H6GjyyiXk53efhwJJEtVmbmy9O4SkFoTnyNJvMAH2JI/XfQSDwlCik3SFQbeaqfnqj
 sRmfa5ETll/VsPm6CVz0I/t9OkNnGXElph65iAlzeQCvAxPLsWeWrn5h113ADbFlRFgK
 b2OyghYK2Ot0hxHJkArmnpkF+b/AxzoS1bebP4ITwzy2FhdKenB5UEmZlRYg4wiPg6Jy
 5z6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgAIDoERbvxnT+bKtrOUzEFZkwyq2TwmJbas7bKwtMOCI59RQ2ZTfWuk2hc1p0KlWBIrD82PdmrGL8j1/TgqSDPofF4QpvFs/I9hKyYHeeKPbQ0lP80HkrTGObWhKie+msgW0VINR+o+PodovdFA==
X-Gm-Message-State: AOJu0Yzte2lu89nCVo39rcg6I9kIxP2toHXMc7Cr3HRQK8VAenZ6voib
 9cAHd8EFoonr4m6QIIvRPbx1z6Ap6W+iQchQzCcc9IpJzp6FYfmE0J/3MGSb/SQcRG60qTvSLjN
 /6hkmj4TAcWVKl091wwhU8Eo4e0s=
X-Google-Smtp-Source: AGHT+IFB5QsNgsJSFPtcEP92eW7cfFDedCMXa/ggdy5azjcQ/5i7MbFikgpASl1lTkYIB96qa7Vt9ue8yLqubTjHixg=
X-Received: by 2002:a05:6122:d9a:b0:4ef:6c71:9a29 with SMTP id
 71dfb90a1353d-4ef6d8af4e0mr3333199e0c.13.1719242153640; Mon, 24 Jun 2024
 08:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240621141544.19817-1-wuhoipok@gmail.com>
 <dd5ec9e5-14c1-4bd3-b210-fdba2766dfd7@suse.de>
In-Reply-To: <dd5ec9e5-14c1-4bd3-b210-fdba2766dfd7@suse.de>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Mon, 24 Jun 2024 11:15:39 -0400
Message-ID: <CANyH0kB4ECdjwNm=X6iAQkc1_+U+gdwumtqqeRtKPmvTb6G=cA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] drm/radeon: remove load callback
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

Thank you. I have resubmitted with a cover letter.

On Mon, Jun 24, 2024 at 3:22=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 21.06.24 um 16:15 schrieb Wu Hoi Pok:
> > This is "drm/radeon: remove load callback" v2, the only changes
> > were made are adding "ddev->dev_private =3D rdev;", right after
> > the allocation of "struct radeon_device". Patch v2 2-7 mostly
> > describes simple "rdev->ddev" to "rdev_to_drm(rdev)" to suit
> > Patch v2 1/7.
> >
> > Please be aware that these 7 patches depends on each other.
>
> Thanks for the update. In the current form, it's not reviewable, or
> trackable in patchwork
> (https://patchwork.freedesktop.org/project/dri-devel/series/).
>
> For sending patch series, please use 'git send-email' with the
> --cover-letter option. This will provide you with a single email for
> describing the patchset as a whole, and create all actual patch mails as
> replies to the cover letter.
>
> Maybe test this first with your local email account and then please
> resubmit to the mailing list.
>
> Best regards
> Thomas
>
> >
> > Thank you.
> >
> > Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
> > ---
> >   drivers/gpu/drm/radeon/radeon.h     | 11 ++++++++---
> >   drivers/gpu/drm/radeon/radeon_drv.c | 27 ++++++++++++++++++---------
> >   drivers/gpu/drm/radeon/radeon_drv.h |  1 -
> >   drivers/gpu/drm/radeon/radeon_kms.c | 18 ++++++------------
> >   4 files changed, 32 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/r=
adeon.h
> > index 0999c8eaae94..69bb30ced189 100644
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
> > @@ -2440,10 +2440,13 @@ struct radeon_device {
> >       u64 gart_pin_size;
> >   };
> >
> > +static inline struct drm_device *rdev_to_drm(struct radeon_device *rde=
v)
> > +{
> > +     return &rdev->ddev;
> > +}
> > +
> >   bool radeon_is_px(struct drm_device *dev);
> >   int radeon_device_init(struct radeon_device *rdev,
> > -                    struct drm_device *ddev,
> > -                    struct pci_dev *pdev,
> >                      uint32_t flags);
> >   void radeon_device_fini(struct radeon_device *rdev);
> >   int radeon_gpu_wait_for_idle(struct radeon_device *rdev);
> > @@ -2818,6 +2821,8 @@ struct radeon_device *radeon_get_rdev(struct ttm_=
device *bdev);
> >
> >   /* KMS */
> >
> > +int radeon_driver_load_kms(struct radeon_device *dev, unsigned long fl=
ags);
> > +
> >   u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
> >   int radeon_enable_vblank_kms(struct drm_crtc *crtc);
> >   void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> > diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/rade=
on/radeon_drv.c
> > index 7bf08164140e..ae9cadceba83 100644
> > --- a/drivers/gpu/drm/radeon/radeon_drv.c
> > +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> > @@ -259,7 +259,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
> >                           const struct pci_device_id *ent)
> >   {
> >       unsigned long flags =3D 0;
> > -     struct drm_device *dev;
> > +     struct drm_device *ddev;
> > +     struct radeon_device *rdev;
> >       int ret;
> >
> >       if (!ent)
> > @@ -300,28 +301,37 @@ static int radeon_pci_probe(struct pci_dev *pdev,
> >       if (ret)
> >               return ret;
> >
> > -     dev =3D drm_dev_alloc(&kms_driver, &pdev->dev);
> > -     if (IS_ERR(dev))
> > -             return PTR_ERR(dev);
> > +     rdev =3D devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev=
), ddev);
> > +     if (IS_ERR(rdev))
> > +             return PTR_ERR(rdev);
> > +
> > +     rdev->dev  =3D &pdev->dev;
> > +     rdev->pdev =3D pdev;
> > +     ddev =3D rdev_to_drm(rdev);
> > +     ddev->dev_private =3D rdev;
> >
> >       ret =3D pci_enable_device(pdev);
> >       if (ret)
> >               goto err_free;
> >
> > -     pci_set_drvdata(pdev, dev);
> > +     pci_set_drvdata(pdev, ddev);
> > +
> > +     ret =3D radeon_driver_load_kms(rdev, flags);
> > +     if (ret)
> > +             goto err_agp;
> >
> > -     ret =3D drm_dev_register(dev, ent->driver_data);
> > +     ret =3D drm_dev_register(ddev, flags);
> >       if (ret)
> >               goto err_agp;
> >
> > -     radeon_fbdev_setup(dev->dev_private);
> > +     radeon_fbdev_setup(ddev->dev_private);
> >
> >       return 0;
> >
> >   err_agp:
> >       pci_disable_device(pdev);
> >   err_free:
> > -     drm_dev_put(dev);
> > +     drm_dev_put(ddev);
> >       return ret;
> >   }
> >
> > @@ -569,7 +579,6 @@ static const struct drm_ioctl_desc radeon_ioctls_km=
s[] =3D {
> >   static const struct drm_driver kms_driver =3D {
> >       .driver_features =3D
> >           DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
> > -     .load =3D radeon_driver_load_kms,
> >       .open =3D radeon_driver_open_kms,
> >       .postclose =3D radeon_driver_postclose_kms,
> >       .unload =3D radeon_driver_unload_kms,
> > diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/rade=
on/radeon_drv.h
> > index 02a65971d140..6c1eb75a951b 100644
> > --- a/drivers/gpu/drm/radeon/radeon_drv.h
> > +++ b/drivers/gpu/drm/radeon/radeon_drv.h
> > @@ -117,7 +117,6 @@
> >   long radeon_drm_ioctl(struct file *filp,
> >                     unsigned int cmd, unsigned long arg);
> >
> > -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags=
);
> >   void radeon_driver_unload_kms(struct drm_device *dev);
> >   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *f=
ile_priv);
> >   void radeon_driver_postclose_kms(struct drm_device *dev,
> > diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/rade=
on/radeon_kms.c
> > index a16590c6247f..d2df194393af 100644
> > --- a/drivers/gpu/drm/radeon/radeon_kms.c
> > +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> > @@ -91,7 +91,7 @@ void radeon_driver_unload_kms(struct drm_device *dev)
> >   /**
> >    * radeon_driver_load_kms - Main load function for KMS.
> >    *
> > - * @dev: drm dev pointer
> > + * @rdev: radeon dev pointer
> >    * @flags: device flags
> >    *
> >    * This is the main load function for KMS (all asics).
> > @@ -101,24 +101,18 @@ void radeon_driver_unload_kms(struct drm_device *=
dev)
> >    * (crtcs, encoders, hotplug detect, etc.).
> >    * Returns 0 on success, error on failure.
> >    */
> > -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags=
)
> > +int radeon_driver_load_kms(struct radeon_device *rdev, unsigned long f=
lags)
> >   {
> > -     struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> > -     struct radeon_device *rdev;
> > +     struct pci_dev *pdev =3D rdev->pdev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
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
> >
> >       if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
> > -             rdev->agp =3D radeon_agp_head_init(dev);
> > +             rdev->agp =3D radeon_agp_head_init(rdev_to_drm(rdev));
> >       if (rdev->agp) {
> >               rdev->agp->agp_mtrr =3D arch_phys_wc_add(
> >                       rdev->agp->agp_info.aper_base,
> > @@ -147,7 +141,7 @@ int radeon_driver_load_kms(struct drm_device *dev, =
unsigned long flags)
> >        * properly initialize the GPU MC controller and permit
> >        * VRAM allocation
> >        */
> > -     r =3D radeon_device_init(rdev, dev, pdev, flags);
> > +     r =3D radeon_device_init(rdev, flags);
> >       if (r) {
> >               dev_err(dev->dev, "Fatal error during GPU init\n");
> >               goto out;
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
