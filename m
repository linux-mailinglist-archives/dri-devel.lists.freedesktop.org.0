Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D55273B9D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49486E0BC;
	Tue, 22 Sep 2020 07:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD08B6E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:19:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04894AB5C;
 Tue, 22 Sep 2020 07:19:55 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon v2 1/2] drm/hisilicon: Support i2c driver
 algorithms for bit-shift adapters
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1600758230-13389-1-git-send-email-tiantao6@hisilicon.com>
 <1600758230-13389-2-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <201f35c0-bb69-148c-75b6-b2159b2d298f@suse.de>
Date: Tue, 22 Sep 2020 09:19:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600758230-13389-2-git-send-email-tiantao6@hisilicon.com>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============0269861766=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0269861766==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ump6erCmN18gsFm9Udde5FOcXOPbGctAx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ump6erCmN18gsFm9Udde5FOcXOPbGctAx
Content-Type: multipart/mixed; boundary="fWXUdM649jkoNHUY9cPKQkyWueofbV2Vq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <201f35c0-bb69-148c-75b6-b2159b2d298f@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/2] drm/hisilicon: Support i2c driver
 algorithms for bit-shift adapters
References: <1600758230-13389-1-git-send-email-tiantao6@hisilicon.com>
 <1600758230-13389-2-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1600758230-13389-2-git-send-email-tiantao6@hisilicon.com>

--fWXUdM649jkoNHUY9cPKQkyWueofbV2Vq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

again a few nits below.

Am 22.09.20 um 09:03 schrieb Tian Tao:
> Adding driver implementation to support i2c driver algorithms for
> bit-shift adapters, so hibmc will using the interface provided by
> drm to read edid.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

I gave this an R-b, which you should have added. The code is still the
same, so it counts.

> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile        |  2 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h | 25 ++++++-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c | 99 +++++++++++++++++=
++++++++
>  3 files changed, 124 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm=
/hisilicon/hibmc/Makefile
> index f991327..684ef79 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -hibmc-drm-y :=3D hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc=
_ttm.o
> +hibmc-drm-y :=3D hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc=
_ttm.o hibmc_drm_i2c.o
> =20
>  obj-$(CONFIG_DRM_HISI_HIBMC) +=3D hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index 197485e..704f477 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -14,11 +14,23 @@
>  #ifndef HIBMC_DRM_DRV_H
>  #define HIBMC_DRM_DRV_H
> =20
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c-algo-bit.h>
> +#include <linux/i2c.h>
> +
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_framebuffer.h>
> =20
>  struct drm_device;
> =20
> +struct hibmc_connector {
> +	struct drm_connector base;
> +
> +	struct i2c_adapter adapter;
> +	struct i2c_algo_bit_data bit_data;
> +};
> +
>  struct hibmc_drm_private {
>  	/* hw */
>  	void __iomem   *mmio;
> @@ -31,10 +43,20 @@ struct hibmc_drm_private {
>  	struct drm_plane primary_plane;
>  	struct drm_crtc crtc;
>  	struct drm_encoder encoder;
> -	struct drm_connector connector;
> +	struct hibmc_connector connector;
>  	bool mode_config_initialized;
>  };
> =20
> +static inline struct hibmc_connector *to_hibmc_connector(struct drm_co=
nnector *connector)
> +{
> +	return container_of(connector, struct hibmc_connector, base);
> +}
> +
> +static inline struct hibmc_drm_private *to_hibmc_drm_private(struct hi=
bmc_connector *connector)
> +{
> +	return container_of(connector, struct hibmc_drm_private, connector);
> +}

That's not how it was supposed to be. What I meant was, that the
function should take struct drm_device and return struct
hibmc_drm_private from dev->dev_private. Sorry about the confusion.

> +
>  void hibmc_set_power_mode(struct hibmc_drm_private *priv,
>  			  unsigned int power_mode);
>  void hibmc_set_current_gate(struct hibmc_drm_private *priv,
> @@ -47,6 +69,7 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc);
>  void hibmc_mm_fini(struct hibmc_drm_private *hibmc);
>  int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>  		      struct drm_mode_create_dumb *args);
> +int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_connecto=
r *connector);
> =20
>  extern const struct drm_mode_config_funcs hibmc_mode_funcs;
> =20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> new file mode 100644
> index 0000000..5e4674b
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Hisilicon Hibmc SoC drm driver
> + *
> + * Based on the bochs drm driver.
> + *
> + * Copyright (c) 2016 Huawei Limited.
> + *
> + * Author:
> + *      Tian Tao <tiantao6@hisilicon.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/pci.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "hibmc_drm_drv.h"
> +
> +#define GPIO_DATA		0x0802A0
> +#define GPIO_DATA_DIRECTION	0x0802A4
> +
> +#define GPIO_SCL_MASK 0x1
> +#define GPIO_SDA_MASK  0x2

