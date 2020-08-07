Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E666923EE83
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 16:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23D46E13C;
	Fri,  7 Aug 2020 14:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD836E13C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 14:02:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EC7DB5F1;
 Fri,  7 Aug 2020 14:02:20 +0000 (UTC)
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200807111022.12117-1-tzimmermann@suse.de>
 <20200807131252.GG2352366@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
Date: Fri, 7 Aug 2020 16:01:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807131252.GG2352366@phenom.ffwll.local>
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 malidp@foss.arm.com, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0347804078=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0347804078==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GEVhdbrzLgJwRhWRdCisUIlh28jtBK2FJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GEVhdbrzLgJwRhWRdCisUIlh28jtBK2FJ
Content-Type: multipart/mixed; boundary="0LiZNvpq10LNTYgSM5hahgk4PEMoLnijn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: liviu.dudau@arm.com, brian.starkey@arm.com, airlied@linux.ie,
 emil.velikov@collabora.com, dri-devel@lists.freedesktop.org,
 malidp@foss.arm.com
Message-ID: <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
References: <20200807111022.12117-1-tzimmermann@suse.de>
 <20200807131252.GG2352366@phenom.ffwll.local>
In-Reply-To: <20200807131252.GG2352366@phenom.ffwll.local>

--0LiZNvpq10LNTYgSM5hahgk4PEMoLnijn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.08.20 um 15:12 schrieb Daniel Vetter:
> On Fri, Aug 07, 2020 at 01:10:22PM +0200, Thomas Zimmermann wrote:
>> The malidp driver uses GEM object functions for callbacks. Fix it to
>> use them internally as well.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: ecdd6474644f ("drm/malidp: Use GEM CMA object functions")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Emil Velikov <emil.velikov@collabora.com>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Brian Starkey <brian.starkey@arm.com>
>> ---
>>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm=
/malidp_planes.c
>> index ab45ac445045..351a85088d0e 100644
>> --- a/drivers/gpu/drm/arm/malidp_planes.c
>> +++ b/drivers/gpu/drm/arm/malidp_planes.c
>> @@ -346,7 +346,7 @@ static bool malidp_check_pages_threshold(struct ma=
lidp_plane_state *ms,
>>  		if (cma_obj->sgt)
>>  			sgt =3D cma_obj->sgt;
>>  		else
>> -			sgt =3D obj->dev->driver->gem_prime_get_sg_table(obj);
>> +			sgt =3D obj->funcs->get_sg_table(obj);
>=20
> Uh if there's not a switch somewhere I'd just call the right function
> directly. Or call the right wrapper for this, this feels a bit fishy ..=
=2E

The driver initializes the pointer via CMA helper macro to an
CMA-internal default. Calling the actual function here is fragile if the
CMA-internal default ever changes.

But I have no strong feelings. I'll go with whatever the driver's
maintainer prefers.

Best regards
Thomas

> -Daniel
>=20
>> =20
>>  		if (!sgt)
>>  			return false;
>> --=20
>> 2.28.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0LiZNvpq10LNTYgSM5hahgk4PEMoLnijn--

--GEVhdbrzLgJwRhWRdCisUIlh28jtBK2FJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8tXtYUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOqsQf/bdWV/F4mLvnHL0bJ+L/5/vxh3NLF
zJlwxW0lOG9P0SlB+EFaakj3ojBO9qR9tXwzYR5lmmzRF3tXBfXLk+GmFZDrXPON
Ie27jIqJgJ4m9qU7wr2zHWtLdNExwLY6dy4jWe7a9NCJeEbjcAU/u273JWRGQZBH
P0zwYNks3LtHTxV4EGdxugDf50qkKzHGEum+OfDz3blElCxTD8AgxEM0GKCfmZad
9ECKKdXU3t3RGwUp+ndBkFFxO1Hf0tXtGcokDE8Sa8xU1tyF7wRYPbdtvDPeXcWx
mXM7hhtHSBl8l8OzGdyFKUXYqSNxN19qCevyfAXxduO/TPqI05y4yh2L3g==
=qb+V
-----END PGP SIGNATURE-----

--GEVhdbrzLgJwRhWRdCisUIlh28jtBK2FJ--

--===============0347804078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0347804078==--
