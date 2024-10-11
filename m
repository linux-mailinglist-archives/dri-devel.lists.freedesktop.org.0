Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FEA99A1F6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 12:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB39E10EAB4;
	Fri, 11 Oct 2024 10:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dX6WtH0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB4C10EAB4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 10:49:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31001A435D7;
 Fri, 11 Oct 2024 10:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40826C4CEC3;
 Fri, 11 Oct 2024 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728643786;
 bh=iGFL206iPeIYfSH1TBbeBoo4QjA57peaFogEpgxvHaY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=dX6WtH0V6ZNIjt9AkDk0vWgKbSJZxxfDUi0XjFdOBcEdKoll9pOKof+qeG/lBGunA
 4abGUABlQQs99occU6ANB1zXLrjKpArDtiGj8JhdDTvgJhsJRCbGxfPk9VCtK7n8pT
 yOO/kYp7XciOLUwDBVj/KQ/xi0IggTYYYsvbR727zhrQO2fHm0q/K/e77av/9OL/BV
 Xgcf1qdBdyQ2o48/kck0jAcE6ZmuHiLXrplJiyObmnWNpqSv8BZoekO+CWVVJYoILu
 2vXqrYOsu7zzfrJp6KdRzpmx8gc+f9GUzVV9JaunRqGGqczaQ4sZcgxYQ9D/fqAn+i
 uvDKEAh44kvxw==
Date: Fri, 11 Oct 2024 12:49:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Maaara Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona@ffwll.ch>,
 rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v12 13/15] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20241011-shiny-skua-of-authority-998ad3@houat>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
 <20241007-yuv-v12-13-01c1ada6fec8@bootlin.com>
 <20241008-ingenious-calm-silkworm-3e99ba@houat>
 <ZwT6CnyYRKS9QxIS@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ft4zr7lbcug3nly4"
Content-Disposition: inline
In-Reply-To: <ZwT6CnyYRKS9QxIS@louis-chauvet-laptop>
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


--ft4zr7lbcug3nly4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 11:23:22AM GMT, Louis Chauvet wrote:
>=20
> Hi,=20
>=20
> > > + * The YUV color representation were acquired via the colour python =
framework.
> > > + * Below are the function calls used for generating each case.
> > > + *
> > > + * For more information got to the docs:
> > > + * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_Y=
CbCr.html
> > > + */
> > > +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] =3D=
 {
> > > +	/*
> > > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > > +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.601"],
> > > +	 *                     in_bits =3D 16,
> > > +	 *                     in_legal =3D False,
> > > +	 *                     in_int =3D True,
> > > +	 *                     out_bits =3D 8,
> > > +	 *                     out_legal =3D False,
> > > +	 *                     out_int =3D True)
> > > +	 */
> >=20
> > We should really detail what the intent and expected outcome is supposed
> > to be here. Relying on a third-party python library call for
> > documentation isn't great.
>
> This was requested by Pekka in the [v2] of this series.

Ok.

> I can add something like this before each tests, but I think having the=
=20
> exact python code used may help people to understand what should be the=
=20
> behavior, and refering to the python code to understand the conversion.

Help, sure. Be the *only* documentation, absolutely not.

Let's turn this around. You run kunit, one of these tests fail:

 - It adds cognitive load to try to identify and make sense of an
   unknown lib.

 - How can we check that the arguments you provided there are the one
   you actually wanted to provide, and you didn't make a typo?

> I can add something like this before each tests to clarify the tested=20
> case:
>=20
> 	Test cases for conversion between YUV BT601 limited range and=20
> 	RGB using the ITU-R BT.601 weights.
>=20
> Or maybe just documenting the structure yuv_u8_to_argb_u16_case:
>=20
> 	@encoding: Encoding used to convert RGB to YUV
> 	@range: Range used to convert RGB to YUV
> 	@n_colors: Count of test colors in this case
> 	@format_pair.name: Name used for this color conversion, used to=20
> 			   clarify the test results
> 	@format_pair.rgb: RGB color tested
> 	@format_pair.yuv: Same color as @format_pair.rgb, but converted to=20
> 			  YUV using @encoding and @range.
>=20
> What do you think?

That it's welcome, but it still doesn't allow to figure out what your
intent was with this test 2 years from now.

Maxime

--ft4zr7lbcug3nly4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwkCvwAKCRAnX84Zoj2+
dndpAX9qewITSorE5xkloVDv05qqXxzUgriyCrfDgT92WWF0hboSYYYb3XiAXcXI
5WNcUckBgOfu6zX8wo6A2M1haWgW+g/S8IMW8CI6gtjxVhPXutoD1iSMyEo74eXA
ARSWWO4+Vg==
=91dx
-----END PGP SIGNATURE-----

--ft4zr7lbcug3nly4--
