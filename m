Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBB31D925
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 13:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4B16E064;
	Wed, 17 Feb 2021 12:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D38B6E064
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613563687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dK/PuEdy+T1GhbxEvlABnwp+xo+mxxMP+aA2ZxCIPhs=;
 b=jMT5RZ6NKllGS9SVN1S8MXehYqQieZCPP/BEMaClkMFrGeM28M7WmfAefd2kv4Z7KwVAbX
 my6fFAac4SMGGobnC6s8bV09K075CxlX94hojd57seVrGu19m5V1le77itp6x38Ixs91vK
 OzbZEu0oTogRvqXSylT0IuIxlYE94RE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-rByf5JUcOF2aREiev_TR0g-1; Wed, 17 Feb 2021 07:08:02 -0500
X-MC-Unique: rByf5JUcOF2aREiev_TR0g-1
Received: by mail-ed1-f69.google.com with SMTP id y6so9870971edc.17
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 04:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dK/PuEdy+T1GhbxEvlABnwp+xo+mxxMP+aA2ZxCIPhs=;
 b=kixSgUMZbeVb5UmCZgJ0hb6k4M6wiqoak+vsdQyzk3LJ2qeCKc23f+ttnjqM2Ohf7F
 4+MdVoZ4lHxCih7afe3UWmqe239rGPqvwa8L2974/34jeYOtSOpPKWpmSB1sbTZGY8nz
 Mu0Vj0+c8jcuJ+tz9lfkZoLD9BWSSE68J7WWwP8Mo6ZmUMdIeavVB2YoV11dJSzqIkAv
 eGyXCDZFtJtzmtKeR9ACOHYrtby8hny0vCuN4whIS7tGUfvPhz/XIMYDA7HnQmT85ege
 0FwG0wxpUa6gqNDnhjKsP2emWGl22gmMFvDeP3qXedwNJh+5MmydHgwJ4g29uzog6EOW
 poyA==
X-Gm-Message-State: AOAM530K8DryYiVMBsAn0x4ORdVoEXhGjPluWFVrNzGlBX8mt9acgc9z
 NrrNq41+csDmNSb57gfQWElBo8Yu+HEDk/6WYS93f7YMqnfPpAlqdiTR1DXO5aU6hKOxn8KHPbB
 cDNG9C7OJGyJF2NHoP7ZwUnUD6HY8
X-Received: by 2002:a50:fb03:: with SMTP id d3mr6072931edq.262.1613563681631; 
 Wed, 17 Feb 2021 04:08:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytHPecGro53GfI3802XJOqcArONqucivFCVJHUKpUyneW7sQvCTbjX8eBKvJXU2hOcw7DYsQ==
X-Received: by 2002:a50:fb03:: with SMTP id d3mr6072902edq.262.1613563681231; 
 Wed, 17 Feb 2021 04:08:01 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id q16sm921624ejd.39.2021.02.17.04.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:08:00 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Deepak Rawat <drawat.floss@gmail.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
In-Reply-To: <20210216003959.802492-1-drawat.floss@gmail.com>
References: <20210216003959.802492-1-drawat.floss@gmail.com>
Date: Wed, 17 Feb 2021 13:07:59 +0100
Message-ID: <87k0r6kicg.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Wei Hu <weh@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Deepak Rawat <drawat.floss@gmail.com> writes:

> DRM driver for hyperv synthetic video device, based on hyperv_fb
> framebuffer driver. Also added config option "DRM_HYPERV" to enabled
> this driver.
>
> v2:
> - Add support for gen2 VM
> - Fixed review comments
>
> v3:
> - Split into multiple files as suggested by Thomas Zimmermann
> - Fixed hibernation issue as suggested by Dexuan Cui
> - Use ioremap_cache as suggested by Dexuan Cui
> - Incorporated other review comments
>
> Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig                     |  12 +
>  drivers/gpu/drm/Makefile                    |   1 +
>  drivers/gpu/drm/hyperv/Makefile             |   8 +
>  drivers/gpu/drm/hyperv/hyperv_drm.h         |  51 ++
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c     | 313 +++++++++++++
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 240 ++++++++++
>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c   | 486 ++++++++++++++++++++
>  7 files changed, 1111 insertions(+)
>  create mode 100644 drivers/gpu/drm/hyperv/Makefile
>  create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm.h
>  create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>  create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>  create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_proto.c
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 8bf103de1594..c17f4e9dcd82 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -382,6 +382,18 @@ source "drivers/gpu/drm/tidss/Kconfig"
>  
>  source "drivers/gpu/drm/xlnx/Kconfig"
>  
> +config DRM_HYPERV
> +	tristate "DRM Support for hyperv synthetic video device"
> +	depends on DRM && PCI && MMU && HYPERV
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_SHMEM_HELPER
> +	help
> +	 This is a KMS driver for hyperv synthetic video device. Choose this
> +	 option if you would like to enable drm driver for Hyper-V virtual
> +	 machine.
> +
> +	 If M is selected the module will be called hyperv_drm.
> +
>  # Keep legacy drivers last
>  
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 926adef289db..294e321cd23f 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -125,3 +125,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
>  obj-$(CONFIG_DRM_TIDSS) += tidss/
>  obj-y			+= xlnx/
> +obj-$(CONFIG_DRM_HYPERV) += hyperv/
> diff --git a/drivers/gpu/drm/hyperv/Makefile b/drivers/gpu/drm/hyperv/Makefile
> new file mode 100644
> index 000000000000..0039b03db0be
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +hyperv_drm-y := \
> +	hyperv_drm_proto.o \
> +	hyperv_drm_modeset.o \
> +	hyperv_drm_drv.o
> +
> +obj-$(CONFIG_DRM_HYPERV) += hyperv_drm.o
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hyperv/hyperv_drm.h
> new file mode 100644
> index 000000000000..4f8c627b303a
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2012-2021 Microsoft

