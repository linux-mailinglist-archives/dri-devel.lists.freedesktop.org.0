Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D47FAC35
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BD710E312;
	Mon, 27 Nov 2023 21:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2BC10E312
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:05:37 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1fa289a3b6aso1434130fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119136; x=1701723936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0P9RWcGc2R6PZqHUAo55hk/yFOkyrs5iAMuj/DazDmU=;
 b=C6i1dvTWnkiedmD6z/uBDmiOs9G2GLft8WqzI8rBnbTwdsj9vIXUiSXJpRyvCnvV0W
 CpxkP5Ft6sy6SqyMf0Db6oyly01eASaYycbb9HC7z8rtO950GbvqHMf3WBKeWm+0YZR6
 DPZWTg4cKJc7qaVFe299d8Yxjj+PztcGeSO42OA/9nLmgVm3RnsnjOTp6cUpdgAiK6cA
 tqYKd0JvcMbsdBC/U7BK6fLwdpoBO5fM4gAOeMylDcVw+fFAn7ciU4nvAj/v12eCp4Es
 9zQWJWzhWv+KJ8ulreNlN/MuIPnVqLhui4mgngBCNWG0BoJNUS4Qq6pbu/961778GsxD
 77DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119136; x=1701723936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0P9RWcGc2R6PZqHUAo55hk/yFOkyrs5iAMuj/DazDmU=;
 b=cJaBc6L8SOKz+g2zB41rptqxonw/m2OtyPfqkKynMw6+xY3K9yr75N1S5vrvVUu4uB
 LLhnjfGyIvnpEsgGeNvkPiMAbuc5pG//Yyvj75PC4wvIsee0YpJWW+NG/cgiUtwN+YlF
 06Vmfcc04WSVAGVfXsKGd0jGHX8Qo9T/XU890Kfoq+a9wo3Zd7VZ8EfzgLYiLqrbyxOt
 WR+8PugGeVQw8gom+K2VMzCWCryH31CgzbgdQnzZpsNrw+5KqhcVKIlsQ3FW/N0JOnHV
 a+EsRg6YbIGffkepTS8J1nbVcfhNjLyHydv6W9mJPNAnz9jXOHTA56MNWQGZrXKCHP8l
 sKkg==
X-Gm-Message-State: AOJu0YyHIv+DJIQ1olwykK1QxQn8GWIs7dwUNvAlA1qh3IHGz2TSMlkH
 tpJ5Qe6z7QSpChj4ivNNg5IW2mauO3E82VNjLvU=
X-Google-Smtp-Source: AGHT+IEXJdZyg/RzACeEjCfN60In1ADh5jfMKu0BZxnXHy4MyPOIrN4TxqX4ERKOJkPJuk2rknFKczab7WFWnnBo1mQ=
X-Received: by 2002:a05:6871:4e97:b0:1f9:fd01:e003 with SMTP id
 uk23-20020a0568714e9700b001f9fd01e003mr12645205oab.22.1701119136269; Mon, 27
 Nov 2023 13:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-11-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-11-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:05:25 -0500
