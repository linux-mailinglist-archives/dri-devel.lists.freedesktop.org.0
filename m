Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444248A4E45
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EB61124DC;
	Mon, 15 Apr 2024 12:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PLJGMoKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D2D1124D7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713182424;
 bh=FtCbo2FIfg5VTMuCbMaZx+mizFTYLMvWC/gcY6zEBVE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PLJGMoKuQ+3X9Iw1hvJe5e/NFJp64nSWk4vHsQfJL4XX7u9RYInm/R1bpjqMzQe2W
 E7S6BsRA1qkcLnocDGb0wFBAuzPVCsb33o+1DY9FLOnm+xdYXiM7vCufWnjS0b+12X
 ro4mWCyyf9cGfthdRTZfjOuDpibjSozKAfw+Jzu8zWfPxZQzWftehPKimYcm9RMe4X
 MkSDdzRNG4f0snM+OFQKES6W4VbnzjiznUTCbSyhnY6fHCNqqVYjiFR4XUWUa7SGqa
 XwZzSDSBO/tE33HmLrMfGYBkqjiNUCj8fw7qMHNDPYkjXylooAkhdtKU1nC0RGP8w+
 A3lwWyZ2KA77A==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F7E2378000E;
 Mon, 15 Apr 2024 12:00:23 +0000 (UTC)
Date: Mon, 15 Apr 2024 15:00:21 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 3/3] drm/fourcc: Add documentation around drm_format_info
Message-ID: <20240415150021.13d9b637.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-google-drm-doc-v1-3-033d55cc8250@bootlin.com>
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-3-033d55cc8250@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//3ENGSCnsAF3Vk.9Cy9Ro/h";
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