Out of pure curiosity, where does '2012' come from or what does it mean?

> + */
> +
> +#ifndef _HYPERV_DRM_H_
> +#define _HYPERV_DRM_H_
> +
> +#define VMBUS_MAX_PACKET_SIZE 0x4000
> +
> +struct hyperv_drm_device {
> +	/* drm */
> +	struct drm_device dev;
> +	struct drm_simple_display_pipe pipe;
> +	struct drm_connector connector;
> +
> +	/* mode */
> +	u32 screen_width_max;
> +	u32 screen_height_max;
> +	u32 preferred_width;
> +	u32 preferred_height;
> +	u32 screen_depth;
> +
> +	/* hw */
> +	struct resource *mem;
> +	void __iomem *vram;
> +	unsigned long fb_base;
> +	unsigned long fb_size;
> +	struct completion wait;
> +	u32 synthvid_version;
> +	u32 mmio_megabytes;
> +
> +	u8 init_buf[VMBUS_MAX_PACKET_SIZE];
> +	u8 recv_buf[VMBUS_MAX_PACKET_SIZE];
> +
> +	struct hv_device *hdev;
> +};
> +
> +#define to_hv(_dev) container_of(_dev, struct hyperv_drm_device, dev)
> +
> +/* hyperv_drm_modeset */
> +int hyperv_mode_config_init(struct hyperv_drm_device *hv);
> +
> +/* hyperv_drm_proto */
> +int hyperv_update_vram_location(struct hv_device *hdev, phys_addr_t vram_pp);
> +int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
> +			    u32 w, u32 h, u32 pitch);
> +int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect);
> +int hyperv_connect_vsp(struct hv_device *hdev);

As we already have
balloon_connect_vsp()/netvsc_connect_vsp()/synthvid_connect_vsp(), could
we maybe rename 'hyperv_connect_vsp()' to something more DRM-specific? 

