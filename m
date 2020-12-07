Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1582D0B70
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6DE89DC2;
	Mon,  7 Dec 2020 08:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4AF89DC2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:04:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECF37ACBD;
 Mon,  7 Dec 2020 08:04:13 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon 2/2] drm/hisilicon: Delete unused local
 parameters
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1607302172-60123-1-git-send-email-tiantao6@hisilicon.com>
 <1607302172-60123-3-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e08b33ab-f4b3-f23a-d5f7-56b4795875be@suse.de>
Date: Mon, 7 Dec 2020 09:04:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1607302172-60123-3-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1305018089=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1305018089==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yTNrphBMLVt6EJudUhi1Cup7kx05pUiyF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yTNrphBMLVt6EJudUhi1Cup7kx05pUiyF
Content-Type: multipart/mixed; boundary="AlD5cEhkJHuE5wznxlep4bgJ6blT1LVnz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <e08b33ab-f4b3-f23a-d5f7-56b4795875be@suse.de>
Subject: Re: [PATCH drm/hisilicon 2/2] drm/hisilicon: Delete unused local
 parameters
References: <1607302172-60123-1-git-send-email-tiantao6@hisilicon.com>
 <1607302172-60123-3-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1607302172-60123-3-git-send-email-tiantao6@hisilicon.com>

--AlD5cEhkJHuE5wznxlep4bgJ6blT1LVnz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.12.20 um 01:49 schrieb Tian Tao:
> delete unused variable =E2=80=98priv=E2=80=99 to avoid warning.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index d631f82..772f58e 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -251,12 +251,9 @@ static int hibmc_hw_init(struct hibmc_drm_private =
*priv)
>  =20
>   static int hibmc_unload(struct drm_device *dev)
>   {
> -	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
> -
>   	drm_atomic_helper_shutdown(dev);
> -
>   	pci_disable_msi(dev->pdev);
> -	dev->dev_private =3D NULL;
> +
>   	return 0;
>   }
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--AlD5cEhkJHuE5wznxlep4bgJ6blT1LVnz--

--yTNrphBMLVt6EJudUhi1Cup7kx05pUiyF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/N4fwFAwAAAAAACgkQlh/E3EQov+Bk
ChAAzduUeYznzDwFqCNKeNR/zP2i4eHWBqLUXWD2PnbrrUoIwXgF+CQv30YE7AIlrGCFp9CcNAFW
68X9YjlkFmSRqelFHueSmimbGDd+NKVf9TaK0jAe2aLzh15butOcEsEnMkPZY3HAwM3PmRICHTIP
KuENgEQEESi8dABHdBl38QRz4ZAU/91EJHlaw/hLJTFAKpO6qyk68Ot82ypWku2s9OJGX6v13oW+
3+8RwrL3+rLCeax1YG+0KBovzdxhAZhAfBoOL6UQsExOs1migHfdNQ7+9q9vbMmOwntYuE73iCUE
bCZuKoFLlvU8tOaQZJyQ5mDAnamR+7hTia1Gya+ImMFZ/7fQTO9tYC623P7RfHKvbyD+xI1TBsSJ
KYR7srlm5a+kuCKb63F1PQX8cZ4h+JWMQX/wDy832Tbo8bbHl7AMJYjyzYIgMCQSOgKITt9v9yNi
vOEv0opv9rwYmqjFTMzpUUxm3qvLVAGkMS5nJUWFhS8N+QirLdn/OxMsAcUDEEH8SPt5hj4JdiSt
FHvvCtIK8kwT6Jol8VCFr/Qq5OIicAndyXkUeaD5B1dCscX3i6U6v59LJMplIONjP9J3fbycSs7k
CfvCWrC6QPpnsypKaBH1DzAW1sMbzH6a6+nPqbJtnwMzmWqlR9CkFOxlMq3+KeG0Q3IG7ovE4sOH
mNQ=
=xEsE
-----END PGP SIGNATURE-----

--yTNrphBMLVt6EJudUhi1Cup7kx05pUiyF--

--===============1305018089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1305018089==--
