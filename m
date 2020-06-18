Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C141FF3C4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 15:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C0D6E06D;
	Thu, 18 Jun 2020 13:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6A26E06D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 13:52:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9FFD5AB98;
 Thu, 18 Jun 2020 13:52:33 +0000 (UTC)
Subject: Re: [PATCH v2] drm/hisilicon: Code refactoring for hibmc_drv_vdac
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1586586315-12764-1-git-send-email-tiantao6@hisilicon.com>
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
Message-ID: <21d9f165-3fe9-d0cb-35ce-c91889e7e0dd@suse.de>
Date: Thu, 18 Jun 2020 15:52:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1586586315-12764-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1593505953=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1593505953==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bMq42WMT5VsIyVKShMmg9UM3yjBKvRebk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bMq42WMT5VsIyVKShMmg9UM3yjBKvRebk
Content-Type: multipart/mixed; boundary="eShotCSXpdcfDQZHiqDDGiBqtaP8lv2Qy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <21d9f165-3fe9-d0cb-35ce-c91889e7e0dd@suse.de>
Subject: Re: [PATCH v2] drm/hisilicon: Code refactoring for hibmc_drv_vdac
References: <1586586315-12764-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1586586315-12764-1-git-send-email-tiantao6@hisilicon.com>

--eShotCSXpdcfDQZHiqDDGiBqtaP8lv2Qy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

sorry for letting these patches sit around for so long. I'd say that if
you waited for a week or two without further responses, it's ok to ping
people.

Am 11.04.20 um 08:25 schrieb Tian Tao:
> code refactoring for hibmc_drv_vdac.c, no actual function changes.
>=20
> v2:
> remove the debug message.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Reviewed-by: Joe Perches <joe@perches.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 50 +++++++---------=
--------
>  1 file changed, 14 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 678ac2e..077b7996 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -52,32 +52,6 @@ static const struct drm_connector_funcs hibmc_connec=
tor_funcs =3D {
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  };
> =20
> -static struct drm_connector *
> -hibmc_connector_init(struct hibmc_drm_private *priv)
> -{
> -	struct drm_device *dev =3D priv->dev;
> -	struct drm_connector *connector;
> -	int ret;
> -
> -	connector =3D devm_kzalloc(dev->dev, sizeof(*connector), GFP_KERNEL);=

> -	if (!connector) {
> -		DRM_ERROR("failed to alloc memory when init connector\n");
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
> -	ret =3D drm_connector_init(dev, connector,
> -				 &hibmc_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VGA);
> -	if (ret) {
> -		DRM_ERROR("failed to init connector: %d\n", ret);
> -		return ERR_PTR(ret);
> -	}
> -	drm_connector_helper_add(connector,
> -				 &hibmc_connector_helper_funcs);
> -
> -	return connector;
> -}
> -
>  static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
>  				   struct drm_display_mode *mode,
>  				   struct drm_display_mode *adj_mode)
> @@ -109,18 +83,9 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)=

>  	struct drm_connector *connector;
>  	int ret;
> =20
> -	connector =3D hibmc_connector_init(priv);
> -	if (IS_ERR(connector)) {
> -		DRM_ERROR("failed to create connector: %ld\n",
> -			  PTR_ERR(connector));
> -		return PTR_ERR(connector);
> -	}
> -
>  	encoder =3D devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);
> -	if (!encoder) {
> -		DRM_ERROR("failed to alloc memory when init encoder\n");
> +	if (!encoder)
>  		return -ENOMEM;
> -	}
> =20
>  	encoder->possible_crtcs =3D 0x1;
>  	ret =3D drm_encoder_init(dev, encoder, &hibmc_encoder_funcs,
> @@ -131,6 +96,19 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)=

>  	}
> =20
>  	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
> +
> +	connector =3D devm_kzalloc(dev->dev, sizeof(*connector), GFP_KERNEL);=


Overall, the patch seems correct, expect for this line. DRM data
structures should now be allocated with drmm_kzalloc() in drm_managed.h.
It was added recently.

With devm_kzalloc(), the memory will be released when the HW device goes
away. If userspace still holds a reference, the driver can segfault.
Using drmm_kzalloc() delays the release until the memory is really unused=
=2E

However, hibmc's modesetting pipeline appears to be always the same. I
think you should consider embedding connector and encoder (and crtc) in
struct hibmc_drm_private. Would make the code simpler and more robust.

Best regards
Thomas



> +	if (!connector)
> +		return -ENOMEM;
> +
> +	ret =3D drm_connector_init(dev, connector, &hibmc_connector_funcs,
> +				 DRM_MODE_CONNECTOR_VGA);
> +	if (ret) {
> +		DRM_ERROR("failed to init connector: %d\n", ret);
> +		return ret;
> +	}
> +	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
> +
>  	drm_connector_attach_encoder(connector, encoder);
> =20
>  	return 0;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eShotCSXpdcfDQZHiqDDGiBqtaP8lv2Qy--

--bMq42WMT5VsIyVKShMmg9UM3yjBKvRebk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7rcZ0ACgkQaA3BHVML
eiP9QggAptYdaNLZREzAwQ3D109OpCD7FmzN610r8cAnUtL3w2FycjP1iGWhO4UY
NmdwmKhgVXeQnCp0jrjcZL75cAGgCZA4XRvOrqWES5yoFaMJ3U9ziZ3+nb1e/gUy
okypHn07qNZjdnksbSKgko4u04aS6KLOgskSZubTHlZeKgPbjkw9UnJIaLMXnNHX
XNI4pRuB5oRkuply7DqzXmKlLu4J8n/s7J2y1mlXLFaQFhOM4Hlb/4XI1g1R2XyX
NU4IDle8BPpCt5LajQZctcYz8SyNVIbeCOTIZ9LouohgjzJoa7VFPO1j2AJLi9dr
jDD6ODlT8W8/uOlYsrhidr1dEu67WQ==
=ZHIf
-----END PGP SIGNATURE-----

--bMq42WMT5VsIyVKShMmg9UM3yjBKvRebk--

--===============1593505953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1593505953==--