> +
> +#endif
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> new file mode 100644
> index 000000000000..b72c1a169125
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2012-2021 Microsoft
> + */
> +
> +#include <linux/efi.h>
> +#include <linux/hyperv.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "hyperv_drm.h"
> +
> +#define DRIVER_NAME "hyperv_drm"
> +#define DRIVER_DESC "DRM driver for hyperv synthetic video device"
> +#define DRIVER_DATE "2020"
> +#define DRIVER_MAJOR 1
> +#define DRIVER_MINOR 0
> +
> +#define PCI_VENDOR_ID_MICROSOFT 0x1414
> +#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
> +
> +DEFINE_DRM_GEM_FOPS(hv_fops);
> +
> +static struct drm_driver hyperv_driver = {
> +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +
> +	.name		 = DRIVER_NAME,
> +	.desc		 = DRIVER_DESC,
> +	.date		 = DRIVER_DATE,
> +	.major		 = DRIVER_MAJOR,
> +	.minor		 = DRIVER_MINOR,
> +
> +	.fops		 = &hv_fops,
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +};
> +
> +static int hyperv_pci_probe(struct pci_dev *pdev,
> +			    const struct pci_device_id *ent)
> +{
> +	return 0;
> +}
> +
> +static void hyperv_pci_remove(struct pci_dev *pdev)
> +{
> +}
> +
> +static const struct pci_device_id hyperv_pci_tbl[] = {
> +	{
> +		.vendor = PCI_VENDOR_ID_MICROSOFT,
> +		.device = PCI_DEVICE_ID_HYPERV_VIDEO,
> +	},
> +	{ /* end of list */ }
> +};
> +
> +static struct pci_driver hyperv_pci_driver = {
> +	.name =		KBUILD_MODNAME,
> +	.id_table =	hyperv_pci_tbl,
> +	.probe =	hyperv_pci_probe,
> +	.remove =	hyperv_pci_remove,
> +};
> +
> +static int hyperv_get_vram_gen1(struct hyperv_drm_device *hv)
> +{
> +	struct drm_device *dev = &hv->dev;
> +	struct pci_dev *pdev;
> +	int ret;
> +
> +	pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
> +			      PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> +	if (!pdev) {
> +		drm_err(dev, "Unable to find PCI Hyper-V video\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "hypervdrmfb");
> +	if (ret) {
> +		drm_err(dev, "Not able to remove boot fb\n");
> +		return ret;
> +	}
> +
> +	if (pci_request_region(pdev, 0, DRIVER_NAME) != 0)
> +		drm_warn(dev, "Cannot request framebuffer, boot fb still active?\n");
> +
> +	if ((pdev->resource[0].flags & IORESOURCE_MEM) == 0) {
> +		drm_err(dev, "Resource at bar 0 is not IORESOURCE_MEM\n");
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +
> +	hv->fb_base = pci_resource_start(pdev, 0);
> +	hv->fb_size = pci_resource_len(pdev, 0);
> +	if (hv->fb_base == 0) {
> +		drm_err(dev, "Resource not available\n");
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +
> +	hv->fb_size = min(hv->fb_size,
> +			  (unsigned long)(hv->mmio_megabytes * 1024 * 1024));
> +	hv->vram = devm_ioremap(&pdev->dev, hv->fb_base, hv->fb_size);
> +	if (!hv->vram) {
> +		drm_err(dev, "Failed to map vram\n");
> +		ret = -ENOMEM;
> +	}
> +
> +error:
> +	pci_dev_put(pdev);
> +	return ret;
> +}
> +
> +static int hyperv_get_vram_gen2(struct hyperv_drm_device *hv,
> +				struct hv_device *hdev)
> +{
> +	struct drm_device *dev = &hv->dev;
> +	struct apertures_struct *ap;
> +	int ret;
> +
> +	hv->fb_size = (unsigned long)(hv->mmio_megabytes * 1024 * 1024);

In case 'unsigned long' casting was needed because you're afraid 'u32'
can overflow, it should be applied before we actually do the
multiplication:

 (unsigned long)hv->mmio_megabytes * 1024 * 1024

otherwise the cast seems useless fb_size is 'unsigned long'.

> +
> +	ret = vmbus_allocate_mmio(&hv->mem, hdev, 0, -1, hv->fb_size, 0x100000,
> +				  true);
> +	if (ret) {
> +		drm_err(dev, "Failed to allocate mmio\n");
> +		return -ENOMEM;
> +	}
> +
> +	/*
> +	 * Map the VRAM cacheable for performance. This is also required for VM
> +	 * connect to display properly for ARM64 Linux VM, as the host also maps
> +	 * the VRAM cacheable.
> +	 */
> +	hv->vram = ioremap_cache(hv->mem->start, hv->fb_size);
> +	if (!hv->vram) {
> +		drm_err(dev, "Failed to map vram\n");
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	hv->fb_base = hv->mem->start;
> +
> +	ap = alloc_apertures(1);
> +	if (!ap) {
> +		drm_err(dev, "Failed to get apertures\n");
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	ap->ranges[0].base = screen_info.lfb_base;
> +	ap->ranges[0].size = screen_info.lfb_size;
> +	remove_conflicting_framebuffers(ap, KBUILD_MODNAME, false);
> +	kfree(ap);
> +
> +	return 0;
> +
> +error:
> +	vmbus_free_mmio(hv->mem->start, hv->fb_size);
> +	return ret;
> +}
> +
> +static int hyperv_vmbus_probe(struct hv_device *hdev,
> +			      const struct hv_vmbus_device_id *dev_id)
> +{
> +	struct hyperv_drm_device *hv;
> +	struct drm_device *dev;
> +	int ret;
> +
> +	hv = devm_drm_dev_alloc(&hdev->device, &hyperv_driver,
> +				struct hyperv_drm_device, dev);
> +	if (IS_ERR(hv))
> +		return PTR_ERR(hv);
> +
> +	dev = &hv->dev;
> +	init_completion(&hv->wait);
> +	hv_set_drvdata(hdev, hv);
> +	hv->hdev = hdev;
> +
> +	/* Get the actual VRAM size from the device */
> +	ret = hyperv_connect_vsp(hdev);
> +	if (ret) {
> +		drm_err(dev, "Failed to connect to vmbus.\n");
> +		goto err_hv_set_drv_data;
> +	}
> +
> +	if (efi_enabled(EFI_BOOT))
> +		ret = hyperv_get_vram_gen2(hv, hdev);
> +	else
> +		ret = hyperv_get_vram_gen1(hv);
> +
> +	if (ret)
> +		goto err_vmbus_close;
> +
> +	/*
> +	 * Should be done only once during init and resume. Failing to update
> +	 * vram location is not fatal. Device will update dirty area till
> +	 * preferred resolution only.
> +	 */
> +	ret = hyperv_update_vram_location(hdev, hv->fb_base);
> +	if (ret)
> +		drm_warn(dev, "Failed to update vram location.\n");
> +
> +	ret = hyperv_mode_config_init(hv);
> +	if (ret)
> +		goto err_vmbus_close;
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret) {
> +		drm_err(dev, "Failed to register drm driver.\n");
> +		goto err_vmbus_close;
> +	}
> +
> +	drm_fbdev_generic_setup(dev, 0);
> +
> +	return 0;
> +
> +err_vmbus_close:
> +	vmbus_close(hdev->channel);
> +err_hv_set_drv_data:
> +	hv_set_drvdata(hdev, NULL);
> +	return ret;
> +}
> +
> +static int hyperv_vmbus_remove(struct hv_device *hdev)
> +{
> +	struct drm_device *dev = hv_get_drvdata(hdev);
> +	struct hyperv_drm_device *hv = to_hv(dev);
> +
> +	drm_dev_unplug(dev);
> +	drm_atomic_helper_shutdown(dev);
> +	vmbus_close(hdev->channel);
> +	hv_set_drvdata(hdev, NULL);
> +	vmbus_free_mmio(hv->mem->start, hv->fb_size);
> +
> +	return 0;
> +}
> +
> +static int hyperv_vmbus_suspend(struct hv_device *hdev)
> +{
> +	struct drm_device *dev = hv_get_drvdata(hdev);
> +	int ret;
> +
> +	ret = drm_mode_config_helper_suspend(dev);
> +
> +	vmbus_close(hdev->channel);
> +
> +	return ret;
> +}
> +
> +static int hyperv_vmbus_resume(struct hv_device *hdev)
> +{
> +	struct drm_device *dev = hv_get_drvdata(hdev);
> +	struct hyperv_drm_device *hv = to_hv(dev);
> +	int ret;
> +
> +	ret = hyperv_connect_vsp(hdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = hyperv_update_vram_location(hdev, hv->fb_base);
> +	if (ret)
> +		return ret;
> +
> +	return drm_mode_config_helper_resume(dev);
> +}
> +
> +static const struct hv_vmbus_device_id hyperv_vmbus_tbl[] = {
> +	/* Synthetic Video Device GUID */
> +	{HV_SYNTHVID_GUID},
> +	{}
> +};
> +
> +static struct hv_driver hyperv_hv_driver = {
> +	.name = KBUILD_MODNAME,
> +	.id_table = hyperv_vmbus_tbl,
> +	.probe = hyperv_vmbus_probe,
> +	.remove = hyperv_vmbus_remove,
> +	.suspend = hyperv_vmbus_suspend,
> +	.resume = hyperv_vmbus_resume,
> +	.driver = {
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +
> +static int __init hyperv_init(void)
> +{
> +	int ret;
> +
> +	ret = pci_register_driver(&hyperv_pci_driver);
> +	if (ret != 0)
> +		return ret;
> +
> +	return vmbus_driver_register(&hyperv_hv_driver);
> +}
> +
> +static void __exit hyperv_exit(void)
> +{
> +	vmbus_driver_unregister(&hyperv_hv_driver);
> +	pci_unregister_driver(&hyperv_pci_driver);
> +}
> +
> +module_init(hyperv_init);
> +module_exit(hyperv_exit);
> +
> +MODULE_DEVICE_TABLE(pci, hyperv_pci_tbl);
> +MODULE_DEVICE_TABLE(vmbus, hyperv_vmbus_tbl);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Deepak Rawat <drawat.floss@gmail.com>");
> +MODULE_DESCRIPTION("DRM driver for hyperv synthetic video device");
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> new file mode 100644
> index 000000000000..40ec0cff0e59
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2012-2021 Microsoft
> + */
> +
> +#include <linux/hyperv.h>
> +
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "hyperv_drm.h"
> +
> +static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
> +				    struct drm_rect *rect)
> +{
> +	struct hyperv_drm_device *hv = to_hv(fb->dev);
> +	struct dma_buf_map map;
> +	void *vmap;
> +	int idx, ret;
> +
> +	if (!drm_dev_enter(&hv->dev, &idx))
> +		return -ENODEV;
> +
> +	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	if (ret) {
> +		drm_dev_exit(idx);
> +		return ret;
> +	}
> +
> +	vmap = map.vaddr;
> +	drm_fb_memcpy_dstclip(hv->vram, vmap, fb, rect);
> +	drm_gem_shmem_vunmap(fb->obj[0], vmap);
> +	drm_dev_exit(idx);
> +
> +	return 0;
> +}
> +
> +static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb)
> +{
> +	struct drm_rect fullscreen = {
> +		.x1 = 0,
> +		.x2 = fb->width,
> +		.y1 = 0,
> +		.y2 = fb->height,
> +	};
> +	return hyperv_blit_to_vram_rect(fb, &fullscreen);
> +}
> +
> +static int hyperv_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct hyperv_drm_device *hv = to_hv(connector->dev);
> +	int count;
> +
> +	count = drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);
> +	drm_set_preferred_mode(connector, hv->preferred_width,
> +			       hv->preferred_height);
> +
> +	return count;
> +}
> +
> +static const struct drm_connector_helper_funcs hyperv_connector_helper_funcs = {
> +	.get_modes = hyperv_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs hyperv_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int hyperv_conn_init(struct hyperv_drm_device *hv)
> +{
> +	drm_connector_helper_add(&hv->connector, &hyperv_connector_helper_funcs);
> +	return drm_connector_init(&hv->dev, &hv->connector,
> +				  &hyperv_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VGA);
> +}
> +
> +static int hyperv_check_size(struct hyperv_drm_device *hv, int w, int h,
> +			     struct drm_framebuffer *fb)
> +{
> +	u32 pitch = w * (hv->screen_depth / 8);
> +
> +	if (fb)
> +		pitch = fb->pitches[0];
> +
> +	if (pitch * h > hv->fb_size)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
> +			       struct drm_crtc_state *crtc_state,
> +			       struct drm_plane_state *plane_state)
> +{
> +	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> +
> +	hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
> +				crtc_state->mode.hdisplay,
> +				crtc_state->mode.vdisplay,
> +				plane_state->fb->pitches[0]);
> +	hyperv_blit_to_vram_fullscreen(plane_state->fb);
> +}
> +
> +static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
> +			     struct drm_plane_state *plane_state,
> +			     struct drm_crtc_state *crtc_state)
> +{
> +	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +
> +	if (fb->format->format != DRM_FORMAT_XRGB8888)
> +		return -EINVAL;
> +
> +	if (fb->pitches[0] * fb->height > hv->fb_size)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
> +			       struct drm_plane_state *old_state)
> +{
> +	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> +	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_rect rect;
> +
> +	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
> +		hyperv_blit_to_vram_rect(state->fb, &rect);
> +		hyperv_update_dirt(hv->hdev, &rect);
> +	}
> +}
> +
> +static const struct drm_simple_display_pipe_funcs hyperv_pipe_funcs = {
> +	.enable	= hyperv_pipe_enable,
> +	.check = hyperv_pipe_check,
> +	.update	= hyperv_pipe_update,
> +};
> +
> +static const uint32_t hyperv_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const uint64_t hyperv_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static int hyperv_pipe_init(struct hyperv_drm_device *hv)
> +{
> +	int ret;
> +
> +	ret = drm_simple_display_pipe_init(&hv->dev,
> +					   &hv->pipe,
> +					   &hyperv_pipe_funcs,
> +					   hyperv_formats,
> +					   ARRAY_SIZE(hyperv_formats),
> +					   NULL,
> +					   &hv->connector);
> +
> +	drm_plane_enable_fb_damage_clips(&hv->pipe.plane);
> +
> +	return ret;
> +}
> +
> +static struct drm_framebuffer*
> +hyperv_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> +		 const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	return drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);
> +}
> +
> +static enum drm_mode_status
> +hyperv_mode_valid(struct drm_device *dev,
> +		  const struct drm_display_mode *mode)
> +{
> +	struct hyperv_drm_device *hv = to_hv(dev);
> +
> +	if (hyperv_check_size(hv, mode->hdisplay, mode->vdisplay, NULL))
> +		return MODE_BAD;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_mode_config_funcs hyperv_mode_config_funcs = {
> +	.fb_create = hyperv_fb_create,
> +	.mode_valid = hyperv_mode_valid,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +int hyperv_mode_config_init(struct hyperv_drm_device *hv)
> +{
> +	struct drm_device *dev = &hv->dev;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret) {
> +		drm_err(dev, "Failed to initialized mode setting.\n");
> +		return ret;
> +	}
> +
> +	dev->mode_config.min_width = 0;
> +	dev->mode_config.min_height = 0;
> +	dev->mode_config.max_width = hv->screen_width_max;
> +	dev->mode_config.max_height = hv->screen_height_max;
> +
> +	dev->mode_config.preferred_depth = hv->screen_depth;
> +	dev->mode_config.prefer_shadow = 0;
> +
> +	dev->mode_config.funcs = &hyperv_mode_config_funcs;
> +
> +	ret = hyperv_conn_init(hv);
> +	if (ret) {
> +		drm_err(dev, "Failed to initialized connector.\n");
> +		return ret;
> +	}
> +
> +	ret = hyperv_pipe_init(hv);
> +	if (ret) {
> +		drm_err(dev, "Failed to initialized pipe.\n");
> +		return ret;
> +	}
> +
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> new file mode 100644
> index 000000000000..4e61992be121
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2012-2021 Microsoft
> + */
> +
> +#include <linux/hyperv.h>
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "hyperv_drm.h"
> +
> +#define VMBUS_RING_BUFSIZE (256 * 1024)
> +#define VMBUS_VSP_TIMEOUT (10 * HZ)
> +
> +#define SYNTHVID_VERSION(major, minor) ((minor) << 16 | (major))
> +#define SYNTHVID_VER_GET_MAJOR(ver) (ver & 0x0000ffff)
> +#define SYNTHVID_VER_GET_MINOR(ver) ((ver & 0xffff0000) >> 16)
> +#define SYNTHVID_VERSION_WIN7 SYNTHVID_VERSION(3, 0)
> +#define SYNTHVID_VERSION_WIN8 SYNTHVID_VERSION(3, 2)
> +#define SYNTHVID_VERSION_WIN10 SYNTHVID_VERSION(3, 5)
> +
> +#define SYNTHVID_DEPTH_WIN7 16
> +#define SYNTHVID_DEPTH_WIN8 32
> +#define SYNTHVID_FB_SIZE_WIN7 (4 * 1024 * 1024)
> +#define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
> +#define SYNTHVID_WIDTH_MAX_WIN7 1600
> +#define SYNTHVID_HEIGHT_MAX_WIN7 1200
> +
> +enum pipe_msg_type {
> +	PIPE_MSG_INVALID,
> +	PIPE_MSG_DATA,
> +	PIPE_MSG_MAX
> +};
> +
> +enum synthvid_msg_type {
> +	SYNTHVID_ERROR			= 0,
> +	SYNTHVID_VERSION_REQUEST	= 1,
> +	SYNTHVID_VERSION_RESPONSE	= 2,
> +	SYNTHVID_VRAM_LOCATION		= 3,
> +	SYNTHVID_VRAM_LOCATION_ACK	= 4,
> +	SYNTHVID_SITUATION_UPDATE	= 5,
> +	SYNTHVID_SITUATION_UPDATE_ACK	= 6,
> +	SYNTHVID_POINTER_POSITION	= 7,
> +	SYNTHVID_POINTER_SHAPE		= 8,
> +	SYNTHVID_FEATURE_CHANGE		= 9,
> +	SYNTHVID_DIRT			= 10,
> +	SYNTHVID_RESOLUTION_REQUEST	= 13,
> +	SYNTHVID_RESOLUTION_RESPONSE	= 14,
> +
> +	SYNTHVID_MAX			= 15
> +};
> +
> +struct pipe_msg_hdr {
> +	u32 type;
> +	u32 size; /* size of message after this field */
> +} __packed;
> +
> +struct hvd_screen_info {
> +	u16 width;
> +	u16 height;
> +} __packed;
> +
> +struct synthvid_msg_hdr {
> +	u32 type;
> +	u32 size;  /* size of this header + payload after this field */
> +} __packed;
> +
> +struct synthvid_version_req {
> +	u32 version;
> +} __packed;
> +
> +struct synthvid_version_resp {
> +	u32 version;
> +	u8 is_accepted;
> +	u8 max_video_outputs;
> +} __packed;
> +
> +struct synthvid_vram_location {
> +	u64 user_ctx;
> +	u8 is_vram_gpa_specified;
> +	u64 vram_gpa;
> +} __packed;
> +
> +struct synthvid_vram_location_ack {
> +	u64 user_ctx;
> +} __packed;
> +
> +struct video_output_situation {
> +	u8 active;
> +	u32 vram_offset;
> +	u8 depth_bits;
> +	u32 width_pixels;
> +	u32 height_pixels;
> +	u32 pitch_bytes;
> +} __packed;
> +
> +struct synthvid_situation_update {
> +	u64 user_ctx;
> +	u8 video_output_count;
> +	struct video_output_situation video_output[1];
> +} __packed;
> +
> +struct synthvid_situation_update_ack {
> +	u64 user_ctx;
> +} __packed;
> +
> +struct synthvid_pointer_position {
> +	u8 is_visible;
> +	u8 video_output;
> +	s32 image_x;
> +	s32 image_y;
> +} __packed;
> +
> +#define SYNTHVID_CURSOR_MAX_X 96
> +#define SYNTHVID_CURSOR_MAX_Y 96
> +#define SYNTHVID_CURSOR_ARGB_PIXEL_SIZE 4
> +#define SYNTHVID_CURSOR_MAX_SIZE (SYNTHVID_CURSOR_MAX_X * \
> +	SYNTHVID_CURSOR_MAX_Y * SYNTHVID_CURSOR_ARGB_PIXEL_SIZE)
> +#define SYNTHVID_CURSOR_COMPLETE (-1)
> +
> +struct synthvid_pointer_shape {
> +	u8 part_idx;
> +	u8 is_argb;
> +	u32 width; /* SYNTHVID_CURSOR_MAX_X at most */
> +	u32 height; /* SYNTHVID_CURSOR_MAX_Y at most */
> +	u32 hot_x; /* hotspot relative to upper-left of pointer image */
> +	u32 hot_y;
> +	u8 data[4];
> +} __packed;
> +
> +struct synthvid_feature_change {
> +	u8 is_dirt_needed;
> +	u8 is_ptr_pos_needed;
> +	u8 is_ptr_shape_needed;
> +	u8 is_situ_needed;
> +} __packed;
> +
> +struct rect {
> +	s32 x1, y1; /* top left corner */
> +	s32 x2, y2; /* bottom right corner, exclusive */
> +} __packed;
> +
> +struct synthvid_dirt {
> +	u8 video_output;
> +	u8 dirt_count;
> +	struct rect rect[1];
> +} __packed;
> +
> +#define SYNTHVID_EDID_BLOCK_SIZE	128
> +#define	SYNTHVID_MAX_RESOLUTION_COUNT	64
> +
> +struct synthvid_supported_resolution_req {
> +	u8 maximum_resolution_count;
> +} __packed;
> +
> +struct synthvid_supported_resolution_resp {
> +	u8 edid_block[SYNTHVID_EDID_BLOCK_SIZE];
> +	u8 resolution_count;
> +	u8 default_resolution_index;
> +	u8 is_standard;
> +	struct hvd_screen_info supported_resolution[SYNTHVID_MAX_RESOLUTION_COUNT];
> +} __packed;
> +
> +struct synthvid_msg {
> +	struct pipe_msg_hdr pipe_hdr;
> +	struct synthvid_msg_hdr vid_hdr;
> +	union {
> +		struct synthvid_version_req ver_req;
> +		struct synthvid_version_resp ver_resp;
> +		struct synthvid_vram_location vram;
> +		struct synthvid_vram_location_ack vram_ack;
> +		struct synthvid_situation_update situ;
> +		struct synthvid_situation_update_ack situ_ack;
> +		struct synthvid_pointer_position ptr_pos;
> +		struct synthvid_pointer_shape ptr_shape;
> +		struct synthvid_feature_change feature_chg;
> +		struct synthvid_dirt dirt;
> +		struct synthvid_supported_resolution_req resolution_req;
> +		struct synthvid_supported_resolution_resp resolution_resp;
> +	};
> +} __packed;
> +
> +static inline bool hyperv_version_ge(u32 ver1, u32 ver2)
> +{
> +	if (SYNTHVID_VER_GET_MAJOR(ver1) > SYNTHVID_VER_GET_MAJOR(ver2) ||
> +	    (SYNTHVID_VER_GET_MAJOR(ver1) == SYNTHVID_VER_GET_MAJOR(ver2) &&
> +	     SYNTHVID_VER_GET_MINOR(ver1) >= SYNTHVID_VER_GET_MINOR(ver2)))
> +		return true;
> +
> +	return false;
> +}
> +
> +static inline int hyperv_sendpacket(struct hv_device *hdev, struct synthvid_msg *msg)
> +{
> +	static atomic64_t request_id = ATOMIC64_INIT(0);
> +	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
> +	int ret;
> +
> +	msg->pipe_hdr.type = PIPE_MSG_DATA;
> +	msg->pipe_hdr.size = msg->vid_hdr.size;
> +
> +	ret = vmbus_sendpacket(hdev->channel, msg,
> +			       msg->vid_hdr.size + sizeof(struct pipe_msg_hdr),
> +			       atomic64_inc_return(&request_id),
> +			       VM_PKT_DATA_INBAND, 0);
> +
> +	if (ret)
> +		drm_err(&hv->dev, "Unable to send packet via vmbus\n");
> +
> +	return ret;
> +}
> +
> +static int hyperv_negotiate_version(struct hv_device *hdev, u32 ver)
> +{
> +	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg = (struct synthvid_msg *)hv->init_buf;
> +	struct drm_device *dev = &hv->dev;
> +	unsigned long t;
> +	int ret = 0;
> +
> +	memset(msg, 0, sizeof(struct synthvid_msg));
> +	msg->vid_hdr.type = SYNTHVID_VERSION_REQUEST;
> +	msg->vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_version_req);
> +	msg->ver_req.version = ver;
> +	hyperv_sendpacket(hdev, msg);
> +
> +	t = wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
> +	if (!t) {
> +		drm_err(dev, "Time out on waiting version response\n");
> +		ret = -ETIMEDOUT;
> +		goto out;
> +	}
> +	if (!msg->ver_resp.is_accepted) {
> +		ret = -ENODEV;
> +		goto out;

Both 'out' label and 'ret' variable could be dropped here, just do
'return -ETIMEDOUT/-ENODEV' directly and 'return 0' at the end.

> +	}
> +
> +	hv->synthvid_version = ver;
> +	drm_info(dev, "Synthvid Version major %d, minor %d\n",
> +		 SYNTHVID_VER_GET_MAJOR(ver), SYNTHVID_VER_GET_MINOR(ver));
> +
> +out:
> +	return ret;
> +}
> +
> +int hyperv_update_vram_location(struct hv_device *hdev, phys_addr_t vram_pp)
> +{
> +	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg = (struct synthvid_msg *)hv->init_buf;
> +	struct drm_device *dev = &hv->dev;
> +	unsigned long t;
> +	int ret = 0;
> +
> +	memset(msg, 0, sizeof(struct synthvid_msg));
> +	msg->vid_hdr.type = SYNTHVID_VRAM_LOCATION;
> +	msg->vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_vram_location);
> +	msg->vram.user_ctx = vram_pp;
> +	msg->vram.vram_gpa = vram_pp;
> +	msg->vram.is_vram_gpa_specified = 1;
> +	hyperv_sendpacket(hdev, msg);
> +
> +	t = wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
> +	if (!t) {
> +		drm_err(dev, "Time out on waiting vram location ack\n");
> +		ret = -ETIMEDOUT;
> +		goto out;
> +	}
> +	if (msg->vram_ack.user_ctx != vram_pp) {
> +		drm_err(dev, "Unable to set VRAM location\n");
> +		ret = -ENODEV;
> +	}
> +
> +out:
> +	return ret;

