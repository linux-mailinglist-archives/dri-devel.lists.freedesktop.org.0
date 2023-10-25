Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DD7D7133
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAD710E6AE;
	Wed, 25 Oct 2023 15:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299F910E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:50:58 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507c91582fdso8633286e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698249056; x=1698853856; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ylcJerF5bwbwKPe0Z1fbiB9tppCgDvXclx4fVOdD5LY=;
 b=sPS1EOiXG4E3zvuHYFfjCTzC0ZDn0UN/2bRC9QdR5PBSabOvyhFukn2b0/7degkggC
 8t2gHN2FwJ+xdcRiCmkrOJr/H7e3Qq//DsJkTfFj+iQVycHurMnU7iKisqGk6S7SkWEk
 NM0LHKOwEXnwO5l6ZjaZPmzu6N1m9hwCWnMHDOwYm55uk+z0SPnPMhp4Gqq+ThuKaHrb
 J8Eh1h4Bc72aOe5CxQD32jcit/dCZxA3jHXya6eGf7/GOrp5rE0Kix5PkWXg/QuZrTfG
 INH8h1EiCpFMppVtecyuOFHUi0MWTk5ubXD7OVy95lC8a2OFLDn9eiVGDB5TqeuncyL4
 mJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698249056; x=1698853856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ylcJerF5bwbwKPe0Z1fbiB9tppCgDvXclx4fVOdD5LY=;
 b=lw/5gML+YtOqnbnincJUeibbbl8ofPoaDNbO2jqjdpwUtyE8Om4F3cvCEyQos7F9Xy
 xmHiPh0V79ZA3iVDAEeugUvIIRh1c/O9OjqCQz+YmHDwlae18c36aVajLN+ERgsdO3qz
 OjTmyTju7abNbHqOXgUDn+0gQuSG9tQLR1Bfsfb/x49lFVBqWZCf9Qi36L09GdjxGXzs
 rIx1KyCN6H3LPOSeBfURAyyAG4Pz3K8O7/3xMgMHo1/GKWAfewwk1DWNg086rx8nypiI
 eWmZlUEH6ipLT4YiQiPSU8ueszpL0umXq8Buyw10ez1UIEWl5SWDUfAXVq/KsqL1KQyG
 am/A==
X-Gm-Message-State: AOJu0YxkB8suOGsAopWnhjJ3zmwgpbFQ38kUajfIuV2yUvJyf+MBgQag
 BS7hAD5XG22EpL4WF54LUkpskA==
X-Google-Smtp-Source: AGHT+IHTmuZM+UUpN/nS6e7s96XkJiNiR6iojtWQfvkfRXgdY6vTMWs5grXugKN9ggmgHU76yjAEXg==
X-Received: by 2002:ac2:4315:0:b0:507:b90a:7a5d with SMTP id
 l21-20020ac24315000000b00507b90a7a5dmr11466935lfh.10.1698249056137; 
 Wed, 25 Oct 2023 08:50:56 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 7-20020ac25f07000000b00507a5f385f0sm2591799lfq.266.2023.10.25.08.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 08:50:55 -0700 (PDT)
