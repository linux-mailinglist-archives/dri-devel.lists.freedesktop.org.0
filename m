Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E414D1A1A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141A10E30F;
	Tue,  8 Mar 2022 14:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5582A10E30F;
 Tue,  8 Mar 2022 14:11:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 962435C0283;
 Tue,  8 Mar 2022 09:11:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 08 Mar 2022 09:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=yK79CUhg+OwfIp8dYEB3sNuxbhWN3cIFhc/f4w
 cVwmQ=; b=tRTYjde78JpOYK5d+vN555uUHoJQTHqdRNO30oUAm9AfPhLhUhxSxg
 6pLh9MocAI9+RlIjI8HqXbQ1qZZkMwXzXkzSVbm3qZ2kYWyrpJ9K3w1W6MmQyoHI
 AG4DZ2ijHWhwHM2PyaGwPC2jj9G439rKJLbfGxl4PxbcCXJwb6PESHWqi5AYSI77
 d8RMjvpPqZV0sPY+y6afyzUYiRkfSB4I8LjhXB1ssWVEUdmF/pvsY93ZTaFK1/nD
 IINnPDYe5/6/yVUB9F4AuUVufhus4s0O87nCrms0zzpYwJ07WpBiDjzU8ibbv/FO
 lyqAhWsQD8ZZZLD/8qjuIsTJzcqbmZeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yK79CUhg+OwfIp8dY
 EB3sNuxbhWN3cIFhc/f4wcVwmQ=; b=RAZZcNqSHuAX/7vB5IVqWgBT4YkC6TBGO
 /vSY36MFhyZ0M9bQ9VYt4WvxIOYPiLsSerWbb2dL9ZblrQCzSjbIlEh0kEhC6qnC
 ciuGAzvcfbtOm2Dp+fPB6org4q9oQUFEqwRKdBvqPQjztNPyaYSOQIKcw0yqBTHm
 3ZV34aQgHML1hbH4Sw7RTrCN1igqtMWXMZWwe81m3tK9xRcpx6iCOCjNpfFhyqo8
 vfVkUb7fAo32jxV5CSdVe9FjlvoFtOXNZiUih+N5jzxai2TpsgfYcYFn9AgQypth
 VFTQZOTf3NfvFRvw/rx84VR/89SXEuF796FtGKRIaJn2677PpqrJA==
X-ME-Sender: <xms:ImQnYtWWTTo91HHd3c33NIL9IEMqXNSY63x3D3SQqFmuTbSCeY8oTw>
 <xme:ImQnYtmy3pIXiXVA-ZKrlOLUMFWmNov4svaT6qE5UOZ-rl27-mJtWB3WewfoTDBmF
 wv9LiDeL3gZx4i3B8M>
X-ME-Received: <xmr:ImQnYpZ07aITv1Mg6BOxKzUGftvFMnZkmVeeEQ0XYTHTdEqekl2-YRuxwT3NyKJYUj_VN-6FMbnwOtUlHRHuE6XaG4WkPESCoNujCN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvffukfhfgggtuggj
 sehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimh
 gvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnheptefhleehvdegheduleel
 vddvteekjeefvdetledujeelffegtdevudduvddufefgnecuffhomhgrihhnpegslhhogh
 hsphhothdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ImQnYgXUBImJdkk00dlIrf_qPhjBGps0GUDp39oaS6aiIVUZGsz4Pg>
 <xmx:ImQnYnmIarTtTFItuAyAWovtwFEVqjNKbhK_t3KveAjSOSDy1f8RDw>
 <xmx:ImQnYtdta8bM7viSSBxJ_pgORZG_bXW2o391LnooVybtm-aTaadN2Q>
 <xmx:ImQnYlZb0kx-bU5acHaHppzlOEoKVElFZyNjmOruAVltgboU2YPYjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 09:11:45 -0500 (EST)
Date: Tue, 8 Mar 2022 15:11:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Writeback Assumptions for XRGB
Message-ID: <20220308141144.ldwxoc2ljd2wq4fb@houat>
References: <20220304144607.3pwfwhxf4zsckan7@houat>
 <20220308102624.1a757e36@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ed6vltlmmj2365mc"
Content-Disposition: inline
In-Reply-To: <20220308102624.1a757e36@eldfell>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ed6vltlmmj2365mc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Mar 08, 2022 at 10:26:24AM +0200, Pekka Paalanen wrote:
> On Fri, 4 Mar 2022 15:46:07 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > Indeed, while the input buffer uses 0xff for the X component, we'll get
> > back 0x00 from the hardware, and thus the hashes are not identical. We
> > can force the hardware to always set it to 0xff, but that doesn't seem
> > right. It would make more sense to ignore the X component entirely in
> > that case.
>=20
> Hi,
>=20
> I tried hard to send a slightly longer response, but gmail refuses to
> deliver to anyone without explanation.

For reference (and archives), this was your original message:

> > if a pixel component is marked X, then its value must not have any
> > observable effect when passed over an interface to another
> > component. To me there is no doubt about that.
> >
> > OTOH, if both output and writeback FBs had ARGB instead of XRGB,
> > things would be more complicated. Quite likely the CRTC background
> > color is opaque (or maybe HDMI and DP cannot transmit alpha meaning
> > that writeback with alpha < 1.0 makes no sense), which means that no
> > matter what A values goes in, writeback A will always come out as
> > 0xff (on 8 bpc). One might be able to argue otherwise on this.
> >
> > I would actually recommend IGT to put pseudo-random garbage on X
> > channels to catch drivers and hardware that unexpectedly uses the X
> > values. I've used this trick with weston-simple-shm:
> > https://ppaalanen.blogspot.com/2012/04/improved-appearance-for-simplest=
=2Ehtml
> >
> > Pixel component values 0x00 and 0xff are weak for testing blending
> > and composition.
>
> So here's a summary of my opinion:
>=20
> - KMS must ignore X channel contents on read
> - IGT must ignore X channel contents when comparing results
> - it would be nice if IGT filled image X channels with garbage to
>   verify the first two points

That works for me :)

I'll work on a series of patches addressing this then

Thanks!
Maxime

--ed6vltlmmj2365mc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYidkIAAKCRDj7w1vZxhR
xe6pAP9foWN6/6xHwM2hnJd8GLUsrRL11wgpQ0+CnrwU+BqeBQD/UOWvuFFz3qAk
qS+/UqEFjTrmQmsHmBbwmTpbovwmxgY=
=YW6+
-----END PGP SIGNATURE-----

--ed6vltlmmj2365mc--
