Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC48479D9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 20:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1F010E048;
	Fri,  2 Feb 2024 19:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="k5x5/+3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1617510E048
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nDTsI+E5omRhoYSLC0kgi7Vk12lcSqJA3pQ19Ovkn/Y=; b=k5x5/+3aXpVveXGh34B3HHcTAb
 ON+O2c8fVR2qSYSbMOVRAojg8P2L58og6oBgXxkflCTnufn5M3q4aBrFv16WSgotPDWkQEdqqP54m
 jSkHo5oqTlT5kTJFsOgrwP0P8VcHQi77iTcu3eY37QbZQlfnKkNfxaYXEp9NZIVUHhr+HYXEl55WW
 cx+I4Vy6MIFRzuQg7/j3vf3kU3RHb85H3C61dUSGygu47Vfg8cJkmGZmky2huSkzO/aTUpZw/Kq5L
 3yQPcObXJJm2dhm/m0QCAMc5gfoG7GlAJo8lq5Q3LS3N5Lnx5XEiFeC81mD7d5VgIkTYOdC6mZO/i
 GMn/GNzA==;
Received: from 91-154-18-254.elisa-laajakaista.fi ([91.154.18.254]:51106
 helo=ferris.localdomain) by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rVzTn-0002HB-0p;
 Fri, 02 Feb 2024 21:45:39 +0200
Date: Fri, 2 Feb 2024 21:45:27 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Miquel Raynal <miquel.raynal@bootlin.com>, =?ISO-8859-1?B?TWHtcmE=?=
 Canal <mairacanal@riseup.net>
Cc: Maxime Ripard <mripard@kernel.org>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <20240202214527.1d97c881@ferris.localdomain>
In-Reply-To: <20240202170734.3176dfe4@xps-13>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
 <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
 <20240202131322.5471e184@xps-13> <20240202174913.789a9db9@eldfell>
 <20240202170734.3176dfe4@xps-13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6lY8dnw6e.9r7s98d5yNIXB";
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

--Sig_/6lY8dnw6e.9r7s98d5yNIXB
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Feb 2024 17:07:34 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Pekka,

Hi Miquel,

I'm happy to see no hard feelings below. I know I may be blunt at
times.

Another thing coming to my mind is that I suppose there is no
agreed standard benchmark for VKMS performance, is there?

I recall people running selected IGT tests in a loop in the past,
and I worry that the IGT start-up overhead and small plane
dimensions might skew the results.

Would it be possible to have a standardised benchmark specifically
for performance rather than correctness, in IGT or where-ever it
would make sense? Then it would be simple to tell contributors to
run this and report the numbers before and after.

I would propose this kind of KMS layout:

- CRTC size 3841 x 2161
- primary plane, XRGB8888, 3639 x 2161 @ 101,0
- overlay A, XBGR2101010, 3033 x 1777 @ 201,199
- overlay B, ARGB8888, 1507 x 1400 @ 1800,250

The sizes and positions are deliberately odd to try to avoid happy
alignment accidents. The planes are big, which should let the pixel
operations easily dominate performance measurement. There are
different pixel formats, both opaque and semi-transparent. There is
lots of plane overlap. The planes also do not cover the whole CRTC
leaving the background visible a bit.

There should be two FBs per each plane, flipped alternatingly each
frame. Writeback should be active. Run this a number of frames, say,
100, and measure the kernel CPU time taken. It's supposed to take at
least several seconds in total.

I think something like this should be the base benchmark. One can
add more to it, like rotated planes, YUV planes, etc. or switch
settings on the existing planes. Maybe even FB_DAMAGE_CLIPS. Maybe
one more overlay that is very tall and thin.

Just an idea, what do you all think?


Thanks,
pq

> pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 17:49:13 +0200:
>=20
> > On Fri, 2 Feb 2024 13:13:22 +0100
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  =20
> > > Hello Maxime,
> > >=20
> > > + Arthur
> > >=20
> > > mripard@kernel.org wrote on Fri, 2 Feb 2024 10:53:37 +0100:
> > >    =20
> > > > Hi Miquel,
> > > >=20
> > > > On Fri, Feb 02, 2024 at 10:26:01AM +0100, Miquel Raynal wrote:     =
=20
> > > > > pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +0=
200:
> > > > >        =20
> > > > > > On Thu, 01 Feb 2024 18:31:32 +0100
> > > > > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > > > > >        =20
> > > > > > > Change the composition algorithm to iterate over pixels inste=
ad of lines.
> > > > > > > It allows a simpler management of rotation and pixel access f=
or complex formats.
> > > > > > >=20
> > > > > > > This new algorithm allows read_pixel function to have access =
to x/y
> > > > > > > coordinates and make it possible to read the correct thing in=
 a block
