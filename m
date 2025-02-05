Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E290FA28603
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 09:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D59110E149;
	Wed,  5 Feb 2025 08:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ssat6XmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C7C10E070
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 08:55:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89A955C55AC;
 Wed,  5 Feb 2025 08:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5668C4CED1;
 Wed,  5 Feb 2025 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738745736;
 bh=yYWA/DLZfb2QPpMCEHSUBy1XOsebvANPxN6E7FWkxGw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ssat6XmClwOIlxkFUEv2r9GJPQJIJ9X5ahtW4fKuzFg8AvllBtXQxtKUuaYuITmky
 NoIoNWluUxeFNiNTIDuXZvdCDBQ1iU+74cZYw/gxqlHlgo3zPeinn/LPb5MLrrpwIf
 Q3ZbPAnk5l2kq3t/9wQnQLzfVnorSPv1NMRq2T05GJBV1Y9ciJdOgIS1fwEZql6U44
 oXLnwnHitRQaKADpmKD1MjDOTsgZxFhzA/64z56+U88GD4Wt6bTswBy/Kzu4K2CViY
 MQ4gZIVDEXIkxUEz+7Cq4lZeOJjMMCAeY58V50S+YjmFuANkv8OXcPNL/ey9rNpQh3
 i17Ct/uBmPguw==
Date: Wed, 5 Feb 2025 09:55:33 +0100
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
Message-ID: <20250205-pristine-perch-of-abundance-7abac1@houat>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
 <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
 <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hlokzyhribni5gt3"
Content-Disposition: inline
In-Reply-To: <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
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


--hlokzyhribni5gt3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0

On Mon, Jan 27, 2025 at 11:48:23AM +0100, Louis Chauvet wrote:
> On 26/01/25 - 18:06, Maxime Ripard wrote:
> > On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote:
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
> > > +	 *
> > > +	 * Test cases for conversion between YUV BT601 full range and RGB
> > > +	 * using the ITU-R BT.601 weights.
> > > +	 */
> >=20
> > What are the input and output formats?
> >=20
> > Ditto for all the other tests.
>=20
> There is no really "input" and "output" format, they are reference values=
=20
> for conversion, you should be able to use it in both direction. They are=
=20
> generated by RGB_to_YCbCr (RGB input, YUV output) just because it was=20
> easier to create the colors from RGB values.

RGB and YUV aren't formats, they are color models. XRGB8888 is a format.
NV12 is a format.

> If you think we should specify what is was used as input and output to=20
> generate those values, I can modify the comment to:
>=20
> 	Tests cases for color conversion generated by converting RGB=20
> 	values to YUV BT601 full range using the ITU-R BT.601 weights.

My point is that those comments should provide a way to reimplement the
test from scratch, and compare to the actual implementation. It's useful
when you have a test failure and start to wonder if the implementation
or the test is at fault.

By saying only RGB and YUV, you can't possibly do that.

> Beside that modification, did you notice anything else on the series that=
=20
> require more work before adding your Ack-by/Reviewed-by on the other=20
> patches?

The rest looked good to me the last time I looked.

Maxime

--hlokzyhribni5gt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6MngAAKCRAnX84Zoj2+
dhRlAX9qccZbLAP9gCrmTG66n0OcNxMocRdcpe++pYVNE2TzmqyV4cJyszxqWzrn
ioGDSsIBgLIYxc4siqD/1rgq5gO4/EYHGkY8Zb5RJC/+Yb/apc5gggzlj3o8GezW
+LTOA0o07Q==
=oKKw
-----END PGP SIGNATURE-----

--hlokzyhribni5gt3--
