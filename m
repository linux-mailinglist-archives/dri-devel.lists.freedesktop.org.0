Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E030B31532
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B859C10EAAF;
	Fri, 22 Aug 2025 10:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAD210EAAF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:24:12 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 384911F00062
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:24:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 85895B01C5D; Fri, 22 Aug 2025 10:24:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id C43A7B01C52;
 Fri, 22 Aug 2025 10:23:59 +0000 (UTC)
Date: Fri, 22 Aug 2025 12:23:57 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: Cleanup v3s mixer config fields ordering and
 indentation
Message-ID: <aKhFPRP8ILNkKAvy@shepard>
References: <20250704154149.3464461-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MlV5q36HRY4ckIBP"
Content-Disposition: inline
In-Reply-To: <20250704154149.3464461-1-paulk@sys-base.io>
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


--MlV5q36HRY4ckIBP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 04 Jul 25, 17:41, Paul Kocialkowski wrote:
> The v3s mixer config definition is a bit messy. Tidy it up.
> No function change is intended.

This patch didn't make it in the previous cycle.
Would it be possible to pick it up this time?

Thanks!

Paul

> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 8b41d33baa30..674b55f218fc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -670,12 +670,12 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer=
1_cfg =3D {
>  };
> =20
>  static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg =3D {
> -	.vi_num =3D 2,
> -	.ui_num =3D 1,
> -	.scaler_mask =3D 0x3,
> -	.scanline_yuv =3D 2048,
> -	.ccsc =3D CCSC_MIXER0_LAYOUT,
> -	.mod_rate =3D 150000000,
> +	.ccsc		=3D CCSC_MIXER0_LAYOUT,
> +	.mod_rate	=3D 150000000,
> +	.scaler_mask	=3D 0x3,
> +	.scanline_yuv	=3D 2048,
> +	.ui_num		=3D 1,
> +	.vi_num		=3D 2,
>  };
> =20
>  static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg =3D {
> --=20
> 2.49.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--MlV5q36HRY4ckIBP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmioRT0ACgkQhP3B6o/u
lQzkTg//WFiyxqhfUY6FczVWL/ImHTtICZrkvrBZX0dJV2uHqYzypnnyT6NxmMxk
SDXCSLmVFsSMoND1aiqS5dc4eYOPlSmo/hpJib1+nfo+1VTrB7dgafngaUpgcEXh
JBfaN92tUfhO+Aw/XSDY3Bh1vdYJt4LH/IfSpN7OFnULBw6/VVwVkOYUm/UvSFzf
RUGZ3WCqf/N9pVUDCTV8uRU104hhbZk8l6N4afTKcR3X6ol399SLZzZz+7y0UJWl
fU9229JlB9ndl1Pg5LsQz/eclJA0KFNAe6+EN1lHxDqReaiAtziTtIVzgdQLtpga
AUYSqY9oVinh0Bl2ENP5MmFFCBTduNN6/HK6IXH6wPIdMUpmU24w/Rw+MtUl/c4+
xkZ5L6U5idcFfEW/R+Tv8fyOVeCLXxDGg0gAhyo6wcf9k2HKDI1IV/FVeCaCs5wD
ztKSieqm6mr6xBIvdL9vKeLEAik1AmlNkpYQo4HFirxRCr+M/UlUeFf3NSlWhfx4
9WyDwMcctDD8ESW3V2Q3oYAPmQPh84oX2uMDyd19djNwcy+rxwvWmQc4X4ESFZDe
nE7BYg6g1UvJlLBIpWxEACNoX+oBJ/AIVtReJmmWB2wXFpTTZo5jOobrDnYHxOe1
ck45AXtCLJVrvt+LfBPR3XxAYalBQfW6zYsLjXUh+OlC7yq9Giw=
=aSaL
-----END PGP SIGNATURE-----

--MlV5q36HRY4ckIBP--
