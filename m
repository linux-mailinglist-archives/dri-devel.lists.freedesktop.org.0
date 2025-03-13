Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521F5A5F823
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8485E10E8B3;
	Thu, 13 Mar 2025 14:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EaE0m28X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4E910E8B3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:29:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3D54C5C57A3;
 Thu, 13 Mar 2025 14:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624F9C4CEDD;
 Thu, 13 Mar 2025 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741876194;
 bh=9U91AR0dBcU3SeJ1vVvLvI2baPAVBY+ySu4H/3uX8to=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EaE0m28XQuIa1uSp9kwRIDan2AYDcIfAYcgcgsQva5IjduMjgS1XOSQV3WfEZmMmA
 Zu3jRjqzAnvDh7WVyzRHpxCMQ946J+RaUXwKX7hZ/QqVnE2ZmLzuWlZmxT4/QOSy0d
 RlX5FmfBbN4EFFVNCeSSZUcqJvSIMRrlWNwoFnRIRaPOUAmq+OLdIrD2Zh7PuawpyD
 GFfyYbPASuPH0Cmn8p92EKE2K88qtkaCbIrB1YHAdIfyYg1SQM5J/zVieN1HBVnsss
 VVqY+fVuQKOVGP7wS86Nlbo2y+s2Vaj7GpikLkyVlz38FekHLOFSPhVBdeMOryEC0w
 HcyQkgLUVGoiQ==
Date: Thu, 13 Mar 2025 15:29:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20250313-pristine-pretty-rabbit-a29030@houat>
References: <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
 <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
 <20250205-pristine-perch-of-abundance-7abac1@houat>
 <Z6OEd329pDNRrL5v@louis-chauvet-laptop>
 <20250219-inventive-micro-parrot-c24846@houat>
 <ce5fb86d-f3bc-4196-9cfd-8af41a83beb1@bootlin.com>
 <20250307-glaring-kiwi-of-teaching-d5ddd4@houat>
 <6fa7a17f-3932-4b93-a3c7-885619f8ec73@bootlin.com>
 <20250310111259.4e18d550@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="263hj7gfnktphh5g"
Content-Disposition: inline
In-Reply-To: <20250310111259.4e18d550@eldfell>
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


--263hj7gfnktphh5g
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0

Hi,

