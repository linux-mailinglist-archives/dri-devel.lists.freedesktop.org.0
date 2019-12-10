Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43918118524
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1006E88F;
	Tue, 10 Dec 2019 10:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEF16E88D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:33:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CEE0CB17A;
 Tue, 10 Dec 2019 10:33:03 +0000 (UTC)
Subject: Re: [PATCH RFC 2/8] drm/sprd: add Unisoc's drm kms master
To: Kevin Tang <kevin3.tang@gmail.com>, airlied@linux.ie, daniel@ffwll.ch
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <62c61dea-6297-1df2-0037-8c00fa36812b@suse.de>
Date: Tue, 10 Dec 2019 11:32:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
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
Cc: orsonzhai@gmail.com, baolin.wang@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
Content-Type: multipart/mixed; boundary="===============1300660421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1300660421==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="f6LkIm0BDEKlYzOCVTJtCjpyXO9IPppFJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f6LkIm0BDEKlYzOCVTJtCjpyXO9IPppFJ
Content-Type: multipart/mixed; boundary="rrPMwJ8ZNb3yioqpipyHsU5RB3yPIFL83";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Tang <kevin3.tang@gmail.com>, airlied@linux.ie, daniel@ffwll.ch
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
Message-ID: <62c61dea-6297-1df2-0037-8c00fa36812b@suse.de>
Subject: Re: [PATCH RFC 2/8] drm/sprd: add Unisoc's drm kms master
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>

--rrPMwJ8ZNb3yioqpipyHsU5RB3yPIFL83
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.12.19 um 09:36 schrieb Kevin Tang:
> From: Kevin Tang <kevin.tang@unisoc.com>
>=20
> Adds drm support for the Unisoc's display subsystem.
>=20
> This is drm device and gem driver. This driver provides support for the=

> Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>=20
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/sprd/Kconfig    |  14 ++
>  drivers/gpu/drm/sprd/Makefile   |   8 ++
>  drivers/gpu/drm/sprd/sprd_drm.c | 287 ++++++++++++++++++++++++++++++++=
++++++++
>  drivers/gpu/drm/sprd/sprd_drm.h |  19 +++
>  drivers/gpu/drm/sprd/sprd_gem.c | 178 +++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_gem.h |  30 +++++

The GEM implementation looks like DRM's CMA helpers. Can you not use CMA
helpers instead?

