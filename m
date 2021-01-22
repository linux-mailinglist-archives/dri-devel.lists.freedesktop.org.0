Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE453004D4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 15:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84C189BAB;
	Fri, 22 Jan 2021 14:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3556489BAB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 14:06:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C328FAD19;
 Fri, 22 Jan 2021 14:06:45 +0000 (UTC)
Subject: Re: [PATCH] drm/todo: Add entry for moving to dma_resv_lock
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <97c93ad7-9aa1-dcf7-42a9-4f8076eeb135@suse.de>
Date: Fri, 22 Jan 2021 15:06:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1198737766=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1198737766==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HaDnuMBCYLhsDliuMvZN6yNcVbtbbFnmX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HaDnuMBCYLhsDliuMvZN6yNcVbtbbFnmX
Content-Type: multipart/mixed; boundary="c8l1JC1rMcFzs0Nla4OljL8uVpN9IeK3I";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Message-ID: <97c93ad7-9aa1-dcf7-42a9-4f8076eeb135@suse.de>
Subject: Re: [PATCH] drm/todo: Add entry for moving to dma_resv_lock
References: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>

--c8l1JC1rMcFzs0Nla4OljL8uVpN9IeK3I
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.01.21 um 14:36 schrieb Daniel Vetter:
> Requested by Thomas. I think it justifies a new level, since I tried
> to make some forward progress on this last summer, and gave up (for
> now). This is very tricky.

Adding it to the TODO list is a first step. :)

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   Documentation/gpu/todo.rst | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index dea9082c0e5f..f872d3d33218 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -23,6 +23,9 @@ Advanced: Tricky tasks that need fairly good understa=
nding of the DRM subsystem
>   and graphics topics. Generally need the relevant hardware for develop=
ment and
>   testing.
>  =20
> +Expert: Only attempt these if you've successfully completed some trick=
y
> +refactorings already and are an expert in the specific area
> +
>   Subsystem-wide refactorings
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>  =20
> @@ -168,6 +171,22 @@ Contact: Daniel Vetter, respective driver maintain=
ers
>  =20
>   Level: Advanced
>  =20
> +Move Buffer Object Locking to dma_resv_lock()
> +---------------------------------------------
> +
> +Many drivers have their own per-object locking scheme, usually using
> +mutex_lock(). This causes all kinds of trouble for buffer sharing, sin=
ce
> +depending which driver is the exporter and importer, the locking hiera=
rchy is
> +reversed.
> +
> +To solve this we need one standard per-object locking mechanism, which=
 is
> +dma_resv_lock(). This lock needs to be called as the outermost lock, w=
ith all
> +other driver specific per-object locks removed. The problem is tha rol=
ling out
> +the actual change to the locking contract is a flag day, due to struct=
 dma_buf
> +buffer sharing.
> +
> +Level: Expert
> +
>   Convert logging to drm_* functions with drm_device paramater
>   ------------------------------------------------------------
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--c8l1JC1rMcFzs0Nla4OljL8uVpN9IeK3I--

--HaDnuMBCYLhsDliuMvZN6yNcVbtbbFnmX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAK2/QFAwAAAAAACgkQlh/E3EQov+D8
Fw/+MS3JyICgqsu8kPrj+GPX9X6pa7qf9iup7N4mOQhvxjsa2dRI1DBcxqNNs11ePCw21faWnEZU
JT/FhKCYZaMdeMDYKLSby2D0wyrV4XhN5xW2NrOPSox9uF9Do2XzxStMl89IHai+qkOLX5/4RSXt
L5KMtC6t/6DhV/xkLLx1ealvABlL7Z1CPrqL8acGqbXABcUixGTi4hVWSED43M2FrHsTpYvtDvqX
n79juLQpwdtnr7qAwoTMo/Fj6mrU29p0apd0Nb2LR1qfYMyE0idZPQbIcQJNyXMzL4D0YE0P/1dY
YL/KKk+7SsWRY+ewrHOOt2tE8ZI3x7dYuU8h204RB17WUQIMghu5dwsPIjhyoysDTINHgKTrZfHr
l/ruWNfxgoBpxb4XdPVrOSbB4b3BelFVGaJ5Q3nzN7Jzdfn6oyZAsTAlfK0L4wThk/heDkVAiVqk
1IoTLQl2ihjj1tB3AsTCjZRfcSWH81Ksz5uCgQwzV1CcfgPYzGiCkg1U7EXcuNidkn9oDu4VgJhv
Nq1y+Awe/vi9ilsMRraX5O6oHPuIExwD+Amus0E6klaLEltOI9Yn38VMkwXUw8AwwVDnBK16s+Ki
u871/Dr7GLELcTeACuRP9r7McW4ba00Sw1tCswJPXHaqFkVqdj3AkAJODLLO52ePhhenxvyxhs2U
Upc=
=R+9w
-----END PGP SIGNATURE-----

--HaDnuMBCYLhsDliuMvZN6yNcVbtbbFnmX--

--===============1198737766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1198737766==--
