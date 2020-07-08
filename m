Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A8217F72
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 08:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FE46E0F2;
	Wed,  8 Jul 2020 06:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092CA6E0F2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 06:10:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D914DAC85;
 Wed,  8 Jul 2020 06:10:23 +0000 (UTC)
Subject: Re: [PATCH 3/4] drm: edid: Convert logging to drm_* functions.
To: Suraj Upadhyay <usuraj35@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
References: <cover.1594136880.git.usuraj35@gmail.com>
 <f40659c5656da4e1e3fad9cb731ed7f72feda3e3.1594136880.git.usuraj35@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f54c8818-853a-1971-fc45-ae06e17c779e@suse.de>
Date: Wed, 8 Jul 2020 08:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <f40659c5656da4e1e3fad9cb731ed7f72feda3e3.1594136880.git.usuraj35@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0219674392=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0219674392==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Aj1qZ3yM9HNG73TZ3TVu4EOJ0Q3Iy8LMy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Aj1qZ3yM9HNG73TZ3TVu4EOJ0Q3Iy8LMy
Content-Type: multipart/mixed; boundary="KjxtwsAfKUN6yuas7AqYIusFYNmrJoZhR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Suraj Upadhyay <usuraj35@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <f54c8818-853a-1971-fc45-ae06e17c779e@suse.de>
Subject: Re: [PATCH 3/4] drm: edid: Convert logging to drm_* functions.
References: <cover.1594136880.git.usuraj35@gmail.com>
 <f40659c5656da4e1e3fad9cb731ed7f72feda3e3.1594136880.git.usuraj35@gmail.com>
In-Reply-To: <f40659c5656da4e1e3fad9cb731ed7f72feda3e3.1594136880.git.usuraj35@gmail.com>

--KjxtwsAfKUN6yuas7AqYIusFYNmrJoZhR
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Thanks!

Am 07.07.20 um 18:36 schrieb Suraj Upadhyay:
> Change logging of warnings to drm_warn() form dev_warn().
>=20
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_edid.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 31496b6cfc56..ad7a1f9817ed 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1844,9 +1844,8 @@ static void connector_bad_edid(struct drm_connect=
or *connector,
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
> =20
> -	dev_warn(connector->dev->dev,
> -		 "%s: EDID is invalid:\n",
> -		 connector->name);
> +	drm_warn(connector->dev, "%s: EDID is invalid:\n", connector->name);
> +
>  	for (i =3D 0; i < num_blocks; i++) {
>  		u8 *block =3D edid + i * EDID_LENGTH;
>  		char prefix[20];
> @@ -5284,7 +5283,7 @@ int drm_add_edid_modes(struct drm_connector *conn=
ector, struct edid *edid)
>  	}
>  	if (!drm_edid_is_valid(edid)) {
>  		clear_eld(connector);
> -		dev_warn(connector->dev->dev, "%s: EDID invalid.\n",
> +		drm_warn(connector->dev, "%s: EDID invalid.\n",
>  			 connector->name);
>  		return 0;
>  	}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--KjxtwsAfKUN6yuas7AqYIusFYNmrJoZhR--

--Aj1qZ3yM9HNG73TZ3TVu4EOJ0Q3Iy8LMy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8FY04UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOTVwgAlzwaXOm530Y6ErmMjccFyJqGt84t
Vu0pYsJ3Fp1Pv4DLg2hQmSYD4OXDnqLHS/lqypMx9iVYLqNCFpDdwx7w0Ic0I1Jd
6y6OW1JTXarO7x6jFni3dtLOglALlAEpPZeu0Q6sAeAyodxfgdbNtW1ydNLOmB6r
8YYa8Zo2lnfIRU4Q/s2zv6a1PfQIPIHhRTIrHwmHqTn6AmwO0amNwgrKF4oFIBmz
Y8TYE6yMgwOF1X8rAFNDkgzLMdaSroxvwzWfWWp3xG+fFTsUGAMDmoBEkZ4e68Be
7JfYdobM2SVLMOn5lDvQEzNjFV4p8QNaevKI4DZCYrXFpiEbaRE1ELgFWw==
=65eH
-----END PGP SIGNATURE-----

--Aj1qZ3yM9HNG73TZ3TVu4EOJ0Q3Iy8LMy--

--===============0219674392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0219674392==--
