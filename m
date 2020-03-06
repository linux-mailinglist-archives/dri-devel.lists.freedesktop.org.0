Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6AD17B75F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 08:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A5D6EC63;
	Fri,  6 Mar 2020 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2816EC63
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 07:24:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 132E0ABF6;
 Fri,  6 Mar 2020 07:24:38 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Add the load and unload for hibmc_driver
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
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
Message-ID: <23d99485-59c9-b466-3939-982394aab9bd@suse.de>
Date: Fri, 6 Mar 2020 08:24:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0499495866=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0499495866==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hgM94dktjnwDN88zvKY8CPwH8lBPU3BMx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hgM94dktjnwDN88zvKY8CPwH8lBPU3BMx
Content-Type: multipart/mixed; boundary="O6U3plXr6584I0RxYfo7EkxSA0bZDs7n0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <23d99485-59c9-b466-3939-982394aab9bd@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Add the load and unload for hibmc_driver
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>

--O6U3plXr6584I0RxYfo7EkxSA0bZDs7n0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.03.20 um 04:42 schrieb Tian Tao:
> using the load and unload function provided by drm framework instead of=

> doing the same work in the hibmc_pci_probe and do some code cleanup.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 62 +++++++++--------=
--------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  2 +
>  2 files changed, 24 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 79a180a..51f1c70 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -23,7 +23,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> -
> +#include <drm/drm_pci.h>
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
> =20
> @@ -49,6 +49,8 @@ static irqreturn_t hibmc_drm_interrupt(int irq, void =
*arg)
> =20
>  static struct drm_driver hibmc_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.load			=3D hibmc_load,
> +	.unload			=3D hibmc_unload,

These callbacks are deprecated and not to be used. During the last weeks
and months, we've been working on removing them from the other remaining
drivers. Therefore nak.

Best regards
Thomas

>  	.fops			=3D &hibmc_fops,
>  	.name			=3D "hibmc",
>  	.date			=3D "20160828",
> @@ -232,6 +234,21 @@ static int hibmc_hw_map(struct hibmc_drm_private *=
priv)
>  	return 0;
>  }
> =20
> +static void hibmc_hw_unmap(struct hibmc_drm_private *priv)
> +{
> +	struct drm_device *dev =3D priv->dev;
> +
> +	if (priv->mmio) {
> +		devm_iounmap(dev->dev, priv->mmio);
> +		priv->mmio =3D NULL;
> +	}
> +
> +	if (priv->fb_map) {
> +		devm_iounmap(dev->dev, priv->fb_map);
> +		priv->fb_map =3D NULL;
> +	}
> +}
> +
>  static int hibmc_hw_init(struct hibmc_drm_private *priv)
>  {
>  	int ret;
> @@ -245,7 +262,7 @@ static int hibmc_hw_init(struct hibmc_drm_private *=
priv)
>  	return 0;
>  }
> =20
> -static int hibmc_unload(struct drm_device *dev)
> +void hibmc_unload(struct drm_device *dev)
>  {
>  	struct hibmc_drm_private *priv =3D dev->dev_private;
> =20
> @@ -258,11 +275,12 @@ static int hibmc_unload(struct drm_device *dev)
> =20
>  	hibmc_kms_fini(priv);
>  	hibmc_mm_fini(priv);
> +	hibmc_hw_unmap(priv);
>  	dev->dev_private =3D NULL;
>  	return 0;
>  }
> =20
> -static int hibmc_load(struct drm_device *dev)
> +int hibmc_load(struct drm_device *dev, unsigned long flags)
>  {
>  	struct hibmc_drm_private *priv;
>  	int ret;
> @@ -332,43 +350,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		return ret;
> =20
> -	dev =3D drm_dev_alloc(&hibmc_driver, &pdev->dev);
> -	if (IS_ERR(dev)) {
> -		DRM_ERROR("failed to allocate drm_device\n");
> -		return PTR_ERR(dev);
> -	}
> -
> -	dev->pdev =3D pdev;
> -	pci_set_drvdata(pdev, dev);
> -
> -	ret =3D pci_enable_device(pdev);
> -	if (ret) {
> -		DRM_ERROR("failed to enable pci device: %d\n", ret);
> -		goto err_free;
> -	}
> -
> -	ret =3D hibmc_load(dev);
> -	if (ret) {
> -		DRM_ERROR("failed to load hibmc: %d\n", ret);
> -		goto err_disable;
> -	}
> -
> -	ret =3D drm_dev_register(dev, 0);
> -	if (ret) {
> -		DRM_ERROR("failed to register drv for userspace access: %d\n",
> -			  ret);
> -		goto err_unload;
> -	}
> -	return 0;
> -
> -err_unload:
> -	hibmc_unload(dev);
> -err_disable:
> -	pci_disable_device(pdev);
> -err_free:
> -	drm_dev_put(dev);
> -
> -	return ret;
> +	return drm_get_pci_dev(pdev, ent, &hibmc_driver);
>  }
> =20
>  static void hibmc_pci_remove(struct pci_dev *pdev)
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index 50a0c1f..4e89cd7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -37,6 +37,8 @@ void hibmc_set_power_mode(struct hibmc_drm_private *p=
riv,
>  void hibmc_set_current_gate(struct hibmc_drm_private *priv,
>  			    unsigned int gate);
> =20
> +int hibmc_load(struct drm_device *dev, unsigned long flags);
> +void hibmc_unload(struct drm_device *dev);
>  int hibmc_de_init(struct hibmc_drm_private *priv);
>  int hibmc_vdac_init(struct hibmc_drm_private *priv);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--O6U3plXr6584I0RxYfo7EkxSA0bZDs7n0--

--hgM94dktjnwDN88zvKY8CPwH8lBPU3BMx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5h+rUACgkQaA3BHVML
eiMYiQf9GqZAwiyMfHRje2Jao2QTfgw9zRcQZSH10Ip5eZcKyjtjVkaUonJ8co4m
dypcv9O7/RpRs6lmt6tMjDDzay9fUBbzF95ft9b5pSIv1ayPRQoYI55I0+T3+1n+
VYBo1yXMx8Y6MWgGgxH9+cH9qTyo2pcgp7c69dEcp0zoPy4VNCqsK0lgVF7RiPkJ
+4GE8FvMOx+HAFieDgkV7YcqD3Qg0msNWTBGeWx32ef0fOZaVZTV3+/SR2vuU7SB
6Ip94GmvFnZpfn2WezD+NImfv9AsmoygtzMi/GFGjfrxq5LUwAt7jrADUET3bl4W
RwCWP8V6yGcjjOA1ITVqju1fOHx9eg==
=Xobx
-----END PGP SIGNATURE-----

--hgM94dktjnwDN88zvKY8CPwH8lBPU3BMx--

--===============0499495866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0499495866==--
