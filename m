Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25BA84976B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 11:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4B11213F;
	Mon,  5 Feb 2024 10:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="SKXpudLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF42112482
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lUsgceQ+klrMTjxz3GgoG47FY6wPLBh9Vb3b/fariHU=; b=SKXpudLGcaaYJBAKmfcx16axCz
 oU3FrfA398i9XDNNOfeYCkziEuC1Qbo2Wn/YG1hUW29w8kwHpS5nsW75XWXwg+DltXrFivVH9aOJm
 kcXObmVI/JFyAbFrovRFvZyeJYRW2eXeCXa7LjP3JCbfFBRbX5+VK/Yh1AlrWNdjnuEZnmItMhDNO
 MPS6bobgyeJr+KF42JeATFNak7Ujbt/q7lZAPeNCK6WhJYap0eYmf7GwVMHYk/KeTfnWAWoq3dfbc
 KYHPuopgklA8OCwnjmxlLVq6mdxOAVKdEenqt7RsSQQBEVfNX3a3tDMoAeKYsERT0TlO7ZXGnxUtu
 CBL8HEbw==;
Received: from [194.136.85.206] (port=55498 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rWvxW-0007p9-1c;
 Mon, 05 Feb 2024 12:12:14 +0200
Date: Mon, 5 Feb 2024 12:12:04 +0200
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
Message-ID: <20240205121204.20878e28@eldfell>
In-Reply-To: <14ac793c-6660-434f-998d-af1f51b3b1d2@riseup.net>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
 <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
 <20240202131322.5471e184@xps-13> <20240202174913.789a9db9@eldfell>
 <14ac793c-6660-434f-998d-af1f51b3b1d2@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J_RnRFU_kLOpzBDMdDO0yZh";
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

--Sig_/J_RnRFU_kLOpzBDMdDO0yZh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Feb 2024 17:02:20 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 02/02/24 12:49, Pekka Paalanen wrote:
> > On Fri, 2 Feb 2024 13:13:22 +0100
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  =20
> >> Hello Maxime,
> >>
> >> + Arthur
> >>
> >> mripard@kernel.org wrote on Fri, 2 Feb 2024 10:53:37 +0100:
> >> =20
> >>> Hi Miquel,
> >>>
> >>> On Fri, Feb 02, 2024 at 10:26:01AM +0100, Miquel Raynal wrote:   =20
> >>>> pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +0200:
> >>>>      =20
> >>>>> On Thu, 01 Feb 2024 18:31:32 +0100
> >>>>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >>>>>      =20
> >>>>>> Change the composition algorithm to iterate over pixels instead of=
 lines.
> >>>>>> It allows a simpler management of rotation and pixel access for co=
mplex formats.
> >>>>>>
> >>>>>> This new algorithm allows read_pixel function to have access to x/y
> >>>>>> coordinates and make it possible to read the correct thing in a bl=
ock
> >>>>>> when block_w and block_h are not 1.
> >>>>>> The iteration pixel-by-pixel in the same method also allows a simp=
ler
> >>>>>> management of rotation with drm_rect_* helpers. This way it's not =
needed
> >>>>>> anymore to have misterious switch-case distributed in multiple pla=
ces.       =20
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> there was a very good reason to write this code using lines:
> >>>>> performance. Before lines, it was indeed operating on individual pi=
xels.
> >>>>>
> >>>>> Please, include performance measurements before and after this seri=
es
> >>>>> to quantify the impact on the previously already supported pixel
> >>>>> formats, particularly the 32-bit-per-pixel RGB variants.
> >>>>>
> >>>>> VKMS will be used more and more in CI for userspace projects, and
> >>>>> performance actually matters there.
> >>>>>
> >>>>> I'm worrying that this performance degradation here is significant.=
 I
> >>>>> believe it is possible to keep blending with lines, if you add new =
line
> >>>>> getters for reading from rotated, sub-sampled etc. images. That way=
 you
> >>>>> don't have to regress the most common formats' performance.     =20
> >>>>
> >>>> While I understand performance is important and should be taken into
> >>>> account seriously, I cannot understand how broken testing could be
> >>>> considered better. Fast but inaccurate will always be significantly
> >>>> less attractive to my eyes.     =20
> >>>
> >>> AFAIK, neither the cover letter nor the commit log claimed it was fix=
ing
> >>> something broken, just that it was "better" (according to what
> >>> criteria?).   =20
> >>
> >> Better is probably too vague and I agree the "fixing" part is not
> >> clearly explained in the commit log. The cover-letter however states:
> >> =20
> >>> Patch 2/2: This patch is more complex. My main target was to solve is=
sues
> >>> I found in [1], but as it was very complex to do it "in place", I cho=
ose
> >>> to rework the composition function.   =20
> >> ... =20
> >>> [1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa=
5a193@riseup.net/   =20
> >>
> >> If you follow this link you will find all the feedback and especially
> >> the "broken" parts. Just to be clear, writing bugs is totally expected
> >> and review/testing is supposed to help on this regard. I am not blaming
> >> the author in any way, just focusing on getting this code in a more
> >> readable shape and hopefully reinforce the testing procedure.
> >> =20
> >>> If something is truly broken, it must be stated what exactly is so we
> >>> can all come up with a solution that will satisfy everyone.   =20
> >>
> >> Maybe going through the series pointed above will give more context
> >> but AFAIU: the YUV composition is not totally right (and the tests used
> >> to validate it need to be more complex as well in order to fail).
> >>
> >> Here is a proposal.
> >>
> >> Today's RGB implementation is only optimized in the line-by-line case
> >> when there is no rotation. The logic is bit convoluted and may possibly
> >> be slightly clarified with a per-format read_line() implementation,
> >> at a very light performance cost. Such an improvement would definitely
> >> benefit to the clarity of the code, especially when transformations
> >> (especially the rotations) come into play because they would be clearly
> >> handled differently instead of being "hidden" in the optimized logic.
> >> Performances would not change much as this path is not optimized today
> >> anyway (the pixel-oriented logic is already used in the rotation case).
> >>
> >> Arthur's YUV implementation is indeed well optimized but the added
> >> complexity probably lead to small mistakes in the logic. The
> >> per-format read_line() implementation mentioned above could be
> >> extended to the YUV format as well, which would leverage Arthur's
> >> proposal by re-using his optimized version. Louis will help on this
> >> regard. However, for more complex cases such as when there is a
> >> rotation, it will be easier (and not sub-optimized compared to the RGB
> >> case) to also fallback to a pixel-oriented processing.
> >>
> >> Would this approach make sense? =20
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
> > rotation-format-siting combination by chaining function pointers.
> >=20
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
> Hi,
>=20
> I think I'm the culprit for that, as stated on [1]. My intention with
> the suggestion was to remove some code repetition and too facilitate the
> rotation support implementation. Going back, I think I was to high on
> DRY at the time and didn't worry about optimization, which was a
> mistake.

Hi Arthur,

no worries. We can also blame reviewers for not minding benchmarks. ;-)

> But, I agree with Miquel that the rotation logic is easier to implement
> in a pixel-based way. So going pixel-by-pixel only when rotation occurs
> would be great.

Yes, and I think that can very well be done in the line-based framework
still that existed in the old days before any rotation support was
added. Essentially a plug-in line-getter function that then calls a
format-specific line-getter pixel-by-pixel while applying the rotation.
It would be simple, it would leave unrotated performance unharmed (use
format-specific line-getter directly with lines), but it might be
somewhat less performant for rotated KMS planes. I suspect that might
be a good compromise.

Format-specific line-getters could also be parameterized by
pixel-to-pixel offset in bytes. Then they could directly traverse FB
rows forward and backward, and even FB columns. It may or may not have
a penalty compared to the original line-getters, so it would have to
be benchmarked.

Line-getters working on planar YUV FBs might delegate Y, U, V, or UV/VU
reading to R8 and/or RG88 line or pixel reader functions. They might
also return block-height lines instead of one line at a time. However,
I wouldn't commit to any approach without benchmarking alternatives.
The performance comparison must justify the code complexity, like it
was seen with the initial line-based implementation.

A good benchmark is key, IMO.


Thanks,
pq

>=20
> Best Regards,
> ~Arthur Grillo
>=20
> [1]: https://lore.kernel.org/dri-devel/20230418130525.128733-2-mcanal@iga=
lia.com/
>=20
> >=20
> > Sorry, I didn't realize the optimization had already been lost.
> >=20
> > Btw. I'd suggest renaming vkms_compose_row() to vkms_fetch_row() since
> > it's not composing anything and the name mislead me.
> >=20
> > I think if you inspect the compositing code as of revision
> > 8356b97906503a02125c8d03c9b88a61ea46a05a you'll get a better feeling of
> > what it was supposed to be.
> >=20
> >=20
> > Thanks,
> > pq =20


--Sig_/J_RnRFU_kLOpzBDMdDO0yZh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXAtHQACgkQI1/ltBGq
qqfcfQ//ZRHSay37RT3wsuuOTf1s3UIP2fgyoiB9JLLXhTH/g0ouKQECG1v987Mv
YfBaNhEiwvYrHKq6Nkj9RXd9BlyXGELsq6uRfH72dR932R9WuCQzXFb92yiQBhSE
kTtc7NjNE1xq+RrjQuAJ60CuFIFEkIx4OkKN4tiQ4MasblfE9jyDc0gR4uji2ie7
PigDV8PSS8IYXMpBCf7w8vskpQRArN/fDlJMKUC+553/PdmtVcct6FPkV7R/HmwV
netlctmyQLitAXG5OpkFHzBnXpTuufhDKGeu/nuy2rQO37hUE+t+MtB22YjalnWR
bY8DsrtOs+1Joh0kuxPxk8tBqniu7SsrOBu2Nl1gM0HDeRHxQZsqVaaJ6juHsuGe
gGMNhOo8sZ/9Twnh4aqfzFy+w9cAzsZUBY8x/T+otWVdehP/3iPKG94A3utTYAo6
heldHbHQkWFeTSd8lJxw1ODdEGgVHTrgnW3PVKJbPlrP7v+o1o83ILrdPJkMdTQ6
n4GL2rmlqERIrh6Y0Kzb3wlo+7p9y90lCLXfPvdBcNWvW0j9PbLIqE29nvBiqTDd
YKJ0D3po0x7vxlDsQlhHJRkdtjafnmGDB0nHfI9TSHpv8v1ZnoEc0CnHc/3ajMVU
es7zYv7mtJHxKYWEsXb0GF+CAhVPcO9/jzJqW7V78rKaBIP+N5g=
=Q7Kk
-----END PGP SIGNATURE-----

--Sig_/J_RnRFU_kLOpzBDMdDO0yZh--
