Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE916A1F6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC976E28B;
	Mon, 24 Feb 2020 09:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1ED6E907
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 17:07:08 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id p34so3670676qtb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QGhKTapoXmnWYbRHpDN5kB3fVSi3U6LUMdL3R9Igtyo=;
 b=pF4dKPVHzkv1qVD/pKFuRO0hfsycgyybu3yuFMzUoO6UovFce0ugY80fPV90DUOCij
 oXF3wqnb2PY9aKgx+7+//CekR9TyTkIffZAhPoISgvWGVH2+EtzVIVmF7S9ZsL3/zFmY
 zu+XGhgQgBJIoHuugllIpzWg5A6JXM8pb7keRXhJuJp3ikquFDCjPLW0GqLbarf0q1vU
 5LBQso4h2RpgH1STlELx2UPeK/FMqMNsgcfluG6A6zWTrmRHmpIpxkRIlg7Lghbf0Why
 0exZcJVA8JeL2W5e8ndm9T3j+XAYby3TqVIK3T4SomwRNK+t9dvXO1/0fUPqcJVJGI/S
 Leww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGhKTapoXmnWYbRHpDN5kB3fVSi3U6LUMdL3R9Igtyo=;
 b=MBsAyTdl/dfeKmSHdHikSe3pfyO4gHDpP417dLZYrHL1BoilV7px1VaEC6AML9EH1T
 oPYCb5kc9my6vn90gDdAKfXqaeyvmv6piobrwKO0Uj2KAgofWn6oAundCAhh5MWsr+eb
 3fTmLP4vp/AtIS0kkld00PIfiaSZ5CM8Tm9wnfhe8lw2pgcaboKX2kYNej5uvWfKEYwA
 pIDtNENqqF2WrJnWWqD5C5e4js5K9+VpPqFd8GaMDgD5DETokncymJ+WSaXyC41Gj67x
 QSt0JWvLr70GWAnYvxVqtZSPpLATvvr72Zz31RNBjvz7ZAPjVe0KAytxBbc8EdN7NAZb
 6AYw==
X-Gm-Message-State: APjAAAV1FkNBM9zkvevFCZpN/d96R8emD80j3haMF0AAbozDIe8HKX34
 7oOGQQcQJjk2CeZJK1YNJZcCwv8AT5rGO1oG9po=
X-Google-Smtp-Source: APXvYqxGFsuBh63dV75vXQhF+kMRBcC9gZcZBF6X1JSgJZlnWtL9bRNxElAvgstMYKf5Nv2PatFotfsoLuPOEweRXBI=
X-Received: by 2002:ac8:835:: with SMTP id u50mr38607975qth.15.1582391227613; 
 Sat, 22 Feb 2020 09:07:07 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
 <20200221213652.GD3456@ravnborg.org>
In-Reply-To: <20200221213652.GD3456@ravnborg.org>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Sun, 23 Feb 2020 01:06:56 +0800
Message-ID: <CAFPSGXacMKTPrxk_FOrwrvH_XfmO3dYCCa_GoPCe_HUfQFPHtw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============0121155226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0121155226==
Content-Type: multipart/alternative; boundary="0000000000000484ac059f2d2b11"

--0000000000000484ac059f2d2b11
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 22, 2020 at 5:36 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Kevin.
>
> On Fri, Feb 21, 2020 at 03:48:52PM +0800, Kevin Tang wrote:
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > Adds drm support for the Unisoc's display subsystem.
>
> Thanks for the updated driver patch.
> Good split of patches.
> A few comments in the following.
> Please filter in the comments as some may not apply to this driver.
>
>         Sam
>
> >
> > This is drm device and gem driver. This driver provides support for the
> > Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> Hmm, hopefully we can use this without XFree86?
> Looks like the above was copied from something outdated.
>
Yes, copy from drm/Kconfig, but we have tested ok on android hwcomposer.
It is indeed copied from outdated content, need to fix it?

>
>
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
>
> Please check that VIDEOMODE_HELPERS is really needed.
> Please add COMPILE_TEST - so we will build this driver with
> allmodconfig/allyesconfig.
> This is how we ofthe verify refactoring work.
>
Ok, i will fix it.

>
>
> > \ No newline at end of file
> Please fix.
>
>
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > new file mode 100644
> > index 0000000..63b8751
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +ccflags-y += -Iinclude/drm
> Not required - delete.
>
Ok, this can be delete, thanks for reminding.