--Sig_//3ENGSCnsAF3Vk.9Cy9Ro/h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 12:04:07 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Let's provide more details about the drm_format_info structure because
> its content may not be straightforward for someone not used to video
> formats and drm internals.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  include/drm/drm_fourcc.h | 45 ++++++++++++++++++++++++++++++++++++++----=
---
>  1 file changed, 38 insertions(+), 7 deletions(-)
>=20
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index ccf91daa4307..66cc30e28f79 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -58,6 +58,44 @@ struct drm_mode_fb_cmd2;
> =20
>  /**
>   * struct drm_format_info - information about a DRM format
> + *
> + * A drm_format_info describes how planes and pixels are stored in memor=
y.
> + *
> + * Some format like YUV can have multiple planes, counted in @num_planes=
. It
> + * means that a full pixel can be stored in multiple non-continuous buff=
ers.
> + * For example, NV12 is a YUV format using two planes: one for the Y val=
ues and
> + * one for the UV values.
> + *
> + * On each plane, the "pixel" unit can be different in case of subsampli=
ng. For
> + * example with the NV12 format, a pixel in the UV plane is used for fou=
r pixels
> + * in the Y plane.
> + * The fields @hsub and @vsub are the relation between the size of the m=
ain
> + * plane and the size of the subsampled planes in pixels:
> + *	plane[0] width =3D hsub * plane[1] width
> + *	plane[0] height =3D vsub * plane[1] height

This makes it sound like plane[1] would be the one determining the
image size. It is plane[0] that determines the image size (I don't know
of a format that would have it otherwise), and vsub and hsub are used
as divisors. It's in their name, too: horizontal/vertical sub-sampling.

This is important for images with odd dimensions. If plane[1]
determined the image size, it would be impossible to have odd sized
NV12 images, for instance.

Odd dimensions also imply something about rounding the size of the
sub-sampled planes. I guess the rounding is up, not down?

> + *
> + * In some formats, pixels are not independent in memory. It can be a pa=
cked

"Independent in memory" sounds to me like it describes sub-sampling:
some pixel components are shared between multiple pixels. Here you seem
to refer to just packing: one pixel's data may take a fractional number
of bytes.

> + * representation to store more pixels per byte (for example P030 uses 4=
 bytes
> + * for three 10 bit pixels). It can also be used to represent tiled form=
ats,

s/tiled/block/

Tiling is given by format modifiers rather than formats.

> + * where a continuous buffer in memory can represent a rectangle of pixe=
ls (for
> + * example, in DRM_FORMAT_Y0L0, a buffer of 8 bytes represents a 2x2 pix=
el
> + * region of the picture).
> + *	The field @char_per_block is the size of a block on a specific plane,=
 in
> + *	bytes.
> + *	The fields @block_w and @block_h are the size of a block in pixels.
> + *
> + * The older format representation (which only uses @cpp, kept for histo=
rical

Move the paren to: representation which only uses @cpp (kept

so that the sentence is still understandable if one skips the
parenthesised part.

> + * reasons because there are a lot of places in drivers where it's used)=
 is
> + * assuming that a block is always 1x1 pixel.
> + *
> + * To keep the compatibility with older format representations and treat=
 block
> + * and non-block formats in the same way one should use:
> + *	- @char_per_block to access the size of a block on a specific plane, =
in
> + *	bytes.
> + *	- drm_format_info_block_width() to access the width of a block of a
> + *	specific plane, in pixels.
> + *	- drm_format_info_block_height() to access the height of a block of a
> + *	specific plane, in pixels.
>   */
>  struct drm_format_info {
>  	/** @format: 4CC format identifier (DRM_FORMAT_*) */
> @@ -97,13 +135,6 @@ struct drm_format_info {
>  		 * formats for which the memory needed for a single pixel is not
>  		 * byte aligned.
>  		 *
> -		 * @cpp has been kept for historical reasons because there are
> -		 * a lot of places in drivers where it's used. In drm core for
> -		 * generic code paths the preferred way is to use
> -		 * @char_per_block, drm_format_info_block_width() and
> -		 * drm_format_info_block_height() which allows handling both
> -		 * block and non-block formats in the same way.
> -		 *
>  		 * For formats that are intended to be used only with non-linear
>  		 * modifiers both @cpp and @char_per_block must be 0 in the
>  		 * generic format table. Drivers could supply accurate
>=20

Other than that, sounds fine to me.

Perhaps one thing to clarify is that chroma sub-sampling and blocks are
two different things. Chroma sub-sampling is about the resolution of
the chroma (image). Blocks are about packing multiple pixels' components
into a contiguous addressable block of memory. Blocks could appear
inside a separate sub-sampled UV plane, for example.


Thanks,
pq

--Sig_//3ENGSCnsAF3Vk.9Cy9Ro/h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYdFtUACgkQI1/ltBGq
qqd1Dg/7BbEa30DJPOqyRDllOe5Ct0+mOio7v37ZwOF10plS1JNUyH+ELn+bIGcs
NBAHqCC+vEHAgpKAKkwOmVFd8oBpXQ6C5Ze92T5msUCSjdexEQZs9Jh6sZkk8x4W
p2avkgqETfiEapWQgmvRSGx3JNBN0REE3KtBqCf5tcKZtJejcXpjDcTMWelT1vf9
gKtc2WveEvcz1Fo8DceojYkvSaNQIWhNx+6LMQuE08od9fCxBub3kVAArWG++Vxy
2RmMipBfDW/Ere1e/ZqlLa6KMTMboavwYolgAOeTtoIhO0ayWyEBm5AORL+9LHiw
E+Dh5rjGlGMXD7+iab0hy8DCuK2UMxAnaJHawCQicVgW0EUvNio9usUX/oNJvNwZ
o2zHAxl70VZ/3H+yLeL88dj9GK4lgiS/olPc333V2zrjteCKRIP1RtXbUgyeztm/
R02pEVJZu0YghHDJqCUtbVBkUHq/y/TqEzTh2DurmOAAWVaVaAcToxUA9SptM1e4
tLuVN+CKI0UJwE1+S1x3uSGcHAIJV93lE0+BMONu8kRWOarAusrlBbQvPUoZNxSh
ngwA0yZ0t5Fdt0EScRL2a9Jw8sTfQa3IQkoqs5QMZcoH+9fG8A4zwMFpaC/S1fai
KlwZWYmj7IW1fI59iKDIvn7YZiIByQhn8dqzbvcTL3cC+JmyVRs=
=/Wnb
-----END PGP SIGNATURE-----

--Sig_//3ENGSCnsAF3Vk.9Cy9Ro/h--
