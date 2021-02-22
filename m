Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E337322217
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 23:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039FE89E38;
	Mon, 22 Feb 2021 22:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAE689CDF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 20:55:25 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id t9so371842pjl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJETbVE8VzipqAaEDSc5PHArxRcbjRLrf36cxIZV5KY=;
 b=Mytkepnb9mY7KE9xcCmnlz+oFEaeZdNx2MOrhWNgV3AfUqj47M9FsBDZsJ3rdZPdg5
 PmtvBdTfj/0XY9F9w5ahd0ZoC1gylkh8Uneeox/lphF2oRpyPigSaCNDGWk2lm2J8u4/
 j/XGaoumQLL2bFW2jAf9qew7iJVFXh29xutDAxQeoLD7hkfqdZOQ4qgZFjteUyFQn+OS
 n7dPwR63W7xjO3/8ZYZ/ltq+QGv7k/0N3ZNhcTWL0fLsN3UEbBU9fGlwTl7tVW1oGzl3
 l0oRc2jG1AL7nAQKVLuTkL088wONkIcCOQmv49DW+O8z7MhAh7AMhPhvu0dfIERtoWKD
 Gx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJETbVE8VzipqAaEDSc5PHArxRcbjRLrf36cxIZV5KY=;
 b=azgbLS4TLwpoTnK3xV29zJsP+bwNzAZZgbXkEYXOuaxVVAKcIuEmZI0sjDw2zWKWyu
 X+kykgMESNPQ4VpeGXCigTnhLwOrc4glTTiukSSZK2lvC4YoCzJFMF6mRS7HUU9l6+bb
 lzfNWnNMklxVn/ldmi7uIRdaMRCVNfUpSGU8R064LejjYwupCR0WAv8Fs9BbrkwcBkRG
 MMapWp4EfNGJPBtgkr34G41fDv5UzWJPQ5ANBr61WA/5U2FDSxNcNZQB4l7jLJy5DvVr
 k8RIe9AJX5Ka8c6A8WQoDKuRr8c8J4oi/SKljU+k/Z0GzHGflz3X512Q5sOrCHg/eY4o
 t1YQ==
X-Gm-Message-State: AOAM530TBWHxCNskP6R+3St49b+CTBnSWtKXgnZHIBeoub4IA6YasiJa
 OwP5NmluTJOXmq6jozKD1YrFrgImjiiYv+9MKoo=
X-Google-Smtp-Source: ABdhPJzL74xHjj6KsfM67zq9oUeGEacRPpmezWVKCQgTxeIWZ/8XoPs4p34XLfp2LuLPTJ+I2vXISsKobJ4vM30EqIQ=
X-Received: by 2002:a17:90a:9909:: with SMTP id
 b9mr24240882pjp.46.1614027324906; 
 Mon, 22 Feb 2021 12:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
In-Reply-To: <20210222132822.7830-3-kevin3.tang@gmail.com>
From: Orson Zhai <orsonzhai@gmail.com>
Date: Tue, 23 Feb 2021 04:55:13 +0800
Message-ID: <CA+H2tpFivRzmG2XuR4UvCCLHT0S1xHB+nyrY_5PJnwTcCrjDwA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
To: Kevin Tang <kevin3.tang@gmail.com>
X-Mailman-Approved-At: Mon, 22 Feb 2021 22:23:08 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 airlied@linux.ie, Lyra Zhang <zhang.lyra@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 9:28 PM Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> Adds drm support for the Unisoc's display subsystem.
>
> This is drm kms driver, this driver provides support for the
> application framework in Android, Yocto and more.
>
> Application framework can access Unisoc's display internel
> peripherals through libdrm or libkms, it's test ok by modetest
> (DRM/KMS test tool) and Android HWComposer.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
>
> v4:
>   - Move the devm_drm_dev_alloc to master_ops->bind function.
>   - The managed drmm_mode_config_init() it is no longer necessary for drivers to explicitly call drm_mode_config_cleanup, so delete it.
> ---
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/sprd/Kconfig    |  12 ++
>  drivers/gpu/drm/sprd/Makefile   |   5 +
>  drivers/gpu/drm/sprd/sprd_drm.c | 217 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
>  6 files changed, 253 insertions(+)
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 8bf103de1..9d6ce2867 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -382,6 +382,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
>
>  source "drivers/gpu/drm/xlnx/Kconfig"
>
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
>
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 02c229392..42d211d9c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
>  obj-$(CONFIG_DRM_TIDSS) += tidss/
>  obj-y                  += xlnx/
> +obj-$(CONFIG_DRM_SPRD) += sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 000000000..6e80cc9f3
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,12 @@
> +config DRM_SPRD
> +       tristate "DRM Support for Unisoc SoCs Platform"
> +       depends on ARCH_SPRD || COMPILE_TEST
> +       depends on DRM && OF
> +       select DRM_KMS_HELPER
> +       select DRM_GEM_CMA_HELPER
> +       select DRM_KMS_CMA_HELPER
> +       select DRM_MIPI_DSI
> +       help
> +         Choose this option if you have a Unisoc chipset.
> +         If M is selected the module will be called sprd_drm.
> +
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> new file mode 100644
> index 000000000..86d95d93a
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +subdir-ccflags-y += -I$(srctree)/$(src)
> +
> +obj-y := sprd_drm.o
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
> new file mode 100644
> index 000000000..a1d3ed655
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
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
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "sprd_drm.h"
> +
> +#define DRIVER_NAME    "sprd"
> +#define DRIVER_DESC    "Spreadtrum SoCs' DRM Driver"

