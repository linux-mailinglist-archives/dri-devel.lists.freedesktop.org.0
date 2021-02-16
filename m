Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE031C744
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 09:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881A289BBD;
	Tue, 16 Feb 2021 08:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E34A89C19
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 08:21:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55264B12E;
 Tue, 16 Feb 2021 08:21:49 +0000 (UTC)
To: Deepak Rawat <drawat.floss@gmail.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210216003959.802492-1-drawat.floss@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Message-ID: <d72cd2c5-5896-d181-cca2-d5addd1cdeae@suse.de>
Date: Tue, 16 Feb 2021 09:21:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216003959.802492-1-drawat.floss@gmail.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0784200228=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0784200228==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kAbq0s8vQ9Qpaac7xn8GNeTsxbseWXqvB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kAbq0s8vQ9Qpaac7xn8GNeTsxbseWXqvB
Content-Type: multipart/mixed; boundary="JJEMR8bspGJ4EwCcH0a0T6KeJNDxvP4MS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Deepak Rawat <drawat.floss@gmail.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Dexuan Cui <decui@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Hu <weh@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>
Message-ID: <d72cd2c5-5896-d181-cca2-d5addd1cdeae@suse.de>
Subject: Re: [PATCH v3 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
References: <20210216003959.802492-1-drawat.floss@gmail.com>
In-Reply-To: <20210216003959.802492-1-drawat.floss@gmail.com>

--JJEMR8bspGJ4EwCcH0a0T6KeJNDxvP4MS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

fantastic. Thanks for sending an update. There's been a some bitrot=20
meanwhile. Review below.

Am 16.02.21 um 01:39 schrieb Deepak Rawat:
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
> Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
> ---
>   drivers/gpu/drm/Kconfig                     |  12 +
>   drivers/gpu/drm/Makefile                    |   1 +
>   drivers/gpu/drm/hyperv/Makefile             |   8 +
>   drivers/gpu/drm/hyperv/hyperv_drm.h         |  51 ++
>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c     | 313 +++++++++++++
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 240 ++++++++++
>   drivers/gpu/drm/hyperv/hyperv_drm_proto.c   | 486 +++++++++++++++++++=
+
>   7 files changed, 1111 insertions(+)
>   create mode 100644 drivers/gpu/drm/hyperv/Makefile
>   create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm.h
>   create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>   create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>   create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_proto.c
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 8bf103de1594..c17f4e9dcd82 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -382,6 +382,18 @@ source "drivers/gpu/drm/tidss/Kconfig"
>  =20
>   source "drivers/gpu/drm/xlnx/Kconfig"
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
> index 926adef289db..294e321cd23f 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -125,3 +125,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
>   obj-$(CONFIG_DRM_MCDE) +=3D mcde/
>   obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
>   obj-y			+=3D xlnx/
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
> +
> +obj-$(CONFIG_DRM_HYPERV) +=3D hyperv_drm.o
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hype=
rv/hyperv_drm.h
> new file mode 100644
> index 000000000000..4f8c627b303a
> --- /dev/null
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2012-2021 Microsoft
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
> +
> +static int hyperv_get_vram_gen1(struct hyperv_drm_device *hv)
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

This functon is not actually related to vram, but kicks out any drivers=20
that might currently use the hardware. I'd try to do this outside  of=20
the vram mapping code. Anyway, your choice.

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
> +	if (hv->fb_base =3D=3D 0) {

The prefered style is

   if (!hw->fb_base)

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
> +static int hyperv_get_vram_gen2(struct hyperv_drm_device *hv,
> +				struct hv_device *hdev)
> +{
> +	struct drm_device *dev =3D &hv->dev;
> +	struct apertures_struct *ap;
> +	int ret;
> +
> +	hv->fb_size =3D (unsigned long)(hv->mmio_megabytes * 1024 * 1024);
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
> +	hv->vram =3D ioremap_cache(hv->mem->start, hv->fb_size); > +	if (!hv-=
>vram) {
> +		drm_err(dev, "Failed to map vram\n");
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	hv->fb_base =3D hv->mem->start;
> +
> +	ap =3D alloc_apertures(1);
> +	if (!ap) {
> +		drm_err(dev, "Failed to get apertures\n");
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	ap->ranges[0].base =3D screen_info.lfb_base;
> +	ap->ranges[0].size =3D screen_info.lfb_size;
> +	remove_conflicting_framebuffers(ap, KBUILD_MODNAME, false);

You have to use drm_fb_helper_remove_conflicting_framebuffers() here.=20
remove_conflicting framebuffers() requires frambuffer support=20
(CONFIG_FB). Not setting this option would break your driver's build.

Also, I'd call this as early as possible. As I said, this removes other=20
drivers. And you want to get rid of them as soon as possible to avoid=20
interference.

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
> +	/* Get the actual VRAM size from the device */
> +	ret =3D hyperv_connect_vsp(hdev);
> +	if (ret) {
> +		drm_err(dev, "Failed to connect to vmbus.\n");
> +		goto err_hv_set_drv_data;
> +	}
> +
> +	if (efi_enabled(EFI_BOOT))
> +		ret =3D hyperv_get_vram_gen2(hv, hdev);
> +	else
> +		ret =3D hyperv_get_vram_gen1(hv);
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
> +	struct hyperv_drm_device *hv =3D to_hv(fb->dev);
> +	struct dma_buf_map map;
> +	void *vmap;
> +	int idx, ret;
> +
> +	if (!drm_dev_enter(&hv->dev, &idx))
> +		return -ENODEV;
> +
> +	ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
> +	if (ret) {
> +		drm_dev_exit(idx);
> +		return ret;
> +	}

This code bitrotted. Calling vmap during the atomic scren update could=20
lead to a deadlock. So it's not actually allowed. We got away with it so =

far, but I recently cleaned this up. Vmappings have to be=20
established/removed in prepare_fb and cleanup_fb.

But there's a helper to do that. drm_gem_atomic_helper.h contains=20
plane-state functionality for shadow-buffered planes. It provies the=20
mapping for your code. You won't have to do aynthing.

It looks like you based your code on the cirrus driver? If so, have a=20
look at

=20
https://lore.kernel.org/dri-devel/20210204200308.24216-5-tzimmermann@suse=
=2Ede/

so see hwo to convert to shadow-buffer helpers.

> +
> +	vmap =3D map.vaddr;
> +	drm_fb_memcpy_dstclip(hv->vram, vmap, fb, rect);
> +	drm_gem_shmem_vunmap(fb->obj[0], vmap);
> +	drm_dev_exit(idx);
> +
> +	return 0;
> +}
> +
> +static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb)
> +{
> +	struct drm_rect fullscreen =3D {
> +		.x1 =3D 0,
> +		.x2 =3D fb->width,
> +		.y1 =3D 0,
> +		.y2 =3D fb->height,
> +	};
> +	return hyperv_blit_to_vram_rect(fb, &fullscreen);
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
> +static int hyperv_conn_init(struct hyperv_drm_device *hv)
> +{
> +	drm_connector_helper_add(&hv->connector, &hyperv_connector_helper_fun=
cs);
> +	return drm_connector_init(&hv->dev, &hv->connector,
> +				  &hyperv_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VGA);
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
> +	struct drm_rect rect;
> +
> +	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
> +		hyperv_blit_to_vram_rect(state->fb, &rect);
> +		hyperv_update_dirt(hv->hdev, &rect);
> +	}
> +}
> +
> +static const struct drm_simple_display_pipe_funcs hyperv_pipe_funcs =3D=
 {
> +	.enable	=3D hyperv_pipe_enable,
> +	.check =3D hyperv_pipe_check,
> +	.update	=3D hyperv_pipe_update,
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
> +static int hyperv_pipe_init(struct hyperv_drm_device *hv)
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

Better return here if it fails.

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
> +	struct hyperv_drm_device *hv =3D to_hv(dev);
> +
> +	if (hyperv_check_size(hv, mode->hdisplay, mode->vdisplay, NULL))
> +		return MODE_BAD;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_mode_config_funcs hyperv_mode_config_funcs =3D=
 {
> +	.fb_create =3D hyperv_fb_create,
> +	.mode_valid =3D hyperv_mode_valid,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +int hyperv_mode_config_init(struct hyperv_drm_device *hv)
> +{
> +	struct drm_device *dev =3D &hv->dev;
> +	int ret;
> +
> +	ret =3D drmm_mode_config_init(dev);
> +	if (ret) {
> +		drm_err(dev, "Failed to initialized mode setting.\n");
> +		return ret;
> +	}
> +
> +	dev->mode_config.min_width =3D 0;
> +	dev->mode_config.min_height =3D 0;
> +	dev->mode_config.max_width =3D hv->screen_width_max;
> +	dev->mode_config.max_height =3D hv->screen_height_max;
> +
> +	dev->mode_config.preferred_depth =3D hv->screen_depth;
> +	dev->mode_config.prefer_shadow =3D 0;
> +
> +	dev->mode_config.funcs =3D &hyperv_mode_config_funcs;
> +
> +	ret =3D hyperv_conn_init(hv);
> +	if (ret) {
> +		drm_err(dev, "Failed to initialized connector.\n");
> +		return ret;
> +	}
> +
> +	ret =3D hyperv_pipe_init(hv);
> +	if (ret) {
> +		drm_err(dev, "Failed to initialized pipe.\n");
> +		return ret;
> +	}

Maybe just inline _conn_init() and _pipe_init(). These functions don't=20
seem to provide much.

Best regards
Thomas

> +
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/dr=
m/hyperv/hyperv_drm_proto.c
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
> +	SYNTHVID_ERROR			=3D 0,
> +	SYNTHVID_VERSION_REQUEST	=3D 1,
> +	SYNTHVID_VERSION_RESPONSE	=3D 2,
> +	SYNTHVID_VRAM_LOCATION		=3D 3,
> +	SYNTHVID_VRAM_LOCATION_ACK	=3D 4,
> +	SYNTHVID_SITUATION_UPDATE	=3D 5,
> +	SYNTHVID_SITUATION_UPDATE_ACK	=3D 6,
> +	SYNTHVID_POINTER_POSITION	=3D 7,
> +	SYNTHVID_POINTER_SHAPE		=3D 8,
> +	SYNTHVID_FEATURE_CHANGE		=3D 9,
> +	SYNTHVID_DIRT			=3D 10,
> +	SYNTHVID_RESOLUTION_REQUEST	=3D 13,
> +	SYNTHVID_RESOLUTION_RESPONSE	=3D 14,
> +
> +	SYNTHVID_MAX			=3D 15
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
> +	struct hvd_screen_info supported_resolution[SYNTHVID_MAX_RESOLUTION_C=
OUNT];
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
> +	    (SYNTHVID_VER_GET_MAJOR(ver1) =3D=3D SYNTHVID_VER_GET_MAJOR(ver2)=
 &&
> +	     SYNTHVID_VER_GET_MINOR(ver1) >=3D SYNTHVID_VER_GET_MINOR(ver2)))=

> +		return true;
> +
> +	return false;
> +}
> +
> +static inline int hyperv_sendpacket(struct hv_device *hdev, struct syn=
thvid_msg *msg)
> +{
> +	static atomic64_t request_id =3D ATOMIC64_INIT(0);
> +	struct hyperv_drm_device *hv =3D hv_get_drvdata(hdev);
> +	int ret;
> +
> +	msg->pipe_hdr.type =3D PIPE_MSG_DATA;
> +	msg->pipe_hdr.size =3D msg->vid_hdr.size;
> +
> +	ret =3D vmbus_sendpacket(hdev->channel, msg,
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
> +	struct hyperv_drm_device *hv =3D hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg =3D (struct synthvid_msg *)hv->init_buf;
> +	struct drm_device *dev =3D &hv->dev;
> +	unsigned long t;
> +	int ret =3D 0;
> +
> +	memset(msg, 0, sizeof(struct synthvid_msg));
> +	msg->vid_hdr.type =3D SYNTHVID_VERSION_REQUEST;
> +	msg->vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_version_req);
> +	msg->ver_req.version =3D ver;
> +	hyperv_sendpacket(hdev, msg);
> +
> +	t =3D wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
> +	if (!t) {
> +		drm_err(dev, "Time out on waiting version response\n");
> +		ret =3D -ETIMEDOUT;
> +		goto out;
> +	}
> +	if (!msg->ver_resp.is_accepted) {
> +		ret =3D -ENODEV;
> +		goto out;
> +	}
> +
> +	hv->synthvid_version =3D ver;
> +	drm_info(dev, "Synthvid Version major %d, minor %d\n",
> +		 SYNTHVID_VER_GET_MAJOR(ver), SYNTHVID_VER_GET_MINOR(ver));
> +
> +out:
> +	return ret;
> +}
> +
> +int hyperv_update_vram_location(struct hv_device *hdev, phys_addr_t vr=
am_pp)
> +{
> +	struct hyperv_drm_device *hv =3D hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg =3D (struct synthvid_msg *)hv->init_buf;
> +	struct drm_device *dev =3D &hv->dev;
> +	unsigned long t;
> +	int ret =3D 0;
> +
> +	memset(msg, 0, sizeof(struct synthvid_msg));
> +	msg->vid_hdr.type =3D SYNTHVID_VRAM_LOCATION;
> +	msg->vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_vram_location);
> +	msg->vram.user_ctx =3D vram_pp;
> +	msg->vram.vram_gpa =3D vram_pp;
> +	msg->vram.is_vram_gpa_specified =3D 1;
> +	hyperv_sendpacket(hdev, msg);
> +
> +	t =3D wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
> +	if (!t) {
> +		drm_err(dev, "Time out on waiting vram location ack\n");
> +		ret =3D -ETIMEDOUT;
> +		goto out;
> +	}
> +	if (msg->vram_ack.user_ctx !=3D vram_pp) {
> +		drm_err(dev, "Unable to set VRAM location\n");
> +		ret =3D -ENODEV;
> +	}
> +
> +out:
> +	return ret;
> +}
> +
> +int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp=
,
> +			    u32 w, u32 h, u32 pitch)
> +{
> +	struct synthvid_msg msg;
> +
> +	memset(&msg, 0, sizeof(struct synthvid_msg));
> +
> +	msg.vid_hdr.type =3D SYNTHVID_SITUATION_UPDATE;
> +	msg.vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_situation_update);
> +	msg.situ.user_ctx =3D 0;
> +	msg.situ.video_output_count =3D 1;
> +	msg.situ.video_output[0].active =3D active;
> +	/* vram_offset should always be 0 */
> +	msg.situ.video_output[0].vram_offset =3D 0;
> +	msg.situ.video_output[0].depth_bits =3D bpp;
> +	msg.situ.video_output[0].width_pixels =3D w;
> +	msg.situ.video_output[0].height_pixels =3D h;
> +	msg.situ.video_output[0].pitch_bytes =3D pitch;
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
> +	msg.vid_hdr.type =3D SYNTHVID_DIRT;
> +	msg.vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_dirt);
> +	msg.dirt.video_output =3D 0;
> +	msg.dirt.dirt_count =3D 1;
> +	msg.dirt.rect[0].x1 =3D rect->x1;
> +	msg.dirt.rect[0].y1 =3D rect->y1;
> +	msg.dirt.rect[0].x2 =3D rect->x2;
> +	msg.dirt.rect[0].y2 =3D rect->y2;
> +
> +	hyperv_sendpacket(hdev, &msg);
> +
> +	return 0;
> +}
> +
> +static int hyperv_get_supported_resolution(struct hv_device *hdev)
> +{
> +	struct hyperv_drm_device *hv =3D hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg =3D (struct synthvid_msg *)hv->init_buf;
> +	struct drm_device *dev =3D &hv->dev;
> +	unsigned long t;
> +	int ret =3D 0;
> +	u8 index;
> +	int i;
> +
> +	memset(msg, 0, sizeof(struct synthvid_msg));
> +	msg->vid_hdr.type =3D SYNTHVID_RESOLUTION_REQUEST;
> +	msg->vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_supported_resolution_req);
> +	msg->resolution_req.maximum_resolution_count =3D
> +		SYNTHVID_MAX_RESOLUTION_COUNT;
> +	hyperv_sendpacket(hdev, msg);
> +
> +	t =3D wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
> +	if (!t) {
> +		drm_err(dev, "Time out on waiting resolution response\n");
> +		ret =3D -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	if (msg->resolution_resp.resolution_count =3D=3D 0) {
> +		drm_err(dev, "No supported resolutions\n");
> +		ret =3D -ENODEV;
> +		goto out;
> +	}
> +
> +	index =3D msg->resolution_resp.default_resolution_index;
> +	if (index >=3D msg->resolution_resp.resolution_count) {
> +		drm_err(dev, "Invalid resolution index: %d\n", index);
> +		ret =3D -ENODEV;
> +		goto out;
> +	}
> +
> +	for (i =3D 0; i < msg->resolution_resp.resolution_count; i++) {
> +		hv->screen_width_max =3D max_t(u32, hv->screen_width_max,
> +			msg->resolution_resp.supported_resolution[i].width);
> +		hv->screen_height_max =3D max_t(u32, hv->screen_height_max,
> +			msg->resolution_resp.supported_resolution[i].height);
> +	}
> +
> +	hv->preferred_width =3D
> +		msg->resolution_resp.supported_resolution[index].width;
> +	hv->preferred_height =3D
> +		msg->resolution_resp.supported_resolution[index].height;
> +
> +out:
> +	return ret;
> +}
> +
> +static void hyperv_receive_sub(struct hv_device *hdev)
> +{
> +	struct hyperv_drm_device *hv =3D hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg;
> +
> +	if (!hv)
> +		return;
> +
> +	msg =3D (struct synthvid_msg *)hv->recv_buf;
> +
> +	/* Complete the wait event */
> +	if (msg->vid_hdr.type =3D=3D SYNTHVID_VERSION_RESPONSE ||
> +	    msg->vid_hdr.type =3D=3D SYNTHVID_RESOLUTION_RESPONSE ||
> +	    msg->vid_hdr.type =3D=3D SYNTHVID_VRAM_LOCATION_ACK) {
> +		memcpy(hv->init_buf, msg, VMBUS_MAX_PACKET_SIZE);
> +		complete(&hv->wait);
> +		return;
> +	}
> +}
> +
> +static void hyperv_receive(void *ctx)
> +{
> +	struct hv_device *hdev =3D ctx;
> +	struct hyperv_drm_device *hv =3D hv_get_drvdata(hdev);
> +	struct synthvid_msg *recv_buf;
> +	u32 bytes_recvd;
> +	u64 req_id;
> +	int ret;
> +
> +	if (!hv)
> +		return;
> +
> +	recv_buf =3D (struct synthvid_msg *)hv->recv_buf;
> +
> +	do {
> +		ret =3D vmbus_recvpacket(hdev->channel, recv_buf,
> +				       VMBUS_MAX_PACKET_SIZE,
> +				       &bytes_recvd, &req_id);
> +		if (bytes_recvd > 0 &&
> +		    recv_buf->pipe_hdr.type =3D=3D PIPE_MSG_DATA)
> +			hyperv_receive_sub(hdev);
> +	} while (bytes_recvd > 0 && ret =3D=3D 0);
> +}
> +
> +int hyperv_connect_vsp(struct hv_device *hdev)
> +{
> +	struct hyperv_drm_device *hv =3D hv_get_drvdata(hdev);
> +	struct drm_device *dev =3D &hv->dev;
> +	int ret;
> +
> +	ret =3D vmbus_open(hdev->channel, VMBUS_RING_BUFSIZE, VMBUS_RING_BUFS=
IZE,
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
> +		ret =3D hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN10);
> +		if (!ret)
> +			break;
> +		fallthrough;
> +	case VERSION_WIN8:
> +	case VERSION_WIN8_1:
> +		ret =3D hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN8);
> +		if (!ret)
> +			break;
> +		fallthrough;
> +	case VERSION_WS2008:
> +	case VERSION_WIN7:
> +		ret =3D hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN7);
> +		break;
> +	default:
> +		ret =3D hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN10);
> +		break;
> +	}
> +
> +	if (ret) {
> +		drm_err(dev, "Synthetic video device version not accepted %d\n", ret=
);
> +		goto error;
> +	}
> +
> +	if (hv->synthvid_version =3D=3D SYNTHVID_VERSION_WIN7)
> +		hv->screen_depth =3D SYNTHVID_DEPTH_WIN7;
> +	else
> +		hv->screen_depth =3D SYNTHVID_DEPTH_WIN8;
> +
> +	if (hyperv_version_ge(hv->synthvid_version, SYNTHVID_VERSION_WIN10)) =
{
> +		ret =3D hyperv_get_supported_resolution(hdev);
> +		if (ret)
> +			drm_err(dev, "Failed to get supported resolution from host, use def=
ault\n");
> +	} else {
> +		hv->screen_width_max =3D SYNTHVID_WIDTH_MAX_WIN7;
> +		hv->screen_height_max =3D SYNTHVID_HEIGHT_MAX_WIN7;
> +	}
> +
> +	hv->mmio_megabytes =3D hdev->channel->offermsg.offer.mmio_megabytes;
> +
> +	return 0;
> +
> +error:
> +	vmbus_close(hdev->channel);
> +	return ret;
> +}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--JJEMR8bspGJ4EwCcH0a0T6KeJNDxvP4MS--