The indention of these two lines is still weird. The constants are not
aligned. I'd also suggest to use the BIT() macro to set the constants.

Best regards
Thomas

> +
> +static void hibmc_set_i2c_signal(void *data, u32 mask, int value)
> +{
> +	struct hibmc_connector *hibmc_connector =3D data;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(hibmc_connect=
or);
> +	u32 tmp_dir =3D readl(priv->mmio + GPIO_DATA_DIRECTION);
> +
> +	if (value) {
> +		tmp_dir &=3D ~mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	} else {
> +		u32 tmp_data =3D readl(priv->mmio + GPIO_DATA);
> +
> +		tmp_data &=3D ~mask;
> +		writel(tmp_data, priv->mmio + GPIO_DATA);
> +
> +		tmp_dir |=3D mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	}
> +}
> +
> +static int hibmc_get_i2c_signal(void *data, u32 mask)
> +{
> +	struct hibmc_connector *hibmc_connector =3D data;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(hibmc_connect=
or);
> +	u32 tmp_dir =3D readl(priv->mmio + GPIO_DATA_DIRECTION);
> +
> +	if ((tmp_dir & mask) !=3D mask) {
> +		tmp_dir &=3D ~mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	}
> +
> +	return (readl(priv->mmio + GPIO_DATA) & mask) ? 1 : 0;
> +}
> +
> +static void hibmc_ddc_setsda(void *data, int state)
> +{
> +	hibmc_set_i2c_signal(data, GPIO_SDA_MASK, state);
> +}
> +
> +static void hibmc_ddc_setscl(void *data, int state)
> +{
> +	hibmc_set_i2c_signal(data, GPIO_SCL_MASK, state);
> +}
> +
> +static int hibmc_ddc_getsda(void *data)
> +{
> +	return hibmc_get_i2c_signal(data, GPIO_SDA_MASK);
> +}
> +
> +static int hibmc_ddc_getscl(void *data)
> +{
> +	return hibmc_get_i2c_signal(data, GPIO_SCL_MASK);
> +}
> +
> +int hibmc_ddc_create(struct drm_device * drm_dev,
> +		     struct hibmc_connector *connector)
> +{
> +	connector->adapter.owner =3D THIS_MODULE;
> +	connector->adapter.class =3D I2C_CLASS_DDC;
> +	snprintf(connector->adapter.name, I2C_NAME_SIZE, "HIS i2c bit bus");
> +	connector->adapter.dev.parent =3D &drm_dev->pdev->dev;
> +	i2c_set_adapdata(&connector->adapter, connector);
> +	connector->adapter.algo_data =3D &connector->bit_data;
> +
> +	connector->bit_data.udelay =3D 20;
> +	connector->bit_data.timeout =3D usecs_to_jiffies(2000);
> +	connector->bit_data.data =3D connector;
> +	connector->bit_data.setsda =3D hibmc_ddc_setsda;
> +	connector->bit_data.setscl =3D hibmc_ddc_setscl;
> +	connector->bit_data.getsda =3D hibmc_ddc_getsda;
> +	connector->bit_data.getscl =3D hibmc_ddc_getscl;
> +
> +	return i2c_bit_add_bus(&connector->adapter);
> +}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--fWXUdM649jkoNHUY9cPKQkyWueofbV2Vq--

--ump6erCmN18gsFm9Udde5FOcXOPbGctAx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9ppXIUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiM6hgf/YdWVald3I2HyPWUJENhu8V8Toy/a
JQaiuy3f59P4/aAfAxzH+DR8ehlRQYm3HpPzJPR95NcAipWJrWW4DCp8J12sG9+J
cklSBCSRblJiyAh/QU2D5UR4XpF5+TO5r7E1leGsChNXixirrDBeTC0u6eH0leX/
dYxn53YARFtyHecG13rIkHssYoh8dYOzrXGVlnNGNiL1apStrP8mBXHLF3D3Dg3U
/jSxlHXuAT6oMGTVZ+t/tsTdV1V3+QReiEQNi+tgujKIQOXw507UyHWRk+DkSLC4
JWGyBC/cmYGuEXfzK0zHVabqEAH7MhmVowynnncQd0UbkQz1ycn70viDsw==
=sCLD
-----END PGP SIGNATURE-----

--ump6erCmN18gsFm9Udde5FOcXOPbGctAx--

--===============0269861766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0269861766==--
