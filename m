Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BBD400A6B
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 11:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35176E8FC;
	Sat,  4 Sep 2021 09:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4C76E8FC
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 09:10:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id EB05D5C0051;
 Sat,  4 Sep 2021 05:10:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 04 Sep 2021 05:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=BPQ6Zd0BNYdOVeQO34LBtYHZxga
 Gkr1CeGhReIDJfiE=; b=OhaeqO6laTiTF3f12olhi5+kLnaSzg7mOVAGKRyor6A
 W+0QOHX5FuUYQammFNw4MnGPKRSMzU7apY4d5wk70+91JTXwDBb7mRYg5qVBoePk
 Mvj0MEBD3QJDw1Ch4RtWuNpnr2C7zDCcQONCTLjWLDe3YxyxxXxFmvyQgUpfoyI8
 35dCJELcdx29C5qFOxKoWu7vn0sb+CkAfxtJzSaO0ZeCRbIvDC6JS6XTfhG9be75
 b48Jh4kh1hPiaeY1gP+OrxXG0qdTqSHTeMzRUwSlmsFfVu28JdNP3dr03Up8axXa
 QKy3hdxMJjGUcrNeoM7XV4kLUND22rRRkDR6BMVB2xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BPQ6Zd
 0BNYdOVeQO34LBtYHZxgaGkr1CeGhReIDJfiE=; b=mD8itstP2lNHBPpQ/SFEU3
 sTQqS7Vf077V5n13gpSgFhwAKPMAuhwouXYRx8wghpUYD2GL5/pscrZon6DfD/bp
 AKGRE+c7mYLfnrA8XbDawktmIvplIsxk3ttySD26KYeqBZR3p2d1UVzTjokWoURj
 CwXr58ebVANvuK5snBmHtrSAL5tgzrE9z+SMdajO99/mxe/U5/j44b8xchSpho6t
 AEXlFT0sGvoB3LIDipnOznYo6ZWvfBMYoMxCHG8Pvhu3tJ0UVEW1IRm/SxCWg3na
 7Lx53n9E+BNDjbGIqSVm5IyXYCMUbvzji6urdKMhpe0yFpoJrxPukKTtzDWnTVPg
 ==
X-ME-Sender: <xms:HDgzYXk1sBm5TrNEzE9F_4HqDUChOzyhFe1hRU0q2KE59MNUC20vBQ>
 <xme:HDgzYa2Wk8E87t5ZHac7VR2yZnHltAsZACI4ZSRoZ99ngHigmkCqwMAbRKzpYdYHG
 rKyWGTuGP59JBWGvrM>
X-ME-Received: <xmr:HDgzYdrtEuqsCzrssjtEM_MXppGpFfjaQEPzt6FEWNQn6Di25M2UiDQ2zx-dojwHcNcKa877i7NGljTjK7mK4uKfbm9v4DDI9cbj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvledgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfetffffhfejhfevieekkedvkeetheevkeevueffieegvddtgfdttdfhheei
 feefnecuffhomhgrihhnpegtohguvghthhhinhhkrdgtohdruhhknecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:HDgzYfmNnEFO5CNV9eNfanaz8lp32rcYoTfAetLKQFFRV5cVY1NA7Q>
 <xmx:HDgzYV3tBaNguaT_Qzk3cst4ZauQZ5pJEGVuqZHfTJoMZw6u5SZ20g>
 <xmx:HDgzYes6arVnWDgbZ_RzNVdX-veEypMibHGdGXtO3j7Tn-gbcm2j9Q>
 <xmx:HTgzYfrqaSwi8HKrBLKMZmUH6tdINBDfFvowbdrER5hN0gctMOQZcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Sep 2021 05:10:52 -0400 (EDT)
Date: Sat, 4 Sep 2021 11:10:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20210904091050.g5axxctgelciihjn@gilmour>
References: <CADVatmPB9-oKd=ypvj25UYysVo6EZhQ6bCM7EvztQBMyiZfAyw@mail.gmail.com>
 <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ypcvwbexldcqbnwm"
Content-Disposition: inline
In-Reply-To: <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
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


--ypcvwbexldcqbnwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 09:09:50PM +0100, Sudip Mukherjee wrote:
> Hi Maxime,
>=20
> On Fri, Sep 3, 2021 at 5:03 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Sudip,
> >
> > On Thu, Sep 02, 2021 at 10:08:19AM +0100, Sudip Mukherjee wrote:
> > > Hi All,
> > >
> >
>=20
> <snip>
>=20
> >
> > >
> > > You can see the complete dmesg at
> > > https://openqa.qa.codethink.co.uk/tests/76#step/dmesg/8
> >
> > What test were you running?
>=20
> Nothing particular, its just a boot test that we do every night after
> pulling from torvalds/linux.git

What are you booting to then?

Maxime

--ypcvwbexldcqbnwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYTM4GgAKCRDj7w1vZxhR
xQ3TAP9bfpiCki9kE960KrKuc4hPBEz/ZHc+92hgJ7h8yz2ECwEA59wOF0tGi+5N
W3NFBpby2JSAbrXbbAzEr746T1hNyQw=
=qpBF
-----END PGP SIGNATURE-----

--ypcvwbexldcqbnwm--