>  8 files changed, 539 insertions(+)
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index bfdadc3..cead12c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
> =20
>  source "drivers/gpu/drm/mcde/Kconfig"
> =20
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
> =20
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 9f1c7c4..85ca211 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  +=3D lima/
>  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/
>  obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
>  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
> +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> new file mode 100644
> index 0000000..79f286b
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,14 @@
> +config DRM_SPRD
> +	tristate "DRM Support for Unisoc SoCs Platform"
> +	depends on ARCH_SPRD
> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL
> +	select VIDEOMODE_HELPERS
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Choose this option if you have a Unisoc chipsets.
> +	  If M is selected the module will be called sprd-drm.
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makef=
ile
> new file mode 100644
> index 0000000..df0b316
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ccflags-y +=3D -Iinclude/drm
> +
> +subdir-ccflags-y +=3D -I$(src)
> +
> +obj-y :=3D sprd_drm.o \
> +	sprd_gem.o
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/spr=
d_drm.c
> new file mode 100644
> index 0000000..ec16fee
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,287 @@
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
> +#include "sprd_gem.h"
> +
> +#define DRIVER_NAME	"sprd"
> +#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE	"20180501"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_=
helper =3D {
> +	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =3D=
 {
> +	.fb_create =3D drm_gem_fb_create,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static void sprd_drm_mode_config_init(struct drm_device *drm)
> +{
> +	drm_mode_config_init(drm);
> +
> +	drm->mode_config.min_width =3D 0;
> +	drm->mode_config.min_height =3D 0;
> +	drm->mode_config.max_width =3D 8192;
> +	drm->mode_config.max_height =3D 8192;
> +	drm->mode_config.allow_fb_modifiers =3D true;
> +
> +	drm->mode_config.funcs =3D &sprd_drm_mode_config_funcs;
> +	drm->mode_config.helper_private =3D &sprd_drm_mode_config_helper;
> +}
> +
> +static const struct file_operations sprd_drm_fops =3D {
> +	.owner		=3D THIS_MODULE,
> +	.open		=3D drm_open,
> +	.release	=3D drm_release,
> +	.unlocked_ioctl	=3D drm_ioctl,
> +	.compat_ioctl	=3D drm_compat_ioctl,
> +	.poll		=3D drm_poll,
> +	.read		=3D drm_read,
> +	.llseek		=3D no_llseek,
> +	.mmap		=3D sprd_gem_cma_mmap,
> +};
> +
> +static struct drm_driver sprd_drm_drv =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET |
> +				  DRIVER_ATOMIC | DRIVER_HAVE_IRQ,
> +	.fops			=3D &sprd_drm_fops,
> +
> +	.gem_vm_ops		=3D &drm_gem_cma_vm_ops,
> +	.gem_free_object_unlocked	=3D sprd_gem_free_object,
> +	.dumb_create		=3D sprd_gem_cma_dumb_create,
> +
> +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> +	.gem_prime_import	=3D drm_gem_prime_import,
> +	.gem_prime_import_sg_table =3D sprd_gem_prime_import_sg_table,
> +
> +	.name			=3D DRIVER_NAME,
> +	.desc			=3D DRIVER_DESC,
> +	.date			=3D DRIVER_DATE,
> +	.major			=3D DRIVER_MAJOR,
> +	.minor			=3D DRIVER_MINOR,
> +};
> +
> +static int sprd_drm_bind(struct device *dev)
> +{
> +	struct drm_device *drm;
> +	struct sprd_drm *sprd;
> +	int err;
> +
> +	drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
> +	dev_set_drvdata(dev, drm);
> +
> +	sprd =3D devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> +	if (!sprd) {
> +		err =3D -ENOMEM;
> +		goto err_free_drm;
> +	}
> +	drm->dev_private =3D sprd;
> +
> +	sprd_drm_mode_config_init(drm);
> +
> +	/* bind and init sub drivers */
> +	err =3D component_bind_all(drm->dev, drm);
> +	if (err) {
> +		DRM_ERROR("failed to bind all component.\n");
> +		goto err_dc_cleanup;
> +	}
> +
> +	/* vblank init */
> +	err =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (err) {
> +		DRM_ERROR("failed to initialize vblank.\n");
> +		goto err_unbind_all;
> +	}
> +	/* with irq_enabled =3D true, we can use the vblank feature. */
> +	drm->irq_enabled =3D true;
> +
> +	/* reset all the states of crtc/plane/encoder/connector */
> +	drm_mode_config_reset(drm);
> +
> +	/* init kms poll for handling hpd */
> +	drm_kms_helper_poll_init(drm);
> +
> +	err =3D drm_dev_register(drm, 0);
> +	if (err < 0)
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
> +err_free_drm:
> +	drm_dev_put(drm);
> +	return err;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +	drm_put_dev(dev_get_drvdata(dev));
> +}
> +
> +static const struct component_master_ops sprd_drm_component_ops =3D {
> +	.bind =3D sprd_drm_bind,
> +	.unbind =3D sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	struct device_node *np =3D data;
> +
> +	DRM_DEBUG("compare %s\n", np->full_name);
> +
> +	return dev->of_node =3D=3D np;
> +}
> +
> +static int sprd_drm_component_probe(struct device *dev,
> +			   const struct component_master_ops *m_ops)
> +{
> +	struct device_node *ep, *port, *remote;
> +	struct component_match *match =3D NULL;
> +	int i;
> +
> +	if (!dev->of_node)
> +		return -EINVAL;
> +
> +	/*
> +	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
> +	 * called from encoder's .bind callbacks works as expected
> +	 */
> +	for (i =3D 0; ; i++) {
> +		port =3D of_parse_phandle(dev->of_node, "ports", i);
> +		if (!port)
> +			break;
> +
> +		if (!of_device_is_available(port->parent)) {
> +			of_node_put(port);
> +			continue;
> +		}
> +
> +		component_match_add(dev, &match, compare_of, port->parent);
> +		of_node_put(port);
> +	}
> +
> +	if (i =3D=3D 0) {
> +		dev_err(dev, "missing 'ports' property\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!match) {
> +		dev_err(dev, "no available port\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * For bound crtcs, bind the encoders attached to their remote endpoi=
nt
> +	 */
> +	for (i =3D 0; ; i++) {
> +		port =3D of_parse_phandle(dev->of_node, "ports", i);
> +		if (!port)
> +			break;
> +
> +		if (!of_device_is_available(port->parent)) {
> +			of_node_put(port);
> +			continue;
> +		}
> +
> +		for_each_child_of_node(port, ep) {
> +			remote =3D of_graph_get_remote_port_parent(ep);
> +			if (!remote || !of_device_is_available(remote)) {
> +				of_node_put(remote);
> +				continue;
> +			} else if (!of_device_is_available(remote->parent)) {
> +				dev_warn(dev, "parent device of %s is not available\n",
> +					 remote->full_name);
> +				of_node_put(remote);
> +				continue;
> +			}
> +
> +			component_match_add(dev, &match, compare_of, remote);
> +			of_node_put(remote);
> +		}
> +		of_node_put(port);
> +	}
> +
> +	return component_master_add_with_match(dev, m_ops, match);
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, ~0);
> +	if (ret)
> +		DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret);
> +
> +	return sprd_drm_component_probe(&pdev->dev, &sprd_drm_component_ops);=

> +}
> +
> +static int sprd_drm_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &sprd_drm_component_ops);
> +	return 0;
> +}
> +
> +static void sprd_drm_shutdown(struct platform_device *pdev)
> +{
> +	struct drm_device *drm =3D platform_get_drvdata(pdev);
> +
> +	if (!drm) {
> +		DRM_WARN("drm device is not available, no shutdown\n");
> +		return;
> +	}
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static const struct of_device_id sprd_drm_match_table[] =3D {
> +	{ .compatible =3D "sprd,display-subsystem",},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sprd_drm_match_table);
> +
> +static struct platform_driver sprd_drm_driver =3D {
> +	.probe =3D sprd_drm_probe,
> +	.remove =3D sprd_drm_remove,
> +	.shutdown =3D sprd_drm_shutdown,
> +	.driver =3D {
> +		.name =3D "sprd-drm-drv",
> +		.of_match_table =3D sprd_drm_match_table,
> +	},
> +};
> +
> +module_platform_driver(sprd_drm_driver);
> +
> +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/spr=
d_drm.h
> new file mode 100644
> index 0000000..e840e65
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#ifndef _SPRD_DRM_H_
> +#define _SPRD_DRM_H_
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_print.h>
> +
> +struct sprd_drm {
> +	struct drm_device *drm;
> +	struct drm_atomic_state *state;
> +	struct device *dpu_dev;
> +	struct device *gsp_dev;
> +};
> +
> +#endif /* _SPRD_DRM_H_ */
> diff --git a/drivers/gpu/drm/sprd/sprd_gem.c b/drivers/gpu/drm/sprd/spr=
d_gem.c
> new file mode 100644
> index 0000000..c617c8b
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_gem.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_prime.h>
> +
> +#include "sprd_drm.h"
> +#include "sprd_gem.h"
> +
> +static struct sprd_gem_obj *sprd_gem_obj_create(struct drm_device *drm=
,
> +						unsigned long size)
> +{
> +	struct sprd_gem_obj *sprd_gem;
> +	int ret;
> +
> +	sprd_gem =3D kzalloc(sizeof(*sprd_gem), GFP_KERNEL);
> +	if (!sprd_gem)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret =3D drm_gem_object_init(drm, &sprd_gem->base, size);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to initialize gem object\n");
> +		goto error;
> +	}
> +
> +	ret =3D drm_gem_create_mmap_offset(&sprd_gem->base);
> +	if (ret) {
> +		drm_gem_object_release(&sprd_gem->base);
> +		goto error;
> +	}
> +
> +	return sprd_gem;
> +
> +error:
> +	kfree(sprd_gem);
> +	return ERR_PTR(ret);
> +}
> +
> +void sprd_gem_free_object(struct drm_gem_object *obj)
> +{
> +	struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> +
> +	DRM_DEBUG("gem =3D %p\n", obj);
> +
> +	if (sprd_gem->vaddr)
> +		dma_alloc_wc(obj->dev->dev, obj->size,

dma_free_wc

Best regards
Thomas

[1]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/drm_gem_cma=
_helper.c


> +				      sprd_gem->vaddr, sprd_gem->dma_addr);
> +	else if (sprd_gem->sgtb)
> +		drm_prime_gem_destroy(obj, sprd_gem->sgtb);
> +
> +	drm_gem_object_release(obj);
> +
> +	kfree(sprd_gem);
> +}
> +
> +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct drm_de=
vice *drm,
> +			    struct drm_mode_create_dumb *args)
> +{
> +	struct sprd_gem_obj *sprd_gem;
> +	int ret;
> +
> +	args->pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> +	args->size =3D round_up(args->pitch * args->height, PAGE_SIZE);
> +
> +	sprd_gem =3D sprd_gem_obj_create(drm, args->size);
> +	if (IS_ERR(sprd_gem))
> +		return PTR_ERR(sprd_gem);
> +
> +	sprd_gem->vaddr =3D dma_alloc_wc(drm->dev, args->size,
> +			&sprd_gem->dma_addr, GFP_KERNEL | __GFP_NOWARN | GFP_DMA);
> +	if (!sprd_gem->vaddr) {
> +		DRM_ERROR("failed to allocate buffer with size %llu\n",
> +			  args->size);
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	ret =3D drm_gem_handle_create(file_priv, &sprd_gem->base, &args->hand=
le);
> +	if (ret)
> +		goto error;
> +
> +	drm_gem_object_put_unlocked(&sprd_gem->base);
> +
> +	return 0;
> +
> +error:
> +	sprd_gem_free_object(&sprd_gem->base);
> +	return ret;
> +}
> +
> +static int sprd_gem_cma_object_mmap(struct drm_gem_object *obj,
> +				   struct vm_area_struct *vma)
> +
> +{
> +	int ret;
> +	struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> +
> +	vma->vm_flags &=3D ~VM_PFNMAP;
> +	vma->vm_pgoff =3D 0;
> +
> +	ret =3D dma_mmap_wc(obj->dev->dev, vma,
> +				    sprd_gem->vaddr, sprd_gem->dma_addr,
> +				    vma->vm_end - vma->vm_start);
> +	if (ret)
> +		drm_gem_vm_close(vma);
> +
> +	return ret;
> +}
> +
> +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	ret =3D drm_gem_mmap(filp, vma);
> +	if (ret)
> +		return ret;
> +
> +	obj =3D vma->vm_private_data;
> +
> +	return sprd_gem_cma_object_mmap(obj, vma);
> +}
> +
> +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,
> +			    struct vm_area_struct *vma)
> +{
> +	int ret;
> +
> +	ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> +	if (ret)
> +		return ret;
> +
> +	return sprd_gem_cma_object_mmap(obj, vma);
> +}
> +
> +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct drm_gem_object=
 *obj)
