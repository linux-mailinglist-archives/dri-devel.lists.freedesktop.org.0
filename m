Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E663089C6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDE36EB53;
	Fri, 29 Jan 2021 15:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDF46EB53
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 15:12:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30688ABD6;
 Fri, 29 Jan 2021 15:12:39 +0000 (UTC)
Subject: Re: [PATCH 3/5] drm/gma500: Drop DRM_GMA3600 config option
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-4-tzimmermann@suse.de>
 <CAMeQTsb7sdKGXhB+sFCZQHJ3g3bcZKTyMoz=8_V70jTNUa_A3w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <35164db7-1f85-af46-9040-4d04b5777939@suse.de>
Date: Fri, 29 Jan 2021 16:12:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAMeQTsb7sdKGXhB+sFCZQHJ3g3bcZKTyMoz=8_V70jTNUa_A3w@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1008672039=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1008672039==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QnW8Jc5KCS8IVw0keQXTHsU8jMAjv6UTX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QnW8Jc5KCS8IVw0keQXTHsU8jMAjv6UTX
Content-Type: multipart/mixed; boundary="RXwDrrqWNYItRjGQIFKOAeSsexo2lEi47";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <35164db7-1f85-af46-9040-4d04b5777939@suse.de>
Subject: Re: [PATCH 3/5] drm/gma500: Drop DRM_GMA3600 config option
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-4-tzimmermann@suse.de>
 <CAMeQTsb7sdKGXhB+sFCZQHJ3g3bcZKTyMoz=8_V70jTNUa_A3w@mail.gmail.com>
In-Reply-To: <CAMeQTsb7sdKGXhB+sFCZQHJ3g3bcZKTyMoz=8_V70jTNUa_A3w@mail.gmail.com>

--RXwDrrqWNYItRjGQIFKOAeSsexo2lEi47
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Patrik

Am 29.01.21 um 15:33 schrieb Patrik Jakobsson:
> On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>
>> With support for the MID-related chips removed, only support for
>> desktop chips is left in the driver. So just build the complete
>> driver if DRM_GMA500 has been selected. Anyone who wants to enable
>> the Poulsbo code would probably also want the Cedarview code.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> As GMA600 is staying, can you please also merge that config?

By 'merge that config', you mean to removed CONFIG_DRM_GMA600 and=20
configure everything with DRM_GMA500?

Best regards
Thomas

>=20
> -Patrik
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RXwDrrqWNYItRjGQIFKOAeSsexo2lEi47--

--QnW8Jc5KCS8IVw0keQXTHsU8jMAjv6UTX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAUJeYFAwAAAAAACgkQlh/E3EQov+AX
/Q/9FFM2PiWjodWNeOfqEHbkKbMXDo2KqB5e6EYCtCyvuiyK5SXa2QK1i2/jqJ3bMF0WRiiu7D6D
VYAwVozgre43OnrC8tBrWIpGUxalPOYpAUPi2JBshnTuaIx+I5Fuosdi3CLKyP1HCTIF8XQq0vR8
XVHobe02cO1aNGxLB5BlJ9QX0d4oeW3G/bN61UnXyvR0V707b3ZQzh4vuJ5iGwwJs+UFXjaAIZ/8
mjoa9JggPE77cGTEj1XyYQ28AwB0CYLZnwjIOtxuoXpq1i8G4li8vwnZ/IKZACYg8VSpqQWC2Wta
LrALBA0thjeuOUG1HrYiD/cY8TlFO8hBxmqMUZZBa8OBqaGCzW0RwG/kK5X+j/VblBxnLVpQscLP
IQm3ArUUGDc7KE0LdravYLXpRWbZssKZrBvJNy9Pp0vekBr0W49KrHwzgJl9ejQLykcWQRs0S4Ta
twDLtGpBeIh1+/HjAOcenZ8Q0xgK2jmxiDwN1+aqNHDUXSQQ9bm9vVtCVOB3YjpbVJy2iKotUbB0
S4vsEBqX5KIP/NILKKwZpQuHqjpMBy60vtWUAAuVm6q2SLJpXCWfWWvLaHXkLQkGRGfzPJq2jFki
2a5aHBohhkuY/aK85YqXfgeq2xxETymFkiGm3k2Cx1ukpQv9JbhW74g0BTSNrtClo5saT+5zCl7D
r+Q=
=bXjW
-----END PGP SIGNATURE-----

--QnW8Jc5KCS8IVw0keQXTHsU8jMAjv6UTX--

--===============1008672039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1008672039==--
