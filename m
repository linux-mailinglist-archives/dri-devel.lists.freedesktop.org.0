Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA078473A8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D4310F07B;
	Fri,  2 Feb 2024 15:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="bQEb3fcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8480110F07B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dj3ITMFESzY7i4LQbwzh1R9wfxEnrJCoi1O0ayFCj7c=; b=bQEb3fcmewKAUQkfJJ0J577Nsf
 GZ1oc/jerNINEdcSC4WDB1RIq+XUz0eOffX2QxPcqIcl5g++9B6749KOyt2/hMU09nh7Nfc60WgfN
 B67oJ59GCYR5imUqEsCZczPK27klab8EB7C/wLClXQOENwroHcZ2YMStcbIVJWXMzhcPYK0WAmD2Q
 88ns6c5WbkJcgMIObr1DOYGFmeNUc8z1CdaY6hVTDkhLaLM8MlhAY+4AWdeiQBV3sgWB6VvW52HK/
 9RPa9AjIzcyv9Xoh+u1/wYJ0yY+8zSzFVc8mXCXUOma06Nbq21QWSpLzi/MEfDLX6AY2VaAZpx0rp
 43IoX+eg==;
Received: from [194.136.85.206] (port=49138 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rVvn1-0008FI-2p;
 Fri, 02 Feb 2024 17:49:15 +0200
Date: Fri, 2 Feb 2024 17:49:13 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <20240202174913.789a9db9@eldfell>
In-Reply-To: <20240202131322.5471e184@xps-13>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
 <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
 <20240202131322.5471e184@xps-13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8mK8U1C6IaH97Jzi7wkUtAS";
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

--Sig_/8mK8U1C6IaH97Jzi7wkUtAS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Feb 2024 13:13:22 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello Maxime,
>=20
> + Arthur
>=20
> mripard@kernel.org wrote on Fri, 2 Feb 2024 10:53:37 +0100:
>=20
> > Hi Miquel,
> >=20
> > On Fri, Feb 02, 2024 at 10:26:01AM +0100, Miquel Raynal wrote: =20
> > > pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +0200:
> > >    =20
> > > > On Thu, 01 Feb 2024 18:31:32 +0100
> > > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > > >    =20
> > > > > Change the composition algorithm to iterate over pixels instead o=
f lines.
> > > > > It allows a simpler management of rotation and pixel access for c=
omplex formats.
> > > > >=20
> > > > > This new algorithm allows read_pixel function to have access to x=
/y
> > > > > coordinates and make it possible to read the correct thing in a b=
lock
> > > > > when block_w and block_h are not 1.
> > > > > The iteration pixel-by-pixel in the same method also allows a sim=
pler
> > > > > management of rotation with drm_rect_* helpers. This way it's not=
 needed
> > > > > anymore to have misterious switch-case distributed in multiple pl=
aces.     =20
> > > >=20
> > > > Hi,
> > > >=20
> > > > there was a very good reason to write this code using lines:
> > > > performance. Before lines, it was indeed operating on individual pi=
xels.
> > > >=20
> > > > Please, include performance measurements before and after this seri=
es
> > > > to quantify the impact on the previously already supported pixel
> > > > formats, particularly the 32-bit-per-pixel RGB variants.
> > > >=20
> > > > VKMS will be used more and more in CI for userspace projects, and
> > > > performance actually matters there.
> > > >=20
> > > > I'm worrying that this performance degradation here is significant.=
 I
> > > > believe it is possible to keep blending with lines, if you add new =
line
> > > > getters for reading from rotated, sub-sampled etc. images. That way=
 you
> > > > don't have to regress the most common formats' performance.   =20
> > >=20
> > > While I understand performance is important and should be taken into
> > > account seriously, I cannot understand how broken testing could be
> > > considered better. Fast but inaccurate will always be significantly
> > > less attractive to my eyes.   =20
> >=20
> > AFAIK, neither the cover letter nor the commit log claimed it was fixing
> > something broken, just that it was "better" (according to what
> > criteria?). =20
>=20
> Better is probably too vague and I agree the "fixing" part is not
> clearly explained in the commit log. The cover-letter however states:
>=20
> > Patch 2/2: This patch is more complex. My main target was to solve issu=
es
> > I found in [1], but as it was very complex to do it "in place", I choose
> > to rework the composition function. =20
> ...
> > [1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa5a=
193@riseup.net/ =20
>=20
> If you follow this link you will find all the feedback and especially
> the "broken" parts. Just to be clear, writing bugs is totally expected
> and review/testing is supposed to help on this regard. I am not blaming
> the author in any way, just focusing on getting this code in a more
> readable shape and hopefully reinforce the testing procedure.
>=20
> > If something is truly broken, it must be stated what exactly is so we
> > can all come up with a solution that will satisfy everyone. =20
>=20
> Maybe going through the series pointed above will give more context
> but AFAIU: the YUV composition is not totally right (and the tests used
> to validate it need to be more complex as well in order to fail).
>=20
> Here is a proposal.
>=20
> Today's RGB implementation is only optimized in the line-by-line case
> when there is no rotation. The logic is bit convoluted and may possibly
> be slightly clarified with a per-format read_line() implementation,
> at a very light performance cost. Such an improvement would definitely
> benefit to the clarity of the code, especially when transformations
> (especially the rotations) come into play because they would be clearly
> handled differently instead of being "hidden" in the optimized logic.
> Performances would not change much as this path is not optimized today
> anyway (the pixel-oriented logic is already used in the rotation case).
>=20
> Arthur's YUV implementation is indeed well optimized but the added
> complexity probably lead to small mistakes in the logic. The
> per-format read_line() implementation mentioned above could be
> extended to the YUV format as well, which would leverage Arthur's
> proposal by re-using his optimized version. Louis will help on this
> regard. However, for more complex cases such as when there is a
> rotation, it will be easier (and not sub-optimized compared to the RGB
> case) to also fallback to a pixel-oriented processing.
>=20
> Would this approach make sense?

Hi,

I think it would, if I understand what you mean. Ever since I proposed
a line-by-line algorithm to improve the performance, I was thinking of
per-format read_line() functions that would be selected outside of any
loops. Extending that to support YUV is only natural. I can imagine
rotation complicates things, and I won't oppose that resulting in a
much heavier read_line() implementation used in those cases. They might
perhaps call the original read_line() implementations pixel-by-pixel or
plane-by-plane (i.e. YUV planes) per pixel. Chroma-siting complicates
things even further. That way one could compose any
rotation-format-siting combination by chaining function pointers.

I haven't looked at VKMS in a long time, and I am disappointed to find
that vkms_compose_row() is calling plane->pixel_read() pixel-by-pixel.
The reading vfunc should be called with many pixels at a time when the
source FB layout allows it. The whole point of the line-based functions
was that they repeat the innermost loop in every function body to make
the per-pixel overhead as small as possible. The VKMS implementations
benchmarked before and after the original line-based algorithm showed
that calling a function pointer per-pixel is relatively very expensive.
Or maybe it was a switch-case.

Sorry, I didn't realize the optimization had already been lost.

Btw. I'd suggest renaming vkms_compose_row() to vkms_fetch_row() since
it's not composing anything and the name mislead me.

I think if you inspect the compositing code as of revision
8356b97906503a02125c8d03c9b88a61ea46a05a you'll get a better feeling of
what it was supposed to be.


Thanks,
pq

--Sig_/8mK8U1C6IaH97Jzi7wkUtAS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmW9DvkACgkQI1/ltBGq
qqewLxAAmU+dO2ANGbUkMukPWFH7hFlfiYy8bZ8QhF5TeIQzn3Qgt65nuYHlef6+
9/yE+S5hhFS1lDyicCCn+tPHDlNiQuAgYWC8huwWQW2oWT5LhUymF1Zn++txOi8W
WSA/eiJz082ScDKvgz31kuP5qIB7E6MDQL4GHQYfgO0pdXs02aBxEDzfgtuGBZi7
YC2hx9XLsexVQGahc6AoV2zGS/nUwNhVAgQJmt7WKbPEpLyQ8re8caEc/dDO1Klm
A4vrdo0wlEarGHc9OUwuvupvAnq5hd/Y6L7He1JIooHqBBJf5tA89Vo5yenGJ7f1
MKp3FLET3A7fn5j8ddBHKDsl2NgG2rCbI4BJZdxBQI+v1WAq8RacQ2YpFrsxE7dB
nbmTX7yBPrwOYkTfb99dbE3qkzOCMy8Bu584j6WBm+YW8ZSIrf1rKVXgaHnshWrQ
lEZVHKdTJMwqjJaOQS579bMV7YNuKYyz4Y5PTLuw46x3eUeVm1q3jk7RUmiiQlgG
ytMIGNwJNMuObdPeezQG13sF5SE7cMvkvESoQpy4u0pHH432Ml7p5AFB1q4vIHJi
FVu4asOrqtd9AobtiQqtJ0z4DITTmTPb/kwUyi7boEKIj/ravgC/9t6LMUqZ81mn
MjKB8XuCeT7CF2v0OHvlJy/b5EVrWpSImx4EPehJ1LIz35suUnw=
=h2ic
-----END PGP SIGNATURE-----

--Sig_/8mK8U1C6IaH97Jzi7wkUtAS--
