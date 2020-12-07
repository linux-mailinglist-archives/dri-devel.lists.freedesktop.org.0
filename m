Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16E2D0CE8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 10:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5906389DC2;
	Mon,  7 Dec 2020 09:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C01689DC2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:22:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9307AD6B;
 Mon,  7 Dec 2020 09:22:46 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon v2 1/2] drm/hisilicon: Use managed
 mode-config init
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
 <1607331906-19005-2-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cf28147b-a506-3d72-fb71-bb30a801fd8d@suse.de>
Date: Mon, 7 Dec 2020 10:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1607331906-19005-2-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1929577180=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1929577180==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7w5Q9hFsGTX4HT2ZGrujcHkTr1U0WxU24"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7w5Q9hFsGTX4HT2ZGrujcHkTr1U0WxU24
Content-Type: multipart/mixed; boundary="44arVvp8gUngPeOglD8Juq6qtBgxbQMZH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <cf28147b-a506-3d72-fb71-bb30a801fd8d@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/2] drm/hisilicon: Use managed
 mode-config init
References: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
 <1607331906-19005-2-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1607331906-19005-2-git-send-email-tiantao6@hisilicon.com>

--44arVvp8gUngPeOglD8Juq6qtBgxbQMZH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.12.20 um 10:05 schrieb Tian Tao:
> Using drmm_mode_config_init() sets up managed release of modesetting
> resources.
>=20

Individual patches usually contain a changelog to highlight the=20
difference to previous versions. Please add one before committing the=20
patch.  Your cover letter for the series already does this correctly.

> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for all these updates.

> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 14 +++-----------
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  1 -
>   2 files changed, 3 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 3687753..7f01213 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -96,8 +96,9 @@ static int hibmc_kms_init(struct hibmc_drm_private *p=
riv)
>   	struct drm_device *dev =3D &priv->dev;
>   	int ret;
>  =20
> -	drm_mode_config_init(dev);
> -	priv->mode_config_initialized =3D true;
> +	ret =3D drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
>  =20
>   	dev->mode_config.min_width =3D 0;
>   	dev->mode_config.min_height =3D 0;
> @@ -125,14 +126,6 @@ static int hibmc_kms_init(struct hibmc_drm_private=
 *priv)
>   	return 0;
>   }
>  =20
> -static void hibmc_kms_fini(struct hibmc_drm_private *priv)
> -{
> -	if (priv->mode_config_initialized) {
> -		drm_mode_config_cleanup(&priv->dev);
> -		priv->mode_config_initialized =3D false;
> -	}
> -}
> -
>   /*
>    * It can operate in one of three modes: 0, 1 or Sleep.
>    */
> @@ -262,7 +255,6 @@ static int hibmc_unload(struct drm_device *dev)
>   	drm_atomic_helper_shutdown(dev);
>  =20
>   	pci_disable_msi(dev->pdev);
> -	hibmc_kms_fini(priv);
>   	dev->dev_private =3D NULL;
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index a49c10e..7d263f4 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -42,7 +42,6 @@ struct hibmc_drm_private {
>   	struct drm_crtc crtc;
>   	struct drm_encoder encoder;
>   	struct hibmc_connector connector;
> -	bool mode_config_initialized;
>   };
>  =20
>   static inline struct hibmc_connector *to_hibmc_connector(struct drm_c=
onnector *connector)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--44arVvp8gUngPeOglD8Juq6qtBgxbQMZH--

--7w5Q9hFsGTX4HT2ZGrujcHkTr1U0WxU24
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/N9GUFAwAAAAAACgkQlh/E3EQov+Ao
ERAAgq96FjDmWVLRtFp9mW4xu4kfjY5qDuDZ9ptonUpKwqIUB1GgKp1vfc0Ng2Ll315Uqzv+EM9h
U6SUWqn6fETsnhCGr3MiciUT18wXMR7z32lDPn3RRyy5r67JEaZpQ+ZSxkfQHkDdVAM+i537Ns87
5qRpqWTN4p4N2htMritSRHWTH7sFM69kzs6AFozfitEswNayA1+FQAvhGJ3sEGVSnGZ8xq3DqqB4
PM3YO7saPrmBQFUCU44ATS31MDsN59nDAEFOQhwTaj910A4O+bQFWjM3yScXYVssy7cabzzEkLvT
tFDYUFpacdusCtrwMoUgXcP+1I41y8PCpVPIcRuHF15kJeNimVACiNvrmW3drCoG177EqgHGgFFD
CLo557YUrbHLOyLhXV+uwp5/UEryDCEuQjcYGlDwM1MfpMKh0cYCuAPc35SsYdav1bWu9ld00nvm
tXVmHn32+0p8pJsHhOTfyd5h/PffcJFe7gLKXtznOUZIQr4BMQGRna7yXVwTIPM5JNhtQlszWaPu
JE3vMCZnNc9pOPsoWjZplIuwdaXaz6o5L2BkRfXiZlugJolebwpWco/AYdG4ePU1ZR+4A2S33IJJ
nDLc3tZJiB6rlTUNoDB+dMbVxJd11g0k+Dk2W0J8a0BF18xlPiTPNAIKzYDazPNfd+IOBFq8jzsb
fPA=
=G8lq
-----END PGP SIGNATURE-----

--7w5Q9hFsGTX4HT2ZGrujcHkTr1U0WxU24--

--===============1929577180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1929577180==--