> > > > > > > when block_w and block_h are not 1.
> > > > > > > The iteration pixel-by-pixel in the same method also allows a=
 simpler
> > > > > > > management of rotation with drm_rect_* helpers. This way it's=
 not needed
> > > > > > > anymore to have misterious switch-case distributed in multipl=
e places.         =20
> > > > > >=20
> > > > > > Hi,
> > > > > >=20
> > > > > > there was a very good reason to write this code using lines:
> > > > > > performance. Before lines, it was indeed operating on individua=
l pixels.
> > > > > >=20
> > > > > > Please, include performance measurements before and after this =
series
> > > > > > to quantify the impact on the previously already supported pixel
> > > > > > formats, particularly the 32-bit-per-pixel RGB variants.
> > > > > >=20
> > > > > > VKMS will be used more and more in CI for userspace projects, a=
nd
> > > > > > performance actually matters there.
> > > > > >=20
> > > > > > I'm worrying that this performance degradation here is signific=
ant. I
> > > > > > believe it is possible to keep blending with lines, if you add =
new line
> > > > > > getters for reading from rotated, sub-sampled etc. images. That=
 way you
> > > > > > don't have to regress the most common formats' performance.    =
   =20
> > > > >=20
> > > > > While I understand performance is important and should be taken i=
nto
> > > > > account seriously, I cannot understand how broken testing could be
> > > > > considered better. Fast but inaccurate will always be significant=
ly
> > > > > less attractive to my eyes.       =20
> > > >=20
> > > > AFAIK, neither the cover letter nor the commit log claimed it was f=
ixing
> > > > something broken, just that it was "better" (according to what
> > > > criteria?).     =20
> > >=20
> > > Better is probably too vague and I agree the "fixing" part is not
> > > clearly explained in the commit log. The cover-letter however states:
> > >    =20
> > > > Patch 2/2: This patch is more complex. My main target was to solve =
issues
> > > > I found in [1], but as it was very complex to do it "in place", I c=
hoose
> > > > to rework the composition function.     =20
> > > ...   =20
> > > > [1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fc=
aa5a193@riseup.net/     =20
> > >=20
> > > If you follow this link you will find all the feedback and especially
> > > the "broken" parts. Just to be clear, writing bugs is totally expected
> > > and review/testing is supposed to help on this regard. I am not blami=
ng
> > > the author in any way, just focusing on getting this code in a more
> > > readable shape and hopefully reinforce the testing procedure.
> > >    =20
> > > > If something is truly broken, it must be stated what exactly is so =
we
> > > > can all come up with a solution that will satisfy everyone.     =20
> > >=20
> > > Maybe going through the series pointed above will give more context
> > > but AFAIU: the YUV composition is not totally right (and the tests us=
ed
> > > to validate it need to be more complex as well in order to fail).
> > >=20
> > > Here is a proposal.
> > >=20
> > > Today's RGB implementation is only optimized in the line-by-line case
> > > when there is no rotation. The logic is bit convoluted and may possib=
ly
> > > be slightly clarified with a per-format read_line() implementation,
> > > at a very light performance cost. Such an improvement would definitely
> > > benefit to the clarity of the code, especially when transformations
> > > (especially the rotations) come into play because they would be clear=
ly
> > > handled differently instead of being "hidden" in the optimized logic.
> > > Performances would not change much as this path is not optimized today
> > > anyway (the pixel-oriented logic is already used in the rotation case=
).
> > >=20
> > > Arthur's YUV implementation is indeed well optimized but the added
> > > complexity probably lead to small mistakes in the logic. The
> > > per-format read_line() implementation mentioned above could be
> > > extended to the YUV format as well, which would leverage Arthur's
> > > proposal by re-using his optimized version. Louis will help on this
> > > regard. However, for more complex cases such as when there is a
> > > rotation, it will be easier (and not sub-optimized compared to the RGB
> > > case) to also fallback to a pixel-oriented processing.
> > >=20
> > > Would this approach make sense?   =20
> >=20
> > Hi,
> >=20
> > I think it would, if I understand what you mean. Ever since I proposed
> > a line-by-line algorithm to improve the performance, I was thinking of
> > per-format read_line() functions that would be selected outside of any
> > loops. Extending that to support YUV is only natural. I can imagine
> > rotation complicates things, and I won't oppose that resulting in a
> > much heavier read_line() implementation used in those cases. They might
> > perhaps call the original read_line() implementations pixel-by-pixel or
> > plane-by-plane (i.e. YUV planes) per pixel. Chroma-siting complicates
> > things even further. That way one could compose any
> > rotation-format-siting combination by chaining function pointers. =20
>=20
> I'll let Louis also validate but on my side I feel like I totally
> agree with your feedback.
>=20
> > I haven't looked at VKMS in a long time, and I am disappointed to find
> > that vkms_compose_row() is calling plane->pixel_read() pixel-by-pixel.
> > The reading vfunc should be called with many pixels at a time when the
> > source FB layout allows it. The whole point of the line-based functions
> > was that they repeat the innermost loop in every function body to make
> > the per-pixel overhead as small as possible. The VKMS implementations
> > benchmarked before and after the original line-based algorithm showed
> > that calling a function pointer per-pixel is relatively very expensive.
> > Or maybe it was a switch-case. =20
>=20
> Indeed, since your initial feedback Louis made a couple of comparisons
> and the time penalty is between +5% and +60% depending on the case,
> AFAIR.
>=20
> > Sorry, I didn't realize the optimization had already been lost. =20
>=20
> No problem, actually I also lost myself in my first answer as I
> initially thought the (mainline) RGB logic was also broken in edge
> cases, which it was not, only the YUV logic suffered from some
> limitations.
>=20
> > Btw. I'd suggest renaming vkms_compose_row() to vkms_fetch_row() since
> > it's not composing anything and the name mislead me. =20
>=20
> Makes sense.
>=20
> > I think if you inspect the compositing code as of revision
> > 8356b97906503a02125c8d03c9b88a61ea46a05a you'll get a better feeling of
> > what it was supposed to be. =20
>=20
> Excellent, thanks a lot!
>=20
> Miqu=E8l


--=20
Pekka Paalanen

--Sig_/6lY8dnw6e.9r7s98d5yNIXB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmW9RlcACgkQI1/ltBGq
qqc75Q//Ryst1Yc6uVwMBJ5b93LMXwiNy7NUzqI/G74TIJxuu5chdpBYeUjSwGxC
9j4WBppaHQLCXsmB0Ay9UnaGLvlnqmHEtybXrAFFbkQhI4h83440KYXlsCXm71nL
KQ1W1DSDkP46BZV0msfQw0+0BmZLoC+mg3ksr09uDscZmG4enreIrG4yQ38eukH/
gY0Qu4GNGfAQ9RYrXhR12LGJ2ssC35rutc8DGgaP/S+KfHXsD+82OqCYsYilOoUO
/PhxwlWnJ1yIjjgqbEJ7UXpF6SN4XXAmYwsUU0XEg/7fGXgbRtGttUtrHCnaNyvk
18JVFDKbHyMHu0nBQdX05oUfZRvqzTJQe4o49rKswWAGZ6bfReFPWlE8WJPKkhfO
cNqyUU8eoOAyw/s2YX2DORBJMmaQWeMlpeV0sFexl/RZZieCMgXDFBLUt7pXMD2t
7TjfJNh7lC5ACf21W4G8ZNZk8Bq4e8pacQfyXYHbdyscp7NnnC/N9JGIt9B4G3kO
H1Gfk1LDnSuKV8+KZTToVxyYBIWr+CPZUSh1Phm5phmv8LD9RfriAVtfzIJ5ltlO
DeBhjGD3i3F6ekBiep8YeM7DZpf4JZE+2eF7Du8Qy0kJp304VsHuve3eY7tePddJ
XmrUP1tO5F74BWOs/SUYgZhoR/y1WWWSVqOMxPgvS/hXRu9m9Ys=
=I8BR
-----END PGP SIGNATURE-----

--Sig_/6lY8dnw6e.9r7s98d5yNIXB--