>
> > +
> > +subdir-ccflags-y += -I$(src)
> Not required - delete.
>
This maybe can't, because our dpu subdir need it to found parent dir header
file.

> > +
> > +obj-y := sprd_drm.o
>
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > new file mode 100644
> > index 0000000..7cac098
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -0,0 +1,292 @@
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
> > +
> > +#define DRIVER_NAME  "sprd"
> > +#define DRIVER_DESC  "Spreadtrum SoCs' DRM Driver"
> > +#define DRIVER_DATE  "20191101"
> We are in 2020 now..
>
> > +#define DRIVER_MAJOR 1
> > +#define DRIVER_MINOR 0
> > +
> > +static const struct drm_mode_config_helper_funcs
> sprd_drm_mode_config_helper = {
> > +     .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> > +};
> > +
> > +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs = {
> > +     .fb_create = drm_gem_fb_create,
> > +     .atomic_check = drm_atomic_helper_check,
> > +     .atomic_commit = drm_atomic_helper_commit,
> > +};
> > +
> > +static void sprd_drm_mode_config_init(struct drm_device *drm)
> > +{
> > +     drm_mode_config_init(drm);
> > +
> > +     drm->mode_config.min_width = 0;
> > +     drm->mode_config.min_height = 0;
> > +     drm->mode_config.max_width = 8192;
> > +     drm->mode_config.max_height = 8192;
> > +     drm->mode_config.allow_fb_modifiers = true;
> > +
> > +     drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
> > +     drm->mode_config.helper_private = &sprd_drm_mode_config_helper;
> > +}
> > +
> > +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> > +
> > +static struct drm_driver sprd_drm_drv = {
> > +     .driver_features        = DRIVER_GEM | DRIVER_MODESET |
> DRIVER_ATOMIC,
> > +     .fops                   = &sprd_drm_fops,
> > +
> > +     /* GEM Operations */
> > +     DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +
> > +     .name                   = DRIVER_NAME,
> > +     .desc                   = DRIVER_DESC,
> > +     .date                   = DRIVER_DATE,
> > +     .major                  = DRIVER_MAJOR,
> > +     .minor                  = DRIVER_MINOR,
> > +};
> > +
> > +static int sprd_drm_bind(struct device *dev)
> > +{
> > +     struct drm_device *drm;
> > +     struct sprd_drm *sprd;
> > +     int err;
> > +
> > +     drm = drm_dev_alloc(&sprd_drm_drv, dev);
> > +     if (IS_ERR(drm))
> > +             return PTR_ERR(drm);
> You should embed drm_device in struct sprd_drm.
> See example code in drm/drm_drv.c
>
> This is what modern drm drivers do.
>
> I *think* you can drop the component framework if you do this.
>
I have read it(drm/drm_drv.c) carefully, if drop the component framework,
the whole our drm driver maybe need to redesign, so i still want to keep
current design.

>
> > +
> > +     dev_set_drvdata(dev, drm);
> > +
> > +     sprd = devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> > +     if (!sprd) {
> > +             err = -ENOMEM;
> > +             goto err_free_drm;
> > +     }
> > +     drm->dev_private = sprd;
> > +
> > +     sprd_drm_mode_config_init(drm);
> > +
> > +     /* bind and init sub drivers */
> > +     err = component_bind_all(drm->dev, drm);
> > +     if (err) {
> > +             DRM_ERROR("failed to bind all component.\n");
> > +             goto err_dc_cleanup;
> > +     }
> When you have a drm_device - which you do here.
> Then please use drm_err() and friends for error messages.
> Please verify all uses of DRM_XXX
>
  modern drm drivers need drm_xxx to replace DRM_XXX?

>
> > +
> > +     /* vblank init */
> > +     err = drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +     if (err) {
> > +             DRM_ERROR("failed to initialize vblank.\n");
> > +             goto err_unbind_all;
> > +     }
>
>
> > +     /* with irq_enabled = true, we can use the vblank feature. */
> > +     drm->irq_enabled = true;
> I cannot see any irq being installed. This looks wrong.
>
Our display controller isr is been register on crtc driver(sprd_dpu.c), not
here.

>
> > +
> > +     /* reset all the states of crtc/plane/encoder/connector */
> > +     drm_mode_config_reset(drm);
> > +
> > +     /* init kms poll for handling hpd */
> > +     drm_kms_helper_poll_init(drm);
> > +
> > +     err = drm_dev_register(drm, 0);
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
> Please see the example in drm/drm_drv.c - following the example
> will simpligy error handling a bit.
> Ad you will learn not to use drm_dev_put().
>
Ok, i will fix it

>
> > +}
> > +
> > +static void sprd_drm_unbind(struct device *dev)
> > +{
> > +     drm_put_dev(dev_get_drvdata(dev));
> > +}
> > +
> > +static const struct component_master_ops drm_component_ops = {
> > +     .bind = sprd_drm_bind,
> > +     .unbind = sprd_drm_unbind,
> > +};
> > +
> > +static int compare_of(struct device *dev, void *data)
> > +{
> > +     struct device_node *np = data;
> > +
> > +     DRM_DEBUG("compare %s\n", np->full_name);
> Leftover debugging that can be dropped?
>
Ok, i will drop useless debug log.

>
> > +
> > +     return dev->of_node == np;
> > +}
> > +
> > +static int sprd_drm_component_probe(struct device *dev,
> > +                        const struct component_master_ops *m_ops)
> > +{
> > +     struct device_node *ep, *port, *remote;
> > +     struct component_match *match = NULL;
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
> > +     for (i = 0; ; i++) {
> > +             port = of_parse_phandle(dev->of_node, "ports", i);
> > +             if (!port)
> > +                     break;
> > +
> > +             if (!of_device_is_available(port->parent)) {
> > +                     of_node_put(port);
> > +                     continue;
> > +             }
> > +
> > +             component_match_add(dev, &match, compare_of, port->parent);
> > +             of_node_put(port);
> > +     }
> > +
> > +     if (i == 0) {
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
> > +     for (i = 0; ; i++) {
> > +             port = of_parse_phandle(dev->of_node, "ports", i);
> > +             if (!port)
> > +                     break;
> > +
> > +             if (!of_device_is_available(port->parent)) {
> > +                     of_node_put(port);
> > +                     continue;
> > +             }
> > +
> > +             for_each_child_of_node(port, ep) {
> > +                     remote = of_graph_get_remote_port_parent(ep);
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
> > +     ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
> I do not thing ~0 is always the right mask.
> Please verify.
>
It's right mask for us.

>
> > +     if (ret) {
> > +             DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return sprd_drm_component_probe(&pdev->dev, &drm_component_ops);
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
> > +     struct drm_device *drm = platform_get_drvdata(pdev);
> > +
> > +     if (!drm) {
> > +             DRM_WARN("drm device is not available, no shutdown\n");
> > +             return;
> > +     }
> > +
> > +     drm_atomic_helper_shutdown(drm);
> > +}
> > +
> > +static const struct of_device_id drm_match_table[] = {
> > +     { .compatible = "sprd,display-subsystem", },
> > +     {},
>
> Sometimes we use { /* sentinel */ },
> here.
>
Ok, i will fix it

>
> > +};
> > +MODULE_DEVICE_TABLE(of, drm_match_table);
> > +
> > +static struct platform_driver sprd_drm_driver = {
> > +     .probe = sprd_drm_probe,
> > +     .remove = sprd_drm_remove,
> > +     .shutdown = sprd_drm_shutdown,
> > +     .driver = {
> > +             .name = "sprd-drm-drv",
> > +             .of_match_table = drm_match_table,
> > +     },
> > +};
> > +
> > +static struct platform_driver *sprd_drm_drivers[]  = {
> > +     &sprd_drm_driver,
> > +};
> > +
> > +static int __init sprd_drm_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret = platform_register_drivers(sprd_drm_drivers,
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
> > index 0000000..137cb27
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> > @@ -0,0 +1,16 @@
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
> > +};
> > +
> > +#endif /* _SPRD_DRM_H_ */
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--0000000000000484ac059f2d2b11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 22, 2020 at 5:36 AM Sam R=
avnborg &lt;<a href=3D"mailto:sam@ravnborg.org">sam@ravnborg.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Kevin.<b=
r>
<br>
On Fri, Feb 21, 2020 at 03:48:52PM +0800, Kevin Tang wrote:<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; Adds drm support for the Unisoc&#39;s display subsystem.<br>
<br>
Thanks for the updated driver patch.<br>
Good split of patches.<br>
A few comments in the following.<br>
Please filter in the comments as some may not apply to this driver.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
&gt; <br>
&gt; This is drm device and gem driver. This driver provides support for th=
e<br>
&gt; Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.<br>
Hmm, hopefully we can use this without XFree86?<br>
Looks like the above was copied from something outdated.<br></blockquote><d=
iv>Yes, copy from drm/Kconfig, but we have tested ok on android hwcomposer.=
</div><div>It is indeed copied from outdated content, need to fix it?<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
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
<br>
Please check that VIDEOMODE_HELPERS is really needed.<br>
Please add COMPILE_TEST - so we will build this driver with<br>
allmodconfig/allyesconfig.<br>
This is how we ofthe verify refactoring work.<br></blockquote><div>Ok, i wi=
ll fix it.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; \ No newline at end of file<br>
Please fix.<br>
<br>
<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; new file mode 100644<br>
&gt; index 0000000..63b8751<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +ccflags-y +=3D -Iinclude/drm<br>
Not required - delete.<br></blockquote><div>Ok, this can be delete,=C2=A0th=
anks for reminding.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; +<br>
&gt; +subdir-ccflags-y +=3D -I$(src)<br>
Not required - delete.<br></blockquote><div>This maybe can&#39;t, because o=
ur dpu subdir need it to found parent dir header file.=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +obj-y :=3D sprd_drm.o<br>
<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..7cac098<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -0,0 +1,292 @@<br>
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
&gt; +<br>
&gt; +#define DRIVER_NAME=C2=A0 &quot;sprd&quot;<br>
&gt; +#define DRIVER_DESC=C2=A0 &quot;Spreadtrum SoCs&#39; DRM Driver&quot;=
<br>
&gt; +#define DRIVER_DATE=C2=A0 &quot;20191101&quot;<br>
We are in 2020 now..<br>
<br>
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
&gt; +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);<br>
&gt; +<br>
&gt; +static struct drm_driver sprd_drm_drv =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D D=
RIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;sprd_drm_fops,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* GEM Operations */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_GEM_CMA_VMAP_DRIVER_OPS,<br>
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
You should embed drm_device in struct sprd_drm.<br>
See example code in drm/drm_drv.c<br>
<br>
This is what modern drm drivers do.<br>
<br>
I *think* you can drop the component framework if you do this.<br></blockqu=
ote><div>I have read it(drm/drm_drv.c) carefully, if drop the component fra=
mework,</div><div>the whole our drm driver maybe need to redesign, so i sti=
ll want to keep current design.</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
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
When you have a drm_device - which you do here.<br>
Then please use drm_err() and friends for error messages.<br>
Please verify all uses of DRM_XXX<br></blockquote><div>=C2=A0

modern drm drivers need drm_xxx to replace DRM_XXX?</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
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
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can use the vbla=
nk feature. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;irq_enabled =3D true;<br>
I cannot see any irq being installed. This looks wrong.<br></blockquote><di=
v>Our display controller isr is been register on crtc driver(sprd_dpu.c), n=
ot here.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
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
Please see the example in drm/drm_drv.c - following the example<br>
will simpligy error handling a bit.<br>
Ad you will learn not to use drm_dev_put().<br></blockquote><div>Ok, i will=
 fix it=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_unbind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_put_dev(dev_get_drvdata(dev));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_master_ops drm_component_ops =3D {<br>
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
Leftover debugging that can be dropped?<br></blockquote><div>Ok, i will dro=
p useless debug log.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
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
I do not thing ~0 is always the right mask.<br>
Please verify.<br></blockquote><div>It&#39;s right mask for us.</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;dma_s=
et_mask_and_coherent failed (%d)\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprd_drm_component_probe(&amp;pdev-&gt;dev=
, &amp;drm_component_ops);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_WARN(&quot;drm de=
vice is not available, no shutdown\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_atomic_helper_shutdown(drm);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id drm_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sprd,display-subsystem&qu=
ot;, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{},<br>
<br>
Sometimes we use { /* sentinel */ },<br>
here.<br></blockquote><div>Ok, i will fix it=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
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
&gt; index 0000000..137cb27<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; @@ -0,0 +1,16 @@<br>
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
&gt; +};<br>
&gt; +<br>
&gt; +#endif /* _SPRD_DRM_H_ */<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div></div>

--0000000000000484ac059f2d2b11--

--===============0121155226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0121155226==--