--kAbq0s8vQ9Qpaac7xn8GNeTsxbseWXqvB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmArgJsFAwAAAAAACgkQlh/E3EQov+DT
phAAk+/LAq/VQpfd0iIPp1r7v5qTl9DaXJ4wCaCnPSMoi1nP5BVfpQnDuhlJHPDhSdUEjQgMqbRf
DCIqVA3R+r6HUdp+siiKCHP8CyKfJoV9aOpBZnTmH5M4G7f7z+/65D5EYvEujbAqfa0M8VCifpEP
pOd8NWPclfWAC8xogxVf8NvvLzqiZN02pscqT1YNAzc1qnImUPv0PqVXSRNkS/XVLszxbp+Dsgdx
OUKMxYIe9cdLckBwnWBtpvVK5qL0oR0HsXWQnrjSdiSkd8h7FuSaRtzfH5AtIG/oAJmxKD2SiKRS
/dylwQMaAHeCFrHVnZjLS5eCTLncv3l9Ed8z4uTqiA9z0Dg75QlNZ6zq60tlLxLIlhzouoOckq82
r0zLbPGWQ5V/HYn6KxDVx2VcCDMfZM9MR/osQLchLYnVFeG6ElEfuYmBeGVB4W+GA3cvVVSFRiSV
kPLEbpcE5Jra7XiVplnL8w3h0TrxMVRLQklOE0xRfnQ7eA2Ku2vvUXtx+xnmLhz0XtgIlYVtOE3c
SNxoeRrbTnhnciT8jWUrMQocFmwJf6qGy0kVnRDEN28B8L1aozUy8vYW2P7EGQJs05Ql5QSHOpU1
3AZzqMS6wL3/XnJdh8/HaQOAEpempCILD41GlpkwYyXdr/n5Oco1ungnsaK99ArUhMLH9s8Yd357
ChY=
=6ASx
-----END PGP SIGNATURE-----

--kAbq0s8vQ9Qpaac7xn8GNeTsxbseWXqvB--

--===============0784200228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0784200228==--
