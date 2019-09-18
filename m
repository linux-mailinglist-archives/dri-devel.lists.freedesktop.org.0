Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEADB621B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 13:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78B96EED8;
	Wed, 18 Sep 2019 11:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0296EED8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 11:14:02 +0000 (UTC)
Received: from [IPv6:2a02:2f0b:890b:cb00:2e0:4cff:fe22:3046] (unknown
 [IPv6:2a02:2f0b:890b:cb00:2e0:4cff:fe22:3046])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: mvlad)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0C66B28E17B;
 Wed, 18 Sep 2019 12:14:01 +0100 (BST)
Subject: Re: [PATCH v2] drm: two planes with the same zpos have undefined
 ordering
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <CAKMK7uEEuUpD_eni6wr=7sEadnYypd=7Ojf5zQ0tgXQov4F3mQ@mail.gmail.com>
 <1hklN2_EspD_s4vA3fdCCkVN9jeARGhmtkSGWDyVus-0ryZFs4xftUYRp_Z4pzsikJActaDVaTUoPNfBd-QitQX_JJTXkkqKFXxJhgMjEI0=@emersion.fr>
From: Marius Vlad <marius.vlad@collabora.com>
Openpgp: preference=signencrypt
Message-ID: <60c3fb6c-651a-0122-44d5-30895bbcb22c@collabora.com>
Date: Wed, 18 Sep 2019 14:13:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1hklN2_EspD_s4vA3fdCCkVN9jeARGhmtkSGWDyVus-0ryZFs4xftUYRp_Z4pzsikJActaDVaTUoPNfBd-QitQX_JJTXkkqKFXxJhgMjEI0=@emersion.fr>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0066850456=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0066850456==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GsxDkZ4vkWQEyQr3HdEFhTAKOuK1HAH5A"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GsxDkZ4vkWQEyQr3HdEFhTAKOuK1HAH5A
Content-Type: multipart/mixed; boundary="03BPJXZ8xkWNGLReAz8cV5HkbneTJhlej";
 protected-headers="v1"
From: Marius Vlad <marius.vlad@collabora.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <60c3fb6c-651a-0122-44d5-30895bbcb22c@collabora.com>
Subject: Re: [PATCH v2] drm: two planes with the same zpos have undefined
 ordering
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <CAKMK7uEEuUpD_eni6wr=7sEadnYypd=7Ojf5zQ0tgXQov4F3mQ@mail.gmail.com>
 <1hklN2_EspD_s4vA3fdCCkVN9jeARGhmtkSGWDyVus-0ryZFs4xftUYRp_Z4pzsikJActaDVaTUoPNfBd-QitQX_JJTXkkqKFXxJhgMjEI0=@emersion.fr>
In-Reply-To: <1hklN2_EspD_s4vA3fdCCkVN9jeARGhmtkSGWDyVus-0ryZFs4xftUYRp_Z4pzsikJActaDVaTUoPNfBd-QitQX_JJTXkkqKFXxJhgMjEI0=@emersion.fr>

--03BPJXZ8xkWNGLReAz8cV5HkbneTJhlej
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/17/19 8:24 PM, Simon Ser wrote:
> Currently the property docs don't specify whether it's okay for two pla=
nes to
> have the same zpos value and what user-space should expect in this case=
=2E
>=20
> The rule mentionned in the past was to disambiguate with object IDs. Ho=
wever
> some drivers break this rule (that's why the ordering is documented as
> unspecified in case the zpos property is missing). Additionally it does=
n't
> really make sense for a driver to user identical zpos values if it know=
s their
> relative position: the driver can just pick different values instead.
>=20
> So two solutions would make sense: either disallow completely identical=
 zpos
> values for two different planes, either make the ordering unspecified. =
To allow
> drivers that don't know the relative ordering between two planes to sti=
ll
> expose the zpos property, choose the latter solution.
>=20
> Additionally, update the drm_plane_state.zpos docs to clarify that zpos=

