Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60721258F6D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 15:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2846E860;
	Tue,  1 Sep 2020 13:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8316E443;
 Tue,  1 Sep 2020 13:49:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j2so1615459wrx.7;
 Tue, 01 Sep 2020 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JN2TAINgVriuHamMrm/wuUCpHn6MFcaks74KKwgtbuM=;
 b=D5qPDBm3o7WYYAUT0auZq1z6+Udgq8TcoIPES1yIOmyd6i7xXuoaYluUlrDLOXoPEq
 Wzcx0qTqCE5mAANSloFI+NYg7mgV7QP2k2kZpLMt9e5XprtqiW+LKQ66wCNxCtMVWwjw
 jcNdgtlucQ5vn4aZqEQ1KrDlPG2eNnZsp40Hn71hwtnAJXheDeSNKFWQ0P+JUE4rAQt0
 yK9dExnXzTJjb5EyioyxQvNx0bz5cUVBCPCzql8u/QM5Oct/v1/7Pcf2sIDNGQr/+2Rt
 c8cXXZ+eKJp3N/KeqEi6Pk9JrEHRo5YNWIHsu6gv1uHlzRQXguW7EE9AFVV8jFnHNAni
 kKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JN2TAINgVriuHamMrm/wuUCpHn6MFcaks74KKwgtbuM=;
 b=gla6BaPCypije3psKiE1lgF5La0DYVqN2WhE7XEDVqEv5JdkbzcVD6t6QZM07xeytp
 Gh4OsY/5kstbAmjGPQs5mUEMHfFo9d/EDlkgRtkCHUQIoDkpFoZ16s+0YA9z03vMk8pM
 SM7T81i14PmMQiVtefE/5qSGyKurWcbUGJ5ksLNd9/kaXA2V4gdzIGgtXRk/D+rOEaV6
 whonSkmbtZ6P6jsuZt9xwmczmU2PLegBUgoUSWqIxezpnvCKvp0PSNkpgFYtN5o51CWM
 tYFq03dyor3bTEHsDDr7whdN9pJtLibj0hF/lqWuRFxohHu81i9dceLONt/B9mZEz2u9
 +CsQ==
X-Gm-Message-State: AOAM532mRxq1NwMzL+RTq4rhWirHkiEIECfAMCtQ7Sp28QOLngYPg7Bj
 j4xDY65C1Ara468XydRnI2QuWQ5uffOmns5j6UA=
X-Google-Smtp-Source: ABdhPJzb2BQTN3JfyyF0tsCSiLTj8F+Wt02ScIbtTaF0TevnsX2Bjb0BDvOnnmrssPMDNal9zYIx1uGueEOHJ9mSZpc=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr2095910wrs.419.1598968152300; 
 Tue, 01 Sep 2020 06:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200819050042.7370-1-luben.tuikov@amd.com>
 <20200819050042.7370-4-luben.tuikov@amd.com>
 <20200901074430.GU2352366@phenom.ffwll.local>
