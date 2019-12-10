Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FE911A6B0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D51E6EA9C;
	Wed, 11 Dec 2019 09:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577096E8E9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 13:42:29 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id n8so4159717qvg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0oF6ni5rt1dFn8dEVOH4zR13FGkyYG6jJWtl/X/5R6k=;
 b=klZGgWvpJ83uRyMH3vcQq5TW1XbA1rCCOuNWnATiB1JQtaSO6lGzqygtIy9DXjKs0v
 Vund/TtF1KBnZmFpitUYUp8yxU9S63M7wtoiJ68pdv9U7/6dSM6+e5w3mWPG1Vy5CJXF
 b27NS5bUZqI4h4HSkw1CW2iT0Lnag3K43ejDeuNfwkPt+ZtQfHq+emgvl7eQ0hRyWFU7
 8bp6rtWgOH1vD3QzKiyXYTITErARLJTqXw6d/XmQlcK2mpQXbn1+Idw/B9Mj5xUGETVe
 piTdj5jh3T5SeLI/VCZlZOKPWONUU6FMMXzOiXlef/FtcDxY+7Hkhz1RiTPsn13xacbC
 FPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0oF6ni5rt1dFn8dEVOH4zR13FGkyYG6jJWtl/X/5R6k=;
 b=kxuGgNiH4wJC11rWSV3AebmBgU1MWb5L4Hm9yzAoDFNagD6ExbDR6VVgbmSWqSENdL
 S1n12PO8mBU4w7BYLwH8nd/i7pmD/TMwwfMzN7Sr4AP8ndnxEsJwDZYqka8d9x9KPJzg
 3BNGEUo2PP6yqbUn+TkTrOe1PyxJxcWPjKKJKVlRYpfkDufozkUgUt5cmy04GH1nY3Zm
 STXmlhjnL1e7zosHuo8DpEMUA0cgfdDv8XsECBDHoioCI+8Z2a0Y/z97dUiyBzY+hfgh
 BBgowfHc4MmBlocjGHBSedAwqW7LrF4YA5tikDgN8G9lAFSIquDjK+d31e3Fv8EPFH4R
 JRiQ==
X-Gm-Message-State: APjAAAWFUfoIE+XpczS/OXlT5GehOi26xg4XZV7lbO39ygFkvcEKQjqY
 8KvYMV/p7my5aE3ko9MREGKz408DRqURKstPKmg=
X-Google-Smtp-Source: APXvYqzNmhgxB/NkIyae85or9cc5fGVmqyR+d1QGPMcwn/xJzkF0g1BZ8cmxetwHlQpfw9GfgeFKs700RLSnQ6N/QZ0=
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr28525250qvb.198.1575985348341; 
 Tue, 10 Dec 2019 05:42:28 -0800 (PST)
MIME-Version: 1.0
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
 <62c61dea-6297-1df2-0037-8c00fa36812b@suse.de>
 <CAFPSGXb-pbmXFXrN7adK1TO+09T8qtJjwk+dK-TidZSsfPqHFg@mail.gmail.com>
 <14abba97-2932-da13-982f-11adea52ded0@suse.de>
In-Reply-To: <14abba97-2932-da13-982f-11adea52ded0@suse.de>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Tue, 10 Dec 2019 21:42:16 +0800
Message-ID: <CAFPSGXamM-QYPo9J1bx6GKgAo4ZLtnRP+np+17wv6iG_w9S1nQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1745204853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1745204853==
Content-Type: multipart/alternative; boundary="000000000000dbf345059959ae88"

--000000000000dbf345059959ae88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

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
CMA helper only support contiguous memory, but our display controller also
need to support scatter buffers via
ion iommu.

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

