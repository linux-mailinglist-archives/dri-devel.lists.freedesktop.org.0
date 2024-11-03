Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5491F9BA329
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 01:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16ABB10E322;
	Sun,  3 Nov 2024 00:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ki2TOEFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6D010E322
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 00:05:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A0BFA40A02;
 Sun,  3 Nov 2024 00:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4113C4CEC3;
 Sun,  3 Nov 2024 00:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730592341;
 bh=X5vxJaTvJikAKbAwxGZnw3p3dVIi34zzs8gIjU+lzfQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Ki2TOEFyihTYjXG3FqLyIFOBcSa3ONl/yzIEt29v7wSsXShGeEAjpqdhx8jaMHmyG
 3iYB1MV2auZMhPj3KOTYEjkdr3nu4e8St7/u75FxFp1wJPqYJ1EHxRA+oiS++2STE/
 HerpLXdSnKLAD6SLOWGhO+jRzhLytUesXZMXQifRIFzgdVg9RRuvfZhYgjzBiGp+mY
 yGON29bJnqDJfyweZXnaWUANutIvWcGCYHkqzKSu0WTz/wiSB/21sSqizvSBqKaftA
 My4sKLz3CylMc3MAOOleTS6iq8dzVIsvRrvgssADgMEDUyxNEbeeWnnf2kjSqlQXeK
 ezA0Kiup4er1Q==
Date: Sun, 3 Nov 2024 01:05:34 +0100
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241103000534.th3jq7umwojlxnma@devuan>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <20241102103937.ose4y72a7yl3dcmz@devuan>
 <20241102213620.kfccilxvhihwmnld@devuan>
 <Zya6ApewCZQNEfJb@riva.ucam.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i3ludjwuiw6stzos"
Content-Disposition: inline
In-Reply-To: <Zya6ApewCZQNEfJb@riva.ucam.org>
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


--i3ludjwuiw6stzos
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Colin,

On Sat, Nov 02, 2024 at 11:47:14PM +0000, Colin Watson wrote:
> On Sat, Nov 02, 2024 at 10:36:20PM +0100, Alejandro Colomar wrote:
> > This is quite naive, and will not work with pages that define their own
> > stuff, since this script is not groff(1).  But it should be as fast as
> > is possible, which is what Colin wants, is as simple as it can be (and
> > thus relatively safe), and should work with most pages (as far as
> > indexing is concerned, probably all?).
>=20
> I seem to be being invoked here for something I actually don't think I
> want at all, which suggests that wires have been crossed somewhere.  Can
> you explain why I'd want to replace some part of a fairly well-optimized
> and established C program with a shell pipeline?  I'm pretty certain it
> would not be faster, at least.

Are you sure?  With a small tweak, I get the following comparison:

	alx@devuan:~/src/linux/man-pages/man-pages/main$ time lexgrog man/*/* | wc
	lexgrog: can't resolve man7/groff_man.7
	  12475   99295  919842

	real	0m6.166s
	user	0m5.132s
	sys	0m1.336s
	alx@devuan:~/src/linux/man-pages/man-pages/main$ time mansect NAME man/ \
		| groff -man -Tutf8 | wc
	   9830   27109  689478

	real	0m0.156s
	user	0m0.219s
	sys	0m0.019s

Yes, I'm working with uncompressed pages.  We'd need to add support for
handling compressed pages.  Also, we'd need to compare the performance
of lexgrog(1) with compressed pages.  But for a starter, this suggests
some good performance.

(I say with a small tweak, because the version I've posted uses
 xargs -L1, but I've tested for performance without the -L1, which is
 the main bottleneck.  It has no consequences for the NAME.  I need to
 work out some nasty details with sed -n1 for the generic version,
 though.)


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es/>

--i3ludjwuiw6stzos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmcmvk0ACgkQnowa+77/
2zIVBQ/+M4vyNTsIIasXmnS0QmfHen3e3ZHObA0oc1BCMV5O/+ynHO9fSP+w1DLT
Ow/NdXxf4PgwcFT5hd3CP8FQ3cM/7gRWVLj5NdUye2woXX7yXsK5tJYxWjuuZ4Q4
PMOViijTHlPyCeow0Eqs5lO9Dkx3E587HxaMi/J7V8ZG4PcwdbrOVt7OvL2Mibmu
nQEuExn67XKbQboefN7qnaqh6WbXOnL+kYbf+z68k12oXql8+7noIngQxCUrskqH
EwcRkTA9/xga3qQpFPOVaVSkqH/seBHbq+NvhQivD0uZAi9keMdjYmj/0W+TqgLk
de67IWDlfIEZjBafp2m+Yy4SZUG9krS7RnMEyd/0nLw6H+udxdPtGOngGX2kzB0g
bAIcflfFiNUSa4IHp42U4Dis717LiT4CiGY76w6wmXXQsrIadzunYdaodNcKmLkp
tIxKaqLHMXSyg9Nfg+BmvYpQvWiM1QjjvgsN4Urhj8LjZDqvtIkAxRt8kuqmLdFo
2FSL1X2jVhvgiZLEbqNn8JT4Uzbx2aP1cbz8g9zFpxaT2Lao5rS6CtJp1AiEtTUe
K3Ox3GieCNoByrogRRYIZmuClBKfta3+oo5C05LkGRcCTWAbcKyJFTxdcJglyJHp
O+xQNxIQYTiex258tsSimWX7s1VVR9Z1D2YlFFs0Z4sPlxDEuFk=
=jwrY
-----END PGP SIGNATURE-----

--i3ludjwuiw6stzos--