> disambiguation via plane object IDs is a recommendation for drivers, no=
t
> something user-space can rely on.
>=20
> v2: clarify drm_plane_state.zpos docs (Daniel)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Marius Vlad <marius.vlad@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_blend.c | 8 ++++----
>  include/drm/drm_plane.h     | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index d02709dd2d4a..51bd5454e50a 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -132,10 +132,10 @@
>   *	planes. Without this property the primary plane is always below the=
 cursor
>   *	plane, and ordering between all other planes is undefined. The posi=
tive
>   *	Z axis points towards the user, i.e. planes with lower Z position v=
alues
> - *	are underneath planes with higher Z position values. Note that the =
Z
> - *	position value can also be immutable, to inform userspace about the=

> - *	hard-coded stacking of overlay planes, see
> - *	drm_plane_create_zpos_immutable_property().
> + *	are underneath planes with higher Z position values. Two planes wit=
h the
> + *	same Z position value have undefined ordering. Note that the Z posi=
tion
> + *	value can also be immutable, to inform userspace about the hard-cod=
ed
> + *	stacking of overlay planes, see drm_plane_create_zpos_immutable_pro=
perty().

stacking of overlay (and or) scanout planes?


>   *
>   * pixel blend mode:
>   *	Pixel blend mode is set up with drm_plane_create_blend_mode_propert=
y().
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index cd5903ad33f7..7ac68057b19d 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -141,9 +141,9 @@ struct drm_plane_state {
>  	 * Priority of the given plane on crtc (optional).
>  	 *
>  	 * Note that multiple active planes on the same crtc can have an
> -	 * identical zpos value. The rule to solving the conflict is to compa=
re
> -	 * the plane object IDs; the plane with a higher ID must be stacked o=
n
> -	 * top of a plane with a lower ID.
> +	 * identical zpos value. To solve the conflict, the recommendation to=

> +	 * drivers to avoid surprises is to compare the plane object IDs; the=

> +	 * plane with a higher ID is stacked on top of a plane with a lower I=
D.
>  	 *
>  	 * See drm_plane_create_zpos_property() and
>  	 * drm_plane_create_zpos_immutable_property() for more details.
> --
> 2.23.0
>=20
>=20

--=20
Marius Vlad


--03BPJXZ8xkWNGLReAz8cV5HkbneTJhlej--

--GsxDkZ4vkWQEyQr3HdEFhTAKOuK1HAH5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAl2CEXUACgkQ9jQS5glH
1u9xRg//R5kDMFChvwpHEIyHLx5e8NGISqFaknQJ6RVgmSE/GvGh5vYE1G5pDEHO
7qJxBpJ1zcrU52DIhdXGsMS3dq3Mir63jLzrVY1G9533Yhs5fH6jQRl9h2QT/19F
ENc5/yuQcy1NWRgih33Byt6po9332aJqWbL7977X6Eeq4q0tYJGMnWpFYa86p7cg
eDqA4ElriaUVR+WCn/cADqKkftas5N0NTGUP8aLxfHSbjSN0z3thOgZpZGxFljD/
goanR2iNFYNPSJe54DQI7KsEeeYPAZ9m1Yxdgqo/6cH5NQJl+HOi7MPv7ljeDA1x
myaYBgcUrzpNqFyOGJ+PuPl8m9ccd+ajrGKJq8jPO7oJ8s32Jg1CG1gzxnYRJTNK
a6K5d3lp13VPUfrLhPB1lE4uSyey3iozpUD7eLu9fefb4vuvfz0D7KKYYCopXArd
lorRogpRfA5KGvqKGJdwKnUC1e70GUKG3a6RTxcAh8Y5eBQe29r0u0BwDvXklZT+
/XBg1GBzhjzw2Cn7UcH63RyH1bXMG/hy5Kiz+VHEoxp+kXeSJAHPzg5wH7IVgghp
HBIIZKHXhJEolej4H0/OkVIimzfWqTf6sM+Q+3sK0ZRku9m3+HoTSD4ePCSW0fE3
g7AAzE7S9hlSdvmvAv8zpJfZ4Do7WWhwO3f1bTPzCAiLvoa87vI=
=4XFX
-----END PGP SIGNATURE-----

--GsxDkZ4vkWQEyQr3HdEFhTAKOuK1HAH5A--

--===============0066850456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0066850456==--
