Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8446B11A6DC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BCA6EAD8;
	Wed, 11 Dec 2019 09:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590006EA6D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 03:00:18 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a203so8306789qkc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 19:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pRCvntiJPkAodxWabfqI1sMuqVq8HpEnWFnv/BbdT1Q=;
 b=j05aXcz4/L1eIbWZR08zwSAd03Zyhjbpo5rEUBEmPMqC3XzVNMgaEjtdfwhrWFI8GB
 tqIJ0weW6rXSqBJfXefz9SGd5NOiPYTmp1h9hWJR8/v6pqQoGZUkI3MGHUC2l1GKhaLn
 hpdhN+1loxgWE1ePXF/MJt2wq2xmngTc+TLwV0fSwsEKD6ZlFpLpiR/jGkFxjQl4BtxW
 +Q13p6N1Tpz1RXWYK3GKNB2n8mbLruzVrTJf5h3eYZCHnWkgxobtkS2fvtunUhqL1bie
 Qlbnlhpq9Z814vY4H4Hz0+clLwZGToZVgtd6tb8rSV4PV5wkFcOyUDtgzuG9zYg2tSxR
 BXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pRCvntiJPkAodxWabfqI1sMuqVq8HpEnWFnv/BbdT1Q=;
 b=ANqxWdiumpAtxGbPOfIfvqfj6BpyxdR4Qd2RIGV3y3QEqVkXd/qoAMTem4u5od6aPz
 b/JdsbGy8Yxr1MbavipAlscjOU8F7F6RciIs9PnOBkXWo3/hwK+ima4V4xk8JREewqsF
 x4q4L5hXcDHkKmch7RDmOkKbgvOzX1JszOiwIxIDZCdo1TgquyU9Ze3zcrMxM6U+jh24
 UmRS9Z9zoWGs65/5q3eRHziRwcvLR4188yQ2nM4HBaXJtOXQysIYEymEkQxWxjo/lAQe
 GZUQjRgSkcl92zRJjQmBW7/naI1G2DVlw5T1y4IA4RAYmr/MaJm25d1FwxcJLxub5zCH
 5lpA==
X-Gm-Message-State: APjAAAVkmXqCUd1bwF/aC6nzzpyFtt5X5ZC1uZgGAjiQ2TfFlBqMgvfD
 M1Okf9g4WPw+QWzy0k21ibNmk/S7y7viwXESEik=
X-Google-Smtp-Source: APXvYqwAg2TrWAQEcruSDYJs8Zb9xidwxM4PhylxdBaCmWWVvfArmo4H5+vJo9OK8xk3gpAZ1ooyxtpdI8bEkbK2gFM=
X-Received: by 2002:a37:851:: with SMTP id 78mr975078qki.266.1576033217356;
 Tue, 10 Dec 2019 19:00:17 -0800 (PST)
MIME-Version: 1.0
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
 <62c61dea-6297-1df2-0037-8c00fa36812b@suse.de>
 <CAFPSGXb-pbmXFXrN7adK1TO+09T8qtJjwk+dK-TidZSsfPqHFg@mail.gmail.com>
 <14abba97-2932-da13-982f-11adea52ded0@suse.de>
In-Reply-To: <14abba97-2932-da13-982f-11adea52ded0@suse.de>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Wed, 11 Dec 2019 11:00:05 +0800
Message-ID: <CAFPSGXY9=HcQWP0362entP49eA5PmAidTWtb2GhJTx2bwPqXmw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/8] drm/sprd: add Unisoc's drm kms master
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Baolin Wang <baolin.wang@linaro.org>, airlied@linux.ie,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1287034620=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1287034620==
Content-Type: multipart/alternative; boundary="0000000000001327e7059964d4ce"

--0000000000001327e7059964d4ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas
Thomas Zimmermann <tzimmermann@suse.de> =E4=BA=8E2019=E5=B9=B412=E6=9C=8810=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=888:47=E5=86=99=E9=81=93=EF=BC=
=9A

> Hi
>
> Am 10.12.19 um 13:38 schrieb tang pengchuan:
> > Hi
> >
> > Thomas Zimmermann <tzimmermann@suse.de <mailto:tzimmermann@suse.de>> =
=E4=BA=8E
> > 2019=E5=B9=B412=E6=9C=8810=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=
=886:33=E5=86=99=E9=81=93=EF=BC=9A
> >
> >     Hi
> >
> >     Am 10.12.19 um 09:36 schrieb Kevin Tang:
> >     > From: Kevin Tang <kevin.tang@unisoc.com
> >     <mailto:kevin.tang@unisoc.com>>
> >     >
> >     > Adds drm support for the Unisoc's display subsystem.
> >     >
> >     > This is drm device and gem driver. This driver provides support
> >     for the
> >     > Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher=
.
> >     >
> >     > Cc: Orson Zhai <orsonzhai@gmail.com <mailto:orsonzhai@gmail.com>>
> >     > Cc: Baolin Wang <baolin.wang@linaro.org
> >     <mailto:baolin.wang@linaro.org>>
> >     > Cc: Chunyan Zhang <zhang.lyra@gmail.com <mailto:
> zhang.lyra@gmail.com>>
> >     > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com
> >     <mailto:kevin.tang@unisoc.com>>
> >     > ---
> >     >  drivers/gpu/drm/Kconfig         |   2 +
> >     >  drivers/gpu/drm/Makefile        |   1 +
> >     >  drivers/gpu/drm/sprd/Kconfig    |  14 ++
> >     >  drivers/gpu/drm/sprd/Makefile   |   8 ++
> >     >  drivers/gpu/drm/sprd/sprd_drm.c | 287
> >     ++++++++++++++++++++++++++++++++++++++++
> >     >  drivers/gpu/drm/sprd/sprd_drm.h |  19 +++
> >     >  drivers/gpu/drm/sprd/sprd_gem.c | 178 +++++++++++++++++++++++++
> >     >  drivers/gpu/drm/sprd/sprd_gem.h |  30 +++++
> >
> >     The GEM implementation looks like DRM's CMA helpers. Can you not us=
e
> CMA
> >     helpers instead?
> >
> > Ok, i will remove cma keywords from the GEM implementatio.
>
> I'm not quite sure what you mean. Why can you not use the existing CMA
> helpers instead of writing your own?
>
My previous understanding was wrong, our Soc not support CMA, We only
support reserved memory or scattered buffers via iommu

