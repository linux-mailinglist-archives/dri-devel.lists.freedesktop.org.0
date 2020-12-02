Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE12CB7F6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 10:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129D36E967;
	Wed,  2 Dec 2020 09:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A546E967
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 09:02:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65228AD6B;
 Wed,  2 Dec 2020 09:02:41 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon 1/3] drm/hisilicon: Code refactoring for
 hibmc_drm_drv
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <1606898835-40775-1-git-send-email-tiantao6@hisilicon.com>
 <1606898835-40775-2-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f6c14465-53a5-1cd3-df8a-d1895ca20656@suse.de>
Date: Wed, 2 Dec 2020 10:02:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606898835-40775-2-git-send-email-tiantao6@hisilicon.com>
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
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1668711281=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1668711281==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AbhEZOftm6WrJ77dVLizq5s8n885JMqqg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AbhEZOftm6WrJ77dVLizq5s8n885JMqqg
Content-Type: multipart/mixed; boundary="zt6zkTPzu4MAG0Ir5xMeJLvbCCn3g5BBB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <f6c14465-53a5-1cd3-df8a-d1895ca20656@suse.de>
Subject: Re: [PATCH drm/hisilicon 1/3] drm/hisilicon: Code refactoring for
 hibmc_drm_drv
References: <1606898835-40775-1-git-send-email-tiantao6@hisilicon.com>
 <1606898835-40775-2-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1606898835-40775-2-git-send-email-tiantao6@hisilicon.com>

--zt6zkTPzu4MAG0Ir5xMeJLvbCCn3g5BBB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 02.12.20 um 09:47 schrieb Tian Tao:
> Use the devm_drm_dev_alloc provided by the drm framework to alloc
> a structure hibmc_drm_private.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

