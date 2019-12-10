Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B230C11A6D7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0802E6EAC3;
	Wed, 11 Dec 2019 09:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679DD6E8DE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 12:38:30 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r14so8095891qke.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 04:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+W3NFzQGW6GbVeC6SaONj61k9eF+FNv7e804DL1muBg=;
 b=BLDmeSIW3aeoz1oD9UXxJ6pmrxweZIhmKUzKnVFZBpaA48QDaBKbYUbPoQQFvD4p4l
 qO3+BwyxMW+ahtk+txufT9hTHNQ2/xG86UcieZOuPQnDcnCyyKs773XkTG/rp4C0tTZA
 Ss+XSd0p5doSUvGlKCOOHyL0/4/SiSdWDMdKisBxfB4ngdMO3vj2CCJW7f7IRzKleX9x
 Q9cndBWAIFvCid+Z0/9R4OKg4C5l+eh7HsoX5WS5u5x/jXAzz0AtPdxLZEfz2rLBtMqL
 fuins1f/3XXvgdw8I1Ob1tOPySn0/XKesX7cG9RNNv5i46A4NfjtKxIxu/v7zbenwHXd
 hdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+W3NFzQGW6GbVeC6SaONj61k9eF+FNv7e804DL1muBg=;
 b=cBGjuhJNmLjuTLZA6vz7Hr9Yn0TmQ/8rB5mB964TQxsblKf7ItcsHJKeXRdNvIzoxH
 csRyUfVqmbbR4F07yFD7cGrTiKPLxkKUAwtDYEFzmfOOoFnmzER82ReAoRInxOWA3sjg
 cq0+uOVshMfEz19ksE1LxFK2+YifbAFpxTYyk+DBNUBu3t9e8enCQHBdZttDid5j2oMH
 Qvodecz5ZkbTJSPkvgj4hNHvc9/iRgsDlUrEQ3ERBNHMLDsFpBeyVb5rH6gN+KTF2EdH
 U7/w2U/RZpmmcxiv3Yhkf4pF9Npz2tRQ4w2AZBo4/Jgs4QzWK4iMioyEIfs1a77wMhNB
 kXuA==
X-Gm-Message-State: APjAAAX65OBeeF7Dpu15RLsBzDASOpmrw/H1ciXSQ3yvcz1TnFagyi/3
 orPHek8UUYXpRdfaOhOk+fs8/0Y+iEL8xJ205pY=
X-Google-Smtp-Source: APXvYqyomhTgEyL+obwEoMGBbUCNydMtSk17BKIKNpK67Oie6RES6s1dxNSiRos8o3Gg6uMDpf1dZiH0zk84b03zqiA=
X-Received: by 2002:a05:620a:10b2:: with SMTP id
 h18mr12174418qkk.185.1575981509434; 
 Tue, 10 Dec 2019 04:38:29 -0800 (PST)
MIME-Version: 1.0
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
 <62c61dea-6297-1df2-0037-8c00fa36812b@suse.de>
In-Reply-To: <62c61dea-6297-1df2-0037-8c00fa36812b@suse.de>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Tue, 10 Dec 2019 20:38:17 +0800
Message-ID: <CAFPSGXb-pbmXFXrN7adK1TO+09T8qtJjwk+dK-TidZSsfPqHFg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1532597432=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1532597432==
Content-Type: multipart/alternative; boundary="0000000000000ae016059958ca7f"

--0000000000000ae016059958ca7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Thomas Zimmermann <tzimmermann@suse.de> =E4=BA=8E2019=E5=B9=B412=E6=9C=8810=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=886:33=E5=86=99=E9=81=93=EF=BC=
=9A

> Hi
>
> Am 10.12.19 um 09:36 schrieb Kevin Tang:
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > Adds drm support for the Unisoc's display subsystem.
> >
> > This is drm device and gem driver. This driver provides support for the
> > Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Baolin Wang <baolin.wang@linaro.org>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  drivers/gpu/drm/Kconfig         |   2 +
> >  drivers/gpu/drm/Makefile        |   1 +
> >  drivers/gpu/drm/sprd/Kconfig    |  14 ++
> >  drivers/gpu/drm/sprd/Makefile   |   8 ++
> >  drivers/gpu/drm/sprd/sprd_drm.c | 287
> ++++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_drm.h |  19 +++
> >  drivers/gpu/drm/sprd/sprd_gem.c | 178 +++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_gem.h |  30 +++++
>
> The GEM implementation looks like DRM's CMA helpers. Can you not use CMA
> helpers instead?
>
Ok, i will remove cma keywords from the GEM implementatio.

