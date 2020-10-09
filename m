Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC3288658
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 11:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1746EC45;
	Fri,  9 Oct 2020 09:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417306EC45
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 09:48:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDE0FABBE;
 Fri,  9 Oct 2020 09:48:50 +0000 (UTC)
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <eeaa5946-b77f-786e-1857-25ce708ba2e7@suse.de>
Date: Fri, 9 Oct 2020 11:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: multipart/mixed; boundary="===============1950427392=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1950427392==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nqom9X9FE0PfAyEjP9NcUZkk2jVLmmLH4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nqom9X9FE0PfAyEjP9NcUZkk2jVLmmLH4
Content-Type: multipart/mixed; boundary="4NN9xkc24MpfyjBvtLP2kmawsMoAGbtau";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Message-ID: <eeaa5946-b77f-786e-1857-25ce708ba2e7@suse.de>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
In-Reply-To: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>

--4NN9xkc24MpfyjBvtLP2kmawsMoAGbtau
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.10.20 um 11:24 schrieb Simon Ser:
> User-space should avoid parsing EDIDs for metadata already exposed via
> other KMS interfaces and properties. For instance, user-space should no=
t
> try to extract a list of modes from the EDID: the kernel might mutate
> the mode list (because of link capabilities or quirks for instance).
>=20
> Other metadata not exposed by KMS can be parsed by user-space. This
> includes for instance monitor identification (make/model/serial) and
> supported color-spaces.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> index 717c4e7271b0..00e58fd2d292 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -960,6 +960,10 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
>   * 	drm_connector_update_edid_property(), usually after having parsed
>   * 	the EDID using drm_add_edid_modes(). Userspace cannot change this
>   * 	property.
> + *
> + * 	User-space should not parse the EDID to obtain information exposed=
 via
> + * 	other KMS properties. For instance, user-space should not try to p=
arse
> + * 	mode lists from the EDID.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

But this makes me wonder why the kernel exposes raw EDID in the first
place. Wouldn't it be better to expose meaningful fields (display model,
vendor, etc) instead?

Best regards
Thomas

>   * DPMS:
>   * 	Legacy property for setting the power state of the connector. For =
atomic
>   * 	drivers this is only provided for backwards compatibility with exi=
sting
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--4NN9xkc24MpfyjBvtLP2kmawsMoAGbtau--

--nqom9X9FE0PfAyEjP9NcUZkk2jVLmmLH4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+AMfwUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMclgf/SF/ju0Q1uSVddAGueKpVMNvatlXe
Z7AQRkSvB7egJNJr7Sqhf/5XxbPbSbfL15KiR3u4vfo+ZVrwdLix3jI78mcgklo8
f6QZlnEdSwlUD/t27bYHXaSii3COMInB/f2hUJnKj5MpB4KkDFcyePxTiSffTvWg
qQmSZxxt2h7YrQcJDzar463n/XVEHNPmob4OKfRC8DqHpArZCZjH54l6AKOJ3rJJ
NQKDPdo6a8fY3K0BDb74J8adc8gmunQXLCPQfO7VLLHDHSxKTirJSCJ2HsU55AsV
K3WL1QtBRLq5VXYbmn1C+82c7LoWI9a3zjnR8h04eekGybp+OO++BdDSjw==
=AcUL
-----END PGP SIGNATURE-----

--nqom9X9FE0PfAyEjP9NcUZkk2jVLmmLH4--

--===============1950427392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1950427392==--
