Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D086430DC40
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 15:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D166EACE;
	Wed,  3 Feb 2021 14:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3486EACE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 14:09:14 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c4so21747091wru.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 06:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=D+i0SDAVd/8+w4aaqzRc+qGBF/nnD/XV6wSALWGl1lA=;
 b=Ewts+TIMfIiI1CJjP5REUP+Iv3rKL7F1fzJqmTjPLczWwFg0eNAuYOeDyiA0gnndUS
 bN0nEtwJod7Vqn/nqM3lvRFdsDdrgJjFjgwa45+KrL1T6R1ZlGaI39mHjc7WT82oJqUk
 IryWboywuqfw3s9eO6hSu49CNjNQWfHnfUsro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=D+i0SDAVd/8+w4aaqzRc+qGBF/nnD/XV6wSALWGl1lA=;
 b=YkcQy4ucRXKMbzzVwKAhkfZAIkqlac5hnX93JV4hu8rankkvDkn80hyBd8C013p0oX
 MSatIE0XVIicnadx3AilY+JOiXj8gYeJRM/jNJEeJJc0m/A9xgcTkUSYQinZC9+8hG3l
 xCliOlTGWwiMny4h9m7TasXXhMM14rGNp03dWDxOtTGI23cZB97hrPdqbzjfwC3rsRwX
 o+8A04y5kj9cUMphm+yr4eHLeMCvmtCKnzhGtibnWP5lAjqvtTiM4bVLVNBuBJkVvzxu
 KfjWcCadYJ90nRQ97n+quS+tLuKyOIdgtG+JTzsXOT1rUFyRibrjNREz9v8GceYLp0KI
 3AzQ==
X-Gm-Message-State: AOAM533Fx4cRZotWeNRWrYm9PBDVS1IiqWQLDhobGWPi1aC/6Tr/h+4Z
 sZpFtwG4JGA/XL2W00qJUErVyA==
X-Google-Smtp-Source: ABdhPJxqi7h90kNhIlknONbzVdu63IVr7R3811A74ldHkFMVz1rlXtYBICJDh3iwys2Aeh7wznf2zA==
X-Received: by 2002:adf:f7cf:: with SMTP id a15mr3762509wrq.351.1612361353644; 
 Wed, 03 Feb 2021 06:09:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o124sm3030721wmb.5.2021.02.03.06.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 06:09:12 -0800 (PST)
Date: Wed, 3 Feb 2021 15:09:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v3 2/6] drm/sprd: add Unisoc's drm kms master
Message-ID: <YBquhqTEouoTUbNA@phenom.ffwll.local>
Mail-Followup-To: Kevin Tang <kevin3.tang@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sean@poorly.run, airlied@linux.ie, robh+dt@kernel.org,
 mark.rutland@arm.com, orsonzhai@gmail.com, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
 <1609854367-2720-3-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609854367-2720-3-git-send-email-kevin3.tang@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, orsonzhai@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 09:46:03PM +0800, Kevin Tang wrote:
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
> ---
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/sprd/Kconfig    |  12 +++
>  drivers/gpu/drm/sprd/Makefile   |   5 +
>  drivers/gpu/drm/sprd/sprd_drm.c | 222 ++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
>  6 files changed, 258 insertions(+)
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 147d61b..15b4e13 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -388,6 +388,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
>  
>  source "drivers/gpu/drm/xlnx/Kconfig"
>  
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
>  
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 8156900..d3001e7 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -124,3 +124,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
>  obj-$(CONFIG_DRM_TIDSS) += tidss/
>  obj-y			+= xlnx/
> +obj-$(CONFIG_DRM_SPRD) += sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 0000000..6e80cc9
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,12 @@
> +config DRM_SPRD
> +	tristate "DRM Support for Unisoc SoCs Platform"
> +	depends on ARCH_SPRD || COMPILE_TEST
> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DSI
> +	help
> +	  Choose this option if you have a Unisoc chipset.
> +	  If M is selected the module will be called sprd_drm.
> +
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> new file mode 100644
> index 0000000..86d95d9
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
> index 0000000..ec101de
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,222 @@
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
> +#define DRIVER_NAME	"sprd"
> +#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE	"20200201"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_helper = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static void sprd_drm_mode_config_init(struct drm_device *drm)
> +{
> +	drm->mode_config.min_width = 0;
> +	drm->mode_config.min_height = 0;
> +	drm->mode_config.max_width = 8192;
> +	drm->mode_config.max_height = 8192;
> +	drm->mode_config.allow_fb_modifiers = true;
> +
> +	drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
> +	drm->mode_config.helper_private = &sprd_drm_mode_config_helper;
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> +
> +static struct drm_driver sprd_drm_drv = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			= &sprd_drm_fops,
> +
> +	/* GEM Operations */
> +	DRM_GEM_CMA_DRIVER_OPS,
> +
> +	.name			= DRIVER_NAME,
> +	.desc			= DRIVER_DESC,
> +	.date			= DRIVER_DATE,
> +	.major			= DRIVER_MAJOR,
> +	.minor			= DRIVER_MINOR,
> +};
> +
> +static int sprd_drm_bind(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	sprd_drm_mode_config_init(drm);
> +
> +	/* bind and init sub drivers */
> +	ret = component_bind_all(drm->dev, drm);
> +	if (ret) {
> +		drm_err(drm, "failed to bind all component.\n");
> +		goto err_dc_cleanup;
> +	}
> +
> +	/* vblank init */
> +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize vblank.\n");
> +		goto err_unbind_all;
> +	}
> +	/* with irq_enabled = true, we can use the vblank feature. */
> +	drm->irq_enabled = true;
> +
> +	/* reset all the states of crtc/plane/encoder/connector */
> +	drm_mode_config_reset(drm);
> +
> +	/* init kms poll for handling hpd */
> +	drm_kms_helper_poll_init(drm);
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret < 0)
> +		goto err_kms_helper_poll_fini;
> +
> +	return 0;
> +
> +err_kms_helper_poll_fini:
> +	drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +	component_unbind_all(drm->dev, drm);
> +err_dc_cleanup:
> +	drm_mode_config_cleanup(drm);

