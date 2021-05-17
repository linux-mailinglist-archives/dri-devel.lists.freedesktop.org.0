Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92853382DE7
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 15:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C896E046;
	Mon, 17 May 2021 13:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15676E046
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:50:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36AECAC8F;
 Mon, 17 May 2021 13:50:37 +0000 (UTC)
To: Deepak Rawat <drawat.floss@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org
References: <20210517115922.8033-1-drawat.floss@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Message-ID: <3c7966c8-8985-e5f1-464c-90bc6544dc74@suse.de>
Date: Mon, 17 May 2021 15:50:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210517115922.8033-1-drawat.floss@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aIcC0y7qSlP6sAr9e3Ian4h2cQr0vYwvN"
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
Cc: Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aIcC0y7qSlP6sAr9e3Ian4h2cQr0vYwvN
Content-Type: multipart/mixed; boundary="Neam4BtIO27y9qcLDhKUuuLNiMUJUdbzc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Deepak Rawat <drawat.floss@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org
Cc: Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Message-ID: <3c7966c8-8985-e5f1-464c-90bc6544dc74@suse.de>
Subject: Re: [PATCH v4 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
References: <20210517115922.8033-1-drawat.floss@gmail.com>
In-Reply-To: <20210517115922.8033-1-drawat.floss@gmail.com>

--Neam4BtIO27y9qcLDhKUuuLNiMUJUdbzc
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

I only have a number of trivial changes listed below. With these fixed:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 17.05.21 um 13:59 schrieb Deepak Rawat:
> DRM driver for hyperv synthetic video device, based on hyperv_fb
> framebuffer driver. Also added config option "DRM_HYPERV" to enabled
> this driver.
>=20
> v2:
> - Add support for gen2 VM
> - Fixed review comments
>=20
> v3:
> - Split into multiple files as suggested by Thomas Zimmermann
> - Fixed hibernation issue as suggested by Dexuan Cui
> - Use ioremap_cache as suggested by Dexuan Cui
> - Incorporated other review comments
>=20
> v4:
> - Fix bitrotted code
> - Review comments
> - Updated the copyright and license to match hyperv_fb
>=20
> Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
> ---
>   drivers/gpu/drm/Kconfig                     |  12 +
>   drivers/gpu/drm/Makefile                    |   1 +
>   drivers/gpu/drm/hyperv/Makefile             |   8 +
>   drivers/gpu/drm/hyperv/hyperv_drm.h         |  51 +++
>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c     | 310 +++++++++++++
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 238 ++++++++++
>   drivers/gpu/drm/hyperv/hyperv_drm_proto.c   | 478 +++++++++++++++++++=
+
>   7 files changed, 1098 insertions(+)
>   create mode 100644 drivers/gpu/drm/hyperv/Makefile
>   create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm.h
>   create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>   create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>   create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_proto.c
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3c16bd1afd87..15bb0165ebf9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -386,6 +386,18 @@ source "drivers/gpu/drm/xlnx/Kconfig"
>  =20
>   source "drivers/gpu/drm/gud/Kconfig"
>  =20
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
>   # Keep legacy drivers last
>  =20
>   menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 5279db4392df..d0ae4feaae33 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_MCDE) +=3D mcde/
>   obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
>   obj-y			+=3D xlnx/
>   obj-y			+=3D gud/
> +obj-$(CONFIG_DRM_HYPERV) +=3D hyperv/
> diff --git a/drivers/gpu/drm/hyperv/Makefile b/drivers/gpu/drm/hyperv/M=
akefile
> new file mode 100644
> index 000000000000..0039b03db0be
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +hyperv_drm-y :=3D \
> +	hyperv_drm_proto.o \
> +	hyperv_drm_modeset.o \
> +	hyperv_drm_drv.o

Alphabetical sorting prefered.

