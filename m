Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190635A04D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C756EC29;
	Fri,  9 Apr 2021 13:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BA76EC29
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 13:50:22 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u4so6546586ljo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 06:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1kWiNCh/QtZTTMc8Zg8oKHRfxmd9HuAr3yksv/so/4o=;
 b=JdLeFXJsrDLoxYuJsfRsrSVz6Gs/ZIooKSftyvmT/jqnABVvSt4qaBT8zvJHR1emOO
 3SzD3Pe50JziaqoONPszmobtLqE47oNs5lcaYvu58TWA+hFj+/mxUjpAQLMmqQRpKf9T
 8nfsHgHh3dZJYyb8JxR8oD+Rnn3qAhKuq8T0/2Kuq6wzWp1iCv6TtO5/MNIMxXLF+Anz
 19cPn8g/ZwzKbtoXSmh1JqGPUGE4oUs0EkXAtpPu8djVC0dqlE0sM9o0gpFu52aR9qjM
 I2XxKzWGqGKyXeiKMITYOGA3jjRO703AUMA1jXmAdByL5JzK4IOcNibWETlkWjh1Q/yB
 yBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kWiNCh/QtZTTMc8Zg8oKHRfxmd9HuAr3yksv/so/4o=;
 b=r4aqbpkvxImkh0ovmz8I/V8ZctXzkgwH5Q64D+aFOEI+iyNJAD7eAcbfzSfu+uwRur
 Rzjc1gMWrEQvexmKTOx6yTfLi7UEcxsrZC1YBiMcn0u41Upnt82N/XdYT2fUFudr+e0V
 7ubbn2YWL/6rg7HzP1YqFRBaeAwFBoaJ5h0/b07D+rzrf27CSfRckE+hNaKpgP8D6F/1
 RO1+GQHfjPyQBv6EwY6+qSQFAeLgx9EGYjRKoG9Yq0c9AViEt/YlDLHmVWaqZ+CLznDH
 N7Td1Kd+S34rFJixx8r7+XFdfF26BKUgz2FUb4BkfkT+Uo0ENsekqI/lMI9rSaTrcugl
 A47g==
X-Gm-Message-State: AOAM530z+qOOB61i/nN2+YE2ZbKYV+Gaabnxv9LqW1GVQ0vivvKZ5K8e
 bE2vlKhoxLruI9Hasxi+kjfZRz7d1dPY1ambP68=
X-Google-Smtp-Source: ABdhPJzBQwyJloIHNhbb8T/XLOkDfB/cxByqze0bVHOCiWzGdRI48CjbqLC7eoVTr2QPK3PLC6oPU3MAg9ySP3UuGSI=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr9447959ljn.440.1617976220948; 
 Fri, 09 Apr 2021 06:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
 <b1c03605-1304-003c-beb2-ca096a549fb4@suse.de>
In-Reply-To: <b1c03605-1304-003c-beb2-ca096a549fb4@suse.de>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Fri, 9 Apr 2021 21:50:09 +0800
Message-ID: <CAFPSGXZ2o9YRAMax3ZeiyQ5bMtqOsSODMW8V7dXHZSD3gyzbQw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0906911133=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0906911133==
Content-Type: multipart/alternative; boundary="000000000000e79dd605bf8a7170"

--000000000000e79dd605bf8a7170
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

First of all, thanks for comments.

Thomas Zimmermann <tzimmermann@suse.de> =E4=BA=8E2021=E5=B9=B44=E6=9C=888=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:21=E5=86=99=E9=81=93=EF=BC=
=9A

> Hi,
>
> I have just a few nits below plus the points that others made.
>
> Am 22.02.21 um 14:28 schrieb Kevin Tang:
> > Adds drm support for the Unisoc's display subsystem.
> >
> > This is drm kms driver, this driver provides support for the
> > application framework in Android, Yocto and more.
> >
> > Application framework can access Unisoc's display internel
> > peripherals through libdrm or libkms, it's test ok by modetest
> > (DRM/KMS test tool) and Android HWComposer.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> >
> > v4:
> >    - Move the devm_drm_dev_alloc to master_ops->bind function.
> >    - The managed drmm_mode_config_init() it is no longer necessary for
> drivers to explicitly call drm_mode_config_cleanup, so delete it.
> > ---
> >   drivers/gpu/drm/Kconfig         |   2 +
> >   drivers/gpu/drm/Makefile        |   1 +
> >   drivers/gpu/drm/sprd/Kconfig    |  12 ++
> >   drivers/gpu/drm/sprd/Makefile   |   5 +
> >   drivers/gpu/drm/sprd/sprd_drm.c | 217 +++++++++++++++++++++++++++++++=
+
> >   drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
> >   6 files changed, 253 insertions(+)
> >   create mode 100644 drivers/gpu/drm/sprd/Kconfig
> >   create mode 100644 drivers/gpu/drm/sprd/Makefile
> >   create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
> >   create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 8bf103de1..9d6ce2867 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -382,6 +382,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
> >
> >   source "drivers/gpu/drm/xlnx/Kconfig"
> >
> > +source "drivers/gpu/drm/sprd/Kconfig"
> > +
> >   # Keep legacy drivers last
> >
> >   menuconfig DRM_LEGACY
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 02c229392..42d211d9c 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
> >   obj-$(CONFIG_DRM_MCDE) +=3D mcde/
> >   obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
> >   obj-y                       +=3D xlnx/
> > +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> > new file mode 100644
> > index 000000000..6e80cc9f3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -0,0 +1,12 @@
> > +config DRM_SPRD
> > +     tristate "DRM Support for Unisoc SoCs Platform"
> > +     depends on ARCH_SPRD || COMPILE_TEST
> > +     depends on DRM && OF
> > +     select DRM_KMS_HELPER
> > +     select DRM_GEM_CMA_HELPER
> > +     select DRM_KMS_CMA_HELPER
> > +     select DRM_MIPI_DSI
>
> Maybe keep the selects sorted by alphabet to make it more readable.
>
Thks, i will be fix it.