same here: 'out' and 'ret' could be dropped.

> +}
> +
> +int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
> +			    u32 w, u32 h, u32 pitch)
> +{
> +	struct synthvid_msg msg;
> +
> +	memset(&msg, 0, sizeof(struct synthvid_msg));
> +
> +	msg.vid_hdr.type = SYNTHVID_SITUATION_UPDATE;
> +	msg.vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_situation_update);
> +	msg.situ.user_ctx = 0;
> +	msg.situ.video_output_count = 1;
> +	msg.situ.video_output[0].active = active;
> +	/* vram_offset should always be 0 */
> +	msg.situ.video_output[0].vram_offset = 0;
> +	msg.situ.video_output[0].depth_bits = bpp;
> +	msg.situ.video_output[0].width_pixels = w;
> +	msg.situ.video_output[0].height_pixels = h;
> +	msg.situ.video_output[0].pitch_bytes = pitch;
> +
> +	hyperv_sendpacket(hdev, &msg);
> +
> +	return 0;
> +}
> +
> +int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect)
> +{
> +	struct synthvid_msg msg;
> +
> +	memset(&msg, 0, sizeof(struct synthvid_msg));
> +
> +	msg.vid_hdr.type = SYNTHVID_DIRT;
> +	msg.vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_dirt);
> +	msg.dirt.video_output = 0;
> +	msg.dirt.dirt_count = 1;
> +	msg.dirt.rect[0].x1 = rect->x1;
> +	msg.dirt.rect[0].y1 = rect->y1;
> +	msg.dirt.rect[0].x2 = rect->x2;
> +	msg.dirt.rect[0].y2 = rect->y2;
> +
> +	hyperv_sendpacket(hdev, &msg);
> +
> +	return 0;
> +}
> +
> +static int hyperv_get_supported_resolution(struct hv_device *hdev)
> +{
> +	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg = (struct synthvid_msg *)hv->init_buf;
> +	struct drm_device *dev = &hv->dev;
> +	unsigned long t;
> +	int ret = 0;
> +	u8 index;
> +	int i;
> +
> +	memset(msg, 0, sizeof(struct synthvid_msg));
> +	msg->vid_hdr.type = SYNTHVID_RESOLUTION_REQUEST;
> +	msg->vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_supported_resolution_req);
> +	msg->resolution_req.maximum_resolution_count =
> +		SYNTHVID_MAX_RESOLUTION_COUNT;
> +	hyperv_sendpacket(hdev, msg);
> +
> +	t = wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
> +	if (!t) {
> +		drm_err(dev, "Time out on waiting resolution response\n");
> +		ret = -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	if (msg->resolution_resp.resolution_count == 0) {
> +		drm_err(dev, "No supported resolutions\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	index = msg->resolution_resp.default_resolution_index;
> +	if (index >= msg->resolution_resp.resolution_count) {
> +		drm_err(dev, "Invalid resolution index: %d\n", index);
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	for (i = 0; i < msg->resolution_resp.resolution_count; i++) {
> +		hv->screen_width_max = max_t(u32, hv->screen_width_max,
> +			msg->resolution_resp.supported_resolution[i].width);
> +		hv->screen_height_max = max_t(u32, hv->screen_height_max,
> +			msg->resolution_resp.supported_resolution[i].height);
> +	}
> +
> +	hv->preferred_width =
> +		msg->resolution_resp.supported_resolution[index].width;
> +	hv->preferred_height =
> +		msg->resolution_resp.supported_resolution[index].height;
> +
> +out:
> +	return ret;

And here.

> +}
> +
> +static void hyperv_receive_sub(struct hv_device *hdev)
> +{
> +	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg;
> +
> +	if (!hv)
> +		return;
> +
> +	msg = (struct synthvid_msg *)hv->recv_buf;
> +
> +	/* Complete the wait event */
> +	if (msg->vid_hdr.type == SYNTHVID_VERSION_RESPONSE ||
> +	    msg->vid_hdr.type == SYNTHVID_RESOLUTION_RESPONSE ||
> +	    msg->vid_hdr.type == SYNTHVID_VRAM_LOCATION_ACK) {
> +		memcpy(hv->init_buf, msg, VMBUS_MAX_PACKET_SIZE);
> +		complete(&hv->wait);
> +		return;
> +	}
> +}
> +
> +static void hyperv_receive(void *ctx)
> +{
> +	struct hv_device *hdev = ctx;
> +	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
> +	struct synthvid_msg *recv_buf;
> +	u32 bytes_recvd;
> +	u64 req_id;
> +	int ret;
> +
> +	if (!hv)
> +		return;
> +
> +	recv_buf = (struct synthvid_msg *)hv->recv_buf;
> +
> +	do {
> +		ret = vmbus_recvpacket(hdev->channel, recv_buf,
> +				       VMBUS_MAX_PACKET_SIZE,
> +				       &bytes_recvd, &req_id);
> +		if (bytes_recvd > 0 &&
> +		    recv_buf->pipe_hdr.type == PIPE_MSG_DATA)
> +			hyperv_receive_sub(hdev);
> +	} while (bytes_recvd > 0 && ret == 0);
> +}
> +
> +int hyperv_connect_vsp(struct hv_device *hdev)
> +{
> +	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
> +	struct drm_device *dev = &hv->dev;
> +	int ret;
> +
> +	ret = vmbus_open(hdev->channel, VMBUS_RING_BUFSIZE, VMBUS_RING_BUFSIZE,
> +			 NULL, 0, hyperv_receive, hdev);
> +	if (ret) {
> +		drm_err(dev, "Unable to open vmbus channel\n");
> +		return ret;
> +	}
> +
> +	/* Negotiate the protocol version with host */
> +	switch (vmbus_proto_version) {
> +	case VERSION_WIN10:
> +	case VERSION_WIN10_V5:
> +		ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN10);
> +		if (!ret)
> +			break;
> +		fallthrough;
> +	case VERSION_WIN8:
> +	case VERSION_WIN8_1:
> +		ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN8);
> +		if (!ret)
> +			break;
> +		fallthrough;
> +	case VERSION_WS2008:
> +	case VERSION_WIN7:
> +		ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN7);
> +		break;
> +	default:
> +		ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN10);
> +		break;
> +	}
> +
> +	if (ret) {
> +		drm_err(dev, "Synthetic video device version not accepted %d\n", ret);
> +		goto error;
> +	}
> +
> +	if (hv->synthvid_version == SYNTHVID_VERSION_WIN7)
> +		hv->screen_depth = SYNTHVID_DEPTH_WIN7;
> +	else
> +		hv->screen_depth = SYNTHVID_DEPTH_WIN8;
> +
> +	if (hyperv_version_ge(hv->synthvid_version, SYNTHVID_VERSION_WIN10)) {
> +		ret = hyperv_get_supported_resolution(hdev);
> +		if (ret)
> +			drm_err(dev, "Failed to get supported resolution from host, use default\n");
> +	} else {
> +		hv->screen_width_max = SYNTHVID_WIDTH_MAX_WIN7;
> +		hv->screen_height_max = SYNTHVID_HEIGHT_MAX_WIN7;
> +	}
> +
> +	hv->mmio_megabytes = hdev->channel->offermsg.offer.mmio_megabytes;
> +
> +	return 0;
> +
> +error:
> +	vmbus_close(hdev->channel);
> +	return ret;
> +}

-- 
Vitaly

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