>
> >  8 files changed, 539 insertions(+)
> >  create mode 100644 drivers/gpu/drm/sprd/Kconfig
> >  create mode 100644 drivers/gpu/drm/sprd/Makefile
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index bfdadc3..cead12c 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
> >
> >  source "drivers/gpu/drm/mcde/Kconfig"
> >
> > +source "drivers/gpu/drm/sprd/Kconfig"
> > +
> >  # Keep legacy drivers last
> >
> >  menuconfig DRM_LEGACY
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 9f1c7c4..85ca211 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  +=3D lima/
> >  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/
> >  obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
> >  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
> > +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> > new file mode 100644
> > index 0000000..79f286b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -0,0 +1,14 @@
> > +config DRM_SPRD
> > +     tristate "DRM Support for Unisoc SoCs Platform"
> > +     depends on ARCH_SPRD
> > +     depends on DRM && OF
> > +     select DRM_KMS_HELPER
> > +     select DRM_GEM_CMA_HELPER
> > +     select DRM_KMS_CMA_HELPER
> > +     select DRM_MIPI_DSI
> > +     select DRM_PANEL
> > +     select VIDEOMODE_HELPERS
> > +     select BACKLIGHT_CLASS_DEVICE
> > +     help
> > +       Choose this option if you have a Unisoc chipsets.
> > +       If M is selected the module will be called sprd-drm.
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > new file mode 100644
> > index 0000000..df0b316
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -0,0 +1,8 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +ccflags-y +=3D -Iinclude/drm
> > +
> > +subdir-ccflags-y +=3D -I$(src)
> > +
> > +obj-y :=3D sprd_drm.o \
> > +     sprd_gem.o
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > new file mode 100644
> > index 0000000..ec16fee
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -0,0 +1,287 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "sprd_drm.h"
> > +#include "sprd_gem.h"
> > +
> > +#define DRIVER_NAME  "sprd"
> > +#define DRIVER_DESC  "Spreadtrum SoCs' DRM Driver"
> > +#define DRIVER_DATE  "20180501"
> > +#define DRIVER_MAJOR 1
> > +#define DRIVER_MINOR 0
> > +
> > +static const struct drm_mode_config_helper_funcs
> sprd_drm_mode_config_helper =3D {
> > +     .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> > +};
> > +
> > +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =
=3D {
> > +     .fb_create =3D drm_gem_fb_create,
> > +     .atomic_check =3D drm_atomic_helper_check,
> > +     .atomic_commit =3D drm_atomic_helper_commit,
> > +};
> > +
> > +static void sprd_drm_mode_config_init(struct drm_device *drm)
> > +{
> > +     drm_mode_config_init(drm);
> > +
> > +     drm->mode_config.min_width =3D 0;
> > +     drm->mode_config.min_height =3D 0;
> > +     drm->mode_config.max_width =3D 8192;
> > +     drm->mode_config.max_height =3D 8192;
> > +     drm->mode_config.allow_fb_modifiers =3D true;
> > +
> > +     drm->mode_config.funcs =3D &sprd_drm_mode_config_funcs;
> > +     drm->mode_config.helper_private =3D &sprd_drm_mode_config_helper;
> > +}
> > +
> > +static const struct file_operations sprd_drm_fops =3D {
> > +     .owner          =3D THIS_MODULE,
> > +     .open           =3D drm_open,
> > +     .release        =3D drm_release,
> > +     .unlocked_ioctl =3D drm_ioctl,
> > +     .compat_ioctl   =3D drm_compat_ioctl,
> > +     .poll           =3D drm_poll,
> > +     .read           =3D drm_read,
> > +     .llseek         =3D no_llseek,
> > +     .mmap           =3D sprd_gem_cma_mmap,
> > +};
> > +
> > +static struct drm_driver sprd_drm_drv =3D {
> > +     .driver_features        =3D DRIVER_GEM | DRIVER_MODESET |
> > +                               DRIVER_ATOMIC | DRIVER_HAVE_IRQ,
> > +     .fops                   =3D &sprd_drm_fops,
> > +
> > +     .gem_vm_ops             =3D &drm_gem_cma_vm_ops,
> > +     .gem_free_object_unlocked       =3D sprd_gem_free_object,
> > +     .dumb_create            =3D sprd_gem_cma_dumb_create,
> > +
> > +     .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
> > +     .gem_prime_import       =3D drm_gem_prime_import,
> > +     .gem_prime_import_sg_table =3D sprd_gem_prime_import_sg_table,
> > +
> > +     .name                   =3D DRIVER_NAME,
> > +     .desc                   =3D DRIVER_DESC,
> > +     .date                   =3D DRIVER_DATE,
> > +     .major                  =3D DRIVER_MAJOR,
> > +     .minor                  =3D DRIVER_MINOR,
> > +};
> > +
> > +static int sprd_drm_bind(struct device *dev)
> > +{
> > +     struct drm_device *drm;
> > +     struct sprd_drm *sprd;
> > +     int err;
> > +
> > +     drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
> > +     if (IS_ERR(drm))
> > +             return PTR_ERR(drm);
> > +
> > +     dev_set_drvdata(dev, drm);
> > +
> > +     sprd =3D devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> > +     if (!sprd) {
> > +             err =3D -ENOMEM;
> > +             goto err_free_drm;
> > +     }
> > +     drm->dev_private =3D sprd;
> > +
> > +     sprd_drm_mode_config_init(drm);
> > +
> > +     /* bind and init sub drivers */
> > +     err =3D component_bind_all(drm->dev, drm);
> > +     if (err) {
> > +             DRM_ERROR("failed to bind all component.\n");
> > +             goto err_dc_cleanup;
> > +     }
> > +
> > +     /* vblank init */
> > +     err =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +     if (err) {
> > +             DRM_ERROR("failed to initialize vblank.\n");
> > +             goto err_unbind_all;
> > +     }
> > +     /* with irq_enabled =3D true, we can use the vblank feature. */
> > +     drm->irq_enabled =3D true;
> > +
> > +     /* reset all the states of crtc/plane/encoder/connector */
> > +     drm_mode_config_reset(drm);
> > +
> > +     /* init kms poll for handling hpd */
> > +     drm_kms_helper_poll_init(drm);
> > +
> > +     err =3D drm_dev_register(drm, 0);
> > +     if (err < 0)
> > +             goto err_kms_helper_poll_fini;
> > +
> > +     return 0;
> > +
> > +err_kms_helper_poll_fini:
> > +     drm_kms_helper_poll_fini(drm);
> > +err_unbind_all:
> > +     component_unbind_all(drm->dev, drm);
> > +err_dc_cleanup:
> > +     drm_mode_config_cleanup(drm);
> > +err_free_drm:
> > +     drm_dev_put(drm);
> > +     return err;
> > +}
> > +
> > +static void sprd_drm_unbind(struct device *dev)
> > +{
> > +     drm_put_dev(dev_get_drvdata(dev));
> > +}
> > +
> > +static const struct component_master_ops sprd_drm_component_ops =3D {
> > +     .bind =3D sprd_drm_bind,
> > +     .unbind =3D sprd_drm_unbind,
> > +};
> > +
> > +static int compare_of(struct device *dev, void *data)
> > +{
> > +     struct device_node *np =3D data;
> > +
> > +     DRM_DEBUG("compare %s\n", np->full_name);
> > +
> > +     return dev->of_node =3D=3D np;
> > +}
> > +
> > +static int sprd_drm_component_probe(struct device *dev,
> > +                        const struct component_master_ops *m_ops)
> > +{
> > +     struct device_node *ep, *port, *remote;
> > +     struct component_match *match =3D NULL;
> > +     int i;
> > +
> > +     if (!dev->of_node)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Bind the crtc's ports first, so that
> drm_of_find_possible_crtcs()
> > +      * called from encoder's .bind callbacks works as expected
> > +      */
> > +     for (i =3D 0; ; i++) {
> > +             port =3D of_parse_phandle(dev->of_node, "ports", i);
> > +             if (!port)
> > +                     break;
> > +
> > +             if (!of_device_is_available(port->parent)) {
> > +                     of_node_put(port);
> > +                     continue;
> > +             }
> > +
> > +             component_match_add(dev, &match, compare_of, port->parent=
);
> > +             of_node_put(port);
> > +     }
> > +
> > +     if (i =3D=3D 0) {
> > +             dev_err(dev, "missing 'ports' property\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     if (!match) {
> > +             dev_err(dev, "no available port\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     /*
> > +      * For bound crtcs, bind the encoders attached to their remote
> endpoint
> > +      */
> > +     for (i =3D 0; ; i++) {
> > +             port =3D of_parse_phandle(dev->of_node, "ports", i);
> > +             if (!port)
> > +                     break;
> > +
> > +             if (!of_device_is_available(port->parent)) {
> > +                     of_node_put(port);
> > +                     continue;
> > +             }
> > +
> > +             for_each_child_of_node(port, ep) {
> > +                     remote =3D of_graph_get_remote_port_parent(ep);
> > +                     if (!remote || !of_device_is_available(remote)) {
> > +                             of_node_put(remote);
> > +                             continue;
> > +                     } else if
> (!of_device_is_available(remote->parent)) {
> > +                             dev_warn(dev, "parent device of %s is not
> available\n",
> > +                                      remote->full_name);
> > +                             of_node_put(remote);
> > +                             continue;
> > +                     }
> > +
> > +                     component_match_add(dev, &match, compare_of,
> remote);
> > +                     of_node_put(remote);
> > +             }
> > +             of_node_put(port);
> > +     }
> > +
> > +     return component_master_add_with_match(dev, m_ops, match);
> > +}
> > +
> > +static int sprd_drm_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +
> > +     ret =3D dma_set_mask_and_coherent(&pdev->dev, ~0);
> > +     if (ret)
> > +             DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret)=
;
> > +
> > +     return sprd_drm_component_probe(&pdev->dev,
> &sprd_drm_component_ops);
> > +}
> > +
> > +static int sprd_drm_remove(struct platform_device *pdev)
> > +{
> > +     component_master_del(&pdev->dev, &sprd_drm_component_ops);
> > +     return 0;
> > +}
> > +
> > +static void sprd_drm_shutdown(struct platform_device *pdev)
> > +{
> > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> > +
> > +     if (!drm) {
> > +             DRM_WARN("drm device is not available, no shutdown\n");
> > +             return;
> > +     }
> > +
> > +     drm_atomic_helper_shutdown(drm);
> > +}
> > +
> > +static const struct of_device_id sprd_drm_match_table[] =3D {
> > +     { .compatible =3D "sprd,display-subsystem",},
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, sprd_drm_match_table);
> > +
> > +static struct platform_driver sprd_drm_driver =3D {
> > +     .probe =3D sprd_drm_probe,
> > +     .remove =3D sprd_drm_remove,
> > +     .shutdown =3D sprd_drm_shutdown,
> > +     .driver =3D {
> > +             .name =3D "sprd-drm-drv",
> > +             .of_match_table =3D sprd_drm_match_table,
> > +     },
> > +};
> > +
> > +module_platform_driver(sprd_drm_driver);
> > +
> > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> > +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> b/drivers/gpu/drm/sprd/sprd_drm.h
> > new file mode 100644
> > index 0000000..e840e65
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#ifndef _SPRD_DRM_H_
> > +#define _SPRD_DRM_H_
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_print.h>
> > +
> > +struct sprd_drm {
> > +     struct drm_device *drm;
> > +     struct drm_atomic_state *state;
> > +     struct device *dpu_dev;
> > +     struct device *gsp_dev;
> > +};
> > +
> > +#endif /* _SPRD_DRM_H_ */
> > diff --git a/drivers/gpu/drm/sprd/sprd_gem.c
> b/drivers/gpu/drm/sprd/sprd_gem.c
> > new file mode 100644
> > index 0000000..c617c8b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_gem.c
> > @@ -0,0 +1,178 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include <drm/drm_prime.h>
> > +
> > +#include "sprd_drm.h"
> > +#include "sprd_gem.h"
> > +
> > +static struct sprd_gem_obj *sprd_gem_obj_create(struct drm_device *drm=
,
> > +                                             unsigned long size)
> > +{
> > +     struct sprd_gem_obj *sprd_gem;
> > +     int ret;
> > +
> > +     sprd_gem =3D kzalloc(sizeof(*sprd_gem), GFP_KERNEL);
> > +     if (!sprd_gem)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     ret =3D drm_gem_object_init(drm, &sprd_gem->base, size);
> > +     if (ret < 0) {
> > +             DRM_ERROR("failed to initialize gem object\n");
> > +             goto error;
> > +     }
> > +
> > +     ret =3D drm_gem_create_mmap_offset(&sprd_gem->base);
> > +     if (ret) {
> > +             drm_gem_object_release(&sprd_gem->base);
> > +             goto error;
> > +     }
> > +
> > +     return sprd_gem;
> > +
> > +error:
> > +     kfree(sprd_gem);
> > +     return ERR_PTR(ret);
> > +}
> > +
> > +void sprd_gem_free_object(struct drm_gem_object *obj)
> > +{
> > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> > +
> > +     DRM_DEBUG("gem =3D %p\n", obj);
> > +
> > +     if (sprd_gem->vaddr)
> > +             dma_alloc_wc(obj->dev->dev, obj->size,
>
> dma_free_wc
>
Thanks for reminding

>
> Best regards
> Thomas
>
> [1]
>
> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/drm_gem_cma=
_helper.c
>
>
> > +                                   sprd_gem->vaddr, sprd_gem->dma_addr=
);
> > +     else if (sprd_gem->sgtb)
> > +             drm_prime_gem_destroy(obj, sprd_gem->sgtb);
> > +
> > +     drm_gem_object_release(obj);
> > +
> > +     kfree(sprd_gem);
> > +}
> > +
> > +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct
> drm_device *drm,
> > +                         struct drm_mode_create_dumb *args)
> > +{
> > +     struct sprd_gem_obj *sprd_gem;
> > +     int ret;
> > +
> > +     args->pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> > +     args->size =3D round_up(args->pitch * args->height, PAGE_SIZE);
> > +
> > +     sprd_gem =3D sprd_gem_obj_create(drm, args->size);
> > +     if (IS_ERR(sprd_gem))
> > +             return PTR_ERR(sprd_gem);
> > +
> > +     sprd_gem->vaddr =3D dma_alloc_wc(drm->dev, args->size,
> > +                     &sprd_gem->dma_addr, GFP_KERNEL | __GFP_NOWARN |
> GFP_DMA);
> > +     if (!sprd_gem->vaddr) {
> > +             DRM_ERROR("failed to allocate buffer with size %llu\n",
> > +                       args->size);
> > +             ret =3D -ENOMEM;
> > +             goto error;
> > +     }
> > +
> > +     ret =3D drm_gem_handle_create(file_priv, &sprd_gem->base,
> &args->handle);
> > +     if (ret)
> > +             goto error;
> > +
> > +     drm_gem_object_put_unlocked(&sprd_gem->base);
> > +
> > +     return 0;
> > +
> > +error:
> > +     sprd_gem_free_object(&sprd_gem->base);
> > +     return ret;
> > +}
> > +
> > +static int sprd_gem_cma_object_mmap(struct drm_gem_object *obj,
> > +                                struct vm_area_struct *vma)
> > +
> > +{
> > +     int ret;
> > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> > +
> > +     vma->vm_flags &=3D ~VM_PFNMAP;
> > +     vma->vm_pgoff =3D 0;
> > +
> > +     ret =3D dma_mmap_wc(obj->dev->dev, vma,
> > +                                 sprd_gem->vaddr, sprd_gem->dma_addr,
> > +                                 vma->vm_end - vma->vm_start);
> > +     if (ret)
> > +             drm_gem_vm_close(vma);
> > +
> > +     return ret;
> > +}
> > +
> > +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)
> > +{
> > +     struct drm_gem_object *obj;
> > +     int ret;
> > +
> > +     ret =3D drm_gem_mmap(filp, vma);
> > +     if (ret)
> > +             return ret;
> > +
> > +     obj =3D vma->vm_private_data;
> > +
> > +     return sprd_gem_cma_object_mmap(obj, vma);
> > +}
> > +
> > +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,
> > +                         struct vm_area_struct *vma)
> > +{
> > +     int ret;
> > +
> > +     ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return sprd_gem_cma_object_mmap(obj, vma);
> > +}
> > +
> > +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct drm_gem_object
> *obj)
> > +{
> > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> > +     struct sg_table *sgtb;
> > +     int ret;
> > +
> > +     sgtb =3D kzalloc(sizeof(*sgtb), GFP_KERNEL);
> > +     if (!sgtb)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     ret =3D dma_get_sgtable(obj->dev->dev, sgtb, sprd_gem->vaddr,
> > +                           sprd_gem->dma_addr, obj->size);
> > +     if (ret) {
> > +             DRM_ERROR("failed to allocate sg_table, %d\n", ret);
> > +             kfree(sgtb);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     return sgtb;
> > +}
> > +
> > +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct drm_devic=
e
> *drm,
> > +             struct dma_buf_attachment *attach, struct sg_table *sgtb)
> > +{
> > +     struct sprd_gem_obj *sprd_gem;
> > +
> > +     sprd_gem =3D sprd_gem_obj_create(drm, attach->dmabuf->size);
> > +     if (IS_ERR(sprd_gem))
> > +             return ERR_CAST(sprd_gem);
> > +
> > +     DRM_DEBUG("gem =3D %p\n", &sprd_gem->base);
> > +
> > +     if (sgtb->nents =3D=3D 1)
> > +             sprd_gem->dma_addr =3D sg_dma_address(sgtb->sgl);
> > +
> > +     sprd_gem->sgtb =3D sgtb;
> > +
> > +     return &sprd_gem->base;
> > +}
> > diff --git a/drivers/gpu/drm/sprd/sprd_gem.h
> b/drivers/gpu/drm/sprd/sprd_gem.h
> > new file mode 100644
> > index 0000000..4c10d8a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_gem.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#ifndef _SPRD_GEM_H_
> > +#define _SPRD_GEM_H_
> > +
> > +#include <drm/drm_gem.h>
> > +
> > +struct sprd_gem_obj {
> > +     struct drm_gem_object   base;
> > +     dma_addr_t              dma_addr;
> > +     struct sg_table         *sgtb;
> > +     void                    *vaddr;
> > +};
> > +
> > +#define to_sprd_gem_obj(x)   container_of(x, struct sprd_gem_obj, base=
)
> > +
> > +void sprd_gem_free_object(struct drm_gem_object *gem);
> > +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct
> drm_device *dev,
> > +                         struct drm_mode_create_dumb *args);
> > +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);
> > +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,
> > +                      struct vm_area_struct *vma);
> > +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct drm_gem_object
> *obj);
> > +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct drm_devic=
e
> *dev,
> > +             struct dma_buf_attachment *attach, struct sg_table *sgtb)=
;
> > +
> > +#endif
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