>
> > +     help
> > +       Choose this option if you have a Unisoc chipset.
> > +       If M is selected the module will be called sprd_drm.
> > +
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > new file mode 100644
> > index 000000000..86d95d93a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +subdir-ccflags-y +=3D -I$(srctree)/$(src)
> > +
> > +obj-y :=3D sprd_drm.o
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > new file mode 100644
> > index 000000000..a1d3ed655
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -0,0 +1,217 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
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
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "sprd_drm.h"
> > +
> > +#define DRIVER_NAME  "sprd"
> > +#define DRIVER_DESC  "Spreadtrum SoCs' DRM Driver"
> > +#define DRIVER_DATE  "20200201"
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
> > +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> > +
> > +static struct drm_driver sprd_drm_drv =3D {
> > +     .driver_features        =3D DRIVER_GEM | DRIVER_MODESET |
> DRIVER_ATOMIC,
> > +     .fops                   =3D &sprd_drm_fops,
> > +
> > +     /* GEM Operations */
> > +     DRM_GEM_CMA_DRIVER_OPS,
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
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct drm_device *drm;
> > +     struct sprd_drm *sprd;
> > +     int ret;
> > +
> > +     sprd =3D devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm,
> drm);
> > +     if (IS_ERR(sprd))
> > +             return PTR_ERR(sprd);
> > +
> > +     drm =3D &sprd->drm;
> > +     platform_set_drvdata(pdev, drm);
> > +
> > +     ret =3D drmm_mode_config_init(drm);
> > +     if (ret)
> > +             return ret;
> > +
> > +     sprd_drm_mode_config_init(drm);
> > +
> > +     /* bind and init sub drivers */
> > +     ret =3D component_bind_all(drm->dev, drm);
> > +     if (ret) {
> > +             drm_err(drm, "failed to bind all component.\n");
> > +             return ret;
> > +     }
> > +
> > +     /* vblank init */
> > +     ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +     if (ret) {
> > +             drm_err(drm, "failed to initialize vblank.\n");
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
> > +     ret =3D drm_dev_register(drm, 0);
> > +     if (ret < 0)
> > +             goto err_kms_helper_poll_fini;
> > +
> > +     return 0;
> > +
> > +err_kms_helper_poll_fini:
> > +     drm_kms_helper_poll_fini(drm);
> > +err_unbind_all:
> > +     component_unbind_all(drm->dev, drm);
> > +     return ret;
> > +}
> > +
> > +static void sprd_drm_unbind(struct device *dev)
> > +{
> > +     struct drm_device *drm =3D dev_get_drvdata(dev);
> > +
> > +     drm_dev_unregister(drm);
> > +
> > +     drm_kms_helper_poll_fini(drm);
> > +
> > +     component_unbind_all(drm->dev, drm);
> > +}
> > +
> > +static const struct component_master_ops drm_component_ops =3D {
> > +     .bind =3D sprd_drm_bind,
> > +     .unbind =3D sprd_drm_unbind,
> > +};
> > +
> > +static int compare_of(struct device *dev, void *data)
> > +{
> > +     return dev->of_node =3D=3D data;
> > +}
> > +
> > +static int sprd_drm_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     int ret;
> > +
> > +     ret =3D dma_set_mask_and_coherent(dev, ~0UL);
> > +     if (ret) {
> > +             dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
> ret);
> > +             return ret;
> > +     }
> > +
> > +     return drm_of_component_probe(dev, compare_of, &drm_component_ops=
);
> > +}
> > +
> > +static int sprd_drm_remove(struct platform_device *pdev)
> > +{
> > +     component_master_del(&pdev->dev, &drm_component_ops);
> > +     return 0;
> > +}
> > +
> > +static void sprd_drm_shutdown(struct platform_device *pdev)
> > +{
> > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> > +
> > +     if (!drm) {
> > +             drm_warn(drm, "drm device is not available, no
> shutdown\n");
> > +             return;
> > +     }
> > +
> > +     drm_atomic_helper_shutdown(drm);
> > +}
> > +
> > +static const struct of_device_id drm_match_table[] =3D {
> > +     { .compatible =3D "sprd,display-subsystem", },
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, drm_match_table);
> > +
> > +static struct platform_driver sprd_drm_driver =3D {
> > +     .probe =3D sprd_drm_probe,
> > +     .remove =3D sprd_drm_remove,
> > +     .shutdown =3D sprd_drm_shutdown,
> > +     .driver =3D {
> > +             .name =3D "sprd-drm-drv",
> > +             .of_match_table =3D drm_match_table,
> > +     },
> > +};
> > +
> > +static struct platform_driver *sprd_drm_drivers[]  =3D {
> > +     &sprd_drm_driver,
> > +};
> > +
> > +static int __init sprd_drm_init(void)
> > +{
> > +     int ret;
>
> I think ret should just go away.
>
Like this?
"return platform_register_drivers(sprd_drm_drivers,
ARRAY_SIZE(sprd_drm_drivers));"
if so, i will fix it, thks.

>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> > +
> > +     ret =3D platform_register_drivers(sprd_drm_drivers,
> > +                                     ARRAY_SIZE(sprd_drm_drivers));
> > +     return ret;
> > +}
> > +
> > +static void __exit sprd_drm_exit(void)
> > +{
> > +     platform_unregister_drivers(sprd_drm_drivers,
> > +                                 ARRAY_SIZE(sprd_drm_drivers));
> > +}
> > +
> > +module_init(sprd_drm_init);
> > +module_exit(sprd_drm_exit);
> > +
> > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> > +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> b/drivers/gpu/drm/sprd/sprd_drm.h
> > new file mode 100644
> > index 000000000..9781fd591
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#ifndef _SPRD_DRM_H_
> > +#define _SPRD_DRM_H_
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_print.h>
> > +
> > +struct sprd_drm {
> > +     struct drm_device drm;
> > +};
> > +
> > +#endif /* _SPRD_DRM_H_ */
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