In-Reply-To: <20200901074430.GU2352366@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Sep 2020 09:49:00 -0400
Message-ID: <CADnq5_ONe-myo-2534QG9KKU2Xs1RWD7s+uBt6ffNj=RgBgT6g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Embed drm_device into amdgpu_device (v2)
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 1, 2020 at 3:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Aug 19, 2020 at 01:00:42AM -0400, Luben Tuikov wrote:
> > a) Embed struct drm_device into struct amdgpu_device.
> > b) Modify the inline-f drm_to_adev() accordingly.
> > c) Modify the inline-f adev_to_drm() accordingly.
> > d) Eliminate the use of drm_device.dev_private,
> >    in amdgpu.
> > e) Switch from using drm_dev_alloc() to
> >    drm_dev_init().
> > f) Add a DRM driver release function, which frees
> >    the container amdgpu_device after all krefs on
> >    the contained drm_device have been released.
> >
> > v2: Split out adding adev_to_drm() into its own
> >     patch (previous commit), making this patch
> >     more succinct and clear. More detailed commit
> >     description.
> >
> > Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 10 ++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++-----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 43 ++++++++++++++--------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 20 +++-------
> >  4 files changed, 43 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index 735480cc7dcf..107a6ec920f7 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -724,8 +724,8 @@ struct amd_powerplay {
> >  #define AMDGPU_MAX_DF_PERFMONS 4
> >  struct amdgpu_device {
> >       struct device                   *dev;
> > -     struct drm_device               *ddev;
> >       struct pci_dev                  *pdev;
> > +     struct drm_device               ddev;
> >
> >  #ifdef CONFIG_DRM_AMD_ACP
> >       struct amdgpu_acp               acp;
> > @@ -990,12 +990,12 @@ struct amdgpu_device {
> >
> >  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> >  {
> > -     return ddev->dev_private;
> > +     return container_of(ddev, struct amdgpu_device, ddev);
> >  }
> >
> >  static inline struct drm_device *adev_to_drm(struct amdgpu_device *adev)
> >  {
> > -     return adev->ddev;
> > +     return &adev->ddev;
> >  }
> >
> >  static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
> > @@ -1004,8 +1004,6 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
> >  }
> >
> >  int amdgpu_device_init(struct amdgpu_device *adev,
> > -                    struct drm_device *ddev,
> > -                    struct pci_dev *pdev,
> >                      uint32_t flags);
> >  void amdgpu_device_fini(struct amdgpu_device *adev);
> >  int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
> > @@ -1195,7 +1193,7 @@ static inline void *amdgpu_atpx_get_dhandle(void) { return NULL; }
> >  extern const struct drm_ioctl_desc amdgpu_ioctls_kms[];
> >  extern const int amdgpu_max_kms_ioctl;
> >
> > -int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags);
> > +int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
> >  void amdgpu_driver_unload_kms(struct drm_device *dev);
> >  void amdgpu_driver_lastclose_kms(struct drm_device *dev);
> >  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 07012d71eeea..6e529548e708 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -1216,7 +1216,8 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
> >   * Callback for the switcheroo driver.  Suspends or resumes the
> >   * the asics before or after it is powered up using ACPI methods.
> >   */
> > -static void amdgpu_switcheroo_set_state(struct pci_dev *pdev, enum vga_switcheroo_state state)
> > +static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
> > +                                     enum vga_switcheroo_state state)
> >  {
> >       struct drm_device *dev = pci_get_drvdata(pdev);
> >       int r;
> > @@ -2977,8 +2978,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
> >   * amdgpu_device_init - initialize the driver
> >   *
> >   * @adev: amdgpu_device pointer
> > - * @ddev: drm dev pointer
> > - * @pdev: pci dev pointer
> >   * @flags: driver flags
> >   *
> >   * Initializes the driver info and hw (all asics).
> > @@ -2986,18 +2985,15 @@ static const struct attribute *amdgpu_dev_attributes[] = {
> >   * Called at driver startup.
> >   */
> >  int amdgpu_device_init(struct amdgpu_device *adev,
> > -                    struct drm_device *ddev,
> > -                    struct pci_dev *pdev,
> >                      uint32_t flags)
> >  {
> > +     struct drm_device *ddev = adev_to_drm(adev);
> > +     struct pci_dev *pdev = adev->pdev;
> >       int r, i;
> >       bool boco = false;
> >       u32 max_MBps;
> >
> >       adev->shutdown = false;
> > -     adev->dev = &pdev->dev;
> > -     adev->ddev = ddev;
> > -     adev->pdev = pdev;
> >       adev->flags = flags;
> >
> >       if (amdgpu_force_asic_type >= 0 && amdgpu_force_asic_type < CHIP_LAST)
> > @@ -3451,9 +3447,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
> >       struct drm_connector_list_iter iter;
> >       int r;
> >
> > -     if (dev == NULL || dev->dev_private == NULL) {
> > +     if (!dev)
> >               return -ENODEV;
>
> Random comment, but is this really still needed?
>

Probably not.  I think it's just left over from when we forked radeon.

Alex


> This pattern goes back to dri1 shadow attach trickery where everything was
> horrible and we could end up with a device but not a device and trying to
> suspend it.
>
> With a proper kms pci device you shouldn't ever end up in this situation
> where the drm_device doesn't exist or isn't completely set up, but we're
> trying to suspend. Maybe wrap in a WARN_ON at least?
> -Daniel
>
> > -     }
> >
> >       adev = drm_to_adev(dev);
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 38023c879db1..6866c515f00a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -1082,7 +1082,7 @@ static struct drm_driver kms_driver;
> >  static int amdgpu_pci_probe(struct pci_dev *pdev,
> >                           const struct pci_device_id *ent)
> >  {
> > -     struct drm_device *dev;
> > +     struct drm_device *ddev;
> >       struct amdgpu_device *adev;
> >       unsigned long flags = ent->driver_data;
> >       int ret, retry = 0;
> > @@ -1138,36 +1138,42 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >       if (ret)
> >               return ret;
> >
> > -     dev = drm_dev_alloc(&kms_driver, &pdev->dev);
> > -     if (IS_ERR(dev))
> > -             return PTR_ERR(dev);
> > +     adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> > +     if (!adev)
> > +             return -ENOMEM;
> > +
> > +     adev->dev  = &pdev->dev;
> > +     adev->pdev = pdev;
> > +     ddev = adev_to_drm(adev);
> > +     ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
> > +     if (ret)
> > +             goto err_free;
> >
> >       if (!supports_atomic)
> > -             dev->driver_features &= ~DRIVER_ATOMIC;
> > +             ddev->driver_features &= ~DRIVER_ATOMIC;
> >
> >       ret = pci_enable_device(pdev);
> >       if (ret)
> >               goto err_free;
> >
> > -     dev->pdev = pdev;
> > +     ddev->pdev = pdev;
> > +     pci_set_drvdata(pdev, ddev);
> >
> > -     pci_set_drvdata(pdev, dev);
> > -
> > -     ret = amdgpu_driver_load_kms(dev, ent->driver_data);
> > +     ret = amdgpu_driver_load_kms(adev, ent->driver_data);
> >       if (ret)
> >               goto err_pci;
> >
> >  retry_init:
> > -     ret = drm_dev_register(dev, ent->driver_data);
> > +     ret = drm_dev_register(ddev, ent->driver_data);
> >       if (ret == -EAGAIN && ++retry <= 3) {
> >               DRM_INFO("retry init %d\n", retry);
> >               /* Don't request EX mode too frequently which is attacking */
> >               msleep(5000);
> >               goto retry_init;
> > -     } else if (ret)
> > +     } else if (ret) {
> >               goto err_pci;
> > +     }
> >
> > -     adev = drm_to_adev(dev);
> >       ret = amdgpu_debugfs_init(adev);
> >       if (ret)
> >               DRM_ERROR("Creating debugfs files failed (%d).\n", ret);
> > @@ -1177,7 +1183,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >  err_pci:
> >       pci_disable_device(pdev);
> >  err_free:
> > -     drm_dev_put(dev);
> > +     drm_dev_put(ddev);
> >       return ret;
> >  }
> >
> > @@ -1197,6 +1203,14 @@ amdgpu_pci_remove(struct pci_dev *pdev)
> >       drm_dev_put(dev);
> >  }
> >
> > +static void amdgpu_driver_release(struct drm_device *ddev)
> > +{
> > +     struct amdgpu_device *adev = drm_to_adev(ddev);
> > +
> > +     drm_dev_fini(ddev);
> > +     kfree(adev);
> > +}
> > +
> >  static void
> >  amdgpu_pci_shutdown(struct pci_dev *pdev)
> >  {
> > @@ -1491,6 +1505,7 @@ static struct drm_driver kms_driver = {
> >       .open = amdgpu_driver_open_kms,
> >       .postclose = amdgpu_driver_postclose_kms,
> >       .lastclose = amdgpu_driver_lastclose_kms,
> > +     .release   = amdgpu_driver_release,
> >       .irq_handler = amdgpu_irq_handler,
> >       .ioctls = amdgpu_ioctls_kms,
> >       .gem_free_object_unlocked = amdgpu_gem_object_free,
> > @@ -1525,8 +1540,6 @@ static struct pci_driver amdgpu_kms_pci_driver = {
> >       .driver.pm = &amdgpu_pm_ops,
> >  };
> >
> > -
> > -
> >  static int __init amdgpu_init(void)
> >  {
> >       int r;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > index 47cd3558f9c7..f2a4fdcd542d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > @@ -86,7 +86,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
> >       amdgpu_unregister_gpu_instance(adev);
> >
> >       if (adev->rmmio == NULL)
> > -             goto done_free;
> > +             return;
> >
> >       if (adev->runpm) {
> >               pm_runtime_get_sync(dev->dev);
> > @@ -96,10 +96,6 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
> >       amdgpu_acpi_fini(adev);
> >
> >       amdgpu_device_fini(adev);
> > -
> > -done_free:
> > -     kfree(adev);
> > -     dev->dev_private = NULL;
> >  }
> >
> >  void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
> > @@ -130,22 +126,18 @@ void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
> >  /**
> >   * amdgpu_driver_load_kms - Main load function for KMS.
> >   *
> > - * @dev: drm dev pointer
> > + * @adev: pointer to struct amdgpu_device
> >   * @flags: device flags
> >   *
> >   * This is the main load function for KMS (all asics).
> >   * Returns 0 on success, error on failure.
> >   */
> > -int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
> > +int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
> >  {
> > -     struct amdgpu_device *adev;
> > +     struct drm_device *dev;
> >       int r, acpi_status;
> >
> > -     adev = kzalloc(sizeof(struct amdgpu_device), GFP_KERNEL);
> > -     if (adev == NULL) {
> > -             return -ENOMEM;
> > -     }
> > -     dev->dev_private = (void *)adev;
> > +     dev = adev_to_drm(adev);
> >
> >       if (amdgpu_has_atpx() &&
> >           (amdgpu_is_atpx_hybrid() ||
> > @@ -160,7 +152,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
> >        * properly initialize the GPU MC controller and permit
> >        * VRAM allocation
> >        */
> > -     r = amdgpu_device_init(adev, dev, dev->pdev, flags);
> > +     r = amdgpu_device_init(adev, flags);
> >       if (r) {
> >               dev_err(&dev->pdev->dev, "Fatal error during GPU init\n");
> >               goto out;
> > --
> > 2.28.0.215.g878e727637
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
