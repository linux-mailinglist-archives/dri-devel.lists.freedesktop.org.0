Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B90271BB6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811F189FCC;
	Mon, 21 Sep 2020 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7371E89FCC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 07:25:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19172AF31;
 Mon, 21 Sep 2020 07:25:56 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon 2/3] drm/hisilicon: Features to support
 reading resolutions from EDID
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1600658722-35945-1-git-send-email-tiantao6@hisilicon.com>
 <1600658722-35945-3-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <839cdb82-9611-6279-8ee7-38c92ede4460@suse.de>
Date: Mon, 21 Sep 2020 09:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600658722-35945-3-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0117718797=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0117718797==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qlAWJtTmGWNRAd505BVABvokgquFgTe5i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qlAWJtTmGWNRAd505BVABvokgquFgTe5i
Content-Type: multipart/mixed; boundary="FoNbeUpq5hsJHUaHPl5E84sWZ2QTKZ3ck";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <839cdb82-9611-6279-8ee7-38c92ede4460@suse.de>
Subject: Re: [PATCH drm/hisilicon 2/3] drm/hisilicon: Features to support
 reading resolutions from EDID
References: <1600658722-35945-1-git-send-email-tiantao6@hisilicon.com>
 <1600658722-35945-3-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1600658722-35945-3-git-send-email-tiantao6@hisilicon.com>

--FoNbeUpq5hsJHUaHPl5E84sWZ2QTKZ3ck
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.09.20 um 05:25 schrieb Tian Tao:
> Use drm_get_edid to get the resolution, if that fails, set it to
> a fixed resolution.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 35 ++++++++++++++++=
++++----
>  1 file changed, 29 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 376a05d..e84d381 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -20,13 +20,24 @@
> =20
>  static int hibmc_connector_get_modes(struct drm_connector *connector)
>  {
> -	int count;
> +	int count =3D 0;
> +	void *edid;
> +	struct hibmc_connector *hibmc_connector =3D to_hibmc_connector(connec=
tor);
> +
> +	edid =3D drm_get_edid(connector, &hibmc_connector->adapter);
> +	if (edid) {
> +		drm_connector_update_edid_property(connector, edid);
> +		count =3D drm_add_edid_modes(connector, edid);

There's nothing wrong here, but i think it might be more readable if you =
do

  if (count)
    goto out;

within this branch. The out label would be just before the kfree. With
this change, the code with drm_add_modes_noedid() would remain the same.

> +	}
> =20
> -	count =3D drm_add_modes_noedid(connector,
> +	if (!edid || count =3D=3D 0) {
> +		count =3D drm_add_modes_noedid(connector,
>  				     connector->dev->mode_config.max_width,
>  				     connector->dev->mode_config.max_height);
> -	drm_set_preferred_mode(connector, 1024, 768);
> +		drm_set_preferred_mode(connector, 1024, 768);
> +	}
> =20
> +	kfree(edid);
>  	return count;
>  }
> =20
> @@ -77,10 +88,19 @@ static const struct drm_encoder_funcs hibmc_encoder=
_funcs =3D {
>  int hibmc_vdac_init(struct hibmc_drm_private *priv)
>  {
>  	struct drm_device *dev =3D priv->dev;
> +	struct hibmc_connector *hibmc_connector =3D &priv->connector;
>  	struct drm_encoder *encoder =3D &priv->encoder;
> -	struct drm_connector *connector =3D &priv->connector;
> +	struct drm_connector *connector =3D &hibmc_connector->base;
>  	int ret;
> =20
> +	hibmc_connector->dev =3D dev;

As mentioned, this dev field should be removed.

> +
> +	ret =3D hibmc_ddc_create(hibmc_connector);
> +	if (ret) {
> +		drm_err(dev, "failed to create connector: %d\n", ret);

The error message appears to be incorrect. (?)

> +		return ret;
> +	}
> +
>  	encoder->possible_crtcs =3D 0x1;
>  	ret =3D drm_encoder_init(dev, encoder, &hibmc_encoder_funcs,
>  			       DRM_MODE_ENCODER_DAC, NULL);
> @@ -91,12 +111,15 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv=
)
> =20
>  	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
> =20
> -	ret =3D drm_connector_init(dev, connector, &hibmc_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VGA);
> +	ret =3D drm_connector_init_with_ddc(dev, connector,
> +					  &hibmc_connector_funcs,
> +					  DRM_MODE_CONNECTOR_VGA,
> +					  &hibmc_connector->adapter);
>  	if (ret) {
>  		drm_err(dev, "failed to init connector: %d\n", ret);
>  		return ret;
>  	}
> +
>  	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
> =20
>  	drm_connector_attach_encoder(connector, encoder);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--FoNbeUpq5hsJHUaHPl5E84sWZ2QTKZ3ck--

--qlAWJtTmGWNRAd505BVABvokgquFgTe5i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9oVV8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPMlgf/dwVDeAkUdrGtWhm8+ObxemWp564+
RvY2pYz7MnwnmEubAUJceLyjHyoKM/hFpx4RDSu3MlRsPd3nC6Vcp/YHjuaPwhR2
GTYGT9PtKcxT83gn19rbQuvdj5/n2c8JUIybAo7ubsurt3Z6DAJimsCxbe+h7/4Y
qg01oZOBZSkYITz66JbLO4Mt54mPai+2xQI0hTcGL2vRhxMKEM+ZDP/7/OwACyyZ
BaidlRbcGZ7tdrEuoZY8oOh5AZUyYpSvmioxtSUgLXJYeldAvPYgLak9xurPwAiZ
lSERgHY0nTVM5cWaHgZ8j0MK2GcYAREmZomsUiNQcTG7EB3eE2nkv/0c7A==
=eXZi
-----END PGP SIGNATURE-----

--qlAWJtTmGWNRAd505BVABvokgquFgTe5i--

--===============0117718797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0117718797==--