> +
> +obj-$(CONFIG_DRM_HYPERV) +=3D hyperv_drm.o
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hype=
rv/hyperv_drm.h
> new file mode 100644
> index 000000000000..e1d1fdea96f2
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2021 Microsoft
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
> +int hyperv_update_vram_location(struct hv_device *hdev, phys_addr_t vr=
am_pp);
> +int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp=
,
> +			    u32 w, u32 h, u32 pitch);
> +int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect);=

> +int hyperv_connect_vsp(struct hv_device *hdev);
> +
> +#endif
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/=
hyperv/hyperv_drm_drv.c
> new file mode 100644
> index 000000000000..68a6ba91a486
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2021 Microsoft
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
> +static struct drm_driver hyperv_driver =3D {
> +	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +
> +	.name		 =3D DRIVER_NAME,
> +	.desc		 =3D DRIVER_DESC,
> +	.date		 =3D DRIVER_DATE,
> +	.major		 =3D DRIVER_MAJOR,
> +	.minor		 =3D DRIVER_MINOR,
> +
> +	.fops		 =3D &hv_fops,
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
> +static const struct pci_device_id hyperv_pci_tbl[] =3D {
> +	{
> +		.vendor =3D PCI_VENDOR_ID_MICROSOFT,
> +		.device =3D PCI_DEVICE_ID_HYPERV_VIDEO,
> +	},
> +	{ /* end of list */ }
> +};
> +
> +static struct pci_driver hyperv_pci_driver =3D {
> +	.name =3D		KBUILD_MODNAME,
> +	.id_table =3D	hyperv_pci_tbl,
> +	.probe =3D	hyperv_pci_probe,
> +	.remove =3D	hyperv_pci_remove,
> +};

The PCI code doesn't do anything. Do you need this for gen1 to work=20
corretly. If so, there should at least be a short comment. Why don't you =

call hyperv_setup_gen1() in the PCI probe function?

> +
> +static int hyperv_setup_gen1(struct hyperv_drm_device *hv)
> +{
> +	struct drm_device *dev =3D &hv->dev;
> +	struct pci_dev *pdev;
> +	int ret;
> +
> +	pdev =3D pci_get_device(PCI_VENDOR_ID_MICROSOFT,
> +			      PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> +	if (!pdev) {
> +		drm_err(dev, "Unable to find PCI Hyper-V video\n");
> +		return -ENODEV;
> +	}
> +
> +	ret =3D drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "hype=
rvdrmfb");

This function is no more. There's now=20
drm_aperture_remove_conflicting_pci_framebuffers() from=20
drm/drm_aperture.h Works the same way.

You probably need to rebase onto the latest drm-misc-next or drm-tip tree=
=2E

> +	if (ret) {
> +		drm_err(dev, "Not able to remove boot fb\n");
> +		return ret;
> +	}
> +
> +	if (pci_request_region(pdev, 0, DRIVER_NAME) !=3D 0)
> +		drm_warn(dev, "Cannot request framebuffer, boot fb still active?\n")=
;
> +
> +	if ((pdev->resource[0].flags & IORESOURCE_MEM) =3D=3D 0) {
> +		drm_err(dev, "Resource at bar 0 is not IORESOURCE_MEM\n");
> +		ret =3D -ENODEV;
> +		goto error;
> +	}
> +
> +	hv->fb_base =3D pci_resource_start(pdev, 0);
> +	hv->fb_size =3D pci_resource_len(pdev, 0);
> +	if (!hv->fb_base) {
> +		drm_err(dev, "Resource not available\n");
> +		ret =3D -ENODEV;
> +		goto error;
> +	}
> +
> +	hv->fb_size =3D min(hv->fb_size,
> +			  (unsigned long)(hv->mmio_megabytes * 1024 * 1024));
> +	hv->vram =3D devm_ioremap(&pdev->dev, hv->fb_base, hv->fb_size);
> +	if (!hv->vram) {
> +		drm_err(dev, "Failed to map vram\n");
> +		ret =3D -ENOMEM;
> +	}
> +
> +error:
> +	pci_dev_put(pdev);
> +	return ret;
> +}
> +
> +static int hyperv_setup_gen2(struct hyperv_drm_device *hv,
> +			     struct hv_device *hdev)
> +{
> +	struct drm_device *dev =3D &hv->dev;
> +	struct apertures_struct *ap;
> +	int ret;
> +
> +	ap =3D alloc_apertures(1);
> +	if (!ap) {
> +		drm_err(dev, "Failed to get apertures\n");
> +		return -ENOMEM;
> +	}
> +
> +	ap->ranges[0].base =3D screen_info.lfb_base;
> +	ap->ranges[0].size =3D screen_info.lfb_size;
> +	drm_fb_helper_remove_conflicting_framebuffers(ap, KBUILD_MODNAME, fal=
se);

For this function, there's now=20
drm_aperture_remove_conflicting_framebuffers().

> +	kfree(ap);
> +
> +	hv->fb_size =3D (unsigned long)hv->mmio_megabytes * 1024 * 1024;
> +
> +	ret =3D vmbus_allocate_mmio(&hv->mem, hdev, 0, -1, hv->fb_size, 0x100=
000,
> +				  true);
> +	if (ret) {
> +		drm_err(dev, "Failed to allocate mmio\n");
> +		return -ENOMEM;
> +	}
> +
> +	/*
> +	 * Map the VRAM cacheable for performance. This is also required for =
VM
> +	 * connect to display properly for ARM64 Linux VM, as the host also m=
aps
> +	 * the VRAM cacheable.
> +	 */
> +	hv->vram =3D ioremap_cache(hv->mem->start, hv->fb_size);
> +	if (!hv->vram) {
> +		drm_err(dev, "Failed to map vram\n");
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	hv->fb_base =3D hv->mem->start;
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
> +	hv =3D devm_drm_dev_alloc(&hdev->device, &hyperv_driver,
> +				struct hyperv_drm_device, dev);
> +	if (IS_ERR(hv))
> +		return PTR_ERR(hv);
> +
> +	dev =3D &hv->dev;
> +	init_completion(&hv->wait);
> +	hv_set_drvdata(hdev, hv);
> +	hv->hdev =3D hdev;
> +
> +	ret =3D hyperv_connect_vsp(hdev);
> +	if (ret) {
> +		drm_err(dev, "Failed to connect to vmbus.\n");
> +		goto err_hv_set_drv_data;
> +	}
> +
> +	if (efi_enabled(EFI_BOOT))
> +		ret =3D hyperv_setup_gen2(hv, hdev);
> +	else
> +		ret =3D hyperv_setup_gen1(hv);
> +
> +	if (ret)
> +		goto err_vmbus_close;
> +
> +	/*
> +	 * Should be done only once during init and resume. Failing to update=

> +	 * vram location is not fatal. Device will update dirty area till
> +	 * preferred resolution only.
> +	 */
> +	ret =3D hyperv_update_vram_location(hdev, hv->fb_base);
> +	if (ret)
> +		drm_warn(dev, "Failed to update vram location.\n");
> +
> +	ret =3D hyperv_mode_config_init(hv);
> +	if (ret)
> +		goto err_vmbus_close;
> +
> +	ret =3D drm_dev_register(dev, 0);
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
> +	struct drm_device *dev =3D hv_get_drvdata(hdev);
> +	struct hyperv_drm_device *hv =3D to_hv(dev);
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
> +	struct drm_device *dev =3D hv_get_drvdata(hdev);
> +	int ret;
> +
> +	ret =3D drm_mode_config_helper_suspend(dev);
> +
> +	vmbus_close(hdev->channel);
> +
> +	return ret;
> +}
> +
> +static int hyperv_vmbus_resume(struct hv_device *hdev)
> +{
> +	struct drm_device *dev =3D hv_get_drvdata(hdev);
> +	struct hyperv_drm_device *hv =3D to_hv(dev);
> +	int ret;
> +
> +	ret =3D hyperv_connect_vsp(hdev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D hyperv_update_vram_location(hdev, hv->fb_base);
> +	if (ret)
> +		return ret;
> +
> +	return drm_mode_config_helper_resume(dev);
> +}
> +
> +static const struct hv_vmbus_device_id hyperv_vmbus_tbl[] =3D {
> +	/* Synthetic Video Device GUID */
> +	{HV_SYNTHVID_GUID},
> +	{}
> +};
> +
> +static struct hv_driver hyperv_hv_driver =3D {
> +	.name =3D KBUILD_MODNAME,
> +	.id_table =3D hyperv_vmbus_tbl,
> +	.probe =3D hyperv_vmbus_probe,
> +	.remove =3D hyperv_vmbus_remove,
> +	.suspend =3D hyperv_vmbus_suspend,
> +	.resume =3D hyperv_vmbus_resume,
> +	.driver =3D {
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +
> +static int __init hyperv_init(void)
> +{
> +	int ret;
> +
> +	ret =3D pci_register_driver(&hyperv_pci_driver);
> +	if (ret !=3D 0)
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
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/=
drm/hyperv/hyperv_drm_modeset.c
> new file mode 100644
> index 000000000000..5d608472d294
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2021 Microsoft
> + */
> +
> +#include <linux/hyperv.h>
> +
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "hyperv_drm.h"
> +
> +static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
> +				    const struct dma_buf_map *map,
> +				    struct drm_rect *rect)
> +{
> +	struct hyperv_drm_device *hv =3D to_hv(fb->dev);
> +	void *vmap =3D map->vaddr; /* TODO: Use mapping abstraction properly =
*/
> +	int idx;
> +
> +	if (!drm_dev_enter(&hv->dev, &idx))
> +		return -ENODEV;
> +
> +	drm_fb_memcpy_dstclip(hv->vram, vmap, fb, rect);
> +	drm_dev_exit(idx);
> +
> +	return 0;
> +}
> +
> +static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb, =
const struct dma_buf_map *map)
> +{
> +	struct drm_rect fullscreen =3D {
> +		.x1 =3D 0,
> +		.x2 =3D fb->width,
> +		.y1 =3D 0,
> +		.y2 =3D fb->height,
> +	};
> +	return hyperv_blit_to_vram_rect(fb, map, &fullscreen);
> +}
> +
> +static int hyperv_connector_get_modes(struct drm_connector *connector)=

> +{
> +	struct hyperv_drm_device *hv =3D to_hv(connector->dev);
> +	int count;
> +
> +	count =3D drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);
> +	drm_set_preferred_mode(connector, hv->preferred_width,
> +			       hv->preferred_height);
> +
> +	return count;
> +}
> +
> +static const struct drm_connector_helper_funcs hyperv_connector_helper=
_funcs =3D {
> +	.get_modes =3D hyperv_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs hyperv_connector_funcs =3D {
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.destroy =3D drm_connector_cleanup,
> +	.reset =3D drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_sta=
te,
> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static inline int hyperv_conn_init(struct hyperv_drm_device *hv)
> +{
> +	drm_connector_helper_add(&hv->connector, &hyperv_connector_helper_fun=
cs);
> +	return drm_connector_init(&hv->dev, &hv->connector,
> +				  &hyperv_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VIRTUAL);
> +}
> +
> +static int hyperv_check_size(struct hyperv_drm_device *hv, int w, int =
h,
> +			     struct drm_framebuffer *fb)
> +{
> +	u32 pitch =3D w * (hv->screen_depth / 8);
> +
> +	if (fb)
> +		pitch =3D fb->pitches[0];
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
> +	struct hyperv_drm_device *hv =3D to_hv(pipe->crtc.dev);
> +	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_p=
lane_state(plane_state);
> +
> +	hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
> +				crtc_state->mode.hdisplay,
> +				crtc_state->mode.vdisplay,
> +				plane_state->fb->pitches[0]);
> +	hyperv_blit_to_vram_fullscreen(plane_state->fb, &shadow_plane_state->=
map[0]);
> +}
> +
> +static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
> +			     struct drm_plane_state *plane_state,
> +			     struct drm_crtc_state *crtc_state)
> +{
> +	struct hyperv_drm_device *hv =3D to_hv(pipe->crtc.dev);
> +	struct drm_framebuffer *fb =3D plane_state->fb;
> +
> +	if (fb->format->format !=3D DRM_FORMAT_XRGB8888)
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
> +	struct hyperv_drm_device *hv =3D to_hv(pipe->crtc.dev);
> +	struct drm_plane_state *state =3D pipe->plane.state;
> +	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_p=
lane_state(state);
> +	struct drm_rect rect;
> +
> +	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
> +		hyperv_blit_to_vram_rect(state->fb, &shadow_plane_state->map[0], &re=
ct);
> +		hyperv_update_dirt(hv->hdev, &rect);
> +	}
> +}
> +
> +static const struct drm_simple_display_pipe_funcs hyperv_pipe_funcs =3D=20
{
> +	.enable	=3D hyperv_pipe_enable,
> +	.check =3D hyperv_pipe_check,
> +	.update	=3D hyperv_pipe_update,
> +	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
> +};
> +
> +static const uint32_t hyperv_formats[] =3D {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const uint64_t hyperv_modifiers[] =3D {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static inline int hyperv_pipe_init(struct hyperv_drm_device *hv)
> +{
> +	int ret;
> +
> +	ret =3D drm_simple_display_pipe_init(&hv->dev,
> +					   &hv->pipe,
> +					   &hyperv_pipe_funcs,
> +					   hyperv_formats,
> +					   ARRAY_SIZE(hyperv_formats),
> +					   NULL,
> +					   &hv->connector);
> +	if (ret)
> +		return ret;
> +
> +	drm_plane_enable_fb_damage_clips(&hv->pipe.plane);
> +
> +	return 0;
> +}
> +
> +static struct drm_framebuffer*
> +hyperv_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> +		 const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	return drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);

No pointless wrappers, please. Use this function directly.

Best regards
Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Neam4BtIO27y9qcLDhKUuuLNiMUJUdbzc--

--aIcC0y7qSlP6sAr9e3Ian4h2cQr0vYwvN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCidKwFAwAAAAAACgkQlh/E3EQov+BF
CxAAsecNCXT+5iECbxM08uOnThSRWwECruKKTIQ/TauHc0NIfRMhMaAJAgNAuyumdh0o5B0eoW/l
/AZdZXPddE0rYXFIB/bZnMrE+ycERoDOPF+LqCH3DXoGQjP1PdtN5Fc7Vp2LASRc7soHAsvmYAHs
/xfn1Ed1rQ7J86TvWJ24eu3BLRYpSj/G6jyiKde+sT1ZxuBCbufu4bm3z5XpYfZ2A3B02DD4M+VS
oz1+Vq7zaNFhGTtiHKAHOD66utnZgpUrmh6uftS7GFQ9u+zecpMO4yh0NCGuiTB9Nen6T6o4UxEK
WoLFsLTrdpb/eEyfwttYcOHcYFPBeLYQC4JxQJLflw+y7Wa4O6QXPRXlWBubtvjzrybhlQq1/qa5
olFLqUxOOoB5lzd+tdHdQr0GjAzYpHVbxaSdc5UuWO29va7SDdXJz1UGK25Dw2Bq6Axp7HhHmV6y
Qcx8mILY5bwtb0UXWQsoag0dVMSQxjqK5MLBp2gGo5k/TrZvE0zFGysA3G0DWae/bJLkpoLkxTPT
EmxkEw4gAuWpPOAJSfgg2MEv+pS8EjuFr90qc2pxwqy+l9HiNle/8z9mOQaxGkBLmX6u7nZzsRoc
+mnC+9wSZ71qyi+2Fz+4JLEF8BD0M18b5PdiaXVWWCQvbJ2dayMGQV/jOu1sANhJYYuBU3Smzpmf
ulY=
=3cXZ
-----END PGP SIGNATURE-----

--aIcC0y7qSlP6sAr9e3Ian4h2cQr0vYwvN--
