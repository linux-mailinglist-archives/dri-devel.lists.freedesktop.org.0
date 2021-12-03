Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADFF46737F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 09:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0341573865;
	Fri,  3 Dec 2021 08:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A426673863
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 08:49:58 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id j18so4728065ljc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 00:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=35HSSEgkXCQFPppXgt8oqO9yL05sxvv0jHMDfvratIc=;
 b=PHjbhibd75vr/zky9pG5iV8cYKuosCSsQul8nDC8IpoVL7lAkhEQ8X5azaGd6j5Izj
 ZlpOo3OcBRZBUf9jNUQepS1vnAxkkx9MMZ9SO2f9A32uldSNfCaIGqcXCJ84RgQ/LY4M
 7RCKoZrFFQli5nVf5G0M5IMcE7ZV4R252Pf85nKYeiu+gqea3N8OKy2tWEB+J1JrHaxY
 cQjtv6FCoj/3bd5ynVvQR/TEPmtRaSDMoaQcgIuhZquZDtmdU9Ou7EJ8+KoWy1UMMt6x
 Dfe4a3okT2B6UmBtKeu07SoeClGab72pKMPG3DtL2cAQPNJco9vhCjUdouJ3N7WoQj5Q
 Di5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=35HSSEgkXCQFPppXgt8oqO9yL05sxvv0jHMDfvratIc=;
 b=1Oh6J78P3ilaEGhbEYg8niOOhvf2yktnUbKUTyZCFv1vZoTO/W1KWmD2W3F3uC/epA
 cCMXcoY2lJDmUFlaAaRlxxVh5raf7pwoC2Fev8IP7v40AV3O/VBjsrqPCEBW5oC0ZAj0
 oyQYLfBX+SncyYQ2YvVLIZfSukQAzuFCpDPXexJeyptXfZMfKPkgzvnrL3BQsgw6bYI/
 tsKa6H/D0OTZLLNTuMcxGPC2s1MXFT6H81Bd62s3ywvSEwugot+t8pmNS+TICpLN9qRZ
 7796fVH4xFi2Z98r7/4ElD1ZebQkzdrV8O3Ro8z6Ho0dNDw2k++cBx/DviUrQMnpHnBT
 TQig==
X-Gm-Message-State: AOAM531g4DOxWlc9eQ0k0PKJIGwOFd/FRWxqP1yGGHKMhCKSiXpNMm9A
 ZzzoTGAYJfKtOSYLqg5X5q75l0Q7tGW5WL/irTM=
X-Google-Smtp-Source: ABdhPJwMSRk9egzsEPw49DCDT1DdbW9rWlX8dVWaYENjtoX4J4c9hKPmYn68q5tizFI6DcQ2u5ysP0i7WtqBnBv1gvU=
X-Received: by 2002:a05:651c:549:: with SMTP id
 q9mr17322148ljp.25.1638521396864; 
 Fri, 03 Dec 2021 00:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20211025093418.20545-1-kevin3.tang@gmail.com>
 <20211025093418.20545-3-kevin3.tang@gmail.com>
 <cc2c3e2c-6993-b742-53d6-c6078a3ced09@linux.intel.com>
In-Reply-To: <cc2c3e2c-6993-b742-53d6-c6078a3ced09@linux.intel.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Fri, 3 Dec 2021 16:47:00 +0800
Message-ID: <CAFPSGXagHcf6BGn8SmrxXZF-8o4i+aFw1gfswPC2ycvk_HMCsQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] drm/sprd: add Unisoc's drm kms master
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 pony1.wu@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com, orsonzhai@gmail.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maarten Lankhorst <maarten.lankhorst@linux.intel.com> =E4=BA=8E2021=E5=B9=
=B411=E6=9C=8826=E6=97=A5=E5=91=A8=E4=BA=94 22:03=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On 25-10-2021 11:34, Kevin Tang wrote:
> > Adds drm support for the Unisoc's display subsystem.
> >
> > This is drm kms driver, this driver provides support for the
> > application framework in Android, Yocto and more.
> >
> > Application framework can access Unisoc's display internal
> > peripherals through libdrm or libkms, it's test ok by modetest
> > (DRM/KMS test tool) and Android HWComposer.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> >
> > v4:
> >   - Move the devm_drm_dev_alloc to master_ops->bind function.
> >   - The managed drmm_mode_config_init() it is no longer necessary for d=
rivers to explicitly call drm_mode_config_cleanup, so delete it.
> >
> > v5:
> >   - Remove subdir-ccflgas-y for Makefile.
> >   - Keep the selects sorted by alphabet for Kconfig.
> > ---
> >  drivers/gpu/drm/Kconfig         |   2 +
> >  drivers/gpu/drm/Makefile        |   1 +
> >  drivers/gpu/drm/sprd/Kconfig    |  11 ++
> >  drivers/gpu/drm/sprd/Makefile   |   3 +
> >  drivers/gpu/drm/sprd/sprd_drm.c | 203 ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
> >  6 files changed, 236 insertions(+)
> >  create mode 100644 drivers/gpu/drm/sprd/Kconfig
> >  create mode 100644 drivers/gpu/drm/sprd/Makefile
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 2a926d0de..8220be1b5 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -380,6 +380,8 @@ source "drivers/gpu/drm/xlnx/Kconfig"
> >
> >  source "drivers/gpu/drm/gud/Kconfig"
> >
> > +source "drivers/gpu/drm/sprd/Kconfig"
> > +
> >  config DRM_HYPERV
> >       tristate "DRM Support for Hyper-V synthetic video device"
> >       depends on DRM && PCI && MMU && HYPERV
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 0dff40bb8..ec2756806 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -127,3 +127,4 @@ obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
> >  obj-y                        +=3D xlnx/
> >  obj-y                        +=3D gud/
> >  obj-$(CONFIG_DRM_HYPERV) +=3D hyperv/
> > +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> > new file mode 100644
> > index 000000000..726c3e76d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -0,0 +1,11 @@
> > +config DRM_SPRD
> > +     tristate "DRM Support for Unisoc SoCs Platform"
> > +     depends on ARCH_SPRD || COMPILE_TEST
> > +     depends on DRM && OF
> > +     select DRM_GEM_CMA_HELPER
> > +     select DRM_KMS_CMA_HELPER
> > +     select DRM_KMS_HELPER
> > +     help
> > +       Choose this option if you have a Unisoc chipset.
> > +       If M is selected the module will be called sprd_drm.
> > +
> > diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makef=
ile
> > new file mode 100644
> > index 000000000..9850f00b8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-y :=3D sprd_drm.o
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/spr=
d_drm.c
> > new file mode 100644
> > index 000000000..bb87f28f2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -0,0 +1,203 @@
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
> > +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_=
helper =3D {
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
> > +     .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_=
ATOMIC,
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
> > +     sprd =3D devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm, =
drm);
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
> > +     return drm_of_component_probe(&pdev->dev, compare_of, &drm_compon=
ent_ops);
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
> > +             drm_warn(drm, "drm device is not available, no shutdown\n=
");
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
> > +     return platform_register_drivers(sprd_drm_drivers,
> > +                                     ARRAY_SIZE(sprd_drm_drivers));
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
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/spr=
d_drm.h
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
>
> I've seen this in the patch adding sprd_plane too, are you planning to ex=
tend both structs?
>
> ~Maarten
>
Hi Maarten,
Yes, after the basic version is merged, we will continue to expand
these two structures
