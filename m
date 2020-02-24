Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253E16ABDB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 17:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44F6E5B0;
	Mon, 24 Feb 2020 16:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A526E5B0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 16:43:28 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id y3so3447745uae.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 08:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x3iMdgcJvhdPaNdsBIZMg+A92EcAUzwpTpA940qYnKo=;
 b=lruTX+YqdxxtwSJdiuUeSP9//uqvNR8HQ6aMPj8TaZ2lyJWECp2EhvRoFkT2hrU7Wj
 hqV4iCJgs9dIgmUp1T75c0QOD/GDNuhNNo2nF+yd2RHGFQyTOwZoYMkIzK3v/yrWvUmN
 a6p1MAIljW3JVw+c4ZGkDn50r7nbRrQbtQTSEyzfeKMfu988yr+Al3VmOTG2bGlR1/hv
 d7hTIOTEMejBSj49OcBJenumu5HOUP5cjxT+pJxgNhbrg34QdUdilKSLg/o4xRTrIIow
 IPEyCyxyuZahW13WboKhz4lMKzJygpMmWT8EdrUaIxwzDW3gfPm0XFppTgRad/L95eYu
 +kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x3iMdgcJvhdPaNdsBIZMg+A92EcAUzwpTpA940qYnKo=;
 b=ctP859tS186y2ePHzRlpQwcEcebRHec6A9yxfvEygUKiReCheGLJCg394xh4Si1cmA
 scGAcuOSqB9NqOmgZKlW6nRTQO+zrSlEA0l90Cv+ntzBQ8EH/A6cOAmlVYOhbp5ID4BD
 FaQRUSxpShgWZ7GTixkRRdgfhhWoSKVGzQ0A3MFGdSiTVUjEqr5UDBzlp185Ig19aiLj
 XchIiGVnMaRWI3aqJ/uHD+Q4D8OErHTHMKUGE17ajppRusZyQzEcVPMRrJrJ5G/KbpfR
 L0Ewp/KA1DjDPzTKe+RoeAUkBrOFMdJKAg5B4NK7/G4ip3TMYWFha/YUlrQBEPHMnBDe
 qfqA==
X-Gm-Message-State: APjAAAVh3DhDSmJ0GIviazr+a/q3oBxjtS8uc5cP3TGPCJti7hrT+tQQ
 E3ZHrghZEL7xswnIcOLmwrnYiBo8ElTzb5KjCtg=
X-Google-Smtp-Source: APXvYqzuEHPbJyvf7Zomfe2zD858nZ57HHaM8XAcCazN86Cg76mKsOnwz+E+VVGEHB3mcMPwIQ+JMm6UZp2wFk2Hf2o=
X-Received: by 2002:ab0:66d4:: with SMTP id d20mr24839010uaq.64.1582562607061; 
 Mon, 24 Feb 2020 08:43:27 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 24 Feb 2020 16:43:08 +0000
