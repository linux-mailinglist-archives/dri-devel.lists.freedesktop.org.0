Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E445B415610
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 05:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6ED6ECAD;
	Thu, 23 Sep 2021 03:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AEB6ECAD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 03:31:09 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id x124so7708361oix.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 20:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WZnkbDqe35agx+YRdoGtlkEIS1vsNJiYQTbIpjWyLqg=;
 b=P3kClDnLsxyd8P5md1GK2izJhbgXFpqpxbnKHA/qDWSDqZ1P9e4S93LBbgYC62Yq8T
 R9UaBvr71Hsdw9Qj0ogvmHgPrs9nA1wIHDSmQSuCmI5BXq1lFS+SXlcuuJMu87sN//ts
 uoAPab1EJfLPjXzcHCtyOod6MCr36/JsjZGHXkrS08VftM1XbrMnc3oaxktFgmfo0vMJ
 t3zsbSBGmyNFg8GpXBD4sDxGxAGUUstl+bhic/DrGsf1M8oshxwuxGJQR4jQBkF6tgbQ
 9K8Mc5CYg7yqg3huKD7lL3thxynHYPVd6unTn3tlAVKYNZOFsjTVusdqhsqsmGe5Tnii
 M9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WZnkbDqe35agx+YRdoGtlkEIS1vsNJiYQTbIpjWyLqg=;
 b=pfvcsLMnMX6tLHBBCbkIHCREfeBKzDdSBjQp3hw3UvwxWdf4qasgZiNbxKujaecOUe
 Zqwa6bYBZ77nIREZgPKmiWy2xKBGFoqCaBmUXCVhD/5ELdQO2GcVJdK35WQ92qbovgoJ
 7mOQPtlRgYF/k+V4AQ7NYjmpWaNTnjEXhX+6NFYTc1PTTMh/jnBDz3d7jEEYBW8qrhTf
 bxoEXi3Lt0ZMibcAAAIyRjwRvSWI3cgwixeanxjlotN7YXmuCUqspcRWp/vxRJ+KfGxl
 Z2Nd1JMN/caE0BDKXK0K379Gw76DEX0AyqBMOIhuzhXHDM/D7WgyTewm80CYybVWKviq
 m4oA==
X-Gm-Message-State: AOAM532yocJtE/qCT6I8qvJKpIIkD+slVaEwNvwiPCgD3bQEBSZp0A0I
 PFd/vzwuPrhQx41RQd2yVB0/UA==
X-Google-Smtp-Source: ABdhPJyEqCFgpzYG5stN1XffFzyyUS7C0XaZxoEnwmEkDrixdgCQQ6CDVf7BYB8h73LGP9V2OIFLXA==
X-Received: by 2002:a05:6808:618:: with SMTP id
 y24mr1978169oih.179.1632367868718; 
 Wed, 22 Sep 2021 20:31:08 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id bf6sm1051367oib.0.2021.09.22.20.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 20:31:08 -0700 (PDT)
Date: Wed, 22 Sep 2021 22:31:06 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
 mathieu.poirier@linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, gpain@baylibre.com
Subject: Re: [RFC PATCH 3/4] rpmsg: Add support of AI Processor Unit (APU)
Message-ID: <YUv0+jQ/91QdydkR@yoga>
References: <20210917125945.620097-1-abailon@baylibre.com>
 <20210917125945.620097-4-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917125945.620097-4-abailon@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 17 Sep 07:59 CDT 2021, Alexandre Bailon wrote:

> Some Mediatek SoC provides hardware accelerator for AI / ML.
> This driver use the DRM driver to manage the shared memory,
> and use rpmsg to execute jobs on the APU.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  drivers/rpmsg/Kconfig     |  10 +++
>  drivers/rpmsg/Makefile    |   1 +
>  drivers/rpmsg/apu_rpmsg.c | 184 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 195 insertions(+)
>  create mode 100644 drivers/rpmsg/apu_rpmsg.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf138..fc1668f795004 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -73,4 +73,14 @@ config RPMSG_VIRTIO
>  	select RPMSG_NS
>  	select VIRTIO
>  
> +config RPMSG_APU
> +	tristate "APU RPMSG driver"
> +	select REMOTEPROC
> +	select RPMSG_VIRTIO
> +	select DRM_APU
> +	help
> +	  This provides a RPMSG driver that provides some facilities to
> +	  communicate with an accelerated processing unit (APU).
> +	  This Uses the APU DRM driver to manage memory and job scheduling.

Similar to how a driver for e.g. an I2C device doesn't live in
drivers/i2c, this doesn't belong in drivers/rpmsg. Probably rather
directly in the DRM driver.