--000000000000e79dd605bf8a7170
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div><span class=3D"gm=
ail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>Firs=
t of all, thanks for comments.</span></span></span> </div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Thomas Zimmermann &lt;<=
a href=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de</a>&gt; =E4=BA=8E=
2021=E5=B9=B44=E6=9C=888=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:21=
=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi,<br>
<br>
I have just a few nits below plus the points that others made.<br>
<br>
Am 22.02.21 um 14:28 schrieb Kevin Tang:<br>
&gt; Adds drm support for the Unisoc&#39;s display subsystem.<br>
&gt; <br>
&gt; This is drm kms driver, this driver provides support for the<br>
&gt; application framework in Android, Yocto and more.<br>
&gt; <br>
&gt; Application framework can access Unisoc&#39;s display internel<br>
&gt; peripherals through libdrm or libkms, it&#39;s test ok by modetest<br>
&gt; (DRM/KMS test tool) and Android HWComposer.<br>
&gt; <br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; v4:<br>
&gt;=C2=A0 =C2=A0 - Move the devm_drm_dev_alloc to master_ops-&gt;bind func=
tion.<br>
&gt;=C2=A0 =C2=A0 - The managed drmm_mode_config_init() it is no longer nec=
essary for drivers to explicitly call drm_mode_config_cleanup, so delete it=
.<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 |=C2=A0 12 ++<br=
>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A05 =
+<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/sprd/sprd_drm.c | 217 ++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/sprd/sprd_drm.h |=C2=A0 16 +++<br>
&gt;=C2=A0 =C2=A06 files changed, 253 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 drivers/gpu/drm/sprd/Kconfig<br>
&gt;=C2=A0 =C2=A0create mode 100644 drivers/gpu/drm/sprd/Makefile<br>
&gt;=C2=A0 =C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig<br>
&gt; index 8bf103de1..9d6ce2867 100644<br>
&gt; --- a/drivers/gpu/drm/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/Kconfig<br>
&gt; @@ -382,6 +382,8 @@ source &quot;drivers/gpu/drm/tidss/Kconfig&quot;<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0source &quot;drivers/gpu/drm/xlnx/Kconfig&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +source &quot;drivers/gpu/drm/sprd/Kconfig&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0# Keep legacy drivers last<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0menuconfig DRM_LEGACY<br>
&gt; diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile<br>
&gt; index 02c229392..42d211d9c 100644<br>
&gt; --- a/drivers/gpu/drm/Makefile<br>
&gt; +++ b/drivers/gpu/drm/Makefile<br>
&gt; @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_DRM_MCDE) +=3D mcde/<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_DRM_TIDSS) +=3D tidss/<br>
&gt;=C2=A0 =C2=A0obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D xlnx/<br>
&gt; +obj-$(CONFIG_DRM_SPRD) +=3D sprd/<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconf=
ig<br>
&gt; new file mode 100644<br>
&gt; index 000000000..6e80cc9f3<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Kconfig<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +config DRM_SPRD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;DRM Support for Unisoc SoCs Platfo=
rm&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_SPRD || COMPILE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on DRM &amp;&amp; OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_GEM_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
<br>
Maybe keep the selects sorted by alphabet to make it more readable.<br></bl=
ockquote><div>Thks, i will be fix it. <br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this option if you have a Unisoc ch=
ipset.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If M is selected the module will be called=
 sprd_drm.<br>