--000000000000dbf345059959ae88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGk8YnI+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+VGhvbWFzIFpp
bW1lcm1hbm4gJmx0OzxhIGhyZWY9Im1haWx0bzp0emltbWVybWFubkBzdXNlLmRlIj50emltbWVy
bWFubkBzdXNlLmRlPC9hPiZndDsg5LqOMjAxOeW5tDEy5pyIMTDml6Xlkajkuowg5LiL5Y2IODo0
N+WGmemBk++8mjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SGk8YnI+DQo8YnI+DQpBbSAxMC4xMi4xOSB1bSAx
MzozOCBzY2hyaWViIHRhbmcgcGVuZ2NodWFuOjxicj4NCiZndDsgSGk8YnI+DQomZ3Q7IDxicj4N
CiZndDsgVGhvbWFzIFppbW1lcm1hbm4gJmx0OzxhIGhyZWY9Im1haWx0bzp0emltbWVybWFubkBz
dXNlLmRlIiB0YXJnZXQ9Il9ibGFuayI+dHppbW1lcm1hbm5Ac3VzZS5kZTwvYT4gJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86dHppbW1lcm1hbm5Ac3VzZS5kZSIgdGFyZ2V0PSJfYmxhbmsiPnR6
aW1tZXJtYW5uQHN1c2UuZGU8L2E+Jmd0OyZndDsg5LqOPGJyPg0KJmd0OyAyMDE55bm0MTLmnIgx
MOaXpeWRqOS6jCDkuIvljYg2OjMz5YaZ6YGT77yaPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAg
wqBIaTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgQW0gMTAuMTIuMTkgdW0gMDk6MzYgc2No
cmllYiBLZXZpbiBUYW5nOjxicj4NCiZndDvCoCDCoCDCoCZndDsgRnJvbTogS2V2aW4gVGFuZyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmtldmluLnRhbmdAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmtldmluLnRhbmdAdW5pc29jLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzprZXZpbi50YW5nQHVuaXNvYy5jb20iIHRhcmdldD0iX2JsYW5rIj5rZXZp
bi50YW5nQHVuaXNvYy5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyBBZGRzIGRybSBzdXBwb3J0IGZvciB0aGUgVW5pc29jJiMzOTtzIGRp
c3BsYXkgc3Vic3lzdGVtLjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7IFRoaXMgaXMgZHJtIGRldmljZSBhbmQgZ2VtIGRyaXZlci4gVGhpcyBkcml2ZXIgcHJvdmlk
ZXMgc3VwcG9ydDxicj4NCiZndDvCoCDCoCDCoGZvciB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
IERpcmVjdCBSZW5kZXJpbmcgSW5mcmFzdHJ1Y3R1cmUgKERSSSkgaW4gWEZyZWU4NiA0LjEuMCBh
bmQgaGlnaGVyLjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IENj
OiBPcnNvbiBaaGFpICZsdDs8YSBocmVmPSJtYWlsdG86b3Jzb256aGFpQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPm9yc29uemhhaUBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOm9yc29uemhhaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5vcnNvbnpoYWlAZ21h
aWwuY29tPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBDYzogQmFvbGluIFdhbmcg
Jmx0OzxhIGhyZWY9Im1haWx0bzpiYW9saW4ud2FuZ0BsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+YmFvbGluLndhbmdAbGluYXJvLm9yZzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpiYW9saW4ud2FuZ0BsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+
YmFvbGluLndhbmdAbGluYXJvLm9yZzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsg
Q2M6IENodW55YW4gWmhhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzp6aGFuZy5seXJhQGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPnpoYW5nLmx5cmFAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzp6aGFuZy5seXJhQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnpoYW5n
Lmx5cmFAZ21haWwuY29tPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBTaWduZWQt
b2ZmLWJ5OiBLZXZpbiBUYW5nICZsdDs8YSBocmVmPSJtYWlsdG86a2V2aW4udGFuZ0B1bmlzb2Mu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+a2V2aW4udGFuZ0B1bmlzb2MuY29tPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmtldmluLnRhbmdAdW5pc29jLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmtldmluLnRhbmdAdW5pc29jLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDsgLS0tPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIGRyaXZlcnMvZ3B1L2Ry
bS9LY29uZmlnwqAgwqAgwqAgwqAgwqB8wqAgwqAyICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
ZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlwqAgwqAgwqAgwqAgfMKgIMKgMSArPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIGRyaXZlcnMvZ3B1L2RybS9zcHJkL0tjb25maWfCoCDCoCB8wqAgMTQgKys8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgZHJpdmVycy9ncHUvZHJtL3NwcmQvTWFrZWZpbGXCoCDC
oHzCoCDCoDggKys8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgZHJpdmVycy9ncHUvZHJtL3NwcmQv
c3ByZF9kcm0uYyB8IDI4Nzxicj4NCiZndDvCoCDCoCDCoCsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKys8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgZHJpdmVycy9ncHUvZHJt
L3NwcmQvc3ByZF9kcm0uaCB8wqAgMTkgKysrPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIGRyaXZl
cnMvZ3B1L2RybS9zcHJkL3NwcmRfZ2VtLmMgfCAxNzggKysrKysrKysrKysrKysrKysrKysrKysr
Kzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBkcml2ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2dlbS5o
IHzCoCAzMCArKysrKzxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgVGhlIEdFTSBpbXBsZW1l
bnRhdGlvbiBsb29rcyBsaWtlIERSTSYjMzk7cyBDTUEgaGVscGVycy4gQ2FuIHlvdSBub3QgdXNl
IENNQTxicj4NCiZndDvCoCDCoCDCoGhlbHBlcnMgaW5zdGVhZD88YnI+DQomZ3Q7IDxicj4NCiZn
dDsgT2ssIGkgd2lsbCByZW1vdmUgY21hIGtleXdvcmRzIGZyb20gdGhlIEdFTSBpbXBsZW1lbnRh
dGlvLjxicj4NCjxicj4NCkkmIzM5O20gbm90IHF1aXRlIHN1cmUgd2hhdCB5b3UgbWVhbi4gV2h5
IGNhbiB5b3Ugbm90IHVzZSB0aGUgZXhpc3RpbmcgQ01BPGJyPg0KaGVscGVycyBpbnN0ZWFkIG9m
IHdyaXRpbmcgeW91ciBvd24/PGJyPjwvYmxvY2txdW90ZT48ZGl2PkNNQSBoZWxwZXIgb25seSBz
dXBwb3J0IDxjb2RlPmNvbnRpZ3VvdXMgbWVtb3J5LCBidXQgb3VyIGRpc3BsYXkgY29udHJvbGxl
ciBhbHNvIG5lZWQgdG8gc3VwcG9ydCBzY2F0dGVyIGJ1ZmZlcnMgdmlhPC9jb2RlPjwvZGl2Pjxk
aXY+PGNvZGU+aW9uIGlvbW11Ljxicj48L2NvZGU+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJyPg0KQmVzdCBy
ZWdhcmRzPGJyPg0KVGhvbWFzPGJyPg0KPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCA4IGZpbGVzIGNoYW5nZWQsIDUzOSBpbnNlcnRpb25zKCspPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vc3ByZC9L
Y29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vc3ByZC9NYWtlZmlsZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYzxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0u
aDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3NwcmQvc3ByZF9nZW0uYzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9nZW0uaDxicj4NCiZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBpbmRl
eCBiZmRhZGMzLi5jZWFkMTJjIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCZndDsgLS0tIGEvZHJp
dmVycy9ncHUvZHJtL0tjb25maWc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9LY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBAQCAtMzg3LDYgKzM4Nyw4IEBA
IHNvdXJjZSAmcXVvdDtkcml2ZXJzL2dwdS9kcm0vYXNwZWVkL0tjb25maWcmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgc291cmNlICZxdW90O2Ry
aXZlcnMvZ3B1L2RybS9tY2RlL0tjb25maWcmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqA8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzb3VyY2UgJnF1b3Q7ZHJpdmVycy9ncHUvZHJtL3NwcmQv
S2NvbmZpZyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCAjIEtlZXAgbGVnYWN5IGRyaXZlcnMgbGFzdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoDxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCBtZW51Y29uZmlnIERSTV9MRUdBQ1k8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgYi9kcml2ZXJz
L2dwdS9kcm0vTWFrZWZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGluZGV4IDlmMWM3YzQuLjg1
Y2EyMTEgMTAwNjQ0PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
TWFrZWZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9NYWtl
ZmlsZTxicj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTEyMiwzICsxMjIsNCBAQCBvYmotJChDT05G
SUdfRFJNX0xJTUEpwqAgKz0gbGltYS88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgb2JqLSQoQ09O
RklHX0RSTV9QQU5GUk9TVCkgKz0gcGFuZnJvc3QvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIG9i
ai0kKENPTkZJR19EUk1fQVNQRUVEX0dGWCkgKz0gYXNwZWVkLzxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCBvYmotJChDT05GSUdfRFJNX01DREUpICs9IG1jZGUvPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArb2JqLSQoQ09ORklHX0RSTV9TUFJEKSArPSBzcHJkLzxicj4NCiZndDvCoCDCoCDCoCZndDsg
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zcHJkL0tjb25maWc8YnI+DQomZ3Q7wqAgwqAg
wqBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL0tjb25maWc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBpbmRleCAwMDAwMDAwLi43
OWYyODZiPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAtLS0gL2Rldi9udWxsPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3ByZC9LY29uZmlnPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyBAQCAtMCwwICsxLDE0IEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArY29uZmlnIERS
TV9TUFJEPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB0cmlzdGF0ZSAmcXVvdDtEUk0g
U3VwcG9ydCBmb3IgVW5pc29jIFNvQ3MgUGxhdGZvcm0mcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoGRlcGVuZHMgb24gQVJDSF9TUFJEPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqBkZXBlbmRzIG9uIERSTSAmYW1wOyZhbXA7IE9GPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqBzZWxlY3QgRFJNX0tNU19IRUxQRVI8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoHNlbGVjdCBEUk1fR0VNX0NNQV9IRUxQRVI8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoHNlbGVjdCBEUk1fS01TX0NNQV9IRUxQRVI8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoHNlbGVjdCBEUk1fTUlQSV9EU0k8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oHNlbGVjdCBEUk1fUEFORUw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNlbGVjdCBW
SURFT01PREVfSEVMUEVSUzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc2VsZWN0IEJB
Q0tMSUdIVF9DTEFTU19ERVZJQ0U8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGhlbHA8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoENob29zZSB0aGlzIG9wdGlvbiBpZiB5
b3UgaGF2ZSBhIFVuaXNvYyBjaGlwc2V0cy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oCDCoElmIE0gaXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCBzcHJkLWRybS48
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZTxicj4NCiZn
dDvCoCDCoCDCoCZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zcHJkL01ha2VmaWxl
PGJyPg0KJmd0O8KgIMKgIMKgYi9kcml2ZXJzL2dwdS9kcm0vc3ByZC9NYWtlZmlsZTxicj4NCiZn
dDvCoCDCoCDCoCZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
IGluZGV4IDAwMDAwMDAuLmRmMGIzMTY8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0tLSAvZGV2L251
bGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL01ha2Vm
aWxlPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBAQCAtMCwwICsxLDggQEA8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArY2NmbGFncy15ICs9IC1JaW5jbHVkZS9k
cm08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdWJkaXIt
Y2NmbGFncy15ICs9IC1JJChzcmMpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArb2JqLXkgOj0gc3ByZF9kcm0ubyBcPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqBzcHJkX2dlbS5vPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBcIE5vIG5ld2xpbmUgYXQg
ZW5kIG9mIGZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3ByZC9zcHJkX2RybS5jPGJyPg0KJmd0O8KgIMKgIMKgYi9kcml2ZXJzL2dwdS9kcm0v
c3ByZC9zcHJkX2RybS5jPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBuZXcgZmlsZSBtb2RlIDEwMDY0
NDxicj4NCiZndDvCoCDCoCDCoCZndDsgaW5kZXggMDAwMDAwMC4uZWMxNmZlZTxicj4NCiZndDvC
oCDCoCDCoCZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDvCoCDCoCDCoCZndDsgKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYzxicj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTAs
MCArMSwyODcgQEA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMDxicj4NCiZndDvCoCDCoCDCoCZndDsgKy8qPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArICogQ29weXJpZ2h0IChDKSAyMDE5IFVuaXNvYyBJbmMuPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
I2luY2x1ZGUgJmx0O2xpbnV4L2NvbXBvbmVudC5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyNpbmNsdWRlICZsdDtsaW51eC9kbWEtbWFwcGluZy5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKyNpbmNsdWRlICZsdDtsaW51eC9tb2R1bGUuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICsjaW5jbHVkZSAmbHQ7bGludXgvbXV0ZXguaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsj
aW5jbHVkZSAmbHQ7bGludXgvb2ZfZ3JhcGguaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsj
aW5jbHVkZSAmbHQ7bGludXgvb2ZfcGxhdGZvcm0uaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHJtL2RybV9hdG9taWNfaGVs
cGVyLmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2RybS9kcm1fY3J0
Y19oZWxwZXIuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHJtL2Ry
bV9kcnYuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHJtL2RybV9n
ZW1fY21hX2hlbHBlci5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtk
cm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICsjaW5jbHVkZSAmbHQ7ZHJtL2RybV9wcm9iZV9oZWxwZXIuaCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHJtL2RybV92YmxhbmsuaCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmcXVvdDtzcHJkX2RybS5o
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUgJnF1b3Q7c3ByZF9nZW0uaCZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNkZWZp
bmUgRFJJVkVSX05BTUXCoCAmcXVvdDtzcHJkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
I2RlZmluZSBEUklWRVJfREVTQ8KgICZxdW90O1NwcmVhZHRydW0gU29DcyYjMzk7IERSTSBEcml2
ZXImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjZGVmaW5lIERSSVZFUl9EQVRFwqAgJnF1
b3Q7MjAxODA1MDEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjZGVmaW5lIERSSVZFUl9N
QUpPUiAxPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2RlZmluZSBEUklWRVJfTUlOT1IgMDxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5jczxicj4NCiZndDvCoCDCoCDCoHNwcmRf
ZHJtX21vZGVfY29uZmlnX2hlbHBlciA9IHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oC5hdG9taWNfY29tbWl0X3RhaWwgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0s
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5j
czxicj4NCiZndDvCoCDCoCDCoHNwcmRfZHJtX21vZGVfY29uZmlnX2Z1bmNzID0gezxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmZiX2NyZWF0ZSA9IGRybV9nZW1fZmJfY3JlYXRlLDxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmF0b21pY19jaGVjayA9IGRybV9hdG9taWNf
aGVscGVyX2NoZWNrLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmF0b21pY19jb21t
aXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXQsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgdm9p
ZCBzcHJkX2RybV9tb2RlX2NvbmZpZ19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtX21v
ZGVfY29uZmlnX2luaXQoZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoGRybS0mZ3Q7bW9kZV9jb25maWcubWluX3dpZHRoID0gMDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRybS0mZ3Q7bW9kZV9jb25maWcubWluX2hlaWdo
dCA9IDA7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0O21vZGVfY29uZmln
Lm1heF93aWR0aCA9IDgxOTI7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0
O21vZGVfY29uZmlnLm1heF9oZWlnaHQgPSA4MTkyOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgZHJtLSZndDttb2RlX2NvbmZpZy5hbGxvd19mYl9tb2RpZmllcnMgPSB0cnVlOzxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtLSZn
dDttb2RlX2NvbmZpZy5mdW5jcyA9ICZhbXA7c3ByZF9kcm1fbW9kZV9jb25maWdfZnVuY3M7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0O21vZGVfY29uZmlnLmhlbHBlcl9w
cml2YXRlID0gJmFtcDtzcHJkX2RybV9tb2RlX2NvbmZpZ19oZWxwZXI7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHNwcmRfZHJtX2ZvcHMgPSB7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAub3duZXLCoCDCoCDCoCDCoCDCoCA9IFRISVNf
TU9EVUxFLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLm9wZW7CoCDCoCDCoCDCoCDC
oCDCoD0gZHJtX29wZW4sPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAucmVsZWFzZcKg
IMKgIMKgIMKgID0gZHJtX3JlbGVhc2UsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAu
dW5sb2NrZWRfaW9jdGwgPSBkcm1faW9jdGwsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqAuY29tcGF0X2lvY3RswqAgwqA9IGRybV9jb21wYXRfaW9jdGwsPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAucG9sbMKgIMKgIMKgIMKgIMKgIMKgPSBkcm1fcG9sbCw8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5yZWFkwqAgwqAgwqAgwqAgwqAgwqA9IGRybV9yZWFkLDxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmxsc2Vla8KgIMKgIMKgIMKgIMKgPSBub19s
bHNlZWssPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAubW1hcMKgIMKgIMKgIMKgIMKg
IMKgPSBzcHJkX2dlbV9jbWFfbW1hcCw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0YXRpYyBzdHJ1Y3QgZHJt
X2RyaXZlciBzcHJkX2RybV9kcnYgPSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAu
ZHJpdmVyX2ZlYXR1cmVzwqAgwqAgwqAgwqAgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQg
fDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgRFJJVkVSX0FUT01JQyB8IERSSVZFUl9IQVZFX0lSUSw8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5mb3BzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA9
ICZhbXA7c3ByZF9kcm1fZm9wcyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoC5nZW1fdm1fb3BzwqAgwqAgwqAgwqAgwqAgwqAgwqA9ICZhbXA7
ZHJtX2dlbV9jbWFfdm1fb3BzLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmdlbV9m
cmVlX29iamVjdF91bmxvY2tlZMKgIMKgIMKgIMKgPSBzcHJkX2dlbV9mcmVlX29iamVjdCw8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5kdW1iX2NyZWF0ZcKgIMKgIMKgIMKgIMKgIMKg
ID0gc3ByZF9nZW1fY21hX2R1bWJfY3JlYXRlLDxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLnByaW1lX2ZkX3RvX2hhbmRsZcKgIMKgIMKgPSBk
cm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oC5nZW1fcHJpbWVfaW1wb3J0wqAgwqAgwqAgwqA9IGRybV9nZW1fcHJpbWVfaW1wb3J0LDxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBz
cHJkX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAubmFtZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgPSBEUklWRVJfTkFNRSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5kZXNj
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA9IERSSVZFUl9ERVNDLDxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgLmRhdGXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoD0gRFJJ
VkVSX0RBVEUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAubWFqb3LCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCA9IERSSVZFUl9NQUpPUiw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoC5taW5vcsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgID0gRFJJVkVSX01JTk9SLDxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK307PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArc3RhdGljIGludCBzcHJkX2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
dik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
c3RydWN0IHNwcmRfZHJtICpzcHJkOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaW50
IGVycjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoGRybSA9IGRybV9kZXZfYWxsb2MoJmFtcDtzcHJkX2RybV9kcnYsIGRldik7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAoSVNfRVJSKGRybSkpPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gUFRSX0VSUihkcm0pOzxicj4NCiZndDvC
oCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZGV2X3NldF9kcnZk
YXRhKGRldiwgZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoHNwcmQgPSBkZXZtX2t6YWxsb2MoZHJtLSZndDtkZXYsIHNpemVvZigqc3By
ZCksIEdGUF9LRVJORUwpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKCFzcHJk
KSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBlcnIgPSAtRU5P
TUVNOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJf
ZnJlZV9kcm07PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0O2Rldl9wcml2YXRlID0gc3ByZDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNwcmRfZHJtX21vZGVf
Y29uZmlnX2luaXQoZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoC8qIGJpbmQgYW5kIGluaXQgc3ViIGRyaXZlcnMgKi88YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGVyciA9IGNvbXBvbmVudF9iaW5kX2FsbChkcm0tJmd0O2Rl
diwgZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChlcnIpIHs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoERSTV9FUlJPUigmcXVvdDtmYWls
ZWQgdG8gYmluZCBhbGwgY29tcG9uZW50LlxuJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX2RjX2NsZWFudXA7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAvKiB2YmxhbmsgaW5pdCAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgZXJyID0gZHJtX3ZibGFua19pbml0KGRybSwgZHJtLSZndDttb2RlX2NvbmZpZy5u
dW1fY3J0Yyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAoZXJyKSB7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBEUk1fRVJST1IoJnF1b3Q7ZmFp
bGVkIHRvIGluaXRpYWxpemUgdmJsYW5rLlxuJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX3VuYmluZF9hbGw7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAvKiB3aXRo
IGlycV9lbmFibGVkID0gdHJ1ZSwgd2UgY2FuIHVzZSB0aGUgdmJsYW5rIGZlYXR1cmUuICovPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0O2lycV9lbmFibGVkID0gdHJ1ZTs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC8q
IHJlc2V0IGFsbCB0aGUgc3RhdGVzIG9mIGNydGMvcGxhbmUvZW5jb2Rlci9jb25uZWN0b3IgKi88
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRybV9tb2RlX2NvbmZpZ19yZXNldChkcm0p
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
LyogaW5pdCBrbXMgcG9sbCBmb3IgaGFuZGxpbmcgaHBkICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqBkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGVyciA9IGRybV9kZXZfcmVn
aXN0ZXIoZHJtLCAwKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChlcnIgJmx0
OyAwKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJf
a21zX2hlbHBlcl9wb2xsX2Zpbmk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gMDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtlcnJfa21zX2hlbHBlcl9wb2xsX2Zpbmk6PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqBkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICtlcnJfdW5iaW5kX2FsbDo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoGNvbXBvbmVudF91bmJpbmRfYWxsKGRybS0mZ3Q7ZGV2LCBkcm0pOzxicj4NCiZndDvC
oCDCoCDCoCZndDsgK2Vycl9kY19jbGVhbnVwOjxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtl
cnJfZnJlZV9kcm06PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm1fZGV2X3B1dChk
cm0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIGVycjs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArc3RhdGljIHZvaWQgc3ByZF9kcm1fdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldik8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm1f
cHV0X2RldihkZXZfZ2V0X2RydmRhdGEoZGV2KSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgY29tcG9uZW50X21hc3Rlcl9vcHMgc3ByZF9kcm1fY29tcG9uZW50X29wcyA9IHs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5iaW5kID0gc3ByZF9kcm1fYmluZCw8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC51bmJpbmQgPSBzcHJkX2RybV91bmJpbmQsPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgaW50IGNvbXBhcmVfb2Yoc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkICpkYXRhKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkYXRhOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgRFJNX0RFQlVHKCZxdW90O2Nv
bXBhcmUgJXNcbiZxdW90OywgbnAtJmd0O2Z1bGxfbmFtZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gZGV2LSZndDtvZl9ub2Rl
ID09IG5wOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgaW50IHNwcmRfZHJtX2NvbXBvbmVudF9wcm9i
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9tYXN0ZXJfb3Bz
ICptX29wcyk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKmVwLCAqcG9ydCwgKnJlbW90ZTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBjb21wb25lbnRfbWF0Y2ggKm1hdGNoID0gTlVM
TDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGludCBpOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKCFkZXYtJmd0O29mX25v
ZGUpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVJ
TlZBTDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoC8qPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgKiBCaW5kIHRoZSBjcnRjJiMz
OTtzIHBvcnRzIGZpcnN0LCBzbyB0aGF0PGJyPg0KJmd0O8KgIMKgIMKgZHJtX29mX2ZpbmRfcG9z
c2libGVfY3J0Y3MoKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgICogY2FsbGVkIGZy
b20gZW5jb2RlciYjMzk7cyAuYmluZCBjYWxsYmFja3Mgd29ya3MgYXMgZXhwZWN0ZWQ8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgZm9yIChpID0gMDsgOyBpKyspIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoHBvcnQgPSBvZl9wYXJzZV9waGFuZGxlKGRldi0mZ3Q7b2Zfbm9kZSwgJnF1b3Q7
cG9ydHMmcXVvdDssIGkpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKCFwb3J0KTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIW9mX2RldmljZV9pc19hdmFpbGFibGUo
cG9ydC0mZ3Q7cGFyZW50KSkgezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgb2Zfbm9kZV9wdXQocG9ydCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBvbmVudF9tYXRj
aF9hZGQoZGV2LCAmYW1wO21hdGNoLCBjb21wYXJlX29mLDxicj4NCiZndDvCoCDCoCDCoHBvcnQt
Jmd0O3BhcmVudCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBv
Zl9ub2RlX3B1dChwb3J0KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChpID09
IDApIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl9lcnIo
ZGV2LCAmcXVvdDttaXNzaW5nICYjMzk7cG9ydHMmIzM5OyBwcm9wZXJ0eVxuJnF1b3Q7KTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRU5PREVWOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKCFtYXRjaCkgezxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X2VycihkZXYsICZxdW90O25vIGF2YWls
YWJsZSBwb3J0XG4mcXVvdDspOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgcmV0dXJuIC1FTk9ERVY7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAvKjxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgICogRm9yIGJvdW5kIGNydGNzLCBiaW5kIHRo
ZSBlbmNvZGVycyBhdHRhY2hlZCB0byB0aGVpcjxicj4NCiZndDvCoCDCoCDCoHJlbW90ZSBlbmRw
b2ludDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgICovPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqBmb3IgKGkgPSAwOyA7IGkrKykgezxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgcG9ydCA9IG9mX3BhcnNlX3BoYW5kbGUoZGV2LSZndDtvZl9u
b2RlLCAmcXVvdDtwb3J0cyZxdW90OywgaSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAoIXBvcnQpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICghb2ZfZGV2aWNlX2lz
X2F2YWlsYWJsZShwb3J0LSZndDtwYXJlbnQpKSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvZl9ub2RlX3B1dChwb3J0KTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRpbnVlOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCiZndDvCoCDC
oCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZm9y
X2VhY2hfY2hpbGRfb2Zfbm9kZShwb3J0LCBlcCkgezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVtb3RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90
ZV9wb3J0X3BhcmVudChlcCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAoIXJlbW90ZSB8fDxicj4NCiZndDvCoCDCoCDCoCFvZl9kZXZp
Y2VfaXNfYXZhaWxhYmxlKHJlbW90ZSkpIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9mX25vZGVfcHV0KHJlbW90ZSk7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb250aW51ZTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH0gZWxzZSBpZjxicj4NCiZndDvCoCDCoCDCoCghb2ZfZGV2aWNl
X2lzX2F2YWlsYWJsZShyZW1vdGUtJmd0O3BhcmVudCkpIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl93YXJuKGRl
diwgJnF1b3Q7cGFyZW50IGRldmljZSBvZiAlczxicj4NCiZndDvCoCDCoCDCoGlzIG5vdCBhdmFp
bGFibGVcbiZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZW1vdGUtJmd0O2Z1bGxfbmFt
ZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBvZl9ub2RlX3B1dChyZW1vdGUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wb25lbnRfbWF0Y2hfYWRkKGRldiwgJmFtcDttYXRjaCwg
Y29tcGFyZV9vZiw8YnI+DQomZ3Q7wqAgwqAgwqByZW1vdGUpOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb2Zfbm9kZV9wdXQocmVtb3RlKTs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoG9mX25vZGVfcHV0KHBvcnQpOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIGNvbXBvbmVudF9tYXN0ZXJfYWRkX3dpdGhf
bWF0Y2goZGV2LCBtX29wcywgbWF0Y2gpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgaW50IHNwcmRf
ZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaW50IHJldDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldCA9IGRtYV9z
ZXRfbWFza19hbmRfY29oZXJlbnQoJmFtcDtwZGV2LSZndDtkZXYsIH4wKTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChyZXQpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqBEUk1fRVJST1IoJnF1b3Q7ZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudCBm
YWlsZWQgKCVkKVxuJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoHJldCk7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gc3ByZF9kcm1f
Y29tcG9uZW50X3Byb2JlKCZhbXA7cGRldi0mZ3Q7ZGV2LDxicj4NCiZndDvCoCDCoCDCoCZhbXA7
c3ByZF9kcm1fY29tcG9uZW50X29wcyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0YXRpYyBpbnQgc3ByZF9k
cm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgY29tcG9uZW50X21hc3Rlcl9k
ZWwoJmFtcDtwZGV2LSZndDtkZXYsICZhbXA7c3ByZF9kcm1fY29tcG9uZW50X29wcyk7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gMDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGlj
IHZvaWQgc3ByZF9kcm1fc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldik8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAoIWRybSkg
ezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX1dBUk4oJnF1
b3Q7ZHJtIGRldmljZSBpcyBub3QgYXZhaWxhYmxlLCBubyBzaHV0ZG93blxuJnF1b3Q7KTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRybSk7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCZndDsgK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNwcmRfZHJtX21h
dGNoX3RhYmxlW10gPSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB7IC5jb21wYXRp
YmxlID0gJnF1b3Q7c3ByZCxkaXNwbGF5LXN1YnN5c3RlbSZxdW90Oyx9LDxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKge30sPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzcHJkX2RybV9tYXRjaF90YWJs
ZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3ByZF9kcm1fZHJpdmVyID0gezxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgLnByb2JlID0gc3ByZF9kcm1fcHJvYmUsPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAucmVtb3ZlID0gc3ByZF9kcm1fcmVtb3ZlLDxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgLnNodXRkb3duID0gc3ByZF9kcm1fc2h1dGRvd24sPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAuZHJpdmVyID0gezxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgLm5hbWUgPSAmcXVvdDtzcHJkLWRybS1kcnYmcXVvdDssPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAub2ZfbWF0Y2hfdGFibGUg
PSBzcHJkX2RybV9tYXRjaF90YWJsZSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH0s
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHNwcmRfZHJtX2RyaXZlcik7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArTU9EVUxFX0FV
VEhPUigmcXVvdDtMZW9uIEhlICZsdDs8YSBocmVmPSJtYWlsdG86bGVvbi5oZUB1bmlzb2MuY29t
IiB0YXJnZXQ9Il9ibGFuayI+bGVvbi5oZUB1bmlzb2MuY29tPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmxlb24uaGVAdW5pc29jLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmxlb24uaGVAdW5pc29jLmNvbTwvYT4mZ3Q7Jmd0OyZxdW90Oyk7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArTU9EVUxFX0FVVEhPUigmcXVvdDtLZXZpbiBUYW5nICZsdDs8YSBocmVmPSJt
YWlsdG86a2V2aW4udGFuZ0B1bmlzb2MuY29tIiB0YXJnZXQ9Il9ibGFuayI+a2V2aW4udGFuZ0B1
bmlzb2MuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmtldmluLnRhbmdAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmtldmluLnRhbmdAdW5pc29j
LmNvbTwvYT4mZ3Q7Jmd0OyZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArTU9EVUxFX0RF
U0NSSVBUSU9OKCZxdW90O1VuaXNvYyBEUk0gS01TIE1hc3RlciBEcml2ZXImcXVvdDspOzxicj4N
CiZndDvCoCDCoCDCoCZndDsgK01PRFVMRV9MSUNFTlNFKCZxdW90O0dQTCB2MiZxdW90Oyk7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3By
ZF9kcm0uaDxicj4NCiZndDvCoCDCoCDCoGIvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0u
aDxicj4NCiZndDvCoCDCoCDCoCZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7IGluZGV4IDAwMDAwMDAuLmU4NDBlNjU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0t
LSAvZGV2L251bGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
cHJkL3NwcmRfZHJtLmg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEBAIC0wLDAgKzEsMTkgQEA8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAq
Lzxicj4NCiZndDvCoCDCoCDCoCZndDsgKy8qPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArICogQ29w
eXJpZ2h0IChDKSAyMDE5IFVuaXNvYyBJbmMuPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArICovPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2lmbmRlZiBfU1BS
RF9EUk1fSF88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjZGVmaW5lIF9TUFJEX0RSTV9IXzxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtk
cm0vZHJtX2F0b21pYy5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtk
cm0vZHJtX3ByaW50LmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArc3RydWN0IHNwcmRfZHJtIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oHN0cnVjdCBkcm1fZGV2aWNlICpkcm07PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBz
dHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGU7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqBzdHJ1Y3QgZGV2aWNlICpkcHVfZGV2Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgc3RydWN0IGRldmljZSAqZ3NwX2Rldjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9Ozxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNlbmRpZiAvKiBfU1BS
RF9EUk1fSF8gKi88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3ByZC9zcHJkX2dlbS5jPGJyPg0KJmd0O8KgIMKgIMKgYi9kcml2ZXJzL2dwdS9kcm0v
c3ByZC9zcHJkX2dlbS5jPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBuZXcgZmlsZSBtb2RlIDEwMDY0
NDxicj4NCiZndDvCoCDCoCDCoCZndDsgaW5kZXggMDAwMDAwMC4uYzYxN2M4Yjxicj4NCiZndDvC
oCDCoCDCoCZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDvCoCDCoCDCoCZndDsgKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NwcmQvc3ByZF9nZW0uYzxicj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTAs
MCArMSwxNzggQEA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMDxicj4NCiZndDvCoCDCoCDCoCZndDsgKy8qPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArICogQ29weXJpZ2h0IChDKSAyMDE5IFVuaXNvYyBJbmMuPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
I2luY2x1ZGUgJmx0O2xpbnV4L2RtYS1idWYuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsj
aW5jbHVkZSAmbHQ7bGludXgvcG1fcnVudGltZS5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtkcm0vZHJtX3ByaW1lLmgmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUg
JnF1b3Q7c3ByZF9kcm0uaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZx
dW90O3NwcmRfZ2VtLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICtzdGF0aWMgc3RydWN0IHNwcmRfZ2VtX29iaiAqc3ByZF9nZW1fb2JqX2NyZWF0
ZShzdHJ1Y3QgZHJtX2RldmljZTxicj4NCiZndDvCoCDCoCDCoCpkcm0sPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIHNpemUpPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IHNwcmRfZ2VtX29i
aiAqc3ByZF9nZW07PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpbnQgcmV0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3ByZF9n
ZW0gPSBremFsbG9jKHNpemVvZigqc3ByZF9nZW0pLCBHRlBfS0VSTkVMKTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoGlmICghc3ByZF9nZW0pPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldCA9IGRybV9nZW1f
b2JqZWN0X2luaXQoZHJtLCAmYW1wO3NwcmRfZ2VtLSZndDtiYXNlLCBzaXplKTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChyZXQgJmx0OyAwKSB7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBEUk1fRVJST1IoJnF1b3Q7ZmFpbGVkIHRvIGluaXRp
YWxpemUgZ2VtIG9iamVjdFxuJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoGdvdG8gZXJyb3I7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBy
ZXQgPSBkcm1fZ2VtX2NyZWF0ZV9tbWFwX29mZnNldCgmYW1wO3NwcmRfZ2VtLSZndDtiYXNlKTs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGRybV9nZW1fb2JqZWN0X3JlbGVhc2UoJmFtcDtz
cHJkX2dlbS0mZ3Q7YmFzZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqBnb3RvIGVycm9yOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIHNw
cmRfZ2VtOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK2Vy
cm9yOjxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKga2ZyZWUoc3ByZF9nZW0pOzxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIEVSUl9QVFIocmV0KTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArdm9pZCBzcHJkX2dlbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9i
aik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqBzdHJ1Y3Qgc3ByZF9nZW1fb2JqICpzcHJkX2dlbSA9IHRvX3NwcmRfZ2VtX29iaihvYmopOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgRFJN
X0RFQlVHKCZxdW90O2dlbSA9ICVwXG4mcXVvdDssIG9iaik7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAoc3ByZF9nZW0tJmd0O3ZhZGRy
KTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZG1hX2FsbG9jX3dj
KG9iai0mZ3Q7ZGV2LSZndDtkZXYsIG9iai0mZ3Q7c2l6ZSw8YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoGRtYV9mcmVlX3djPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFRoYW5rcyBmb3IgcmVtaW5k
aW5nPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEJlc3QgcmVnYXJkczxi
cj4NCiZndDvCoCDCoCDCoFRob21hczxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgWzFdPGJy
Pg0KJmd0O8KgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtLXRpcC90cmVlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9k
cm0vZHJtLXRpcC90cmVlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYzwvYT48
YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzcHJkX2dlbS0mZ3Q7dmFk
ZHIsPGJyPg0KJmd0O8KgIMKgIMKgc3ByZF9nZW0tJmd0O2RtYV9hZGRyKTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoGVsc2UgaWYgKHNwcmRfZ2VtLSZndDtzZ3RiKTxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZHJtX3ByaW1lX2dlbV9kZXN0cm95KG9i
aiwgc3ByZF9nZW0tJmd0O3NndGIpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtX2dlbV9vYmplY3RfcmVsZWFzZShvYmopOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKga2ZyZWUoc3By
ZF9nZW0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtpbnQgc3ByZF9nZW1fY21hX2R1bWJfY3JlYXRlKHN0cnVj
dCBkcm1fZmlsZSAqZmlsZV9wcml2LCBzdHJ1Y3Q8YnI+DQomZ3Q7wqAgwqAgwqBkcm1fZGV2aWNl
ICpkcm0sPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1bWIgKmFyZ3MpPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IHNwcmRf
Z2VtX29iaiAqc3ByZF9nZW07PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpbnQgcmV0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
YXJncy0mZ3Q7cGl0Y2ggPSBESVZfUk9VTkRfVVAoYXJncy0mZ3Q7d2lkdGggKiBhcmdzLSZndDti
cHAsIDgpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgYXJncy0mZ3Q7c2l6ZSA9IHJv
dW5kX3VwKGFyZ3MtJmd0O3BpdGNoICogYXJncy0mZ3Q7aGVpZ2h0LCBQQUdFX1NJWkUpOzxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3ByZF9n
ZW0gPSBzcHJkX2dlbV9vYmpfY3JlYXRlKGRybSwgYXJncy0mZ3Q7c2l6ZSk7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqBpZiAoSVNfRVJSKHNwcmRfZ2VtKSk8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBQVFJfRVJSKHNwcmRfZ2VtKTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNwcmRf
Z2VtLSZndDt2YWRkciA9IGRtYV9hbGxvY193Yyhkcm0tJmd0O2RldiwgYXJncy0mZ3Q7c2l6ZSw8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZh
bXA7c3ByZF9nZW0tJmd0O2RtYV9hZGRyLCBHRlBfS0VSTkVMIHw8YnI+DQomZ3Q7wqAgwqAgwqBf
X0dGUF9OT1dBUk4gfCBHRlBfRE1BKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlm
ICghc3ByZF9nZW0tJmd0O3ZhZGRyKSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqBEUk1fRVJST1IoJnF1b3Q7ZmFpbGVkIHRvIGFsbG9jYXRlIGJ1ZmZlciB3aXRo
IHNpemUgJWxsdVxuJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYXJncy0mZ3Q7c2l6ZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSAtRU5PTUVNOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJvcjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoHJldCA9IGRybV9nZW1faGFuZGxlX2NyZWF0ZShmaWxlX3ByaXYsICZhbXA7c3By
ZF9nZW0tJmd0O2Jhc2UsPGJyPg0KJmd0O8KgIMKgIMKgJmFtcDthcmdzLSZndDtoYW5kbGUpOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHJldCk8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyb3I7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm1fZ2VtX29iamVjdF9wdXRfdW5s
b2NrZWQoJmFtcDtzcHJkX2dlbS0mZ3Q7YmFzZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gMDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtlcnJvcjo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoHNwcmRfZ2VtX2ZyZWVfb2JqZWN0KCZhbXA7c3ByZF9nZW0tJmd0O2Jhc2UpOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
c3RhdGljIGludCBzcHJkX2dlbV9jbWFfb2JqZWN0X21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmosPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgaW50IHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0
cnVjdCBzcHJkX2dlbV9vYmogKnNwcmRfZ2VtID0gdG9fc3ByZF9nZW1fb2JqKG9iaik7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB2bWEtJmd0
O3ZtX2ZsYWdzICZhbXA7PSB+Vk1fUEZOTUFQOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgdm1hLSZndDt2bV9wZ29mZiA9IDA7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXQgPSBkbWFfbW1hcF93YyhvYmotJmd0O2Rldi0mZ3Q7
ZGV2LCB2bWEsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzcHJkX2dlbS0mZ3Q7dmFkZHIsIHNwcmRfZ2VtLSZn
dDtkbWFfYWRkciw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZtYS0mZ3Q7dm1fZW5kIC0gdm1hLSZndDt2bV9z
dGFydCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAocmV0KTxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZHJtX2dlbV92bV9jbG9zZSh2bWEpOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0
dXJuIHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRfZ2VtX2NtYV9tbWFwKHN0cnVjdCBmaWxl
ICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iajs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGludCByZXQ7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXQgPSBkcm1fZ2Vt
X21tYXAoZmlscCwgdm1hKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChyZXQp
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgb2Jq
ID0gdm1hLSZndDt2bV9wcml2YXRlX2RhdGE7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gc3ByZF9nZW1fY21hX29iamVjdF9tbWFw
KG9iaiwgdm1hKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRfZ2VtX2NtYV9wcmltZV9tbWFwKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
aW50IHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoHJldCA9IGRybV9nZW1fbW1hcF9vYmoob2JqLCBvYmotJmd0O3NpemUsIHZtYSk7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAocmV0KTxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiBzcHJkX2dlbV9jbWFfb2Jq
ZWN0X21tYXAob2JqLCB2bWEpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdHJ1Y3Qgc2dfdGFibGUgKnNwcmRf
Z2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUoc3RydWN0PGJyPg0KJmd0O8KgIMKgIMKgZHJtX2dl
bV9vYmplY3QgKm9iaik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqBzdHJ1Y3Qgc3ByZF9nZW1fb2JqICpzcHJkX2dlbSA9IHRvX3NwcmRfZ2Vt
X29iaihvYmopOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IHNnX3RhYmxl
ICpzZ3RiOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaW50IHJldDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNndGIgPSBremFs
bG9jKHNpemVvZigqc2d0YiksIEdGUF9LRVJORUwpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgaWYgKCFzZ3RiKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXQgPSBkbWFfZ2V0X3NndGFibGUob2JqLSZndDtk
ZXYtJmd0O2Rldiwgc2d0Yiwgc3ByZF9nZW0tJmd0O3ZhZGRyLDxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3ByZF9nZW0tJmd0
O2RtYV9hZGRyLCBvYmotJmd0O3NpemUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
aWYgKHJldCkgezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJN
X0VSUk9SKCZxdW90O2ZhaWxlZCB0byBhbGxvY2F0ZSBzZ190YWJsZSwgJWRcbiZxdW90OywgcmV0
KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGtmcmVlKHNndGIp
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIEVSUl9Q
VFIocmV0KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiBzZ3RiOzxicj4N
CiZndDvCoCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnNwcmRfZ2VtX3ByaW1lX2ltcG9ydF9z
Z190YWJsZShzdHJ1Y3Q8YnI+DQomZ3Q7wqAgwqAgwqBkcm1fZGV2aWNlICpkcm0sPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2ht
ZW50ICphdHRhY2gsIHN0cnVjdCBzZ190YWJsZTxicj4NCiZndDvCoCDCoCDCoCpzZ3RiKTxicj4N
CiZndDvCoCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVj
dCBzcHJkX2dlbV9vYmogKnNwcmRfZ2VtOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3ByZF9nZW0gPSBzcHJkX2dlbV9vYmpfY3JlYXRlKGRy
bSwgYXR0YWNoLSZndDtkbWFidWYtJmd0O3NpemUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgaWYgKElTX0VSUihzcHJkX2dlbSkpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXR1cm4gRVJSX0NBU1Qoc3ByZF9nZW0pOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgRFJNX0RFQlVHKCZxdW90O2dl
bSA9ICVwXG4mcXVvdDssICZhbXA7c3ByZF9nZW0tJmd0O2Jhc2UpOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHNndGItJmd0O25lbnRz
ID09IDEpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzcHJkX2dl
bS0mZ3Q7ZG1hX2FkZHIgPSBzZ19kbWFfYWRkcmVzcyhzZ3RiLSZndDtzZ2wpOzxicj4NCiZndDvC
oCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3ByZF9nZW0tJmd0
O3NndGIgPSBzZ3RiOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgcmV0dXJuICZhbXA7c3ByZF9nZW0tJmd0O2Jhc2U7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zcHJkL3NwcmRfZ2VtLmg8YnI+DQomZ3Q7wqAgwqAgwqBiL2RyaXZlcnMvZ3B1L2RybS9z
cHJkL3NwcmRfZ2VtLmg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBpbmRleCAwMDAwMDAwLi40YzEwZDhhPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyAtLS0gL2Rldi9udWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2dlbS5oPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBAQCAtMCww
ICsxLDMwIEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAgKi88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvKjxicj4NCiZndDvCoCDCoCDC
oCZndDsgKyAqIENvcHlyaWdodCAoQykgMjAxOSBVbmlzb2MgSW5jLjxicj4NCiZndDvCoCDCoCDC
oCZndDsgKyAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyNpZm5kZWYgX1NQUkRfR0VNX0hfPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2RlZmluZSBfU1BS
RF9HRU1fSF88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsj
aW5jbHVkZSAmbHQ7ZHJtL2RybV9nZW0uaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdHJ1Y3Qgc3ByZF9nZW1fb2JqIHs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBkcm1fZ2VtX29iamVjdMKgIMKgYmFzZTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRtYV9hZGRyX3TCoCDCoCDCoCDCoCDCoCDCoCDCoCBkbWFf
YWRkcjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBzZ190YWJsZcKgIMKg
IMKgIMKgIMKgKnNndGI7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB2b2lkwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKnZhZGRyOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK307
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2RlZmluZSB0
b19zcHJkX2dlbV9vYmooeCnCoCDCoGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3Qgc3ByZF9nZW1fb2Jq
LDxicj4NCiZndDvCoCDCoCDCoGJhc2UpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArdm9pZCBzcHJkX2dlbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKmdlbSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRfZ2VtX2NtYV9kdW1i
X2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwgc3RydWN0PGJyPg0KJmd0O8KgIMKg
IMKgZHJtX2RldmljZSAqZGV2LDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdz
KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtpbnQgc3ByZF9nZW1fY21hX21tYXAoc3RydWN0IGZp
bGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICtpbnQgc3ByZF9nZW1fY21hX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmosPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0
cnVjdCBzZ190YWJsZSAqc3ByZF9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZShzdHJ1Y3Q8YnI+
DQomZ3Q7wqAgwqAgwqBkcm1fZ2VtX29iamVjdCAqb2JqKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnNwcmRfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShz
dHJ1Y3Q8YnI+DQomZ3Q7wqAgwqAgwqBkcm1fZGV2aWNlICpkZXYsPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRh
Y2gsIHN0cnVjdCBzZ190YWJsZTxicj4NCiZndDvCoCDCoCDCoCpzZ3RiKTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjZW5kaWY8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAtLSA8YnI+DQomZ3Q7wqAgwqAgwqBU
aG9tYXMgWmltbWVybWFubjxicj4NCiZndDvCoCDCoCDCoEdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXI8YnI+DQomZ3Q7wqAgwqAgwqBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkg8
YnI+DQomZ3Q7wqAgwqAgwqBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnk8
YnI+DQomZ3Q7wqAgwqAgwqAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpPGJyPg0KJmd0O8KgIMKg
IMKgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcjxicj4NCiZndDsgPGJyPg0K
PGJyPg0KLS0gPGJyPg0KVGhvbWFzIFppbW1lcm1hbm48YnI+DQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyPGJyPg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIPGJyPg0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55PGJyPg0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKTxicj4NCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXI8YnI+
DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+DQo=
--000000000000dbf345059959ae88--

--===============1745204853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1745204853==--