On Mon, Mar 10, 2025 at 11:12:59AM +0200, Pekka Paalanen wrote:
> On Fri, 7 Mar 2025 15:50:41 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>=20
> > Le 07/03/2025 =E0 11:20, Maxime Ripard a =E9crit=A0:
> > > On Wed, Feb 19, 2025 at 02:35:14PM +0100, Louis Chauvet wrote: =20
> > >>
> > >>
> > >> Le 19/02/2025 =E0 11:15, Maxime Ripard a =E9crit=A0: =20
> > >>> On Wed, Feb 05, 2025 at 04:32:07PM +0100, Louis Chauvet wrote: =20
> > >>>> On 05/02/25 - 09:55, Maxime Ripard wrote: =20
> > >>>>> On Mon, Jan 27, 2025 at 11:48:23AM +0100, Louis Chauvet wrote: =
=20
> > >>>>>> On 26/01/25 - 18:06, Maxime Ripard wrote: =20
> > >>>>>>> On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote: =
=20
> > >>>>>>>> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_case=
s[] =3D {
> > >>>>>>>> +	/*
> > >>>>>>>> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > >>>>>>>> +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.60=
1"],
> > >>>>>>>> +	 *                     in_bits =3D 16,
> > >>>>>>>> +	 *                     in_legal =3D False,
> > >>>>>>>> +	 *                     in_int =3D True,
> > >>>>>>>> +	 *                     out_bits =3D 8,
> > >>>>>>>> +	 *                     out_legal =3D False,
> > >>>>>>>> +	 *                     out_int =3D True)
> > >>>>>>>> +	 *
> > >>>>>>>> +	 * Test cases for conversion between YUV BT601 full range an=
d RGB
> > >>>>>>>> +	 * using the ITU-R BT.601 weights.
> > >>>>>>>> +	 */ =20
> > >>>>>>>
> > >>>>>>> What are the input and output formats?
> > >>>>>>>
> > >>>>>>> Ditto for all the other tests. =20
> > >>>>>>
> > >>>>>> There is no really "input" and "output" format, they are referen=
ce values
> > >>>>>> for conversion, you should be able to use it in both direction. =
They are
> > >>>>>> generated by RGB_to_YCbCr (RGB input, YUV output) just because i=
t was
> > >>>>>> easier to create the colors from RGB values. =20
> > >>>>>
> > >>>>> RGB and YUV aren't formats, they are color models. XRGB8888 is a =
format.
> > >>>>> NV12 is a format.
> > >>>>> =20
> > >>>>>> If you think we should specify what is was used as input and out=
put to
> > >>>>>> generate those values, I can modify the comment to:
> > >>>>>>
> > >>>>>> 	Tests cases for color conversion generated by converting RGB
> > >>>>>> 	values to YUV BT601 full range using the ITU-R BT.601 weights. =
=20
> > >>>>>
> > >>>>> My point is that those comments should provide a way to reimpleme=
nt the
> > >>>>> test from scratch, and compare to the actual implementation. It's=
 useful
> > >>>>> when you have a test failure and start to wonder if the implement=
ation
> > >>>>> or the test is at fault.
> > >>>>>
> > >>>>> By saying only RGB and YUV, you can't possibly do that. =20
> > >>>>
> > >>>> I understand your concern, but I believe there might be a slight
> > >>>> misunderstanding. The table in question stores reference values for
> > >>>> specific color models, not formats. Therefore, it doesn't specify =
any
> > >>>> particular format like XRGB8888 or NV12.
> > >>>>
> > >>>> To clarify this, I can rename the format_pair struct to value_pair=
=2E This
> > >>>> should make it clearer that we are dealing with color model values=
 rather
> > >>>> than formats.
> > >>>>
> > >>>> If you want to test a specific format conversion, such as
> > >>>> YUV420_to_argbu16, you would need to follow a process like this:
> > >>>>
> > >>>> 	// Recreate a YUV420 data
> > >>>> 	plane_1[0] =3D test_case.yuv.y
> > >>>> 	plane_2[0] =3D test_case.yuv.u
> > >>>> 	plane_2[1] =3D test_case.yuv.v
> > >>>>
> > >>>> 	// convertion to test from YUV420 format to argb_u16
> > >>>> 	rgb_u16 =3D convert_YUV420_to_argbu16(plane_1, plane_2)
> > >>>>
> > >>>> 	// ensure the conversion is valid
> > >>>> 	assert_eq(rgb_u16, test_case.rgb)
> > >>>>
> > >>>> The current test is not performing this kind of format conversion.
> > >>>> Instead, it verifies that for given (y, u, v) values, the correct =
(r, g,
> > >>>> b, a) values are obtained. =20
> > >>>
> > >>> You already stated that you check for the A, R, G, and B components=
=2E On
> > >>> how many bits are the values you are comparing stored? The YUV valu=
es
> > >>> you are comparing are stored on how many bits for each channel? With
> > >>> subsampling?
> > >>>
> > >>> If you want to compare values, you need to encode a given color into
> > >>> bits, and the way that encoding is done is what the format is about.
> > >>>
> > >>> You might not compare the memory layout but each component individu=
ally,
> > >>> but it's still a format. =20
> > >>
> > >> Sorry, I think I misunderstood what a format really is. =20
> > >=20
> > > Ultimately, a format is how a given "color value" is stored. How many
> > > bits will you use? If you have an unaligned number of bits, how many
> > > bits of padding you'll use, where the padding is? If there's multiple
> > > bytes, what's the endianness?
> > >=20
> > > The answer to all these questions is "the format", and that's why
> > > there's so many of them. =20
> >=20
> > Thanks!
> >=20
> > >> But even with this explanation, I don't understand well what you ask
> > >> me to change. Is this better:
> > >>
> > >> The values are computed by converting RGB values, with each componen=
t stored
> > >> as u16, to YUV values, with each component stored as u8. The convers=
ion is
> > >> done from RGB full range to YUV BT601 full range using the ITU-R BT.=
601
> > >> weights.
> > >>
> > >> TBH, I do not understand what you are asking for exactly. Can you pl=
ease
> > >> give the sentence you expect directly? =20
> > >=20
> > > The fourcc[1] code for the input and output format would be nice. And=
 if
> > > you can't, an ad-hoc definition of the format, answering the question=
s I
> > > mentionned earlier (and in the previous mail for YUV). =20
> >=20
> > I don't think any fourcc code will apply in this case, the tests use=20
> > internal VKMS structures pixel_argb_16 and pixel_yuv_u8. How do I=20
> > describe them better? If I add this comment for the structures, is it=
=20
> > enough?
> >=20
> > /**
> >   * struct pixel_argb_u16 - Internal representation of a pixel color.
> >   * @r: Red component value, stored in 16 bits, without padding, using
> >   *     machine endianness
> >   * @b: [...]
> >   *
> >   * The goal of this structure is to keep enough precision to ensure
> >   * correct composition results in VKMS and simplifying color
> >   * manipulation by splitting each component into its own field.
> >   * Caution: the byte ordering of this structure is machine-dependent,
> >   * you can't cast it directly to AR48 or xR48.
> >   */
> > struct pixel_argb_u16 {
> > 	u16 a, r, g, b;
> > };
> >=20
> > (ditto for pixel_yuv_u8)
> >=20
> > > I'm really
> > > surprised about the RGB component values being stored on 16 bits thou=
gh.
> > > It's super unusual, to the point where it's almost useless for us to
> > > test, and we should probably use 8 bits values. =20
> >=20
> > We need to have 16 bits because some of the writeback formats are 16 bi=
ts.
>=20
> Hi Maxime,
>=20
> Louis' proposed comment is good and accurate. I can elaborate further on
> it.
>=20
> pixel_argb_u16 is an internal structure used only for temporary pixel
> storage: the intermediate format. It's aim is to make computations on
> pixel values easy: every input format is converted to it before
> computations, and after computations it is converted to each output
> format. This allows VKMS to implement computations, e.g. a matrix
> operation, in simple code for only one cpu-endian "pixel format", the
> intermediate format. (drm_fourcc.h has no cpu-endian formats at all,
> and that is good.)
>=20
> That VKMS never stores complete images in the intermediate format. To
> strike a balance between temporary memory requirements and
> computational overhead, VKMS processes images line-by-line. Only one
> (or two) line's worth of pixels is needed to be kept in memory per
> source or destination framebuffer at a time.
>=20
> 16-bit precision is required not just because some writeback and
> framebuffer formats are 16-bit. We also need extra precision due to the
> color value encoding. Transfer functions can convert pixel data between
> the optical and electrical domains. Framebuffers usually contain
> electrical domain data, because it takes less bits per pixel in order
> to achieve a specific level of visual image quality (think of color
> gradient banding). However, some computations, like color space
> conversion with a matrix, must be done in the optical domain, which
> requires more bits per pixel in order to not degrade the image quality.
>=20
> In the future I would even expect needing 32-bit or even 64-bit per
> channel precision in the intermediate format once higher-than-16 bits
> per channel framebuffer formats require testing.
>=20
> YUV can work with 8 bits per pixel for now, because in practice YUV is
> always stored in electrical domain due its definition. YUV in optical
> domain is simply never used. However, there are framebuffer formats
> with more than 8 bits of YUV channels, so this may need extending too.

Thanks for your explanations, and yes Louis, I think it's in a much
better shape with your suggestion.

We'd still some additional info like whether you're testing limited vs
full range, but it's most likely going to be on a per-test basis.

Maxime

--263hj7gfnktphh5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9Lr3wAKCRDj7w1vZxhR
xbKPAP9h1I4+WMbgpFcDVDNbkIi1cwxtvUp5hqO3epBlkh9puwEAn2eIG2+dnROT
NXKbY6a7Jy60/nsOrRAEigCwgN1ckQ4=
=8h4B
-----END PGP SIGNATURE-----

--263hj7gfnktphh5g--