This shouldn't be needed with drmm_mode_config_cleanup. I think the
trouble is that you have the drm_device setup split up between your probe
and your bind function, you need to move the call to drmm_mode_config_init
into you probe, or you move the devm_drm_dev_alloc and the entire setup
into your master_ops->bind function. I think the latter is the more usual
approach.

With that addressed Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	return ret;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +
> +	drm_dev_unregister(drm);
> +
> +	drm_kms_helper_poll_fini(drm);
> +
> +	drm_mode_config_cleanup(drm);
> +
> +	component_unbind_all(drm->dev, drm);
> +}
> +
> +static const struct component_master_ops drm_component_ops = {
> +	.bind = sprd_drm_bind,
> +	.unbind = sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct drm_device *drm;
> +	struct sprd_drm *sprd;
> +	int ret;
> +
> +	sprd = devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm, drm);
> +	if (IS_ERR(sprd))
> +		return PTR_ERR(sprd);
> +
> +	drm = &sprd->drm;
> +
> +	ret = dma_set_mask_and_coherent(dev, ~0UL);
> +	if (ret) {
> +		drm_err(drm, "dma_set_mask_and_coherent failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, drm);
> +
> +	return drm_of_component_probe(dev, compare_of, &drm_component_ops);
> +}
> +
> +static int sprd_drm_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &drm_component_ops);
> +	return 0;
> +}
> +
> +static void sprd_drm_shutdown(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	if (!drm) {
> +		drm_warn(drm, "drm device is not available, no shutdown\n");
> +		return;
> +	}
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static const struct of_device_id drm_match_table[] = {
> +	{ .compatible = "sprd,display-subsystem", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, drm_match_table);
> +
> +static struct platform_driver sprd_drm_driver = {
> +	.probe = sprd_drm_probe,
> +	.remove = sprd_drm_remove,
> +	.shutdown = sprd_drm_shutdown,
> +	.driver = {
> +		.name = "sprd-drm-drv",
> +		.of_match_table = drm_match_table,
> +	},
> +};
> +
> +static struct platform_driver *sprd_drm_drivers[]  = {
> +	&sprd_drm_driver,
> +};
> +
> +static int __init sprd_drm_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_register_drivers(sprd_drm_drivers,
> +					ARRAY_SIZE(sprd_drm_drivers));
> +	return ret;
> +}
> +
> +static void __exit sprd_drm_exit(void)
> +{
> +	platform_unregister_drivers(sprd_drm_drivers,
> +				    ARRAY_SIZE(sprd_drm_drivers));
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
> index 0000000..9781fd5
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
> +	struct drm_device drm;
> +};
> +
> +#endif /* _SPRD_DRM_H_ */
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
