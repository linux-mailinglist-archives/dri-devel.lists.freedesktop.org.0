Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2F2A58F2B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C010E3CF;
	Mon, 10 Mar 2025 09:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="qK+V4wuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37BD10E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aHsXF/th7Qp5UlegwhFSAEpyRDH/WRYr3dD5gq1T1R8=; b=qK+V4wucF6xP3y2SgHCo7pwXtZ
 zKsevhk+NgWRFHXOUBlAxhRO5Ig4aOqT6i5H2vMCD65eEpAT0CbaUael/S6gIgFHuKhSXTEk295Op
 yVvcytdL+6akXCtoAVyFjhZQACe1C8HQ2a7aBebJCFEt0NDnOpZei0/Vt0Qz5OfCtBxCQxC8CcXJg
 7qg/tU/AYOYvBVUcR3jqMPUdJPF+SAZDU12BL+OmVBfpIXD6oH/PM/Fl1rzt+wtduQQf5PGAuPfSR
 c2PoVwnQJ6hN5OshyLGNAodViHlgL5nCVV8jCAdliR+LA4CJGILvSD/YNROnOV+jZ1Vg6HFbod8Qu
 Ab31Btlw==;
Received: from [194.136.85.206] (port=57892 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1trZCF-000000001cy-2moR; Mon, 10 Mar 2025 11:13:15 +0200
Date: Mon, 10 Mar 2025 11:12:59 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Maxime Ripard <mripard@kernel.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, arthurgrillo@riseup.net, Jonathan Corbet
 <corbet@lwn.net>, Simona Vetter <simona@ffwll.ch>, Simona Vetter
 <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20250310111259.4e18d550@eldfell>
In-Reply-To: <6fa7a17f-3932-4b93-a3c7-885619f8ec73@bootlin.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
 <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
 <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
 <20250205-pristine-perch-of-abundance-7abac1@houat>
 <Z6OEd329pDNRrL5v@louis-chauvet-laptop>
 <20250219-inventive-micro-parrot-c24846@houat>
 <ce5fb86d-f3bc-4196-9cfd-8af41a83beb1@bootlin.com>
 <20250307-glaring-kiwi-of-teaching-d5ddd4@houat>
 <6fa7a17f-3932-4b93-a3c7-885619f8ec73@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fFoK6zyuMmWcASjFqjoAznd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/fFoK6zyuMmWcASjFqjoAznd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Mar 2025 15:50:41 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 07/03/2025 =C3=A0 11:20, Maxime Ripard a =C3=A9crit=C2=A0:
> > On Wed, Feb 19, 2025 at 02:35:14PM +0100, Louis Chauvet wrote: =20
> >>
> >>
> >> Le 19/02/2025 =C3=A0 11:15, Maxime Ripard a =C3=A9crit=C2=A0: =20
> >>> On Wed, Feb 05, 2025 at 04:32:07PM +0100, Louis Chauvet wrote: =20
> >>>> On 05/02/25 - 09:55, Maxime Ripard wrote: =20
> >>>>> On Mon, Jan 27, 2025 at 11:48:23AM +0100, Louis Chauvet wrote: =20
> >>>>>> On 26/01/25 - 18:06, Maxime Ripard wrote: =20
> >>>>>>> On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote: =20
> >>>>>>>> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[=
] =3D {
> >>>>>>>> +	/*
> >>>>>>>> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> >>>>>>>> +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.601"=
],
> >>>>>>>> +	 *                     in_bits =3D 16,
> >>>>>>>> +	 *                     in_legal =3D False,
> >>>>>>>> +	 *                     in_int =3D True,
> >>>>>>>> +	 *                     out_bits =3D 8,
> >>>>>>>> +	 *                     out_legal =3D False,
> >>>>>>>> +	 *                     out_int =3D True)
> >>>>>>>> +	 *
> >>>>>>>> +	 * Test cases for conversion between YUV BT601 full range and =
RGB
> >>>>>>>> +	 * using the ITU-R BT.601 weights.
> >>>>>>>> +	 */ =20
> >>>>>>>
> >>>>>>> What are the input and output formats?
> >>>>>>>
> >>>>>>> Ditto for all the other tests. =20
> >>>>>>
> >>>>>> There is no really "input" and "output" format, they are reference=
 values
> >>>>>> for conversion, you should be able to use it in both direction. Th=
ey are
> >>>>>> generated by RGB_to_YCbCr (RGB input, YUV output) just because it =
was
> >>>>>> easier to create the colors from RGB values. =20
> >>>>>
> >>>>> RGB and YUV aren't formats, they are color models. XRGB8888 is a fo=
rmat.
> >>>>> NV12 is a format.
> >>>>> =20
> >>>>>> If you think we should specify what is was used as input and outpu=
t to
> >>>>>> generate those values, I can modify the comment to:
> >>>>>>
> >>>>>> 	Tests cases for color conversion generated by converting RGB
> >>>>>> 	values to YUV BT601 full range using the ITU-R BT.601 weights. =20
> >>>>>
> >>>>> My point is that those comments should provide a way to reimplement=
 the
> >>>>> test from scratch, and compare to the actual implementation. It's u=
seful
> >>>>> when you have a test failure and start to wonder if the implementat=
ion
> >>>>> or the test is at fault.
> >>>>>
> >>>>> By saying only RGB and YUV, you can't possibly do that. =20
> >>>>
> >>>> I understand your concern, but I believe there might be a slight
> >>>> misunderstanding. The table in question stores reference values for
> >>>> specific color models, not formats. Therefore, it doesn't specify any
> >>>> particular format like XRGB8888 or NV12.
> >>>>
> >>>> To clarify this, I can rename the format_pair struct to value_pair. =
This
> >>>> should make it clearer that we are dealing with color model values r=
ather
> >>>> than formats.
> >>>>
> >>>> If you want to test a specific format conversion, such as
> >>>> YUV420_to_argbu16, you would need to follow a process like this:
> >>>>
> >>>> 	// Recreate a YUV420 data
> >>>> 	plane_1[0] =3D test_case.yuv.y
> >>>> 	plane_2[0] =3D test_case.yuv.u
> >>>> 	plane_2[1] =3D test_case.yuv.v
> >>>>
> >>>> 	// convertion to test from YUV420 format to argb_u16
> >>>> 	rgb_u16 =3D convert_YUV420_to_argbu16(plane_1, plane_2)
> >>>>
> >>>> 	// ensure the conversion is valid
> >>>> 	assert_eq(rgb_u16, test_case.rgb)
> >>>>
> >>>> The current test is not performing this kind of format conversion.
> >>>> Instead, it verifies that for given (y, u, v) values, the correct (r=
, g,
> >>>> b, a) values are obtained. =20
> >>>
> >>> You already stated that you check for the A, R, G, and B components. =
On
> >>> how many bits are the values you are comparing stored? The YUV values
> >>> you are comparing are stored on how many bits for each channel? With
> >>> subsampling?
> >>>
> >>> If you want to compare values, you need to encode a given color into
> >>> bits, and the way that encoding is done is what the format is about.
> >>>
> >>> You might not compare the memory layout but each component individual=
ly,
> >>> but it's still a format. =20
> >>
> >> Sorry, I think I misunderstood what a format really is. =20
> >=20
> > Ultimately, a format is how a given "color value" is stored. How many
> > bits will you use? If you have an unaligned number of bits, how many
> > bits of padding you'll use, where the padding is? If there's multiple
> > bytes, what's the endianness?
> >=20
> > The answer to all these questions is "the format", and that's why
> > there's so many of them. =20
>=20
> Thanks!
>=20
> >> But even with this explanation, I don't understand well what you ask
> >> me to change. Is this better:
> >>
> >> The values are computed by converting RGB values, with each component =
stored
> >> as u16, to YUV values, with each component stored as u8. The conversio=
n is
> >> done from RGB full range to YUV BT601 full range using the ITU-R BT.601
> >> weights.
> >>
> >> TBH, I do not understand what you are asking for exactly. Can you plea=
se
> >> give the sentence you expect directly? =20
> >=20
> > The fourcc[1] code for the input and output format would be nice. And if
> > you can't, an ad-hoc definition of the format, answering the questions I
> > mentionned earlier (and in the previous mail for YUV). =20
>=20
> I don't think any fourcc code will apply in this case, the tests use=20
> internal VKMS structures pixel_argb_16 and pixel_yuv_u8. How do I=20
> describe them better? If I add this comment for the structures, is it=20
> enough?
>=20
> /**
>   * struct pixel_argb_u16 - Internal representation of a pixel color.
>   * @r: Red component value, stored in 16 bits, without padding, using
>   *     machine endianness
>   * @b: [...]
>   *
>   * The goal of this structure is to keep enough precision to ensure
>   * correct composition results in VKMS and simplifying color
>   * manipulation by splitting each component into its own field.
>   * Caution: the byte ordering of this structure is machine-dependent,
>   * you can't cast it directly to AR48 or xR48.
>   */
> struct pixel_argb_u16 {
> 	u16 a, r, g, b;
> };
>=20
> (ditto for pixel_yuv_u8)
>=20
> > I'm really
> > surprised about the RGB component values being stored on 16 bits though.
> > It's super unusual, to the point where it's almost useless for us to
> > test, and we should probably use 8 bits values. =20
>=20
> We need to have 16 bits because some of the writeback formats are 16 bits.

Hi Maxime,

Louis' proposed comment is good and accurate. I can elaborate further on
it.

pixel_argb_u16 is an internal structure used only for temporary pixel
storage: the intermediate format. It's aim is to make computations on
pixel values easy: every input format is converted to it before
computations, and after computations it is converted to each output
format. This allows VKMS to implement computations, e.g. a matrix
operation, in simple code for only one cpu-endian "pixel format", the
intermediate format. (drm_fourcc.h has no cpu-endian formats at all,
and that is good.)

That VKMS never stores complete images in the intermediate format. To
strike a balance between temporary memory requirements and
computational overhead, VKMS processes images line-by-line. Only one
(or two) line's worth of pixels is needed to be kept in memory per
source or destination framebuffer at a time.

16-bit precision is required not just because some writeback and
framebuffer formats are 16-bit. We also need extra precision due to the
color value encoding. Transfer functions can convert pixel data between
the optical and electrical domains. Framebuffers usually contain
electrical domain data, because it takes less bits per pixel in order
to achieve a specific level of visual image quality (think of color
gradient banding). However, some computations, like color space
conversion with a matrix, must be done in the optical domain, which
requires more bits per pixel in order to not degrade the image quality.

In the future I would even expect needing 32-bit or even 64-bit per
channel precision in the intermediate format once higher-than-16 bits
per channel framebuffer formats require testing.

YUV can work with 8 bits per pixel for now, because in practice YUV is
always stored in electrical domain due its definition. YUV in optical
domain is simply never used. However, there are framebuffer formats
with more than 8 bits of YUV channels, so this may need extending too.


Thanks,
pq

--Sig_/fFoK6zyuMmWcASjFqjoAznd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfOrRsACgkQI1/ltBGq
qqe1tg//TcEfVsZK/Chn4rCT2I+Cx0znJU3Z5Wkq2TSIQju88TlsxpThp0wJCYJB
Fx6Wnxw29CQChkh+nv628Its/2mLzucO2Wpk+CF1vj7iZQuDFLJz7IWogBmD7dqz
4PktXoYGlBM9hXJ7bFytQv+uTebAtZUKsIAfEY+rVVXqKjub5YwxhaQpP+P6QaNv
VukUqEMofEyvYtZd9MMfouyT4yiUAaqBDA2fJVr3rfU0OsMKSic1V2Yad875v+ut
pxZFvy4CQV1egSvPCLvbnBUbIHG3iKSWlsG1dxsO2IW2hPwL9yQos3L37o0rlJhR
HJbgVQDHIG7exigPOPsV5gkkNxjOSmzozw/HOJahkELoOTkb8ug+WHf4d+6ns7Mz
JbuRYTILGd3+QJIbPJanORU0WCiCn7xAy9IMWRFd2/r4I2pZIW9q5/2qS2ocZg06
vB/L4v/L9mbh+J6fZ+SN2ejNAfWb4ZxapYfaWfWuvzRyIoRraQS/+wD1yrP4Z3hz
wSWkRejD5/I3O/IfhYg4NeqHwQ7jOxK3okKElbcAPsiiSoio0eKb6kYtEDLv33dr
PtAYUVp0hj7bqHt8wFJu66cZkvRwpAAkH3QeLBAC4BRO1SYhjtnVJr7b5dfBQkLZ
g+gR5E108Imdq9+obN8H4X63XJN9JyA6mnN0zt/yd5Wwn29sa30=
=HvDc
-----END PGP SIGNATURE-----

--Sig_/fFoK6zyuMmWcASjFqjoAznd--