> +
>  endmenu
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index 8d452656f0ee3..8b336b9a817c1 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
>  obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
>  obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
>  obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
> +obj-$(CONFIG_RPMSG_APU)		+= apu_rpmsg.o
> diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
> new file mode 100644
> index 0000000000000..7e504bd176a4d
> --- /dev/null
> +++ b/drivers/rpmsg/apu_rpmsg.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright 2020 BayLibre SAS
> +
> +#include <asm/cacheflush.h>
> +
> +#include <linux/cdev.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
> +#include <linux/iova.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include <drm/apu_drm.h>
> +
> +#include "rpmsg_internal.h"
> +
> +#define APU_RPMSG_SERVICE_MT8183 "rpmsg-mt8183-apu0"
> +
> +struct rpmsg_apu {
> +	struct apu_core *core;
> +	struct rpmsg_device *rpdev;
> +};
> +
> +static int apu_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int count,
> +			      void *priv, u32 addr)
> +{
> +	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
> +	struct apu_core *apu_core = apu->core;
> +
> +	return apu_drm_callback(apu_core, data, count);
> +}
> +
> +static int apu_rpmsg_send(struct apu_core *apu_core, void *data, int len)
> +{
> +	struct rpmsg_apu *apu = apu_drm_priv(apu_core);
> +	struct rpmsg_device *rpdev = apu->rpdev;
> +
> +	return rpmsg_send(rpdev->ept, data, len);

The rpmsg API is exposed outside drivers/rpmsg, so as I said above, just
implement this directly in your driver, no need to lug around a dummy
wrapper for things like this.

> +}
> +
> +static struct apu_drm_ops apu_rpmsg_ops = {
> +	.send = apu_rpmsg_send,
> +};
> +
> +static int apu_init_iovad(struct rproc *rproc, struct rpmsg_apu *apu)
> +{
> +	struct resource_table *table;
> +	struct fw_rsc_carveout *rsc;
> +	int i;
> +
> +	if (!rproc->table_ptr) {
> +		dev_err(&apu->rpdev->dev,
> +			"No resource_table: has the firmware been loaded ?\n");
> +		return -ENODEV;
> +	}
> +
> +	table = rproc->table_ptr;
> +	for (i = 0; i < table->num; i++) {
> +		int offset = table->offset[i];
> +		struct fw_rsc_hdr *hdr = (void *)table + offset;
> +
> +		if (hdr->type != RSC_CARVEOUT)
> +			continue;
> +
> +		rsc = (void *)hdr + sizeof(*hdr);
> +		if (apu_drm_reserve_iova(apu->core, rsc->da, rsc->len)) {
> +			dev_err(&apu->rpdev->dev,
> +				"failed to reserve iova\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct rproc *apu_get_rproc(struct rpmsg_device *rpdev)
> +{
> +	/*
> +	 * To work, the APU RPMsg driver need to get the rproc device.
> +	 * Currently, we only use virtio so we could use that to find the
> +	 * remoteproc parent.
> +	 */
> +	if (!rpdev->dev.parent && rpdev->dev.parent->bus) {
> +		dev_err(&rpdev->dev, "invalid rpmsg device\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (strcmp(rpdev->dev.parent->bus->name, "virtio")) {
> +		dev_err(&rpdev->dev, "unsupported bus\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return vdev_to_rproc(dev_to_virtio(rpdev->dev.parent));
> +}
> +
> +static int apu_rpmsg_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_apu *apu;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	apu = devm_kzalloc(&rpdev->dev, sizeof(*apu), GFP_KERNEL);
> +	if (!apu)
> +		return -ENOMEM;
> +	apu->rpdev = rpdev;
> +
> +	rproc = apu_get_rproc(rpdev);

I believe that you can replace apu_get_rproc() with:

	rproc = rproc_get_by_child(&rpdev->dev);

> +	if (IS_ERR_OR_NULL(rproc))
> +		return PTR_ERR(rproc);
> +
> +	/* Make device dma capable by inheriting from parent's capabilities */
> +	set_dma_ops(&rpdev->dev, get_dma_ops(rproc->dev.parent));
> +
> +	ret = dma_coerce_mask_and_coherent(&rpdev->dev,
> +					   dma_get_mask(rproc->dev.parent));
> +	if (ret)
> +		goto err_put_device;
> +
> +	rpdev->dev.iommu_group = rproc->dev.parent->iommu_group;

Would it be better or you if we have a device_node, so that you could
specify the iommus property for this compute device?

I'm asking because I've seen cases where multi-purpose remoteproc
firmware operate using multiple different iommu streams...

> +
> +	apu->core = apu_drm_register_core(rproc, &apu_rpmsg_ops, apu);
> +	if (!apu->core) {
> +		ret = -ENODEV;
> +		goto err_put_device;
> +	}
> +
> +	ret = apu_init_iovad(rproc, apu);
> +
> +	dev_set_drvdata(&rpdev->dev, apu);
> +
> +	return ret;
> +
> +err_put_device:

This label looks misplaced, and sure enough, if apu_init_iovad() fails
you're not apu_drm_unregister_core().

But on that note, don't you want to apu_init_iovad() before you
apu_drm_register_core()?

> +	devm_kfree(&rpdev->dev, apu);

The reason for using devm_kzalloc() is that once you return
unsuccessfully from probe, or from remove the memory is freed.

So devm_kfree() should go in both cases.

> +
> +	return ret;
> +}
> +
> +static void apu_rpmsg_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
> +
> +	apu_drm_unregister_core(apu);
> +	devm_kfree(&rpdev->dev, apu);

No need to explicitly free devm resources.

Regards,
Bjorn

> +}
> +
> +static const struct rpmsg_device_id apu_rpmsg_match[] = {
> +	{ APU_RPMSG_SERVICE_MT8183 },
> +	{}
> +};
> +
> +static struct rpmsg_driver apu_rpmsg_driver = {
> +	.probe = apu_rpmsg_probe,
> +	.remove = apu_rpmsg_remove,
> +	.callback = apu_rpmsg_callback,
> +	.id_table = apu_rpmsg_match,
> +	.drv  = {
> +		.name  = "apu_rpmsg",
> +	},
> +};
> +
> +static int __init apu_rpmsg_init(void)
> +{
> +	return register_rpmsg_driver(&apu_rpmsg_driver);
> +}
> +arch_initcall(apu_rpmsg_init);
> +
> +static void __exit apu_rpmsg_exit(void)
> +{
> +	unregister_rpmsg_driver(&apu_rpmsg_driver);
> +}
> +module_exit(apu_rpmsg_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("APU RPMSG driver");
> -- 
> 2.31.1
> 