This looks good now. Thanks for sticking to it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   |  2 +-
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 46 +++++++++++----=
---------
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  |  4 +--
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  2 +-
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c      |  8 +++--
>   5 files changed, 30 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index ea962ac..096eea9 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -499,7 +499,7 @@ static const struct drm_crtc_helper_funcs hibmc_crt=
c_helper_funcs =3D {
>  =20
>   int hibmc_de_init(struct hibmc_drm_private *priv)
>   {
> -	struct drm_device *dev =3D priv->dev;
> +	struct drm_device *dev =3D &priv->dev;
>   	struct drm_crtc *crtc =3D &priv->crtc;
>   	struct drm_plane *plane =3D &priv->primary_plane;
>   	int ret;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index d845657..13e8a28 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -79,31 +79,32 @@ static const struct dev_pm_ops hibmc_pm_ops =3D {
>  =20
>   static int hibmc_kms_init(struct hibmc_drm_private *priv)
>   {
> +	struct drm_device *dev =3D &priv->dev;
>   	int ret;
>  =20
> -	drm_mode_config_init(priv->dev);
> +	drm_mode_config_init(dev);
>   	priv->mode_config_initialized =3D true;
>  =20
> -	priv->dev->mode_config.min_width =3D 0;
> -	priv->dev->mode_config.min_height =3D 0;
> -	priv->dev->mode_config.max_width =3D 1920;
> -	priv->dev->mode_config.max_height =3D 1200;
> +	dev->mode_config.min_width =3D 0;
> +	dev->mode_config.min_height =3D 0;
> +	dev->mode_config.max_width =3D 1920;
> +	dev->mode_config.max_height =3D 1200;
>  =20
> -	priv->dev->mode_config.fb_base =3D priv->fb_base;
> -	priv->dev->mode_config.preferred_depth =3D 32;
> -	priv->dev->mode_config.prefer_shadow =3D 1;
> +	dev->mode_config.fb_base =3D priv->fb_base;
> +	dev->mode_config.preferred_depth =3D 32;
> +	dev->mode_config.prefer_shadow =3D 1;
>  =20
> -	priv->dev->mode_config.funcs =3D (void *)&hibmc_mode_funcs;
> +	dev->mode_config.funcs =3D (void *)&hibmc_mode_funcs;
>  =20
>   	ret =3D hibmc_de_init(priv);
>   	if (ret) {
> -		drm_err(priv->dev, "failed to init de: %d\n", ret);
> +		drm_err(dev, "failed to init de: %d\n", ret);
>   		return ret;
>   	}
>  =20
>   	ret =3D hibmc_vdac_init(priv);
>   	if (ret) {
> -		drm_err(priv->dev, "failed to init vdac: %d\n", ret);
> +		drm_err(dev, "failed to init vdac: %d\n", ret);
>   		return ret;
>   	}
>  =20
> @@ -113,7 +114,7 @@ static int hibmc_kms_init(struct hibmc_drm_private =
*priv)
>   static void hibmc_kms_fini(struct hibmc_drm_private *priv)
>   {
>   	if (priv->mode_config_initialized) {
> -		drm_mode_config_cleanup(priv->dev);
> +		drm_mode_config_cleanup(&priv->dev);
>   		priv->mode_config_initialized =3D false;
>   	}
>   }
> @@ -202,7 +203,7 @@ static void hibmc_hw_config(struct hibmc_drm_privat=
e *priv)
>  =20
>   static int hibmc_hw_map(struct hibmc_drm_private *priv)
>   {
> -	struct drm_device *dev =3D priv->dev;
> +	struct drm_device *dev =3D &priv->dev;
>   	struct pci_dev *pdev =3D dev->pdev;
>   	resource_size_t addr, size, ioaddr, iosize;
>  =20
> @@ -258,17 +259,9 @@ static int hibmc_unload(struct drm_device *dev)
>  =20
>   static int hibmc_load(struct drm_device *dev)
>   {
> -	struct hibmc_drm_private *priv;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
>   	int ret;
>  =20
> -	priv =3D drmm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		drm_err(dev, "no memory to allocate for hibmc_drm_private\n");
> -		return -ENOMEM;
> -	}
> -	dev->dev_private =3D priv;
> -	priv->dev =3D dev;
> -
>   	ret =3D hibmc_hw_init(priv);
>   	if (ret)
>   		goto err;
> @@ -310,6 +303,7 @@ static int hibmc_load(struct drm_device *dev)
>   static int hibmc_pci_probe(struct pci_dev *pdev,
>   			   const struct pci_device_id *ent)
>   {
> +	struct hibmc_drm_private *priv;
>   	struct drm_device *dev;
>   	int ret;
>  =20
> @@ -318,12 +312,14 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>   	if (ret)
>   		return ret;
>  =20
> -	dev =3D drm_dev_alloc(&hibmc_driver, &pdev->dev);
> -	if (IS_ERR(dev)) {
> +	priv =3D devm_drm_dev_alloc(&pdev->dev, &hibmc_driver,
> +				  struct hibmc_drm_private, dev);
> +	if (IS_ERR(priv)) {
>   		DRM_ERROR("failed to allocate drm_device\n");
> -		return PTR_ERR(dev);
> +		return PTR_ERR(priv);
>   	}
>  =20
> +	dev =3D &priv->dev;
>   	dev->pdev =3D pdev;
>   	pci_set_drvdata(pdev, dev);
>  =20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index f310a83..7e0c756 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -37,7 +37,7 @@ struct hibmc_drm_private {
>   	resource_size_t  fb_size;
>  =20
>   	/* drm */
> -	struct drm_device  *dev;
> +	struct drm_device dev;
>   	struct drm_plane primary_plane;
>   	struct drm_crtc crtc;
>   	struct drm_encoder encoder;
> @@ -52,7 +52,7 @@ static inline struct hibmc_connector *to_hibmc_connec=
tor(struct drm_connector *c
>  =20
>   static inline struct hibmc_drm_private *to_hibmc_drm_private(struct d=
rm_device *dev)
>   {
> -	return dev->dev_private;
> +	return container_of(dev, struct hibmc_drm_private, dev);
>   }
>  =20
>   void hibmc_set_power_mode(struct hibmc_drm_private *priv,
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 74e26c2..d35548d 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -96,7 +96,7 @@ static const struct drm_encoder_funcs hibmc_encoder_f=
uncs =3D {
>  =20
>   int hibmc_vdac_init(struct hibmc_drm_private *priv)
>   {
> -	struct drm_device *dev =3D priv->dev;
> +	struct drm_device *dev =3D &priv->dev;
>   	struct hibmc_connector *hibmc_connector =3D &priv->connector;
>   	struct drm_encoder *encoder =3D &priv->encoder;
>   	struct drm_connector *connector =3D &hibmc_connector->base;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/=
drm/hisilicon/hibmc/hibmc_ttm.c
> index 602ece1..e84fb81 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -25,7 +25,7 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc)
>   {
>   	struct drm_vram_mm *vmm;
>   	int ret;
> -	struct drm_device *dev =3D hibmc->dev;
> +	struct drm_device *dev =3D &hibmc->dev;
>  =20
>   	vmm =3D drm_vram_helper_alloc_mm(dev,
>   				       pci_resource_start(dev->pdev, 0),
> @@ -41,10 +41,12 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc)
>  =20
>   void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
>   {
> -	if (!hibmc->dev->vram_mm)
> +	struct drm_device *dev =3D &hibmc->dev;
> +
> +	if (!dev->vram_mm)
>   		return;
>  =20
> -	drm_vram_helper_release_mm(hibmc->dev);
> +	drm_vram_helper_release_mm(dev);
>   }
>  =20
>   int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zt6zkTPzu4MAG0Ir5xMeJLvbCCn3g5BBB--

--AbhEZOftm6WrJ77dVLizq5s8n885JMqqg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HWC8FAwAAAAAACgkQlh/E3EQov+D1
nRAAvVR06sxKEasI0jqbOUzm13e9yc3ej9DChGJJ8xsI8jcxGKW668EFlGdCatl9FW/wshDFr2rv
8NooUd3pXjUw/lp/ufMmK6I2zVNP5a8cvQp0Uq4IA9jpzdC3aRK+8UssJP8553YB/o985Hiirl0F
AsElrQCmK6d5A+hhUVfMm/MR7FX17FfH0pm0wykvhG/7TDgDiIZaI33lNUH3YMjbwt+B7m/8lbTa
+5McanOTU4HsUtNYD07i8CxG3LW4nl2sSz4S9JBVn8t77fSBLTZ4G3eAIXjO0Yhlus5yt+Jdu+jg
9U6v4X4oz+t1wzxTWHtxMLf4fM/0eJHHizkafBIkYx6hHl4tyMgPi5ku+kDNulc9QOFSgaq4CFYI
z4j9ZU24ulHqArUz90cRcEUwTE6aQxKS3h1PwU2mEZmlOsdBFZxeHr87qVBg6UttUHeSv6Cjh+A9
xK3U4n8lF/iGLtpn2nI9cGsxwrUI9Chefuq1yQuVcPOM1Jl2wUgxWQFoOh9ayloGkHUpb6mOFcxr
wxn5v0qWDV3cyFgpoKh/iI5uh3zyC0rt4SHZl5rx0fzkP3zLbnxzSgXy1Wlw4IOmeNy/Q1bGyngb
EjVLwCsU0HU5cnnlAgKA7hVPczOa6RJBJQZijNecFFoFgL8fY9lV8j/3KVpgiDISMwzn8y7hA0yi
YVM=
=n4Zv
-----END PGP SIGNATURE-----

--AbhEZOftm6WrJ77dVLizq5s8n885JMqqg--

--===============1668711281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1668711281==--
