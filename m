Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1453D9008
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF6B6E8B5;
	Wed, 28 Jul 2021 14:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D656E101;
 Wed, 28 Jul 2021 14:03:21 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id u10so3858291oiw.4;
 Wed, 28 Jul 2021 07:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e9/GCbd30HxZadU0KelTL6O/pNQdo9Gk9HhDwBhh/9Q=;
 b=EQLdPWtD6e0Ll6xZUmHCNVKlL2S/GfmfKfWlieIGSYMmHdi6AaQO1U58Dl2EgQfyUj
 NKsOZXJCkU9h7z3NZ2XKYZHXlLMx5Q4wMyV7EX/iOuUbik9HIxP/+dTw39W1vC/5YjJL
 z5ASIDNRKTzDrWfzI8a0SWS+B8CSTdKDtIAiGYSJif2uxYrMrqQOvcZR5gBFXu2l3Ckw
 yCysWEZcNrk/Uys0eZpQr0fN3T12X2/Bm+wYH/Z5saW1Y1SVXZNszPx5/U7Tt2ZGEv5j
 Y7BruLOrxCmgMksgK4BOk85nV48vJlFT/fVnCr2Aj9VtzlxLYX7nc7r/KZ+AIkgmXyrt
 2yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e9/GCbd30HxZadU0KelTL6O/pNQdo9Gk9HhDwBhh/9Q=;
 b=ZEPqGq+dcVFjoGi7GNeMxSMaIWWB7UfSxyLT3Jrg0W1XNgjcZKwuWBr5oSbv2ROxLa
 fakkqoHFAnJ6/AdRqqFExLrJBvWr7iWAvAp4Y/NPNMghU203GnVVpqQMKWLzhGQWAr4A
 ordXgdKLpDUrZbQJW2S9S2hHH9cg/obHfObPYwPkjRoySgjBcVOBkgLBmoV0wvGjBj4F
 hIwe6KWxYXKTHF3VtAD3Ouwz5noXjlZ81SHwIZVBc766aawbIcLd2lOsmMP+Cbw7nKh2
 HFTi5/leZACN27cNe+kqlwRXHPOcJ1+3yy/3NWyXExs+JxfIMFetpdh7RGNnja+0PAuW
 K6+A==
X-Gm-Message-State: AOAM533pbf4t4SHGTFR5ZSMG1m5lnzToMRtzXus7xWh48LGMbV1X9PI9
 OEvGMzWW2QNnQKeTrPigQUKzHfAFSCFAvGUSIBw=
X-Google-Smtp-Source: ABdhPJy+1gY5Up1cl5BUUc4LOCyfaTYI0FqMNVcXuK31kOCMVNujyb8vkPN6m8si+QIjnsheEfqvTkFHwnEF70fdhus=
X-Received: by 2002:aca:d505:: with SMTP id m5mr6254366oig.5.1627481000893;
 Wed, 28 Jul 2021 07:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-2-tzimmermann@suse.de>
 <24a8b2ab-ef38-219b-99d4-806a44fa6aba@amd.com>
In-Reply-To: <24a8b2ab-ef38-219b-99d4-806a44fa6aba@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Jul 2021 10:03:10 -0400
Message-ID: <CADnq5_MmPu=k3cc7JCg1iemkCDnoxR1T8PTD_VJn=58f5DwUNQ@mail.gmail.com>
Subject: Re: [PATCH 01/14] drm/amdgpu: Convert to Linux IRQ interfaces
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, anitha.chrisanthus@intel.com,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, edmund.j.dea@intel.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, nicolas.ferre@microchip.com,
 Sascha Hauer <kernel@pengutronix.de>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 6:27 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 27.07.21 um 20:27 schrieb Thomas Zimmermann:
> > Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> > IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> > don't benefit from using it.
> >
> > DRM IRQ callbacks are now being called directly or inlined.
> >
> > The interrupt number returned by pci_msi_vector() is now stored
> > in struct amdgpu_irq. Calls to pci_msi_vector() can fail and return
> > a negative errno code. Abort initlaizaton in thi case. The DRM IRQ
> > midlayer does not handle this correctly.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Alex needs to take a look at this as well, but of hand the patch is
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>.