&gt; +<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; new file mode 100644<br>
&gt; index 000000000..86d95d93a<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +subdir-ccflags-y +=3D -I$(srctree)/$(src)<br>
&gt; +<br>
&gt; +obj-y :=3D sprd_drm.o<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a1d3ed655<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -0,0 +1,217 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
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
&gt; +#include &lt;drm/drm_of.h&gt;<br>
&gt; +#include &lt;drm/drm_probe_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_vblank.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +<br>
&gt; +#define DRIVER_NAME=C2=A0 &quot;sprd&quot;<br>
&gt; +#define DRIVER_DESC=C2=A0 &quot;Spreadtrum SoCs&#39; DRM Driver&quot;=
<br>
&gt; +#define DRIVER_DATE=C2=A0 &quot;20200201&quot;<br>
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
&gt; +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);<br>
&gt; +<br>
&gt; +static struct drm_driver sprd_drm_drv =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D D=
RIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;sprd_drm_fops,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* GEM Operations */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_GEM_CMA_DRIVER_OPS,<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd =3D devm_drm_dev_alloc(dev, &amp;sprd_drm_dr=
v, struct sprd_drm, drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(sprd))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sprd);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm =3D &amp;sprd-&gt;drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drmm_mode_config_init(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D component_bind_all(drm-&gt;dev, drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to bind all component.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* vblank init */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_vblank_init(drm, drm-&gt;mode_config.=
num_crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to initialize vblank.\n&quot;);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_dev_register(drm, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kms_helper_p=
oll_fini;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_kms_helper_poll_fini:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
&gt; +err_unbind_all:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_unbind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dev_get_drvdata(dev);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dev_unregister(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_master_ops drm_component_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bind =3D sprd_drm_bind,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_drm_unbind,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int compare_of(struct device *dev, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return dev-&gt;of_node =3D=3D data;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_set_mask_and_coherent(dev, ~0UL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;dm=
a_set_mask_and_coherent failed (%d)\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return drm_of_component_probe(dev, compare_of, &a=
mp;drm_component_ops);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_master_del(&amp;pdev-&gt;dev, &amp;drm_=
component_ops);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_shutdown(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D platform_get_drvdata(p=
dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!drm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_warn(drm, &quot;d=
rm device is not available, no shutdown\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_atomic_helper_shutdown(drm);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id drm_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sprd,display-subsystem&qu=
ot;, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ },<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, drm_match_table);<br>
&gt; +<br>
&gt; +static struct platform_driver sprd_drm_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D sprd_drm_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D sprd_drm_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.shutdown =3D sprd_drm_shutdown,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;sprd-=
drm-drv&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D d=
rm_match_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct platform_driver *sprd_drm_drivers[]=C2=A0 =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;sprd_drm_driver,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init sprd_drm_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
I think ret should just go away.<br></blockquote><div>Like this?<br></div><=
div>&quot;return platform_register_drivers(sprd_drm_drivers, ARRAY_SIZE(spr=
d_drm_drivers));&quot;</div><div>if so, i will fix it, thks.<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Acked-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" targ=
et=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D platform_register_drivers(sprd_drm_driver=
s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(s=
prd_drm_drivers));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void __exit sprd_drm_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_unregister_drivers(sprd_drm_drivers,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(sprd_drm_driver=
s));<br>
&gt; +}<br>
&gt; +<br>
&gt; +module_init(sprd_drm_init);<br>
&gt; +module_exit(sprd_drm_exit);<br>
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
&gt; index 000000000..9781fd591<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _SPRD_DRM_H_<br>
&gt; +#define _SPRD_DRM_H_<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic.h&gt;<br>
&gt; +#include &lt;drm/drm_print.h&gt;<br>
&gt; +<br>
&gt; +struct sprd_drm {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device drm;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#endif /* _SPRD_DRM_H_ */<br>
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

--000000000000e79dd605bf8a7170--

--===============0906911133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0906911133==--