Message-ID: <bc1586aa-9a25-4012-94ee-14782a11e969@linaro.org>
Date: Wed, 25 Oct 2023 18:50:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/vs: Register DRM device
Content-Language: en-GB
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-5-keith.zhao@starfivetech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231025103957.3776-5-keith.zhao@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, christian.koenig@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Jack Zhu <jack.zhu@starfivetech.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Shawn Guo <shawnguo@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/10/2023 13:39, Keith Zhao wrote:
> Implement drm device registration interface
> 
> Thomas Zimmermann wrote:
> You are replacing almost all of the GEM DMA object's helper code.
> Either inherit directly from drm_gem_object drop the dependency entirely,
> or you could try to fit your code into GEM DMA as well
> 
> Eventually I found an answer and it was DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE
> After I adapt this interface, the custom gem logic interfaces can be deleted.
> It's a big shocking, clap!
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>   drivers/gpu/drm/Kconfig                  |   2 +
>   drivers/gpu/drm/Makefile                 |   1 +
>   drivers/gpu/drm/verisilicon/Kconfig      |  15 ++
>   drivers/gpu/drm/verisilicon/Makefile     |   7 +
>   drivers/gpu/drm/verisilicon/vs_drv.c     | 227 +++++++++++++++++++++++
>   drivers/gpu/drm/verisilicon/vs_drv.h     |  27 +++
>   drivers/gpu/drm/verisilicon/vs_modeset.c |  36 ++++
>   drivers/gpu/drm/verisilicon/vs_modeset.h |  10 +
>   include/uapi/drm/vs_drm.h                |  50 +++++
>   9 files changed, 375 insertions(+)
>   create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>   create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
>   create mode 100644 include/uapi/drm/vs_drm.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index afb3b2f5f..9ede80ef9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -363,6 +363,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
>   
>   source "drivers/gpu/drm/sprd/Kconfig"
>   
> +source "drivers/gpu/drm/verisilicon/Kconfig"
> +
>   config DRM_HYPERV
>   	tristate "DRM Support for Hyper-V synthetic video device"
>   	depends on DRM && PCI && MMU && HYPERV
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 7a09a89b4..6db3bc397 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -194,3 +194,4 @@ obj-y			+= gud/
>   obj-$(CONFIG_DRM_HYPERV) += hyperv/
>   obj-y			+= solomon/
>   obj-$(CONFIG_DRM_SPRD) += sprd/
> +obj-$(CONFIG_DRM_VERISILICON) += verisilicon/
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
> new file mode 100644
> index 000000000..3a361f8c8
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config DRM_VERISILICON
> +	tristate "DRM Support for VeriSilicon"
> +	depends on DRM
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER
> +	select CMA
> +	select DMA_CMA
> +	help
> +	  Choose this option if you have a VeriSilicon soc chipset.
> +	  This driver provides VeriSilicon kernel mode
> +	  setting and buffer management. It does not
> +	  provide 2D or 3D acceleration.
> +
> +
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> new file mode 100644
> index 000000000..7d3be305b
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +vs_drm-objs := vs_drv.o \
> +		vs_modeset.o
> +
> +obj-$(CONFIG_DRM_VERISILICON) += vs_drm.o
> +
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
> new file mode 100644
> index 000000000..da7698c3d
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_aperture.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "vs_drv.h"
> +#include "vs_modeset.h"
> +
> +#define DRV_NAME	"verisilicon"
> +#define DRV_DESC	"Verisilicon DRM driver"
> +#define DRV_DATE	"20230516"
> +#define DRV_MAJOR	1
> +#define DRV_MINOR	0
> +
> +static int vs_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
> +			      struct drm_mode_create_dumb *args)
> +{
> +	struct vs_drm_device *priv = to_vs_drm_private(dev);
> +
> +	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> +
> +	if (args->bpp % 10)
> +		args->pitch = ALIGN(pitch, priv->pitch_alignment);
> +	else
> +		/* for costum 10bit format with no bit gaps */

? I think you meant 'custom' here. If so, please define that format and 
use it explicitly here. There can be other 10bpp formats.

> +		args->pitch = pitch;
> +
> +	return drm_gem_dma_dumb_create_internal(file, dev, args);
> +}
> +
> +DEFINE_DRM_GEM_FOPS(vs_drm_fops);
> +
> +static struct drm_driver vs_drm_driver = {
> +	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> +
> +	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vs_gem_dumb_create),
> +
> +	.fops			= &vs_drm_fops,
> +	.name			= DRV_NAME,
> +	.desc			= DRV_DESC,
> +	.date			= DRV_DATE,
> +	.major			= DRV_MAJOR,
> +	.minor			= DRV_MINOR,
> +};
> +
> +static int vs_drm_bind(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct vs_drm_device *priv;
> +	int ret;
> +	struct drm_device *drm_dev;
> +
> +	/* Remove existing drivers that may own the framebuffer memory. */
> +	ret = drm_aperture_remove_framebuffers(&vs_drm_driver);
> +	if (ret)
> +		return ret;
> +
> +	priv = devm_drm_dev_alloc(dev, &vs_drm_driver, struct vs_drm_device, base);
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
> +
> +	priv->pitch_alignment = 64;
> +
> +	ret = dma_set_coherent_mask(priv->base.dev, DMA_BIT_MASK(40));
> +	if (ret)
> +		return ret;
> +
> +	drm_dev = &priv->base;
> +	platform_set_drvdata(pdev, drm_dev);
> +
> +	vs_mode_config_init(drm_dev);
> +
> +	/* Now try and bind all our sub-components */
> +	ret = component_bind_all(dev, drm_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
> +	if (ret)
> +		return ret;
> +
> +	drm_mode_config_reset(drm_dev);
> +
> +	drm_kms_helper_poll_init(drm_dev);
> +
> +	ret = drm_dev_register(drm_dev, 0);
> +	if (ret)
> +		return ret;
> +
> +	drm_fbdev_generic_setup(drm_dev, 32);
> +
> +	return 0;
> +}
> +
> +static void vs_drm_unbind(struct device *dev)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +	drm_dev_unregister(drm_dev);
> +	drm_kms_helper_poll_fini(drm_dev);
> +	component_unbind_all(drm_dev->dev, drm_dev);
> +}
> +
> +static const struct component_master_ops vs_drm_ops = {
> +	.bind = vs_drm_bind,
> +	.unbind = vs_drm_unbind,
> +};
> +
> +static struct platform_driver *drm_sub_drivers[] = {
> +
> +};
> +
> +static struct component_match *vs_drm_match_add(struct device *dev)
> +{
> +	struct component_match *match = NULL;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_sub_drivers); ++i) {
> +		struct platform_driver *drv = drm_sub_drivers[i];
> +		struct device *p = NULL, *d;
> +
> +		while ((d = platform_find_device_by_driver(p, &drv->driver))) {
> +			put_device(p);
> +
> +			component_match_add(dev, &match, component_compare_dev, d);

drm_of_component_match_add ?

> +			p = d;
> +		}
> +		put_device(p);
> +	}
> +
> +	return match ? match : ERR_PTR(-ENODEV);
> +}
> +
> +static int vs_drm_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct component_match *match;
> +
> +	match = vs_drm_match_add(dev);
> +	if (IS_ERR(match))
> +		return PTR_ERR(match);
> +
> +	return component_master_add_with_match(dev, &vs_drm_ops, match);
> +}
> +
> +static int vs_drm_platform_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &vs_drm_ops);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int vs_drm_suspend(struct device *dev)
> +{
> +	return drm_mode_config_helper_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int vs_drm_resume(struct device *dev)
> +{
> +	drm_mode_config_helper_resume(dev_get_drvdata(dev));
> +
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(vs_drm_pm_ops, vs_drm_suspend, vs_drm_resume);
> +
> +static const struct of_device_id vs_drm_dt_ids[] = {
> +	{ .compatible = "starfive,display-subsystem", },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, vs_drm_dt_ids);
> +
> +static struct platform_driver vs_drm_platform_driver = {
> +	.probe = vs_drm_platform_probe,
> +	.remove = vs_drm_platform_remove,
> +
> +	.driver = {
> +		.name = DRV_NAME,
> +		.of_match_table = vs_drm_dt_ids,
> +		.pm = &vs_drm_pm_ops,
> +	},
> +};
> +
> +static int __init vs_drm_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_register_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_platform_driver_register(&vs_drm_platform_driver);
> +	if (ret)
> +		platform_unregister_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));