Looks good to me as well:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 21 ++++++++++++++-------
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h |  2 +-
> >   3 files changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_drv.c
> > index 2bd13fc2541a..1e05b5aa94e7 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -1775,7 +1775,6 @@ static const struct drm_driver amdgpu_kms_driver =
=3D {
> >       .open =3D amdgpu_driver_open_kms,
> >       .postclose =3D amdgpu_driver_postclose_kms,
> >       .lastclose =3D amdgpu_driver_lastclose_kms,
> > -     .irq_handler =3D amdgpu_irq_handler,
> >       .ioctls =3D amdgpu_ioctls_kms,
> >       .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
> >       .dumb_create =3D amdgpu_mode_dumb_create,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_irq.c
> > index 0d01cfaca77e..a36cdc7323f4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > @@ -46,7 +46,6 @@
> >   #include <linux/pci.h>
> >
> >   #include <drm/drm_crtc_helper.h>
> > -#include <drm/drm_irq.h>
> >   #include <drm/drm_vblank.h>
> >   #include <drm/amdgpu_drm.h>
> >   #include <drm/drm_drv.h>
> > @@ -184,7 +183,7 @@ void amdgpu_irq_disable_all(struct amdgpu_device *a=
dev)
> >    * Returns:
> >    * result of handling the IRQ, as defined by &irqreturn_t
> >    */
> > -irqreturn_t amdgpu_irq_handler(int irq, void *arg)
> > +static irqreturn_t amdgpu_irq_handler(int irq, void *arg)
> >   {
> >       struct drm_device *dev =3D (struct drm_device *) arg;
> >       struct amdgpu_device *adev =3D drm_to_adev(dev);
> > @@ -307,6 +306,7 @@ static void amdgpu_restore_msix(struct amdgpu_devic=
e *adev)
> >   int amdgpu_irq_init(struct amdgpu_device *adev)
> >   {
> >       int r =3D 0;
> > +     unsigned int irq;
> >
> >       spin_lock_init(&adev->irq.lock);
> >
> > @@ -349,15 +349,22 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
> >       INIT_WORK(&adev->irq.ih2_work, amdgpu_irq_handle_ih2);
> >       INIT_WORK(&adev->irq.ih_soft_work, amdgpu_irq_handle_ih_soft);
> >
> > -     adev->irq.installed =3D true;
> > -     /* Use vector 0 for MSI-X */
> > -     r =3D drm_irq_install(adev_to_drm(adev), pci_irq_vector(adev->pde=
v, 0));
> > +     /* Use vector 0 for MSI-X. */
> > +     r =3D pci_irq_vector(adev->pdev, 0);
> > +     if (r < 0)
> > +             return r;
> > +     irq =3D r;
> > +
> > +     /* PCI devices require shared interrupts. */
> > +     r =3D request_irq(irq, amdgpu_irq_handler, IRQF_SHARED, adev_to_d=
rm(adev)->driver->name,
> > +                     adev_to_drm(adev));
> >       if (r) {
> > -             adev->irq.installed =3D false;
> >               if (!amdgpu_device_has_dc_support(adev))
> >                       flush_work(&adev->hotplug_work);
> >               return r;
> >       }
> > +     adev->irq.installed =3D true;
> > +     adev->irq.irq =3D irq;
> >       adev_to_drm(adev)->max_vblank_count =3D 0x00ffffff;
> >
> >       DRM_DEBUG("amdgpu: irq initialized.\n");
> > @@ -368,7 +375,7 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
> >   void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
> >   {
> >       if (adev->irq.installed) {
> > -             drm_irq_uninstall(&adev->ddev);
> > +             free_irq(adev->irq.irq, adev_to_drm(adev));
> >               adev->irq.installed =3D false;
> >               if (adev->irq.msi_enabled)
> >                       pci_free_irq_vectors(adev->pdev);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_irq.h
> > index 78ad4784cc74..e9f2c11ea416 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> > @@ -80,6 +80,7 @@ struct amdgpu_irq_src_funcs {
> >
> >   struct amdgpu_irq {
> >       bool                            installed;
> > +     unsigned int                    irq;
> >       spinlock_t                      lock;
> >       /* interrupt sources */
> >       struct amdgpu_irq_client        client[AMDGPU_IRQ_CLIENTID_MAX];
> > @@ -100,7 +101,6 @@ struct amdgpu_irq {
> >   };
> >
> >   void amdgpu_irq_disable_all(struct amdgpu_device *adev);
> > -irqreturn_t amdgpu_irq_handler(int irq, void *arg);
> >
> >   int amdgpu_irq_init(struct amdgpu_device *adev);
> >   void amdgpu_irq_fini_sw(struct amdgpu_device *adev);
>