> +{
> +	struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> +	struct sg_table *sgtb;
> +	int ret;
> +
> +	sgtb =3D kzalloc(sizeof(*sgtb), GFP_KERNEL);
> +	if (!sgtb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret =3D dma_get_sgtable(obj->dev->dev, sgtb, sprd_gem->vaddr,
> +			      sprd_gem->dma_addr, obj->size);
> +	if (ret) {
> +		DRM_ERROR("failed to allocate sg_table, %d\n", ret);
> +		kfree(sgtb);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return sgtb;
> +}
> +
> +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct drm_devic=
e *drm,
> +		struct dma_buf_attachment *attach, struct sg_table *sgtb)
> +{
> +	struct sprd_gem_obj *sprd_gem;
> +
> +	sprd_gem =3D sprd_gem_obj_create(drm, attach->dmabuf->size);
> +	if (IS_ERR(sprd_gem))
> +		return ERR_CAST(sprd_gem);
> +
> +	DRM_DEBUG("gem =3D %p\n", &sprd_gem->base);
> +
> +	if (sgtb->nents =3D=3D 1)
> +		sprd_gem->dma_addr =3D sg_dma_address(sgtb->sgl);
> +
> +	sprd_gem->sgtb =3D sgtb;
> +
> +	return &sprd_gem->base;
> +}
> diff --git a/drivers/gpu/drm/sprd/sprd_gem.h b/drivers/gpu/drm/sprd/spr=
d_gem.h
> new file mode 100644
> index 0000000..4c10d8a
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_gem.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#ifndef _SPRD_GEM_H_
> +#define _SPRD_GEM_H_
> +
> +#include <drm/drm_gem.h>
> +
> +struct sprd_gem_obj {
> +	struct drm_gem_object	base;
> +	dma_addr_t		dma_addr;
> +	struct sg_table		*sgtb;
> +	void			*vaddr;
> +};
> +
> +#define to_sprd_gem_obj(x)	container_of(x, struct sprd_gem_obj, base)
> +
> +void sprd_gem_free_object(struct drm_gem_object *gem);
> +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct drm_de=
vice *dev,
> +			    struct drm_mode_create_dumb *args);
> +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);
> +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,
> +			 struct vm_area_struct *vma);
> +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct drm_gem_object=
 *obj);