--0000000000000ae016059958ca7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Thomas Zimmermann &lt;<a href=3D"mailto=
:tzimmermann@suse.de">tzimmermann@suse.de</a>&gt; =E4=BA=8E2019=E5=B9=B412=
=E6=9C=8810=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=886:33=E5=86=99=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi<br>
<br>
Am 10.12.19 um 09:36 schrieb Kevin Tang:<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; Adds drm support for the Unisoc&#39;s display subsystem.<br>
&gt; <br>
&gt; This is drm device and gem driver. This driver provides support for th=
e<br>
&gt; Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.<br>
&gt; <br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Baolin Wang &lt;<a href=3D"mailto:baolin.wang@linaro.org" target=
=3D"_blank">baolin.wang@linaro.org</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +<br>
&gt;=C2=A0 drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 |=C2=A0 14 ++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A08 ++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c | 287 ++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h |=C2=A0 19 +++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_gem.c | 178 +++++++++++++++++++++++++<=
br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_gem.h |=C2=A0 30 +++++<br>
<br>
The GEM implementation looks like DRM&#39;s CMA helpers. Can you not use CM=
A<br>
helpers instead?<br></blockquote><div>Ok, i will remove cma <span class=3D"=
gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" clas=
s=3D"gmail-">keywords</span></span> from the GEM implementatio. </div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 8 files changed, 539 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Kconfig<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig<br>
&gt; index bfdadc3..cead12c 100644<br>
&gt; --- a/drivers/gpu/drm/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/Kconfig<br>
&gt; @@ -387,6 +387,8 @@ source &quot;drivers/gpu/drm/aspeed/Kconfig&quot;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 source &quot;drivers/gpu/drm/mcde/Kconfig&quot;<br>
&gt;=C2=A0 <br>
&gt; +source &quot;drivers/gpu/drm/sprd/Kconfig&quot;<br>
&gt; +<br>
&gt;=C2=A0 # Keep legacy drivers last<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 menuconfig DRM_LEGACY<br>
&gt; diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile<br>
&gt; index 9f1c7c4..85ca211 100644<br>
&gt; --- a/drivers/gpu/drm/Makefile<br>
&gt; +++ b/drivers/gpu/drm/Makefile<br>
&gt; @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)=C2=A0 +=3D lima/<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_MCDE) +=3D mcde/<br>
&gt; +obj-$(CONFIG_DRM_SPRD) +=3D sprd/<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconf=
ig<br>
&gt; new file mode 100644<br>
&gt; index 0000000..79f286b<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Kconfig<br>
&gt; @@ -0,0 +1,14 @@<br>
&gt; +config DRM_SPRD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;DRM Support for Unisoc SoCs Platfo=
rm&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_SPRD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on DRM &amp;&amp; OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_GEM_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_PANEL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select VIDEOMODE_HELPERS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BACKLIGHT_CLASS_DEVICE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this option if you have a Unisoc ch=
ipsets.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If M is selected the module will be called=
 sprd-drm.<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; new file mode 100644<br>
