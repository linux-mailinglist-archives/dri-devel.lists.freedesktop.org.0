Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7EA8A4DD3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B8911231C;
	Mon, 15 Apr 2024 11:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l7pREGxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C5F11231C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713180992;
 bh=NfQL2hmUBg97tRXNR6BF3G9eOGsFEkKIBSmc/R4PuPk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l7pREGxuYpAUoYOQydmitKjbEPUv2w5Uwh7YzteYvieYrtUEWUkM71dKHeNBVtqvV
 A5AT7hbGK4xn4Fiy4c4uu1szX68IbuLFSzZ/PZJNmNSIF2x2COxnLGy8v3Qtpj5Rc2
 hFCl1Esn82iZSVLaOC2rHO6Axkp25UPg0SA8TKFkmgX+rWcFE4zu/tCWOTQeydEmTd
 w2G2QPf//7uIrjJFBgrM1GFfazGhVjCPVdo1Q64wRvkJ4dh+4i7JGh7igEODVrIkjX
 tqJu2IoUbOkDtVD0fST6puMgj0jPOLIc2uWP4LkqAhobqoqOofg9f9Qf5vVNQfmcTD
 9LuwYoXhzEIhg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97C253781FE9;
 Mon, 15 Apr 2024 11:36:31 +0000 (UTC)
Date: Mon, 15 Apr 2024 14:36:22 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/3] drm: drm_blend.c: Improve
 drm_plane_create_rotation_property kernel doc
Message-ID: <20240415143622.7e600508.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-google-drm-doc-v1-2-033d55cc8250@bootlin.com>
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-2-033d55cc8250@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.eSeiLxVd/0e0PuL12Vqoh1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/.eSeiLxVd/0e0PuL12Vqoh1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 12:04:06 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> The expected behavior of the rotation property was not very clear. Add
> more examples to explain what is the expected result.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 52 +++++++++++++++++++++++++++++++++------=
------
>  1 file changed, 38 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 8d4b317eb9d7..6fbb8730d8b0 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -104,6 +104,9 @@
>   *	Without this property the rectangle is only scaled, but not rotated or
>   *	reflected.
>   *
> + *	See drm_plane_create_rotation_property() for details about the expect=
ed rotation and
> + *	reflection behavior.

I think internal function docs should be referring to UAPI docs, and
not vice versa. Internal functions can change, but UAPI cannot.

> + *
>   *	Possbile values:
>   *
>   *	"rotate-<degrees>":
> @@ -114,18 +117,6 @@
>   *		Signals that the contents of a drm plane is reflected along the
>   *		<axis> axis, in the same way as mirroring.
>   *
> - *	reflect-x::
> - *
> - *			|o |    | o|
> - *			|  | -> |  |
> - *			| v|    |v |
> - *
> - *	reflect-y::
> - *
> - *			|o |    | ^|
> - *			|  | -> |  |
> - *			| v|    |o |
> - *
>   * zpos:
>   *	Z position is set up with drm_plane_create_zpos_immutable_property() =
and
>   *	drm_plane_create_zpos_property(). It controls the visibility of overl=
apping
> @@ -266,8 +257,41 @@ EXPORT_SYMBOL(drm_plane_create_alpha_property);
>   *
>   * Rotation is the specified amount in degrees in counter clockwise dire=
ction,
>   * the X and Y axis are within the source rectangle, i.e.  the X/Y axis =
before
> - * rotation. After reflection, the rotation is applied to the image samp=
led from
> - * the source rectangle, before scaling it to fit the destination rectan=
gle.
> + * rotation.
> + *
> + * Here are some examples of rotation and reflections:
> + *
> + * |o  +|  REFLECT_X  |+  o|
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |    |             |    |
> + *
> + * |o   |  REFLECT_Y  |+   |
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |+   |             |o   |
> + *
> + * |o  +|  ROTATE_90  |+   |
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |    |             |o   |
> + *
> + * |o   |  ROTATE_180 |   +|
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |+   |             |   o|
> + *
> + * |o   |  ROTATE_270 |+  o|
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |+   |             |    |
> + *
> + * Rotation and reflection can be combined to handle more situations. In=
 this condition, the
> + * reflection is applied first and the rotation in second.

When going in which direction? Is the first image the FB source
rectangle contents, and the second image what the plane looks like in
CRTC frame of reference?

> + *
> + * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REF=
LECT_X is:
> + *
> + * |o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |  =3D=3D=3D=3D=3D=3D=3D=3D> =
 |    |
> + * |    |             |    |             |+   |
> + *
> + * It is not possible to pass multiple rotation at the same time. (i.e R=
OTATE_90 | ROTATE_180 is
> + * not the same as ROTATE_270 and is not accepted).
>   */
>  int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
>=20

These are definitely improvements. I think they should just be in the
UAPI section rather than implementation details.

Disclaimer again to everyone else: I cannot tell if this is the correct
documentation or its inverse.


Thanks,
pq

--Sig_/.eSeiLxVd/0e0PuL12Vqoh1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYdETYACgkQI1/ltBGq
qqf2Ew/+Masv8B8wRuYbVIcLdgdidzSstdy8f/bnjNyM9e3izGX7dQnrgR9gGPIS
CIqHP79Sk55p+SHxATK1MslRNDxVwDWVhOFJpG59IP4cgbqcGZUxFy9/lIFbMlx6
0TKlQSdnWVmw1IeKAHqBn0e/85SvbNpMx6XVs8FVp0bcz42kalyAf8fshSddV0AJ
WlneYyDt82K/+m7DBIDeUR29PKLbCYNldg29beI1U4Yfy07CXtjr0OCafmfoU8pV
8rarCnpniHlM6sL0/oOr5NFrDeh9OZ/s/x0SYPgONMGLFb9xm0qmp1QvZtgXVATP
od2BpB0AE2az09BbqTJF2EDi3THU9sW2kdMl4vDehJ9X3Muo5vQZAsLuh/7GXBYt
1RUU//gTl4Ocbj5iF7vDTGe6JyzxWTCvxiIaWEOi80S/0pxAtRdxlCn5tpiIH+sk
3GIHhqGZHkcPy7Q8qMcUMklnnvHiAhJDn8Ed0c7txY5kVpP84XZZWhk6qeNcvfl5
Xhbt9FiFXW6h8+Sz+dn9QdzWnjRXPTp+rL52GsquQ6HDbwic6nqNZKVP6lbVkF1x
K721iSjFqhxt7EdMuVKzzzi7ZjrkPekWDP3fJqkL0tFE3IHJ4wpDn+IJzkAYDjvx
51jSU9nFwuzNIlfhHP14s/7EiqkWe8OgzjdjfcnRNh+dC5P9DN8=
=nY+N
-----END PGP SIGNATURE-----

--Sig_/.eSeiLxVd/0e0PuL12Vqoh1--
