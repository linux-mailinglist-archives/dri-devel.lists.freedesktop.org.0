Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86C2CA26E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA426E4FB;
	Tue,  1 Dec 2020 12:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCEC6E4FB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:17:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C789EACC0;
 Tue,  1 Dec 2020 12:17:17 +0000 (UTC)
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
 <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/4] drm/hisilicon: Assgin local variable
 to drm_device
Message-ID: <fc644426-67db-7128-5f73-8630373ab0e8@suse.de>
Date: Tue, 1 Dec 2020 13:17:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0496437137=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0496437137==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yyW7XNR2JX32oZQNscThp0mmeJVnEMk5k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yyW7XNR2JX32oZQNscThp0mmeJVnEMk5k
Content-Type: multipart/mixed; boundary="XPeR6lTSIpmEyGMyo250NaIOTTDjUtHpk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <fc644426-67db-7128-5f73-8630373ab0e8@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/4] drm/hisilicon: Assgin local variable
 to drm_device
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
 <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>

--XPeR6lTSIpmEyGMyo250NaIOTTDjUtHpk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 12:55 schrieb Tian Tao:
> Assign local variable to struct drm_device *dev because they are
> used multiple times within a function.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   |  2 +-
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 30 ++++++++++++---=
---------
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  |  2 +-
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  2 +-
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c      |  8 ++++---
>   5 files changed, 23 insertions(+), 21 deletions(-)
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
> index d845657..dd9fadc 100644
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
> @@ -258,7 +259,7 @@ static int hibmc_unload(struct drm_device *dev)
>  =20
>   static int hibmc_load(struct drm_device *dev)
>   {
> -	struct hibmc_drm_private *priv;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
>   	int ret;
>  =20
>   	priv =3D drmm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -267,7 +268,6 @@ static int hibmc_load(struct drm_device *dev)
>   		return -ENOMEM;
>   	}
>   	dev->dev_private =3D priv;
> -	priv->dev =3D dev;

I'm sure this either does not build or does not work. There's a call to=20
drm_dev_alloc(), which initialized the DRM device. You need to assign=20
the returned device here. The embedding of dev only work after you=20
switched to devm_drm_dev_alloc() in the next patch.

For the patch at hand, just keep struct hibmc_drm_private.dev as a=20
pointer and you should be fine.

Best regards
Thomas

>  =20
>   	ret =3D hibmc_hw_init(priv);
>   	if (ret)
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index f310a83..e35353a 100644
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


--XPeR6lTSIpmEyGMyo250NaIOTTDjUtHpk--

--yyW7XNR2JX32oZQNscThp0mmeJVnEMk5k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GNEsFAwAAAAAACgkQlh/E3EQov+A+
nRAAu2G955/ZM8WnVIRgFsof6pWGNA6TBCbRdRB8iMRBlAy32b8YUkF1mi0zFMiTiqwjw+GZdyO1
46+pCCgMRYwys47LAG0KIeS6HU/4yE4Cf7hrpOLo/Dht+tzL8hkVsRdTUXQVtAo0+w28Kkgi+OVV
vFnqmn+H7/ZSR48qSxLusHR1C5Q6/ydDd6nZ4e0aauLOFijRVLYYny8couuQ7v2ATx5DIrDl2ogj
NQlGnV9pedsBSsxNbM6+iTuImEW/xK87ketFc4oLXTaHmSlZmkB6VO6IUGG4IuTIxfLAbIf0OLib
j69XpDfqkndtXSH6/QBEJeXzqg0GayICbbK8ca+8PBHuknY0VTTNKH1CUmXkUEvZ+KiMLCLT/K9c
1urEjnFoYTP7wKlDgPr1vynCL4ZHo2zuni707eCC5yhAXvJvb2fkRyehqAjCpWfUu/5kJkZr8abu
Np0/yQHkkwTmYiVia7IzoWST4Tv+PbZnr/zoaUjOOzo0RHYqMblnT8LXKmAKVRO3siEYbs02j3re
fY10bFZWF4EtcbTKK9Fx+FmwLl6kmllVNYnL0t6qI80U9IDqsDaoviZRN/gKQX8oqIrmI9s6deya
XgViXas0nyperJdHezJn7SdfteNX0AkfME6qK7HQagA9TJ0pIs1WkD4TwOce+8wSboITv68hT6Vy
Ccg=
=NUpE
-----END PGP SIGNATURE-----

--yyW7XNR2JX32oZQNscThp0mmeJVnEMk5k--

--===============0496437137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0496437137==--
