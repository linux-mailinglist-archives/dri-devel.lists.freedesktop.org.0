Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8A358077
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DAF6EA6B;
	Thu,  8 Apr 2021 10:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E026EA6B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:21:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53C0BB00E;
 Thu,  8 Apr 2021 10:21:45 +0000 (UTC)
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b1c03605-1304-003c-beb2-ca096a549fb4@suse.de>
Date: Thu, 8 Apr 2021 12:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210222132822.7830-3-kevin3.tang@gmail.com>
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
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0889992665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0889992665==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lE6DmzEyAHqDlMP7IEx2V0L1vNflswE6z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lE6DmzEyAHqDlMP7IEx2V0L1vNflswE6z
Content-Type: multipart/mixed; boundary="kDqB8UwgFyqCVBULiMQXEcy7g202R1nWb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
Message-ID: <b1c03605-1304-003c-beb2-ca096a549fb4@suse.de>
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
In-Reply-To: <20210222132822.7830-3-kevin3.tang@gmail.com>

--kDqB8UwgFyqCVBULiMQXEcy7g202R1nWb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I have just a few nits below plus the points that others made.

Am 22.02.21 um 14:28 schrieb Kevin Tang:
> Adds drm support for the Unisoc's display subsystem.
>=20
> This is drm kms driver, this driver provides support for the
> application framework in Android, Yocto and more.
>=20
> Application framework can access Unisoc's display internel
> peripherals through libdrm or libkms, it's test ok by modetest
> (DRM/KMS test tool) and Android HWComposer.
>=20
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
>=20
> v4:
>    - Move the devm_drm_dev_alloc to master_ops->bind function.
>    - The managed drmm_mode_config_init() it is no longer necessary for =
drivers to explicitly call drm_mode_config_cleanup, so delete it.
> ---
>   drivers/gpu/drm/Kconfig         |   2 +
>   drivers/gpu/drm/Makefile        |   1 +
>   drivers/gpu/drm/sprd/Kconfig    |  12 ++
>   drivers/gpu/drm/sprd/Makefile   |   5 +
>   drivers/gpu/drm/sprd/sprd_drm.c | 217 +++++++++++++++++++++++++++++++=
+
>   drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
>   6 files changed, 253 insertions(+)
>   create mode 100644 drivers/gpu/drm/sprd/Kconfig
>   create mode 100644 drivers/gpu/drm/sprd/Makefile
>   create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>   create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 8bf103de1..9d6ce2867 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -382,6 +382,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
>  =20
>   source "drivers/gpu/drm/xlnx/Kconfig"
>  =20
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>   # Keep legacy drivers last
>  =20
>   menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 02c229392..42d211d9c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
>   obj-$(CONFIG_DRM_MCDE) +=3D mcde/
>   obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
>   obj-y			+=3D xlnx/
> +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> new file mode 100644
> index 000000000..6e80cc9f3
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

Maybe keep the selects sorted by alphabet to make it more readable.