> +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct drm_devic=
e *dev,
> +		struct dma_buf_attachment *attach, struct sg_table *sgtb);
> +
> +#endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rrPMwJ8ZNb3yioqpipyHsU5RB3yPIFL83--

--f6LkIm0BDEKlYzOCVTJtCjpyXO9IPppFJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3vdFsACgkQaA3BHVML
eiN4Vwf/VGCWj/EGe/3YlTFEca/oX2yAnytTMsFptM8ZSbqfnk2Ml4TtJjI6uwxT
fDt78cItDKyg5tVy5UYzcV9yr9oxV7gnu+zP8swSnp2erXJrDA4FChWDpJ8QTl+B
o9HtB+TEDNsmNwsk4tS4am1aM7Hkvh/OoIaxq233MxfF3YHA0X6/Kdo7ahQFYrkP
csryfYYlkLa07kgCqzbEHdabFdC2AA0lCPKS3gap6C2DRKPPqpSIrluG79Uenhk2
8axiQBH9OVXTTLCa9pZuZEdtVRv3wQ4+mJGAHv2p7R7Jnc9Pv8UUMJJ7DTrX5bu7
IcPKJlxBcmYUSesXr6VKVWI+An4ytg==
=gMeV
-----END PGP SIGNATURE-----

--f6LkIm0BDEKlYzOCVTJtCjpyXO9IPppFJ--

--===============1300660421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1300660421==--