Prefer to s/Spreadtrum/Unisoc.
Spreadtrum was acquired by Unisoc and never existed any more.
But "sprd" as a vendor prefix is kept for historical reasons.

-Orson

> +#define DRIVER_DATE    "20200201"
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
> +       DRM_GEM_CMA_DRIVER_OPS,
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
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct drm_device *drm;
> +       struct sprd_drm *sprd;
> +       int ret;
> +
> +       sprd = devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm, drm);
> +       if (IS_ERR(sprd))
> +               return PTR_ERR(sprd);
> +
> +       drm = &sprd->drm;
> +       platform_set_drvdata(pdev, drm);
> +
> +       ret = drmm_mode_config_init(drm);
> +       if (ret)
> +               return ret;
> +
> +       sprd_drm_mode_config_init(drm);
> +
> +       /* bind and init sub drivers */
> +       ret = component_bind_all(drm->dev, drm);
> +       if (ret) {
> +               drm_err(drm, "failed to bind all component.\n");
> +               return ret;
> +       }
> +
> +       /* vblank init */
> +       ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +       if (ret) {
> +               drm_err(drm, "failed to initialize vblank.\n");
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
> +       ret = drm_dev_register(drm, 0);
> +       if (ret < 0)
> +               goto err_kms_helper_poll_fini;
> +
> +       return 0;
> +
> +err_kms_helper_poll_fini:
> +       drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +       component_unbind_all(drm->dev, drm);
> +       return ret;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +       struct drm_device *drm = dev_get_drvdata(dev);
> +
> +       drm_dev_unregister(drm);
> +
> +       drm_kms_helper_poll_fini(drm);
> +
> +       component_unbind_all(drm->dev, drm);
> +}
> +
> +static const struct component_master_ops drm_component_ops = {
> +       .bind = sprd_drm_bind,
> +       .unbind = sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +       return dev->of_node == data;
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       ret = dma_set_mask_and_coherent(dev, ~0UL);
> +       if (ret) {
> +               dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
> +               return ret;
> +       }
> +
> +       return drm_of_component_probe(dev, compare_of, &drm_component_ops);
> +}
> +
> +static int sprd_drm_remove(struct platform_device *pdev)
> +{
> +       component_master_del(&pdev->dev, &drm_component_ops);
> +       return 0;
> +}
> +
> +static void sprd_drm_shutdown(struct platform_device *pdev)
> +{
> +       struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +       if (!drm) {
> +               drm_warn(drm, "drm device is not available, no shutdown\n");
> +               return;
> +       }
> +
> +       drm_atomic_helper_shutdown(drm);
> +}
> +
> +static const struct of_device_id drm_match_table[] = {
> +       { .compatible = "sprd,display-subsystem", },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, drm_match_table);
> +
> +static struct platform_driver sprd_drm_driver = {
> +       .probe = sprd_drm_probe,
> +       .remove = sprd_drm_remove,
> +       .shutdown = sprd_drm_shutdown,
> +       .driver = {
> +               .name = "sprd-drm-drv",
> +               .of_match_table = drm_match_table,
> +       },
> +};
> +
> +static struct platform_driver *sprd_drm_drivers[]  = {
> +       &sprd_drm_driver,
> +};
> +
> +static int __init sprd_drm_init(void)
> +{
> +       int ret;
> +
> +       ret = platform_register_drivers(sprd_drm_drivers,
> +                                       ARRAY_SIZE(sprd_drm_drivers));
> +       return ret;
> +}
> +
> +static void __exit sprd_drm_exit(void)
> +{
> +       platform_unregister_drivers(sprd_drm_drivers,
> +                                   ARRAY_SIZE(sprd_drm_drivers));
> +}
> +
> +module_init(sprd_drm_init);
> +module_exit(sprd_drm_exit);
> +
> +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
> new file mode 100644
> index 000000000..9781fd591
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#ifndef _SPRD_DRM_H_
> +#define _SPRD_DRM_H_
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_print.h>
> +
> +struct sprd_drm {
> +       struct drm_device drm;
> +};
> +
> +#endif /* _SPRD_DRM_H_ */
> --
> 2.29.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
