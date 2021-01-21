Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8664C2FECE5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 15:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D766E069;
	Thu, 21 Jan 2021 14:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5866F6E069
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 14:31:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B95DEAB7A;
 Thu, 21 Jan 2021 14:31:48 +0000 (UTC)
Subject: Re: [PATCH] drm: Update todo.rst
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210121112919.1460322-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fae76a2d-90a7-82e0-d2d9-6e295c8c5a9a@suse.de>
Date: Thu, 21 Jan 2021 15:31:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121112919.1460322-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1740207774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1740207774==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QQQIUwtu7VrMJ6zWZajCdf3MmcOaFJRJj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QQQIUwtu7VrMJ6zWZajCdf3MmcOaFJRJj
Content-Type: multipart/mixed; boundary="rLeAtUeljJnES4JtMh52QegALqhbK5oEx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <fae76a2d-90a7-82e0-d2d9-6e295c8c5a9a@suse.de>
Subject: Re: [PATCH] drm: Update todo.rst
References: <20210121112919.1460322-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210121112919.1460322-1-daniel.vetter@ffwll.ch>

--rLeAtUeljJnES4JtMh52QegALqhbK5oEx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

we talked about making dma_resv the default lock for GEM objects. Could=20
you add an entry for this? Some interns might feel adventurous. :)

Best regards
Thomas

Am 21.01.21 um 12:29 schrieb Daniel Vetter:
> Interrnship season is starting, let's review this. One thing that's
> pending is Maxime's work to roll out drm_atomic_state pointers to all
> callbacks, he said he'll remove that entry once it's all done.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>   Documentation/gpu/todo.rst | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 009d8e6c7e3c..492768dd2fd9 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -577,20 +577,24 @@ Contact: Daniel Vetter
>  =20
>   Level: Intermediate
>  =20
> -KMS cleanups
> -------------
> +Object lifetime fixes
> +---------------------
> +
> +There's two related issues here
> +
> +- Cleanup up the various ->destroy callbacks, which often are all the =
same
> +  simple code.
>  =20
> -Some of these date from the very introduction of KMS in 2008 ...
> +- Lots of drivers erroneously allocate DRM modeset objects using devm_=
kzalloc,
> +  which results in use-after free issues on driver unload. This can be=
 serious
> +  trouble even for drivers for hardwared integrated on the SoC due to
> +  EPROBE_DEFERRED backoff.
>  =20
> -- Make ->funcs and ->helper_private vtables optional. There's a bunch =
of empty
> -  function tables in drivers, but before we can remove them we need to=
 make sure
> -  that all the users in helpers and drivers do correctly check for a N=
ULL
> -  vtable.
> +Both these problems can be solved by switching over to drmm_kzalloc(),=
 and the
> +various convenience wrappers provided, e.g. drmm_crtc_alloc_with_plane=
s(),
> +drmm_universal_plane_alloc(), ... and so on.
>  =20
> -- Cleanup up the various ->destroy callbacks. A lot of them just wrapt=
 the
> -  drm_*_cleanup implementations and can be removed. Some tack a kfree(=
) at the
> -  end, for which we could add drm_*_cleanup_kfree(). And then there's =
the (for
> -  historical reasons) misnamed drm_primary_helper_destroy() function.
> +Contact: Daniel Vetter
>  =20
>   Level: Intermediate
>  =20
> @@ -626,8 +630,6 @@ See the documentation of :ref:`VKMS <vkms>` for mor=
e details. This is an ideal
>   internship task, since it only requires a virtual machine and can be =
sized to
>   fit the available time.
>  =20
> -Contact: Daniel Vetter
> -
>   Level: See details
>  =20
>   Backlight Refactoring
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rLeAtUeljJnES4JtMh52QegALqhbK5oEx--

--QQQIUwtu7VrMJ6zWZajCdf3MmcOaFJRJj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAJkFMFAwAAAAAACgkQlh/E3EQov+Ar
7BAAmRMnZpR+ws0z5ytWVjxpkFBKZOKpi/4n83leSv9R83WBs9uH7cBtquSdRKXfsh39NQGahwwY
ayNGJawr/j2I+9rieAzThCEX5se4OXhE1OTdgBowG91K9V2j3kSCrGsacBw6Jizf4fDlhliVIKhc
9mCqwrKo5eNHq/PdX5k2H/5BKo+jcw6kqAcl0EUKMi9A/PDf4Xw2xbbcqph4s2hgvSpHXXbLwO1H
FplJeJ4mPGyp3oXs6fB5v5hDgCNwBij8FVM54K19zSGOLKG03V4BLRqbjw22O7KIV+gbBnJN58o4
acZvdWwzUD8LSkKnlIoH+qbvOZpHuSIpRDMXDHknraIAJF2NHIfrcctZWvp3ET8Zb6uKVZADzcm0
Of7xCMW5OBbGPJjsNRC83JqrisB509MUpu+eTDOwfGAPFGyWHF5cjh4jjZhbRVC2cIEQWwmwgiKK
Eyhl2GXFthY+eUHs/IcF30fRg/3RkhGEAsJs3zIQ2udNBhsHwNn7A31iqXAiVUmMydbmDxGRER3I
XglupX89hFZnQdmBrHr9B+YZB7Wg0taKIvBkRguuDlbsvQVEwiUGlQmHHcmR5mxAd9gOOhM2EzfL
le7o8TaRoOaPAjZwsZbp+eSACVEHmwNbUey0ifQBvXRa9pjD5TNjx2e8MyiPBibKMhFVJp1l+mo6
Z2A=
=DoXS
-----END PGP SIGNATURE-----

--QQQIUwtu7VrMJ6zWZajCdf3MmcOaFJRJj--

--===============1740207774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1740207774==--
