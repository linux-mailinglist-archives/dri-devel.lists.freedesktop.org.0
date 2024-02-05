Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F18497A1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 11:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C273010F3F1;
	Mon,  5 Feb 2024 10:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="CpPAITZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DF210F3F1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mUMx2QmRTIHu4aOmh/flsY/ds1E4BxAFIwTFhX3M6Jc=; b=CpPAITZ3mq0icrByMtn82QaV3R
 i+oVum1xUUq6NtE9pZl5yav7i3E7MhuD7VP8wFOhcmUwO5alFiETB5XUbtCmOKIWBcc8rxzqq/GRp
 Z7BfmjLFBtDm/FGV6CyuqU1pyXSuOczyNEm5LpFrCsGE1oMjJi5eQxsv/gd/DZ5mnDBFcrZELGIls
 o82QQg4i0tY0t4tBKD7hD41Egw6FOjarN02EmZBaePp9WrrvmH3ahOuU9kc2g29FJNvJ4N4Jkd2E2
 pNzi0RWuiGR5ZX14hdFLcqM8wDFIUCOZ1UoSlI/kiAB82KwlzJd+BHv/s8Lm8KK/9+7Ul6bMaw3Jx
 ptqVKTmA==;
Received: from [194.136.85.206] (port=54302 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rWw4I-0002rD-0y;
 Mon, 05 Feb 2024 12:19:14 +0200
Date: Mon, 5 Feb 2024 12:19:13 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Maxime Ripard
 <mripard@kernel.org>, Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo
 Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <20240205121913.379e28a4@eldfell>
In-Reply-To: <20240205121204.20878e28@eldfell>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
 <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
 <20240202131322.5471e184@xps-13> <20240202174913.789a9db9@eldfell>
 <14ac793c-6660-434f-998d-af1f51b3b1d2@riseup.net>
 <20240205121204.20878e28@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8IcscBG0fq/gsotGh1Gqxsm";
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

--Sig_/8IcscBG0fq/gsotGh1Gqxsm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Feb 2024 12:12:04 +0200
Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:

> On Fri, 2 Feb 2024 17:02:20 -0300
> Arthur Grillo <arthurgrillo@riseup.net> wrote:
>=20
> > On 02/02/24 12:49, Pekka Paalanen wrote: =20
> > > On Fri, 2 Feb 2024 13:13:22 +0100
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >    =20
> > >> Hello Maxime,
> > >>
> > >> + Arthur
> > >>
> > >> mripard@kernel.org wrote on Fri, 2 Feb 2024 10:53:37 +0100:
> > >>   =20
> > >>> Hi Miquel,
> > >>>
> > >>> On Fri, Feb 02, 2024 at 10:26:01AM +0100, Miquel Raynal wrote:     =
=20
> > >>>> pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +02=
00:
> > >>>>        =20
> > >>>>> On Thu, 01 Feb 2024 18:31:32 +0100
> > >>>>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > >>>>>        =20
> > >>>>>> Change the composition algorithm to iterate over pixels instead =
of lines.
> > >>>>>> It allows a simpler management of rotation and pixel access for =
complex formats.
> > >>>>>>
> > >>>>>> This new algorithm allows read_pixel function to have access to =
x/y
> > >>>>>> coordinates and make it possible to read the correct thing in a =
block
> > >>>>>> when block_w and block_h are not 1.
> > >>>>>> The iteration pixel-by-pixel in the same method also allows a si=
mpler
> > >>>>>> management of rotation with drm_rect_* helpers. This way it's no=
t needed
> > >>>>>> anymore to have misterious switch-case distributed in multiple p=
laces.         =20
> > >>>>>
> > >>>>> Hi,
> > >>>>>
> > >>>>> there was a very good reason to write this code using lines:
> > >>>>> performance. Before lines, it was indeed operating on individual =
pixels.
> > >>>>>
> > >>>>> Please, include performance measurements before and after this se=
ries
> > >>>>> to quantify the impact on the previously already supported pixel
> > >>>>> formats, particularly the 32-bit-per-pixel RGB variants.
> > >>>>>
> > >>>>> VKMS will be used more and more in CI for userspace projects, and
> > >>>>> performance actually matters there.
> > >>>>>
> > >>>>> I'm worrying that this performance degradation here is significan=
t. I
> > >>>>> believe it is possible to keep blending with lines, if you add ne=
w line
> > >>>>> getters for reading from rotated, sub-sampled etc. images. That w=
ay you
> > >>>>> don't have to regress the most common formats' performance.      =
 =20
> > >>>>
> > >>>> While I understand performance is important and should be taken in=
to
> > >>>> account seriously, I cannot understand how broken testing could be
> > >>>> considered better. Fast but inaccurate will always be significantly
> > >>>> less attractive to my eyes.       =20
> > >>>
> > >>> AFAIK, neither the cover letter nor the commit log claimed it was f=
ixing
> > >>> something broken, just that it was "better" (according to what
> > >>> criteria?).     =20
> > >>
> > >> Better is probably too vague and I agree the "fixing" part is not
> > >> clearly explained in the commit log. The cover-letter however states:
> > >>   =20
> > >>> Patch 2/2: This patch is more complex. My main target was to solve =
issues
> > >>> I found in [1], but as it was very complex to do it "in place", I c=
hoose
> > >>> to rework the composition function.     =20
> > >> ...   =20
> > >>> [1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fc=
aa5a193@riseup.net/     =20
> > >>
> > >> If you follow this link you will find all the feedback and especially
> > >> the "broken" parts. Just to be clear, writing bugs is totally expect=
ed
> > >> and review/testing is supposed to help on this regard. I am not blam=
ing
> > >> the author in any way, just focusing on getting this code in a more
> > >> readable shape and hopefully reinforce the testing procedure.
> > >>   =20
> > >>> If something is truly broken, it must be stated what exactly is so =
we
> > >>> can all come up with a solution that will satisfy everyone.     =20
> > >>
> > >> Maybe going through the series pointed above will give more context
> > >> but AFAIU: the YUV composition is not totally right (and the tests u=
sed
> > >> to validate it need to be more complex as well in order to fail).
> > >>
> > >> Here is a proposal.
> > >>
> > >> Today's RGB implementation is only optimized in the line-by-line case
> > >> when there is no rotation. The logic is bit convoluted and may possi=
bly
> > >> be slightly clarified with a per-format read_line() implementation,
> > >> at a very light performance cost. Such an improvement would definite=
ly
> > >> benefit to the clarity of the code, especially when transformations
> > >> (especially the rotations) come into play because they would be clea=
rly
> > >> handled differently instead of being "hidden" in the optimized logic.
> > >> Performances would not change much as this path is not optimized tod=
ay
> > >> anyway (the pixel-oriented logic is already used in the rotation cas=
e).
> > >>
> > >> Arthur's YUV implementation is indeed well optimized but the added
> > >> complexity probably lead to small mistakes in the logic. The
> > >> per-format read_line() implementation mentioned above could be
> > >> extended to the YUV format as well, which would leverage Arthur's
> > >> proposal by re-using his optimized version. Louis will help on this
> > >> regard. However, for more complex cases such as when there is a
> > >> rotation, it will be easier (and not sub-optimized compared to the R=
GB
> > >> case) to also fallback to a pixel-oriented processing.
> > >>
> > >> Would this approach make sense?   =20
> > >=20
> > > Hi,
> > >=20
> > > I think it would, if I understand what you mean. Ever since I proposed
> > > a line-by-line algorithm to improve the performance, I was thinking of
> > > per-format read_line() functions that would be selected outside of any
> > > loops. Extending that to support YUV is only natural. I can imagine
> > > rotation complicates things, and I won't oppose that resulting in a
> > > much heavier read_line() implementation used in those cases. They mig=
ht
> > > perhaps call the original read_line() implementations pixel-by-pixel =
or
> > > plane-by-plane (i.e. YUV planes) per pixel. Chroma-siting complicates
> > > things even further. That way one could compose any
> > > rotation-format-siting combination by chaining function pointers.
> > >=20
> > > I haven't looked at VKMS in a long time, and I am disappointed to find
> > > that vkms_compose_row() is calling plane->pixel_read() pixel-by-pixel.
> > > The reading vfunc should be called with many pixels at a time when the
> > > source FB layout allows it. The whole point of the line-based functio=
ns
> > > was that they repeat the innermost loop in every function body to make
> > > the per-pixel overhead as small as possible. The VKMS implementations
> > > benchmarked before and after the original line-based algorithm showed
> > > that calling a function pointer per-pixel is relatively very expensiv=
e.
> > > Or maybe it was a switch-case.   =20
> >=20
> > Hi,
> >=20
> > I think I'm the culprit for that, as stated on [1]. My intention with
> > the suggestion was to remove some code repetition and too facilitate the
> > rotation support implementation. Going back, I think I was to high on
> > DRY at the time and didn't worry about optimization, which was a
> > mistake. =20
>=20
> Hi Arthur,
>=20
> no worries. We can also blame reviewers for not minding benchmarks. ;-)
>=20
> > But, I agree with Miquel that the rotation logic is easier to implement
> > in a pixel-based way. So going pixel-by-pixel only when rotation occurs
> > would be great. =20
>=20
> Yes, and I think that can very well be done in the line-based framework
> still that existed in the old days before any rotation support was
> added. Essentially a plug-in line-getter function that then calls a
> format-specific line-getter pixel-by-pixel while applying the rotation.
> It would be simple, it would leave unrotated performance unharmed (use
> format-specific line-getter directly with lines), but it might be
> somewhat less performant for rotated KMS planes. I suspect that might
> be a good compromise.
>=20
> Format-specific line-getters could also be parameterized by
> pixel-to-pixel offset in bytes. Then they could directly traverse FB
> rows forward and backward, and even FB columns. It may or may not have
> a penalty compared to the original line-getters, so it would have to
> be benchmarked.

Oh, actually, since the byte offset depends on format, it might be
better to parametrize by direction and compute the offset in the
format-specific line-getter before the loop.


Thanks,
pq

> Line-getters working on planar YUV FBs might delegate Y, U, V, or UV/VU
> reading to R8 and/or RG88 line or pixel reader functions. They might
> also return block-height lines instead of one line at a time. However,
> I wouldn't commit to any approach without benchmarking alternatives.
> The performance comparison must justify the code complexity, like it
> was seen with the initial line-based implementation.
>=20
> A good benchmark is key, IMO.
>=20
>=20
> Thanks,
> pq
>=20
> >=20
> > Best Regards,
> > ~Arthur Grillo
> >=20
> > [1]: https://lore.kernel.org/dri-devel/20230418130525.128733-2-mcanal@i=
galia.com/
> >  =20
> > >=20
> > > Sorry, I didn't realize the optimization had already been lost.
> > >=20
> > > Btw. I'd suggest renaming vkms_compose_row() to vkms_fetch_row() since
> > > it's not composing anything and the name mislead me.
> > >=20
> > > I think if you inspect the compositing code as of revision
> > > 8356b97906503a02125c8d03c9b88a61ea46a05a you'll get a better feeling =
of
> > > what it was supposed to be.
> > >=20
> > >=20
> > > Thanks,
> > > pq   =20
>=20


--Sig_/8IcscBG0fq/gsotGh1Gqxsm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXAtiEACgkQI1/ltBGq
qqd8Kw//eXa4+XlybQgWOrlbTxEQegpsbuIG3raHxo7YxGa3nstZKb5gHs327NvM
pDdISXkdoHkDV6ZrzpjNL3lXBkFUtkh6rnV4wEXL9BinXKf3O+mkKEcHF3giR7af
N3Ux47Z0QgREMkuaa2YAcYZA6DpBpOc3bSODxoipblfWK0kl6LvRPIn6puXsQJJh
1Btijmw3htrZvPBtJ4ckzoJbk0oKdUVHadWyG3py5ddZnjzkZlBeCpvHTF5aUy7L
XBpDCoBluSHemduTgmqT86pok7futEhr+sxbS5pEYi+91NrJTyAvwjHGh57W1XiJ
GeJabJUYxc5eLwWgv398CUmi0BYxodviu75u/mUCUB2H7TMyxPQKVAjXtWsG8NVF
n0dwWKmHXSFU5GyiPdwendxvtpbm6GDnf1l5hOumAsKsQQvH1oeYCPs/oAxanC79
RHx4SGIuru2uOHRQZyVnb1UTngOqyl/bd1CmCOuVXqXYIu/DO2xzOMyUuM80fxVy
o9BFRII3F6I5mF3okHzrZPCpf1xH3O5Vpp4+xPd0tObsisMYN94YS++8gl4BrSOW
EKm9HlLhJlwCH2zGU5QSKkzQwJ/+hYIVZDRohZ1bpqQ7QM/Sk9EAtb0PEUfOjBj6
udTya+URVcC+ggol3CxTpBW15y5L7wqghWs2cxQvFBMXi7Kh15o=
=MWpr
-----END PGP SIGNATURE-----

--Sig_/8IcscBG0fq/gsotGh1Gqxsm--
