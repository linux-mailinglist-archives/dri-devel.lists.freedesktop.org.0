Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF5C9AE764
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 16:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD19010E298;
	Thu, 24 Oct 2024 14:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AWSVnsYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B253510E298
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:06:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 652E15C5FD7;
 Thu, 24 Oct 2024 14:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A58C4CECC;
 Thu, 24 Oct 2024 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729778766;
 bh=UqM6Z34E+/K+S+SxZRTtlXPQ0ZdBLSakhVgd6bJmUqM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=AWSVnsYKK9O/yPvErdiTcdH3hjVq5fpl40AxNXggq3RH8elow7SkzmyvIoF7t1bLN
 MKJIfJGa0o4pPjs4/mosmK5QSMyI+jcWowubSHxrBGrcD3Nat2tm6tSGEBLCT06mCT
 fmcmk1L+becoisluJQWDYSHNseFS1PZWGO6Y8BD3YnH2cQW2QXqiTmZh5RJPd5vtyP
 K55c4s7ezXWGC4b+l0jLOUFyi9LF9euF89lPYxjlxjtkEbJhZN/ySHNT1jJOq54qYP
 vJdBTFHjqAiJPLcwcLCf8J7qEGI2nno0lrH6v6ewqnB5MCvi/C2SgQMTqoyYvccLZ2
 mBvVhrDdGcaKA==
Date: Thu, 24 Oct 2024 16:06:03 +0200
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
Message-ID: <20241024-illustrious-puma-of-superiority-d24a4d@houat>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
 <20241007-yuv-v12-13-01c1ada6fec8@bootlin.com>
 <20241008-ingenious-calm-silkworm-3e99ba@houat>
 <ZwT6CnyYRKS9QxIS@louis-chauvet-laptop>
 <20241011-shiny-skua-of-authority-998ad3@houat>
 <Zwk2RSgfV75LVLpR@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="q6c53od3b6prp5tw"
Content-Disposition: inline
In-Reply-To: <Zwk2RSgfV75LVLpR@louis-chauvet-laptop>
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


--q6c53od3b6prp5tw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 13/15] drm/vkms: Create KUnit tests for YUV
 conversions
MIME-Version: 1.0

On Fri, Oct 11, 2024 at 04:29:25PM +0200, Louis Chauvet wrote:
> On 11/10/24 - 12:49, Maxime Ripard wrote:
> > On Tue, Oct 08, 2024 at 11:23:22AM GMT, Louis Chauvet wrote:
> > >=20
> > > Hi,=20
> > >=20
> > > > > + * The YUV color representation were acquired via the colour pyt=
hon framework.
> > > > > + * Below are the function calls used for generating each case.
> > > > > + *
> > > > > + * For more information got to the docs:
> > > > > + * https://colour.readthedocs.io/en/master/generated/colour.RGB_=
to_YCbCr.html
> > > > > + */
> > > > > +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[]=
 =3D {
> > > > > +	/*
> > > > > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > > > > +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.601"],
> > > > > +	 *                     in_bits =3D 16,
> > > > > +	 *                     in_legal =3D False,
> > > > > +	 *                     in_int =3D True,
> > > > > +	 *                     out_bits =3D 8,
> > > > > +	 *                     out_legal =3D False,
> > > > > +	 *                     out_int =3D True)
> > > > > +	 */
> > > >=20
> > > > We should really detail what the intent and expected outcome is sup=
posed
> > > > to be here. Relying on a third-party python library call for
> > > > documentation isn't great.
> > >
> > > This was requested by Pekka in the [v2] of this series.
> >=20
> > Ok.
> >=20
> > > I can add something like this before each tests, but I think having t=
he=20
> > > exact python code used may help people to understand what should be t=
he=20
> > > behavior, and refering to the python code to understand the conversio=
n.
> >=20
> > Help, sure. Be the *only* documentation, absolutely not.
> >=20
> > Let's turn this around. You run kunit, one of these tests fail:
> >=20
> >  - It adds cognitive load to try to identify and make sense of an
> >    unknown lib.
> >=20
> >  - How can we check that the arguments you provided there are the one
> >    you actually wanted to provide, and you didn't make a typo?
> >=20
> > > I can add something like this before each tests to clarify the tested=
=20
> > > case:
> > >=20
> > > 	Test cases for conversion between YUV BT601 limited range and=20
> > > 	RGB using the ITU-R BT.601 weights.
> > >=20
> > > Or maybe just documenting the structure yuv_u8_to_argb_u16_case:
> > >=20
> > > 	@encoding: Encoding used to convert RGB to YUV
> > > 	@range: Range used to convert RGB to YUV
> > > 	@n_colors: Count of test colors in this case
> > > 	@format_pair.name: Name used for this color conversion, used to=20
> > > 			   clarify the test results
> > > 	@format_pair.rgb: RGB color tested
> > > 	@format_pair.yuv: Same color as @format_pair.rgb, but converted to=
=20
> > > 			  YUV using @encoding and @range.
> > >=20
> > > What do you think?
> >=20
> > That it's welcome, but it still doesn't allow to figure out what your
> > intent was with this test 2 years from now.
>=20
> I don't really understand what you want to add. Can you explain what you=
=20
> expect here? Did you mean you want a description like this above the test=
=20
> function?

I want, for each test case, to have a documentation of what case it's
testing and what the test should expect.

So, for the first one, something like:

/*
 * Test the conversion of full range, BT601-encoded, YUVXXX pixel to
 * ARGBXXXX, for various colors. This has been generated using:
 *
 * colour.RGB_to_YCbCR(...)
 */

And there's other things you need to document. Like, it seems that you
sometimes pass different values for in_legal and out_legal, and that's
not clear to me.

It also that you uses a matrix for NV12 but are converting a different
format. This needs to be documented.

Finally, You should be documented why you are checking that the colors
difference is less than 257, and not exactly equal.

Maxime

--q6c53od3b6prp5tw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxpURwAKCRAnX84Zoj2+
dpnIAYCtzV3UTGshXlT1ay9Ij6pdu3hWrR1lndrGKgCB1XEnKmy4881AJuppJ99z
FdyPjl8Bf1/NExIEJ9JOwZpOUbCdkop0YSn90LSIqkHC97ab1CPRsC0EIJOtrseB
NAvTbA189Q==
=mQrx
-----END PGP SIGNATURE-----

--q6c53od3b6prp5tw--