&gt; index 0000000..df0b316<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -0,0 +1,8 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +ccflags-y +=3D -Iinclude/drm<br>
&gt; +<br>
&gt; +subdir-ccflags-y +=3D -I$(src)<br>
&gt; +<br>
&gt; +obj-y :=3D sprd_drm.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_gem.o<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..ec16fee<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -0,0 +1,287 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/component.h&gt;<br>
&gt; +#include &lt;linux/dma-mapping.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/of_graph.h&gt;<br>
&gt; +#include &lt;linux/of_platform.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_drv.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_probe_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_vblank.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +#include &quot;sprd_gem.h&quot;<br>
&gt; +<br>
&gt; +#define DRIVER_NAME=C2=A0 &quot;sprd&quot;<br>
&gt; +#define DRIVER_DESC=C2=A0 &quot;Spreadtrum SoCs&#39; DRM Driver&quot;=
<br>
&gt; +#define DRIVER_DATE=C2=A0 &quot;20180501&quot;<br>
&gt; +#define DRIVER_MAJOR 1<br>
&gt; +#define DRIVER_MINOR 0<br>
&gt; +<br>
&gt; +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config=
_helper =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_commit_tail =3D drm_atomic_helper_commit_=
tail_rpm,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.fb_create =3D drm_gem_fb_create,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_check =3D drm_atomic_helper_check,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_commit =3D drm_atomic_helper_commit,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void sprd_drm_mode_config_init(struct drm_device *drm)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.min_width =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.min_height =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.max_width =3D 8192;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.max_height =3D 8192;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.allow_fb_modifiers =3D true;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.funcs =3D &amp;sprd_drm_mode_=
config_funcs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.helper_private =3D &amp;sprd_=
drm_mode_config_helper;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct file_operations sprd_drm_fops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D THIS=
_MODULE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 drm_open,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D drm_relea=
se,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unlocked_ioctl =3D drm_ioctl,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.compat_ioctl=C2=A0 =C2=A0=3D drm_compat_ioctl,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0.poll=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 drm_poll,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 drm_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.llseek=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D no_l=
lseek,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 sprd_gem_cma_mmap,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct drm_driver sprd_drm_drv =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D D=
RIVER_GEM | DRIVER_MODESET |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRIVER_ATOMIC | DRIVER_HAVE_IRQ,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;sprd_drm_fops,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.gem_vm_ops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &amp;drm_gem_cma_vm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.gem_free_object_unlocked=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D sprd_gem_free_object,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dumb_create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D sprd_gem_cma_dumb_create,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.prime_fd_to_handle=C2=A0 =C2=A0 =C2=A0=3D drm_ge=
m_prime_fd_to_handle,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.gem_prime_import=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D d=
rm_gem_prime_import,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.gem_prime_import_sg_table =3D sprd_gem_prime_imp=
ort_sg_table,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_NAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DESC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DATE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.major=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MAJOR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.minor=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MINOR,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_drm_bind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm =3D drm_dev_alloc(&amp;sprd_drm_drv, dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(drm))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(drm);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_set_drvdata(dev, drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd =3D devm_kzalloc(drm-&gt;dev, sizeof(*sprd),=
 GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sprd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_free_drm;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;dev_private =3D sprd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D component_bind_all(drm-&gt;dev, drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to bind all component.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dc_cleanup;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* vblank init */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D drm_vblank_init(drm, drm-&gt;mode_config.=
num_crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to initialize vblank.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_unbind_all;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can use the vbla=
nk feature. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;irq_enabled =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* reset all the states of crtc/plane/encoder/con=
nector */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_reset(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* init kms poll for handling hpd */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D drm_dev_register(drm, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kms_helper_p=
oll_fini;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_kms_helper_poll_fini:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
&gt; +err_unbind_all:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br>
&gt; +err_dc_cleanup:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_cleanup(drm);<br>
&gt; +err_free_drm:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dev_put(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_unbind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_put_dev(dev_get_drvdata(dev));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_master_ops sprd_drm_component_ops =3D {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bind =3D sprd_drm_bind,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_drm_unbind,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int compare_of(struct device *dev, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;compare %s\n&quot;, np-&gt;full_n=
ame);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return dev-&gt;of_node =3D=3D np;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_component_probe(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 const struct component_master_ops *m_ops)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *ep, *port, *remote;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct component_match *match =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dev-&gt;of_node)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Bind the crtc&#39;s ports first, so that drm_o=
f_find_possible_crtcs()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * called from encoder&#39;s .bind callbacks work=
s as expected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; ; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_parse_pha=
ndle(dev-&gt;of_node, &quot;ports&quot;, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_device_is_ava=
ilable(port-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0of_node_put(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0component_match_add(d=
ev, &amp;match, compare_of, port-&gt;parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(port);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;mi=
ssing &#39;ports&#39; property\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!match) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;no=
 available port\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * For bound crtcs, bind the encoders attached to=
 their remote endpoint<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; ; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_parse_pha=
ndle(dev-&gt;of_node, &quot;ports&quot;, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_device_is_ava=
ilable(port-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0of_node_put(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_child_of_nod=
e(port, ep) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0remote =3D of_graph_get_remote_port_parent(ep);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!remote || !of_device_is_available(remote)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} else if (!of_device_is_available(remote-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot;parent device of %s =
is not available\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote-&gt;=
full_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0component_match_add(dev, &amp;match, compare_of, remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(port);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return component_master_add_with_match(dev, m_ops=
, match);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_set_mask_and_coherent(&amp;pdev-&gt;d=
ev, ~0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;dma_s=
et_mask_and_coherent failed (%d)\n&quot;, ret);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprd_drm_component_probe(&amp;pdev-&gt;dev=
, &amp;sprd_drm_component_ops);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_master_del(&amp;pdev-&gt;dev, &amp;sprd=
_drm_component_ops);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_shutdown(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D platform_get_drvdata(p=
dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!drm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_WARN(&quot;drm de=
vice is not available, no shutdown\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_atomic_helper_shutdown(drm);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id sprd_drm_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sprd,display-subsystem&qu=
ot;,},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, sprd_drm_match_table);<br>
&gt; +<br>
&gt; +static struct platform_driver sprd_drm_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D sprd_drm_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D sprd_drm_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.shutdown =3D sprd_drm_shutdown,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;sprd-=
drm-drv&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D s=
prd_drm_match_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +module_platform_driver(sprd_drm_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Leon He &lt;<a href=3D"mailto:leon.he@unisoc.com"=
 target=3D"_blank">leon.he@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Kevin Tang &lt;<a href=3D"mailto:kevin.tang@uniso=
c.com" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Unisoc DRM KMS Master Driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sp=
rd_drm.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e840e65<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _SPRD_DRM_H_<br>
&gt; +#define _SPRD_DRM_H_<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic.h&gt;<br>
&gt; +#include &lt;drm/drm_print.h&gt;<br>
&gt; +<br>
&gt; +struct sprd_drm {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_atomic_state *state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dpu_dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *gsp_dev;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#endif /* _SPRD_DRM_H_ */<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_gem.c b/drivers/gpu/drm/sprd/sp=
rd_gem.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c617c8b<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_gem.c<br>
&gt; @@ -0,0 +1,178 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/dma-buf.h&gt;<br>
&gt; +#include &lt;linux/pm_runtime.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_prime.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +#include &quot;sprd_gem.h&quot;<br>
&gt; +<br>
&gt; +static struct sprd_gem_obj *sprd_gem_obj_create(struct drm_device *dr=
m,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned long size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_gem =3D kzalloc(sizeof(*sprd_gem), GFP_KERNE=
L);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sprd_gem)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_object_init(drm, &amp;sprd_gem-&g=
t;base, size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to initialize gem object\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_create_mmap_offset(&amp;sprd_gem-=
&gt;base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object_releas=
e(&amp;sprd_gem-&gt;base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprd_gem;<br>
&gt; +<br>
&gt; +error:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(sprd_gem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ERR_PTR(ret);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void sprd_gem_free_object(struct drm_gem_object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj=
(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;gem =3D %p\n&quot;, obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_gem-&gt;vaddr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_alloc_wc(obj-&gt;=
dev-&gt;dev, obj-&gt;size,<br>
<br>
dma_free_wc<br></blockquote><div><span class=3D"gmail-tlid-translation gmai=
l-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">Thanks for rem=
inding</span></span> <br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Best regards<br>
Thomas<br>
<br>
[1]<br>
<a href=3D"https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/dr=
m_gem_cma_helper.c" rel=3D"noreferrer" target=3D"_blank">https://cgit.freed=
esktop.org/drm/drm-tip/tree/drivers/gpu/drm/drm_gem_cma_helper.c</a><br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_gem-&gt;vaddr,=
 sprd_gem-&gt;dma_addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (sprd_gem-&gt;sgtb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_prime_gem_destroy=
(obj, sprd_gem-&gt;sgtb);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_gem_object_release(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(sprd_gem);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct drm_d=
evice *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0struct drm_mode_create_dumb *args)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args-&gt;pitch =3D DIV_ROUND_UP(args-&gt;width * =
args-&gt;bpp, 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args-&gt;size =3D round_up(args-&gt;pitch * args-=
&gt;height, PAGE_SIZE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_gem =3D sprd_gem_obj_create(drm, args-&gt;si=
ze);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(sprd_gem))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sprd_g=
em);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_gem-&gt;vaddr =3D dma_alloc_wc(drm-&gt;dev, =
args-&gt;size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp;sprd_gem-&gt;dma_addr, GFP_KERNEL | __GFP_NOWARN | GFP_DMA);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sprd_gem-&gt;vaddr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to allocate buffer with size %llu\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0args-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_handle_create(file_priv, &amp;spr=
d_gem-&gt;base, &amp;args-&gt;handle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_gem_object_put_unlocked(&amp;sprd_gem-&gt;bas=
e);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +error:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_gem_free_object(&amp;sprd_gem-&gt;base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_gem_cma_object_mmap(struct drm_gem_object *obj,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vm_area_struct *vma)<br>
&gt; +<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj=
(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vma-&gt;vm_flags &amp;=3D ~VM_PFNMAP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vma-&gt;vm_pgoff =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_mmap_wc(obj-&gt;dev-&gt;dev, vma,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_gem-&gt;vaddr, sprd_g=
em-&gt;dma_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vma-&gt;vm_end - vma-&gt;v=
m_start);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_vm_close(vma)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_gem_object *obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_mmap(filp, vma);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0obj =3D vma-&gt;vm_private_data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprd_gem_cma_object_mmap(obj, vma);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0struct vm_area_struct *vma)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_mmap_obj(obj, obj-&gt;size, vma);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprd_gem_cma_object_mmap(obj, vma);<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct drm_gem_objec=
t *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj=
(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sg_table *sgtb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sgtb =3D kzalloc(sizeof(*sgtb), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sgtb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_get_sgtable(obj-&gt;dev-&gt;dev, sgtb=
, sprd_gem-&gt;vaddr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_gem-&gt;dma_addr, obj-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to allocate sg_table, %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(sgtb);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(ret);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sgtb;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct drm_devi=
ce *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_buf_attach=
ment *attach, struct sg_table *sgtb)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_gem =3D sprd_gem_obj_create(drm, attach-&gt;=
dmabuf-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(sprd_gem))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_CAST(sprd_=
gem);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;gem =3D %p\n&quot;, &amp;sprd_gem=
-&gt;base);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sgtb-&gt;nents =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_gem-&gt;dma_addr=
 =3D sg_dma_address(sgtb-&gt;sgl);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_gem-&gt;sgtb =3D sgtb;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &amp;sprd_gem-&gt;base;<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_gem.h b/drivers/gpu/drm/sprd/sp=
rd_gem.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4c10d8a<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_gem.h<br>
&gt; @@ -0,0 +1,30 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _SPRD_GEM_H_<br>
&gt; +#define _SPRD_GEM_H_<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_gem.h&gt;<br>
&gt; +<br>
&gt; +struct sprd_gem_obj {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_gem_object=C2=A0 =C2=A0base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_addr_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dma_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sg_table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
*sgtb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 *vaddr;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define to_sprd_gem_obj(x)=C2=A0 =C2=A0container_of(x, struct sprd_ge=
m_obj, base)<br>
&gt; +<br>
&gt; +void sprd_gem_free_object(struct drm_gem_object *gem);<br>
&gt; +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct drm_d=
evice *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0struct drm_mode_create_dumb *args);<br>
&gt; +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);=
<br>
&gt; +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 struct vm_area_struct *vma);<br>
&gt; +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct drm_gem_objec=
t *obj);<br>
&gt; +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct drm_devi=
ce *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_buf_attach=
ment *attach, struct sg_table *sgtb);<br>
&gt; +<br>
&gt; +#endif<br>
&gt; <br>
<br>
-- <br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany<br>
(HRB 36809, AG N=C3=BCrnberg)<br>
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer<br>
<br>
</blockquote></div></div>

--0000000000000ae016059958ca7f--

--===============1532597432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1532597432==--