You can probably squash all the drivers into a single array.

> +
> +	return ret;
> +}
> +
> +static void __exit vs_drm_fini(void)
> +{
> +	platform_driver_unregister(&vs_drm_platform_driver);
> +	platform_unregister_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));
> +}
> +
> +module_init(vs_drm_init);
> +module_exit(vs_drm_fini);
> +
> +MODULE_DESCRIPTION("VeriSilicon DRM Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
> new file mode 100644
> index 000000000..369ad22d6
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_DRV_H__
> +#define __VS_DRV_H__
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
> +
> +/*@pitch_alignment: buffer pitch alignment required by sub-devices.*/
> +struct vs_drm_device {
> +	struct drm_device base;
> +	unsigned int pitch_alignment;
> +};
> +
> +static inline struct vs_drm_device *
> +to_vs_drm_private(const struct drm_device *dev)
> +{
> +	return container_of(dev, struct vs_drm_device, base);
> +}
> +
> +#endif /* __VS_DRV_H__ */
> diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.c b/drivers/gpu/drm/verisilicon/vs_modeset.c
> new file mode 100644
> index 000000000..151272067
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_modeset.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#include <linux/module.h>
> +
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +
> +#include "vs_modeset.h"
> +
> +static const struct drm_mode_config_funcs vs_mode_config_funcs = {
> +	.fb_create			 = drm_gem_fb_create,
> +	.atomic_check		 = drm_atomic_helper_check,
> +	.atomic_commit		 = drm_atomic_helper_commit,
> +};
> +
> +static struct drm_mode_config_helper_funcs vs_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +void vs_mode_config_init(struct drm_device *dev)
> +{
> +	drm_mode_config_init(dev);

quoting docs:

  * FIXME: This function is deprecated and drivers should be converted 
over to
  * drmm_mode_config_init().

> +	dev->mode_config.fb_modifiers_not_supported = false;

This is the default, if I'm not mistaken

> +
> +	dev->mode_config.min_width  = 0;
> +	dev->mode_config.min_height = 0;
> +	dev->mode_config.max_width  = 4096;
> +	dev->mode_config.max_height = 4096;
> +
> +	dev->mode_config.funcs = &vs_mode_config_funcs;
> +	dev->mode_config.helper_private = &vs_mode_config_helpers;
> +}
> diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.h b/drivers/gpu/drm/verisilicon/vs_modeset.h
> new file mode 100644
> index 000000000..ebfe6d612
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_modeset.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_FB_H__
> +#define __VS_FB_H__

Please match guarding define and the header name.

> +
> +void vs_mode_config_init(struct drm_device *dev);
> +#endif /* __VS_FB_H__ */
> diff --git a/include/uapi/drm/vs_drm.h b/include/uapi/drm/vs_drm.h
> new file mode 100644
> index 000000000..96b7fc95d
> --- /dev/null
> +++ b/include/uapi/drm/vs_drm.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_DRM_H__
> +#define __VS_DRM_H__
> +
> +#include "drm.h"

Which drm.h?

> +
> +enum drm_vs_degamma_mode {
> +	VS_DEGAMMA_DISABLE = 0,
> +	VS_DEGAMMA_BT709 = 1,
> +	VS_DEGAMMA_BT2020 = 2,
> +};
> +
> +enum drm_vs_sync_dc_mode {
> +	VS_SINGLE_DC = 0,
> +	VS_MULTI_DC_PRIMARY = 1,
> +	VS_MULTI_DC_SECONDARY = 2,
> +};
> +
> +enum drm_vs_mmu_prefetch_mode {
> +	VS_MMU_PREFETCH_DISABLE = 0,
> +	VS_MMU_PREFETCH_ENABLE = 1,
> +};
> +
> +struct drm_vs_watermark {
> +	__u32 watermark;
> +	__u8 qos_low;
> +	__u8 qos_high;
> +};
> +
> +struct drm_vs_color_mgmt {
> +	__u32 colorkey;
> +	__u32 colorkey_high;
> +	__u32 clear_value;
> +	bool  clear_enable;
> +	bool  transparency;
> +};
> +
> +struct drm_vs_roi {
> +	bool enable;
> +	__u16 roi_x;
> +	__u16 roi_y;
> +	__u16 roi_w;
> +	__u16 roi_h;
> +};

Could you please add corresponding defines in the patch that actually 
makes use of them? Otherwise it might be hard to review usage.

> +
> +#endif /* __VS_DRM_H__ */

-- 
With best wishes
Dmitry