>
> Best regards
> Thomas
>
> >
> >
> >     >  8 files changed, 539 insertions(+)
> >     >  create mode 100644 drivers/gpu/drm/sprd/Kconfig
> >     >  create mode 100644 drivers/gpu/drm/sprd/Makefile
> >     >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
> >     >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> >     >  create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c
> >     >  create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h
> >     >
> >     > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >     > index bfdadc3..cead12c 100644
> >     > --- a/drivers/gpu/drm/Kconfig
> >     > +++ b/drivers/gpu/drm/Kconfig
> >     > @@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
> >     >
> >     >  source "drivers/gpu/drm/mcde/Kconfig"
> >     >
> >     > +source "drivers/gpu/drm/sprd/Kconfig"
> >     > +
> >     >  # Keep legacy drivers last
> >     >
> >     >  menuconfig DRM_LEGACY
> >     > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> >     > index 9f1c7c4..85ca211 100644
> >     > --- a/drivers/gpu/drm/Makefile
> >     > +++ b/drivers/gpu/drm/Makefile
> >     > @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  +=3D lima/
> >     >  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/
> >     >  obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
> >     >  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
> >     > +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> >     > diff --git a/drivers/gpu/drm/sprd/Kconfig
> >     b/drivers/gpu/drm/sprd/Kconfig
> >     > new file mode 100644
> >     > index 0000000..79f286b
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/Kconfig
> >     > @@ -0,0 +1,14 @@
> >     > +config DRM_SPRD
> >     > +     tristate "DRM Support for Unisoc SoCs Platform"
> >     > +     depends on ARCH_SPRD
> >     > +     depends on DRM && OF
> >     > +     select DRM_KMS_HELPER
> >     > +     select DRM_GEM_CMA_HELPER
> >     > +     select DRM_KMS_CMA_HELPER
> >     > +     select DRM_MIPI_DSI
> >     > +     select DRM_PANEL
> >     > +     select VIDEOMODE_HELPERS
> >     > +     select BACKLIGHT_CLASS_DEVICE
> >     > +     help
> >     > +       Choose this option if you have a Unisoc chipsets.
> >     > +       If M is selected the module will be called sprd-drm.
> >     > \ No newline at end of file
> >     > diff --git a/drivers/gpu/drm/sprd/Makefile
> >     b/drivers/gpu/drm/sprd/Makefile
> >     > new file mode 100644
> >     > index 0000000..df0b316
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/Makefile
> >     > @@ -0,0 +1,8 @@
> >     > +# SPDX-License-Identifier: GPL-2.0
> >     > +
> >     > +ccflags-y +=3D -Iinclude/drm
> >     > +
> >     > +subdir-ccflags-y +=3D -I$(src)
> >     > +
> >     > +obj-y :=3D sprd_drm.o \
> >     > +     sprd_gem.o
> >     > \ No newline at end of file
> >     > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> >     b/drivers/gpu/drm/sprd/sprd_drm.c
> >     > new file mode 100644
> >     > index 0000000..ec16fee
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> >     > @@ -0,0 +1,287 @@
> >     > +// SPDX-License-Identifier: GPL-2.0
> >     > +/*
> >     > + * Copyright (C) 2019 Unisoc Inc.
> >     > + */
> >     > +
> >     > +#include <linux/component.h>
> >     > +#include <linux/dma-mapping.h>
> >     > +#include <linux/module.h>
> >     > +#include <linux/mutex.h>
> >     > +#include <linux/of_graph.h>
> >     > +#include <linux/of_platform.h>
> >     > +
> >     > +#include <drm/drm_atomic_helper.h>
> >     > +#include <drm/drm_crtc_helper.h>
> >     > +#include <drm/drm_drv.h>
> >     > +#include <drm/drm_gem_cma_helper.h>
> >     > +#include <drm/drm_gem_framebuffer_helper.h>
> >     > +#include <drm/drm_probe_helper.h>
> >     > +#include <drm/drm_vblank.h>
> >     > +
> >     > +#include "sprd_drm.h"
> >     > +#include "sprd_gem.h"
> >     > +
> >     > +#define DRIVER_NAME  "sprd"
> >     > +#define DRIVER_DESC  "Spreadtrum SoCs' DRM Driver"
> >     > +#define DRIVER_DATE  "20180501"
> >     > +#define DRIVER_MAJOR 1
> >     > +#define DRIVER_MINOR 0
> >     > +
> >     > +static const struct drm_mode_config_helper_funcs
> >     sprd_drm_mode_config_helper =3D {
> >     > +     .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> >     > +};
> >     > +
> >     > +static const struct drm_mode_config_funcs
> >     sprd_drm_mode_config_funcs =3D {
> >     > +     .fb_create =3D drm_gem_fb_create,
> >     > +     .atomic_check =3D drm_atomic_helper_check,
> >     > +     .atomic_commit =3D drm_atomic_helper_commit,
> >     > +};
> >     > +
> >     > +static void sprd_drm_mode_config_init(struct drm_device *drm)
> >     > +{
> >     > +     drm_mode_config_init(drm);
> >     > +
> >     > +     drm->mode_config.min_width =3D 0;
> >     > +     drm->mode_config.min_height =3D 0;
> >     > +     drm->mode_config.max_width =3D 8192;
> >     > +     drm->mode_config.max_height =3D 8192;
> >     > +     drm->mode_config.allow_fb_modifiers =3D true;
> >     > +
> >     > +     drm->mode_config.funcs =3D &sprd_drm_mode_config_funcs;
> >     > +     drm->mode_config.helper_private =3D
> &sprd_drm_mode_config_helper;
> >     > +}
> >     > +
> >     > +static const struct file_operations sprd_drm_fops =3D {
> >     > +     .owner          =3D THIS_MODULE,
> >     > +     .open           =3D drm_open,
> >     > +     .release        =3D drm_release,
> >     > +     .unlocked_ioctl =3D drm_ioctl,
> >     > +     .compat_ioctl   =3D drm_compat_ioctl,
> >     > +     .poll           =3D drm_poll,
> >     > +     .read           =3D drm_read,
> >     > +     .llseek         =3D no_llseek,
> >     > +     .mmap           =3D sprd_gem_cma_mmap,
> >     > +};
> >     > +
> >     > +static struct drm_driver sprd_drm_drv =3D {
> >     > +     .driver_features        =3D DRIVER_GEM | DRIVER_MODESET |
> >     > +                               DRIVER_ATOMIC | DRIVER_HAVE_IRQ,
> >     > +     .fops                   =3D &sprd_drm_fops,
> >     > +
> >     > +     .gem_vm_ops             =3D &drm_gem_cma_vm_ops,
> >     > +     .gem_free_object_unlocked       =3D sprd_gem_free_object,
> >     > +     .dumb_create            =3D sprd_gem_cma_dumb_create,
> >     > +
> >     > +     .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
> >     > +     .gem_prime_import       =3D drm_gem_prime_import,
> >     > +     .gem_prime_import_sg_table =3D sprd_gem_prime_import_sg_tab=
le,
> >     > +
> >     > +     .name                   =3D DRIVER_NAME,
> >     > +     .desc                   =3D DRIVER_DESC,
> >     > +     .date                   =3D DRIVER_DATE,
> >     > +     .major                  =3D DRIVER_MAJOR,
> >     > +     .minor                  =3D DRIVER_MINOR,
> >     > +};
> >     > +
> >     > +static int sprd_drm_bind(struct device *dev)
> >     > +{
> >     > +     struct drm_device *drm;
> >     > +     struct sprd_drm *sprd;
> >     > +     int err;
> >     > +
> >     > +     drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
> >     > +     if (IS_ERR(drm))
> >     > +             return PTR_ERR(drm);
> >     > +
> >     > +     dev_set_drvdata(dev, drm);
> >     > +
> >     > +     sprd =3D devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> >     > +     if (!sprd) {
> >     > +             err =3D -ENOMEM;
> >     > +             goto err_free_drm;
> >     > +     }
> >     > +     drm->dev_private =3D sprd;
> >     > +
> >     > +     sprd_drm_mode_config_init(drm);
> >     > +
> >     > +     /* bind and init sub drivers */
> >     > +     err =3D component_bind_all(drm->dev, drm);
> >     > +     if (err) {
> >     > +             DRM_ERROR("failed to bind all component.\n");
> >     > +             goto err_dc_cleanup;
> >     > +     }
> >     > +
> >     > +     /* vblank init */
> >     > +     err =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> >     > +     if (err) {
> >     > +             DRM_ERROR("failed to initialize vblank.\n");
> >     > +             goto err_unbind_all;
> >     > +     }
> >     > +     /* with irq_enabled =3D true, we can use the vblank feature=
. */
> >     > +     drm->irq_enabled =3D true;
> >     > +
> >     > +     /* reset all the states of crtc/plane/encoder/connector */
> >     > +     drm_mode_config_reset(drm);
> >     > +
> >     > +     /* init kms poll for handling hpd */
> >     > +     drm_kms_helper_poll_init(drm);
> >     > +
> >     > +     err =3D drm_dev_register(drm, 0);
> >     > +     if (err < 0)
> >     > +             goto err_kms_helper_poll_fini;
> >     > +
> >     > +     return 0;
> >     > +
> >     > +err_kms_helper_poll_fini:
> >     > +     drm_kms_helper_poll_fini(drm);
> >     > +err_unbind_all:
> >     > +     component_unbind_all(drm->dev, drm);
> >     > +err_dc_cleanup:
> >     > +     drm_mode_config_cleanup(drm);
> >     > +err_free_drm:
> >     > +     drm_dev_put(drm);
> >     > +     return err;
> >     > +}
> >     > +
> >     > +static void sprd_drm_unbind(struct device *dev)
> >     > +{
> >     > +     drm_put_dev(dev_get_drvdata(dev));
> >     > +}
> >     > +
> >     > +static const struct component_master_ops sprd_drm_component_ops =
=3D
> {
> >     > +     .bind =3D sprd_drm_bind,
> >     > +     .unbind =3D sprd_drm_unbind,
> >     > +};
> >     > +
> >     > +static int compare_of(struct device *dev, void *data)
> >     > +{
> >     > +     struct device_node *np =3D data;
> >     > +
> >     > +     DRM_DEBUG("compare %s\n", np->full_name);
> >     > +
> >     > +     return dev->of_node =3D=3D np;
> >     > +}
> >     > +
> >     > +static int sprd_drm_component_probe(struct device *dev,
> >     > +                        const struct component_master_ops *m_ops=
)
> >     > +{
> >     > +     struct device_node *ep, *port, *remote;
> >     > +     struct component_match *match =3D NULL;
> >     > +     int i;
> >     > +
> >     > +     if (!dev->of_node)
> >     > +             return -EINVAL;
> >     > +
> >     > +     /*
> >     > +      * Bind the crtc's ports first, so that
> >     drm_of_find_possible_crtcs()
> >     > +      * called from encoder's .bind callbacks works as expected
> >     > +      */
> >     > +     for (i =3D 0; ; i++) {
> >     > +             port =3D of_parse_phandle(dev->of_node, "ports", i)=
;
> >     > +             if (!port)
> >     > +                     break;
> >     > +
> >     > +             if (!of_device_is_available(port->parent)) {
> >     > +                     of_node_put(port);
> >     > +                     continue;
> >     > +             }
> >     > +
> >     > +             component_match_add(dev, &match, compare_of,
> >     port->parent);
> >     > +             of_node_put(port);
> >     > +     }
> >     > +
> >     > +     if (i =3D=3D 0) {
> >     > +             dev_err(dev, "missing 'ports' property\n");
> >     > +             return -ENODEV;
> >     > +     }
> >     > +
> >     > +     if (!match) {
> >     > +             dev_err(dev, "no available port\n");
> >     > +             return -ENODEV;
> >     > +     }
> >     > +
> >     > +     /*
> >     > +      * For bound crtcs, bind the encoders attached to their
> >     remote endpoint
> >     > +      */
> >     > +     for (i =3D 0; ; i++) {
> >     > +             port =3D of_parse_phandle(dev->of_node, "ports", i)=
;
> >     > +             if (!port)
> >     > +                     break;
> >     > +
> >     > +             if (!of_device_is_available(port->parent)) {
> >     > +                     of_node_put(port);
> >     > +                     continue;
> >     > +             }
> >     > +
> >     > +             for_each_child_of_node(port, ep) {
> >     > +                     remote =3D of_graph_get_remote_port_parent(=
ep);
> >     > +                     if (!remote ||
> >     !of_device_is_available(remote)) {
> >     > +                             of_node_put(remote);
> >     > +                             continue;
> >     > +                     } else if
> >     (!of_device_is_available(remote->parent)) {
> >     > +                             dev_warn(dev, "parent device of %s
> >     is not available\n",
> >     > +                                      remote->full_name);
> >     > +                             of_node_put(remote);
> >     > +                             continue;
> >     > +                     }
> >     > +
> >     > +                     component_match_add(dev, &match, compare_of=
,
> >     remote);
> >     > +                     of_node_put(remote);
> >     > +             }
> >     > +             of_node_put(port);
> >     > +     }
> >     > +
> >     > +     return component_master_add_with_match(dev, m_ops, match);
> >     > +}
> >     > +
> >     > +static int sprd_drm_probe(struct platform_device *pdev)
> >     > +{
> >     > +     int ret;
> >     > +
> >     > +     ret =3D dma_set_mask_and_coherent(&pdev->dev, ~0);
> >     > +     if (ret)
> >     > +             DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n"=
,
> >     ret);
> >     > +
> >     > +     return sprd_drm_component_probe(&pdev->dev,
> >     &sprd_drm_component_ops);
> >     > +}
> >     > +
> >     > +static int sprd_drm_remove(struct platform_device *pdev)
> >     > +{
> >     > +     component_master_del(&pdev->dev, &sprd_drm_component_ops);
> >     > +     return 0;
> >     > +}
> >     > +
> >     > +static void sprd_drm_shutdown(struct platform_device *pdev)
> >     > +{
> >     > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> >     > +
> >     > +     if (!drm) {
> >     > +             DRM_WARN("drm device is not available, no
> shutdown\n");
> >     > +             return;
> >     > +     }
> >     > +
> >     > +     drm_atomic_helper_shutdown(drm);
> >     > +}
> >     > +
> >     > +static const struct of_device_id sprd_drm_match_table[] =3D {
> >     > +     { .compatible =3D "sprd,display-subsystem",},
> >     > +     {},
> >     > +};
> >     > +MODULE_DEVICE_TABLE(of, sprd_drm_match_table);
> >     > +
> >     > +static struct platform_driver sprd_drm_driver =3D {
> >     > +     .probe =3D sprd_drm_probe,
> >     > +     .remove =3D sprd_drm_remove,
> >     > +     .shutdown =3D sprd_drm_shutdown,
> >     > +     .driver =3D {
> >     > +             .name =3D "sprd-drm-drv",
> >     > +             .of_match_table =3D sprd_drm_match_table,
> >     > +     },
> >     > +};
> >     > +
> >     > +module_platform_driver(sprd_drm_driver);
> >     > +
> >     > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com
> >     <mailto:leon.he@unisoc.com>>");
> >     > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com
> >     <mailto:kevin.tang@unisoc.com>>");
> >     > +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> >     > +MODULE_LICENSE("GPL v2");
> >     > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> >     b/drivers/gpu/drm/sprd/sprd_drm.h
> >     > new file mode 100644
> >     > index 0000000..e840e65
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> >     > @@ -0,0 +1,19 @@
> >     > +/* SPDX-License-Identifier: GPL-2.0 */
> >     > +/*
> >     > + * Copyright (C) 2019 Unisoc Inc.
> >     > + */
> >     > +
> >     > +#ifndef _SPRD_DRM_H_
> >     > +#define _SPRD_DRM_H_
> >     > +
> >     > +#include <drm/drm_atomic.h>
> >     > +#include <drm/drm_print.h>
> >     > +
> >     > +struct sprd_drm {
> >     > +     struct drm_device *drm;
> >     > +     struct drm_atomic_state *state;
> >     > +     struct device *dpu_dev;
> >     > +     struct device *gsp_dev;
> >     > +};
> >     > +
> >     > +#endif /* _SPRD_DRM_H_ */
> >     > diff --git a/drivers/gpu/drm/sprd/sprd_gem.c
> >     b/drivers/gpu/drm/sprd/sprd_gem.c
> >     > new file mode 100644
> >     > index 0000000..c617c8b
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/sprd_gem.c
> >     > @@ -0,0 +1,178 @@
> >     > +// SPDX-License-Identifier: GPL-2.0
> >     > +/*
> >     > + * Copyright (C) 2019 Unisoc Inc.
> >     > + */
> >     > +
> >     > +#include <linux/dma-buf.h>
> >     > +#include <linux/pm_runtime.h>
> >     > +
> >     > +#include <drm/drm_prime.h>
> >     > +
> >     > +#include "sprd_drm.h"
> >     > +#include "sprd_gem.h"
> >     > +
> >     > +static struct sprd_gem_obj *sprd_gem_obj_create(struct drm_devic=
e
> >     *drm,
> >     > +                                             unsigned long size)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem;
> >     > +     int ret;
> >     > +
> >     > +     sprd_gem =3D kzalloc(sizeof(*sprd_gem), GFP_KERNEL);
> >     > +     if (!sprd_gem)
> >     > +             return ERR_PTR(-ENOMEM);
> >     > +
> >     > +     ret =3D drm_gem_object_init(drm, &sprd_gem->base, size);
> >     > +     if (ret < 0) {
> >     > +             DRM_ERROR("failed to initialize gem object\n");
> >     > +             goto error;
> >     > +     }
> >     > +
> >     > +     ret =3D drm_gem_create_mmap_offset(&sprd_gem->base);
> >     > +     if (ret) {
> >     > +             drm_gem_object_release(&sprd_gem->base);
> >     > +             goto error;
> >     > +     }
> >     > +
> >     > +     return sprd_gem;
> >     > +
> >     > +error:
> >     > +     kfree(sprd_gem);
> >     > +     return ERR_PTR(ret);
> >     > +}
> >     > +
> >     > +void sprd_gem_free_object(struct drm_gem_object *obj)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> >     > +
> >     > +     DRM_DEBUG("gem =3D %p\n", obj);
> >     > +
> >     > +     if (sprd_gem->vaddr)
> >     > +             dma_alloc_wc(obj->dev->dev, obj->size,
> >
> >     dma_free_wc
> >
> > Thanks for reminding
> >
> >
> >     Best regards
> >     Thomas
> >
> >     [1]
> >
> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/drm_gem_cma=
_helper.c
> >
> >
> >     > +                                   sprd_gem->vaddr,
> >     sprd_gem->dma_addr);
> >     > +     else if (sprd_gem->sgtb)
> >     > +             drm_prime_gem_destroy(obj, sprd_gem->sgtb);
> >     > +
> >     > +     drm_gem_object_release(obj);
> >     > +
> >     > +     kfree(sprd_gem);
> >     > +}
> >     > +
> >     > +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct
> >     drm_device *drm,
> >     > +                         struct drm_mode_create_dumb *args)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem;
> >     > +     int ret;
> >     > +
> >     > +     args->pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> >     > +     args->size =3D round_up(args->pitch * args->height, PAGE_SI=
ZE);
> >     > +
> >     > +     sprd_gem =3D sprd_gem_obj_create(drm, args->size);
> >     > +     if (IS_ERR(sprd_gem))
> >     > +             return PTR_ERR(sprd_gem);
> >     > +
> >     > +     sprd_gem->vaddr =3D dma_alloc_wc(drm->dev, args->size,
> >     > +                     &sprd_gem->dma_addr, GFP_KERNEL |
> >     __GFP_NOWARN | GFP_DMA);
> >     > +     if (!sprd_gem->vaddr) {
> >     > +             DRM_ERROR("failed to allocate buffer with size
> %llu\n",
> >     > +                       args->size);
> >     > +             ret =3D -ENOMEM;
> >     > +             goto error;
> >     > +     }
> >     > +
> >     > +     ret =3D drm_gem_handle_create(file_priv, &sprd_gem->base,
> >     &args->handle);
> >     > +     if (ret)
> >     > +             goto error;
> >     > +
> >     > +     drm_gem_object_put_unlocked(&sprd_gem->base);
> >     > +
> >     > +     return 0;
> >     > +
> >     > +error:
> >     > +     sprd_gem_free_object(&sprd_gem->base);
> >     > +     return ret;
> >     > +}
> >     > +
> >     > +static int sprd_gem_cma_object_mmap(struct drm_gem_object *obj,
> >     > +                                struct vm_area_struct *vma)
> >     > +
> >     > +{
> >     > +     int ret;
> >     > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> >     > +
> >     > +     vma->vm_flags &=3D ~VM_PFNMAP;
> >     > +     vma->vm_pgoff =3D 0;
> >     > +
> >     > +     ret =3D dma_mmap_wc(obj->dev->dev, vma,
> >     > +                                 sprd_gem->vaddr,
> sprd_gem->dma_addr,
> >     > +                                 vma->vm_end - vma->vm_start);
> >     > +     if (ret)
> >     > +             drm_gem_vm_close(vma);
> >     > +
> >     > +     return ret;
> >     > +}
> >     > +
> >     > +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct
> *vma)
> >     > +{
> >     > +     struct drm_gem_object *obj;
> >     > +     int ret;
> >     > +
> >     > +     ret =3D drm_gem_mmap(filp, vma);
> >     > +     if (ret)
> >     > +             return ret;
> >     > +
> >     > +     obj =3D vma->vm_private_data;
> >     > +
> >     > +     return sprd_gem_cma_object_mmap(obj, vma);
> >     > +}
> >     > +
> >     > +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,
> >     > +                         struct vm_area_struct *vma)
> >     > +{
> >     > +     int ret;
> >     > +
> >     > +     ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> >     > +     if (ret)
> >     > +             return ret;
> >     > +
> >     > +     return sprd_gem_cma_object_mmap(obj, vma);
> >     > +}
> >     > +
> >     > +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct
> >     drm_gem_object *obj)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> >     > +     struct sg_table *sgtb;
> >     > +     int ret;
> >     > +
> >     > +     sgtb =3D kzalloc(sizeof(*sgtb), GFP_KERNEL);
> >     > +     if (!sgtb)
> >     > +             return ERR_PTR(-ENOMEM);
> >     > +
> >     > +     ret =3D dma_get_sgtable(obj->dev->dev, sgtb, sprd_gem->vadd=
r,
> >     > +                           sprd_gem->dma_addr, obj->size);
> >     > +     if (ret) {
> >     > +             DRM_ERROR("failed to allocate sg_table, %d\n", ret)=
;
> >     > +             kfree(sgtb);
> >     > +             return ERR_PTR(ret);
> >     > +     }
> >     > +
> >     > +     return sgtb;
> >     > +}
> >     > +
> >     > +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct
> >     drm_device *drm,
> >     > +             struct dma_buf_attachment *attach, struct sg_table
> >     *sgtb)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem;
> >     > +
> >     > +     sprd_gem =3D sprd_gem_obj_create(drm, attach->dmabuf->size)=
;
> >     > +     if (IS_ERR(sprd_gem))
> >     > +             return ERR_CAST(sprd_gem);
> >     > +
> >     > +     DRM_DEBUG("gem =3D %p\n", &sprd_gem->base);
> >     > +
> >     > +     if (sgtb->nents =3D=3D 1)
> >     > +             sprd_gem->dma_addr =3D sg_dma_address(sgtb->sgl);
> >     > +
> >     > +     sprd_gem->sgtb =3D sgtb;
> >     > +
> >     > +     return &sprd_gem->base;
> >     > +}
> >     > diff --git a/drivers/gpu/drm/sprd/sprd_gem.h
> >     b/drivers/gpu/drm/sprd/sprd_gem.h
> >     > new file mode 100644
> >     > index 0000000..4c10d8a
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/sprd_gem.h
> >     > @@ -0,0 +1,30 @@
> >     > +/* SPDX-License-Identifier: GPL-2.0 */
> >     > +/*
> >     > + * Copyright (C) 2019 Unisoc Inc.
> >     > + */
> >     > +
> >     > +#ifndef _SPRD_GEM_H_
> >     > +#define _SPRD_GEM_H_
> >     > +
> >     > +#include <drm/drm_gem.h>
> >     > +
> >     > +struct sprd_gem_obj {
> >     > +     struct drm_gem_object   base;
> >     > +     dma_addr_t              dma_addr;
> >     > +     struct sg_table         *sgtb;
> >     > +     void                    *vaddr;
> >     > +};
> >     > +
> >     > +#define to_sprd_gem_obj(x)   container_of(x, struct sprd_gem_obj=
,
> >     base)
> >     > +
> >     > +void sprd_gem_free_object(struct drm_gem_object *gem);
> >     > +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct
> >     drm_device *dev,
> >     > +                         struct drm_mode_create_dumb *args);
> >     > +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct
> *vma);
> >     > +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,
> >     > +                      struct vm_area_struct *vma);
> >     > +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct
> >     drm_gem_object *obj);
> >     > +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct
> >     drm_device *dev,
> >     > +             struct dma_buf_attachment *attach, struct sg_table
> >     *sgtb);
> >     > +
> >     > +#endif
> >     >
> >
> >     --
> >     Thomas Zimmermann
> >     Graphics Driver Developer
> >     SUSE Software Solutions Germany GmbH
> >     Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >     (HRB 36809, AG N=C3=BCrnberg)
> >     Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
>