Message-ID: <CADnq5_Mhpn3r_U4y4rmkO5mJCpA8XjuZhmjHRDYrCGt3FzRh8Q@mail.gmail.com>
Subject: Re: [PATCH 10/14] drm: Remove support for legacy drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Remove all hooks and calls into code for user-space mode setting from
> the DRM core. Without the drivers and ioctl entry points, none of this
> is required any longer.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_auth.c   |  8 +----
>  drivers/gpu/drm/drm_drv.c    | 17 ----------
>  drivers/gpu/drm/drm_file.c   | 64 ++----------------------------------
>  drivers/gpu/drm/drm_vblank.c | 19 -----------
>  4 files changed, 3 insertions(+), 105 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 2ed2585ded378..252c105d614ff 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -37,13 +37,12 @@
>  #include <drm/drm_print.h>
>
>  #include "drm_internal.h"
> -#include "drm_legacy.h"
>
>  /**
>   * DOC: master and authentication
>   *
>   * &struct drm_master is used to track groups of clients with open
> - * primary/legacy device nodes. For every &struct drm_file which has had=
 at
> + * primary device nodes. For every &struct drm_file which has had at
>   * least once successfully became the device master (either through the
>   * SET_MASTER IOCTL, or implicitly through opening the primary device no=
de when
>   * no one else is the current master that time) there exists one &drm_ma=
ster.
> @@ -139,7 +138,6 @@ struct drm_master *drm_master_create(struct drm_devic=
e *dev)
>                 return NULL;
>
>         kref_init(&master->refcount);
> -       drm_master_legacy_init(master);
>         idr_init_base(&master->magic_map, 1);
>         master->dev =3D dev;
>
> @@ -365,8 +363,6 @@ void drm_master_release(struct drm_file *file_priv)
>         if (!drm_is_current_master_locked(file_priv))
>                 goto out;
>
> -       drm_legacy_lock_master_cleanup(dev, master);
> -
>         if (dev->master =3D=3D file_priv->master)
>                 drm_drop_master(dev, file_priv);
>  out:
> @@ -429,8 +425,6 @@ static void drm_master_destroy(struct kref *kref)
>         if (drm_core_check_feature(dev, DRIVER_MODESET))
>                 drm_lease_destroy(master);
>
> -       drm_legacy_master_rmmaps(dev, master);
> -
>         idr_destroy(&master->magic_map);
>         idr_destroy(&master->leases);
>         idr_destroy(&master->lessee_idr);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 535f16e7882e7..979366e68dbb8 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -48,7 +48,6 @@
>
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> -#include "drm_legacy.h"
>
>  MODULE_AUTHOR("Gareth Hughes, Leif Delgass, Jos=C3=A9 Fonseca, Jon Smirl=
");
>  MODULE_DESCRIPTION("DRM shared core routines");
> @@ -585,8 +584,6 @@ static void drm_fs_inode_free(struct inode *inode)
>
>  static void drm_dev_init_release(struct drm_device *dev, void *res)
>  {
> -       drm_legacy_ctxbitmap_cleanup(dev);
> -       drm_legacy_remove_map_hash(dev);
>         drm_fs_inode_free(dev->anon_inode);
>
>         put_device(dev->dev);
> @@ -597,7 +594,6 @@ static void drm_dev_init_release(struct drm_device *d=
ev, void *res)
>         mutex_destroy(&dev->clientlist_mutex);
>         mutex_destroy(&dev->filelist_mutex);
>         mutex_destroy(&dev->struct_mutex);
> -       drm_legacy_destroy_members(dev);
>  }
>
>  static int drm_dev_init(struct drm_device *dev,
> @@ -632,7 +628,6 @@ static int drm_dev_init(struct drm_device *dev,
>                 return -EINVAL;
>         }
>
> -       drm_legacy_init_members(dev);
>         INIT_LIST_HEAD(&dev->filelist);
>         INIT_LIST_HEAD(&dev->filelist_internal);
>         INIT_LIST_HEAD(&dev->clientlist);
> @@ -673,12 +668,6 @@ static int drm_dev_init(struct drm_device *dev,
>                         goto err;
>         }
>
> -       ret =3D drm_legacy_create_map_hash(dev);
> -       if (ret)
> -               goto err;
> -
> -       drm_legacy_ctxbitmap_init(dev);
> -
>         if (drm_core_check_feature(dev, DRIVER_GEM)) {
>                 ret =3D drm_gem_init(dev);
>                 if (ret) {
> @@ -990,9 +979,6 @@ EXPORT_SYMBOL(drm_dev_register);
>   */
>  void drm_dev_unregister(struct drm_device *dev)
>  {
> -       if (drm_core_check_feature(dev, DRIVER_LEGACY))
> -               drm_lastclose(dev);
> -
>         dev->registered =3D false;
>
>         drm_client_dev_unregister(dev);
> @@ -1003,9 +989,6 @@ void drm_dev_unregister(struct drm_device *dev)
>         if (dev->driver->unload)
>                 dev->driver->unload(dev);
>
> -       drm_legacy_pci_agp_destroy(dev);
> -       drm_legacy_rmmaps(dev);
> -
>         remove_compat_control_link(dev);
>         drm_minor_unregister(dev, DRM_MINOR_ACCEL);
>         drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 5ddaffd325865..987c1a5d1773b 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -47,21 +47,12 @@
>
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> -#include "drm_legacy.h"
>
>  /* from BKL pushdown */
>  DEFINE_MUTEX(drm_global_mutex);
>
>  bool drm_dev_needs_global_mutex(struct drm_device *dev)
>  {
> -       /*
> -        * Legacy drivers rely on all kinds of BKL locking semantics, don=
't
> -        * bother. They also still need BKL locking for their ioctls, so =
better
> -        * safe than sorry.
> -        */
> -       if (drm_core_check_feature(dev, DRIVER_LEGACY))
> -               return true;
> -
>         /*
>          * The deprecated ->load callback must be called after the driver=
 is
>          * already registered. This means such drivers rely on the BKL to=
 make
> @@ -107,9 +98,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev=
)
>   * drm_send_event() as the main starting points.
>   *
>   * The memory mapping implementation will vary depending on how the driv=
er
> - * manages memory. Legacy drivers will use the deprecated drm_legacy_mma=
p()
> - * function, modern drivers should use one of the provided memory-manage=
r
> - * specific implementations. For GEM-based drivers this is drm_gem_mmap(=
).
> + * manages memory. For GEM-based drivers this is drm_gem_mmap().
>   *
>   * No other file operations are supported by the DRM userspace API. Over=
all the
>   * following is an example &file_operations structure::
> @@ -254,18 +243,6 @@ void drm_file_free(struct drm_file *file)
>                      (long)old_encode_dev(file->minor->kdev->devt),
>                      atomic_read(&dev->open_count));
>
> -#ifdef CONFIG_DRM_LEGACY
> -       if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
> -           dev->driver->preclose)
> -               dev->driver->preclose(dev, file);
> -#endif
> -
> -       if (drm_core_check_feature(dev, DRIVER_LEGACY))
> -               drm_legacy_lock_release(dev, file->filp);
> -
> -       if (drm_core_check_feature(dev, DRIVER_HAVE_DMA))
> -               drm_legacy_reclaim_buffers(dev, file);
> -
>         drm_events_release(file);
>
>         if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> @@ -279,8 +256,6 @@ void drm_file_free(struct drm_file *file)
>         if (drm_core_check_feature(dev, DRIVER_GEM))
>                 drm_gem_release(dev, file);
>
> -       drm_legacy_ctxbitmap_flush(dev, file);
> -
>         if (drm_is_primary_client(file))
>                 drm_master_release(file);
>
> @@ -367,29 +342,6 @@ int drm_open_helper(struct file *filp, struct drm_mi=
nor *minor)
>         list_add(&priv->lhead, &dev->filelist);
>         mutex_unlock(&dev->filelist_mutex);
>
> -#ifdef CONFIG_DRM_LEGACY
> -#ifdef __alpha__
> -       /*
> -        * Default the hose
> -        */
> -       if (!dev->hose) {
> -               struct pci_dev *pci_dev;
> -
> -               pci_dev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NUL=
L);
> -               if (pci_dev) {
> -                       dev->hose =3D pci_dev->sysdata;
> -                       pci_dev_put(pci_dev);
> -               }
> -               if (!dev->hose) {
> -                       struct pci_bus *b =3D list_entry(pci_root_buses.n=
ext,
> -                               struct pci_bus, node);
> -                       if (b)
> -                               dev->hose =3D b->sysdata;
> -               }
> -       }
> -#endif
> -#endif
> -
>         return 0;
>  }
>
> @@ -411,7 +363,6 @@ int drm_open(struct inode *inode, struct file *filp)
>         struct drm_device *dev;
>         struct drm_minor *minor;
>         int retcode;
> -       int need_setup =3D 0;
>
>         minor =3D drm_minor_acquire(iminor(inode));
>         if (IS_ERR(minor))
> @@ -421,8 +372,7 @@ int drm_open(struct inode *inode, struct file *filp)
>         if (drm_dev_needs_global_mutex(dev))
>                 mutex_lock(&drm_global_mutex);
>
> -       if (!atomic_fetch_inc(&dev->open_count))
> -               need_setup =3D 1;
> +       atomic_fetch_inc(&dev->open_count);
>
>         /* share address_space across all char-devs of a single device */
>         filp->f_mapping =3D dev->anon_inode->i_mapping;
> @@ -430,13 +380,6 @@ int drm_open(struct inode *inode, struct file *filp)
>         retcode =3D drm_open_helper(filp, minor);
>         if (retcode)
>                 goto err_undo;
> -       if (need_setup) {
> -               retcode =3D drm_legacy_setup(dev);
> -               if (retcode) {
> -                       drm_close_helper(filp);
> -                       goto err_undo;
> -               }
> -       }
>
>         if (drm_dev_needs_global_mutex(dev))
>                 mutex_unlock(&drm_global_mutex);
> @@ -460,9 +403,6 @@ void drm_lastclose(struct drm_device * dev)
>                 dev->driver->lastclose(dev);
>         drm_dbg_core(dev, "driver lastclose completed\n");
>
> -       if (drm_core_check_feature(dev, DRIVER_LEGACY))
> -               drm_legacy_dev_reinit(dev);
> -
>         drm_client_dev_restore(dev);
>  }
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index a11f164b2384f..702a12bc93bd9 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -210,11 +210,6 @@ static u32 __get_vblank_counter(struct drm_device *d=
ev, unsigned int pipe)
>                 if (crtc->funcs->get_vblank_counter)
>                         return crtc->funcs->get_vblank_counter(crtc);
>         }
> -#ifdef CONFIG_DRM_LEGACY
> -       else if (dev->driver->get_vblank_counter) {
> -               return dev->driver->get_vblank_counter(dev, pipe);
> -       }
> -#endif
>
>         return drm_vblank_no_hw_counter(dev, pipe);
>  }
> @@ -433,11 +428,6 @@ static void __disable_vblank(struct drm_device *dev,=
 unsigned int pipe)
>                 if (crtc->funcs->disable_vblank)
>                         crtc->funcs->disable_vblank(crtc);
>         }
> -#ifdef CONFIG_DRM_LEGACY
> -       else {
> -               dev->driver->disable_vblank(dev, pipe);
> -       }
> -#endif
>  }
>
>  /*
> @@ -1151,11 +1141,6 @@ static int __enable_vblank(struct drm_device *dev,=
 unsigned int pipe)
>                 if (crtc->funcs->enable_vblank)
>                         return crtc->funcs->enable_vblank(crtc);
>         }
> -#ifdef CONFIG_DRM_LEGACY
> -       else if (dev->driver->enable_vblank) {
> -               return dev->driver->enable_vblank(dev, pipe);
> -       }
> -#endif
>
>         return -EINVAL;
>  }
> @@ -1698,10 +1683,6 @@ static void drm_wait_vblank_reply(struct drm_devic=
e *dev, unsigned int pipe,
>
>  static bool drm_wait_vblank_supported(struct drm_device *dev)
>  {
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -       if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> -               return dev->irq_enabled;
> -#endif
>         return drm_dev_has_vblank(dev);
>  }
>
> --
> 2.42.1
>