> +	help
> +	  Choose this option if you have a Unisoc chipset.
> +	  If M is selected the module will be called sprd_drm.
> +
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makef=
ile
> new file mode 100644
> index 000000000..86d95d93a
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +subdir-ccflags-y +=3D -I$(srctree)/$(src)
> +
> +obj-y :=3D sprd_drm.o
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/spr=
d_drm.c
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
> +#define DRIVER_NAME	"sprd"
> +#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE	"20200201"
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
> +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> +
> +static struct drm_driver sprd_drm_drv =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			=3D &sprd_drm_fops,
> +
> +	/* GEM Operations */
> +	DRM_GEM_CMA_DRIVER_OPS,
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
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct drm_device *drm;
> +	struct sprd_drm *sprd;
> +	int ret;
> +
> +	sprd =3D devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm, drm)=
;
> +	if (IS_ERR(sprd))
> +		return PTR_ERR(sprd);
> +
> +	drm =3D &sprd->drm;
> +	platform_set_drvdata(pdev, drm);
> +
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	sprd_drm_mode_config_init(drm);
> +
> +	/* bind and init sub drivers */
> +	ret =3D component_bind_all(drm->dev, drm);
> +	if (ret) {
> +		drm_err(drm, "failed to bind all component.\n");
> +		return ret;
> +	}
> +
> +	/* vblank init */
> +	ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize vblank.\n");
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
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret < 0)
> +		goto err_kms_helper_poll_fini;
> +
> +	return 0;
> +
> +err_kms_helper_poll_fini:
> +	drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +	component_unbind_all(drm->dev, drm);
> +	return ret;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +
> +	drm_dev_unregister(drm);
> +
> +	drm_kms_helper_poll_fini(drm);
> +
> +	component_unbind_all(drm->dev, drm);
> +}
> +
> +static const struct component_master_ops drm_component_ops =3D {
> +	.bind =3D sprd_drm_bind,
> +	.unbind =3D sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node =3D=3D data;
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	ret =3D dma_set_mask_and_coherent(dev, ~0UL);
> +	if (ret) {
> +		dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
> +		return ret;
> +	}
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
> +	struct drm_device *drm =3D platform_get_drvdata(pdev);
> +
> +	if (!drm) {
> +		drm_warn(drm, "drm device is not available, no shutdown\n");
> +		return;
> +	}
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static const struct of_device_id drm_match_table[] =3D {
> +	{ .compatible =3D "sprd,display-subsystem", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, drm_match_table);
> +
> +static struct platform_driver sprd_drm_driver =3D {
> +	.probe =3D sprd_drm_probe,
> +	.remove =3D sprd_drm_remove,
> +	.shutdown =3D sprd_drm_shutdown,
> +	.driver =3D {
> +		.name =3D "sprd-drm-drv",
> +		.of_match_table =3D drm_match_table,
> +	},
> +};
> +
> +static struct platform_driver *sprd_drm_drivers[]  =3D {
> +	&sprd_drm_driver,
> +};
> +
> +static int __init sprd_drm_init(void)
> +{
> +	int ret;

I think ret should just go away.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> +
> +	ret =3D platform_register_drivers(sprd_drm_drivers,
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
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/spr=
d_drm.h
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
> +	struct drm_device drm;
> +};
> +
> +#endif /* _SPRD_DRM_H_ */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kDqB8UwgFyqCVBULiMQXEcy7g202R1nWb--

--lE6DmzEyAHqDlMP7IEx2V0L1vNflswE6z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBu2TgFAwAAAAAACgkQlh/E3EQov+Ap
SQ//Wj3XL71uXamjDn+wXeY/yOwWZmltu/ihCIwtncAwcQsbngnKq92Am90WXoCCXNoSfakNw/C2
XJHfIeDwX2FA5ZWYiScTDhb22mmjDjvL2AKMxW9Npb8jCJ6LTia8G3GI4EPI84Ho8zFnuiTZVHn6
U6P/Sx7LeslT9FY6dmPxlKlhe3A0rkmTqHUqiPF6iqNSAKP5sqHXb6pSRagZS+r1kzOl2/7So4es
nb5k+7TECF5YuF1OKFlvYYUYyjtU8OK8v8OzdTW4c1dS6FTVmfQ6moAkTq3riaUVBl0sKZWLbmQR
0D+c33KtgFooWT6a3qL86m/iqVfWWmygJqyxnsj2UH85EdsgomEO1yEnGV+sP0O24PMPNDk+1a5u
/EnSXv5hfEIa/7yP9ixCZkekucOB3D3sMe2JxrodVkNwNexpWx0VXr/XH/CulD78L4DVf1rbbf9r
6Kg3ev3ROFi/b5qs1k5ZVao3xSy4C9+qrwH24Il6WG0/szAej5Fb3ZMt/lQPKbVaolxvl/LQsCrw
SfLQD4TMZEFgoBVGaLXMDdWyZ+StNShv9o8hzZle7uZ6IIez8UhLICQp+UewXbz+Qm6rVghyE6pS
TeaVh9K4d7nbYtwaZnxvDG5AMZvgHmfgSYDxtTceLcZfuEk1mT17qflP6P9HuJpspDa00j1K2PVp
TBg=
=ltlf
-----END PGP SIGNATURE-----

--lE6DmzEyAHqDlMP7IEx2V0L1vNflswE6z--

--===============0889992665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0889992665==--
