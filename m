Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 484CB217F75
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 08:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B506E857;
	Wed,  8 Jul 2020 06:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54156E857
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 06:10:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E45BDAC85;
 Wed,  8 Jul 2020 06:10:48 +0000 (UTC)
Subject: Re: [PATCH 4/4] drm: fb-helper: Convert logging to drm_* functions.
To: Suraj Upadhyay <usuraj35@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
References: <cover.1594136880.git.usuraj35@gmail.com>
 <0d37c7a614eb0885f0f0bed18e48a4d26b345a8e.1594136880.git.usuraj35@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <801c7af4-3991-6422-e95f-6a867d27f697@suse.de>
Date: Wed, 8 Jul 2020 08:10:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0d37c7a614eb0885f0f0bed18e48a4d26b345a8e.1594136880.git.usuraj35@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0621755125=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0621755125==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="N6Vsy2mqhXxmQ3gZtTbQfTGcJfn3UBoh9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--N6Vsy2mqhXxmQ3gZtTbQfTGcJfn3UBoh9
Content-Type: multipart/mixed; boundary="ayhMn1v1MzKH6si9D5WT2KLCxgXlyGr6I";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Suraj Upadhyay <usuraj35@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <801c7af4-3991-6422-e95f-6a867d27f697@suse.de>
Subject: Re: [PATCH 4/4] drm: fb-helper: Convert logging to drm_* functions.
References: <cover.1594136880.git.usuraj35@gmail.com>
 <0d37c7a614eb0885f0f0bed18e48a4d26b345a8e.1594136880.git.usuraj35@gmail.com>
In-Reply-To: <0d37c7a614eb0885f0f0bed18e48a4d26b345a8e.1594136880.git.usuraj35@gmail.com>

--ayhMn1v1MzKH6si9D5WT2KLCxgXlyGr6I
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.07.20 um 18:37 schrieb Suraj Upadhyay:
> Change logging information from dev_info() to drm_info().
>=20
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> index 5609e164805f..88146f7245c5 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1819,7 +1819,7 @@ __drm_fb_helper_initial_config_and_unlock(struct =
drm_fb_helper *fb_helper,
>  	if (ret < 0)
>  		return ret;
> =20
> -	dev_info(dev->dev, "fb%d: %s frame buffer device\n",
> +	drm_info(dev, "fb%d: %s frame buffer device\n",
>  		 info->node, info->fix.id);
> =20
>  	mutex_lock(&kernel_fb_helper_lock);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--ayhMn1v1MzKH6si9D5WT2KLCxgXlyGr6I--

--N6Vsy2mqhXxmQ3gZtTbQfTGcJfn3UBoh9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8FY2cUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPiVAf9Go8IAySbthZgUIcmxpZlWhrOOPhl
gSAQV4lLCHGrEZWPvyANtC5/o0+NmZk37NNYVGNB1XDh7gJmgDA4+3gbhiHitqy7
K61vXp5PyXYW7EIj5OZT0V+o8AH6+/AP9G/c9p0YC1LWcoH5EeawEDsfEergbePJ
4bshONnVpQYxUVsiR7QcMCrNtcvpbgF+x0BHCE61cmWbvm8DpO3HNQ1T3QfC9iYb
66ltWYsxY0W0gOuAVEky7Llnml5S7xSj9buYHgfyinowUJsY6qgLYXOX2oC1U6sI
XwZvSGKp91FZaB1WefUo7+EZq+Yam4pHiZUpEasOuS778D/6svYWXXFMqA==
=EGVC
-----END PGP SIGNATURE-----

--N6Vsy2mqhXxmQ3gZtTbQfTGcJfn3UBoh9--

--===============0621755125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0621755125==--