--0000000000001327e7059964d4ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBUaG9tYXM8YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
cXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5UaG9tYXMgWmltbWVybWFu
biAmbHQ7PGEgaHJlZj0ibWFpbHRvOnR6aW1tZXJtYW5uQHN1c2UuZGUiPnR6aW1tZXJtYW5uQHN1
c2UuZGU8L2E+Jmd0OyDkuo4yMDE55bm0MTLmnIgxMOaXpeWRqOS6jCDkuIvljYg4OjQ35YaZ6YGT
77yaPGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0
KTtwYWRkaW5nLWxlZnQ6MWV4Ij5IaTxicj4NCjxicj4NCkFtIDEwLjEyLjE5IHVtIDEzOjM4IHNj
aHJpZWIgdGFuZyBwZW5nY2h1YW46PGJyPg0KJmd0OyBIaTxicj4NCiZndDsgPGJyPg0KJmd0OyBU
aG9tYXMgWmltbWVybWFubiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnR6aW1tZXJtYW5uQHN1c2UuZGUi
IHRhcmdldD0iX2JsYW5rIj50emltbWVybWFubkBzdXNlLmRlPC9hPiAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzp0emltbWVybWFubkBzdXNlLmRlIiB0YXJnZXQ9Il9ibGFuayI+dHppbW1lcm1h
bm5Ac3VzZS5kZTwvYT4mZ3Q7Jmd0OyDkuo48YnI+DQomZ3Q7IDIwMTnlubQxMuaciDEw5pel5ZGo
5LqMIOS4i+WNiDY6MzPlhpnpgZPvvJo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEhpPGJy
Pg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBBbSAxMC4xMi4xOSB1bSAwOTozNiBzY2hyaWViIEtl
dmluIFRhbmc6PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBGcm9tOiBLZXZpbiBUYW5nICZsdDs8YSBo
cmVmPSJtYWlsdG86a2V2aW4udGFuZ0B1bmlzb2MuY29tIiB0YXJnZXQ9Il9ibGFuayI+a2V2aW4u
dGFuZ0B1bmlzb2MuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmtldmluLnRhbmdAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmtldmluLnRhbmdA
dW5pc29jLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7IEFkZHMgZHJtIHN1cHBvcnQgZm9yIHRoZSBVbmlzb2MmIzM5O3MgZGlzcGxheSBz
dWJzeXN0ZW0uPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgVGhp
cyBpcyBkcm0gZGV2aWNlIGFuZCBnZW0gZHJpdmVyLiBUaGlzIGRyaXZlciBwcm92aWRlcyBzdXBw
b3J0PGJyPg0KJmd0O8KgIMKgIMKgZm9yIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDsgRGlyZWN0
IFJlbmRlcmluZyBJbmZyYXN0cnVjdHVyZSAoRFJJKSBpbiBYRnJlZTg2IDQuMS4wIGFuZCBoaWdo
ZXIuPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgQ2M6IE9yc29u
IFpoYWkgJmx0OzxhIGhyZWY9Im1haWx0bzpvcnNvbnpoYWlAZ21haWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+b3Jzb256aGFpQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
b3Jzb256aGFpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm9yc29uemhhaUBnbWFpbC5jb208
L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IENjOiBCYW9saW4gV2FuZyAmbHQ7PGEg
aHJlZj0ibWFpbHRvOmJhb2xpbi53YW5nQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5iYW9s
aW4ud2FuZ0BsaW5hcm8ub3JnPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmJhb2xpbi53YW5nQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5iYW9saW4u
d2FuZ0BsaW5hcm8ub3JnPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBDYzogQ2h1
bnlhbiBaaGFuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnpoYW5nLmx5cmFAZ21haWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+emhhbmcubHlyYUBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnpoYW5nLmx5cmFAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+emhhbmcubHlyYUBn
bWFpbC5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFNpZ25lZC1vZmYtYnk6
IEtldmluIFRhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzprZXZpbi50YW5nQHVuaXNvYy5jb20iIHRh
cmdldD0iX2JsYW5rIj5rZXZpbi50YW5nQHVuaXNvYy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86a2V2aW4udGFuZ0B1bmlzb2MuY29tIiB0YXJnZXQ9
Il9ibGFuayI+a2V2aW4udGFuZ0B1bmlzb2MuY29tPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyAtLS08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgZHJpdmVycy9ncHUvZHJtL0tjb25m
aWfCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBkcml2ZXJz
L2dwdS9kcm0vTWFrZWZpbGXCoCDCoCDCoCDCoCB8wqAgwqAxICs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgZHJpdmVycy9ncHUvZHJtL3NwcmQvS2NvbmZpZ8KgIMKgIHzCoCAxNCArKzxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCBkcml2ZXJzL2dwdS9kcm0vc3ByZC9NYWtlZmlsZcKgIMKgfMKgIMKg
OCArKzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBkcml2ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2Ry
bS5jIHwgMjg3PGJyPg0KJmd0O8KgIMKgIMKgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBkcml2ZXJzL2dwdS9kcm0vc3ByZC9z
cHJkX2RybS5oIHzCoCAxOSArKys8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgZHJpdmVycy9ncHUv
ZHJtL3NwcmQvc3ByZF9nZW0uYyB8IDE3OCArKysrKysrKysrKysrKysrKysrKysrKysrPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZ2VtLmggfMKgIDMw
ICsrKysrPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBUaGUgR0VNIGltcGxlbWVudGF0aW9u
IGxvb2tzIGxpa2UgRFJNJiMzOTtzIENNQSBoZWxwZXJzLiBDYW4geW91IG5vdCB1c2UgQ01BPGJy
Pg0KJmd0O8KgIMKgIMKgaGVscGVycyBpbnN0ZWFkPzxicj4NCiZndDsgPGJyPg0KJmd0OyBPaywg
aSB3aWxsIHJlbW92ZSBjbWEga2V5d29yZHMgZnJvbSB0aGUgR0VNIGltcGxlbWVudGF0aW8uPGJy
Pg0KPGJyPg0KSSYjMzk7bSBub3QgcXVpdGUgc3VyZSB3aGF0IHlvdSBtZWFuLiBXaHkgY2FuIHlv
dSBub3QgdXNlIHRoZSBleGlzdGluZyBDTUE8YnI+DQpoZWxwZXJzIGluc3RlYWQgb2Ygd3JpdGlu
ZyB5b3VyIG93bj88YnI+PC9ibG9ja3F1b3RlPjxkaXY+PHNwYW4gY2xhc3M9ImdtYWlsLXRsaWQt
dHJhbnNsYXRpb24gZ21haWwtdHJhbnNsYXRpb24iIGxhbmc9ImVuIj48c3BhbiB0aXRsZT0iIiBj
bGFzcz0iZ21haWwtIj5NeSBwcmV2aW91cyB1bmRlcnN0YW5kaW5nIHdhcyB3cm9uZywgb3VyIFNv
YyBub3Qgc3VwcG9ydCBDTUEsIFdlIG9ubHkgc3VwcG9ydCByZXNlcnZlZCBtZW1vcnkgb3Igc2Nh
dHRlcmVkIGJ1ZmZlcnMgdmlhIGlvbW11PC9zcGFuPjwvc3Bhbj4gPGJyPjwvZGl2PjxibG9ja3F1
b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDti
b3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4N
Cjxicj4NCkJlc3QgcmVnYXJkczxicj4NClRob21hczxicj4NCjxicj4NCiZndDsgPGJyPg0KJmd0
OyA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgOCBmaWxlcyBjaGFuZ2VkLCA1MzkgaW5zZXJ0aW9u
cygrKTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3NwcmQvS2NvbmZpZzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL3NwcmQvTWFrZWZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHJtLmM8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9z
cHJkL3NwcmRfZHJtLmg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZ2VtLmM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZ2VtLmg8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZzxicj4NCiZndDvCoCDC
oCDCoCZndDsgaW5kZXggYmZkYWRjMy4uY2VhZDEyYyAxMDA2NDQ8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZzxicj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTM4
Nyw2ICszODcsOCBAQCBzb3VyY2UgJnF1b3Q7ZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9LY29uZmln
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIHNv
dXJjZSAmcXVvdDtkcml2ZXJzL2dwdS9kcm0vbWNkZS9LY29uZmlnJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc291cmNlICZxdW90O2RyaXZlcnMv
Z3B1L2RybS9zcHJkL0tjb25maWcmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgIyBLZWVwIGxlZ2FjeSBkcml2ZXJzIGxhc3Q8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgbWVudWNvbmZpZyBEUk1fTEVHQUNZ
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL01ha2Vm
aWxlIGIvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBpbmRl
eCA5ZjFjN2M0Li44NWNhMjExIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCZndDsgLS0tIGEvZHJp
dmVycy9ncHUvZHJtL01ha2VmaWxlPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArKysgYi9kcml2ZXJz
L2dwdS9kcm0vTWFrZWZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEBAIC0xMjIsMyArMTIyLDQg
QEAgb2JqLSQoQ09ORklHX0RSTV9MSU1BKcKgICs9IGxpbWEvPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIG9iai0kKENPTkZJR19EUk1fUEFORlJPU1QpICs9IHBhbmZyb3N0Lzxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCBvYmotJChDT05GSUdfRFJNX0FTUEVFRF9HRlgpICs9IGFzcGVlZC88YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgb2JqLSQoQ09ORklHX0RSTV9NQ0RFKSArPSBtY2RlLzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK29iai0kKENPTkZJR19EUk1fU1BSRCkgKz0gc3ByZC88YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3ByZC9LY29uZmlnPGJy
Pg0KJmd0O8KgIMKgIMKgYi9kcml2ZXJzL2dwdS9kcm0vc3ByZC9LY29uZmlnPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyBuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCZndDsgaW5k
ZXggMDAwMDAwMC4uNzlmMjg2Yjxicj4NCiZndDvCoCDCoCDCoCZndDsgLS0tIC9kZXYvbnVsbDxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL3NwcmQvS2NvbmZpZzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTAsMCArMSwxNCBAQDxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK2NvbmZpZyBEUk1fU1BSRDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgdHJpc3Rh
dGUgJnF1b3Q7RFJNIFN1cHBvcnQgZm9yIFVuaXNvYyBTb0NzIFBsYXRmb3JtJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkZXBlbmRzIG9uIEFSQ0hfU1BSRDxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgZGVwZW5kcyBvbiBEUk0gJmFtcDsmYW1wOyBPRjxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc2VsZWN0IERSTV9LTVNfSEVMUEVSPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqBzZWxlY3QgRFJNX0dFTV9DTUFfSEVMUEVSPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqBzZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqBzZWxlY3QgRFJNX01JUElfRFNJPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqBzZWxlY3QgRFJNX1BBTkVMPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqBzZWxlY3QgVklERU9NT0RFX0hFTFBFUlM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoHNlbGVjdCBCQUNLTElHSFRfQ0xBU1NfREVWSUNFPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqBoZWxwPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqBDaG9vc2UgdGhp
cyBvcHRpb24gaWYgeW91IGhhdmUgYSBVbmlzb2MgY2hpcHNldHMuPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAgwqBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxs
ZWQgc3ByZC1kcm0uPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBcIE5vIG5ld2xpbmUgYXQgZW5kIG9m
IGZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c3ByZC9NYWtlZmlsZTxicj4NCiZndDvCoCDCoCDCoGIvZHJpdmVycy9ncHUvZHJtL3NwcmQvTWFr
ZWZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyBpbmRleCAwMDAwMDAwLi5kZjBiMzE2PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyAtLS0gL2Rldi9udWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArKysgYi9kcml2ZXJzL2dwdS9k
cm0vc3ByZC9NYWtlZmlsZTxicj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTAsMCArMSw4IEBAPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMDxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK2NjZmxhZ3MteSAr
PSAtSWluY2x1ZGUvZHJtPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArc3ViZGlyLWNjZmxhZ3MteSArPSAtSSQoc3JjKTxicj4NCiZndDvCoCDCoCDCoCZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCZndDsgK29iai15IDo9IHNwcmRfZHJtLm8gXDxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgc3ByZF9nZW0ubzxicj4NCiZndDvCoCDCoCDCoCZndDsgXCBO
byBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYzxicj4NCiZndDvCoCDCoCDCoGIvZHJp
dmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYzxicj4NCiZndDvCoCDCoCDCoCZndDsgbmV3IGZp
bGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGluZGV4IDAwMDAwMDAuLmVjMTZm
ZWU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0tLSAvZGV2L251bGw8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHJtLmM8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7IEBAIC0wLDAgKzEsMjg3IEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvKjxicj4N
CiZndDvCoCDCoCDCoCZndDsgKyAqIENvcHlyaWdodCAoQykgMjAxOSBVbmlzb2MgSW5jLjxicj4N
CiZndDvCoCDCoCDCoCZndDsgKyAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtsaW51eC9jb21wb25lbnQuaCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7bGludXgvZG1hLW1hcHBpbmcuaCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7bGludXgvbW9kdWxlLmgmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2xpbnV4L211dGV4LmgmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2xpbnV4L29mX2dyYXBoLmgmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2xpbnV4L29mX3BsYXRmb3JtLmgmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2RybS9k
cm1fYXRvbWljX2hlbHBlci5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZs
dDtkcm0vZHJtX2NydGNfaGVscGVyLmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1
ZGUgJmx0O2RybS9kcm1fZHJ2LmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUg
Jmx0O2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsj
aW5jbHVkZSAmbHQ7ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmgmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2RybS9kcm1fcHJvYmVfaGVscGVyLmgmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2RybS9kcm1fdmJsYW5rLmgmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUgJnF1
b3Q7c3ByZF9kcm0uaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZxdW90
O3NwcmRfZ2VtLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICsjZGVmaW5lIERSSVZFUl9OQU1FwqAgJnF1b3Q7c3ByZCZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCZndDsgKyNkZWZpbmUgRFJJVkVSX0RFU0PCoCAmcXVvdDtTcHJlYWR0cnVtIFNvQ3Mm
IzM5OyBEUk0gRHJpdmVyJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2RlZmluZSBEUklW
RVJfREFURcKgICZxdW90OzIwMTgwNTAxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2Rl
ZmluZSBEUklWRVJfTUFKT1IgMTxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNkZWZpbmUgRFJJVkVS
X01JTk9SIDA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfZnVuY3M8YnI+DQomZ3Q7
wqAgwqAgwqBzcHJkX2RybV9tb2RlX2NvbmZpZ19oZWxwZXIgPSB7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAuYXRvbWljX2NvbW1pdF90YWlsID0gZHJtX2F0b21pY19oZWxwZXJfY29t
bWl0X3RhaWxfcnBtLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK307PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9k
ZV9jb25maWdfZnVuY3M8YnI+DQomZ3Q7wqAgwqAgwqBzcHJkX2RybV9tb2RlX2NvbmZpZ19mdW5j
cyA9IHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5mYl9jcmVhdGUgPSBkcm1fZ2Vt
X2ZiX2NyZWF0ZSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5hdG9taWNfY2hlY2sg
PSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjayw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oC5hdG9taWNfY29tbWl0ID0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0LDxicj4NCiZndDvCoCDC
oCDCoCZndDsgK307PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArc3RhdGljIHZvaWQgc3ByZF9kcm1fbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoGRybV9tb2RlX2NvbmZpZ19pbml0KGRybSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0O21vZGVfY29uZmlnLm1pbl93
aWR0aCA9IDA7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0O21vZGVfY29u
ZmlnLm1pbl9oZWlnaHQgPSAwOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtLSZn
dDttb2RlX2NvbmZpZy5tYXhfd2lkdGggPSA4MTkyOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgZHJtLSZndDttb2RlX2NvbmZpZy5tYXhfaGVpZ2h0ID0gODE5Mjs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoGRybS0mZ3Q7bW9kZV9jb25maWcuYWxsb3dfZmJfbW9kaWZpZXJz
ID0gdHJ1ZTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoGRybS0mZ3Q7bW9kZV9jb25maWcuZnVuY3MgPSAmYW1wO3NwcmRfZHJtX21vZGVfY29u
ZmlnX2Z1bmNzOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtLSZndDttb2RlX2Nv
bmZpZy5oZWxwZXJfcHJpdmF0ZSA9ICZhbXA7c3ByZF9kcm1fbW9kZV9jb25maWdfaGVscGVyOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBzcHJkX2Ry
bV9mb3BzID0gezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLm93bmVywqAgwqAgwqAg
wqAgwqAgPSBUSElTX01PRFVMRSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5vcGVu
wqAgwqAgwqAgwqAgwqAgwqA9IGRybV9vcGVuLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgLnJlbGVhc2XCoCDCoCDCoCDCoCA9IGRybV9yZWxlYXNlLDxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgLnVubG9ja2VkX2lvY3RsID0gZHJtX2lvY3RsLDxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgLmNvbXBhdF9pb2N0bMKgIMKgPSBkcm1fY29tcGF0X2lvY3RsLDxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLnBvbGzCoCDCoCDCoCDCoCDCoCDCoD0gZHJtX3Bv
bGwsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAucmVhZMKgIMKgIMKgIMKgIMKgIMKg
PSBkcm1fcmVhZCw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5sbHNlZWvCoCDCoCDC
oCDCoCDCoD0gbm9fbGxzZWVrLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLm1tYXDC
oCDCoCDCoCDCoCDCoCDCoD0gc3ByZF9nZW1fY21hX21tYXAsPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArfTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0
aWMgc3RydWN0IGRybV9kcml2ZXIgc3ByZF9kcm1fZHJ2ID0gezxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgLmRyaXZlcl9mZWF0dXJlc8KgIMKgIMKgIMKgID0gRFJJVkVSX0dFTSB8IERS
SVZFUl9NT0RFU0VUIHw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERSSVZFUl9BVE9NSUMgfCBEUklWRVJfSEFWRV9J
UlEsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAuZm9wc8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgPSAmYW1wO3NwcmRfZHJtX2ZvcHMsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAuZ2VtX3ZtX29wc8KgIMKgIMKgIMKgIMKg
IMKgIMKgPSAmYW1wO2RybV9nZW1fY21hX3ZtX29wcyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoC5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWTCoCDCoCDCoCDCoD0gc3ByZF9nZW1fZnJl
ZV9vYmplY3QsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAuZHVtYl9jcmVhdGXCoCDC
oCDCoCDCoCDCoCDCoCA9IHNwcmRfZ2VtX2NtYV9kdW1iX2NyZWF0ZSw8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5wcmltZV9mZF90b19oYW5k
bGXCoCDCoCDCoD0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAuZ2VtX3ByaW1lX2ltcG9ydMKgIMKgIMKgIMKgPSBkcm1fZ2VtX3ByaW1l
X2ltcG9ydCw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5nZW1fcHJpbWVfaW1wb3J0
X3NnX3RhYmxlID0gc3ByZF9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlLDxicj4NCiZndDvCoCDC
oCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLm5hbWXCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoD0gRFJJVkVSX05BTUUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqAuZGVzY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPSBEUklWRVJfREVTQyw8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5kYXRlwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqA9IERSSVZFUl9EQVRFLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLm1h
am9ywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPSBEUklWRVJfTUFKT1IsPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqAubWlub3LCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA9IERS
SVZFUl9NSU5PUiw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0YXRpYyBpbnQgc3ByZF9kcm1fYmluZChzdHJ1
Y3QgZGV2aWNlICpkZXYpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgc3RydWN0IGRybV9kZXZpY2UgKmRybTs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoHN0cnVjdCBzcHJkX2RybSAqc3ByZDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoGludCBlcnI7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqBkcm0gPSBkcm1fZGV2X2FsbG9jKCZhbXA7c3ByZF9kcm1fZHJ2LCBk
ZXYpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKElTX0VSUihkcm0pKTxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIFBUUl9FUlIoZHJt
KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oGRldl9zZXRfZHJ2ZGF0YShkZXYsIGRybSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzcHJkID0gZGV2bV9remFsbG9jKGRybS0mZ3Q7ZGV2
LCBzaXplb2YoKnNwcmQpLCBHRlBfS0VSTkVMKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoGlmICghc3ByZCkgezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgZXJyID0gLUVOT01FTTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoGdvdG8gZXJyX2ZyZWVfZHJtOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtLSZndDtkZXZfcHJpdmF0ZSA9IHNwcmQ7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBz
cHJkX2RybV9tb2RlX2NvbmZpZ19pbml0KGRybSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAvKiBiaW5kIGFuZCBpbml0IHN1YiBkcml2ZXJz
ICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBlcnIgPSBjb21wb25lbnRfYmluZF9h
bGwoZHJtLSZndDtkZXYsIGRybSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAo
ZXJyKSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBEUk1fRVJS
T1IoJnF1b3Q7ZmFpbGVkIHRvIGJpbmQgYWxsIGNvbXBvbmVudC5cbiZxdW90Oyk7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVycl9kY19jbGVhbnVwOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLyogdmJsYW5rIGluaXQgKi88YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGVyciA9IGRybV92YmxhbmtfaW5pdChkcm0sIGRybS0mZ3Q7
bW9kZV9jb25maWcubnVtX2NydGMpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYg
KGVycikgezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX0VS
Uk9SKCZxdW90O2ZhaWxlZCB0byBpbml0aWFsaXplIHZibGFuay5cbiZxdW90Oyk7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVycl91bmJpbmRfYWxsOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgLyogd2l0aCBpcnFfZW5hYmxlZCA9IHRydWUsIHdlIGNhbiB1c2UgdGhlIHZibGFuayBm
ZWF0dXJlLiAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtLSZndDtpcnFfZW5h
YmxlZCA9IHRydWU7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqAvKiByZXNldCBhbGwgdGhlIHN0YXRlcyBvZiBjcnRjL3BsYW5lL2VuY29kZXIv
Y29ubmVjdG9yICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm1fbW9kZV9jb25m
aWdfcmVzZXQoZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoC8qIGluaXQga21zIHBvbGwgZm9yIGhhbmRsaW5nIGhwZCAqLzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0KGRybSk7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBlcnIg
PSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqBpZiAoZXJyICZsdDsgMCk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoGdvdG8gZXJyX2ttc19oZWxwZXJfcG9sbF9maW5pOzxicj4NCiZndDvCoCDCoCDCoCZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIDA7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArZXJyX2ttc19oZWxwZXJfcG9sbF9maW5p
Ojxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtX2ttc19oZWxwZXJfcG9sbF9maW5p
KGRybSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArZXJyX3VuYmluZF9hbGw6PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqBjb21wb25lbnRfdW5iaW5kX2FsbChkcm0tJmd0O2RldiwgZHJt
KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtlcnJfZGNfY2xlYW51cDo8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArZXJyX2ZyZWVfZHJtOjxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
ZHJtX2Rldl9wdXQoZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiBl
cnI7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4N
CiZndDvCoCDCoCDCoCZndDsgK3N0YXRpYyB2b2lkIHNwcmRfZHJtX3VuYmluZChzdHJ1Y3QgZGV2
aWNlICpkZXYpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgZHJtX3B1dF9kZXYoZGV2X2dldF9kcnZkYXRhKGRldikpOzxicj4NCiZndDvCoCDC
oCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9tYXN0ZXJfb3BzIHNwcmRfZHJtX2NvbXBv
bmVudF9vcHMgPSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAuYmluZCA9IHNwcmRf
ZHJtX2JpbmQsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAudW5iaW5kID0gc3ByZF9k
cm1fdW5iaW5kLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK307PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIGludCBjb21wYXJlX29mKHN0cnVjdCBk
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGF0YTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoERSTV9E
RUJVRygmcXVvdDtjb21wYXJlICVzXG4mcXVvdDssIG5wLSZndDtmdWxsX25hbWUpOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIGRl
di0mZ3Q7b2Zfbm9kZSA9PSBucDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIGludCBzcHJkX2RybV9j
b21wb25lbnRfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2LDxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnN0IHN0cnVjdCBjb21wb25l
bnRfbWFzdGVyX29wcyAqbV9vcHMpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IGRldmljZV9ub2RlICplcCwgKnBvcnQsICpyZW1v
dGU7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1Y3QgY29tcG9uZW50X21hdGNo
ICptYXRjaCA9IE5VTEw7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpbnQgaTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmICgh
ZGV2LSZndDtvZl9ub2RlKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgcmV0dXJuIC1FSU5WQUw7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAvKjxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgICogQmlu
ZCB0aGUgY3J0YyYjMzk7cyBwb3J0cyBmaXJzdCwgc28gdGhhdDxicj4NCiZndDvCoCDCoCDCoGRy
bV9vZl9maW5kX3Bvc3NpYmxlX2NydGNzKCk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oCAqIGNhbGxlZCBmcm9tIGVuY29kZXImIzM5O3MgLmJpbmQgY2FsbGJhY2tzIHdvcmtzIGFzIGV4
cGVjdGVkPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgKi88YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoGZvciAoaSA9IDA7IDsgaSsrKSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwb3J0ID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtJmd0O29m
X25vZGUsICZxdW90O3BvcnRzJnF1b3Q7LCBpKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoGlmICghcG9ydCk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFvZl9kZXZpY2Vf
aXNfYXZhaWxhYmxlKHBvcnQtJmd0O3BhcmVudCkpIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9mX25vZGVfcHV0KHBvcnQpOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wb25lbnRfbWF0Y2hfYWRkKGRldiwgJmFtcDttYXRjaCwgY29tcGFyZV9vZiw8YnI+DQomZ3Q7
wqAgwqAgwqBwb3J0LSZndDtwYXJlbnQpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgb2Zfbm9kZV9wdXQocG9ydCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqBpZiAoaSA9PSAwKSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqBkZXZfZXJyKGRldiwgJnF1b3Q7bWlzc2luZyAmIzM5O3BvcnRzJiMzOTsgcHJvcGVydHlc
biZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1
cm4gLUVOT0RFVjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmICghbWF0Y2gpIHs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl9lcnIoZGV2LCAm
cXVvdDtubyBhdmFpbGFibGUgcG9ydFxuJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRU5PREVWOzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgLyo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCAqIEZvciBib3VuZCBj
cnRjcywgYmluZCB0aGUgZW5jb2RlcnMgYXR0YWNoZWQgdG8gdGhlaXI8YnI+DQomZ3Q7wqAgwqAg
wqByZW1vdGUgZW5kcG9pbnQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCAqLzxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZm9yIChpID0gMDsgOyBpKyspIHs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBvcnQgPSBvZl9wYXJzZV9waGFuZGxl
KGRldi0mZ3Q7b2Zfbm9kZSwgJnF1b3Q7cG9ydHMmcXVvdDssIGkpOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFwb3J0KTxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAo
IW9mX2RldmljZV9pc19hdmFpbGFibGUocG9ydC0mZ3Q7cGFyZW50KSkgezxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb2Zfbm9kZV9wdXQocG9y
dCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb250aW51ZTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH08
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoGZvcl9lYWNoX2NoaWxkX29mX25vZGUocG9ydCwgZXApIHs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlbW90ZSA9IG9mX2dy
YXBoX2dldF9yZW1vdGVfcG9ydF9wYXJlbnQoZXApOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFyZW1vdGUgfHw8YnI+DQomZ3Q7wqAg
wqAgwqAhb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUpKSB7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvZl9ub2Rl
X3B1dChyZW1vdGUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9IGVsc2UgaWY8YnI+DQomZ3Q7wqAgwqAg
wqAoIW9mX2RldmljZV9pc19hdmFpbGFibGUocmVtb3RlLSZndDtwYXJlbnQpKSB7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBkZXZfd2FybihkZXYsICZxdW90O3BhcmVudCBkZXZpY2Ugb2YgJXM8YnI+DQomZ3Q7wqAgwqAg
wqBpcyBub3QgYXZhaWxhYmxlXG4mcXVvdDssPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVtb3Rl
LSZndDtmdWxsX25hbWUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb2Zfbm9kZV9wdXQocmVtb3RlKTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNvbnRpbnVlOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcG9uZW50X21hdGNoX2FkZChkZXYs
ICZhbXA7bWF0Y2gsIGNvbXBhcmVfb2YsPGJyPg0KJmd0O8KgIMKgIMKgcmVtb3RlKTs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9mX25vZGVf
cHV0KHJlbW90ZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBvZl9ub2RlX3B1dChw
b3J0KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiBjb21wb25lbnRfbWFz
dGVyX2FkZF93aXRoX21hdGNoKGRldiwgbV9vcHMsIG1hdGNoKTs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3Rh
dGljIGludCBzcHJkX2RybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTxicj4N
CiZndDvCoCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGludCBy
ZXQ7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqByZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KCZhbXA7cGRldi0mZ3Q7ZGV2LCB+MCk7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAocmV0KTxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX0VSUk9SKCZxdW90O2RtYV9zZXRfbWFza19h
bmRfY29oZXJlbnQgZmFpbGVkICglZClcbiZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqByZXQpOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0
dXJuIHNwcmRfZHJtX2NvbXBvbmVudF9wcm9iZSgmYW1wO3BkZXYtJmd0O2Rldiw8YnI+DQomZ3Q7
wqAgwqAgwqAmYW1wO3NwcmRfZHJtX2NvbXBvbmVudF9vcHMpOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0
aWMgaW50IHNwcmRfZHJtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTxicj4N
CiZndDvCoCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGNvbXBv
bmVudF9tYXN0ZXJfZGVsKCZhbXA7cGRldi0mZ3Q7ZGV2LCAmYW1wO3NwcmRfZHJtX2NvbXBvbmVu
dF9vcHMpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIDA7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDC
oCZndDsgK3N0YXRpYyB2b2lkIHNwcmRfZHJtX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBk
ZXYpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgaWYgKCFkcm0pIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oERSTV9XQVJOKCZxdW90O2RybSBkZXZpY2UgaXMgbm90IGF2YWlsYWJsZSwgbm8gc2h1dGRvd25c
biZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1
cm47PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm1fYXRvbWljX2hlbHBlcl9zaHV0
ZG93bihkcm0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBzcHJkX2RybV9tYXRjaF90YWJsZVtdID0gezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgeyAuY29tcGF0aWJsZSA9ICZxdW90O3NwcmQsZGlzcGxheS1zdWJzeXN0ZW0mcXVvdDssfSw8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHt9LDxicj4NCiZndDvCoCDCoCDCoCZndDsg
K307PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3ByZF9k
cm1fbWF0Y2hfdGFibGUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDC
oCZndDsgK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNwcmRfZHJtX2RyaXZlciA9IHs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5wcm9iZSA9IHNwcmRfZHJtX3Byb2JlLDxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLnJlbW92ZSA9IHNwcmRfZHJtX3JlbW92ZSw8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5zaHV0ZG93biA9IHNwcmRfZHJtX3NodXRk
b3duLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmRyaXZlciA9IHs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoC5uYW1lID0gJnF1b3Q7c3ByZC1kcm0t
ZHJ2JnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgLm9m
X21hdGNoX3RhYmxlID0gc3ByZF9kcm1fbWF0Y2hfdGFibGUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqB9LDxicj4NCiZndDvCoCDCoCDCoCZndDsgK307PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzcHJk
X2RybV9kcml2ZXIpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK01PRFVMRV9BVVRIT1IoJnF1b3Q7TGVvbiBIZSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxlb24u
aGVAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmxlb24uaGVAdW5pc29jLmNvbTwvYT48YnI+
DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpsZW9uLmhlQHVuaXNvYy5j
b20iIHRhcmdldD0iX2JsYW5rIj5sZW9uLmhlQHVuaXNvYy5jb208L2E+Jmd0OyZndDsmcXVvdDsp
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK01PRFVMRV9BVVRIT1IoJnF1b3Q7S2V2aW4gVGFuZyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmtldmluLnRhbmdAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmtldmluLnRhbmdAdW5pc29jLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzprZXZpbi50YW5nQHVuaXNvYy5jb20iIHRhcmdldD0iX2JsYW5rIj5rZXZp
bi50YW5nQHVuaXNvYy5jb208L2E+Jmd0OyZndDsmcXVvdDspOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK01PRFVMRV9ERVNDUklQVElPTigmcXVvdDtVbmlzb2MgRFJNIEtNUyBNYXN0ZXIgRHJpdmVy
JnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtNT0RVTEVfTElDRU5TRSgmcXVvdDtHUEwg
djImcXVvdDspOzxicj4NCiZndDvCoCDCoCDCoCZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zcHJkL3NwcmRfZHJtLmg8YnI+DQomZ3Q7wqAgwqAgwqBiL2RyaXZlcnMvZ3B1L2RybS9z
cHJkL3NwcmRfZHJtLmg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBpbmRleCAwMDAwMDAwLi5lODQwZTY1PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyAtLS0gL2Rldi9udWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2RybS5oPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBAQCAtMCww
ICsxLDE5IEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAgKi88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvKjxicj4NCiZndDvCoCDCoCDC
oCZndDsgKyAqIENvcHlyaWdodCAoQykgMjAxOSBVbmlzb2MgSW5jLjxicj4NCiZndDvCoCDCoCDC
oCZndDsgKyAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyNpZm5kZWYgX1NQUkRfRFJNX0hfPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2RlZmluZSBfU1BS
RF9EUk1fSF88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsj
aW5jbHVkZSAmbHQ7ZHJtL2RybV9hdG9taWMuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsj
aW5jbHVkZSAmbHQ7ZHJtL2RybV9wcmludC5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK3N0cnVjdCBzcHJkX2RybSB7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlOzxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IGRldmljZSAqZHB1X2Rldjs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBkZXZpY2UgKmdzcF9kZXY7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArfTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsj
ZW5kaWYgLyogX1NQUkRfRFJNX0hfICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9nZW0uYzxicj4NCiZndDvCoCDCoCDCoGIvZHJp
dmVycy9ncHUvZHJtL3NwcmQvc3ByZF9nZW0uYzxicj4NCiZndDvCoCDCoCDCoCZndDsgbmV3IGZp
bGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGluZGV4IDAwMDAwMDAuLmM2MTdj
OGI8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0tLSAvZGV2L251bGw8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZ2VtLmM8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7IEBAIC0wLDAgKzEsMTc4IEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvKjxicj4N
CiZndDvCoCDCoCDCoCZndDsgKyAqIENvcHlyaWdodCAoQykgMjAxOSBVbmlzb2MgSW5jLjxicj4N
CiZndDvCoCDCoCDCoCZndDsgKyAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtsaW51eC9kbWEtYnVmLmgmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2xpbnV4L3BtX3J1bnRpbWUuaCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHJtL2Ry
bV9wcmltZS5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKyNpbmNsdWRlICZxdW90O3NwcmRfZHJtLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICsjaW5jbHVkZSAmcXVvdDtzcHJkX2dlbS5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIHN0cnVjdCBzcHJkX2dlbV9vYmogKnNwcmRf
Z2VtX29ial9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAqZHJtLDxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyBzaXplKTxicj4N
CiZndDvCoCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVj
dCBzcHJkX2dlbV9vYmogKnNwcmRfZ2VtOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
aW50IHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoHNwcmRfZ2VtID0ga3phbGxvYyhzaXplb2YoKnNwcmRfZ2VtKSwgR0ZQX0tFUk5FTCk7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAoIXNwcmRfZ2VtKTxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBy
ZXQgPSBkcm1fZ2VtX29iamVjdF9pbml0KGRybSwgJmFtcDtzcHJkX2dlbS0mZ3Q7YmFzZSwgc2l6
ZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAocmV0ICZsdDsgMCkgezxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX0VSUk9SKCZxdW90O2Zh
aWxlZCB0byBpbml0aWFsaXplIGdlbSBvYmplY3RcbiZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVycm9yOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgcmV0ID0gZHJtX2dlbV9jcmVhdGVfbW1hcF9vZmZzZXQoJmFtcDtzcHJkX2dl
bS0mZ3Q7YmFzZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAocmV0KSB7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1fZ2VtX29iamVjdF9y
ZWxlYXNlKCZhbXA7c3ByZF9nZW0tJmd0O2Jhc2UpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJvcjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoHJldHVybiBzcHJkX2dlbTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICtlcnJvcjo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGtmcmVlKHNw
cmRfZ2VtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiBFUlJfUFRSKHJl
dCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4N
CiZndDvCoCDCoCDCoCZndDsgK3ZvaWQgc3ByZF9nZW1fZnJlZV9vYmplY3Qoc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmopPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgc3RydWN0IHNwcmRfZ2VtX29iaiAqc3ByZF9nZW0gPSB0b19zcHJkX2dl
bV9vYmoob2JqKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoERSTV9ERUJVRygmcXVvdDtnZW0gPSAlcFxuJnF1b3Q7LCBvYmopOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHNwcmRf
Z2VtLSZndDt2YWRkcik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oGRtYV9hbGxvY193YyhvYmotJmd0O2Rldi0mZ3Q7ZGV2LCBvYmotJmd0O3NpemUsPGJyPg0KJmd0
OyA8YnI+DQomZ3Q7wqAgwqAgwqBkbWFfZnJlZV93Yzxicj4NCiZndDsgPGJyPg0KJmd0OyBUaGFu
a3MgZm9yIHJlbWluZGluZzxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBC
ZXN0IHJlZ2FyZHM8YnI+DQomZ3Q7wqAgwqAgwqBUaG9tYXM8YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoFsxXTxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vY2dpdC5mcmVlZGVz
a3RvcC5vcmcvZHJtL2RybS10aXAvdHJlZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVs
cGVyLmMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vY2dpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS10aXAvdHJlZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFf
aGVscGVyLmM8L2E+PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3By
ZF9nZW0tJmd0O3ZhZGRyLDxicj4NCiZndDvCoCDCoCDCoHNwcmRfZ2VtLSZndDtkbWFfYWRkcik7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBlbHNlIGlmIChzcHJkX2dlbS0mZ3Q7c2d0
Yik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGRybV9wcmltZV9n
ZW1fZGVzdHJveShvYmosIHNwcmRfZ2VtLSZndDtzZ3RiKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRybV9nZW1fb2JqZWN0X3JlbGVhc2Uo
b2JqKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoGtmcmVlKHNwcmRfZ2VtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRfZ2VtX2NtYV9kdW1i
X2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwgc3RydWN0PGJyPg0KJmd0O8KgIMKg
IMKgZHJtX2RldmljZSAqZHJtLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdz
KTxicj4NCiZndDvCoCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oHN0cnVjdCBzcHJkX2dlbV9vYmogKnNwcmRfZ2VtOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgaW50IHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoGFyZ3MtJmd0O3BpdGNoID0gRElWX1JPVU5EX1VQKGFyZ3MtJmd0O3dpZHRo
ICogYXJncy0mZ3Q7YnBwLCA4KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGFyZ3Mt
Jmd0O3NpemUgPSByb3VuZF91cChhcmdzLSZndDtwaXRjaCAqIGFyZ3MtJmd0O2hlaWdodCwgUEFH
RV9TSVpFKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoHNwcmRfZ2VtID0gc3ByZF9nZW1fb2JqX2NyZWF0ZShkcm0sIGFyZ3MtJmd0O3NpemUp
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKElTX0VSUihzcHJkX2dlbSkpPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gUFRSX0VSUihz
cHJkX2dlbSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqBzcHJkX2dlbS0mZ3Q7dmFkZHIgPSBkbWFfYWxsb2Nfd2MoZHJtLSZndDtkZXYsIGFy
Z3MtJmd0O3NpemUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmYW1wO3NwcmRfZ2VtLSZndDtkbWFfYWRkciwgR0ZQX0tFUk5FTCB8PGJyPg0K
Jmd0O8KgIMKgIMKgX19HRlBfTk9XQVJOIHwgR0ZQX0RNQSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqBpZiAoIXNwcmRfZ2VtLSZndDt2YWRkcikgezxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX0VSUk9SKCZxdW90O2ZhaWxlZCB0byBhbGxvY2F0
ZSBidWZmZXIgd2l0aCBzaXplICVsbHVcbiZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFyZ3MtJmd0O3NpemUpOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gLUVOT01FTTs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyb3I7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXQgPSBkcm1fZ2VtX2hhbmRsZV9jcmVhdGUoZmlsZV9w
cml2LCAmYW1wO3NwcmRfZ2VtLSZndDtiYXNlLDxicj4NCiZndDvCoCDCoCDCoCZhbXA7YXJncy0m
Z3Q7aGFuZGxlKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChyZXQpPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGVycm9yOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtX2dlbV9v
YmplY3RfcHV0X3VubG9ja2VkKCZhbXA7c3ByZF9nZW0tJmd0O2Jhc2UpOzxicj4NCiZndDvCoCDC
oCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIDA7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArZXJyb3I6PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzcHJkX2dlbV9mcmVlX29iamVjdCgmYW1wO3NwcmRfZ2Vt
LSZndDtiYXNlKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiByZXQ7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCZndDsgK3N0YXRpYyBpbnQgc3ByZF9nZW1fY21hX29iamVjdF9tbWFwKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hKTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3s8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGludCByZXQ7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqBzdHJ1Y3Qgc3ByZF9nZW1fb2JqICpzcHJkX2dlbSA9IHRvX3NwcmRfZ2VtX29i
aihvYmopOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgdm1hLSZndDt2bV9mbGFncyAmYW1wOz0gflZNX1BGTk1BUDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoHZtYS0mZ3Q7dm1fcGdvZmYgPSAwOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0ID0gZG1hX21tYXBfd2Mob2Jq
LSZndDtkZXYtJmd0O2Rldiwgdm1hLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3ByZF9nZW0tJmd0O3ZhZGRy
LCBzcHJkX2dlbS0mZ3Q7ZG1hX2FkZHIsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2bWEtJmd0O3ZtX2VuZCAt
IHZtYS0mZ3Q7dm1fc3RhcnQpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHJl
dCk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGRybV9nZW1fdm1f
Y2xvc2Uodm1hKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvC
oCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK2ludCBzcHJkX2dlbV9jbWFfbW1h
cChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmo7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpbnQgcmV0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
cmV0ID0gZHJtX2dlbV9tbWFwKGZpbHAsIHZtYSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqBpZiAocmV0KTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
cmV0dXJuIHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoG9iaiA9IHZtYS0mZ3Q7dm1fcHJpdmF0ZV9kYXRhOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIHNwcmRfZ2VtX2Nt
YV9vYmplY3RfbW1hcChvYmosIHZtYSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK2ludCBzcHJkX2dlbV9jbWFf
cHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiw8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoGludCByZXQ7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqByZXQgPSBkcm1fZ2VtX21tYXBfb2JqKG9iaiwgb2JqLSZndDtz
aXplLCB2bWEpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHJldCk8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByZXQ7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gc3By
ZF9nZW1fY21hX29iamVjdF9tbWFwKG9iaiwgdm1hKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RydWN0IHNn
X3RhYmxlICpzcHJkX2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlKHN0cnVjdDxicj4NCiZndDvC
oCDCoCDCoGRybV9nZW1fb2JqZWN0ICpvYmopPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IHNwcmRfZ2VtX29iaiAqc3ByZF9nZW0g
PSB0b19zcHJkX2dlbV9vYmoob2JqKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0
cnVjdCBzZ190YWJsZSAqc2d0Yjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGludCBy
ZXQ7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqBzZ3RiID0ga3phbGxvYyhzaXplb2YoKnNndGIpLCBHRlBfS0VSTkVMKTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoGlmICghc2d0Yik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0ID0gZG1hX2dldF9zZ3Rh
YmxlKG9iai0mZ3Q7ZGV2LSZndDtkZXYsIHNndGIsIHNwcmRfZ2VtLSZndDt2YWRkciw8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHNwcmRfZ2VtLSZndDtkbWFfYWRkciwgb2JqLSZndDtzaXplKTs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoERSTV9FUlJPUigmcXVvdDtmYWlsZWQgdG8gYWxsb2NhdGUgc2dfdGFibGUsICVk
XG4mcXVvdDssIHJldCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqBrZnJlZShzZ3RiKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oHJldHVybiBFUlJfUFRSKHJldCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1
cm4gc2d0Yjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RydWN0IGRybV9nZW1fb2JqZWN0ICpzcHJkX2dlbV9w
cmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0PGJyPg0KJmd0O8KgIMKgIMKgZHJtX2RldmljZSAq
ZHJtLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRt
YV9idWZfYXR0YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFibGU8YnI+DQomZ3Q7wqAgwqAg
wqAqc2d0Yik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqBzdHJ1Y3Qgc3ByZF9nZW1fb2JqICpzcHJkX2dlbTs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNwcmRfZ2VtID0gc3ByZF9nZW1f
b2JqX2NyZWF0ZShkcm0sIGF0dGFjaC0mZ3Q7ZG1hYnVmLSZndDtzaXplKTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChJU19FUlIoc3ByZF9nZW0pKTxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIEVSUl9DQVNUKHNwcmRfZ2VtKTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoERSTV9E
RUJVRygmcXVvdDtnZW0gPSAlcFxuJnF1b3Q7LCAmYW1wO3NwcmRfZ2VtLSZndDtiYXNlKTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChz
Z3RiLSZndDtuZW50cyA9PSAxKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgc3ByZF9nZW0tJmd0O2RtYV9hZGRyID0gc2dfZG1hX2FkZHJlc3Moc2d0Yi0mZ3Q7c2ds
KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oHNwcmRfZ2VtLSZndDtzZ3RiID0gc2d0Yjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiAmYW1wO3NwcmRfZ2VtLSZndDtiYXNlOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2dlbS5oPGJyPg0KJmd0O8KgIMKgIMKgYi9kcml2
ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2dlbS5oPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBuZXcgZmls
ZSBtb2RlIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCZndDsgaW5kZXggMDAwMDAwMC4uNGMxMGQ4
YTxicj4NCiZndDvCoCDCoCDCoCZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9nZW0uaDxicj4NCiZndDvCoCDCoCDC
oCZndDsgQEAgLTAsMCArMSwzMCBAQDxicj4NCiZndDvCoCDCoCDCoCZndDsgKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArLyo8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTkgVW5pc29jIEluYy48YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsgKi88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICsjaWZuZGVmIF9TUFJEX0dFTV9IXzxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyNkZWZpbmUgX1NQUkRfR0VNX0hfPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2RybS9kcm1fZ2VtLmgmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RydWN0IHNwcmRfZ2VtX29iaiB7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1Y3QgZHJtX2dlbV9vYmplY3TCoCDCoGJh
c2U7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkbWFfYWRkcl90wqAgwqAgwqAgwqAg
wqAgwqAgwqAgZG1hX2FkZHI7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1Y3Qg
c2dfdGFibGXCoCDCoCDCoCDCoCDCoCpzZ3RiOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgdm9pZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICp2YWRkcjs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICt9Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKyNkZWZpbmUgdG9fc3ByZF9nZW1fb2JqKHgpwqAgwqBjb250YWluZXJfb2YoeCwgc3RydWN0
IHNwcmRfZ2VtX29iaiw8YnI+DQomZ3Q7wqAgwqAgwqBiYXNlKTxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3ZvaWQgc3ByZF9nZW1fZnJlZV9vYmplY3Qoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpnZW0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK2ludCBzcHJk
X2dlbV9jbWFfZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsIHN0cnVjdDxi
cj4NCiZndDvCoCDCoCDCoGRybV9kZXZpY2UgKmRldiw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fbW9kZV9jcmVh
dGVfZHVtYiAqYXJncyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRfZ2VtX2NtYV9t
bWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRfZ2VtX2NtYV9wcmltZV9tbWFwKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqb2JqLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICtzdHJ1Y3Qgc2dfdGFibGUgKnNwcmRfZ2VtX2NtYV9wcmltZV9nZXRfc2dfdGFi
bGUoc3RydWN0PGJyPg0KJmd0O8KgIMKgIMKgZHJtX2dlbV9vYmplY3QgKm9iaik7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArc3RydWN0IGRybV9nZW1fb2JqZWN0ICpzcHJkX2dlbV9wcmltZV9pbXBv
cnRfc2dfdGFibGUoc3RydWN0PGJyPg0KJmd0O8KgIMKgIMKgZHJtX2RldmljZSAqZGV2LDxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRtYV9idWZfYXR0
YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFibGU8YnI+DQomZ3Q7wqAgwqAgwqAqc2d0Yik7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2VuZGlmPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgLS0gPGJyPg0K
Jmd0O8KgIMKgIMKgVGhvbWFzIFppbW1lcm1hbm48YnI+DQomZ3Q7wqAgwqAgwqBHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyPGJyPg0KJmd0O8KgIMKgIMKgU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIPGJyPg0KJmd0O8KgIMKgIMKgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55PGJyPg0KJmd0O8KgIMKgIMKgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKTxi
cj4NCiZndDvCoCDCoCDCoEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXI8YnI+
DQomZ3Q7IDxicj4NCjxicj4NCi0tIDxicj4NClRob21hcyBaaW1tZXJtYW5uPGJyPg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcjxicj4NClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSDxicj4NCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueTxicj4NCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZyk8YnI+DQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1l
bmTDtnJmZmVyPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pg0K
--0000000000001327e7059964d4ce--

--===============1287034620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1287034620==--