Message-ID: <CACvgo53vUwt2vrcFTYGQCx30pQ1+FsxsAX7OOC9J7YfgQz2Qfg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 Dave Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Fri, 21 Feb 2020 at 11:15, Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> From: Kevin Tang <kevin.tang@unisoc.com>
>
> Adds drm support for the Unisoc's display subsystem.
>
> This is drm device and gem driver. This driver provides support for the
> Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/sprd/Kconfig    |  14 ++
>  drivers/gpu/drm/sprd/Makefile   |   7 +
>  drivers/gpu/drm/sprd/sprd_drm.c | 292 ++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
>  6 files changed, 332 insertions(+)
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index bfdadc3..cead12c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
>
>  source "drivers/gpu/drm/mcde/Kconfig"
>
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
>
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 9f1c7c4..85ca211 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  += lima/
>  obj-$(CONFIG_DRM_PANFROST) += panfrost/
>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
> +obj-$(CONFIG_DRM_SPRD) += sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 0000000..79f286b
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,14 @@
> +config DRM_SPRD
> +       tristate "DRM Support for Unisoc SoCs Platform"
> +       depends on ARCH_SPRD
> +       depends on DRM && OF
> +       select DRM_KMS_HELPER
> +       select DRM_GEM_CMA_HELPER
> +       select DRM_KMS_CMA_HELPER
> +       select DRM_MIPI_DSI
> +       select DRM_PANEL
> +       select VIDEOMODE_HELPERS
> +       select BACKLIGHT_CLASS_DEVICE
> +       help
> +         Choose this option if you have a Unisoc chipsets.
> +         If M is selected the module will be called sprd-drm.
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> new file mode 100644
> index 0000000..63b8751
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ccflags-y += -Iinclude/drm
> +
> +subdir-ccflags-y += -I$(src)
> +
> +obj-y := sprd_drm.o
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
> new file mode 100644
> index 0000000..7cac098
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "sprd_drm.h"
> +
> +#define DRIVER_NAME    "sprd"
> +#define DRIVER_DESC    "Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE    "20191101"
> +#define DRIVER_MAJOR   1
> +#define DRIVER_MINOR   0
> +
> +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_helper = {
> +       .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs = {
> +       .fb_create = drm_gem_fb_create,
> +       .atomic_check = drm_atomic_helper_check,
> +       .atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static void sprd_drm_mode_config_init(struct drm_device *drm)
> +{
> +       drm_mode_config_init(drm);
> +
> +       drm->mode_config.min_width = 0;
> +       drm->mode_config.min_height = 0;
> +       drm->mode_config.max_width = 8192;
> +       drm->mode_config.max_height = 8192;
> +       drm->mode_config.allow_fb_modifiers = true;
> +
> +       drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
> +       drm->mode_config.helper_private = &sprd_drm_mode_config_helper;
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> +
> +static struct drm_driver sprd_drm_drv = {
> +       .driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +       .fops                   = &sprd_drm_fops,
> +
> +       /* GEM Operations */
> +       DRM_GEM_CMA_VMAP_DRIVER_OPS,
> +
> +       .name                   = DRIVER_NAME,
> +       .desc                   = DRIVER_DESC,
> +       .date                   = DRIVER_DATE,
> +       .major                  = DRIVER_MAJOR,
> +       .minor                  = DRIVER_MINOR,
> +};
> +
> +static int sprd_drm_bind(struct device *dev)
> +{
> +       struct drm_device *drm;
> +       struct sprd_drm *sprd;
> +       int err;
> +
> +       drm = drm_dev_alloc(&sprd_drm_drv, dev);
> +       if (IS_ERR(drm))
> +               return PTR_ERR(drm);
> +
> +       dev_set_drvdata(dev, drm);
> +
> +       sprd = devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> +       if (!sprd) {
> +               err = -ENOMEM;
> +               goto err_free_drm;
> +       }
> +       drm->dev_private = sprd;
> +
> +       sprd_drm_mode_config_init(drm);
> +
> +       /* bind and init sub drivers */
> +       err = component_bind_all(drm->dev, drm);
> +       if (err) {
> +               DRM_ERROR("failed to bind all component.\n");
> +               goto err_dc_cleanup;
> +       }
> +
> +       /* vblank init */
> +       err = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +       if (err) {
> +               DRM_ERROR("failed to initialize vblank.\n");
> +               goto err_unbind_all;
> +       }
> +       /* with irq_enabled = true, we can use the vblank feature. */
> +       drm->irq_enabled = true;
> +
> +       /* reset all the states of crtc/plane/encoder/connector */
> +       drm_mode_config_reset(drm);
> +
> +       /* init kms poll for handling hpd */
> +       drm_kms_helper_poll_init(drm);
> +
> +       err = drm_dev_register(drm, 0);
> +       if (err < 0)
> +               goto err_kms_helper_poll_fini;
> +
> +       return 0;
> +
> +err_kms_helper_poll_fini:
> +       drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +       component_unbind_all(drm->dev, drm);
> +err_dc_cleanup:
> +       drm_mode_config_cleanup(drm);
> +err_free_drm:
> +       drm_dev_put(drm);
> +       return err;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +       drm_put_dev(dev_get_drvdata(dev));
> +}
> +
> +static const struct component_master_ops drm_component_ops = {
> +       .bind = sprd_drm_bind,
> +       .unbind = sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +       struct device_node *np = data;
> +
> +       DRM_DEBUG("compare %s\n", np->full_name);
> +
> +       return dev->of_node == np;
> +}
> +
> +static int sprd_drm_component_probe(struct device *dev,
> +                          const struct component_master_ops *m_ops)
> +{
> +       struct device_node *ep, *port, *remote;
> +       struct component_match *match = NULL;
> +       int i;
> +
> +       if (!dev->of_node)
> +               return -EINVAL;
> +
> +       /*
> +        * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
> +        * called from encoder's .bind callbacks works as expected
> +        */
> +       for (i = 0; ; i++) {
> +               port = of_parse_phandle(dev->of_node, "ports", i);
> +               if (!port)
> +                       break;
> +
> +               if (!of_device_is_available(port->parent)) {
> +                       of_node_put(port);
> +                       continue;
> +               }
> +
> +               component_match_add(dev, &match, compare_of, port->parent);
> +               of_node_put(port);
> +       }
> +
> +       if (i == 0) {
> +               dev_err(dev, "missing 'ports' property\n");
> +               return -ENODEV;
> +       }
> +
> +       if (!match) {
> +               dev_err(dev, "no available port\n");
> +               return -ENODEV;
> +       }
> +
> +       /*
> +        * For bound crtcs, bind the encoders attached to their remote endpoint
> +        */
> +       for (i = 0; ; i++) {
> +               port = of_parse_phandle(dev->of_node, "ports", i);
> +               if (!port)
> +                       break;
> +
> +               if (!of_device_is_available(port->parent)) {
> +                       of_node_put(port);
> +                       continue;
> +               }
> +
> +               for_each_child_of_node(port, ep) {
> +                       remote = of_graph_get_remote_port_parent(ep);
> +                       if (!remote || !of_device_is_available(remote)) {
> +                               of_node_put(remote);
> +                               continue;
> +                       } else if (!of_device_is_available(remote->parent)) {
> +                               dev_warn(dev, "parent device of %s is not available\n",
> +                                        remote->full_name);
> +                               of_node_put(remote);
> +                               continue;
> +                       }
> +
> +                       component_match_add(dev, &match, compare_of, remote);
> +                       of_node_put(remote);
> +               }
> +               of_node_put(port);
> +       }
> +
> +       return component_master_add_with_match(dev, m_ops, match);

This whole function is effectively a copy of drm_of_component_probe().
Reuse that instead.

With that + comments from Sam addressed this patch is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
