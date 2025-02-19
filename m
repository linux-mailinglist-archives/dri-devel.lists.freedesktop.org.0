Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F25A3BB4E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 11:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D257710E7B0;
	Wed, 19 Feb 2025 10:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VXegrAgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC0F10E7B0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 10:15:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 469CCA42072;
 Wed, 19 Feb 2025 10:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EF8C4CED1;
 Wed, 19 Feb 2025 10:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739960146;
 bh=cRfz3fecS+ZzGox7S9ijrv4PWpD4vQo2wXmFuIzrhjg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=VXegrAgg6V1RaMvhCZn3Rjv+M9XVFAfedNtOOaZk3oyIApGRv1m9zs1S6Im3wzmRv
 SY3VZNzl3qmYGcp6u/3BFuHEc396InLHbh21fnYu6ptXbX80Bbr7THvgkkr0AUdyJv
 paso2yTPorlJtQuFxqsrYAXKg52NUG91ZrQ6/OKpDxEC/ZFiZEg6p7Drlgc1mbs4xJ
 6u6vLKzKMan3az9mwNuabpr8dqNJQnztuOvsGIDQ+pZlaOSAvWuSCMjYU+F3iLolrK
 /xOh6/R6SAmP4fglaQN8W3e37UTIRI1HdfkVffJ4QXPFWiE0f26dGRaExrcsUulVDx
 lHfklGad3HJdA==
Date: Wed, 19 Feb 2025 11:15:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, seanpaul@google.com, 
 marcheu@google.com, nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20250219-inventive-micro-parrot-c24846@houat>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
 <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
 <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
 <20250205-pristine-perch-of-abundance-7abac1@houat>
 <Z6OEd329pDNRrL5v@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jan25b3eajgltkcf"
Content-Disposition: inline
In-Reply-To: <Z6OEd329pDNRrL5v@louis-chauvet-laptop>
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


--jan25b3eajgltkcf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 04:32:07PM +0100, Louis Chauvet wrote:
> On 05/02/25 - 09:55, Maxime Ripard wrote:
> > On Mon, Jan 27, 2025 at 11:48:23AM +0100, Louis Chauvet wrote:
> > > On 26/01/25 - 18:06, Maxime Ripard wrote:
> > > > On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote:
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
> > > > > +	 *
> > > > > +	 * Test cases for conversion between YUV BT601 full range and R=
GB
> > > > > +	 * using the ITU-R BT.601 weights.
> > > > > +	 */
> > > >=20
> > > > What are the input and output formats?
> > > >=20
> > > > Ditto for all the other tests.
> > >=20
> > > There is no really "input" and "output" format, they are reference va=
lues=20
> > > for conversion, you should be able to use it in both direction. They =
are=20
> > > generated by RGB_to_YCbCr (RGB input, YUV output) just because it was=
=20
> > > easier to create the colors from RGB values.
> >=20
> > RGB and YUV aren't formats, they are color models. XRGB8888 is a format.
> > NV12 is a format.
> >
> > > If you think we should specify what is was used as input and output t=
o=20
> > > generate those values, I can modify the comment to:
> > >=20
> > > 	Tests cases for color conversion generated by converting RGB=20
> > > 	values to YUV BT601 full range using the ITU-R BT.601 weights.
> >=20
> > My point is that those comments should provide a way to reimplement the
> > test from scratch, and compare to the actual implementation. It's useful
> > when you have a test failure and start to wonder if the implementation
> > or the test is at fault.
> >=20
> > By saying only RGB and YUV, you can't possibly do that.
>=20
> I understand your concern, but I believe there might be a slight=20
> misunderstanding. The table in question stores reference values for=20
> specific color models, not formats. Therefore, it doesn't specify any=20
> particular format like XRGB8888 or NV12.
>=20
> To clarify this, I can rename the format_pair struct to value_pair. This=
=20
> should make it clearer that we are dealing with color model values rather=
=20
> than formats.
>=20
> If you want to test a specific format conversion, such as=20
> YUV420_to_argbu16, you would need to follow a process like this:
>=20
> 	// Recreate a YUV420 data
> 	plane_1[0] =3D test_case.yuv.y
> 	plane_2[0] =3D test_case.yuv.u
> 	plane_2[1] =3D test_case.yuv.v
>=20
> 	// convertion to test from YUV420 format to argb_u16
> 	rgb_u16 =3D convert_YUV420_to_argbu16(plane_1, plane_2)
>=20
> 	// ensure the conversion is valid
> 	assert_eq(rgb_u16, test_case.rgb)
>=20
> The current test is not performing this kind of format conversion.=20
> Instead, it verifies that for given (y, u, v) values, the correct (r, g,=
=20
> b, a) values are obtained.

You already stated that you check for the A, R, G, and B components. On
how many bits are the values you are comparing stored? The YUV values
you are comparing are stored on how many bits for each channel? With
subsampling?

If you want to compare values, you need to encode a given color into
bits, and the way that encoding is done is what the format is about.

You might not compare the memory layout but each component individually,
but it's still a format.

And then, you have the extra fun on top, like are you comparing
full-range or limited-range colors?

> In other words, it tests color model conversion, not format conversion.

No, you are testing color encoding, format and model conversions, all at
once.

Maxime

--jan25b3eajgltkcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7WvSwAKCRAnX84Zoj2+
dhuDAYClIAO0bpcjHI1iM+6c+DpGhBNvLscdYkVpYka0U82yzXOLML70cSucGM4d
VNJ2UpMBf3Rp3k6AJuW7ohwf9o2xAwnQKdrq87QXM+c9VBFfKHW4CIEzXibCURT/
Rp2Stt/42A==
=GI86
-----END PGP SIGNATURE-----

--jan25b3eajgltkcf--
