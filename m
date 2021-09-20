Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95FA41188E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 17:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492E86E52F;
	Mon, 20 Sep 2021 15:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1057D6E52F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 15:43:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D49F5C0176;
 Mon, 20 Sep 2021 11:43:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 20 Sep 2021 11:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=G7a5q99kUrh53YYRGCRkPtyLB3h
 hTo8Cc+7Pm0FmqOA=; b=PvDnTqpVzaacLwFkerO19U9coZGQfvmRnMsPn6u/ZJh
 olZz1Sj1RcXVpaPPgZVawqOW5O7XDGIDI9vbEF8GVW8VXxoqc+hLomJUKw0A6D6O
 iOV1LEUEfFxo2t+XRNQC5QrvRmELmq4Fq7qPKGjPC0RUDJAFpHitY8UQOY1PbG4a
 hjG4iD7eNVGmi3hEKgZwafre9lKR0uMg8V91elquykhupbYzByOKDNuDMxtxhIv5
 1ncClBMzYuktGRq7e6SzMvhaFgNFX6viz/y1L5nEIZg6N0cEFaDEPTlZ3tvJzeFM
 TVsjYzcq5bUlSuuiRStr6EvLpmcYaKsrvLTHaldb1/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=G7a5q9
 9kUrh53YYRGCRkPtyLB3hhTo8Cc+7Pm0FmqOA=; b=dJX5OgOEy0kNwBhGk7EN7M
 YZtu31ptpv8r5JSLiHTVfGz4+mVnREscqvJEnVR1M4IxjaWOzuK4tqWAF8B3FAUz
 EzRjqqStMzzPkaZKjqDRafW+tmy9JqCTuV4FVbujo2Wtn1Q5ei+6h7lTsHoS5N8n
 ZcAQD93o1cRxm+B0Xkdj6mOCiKWAoTFo+ejFsozjNNMafn1WmhxLN7KPeh8o/JAu
 okPF7GoycroB38VqJPMXygwl/5S4kgnf9rDthdtjtgAuRgz2cpYMbT3gCkYAyk3l
 dPRXSIHOMiRwFq9it9tmf64hojWfWV6mvMfk1+mVL+edFyl02n/XW9TPD17Hmvmw
 ==
X-ME-Sender: <xms:KKxIYUMi_gO-mZst4SYdOrSjC1w0_YNzMyQNfI7INXkgkJrSxnKF0w>
 <xme:KKxIYa_ktv1UqvR8t-CAp7Sj3pfT7wKbE8c3Tg6BMqAMRcKir8EVaaz-3ZfKJ7arB
 8AHSDnj5CGWRRbl4GQ>
X-ME-Received: <xmr:KKxIYbTwCON-rEk3cbVdWHGoae9Z-67U1CsnrKk2tjHw_3UUxw4V1QmHEVJL9PfQhnzlcwt0KW1Kw5hr7ZZXTUZzrwuslrcrbI6p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvedvfeetffdvleeugeeukeegueekheegieevieejkefhieetgfevudekhfel
 fffgnecuffhomhgrihhnpegtohguvghthhhinhhkrdgtohdruhhkpdhgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KKxIYcug4_XBw23reYvclDJrCFxEUF-6BS-fE3eT1gNKtDf0cR3A0w>
 <xmx:KKxIYcecybUXDhL_nPqJcXEmBRR5gmYoeaaUEMCmLQdXLm6pBER_vQ>
 <xmx:KKxIYQ0nDSSLixRjs5z8bzzgELyP0mBNl6ShZgwxyeL10OI2F0grLA>
 <xmx:KaxIYUSelFEcmnajGsd38vf1QWjlMH6sJ_0QzPtUCzHIFLz3dDKOaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 11:43:35 -0400 (EDT)
Date: Mon, 20 Sep 2021 17:43:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20210920154333.vunyxeshdb7jt5ka@gilmour>
References: <CADVatmPB9-oKd=ypvj25UYysVo6EZhQ6bCM7EvztQBMyiZfAyw@mail.gmail.com>
 <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
 <20210904091050.g5axxctgelciihjn@gilmour>
 <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
 <20210920144730.d7oabqfbx7pmyyfb@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="75iynnnzwnech42u"
Content-Disposition: inline
In-Reply-To: <20210920144730.d7oabqfbx7pmyyfb@gilmour>
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


--75iynnnzwnech42u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 04:47:31PM +0200, Maxime Ripard wrote:
> On Sat, Sep 04, 2021 at 10:40:29AM +0100, Sudip Mukherjee wrote:
> > Hi Maxime,
> >=20
> > On Sat, Sep 4, 2021 at 10:10 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Fri, Sep 03, 2021 at 09:09:50PM +0100, Sudip Mukherjee wrote:
> > > > Hi Maxime,
> > > >
> > > > On Fri, Sep 3, 2021 at 5:03 PM Maxime Ripard <maxime@cerno.tech> wr=
ote:
> > > > >
> > > > > Hi Sudip,
> > > > >
> > > > > On Thu, Sep 02, 2021 at 10:08:19AM +0100, Sudip Mukherjee wrote:
> > > > > > Hi All,
> > > > > >
> > > > >
> > > >
> > > > <snip>
> > > >
> > > > >
> > > > > >
> > > > > > You can see the complete dmesg at
> > > > > > https://openqa.qa.codethink.co.uk/tests/76#step/dmesg/8
> > > > >
> > > > > What test were you running?
> > > >
> > > > Nothing particular, its just a boot test that we do every night aft=
er
> > > > pulling from torvalds/linux.git
> > >
> > > What are you booting to then?
> >=20
> > I am not sure I understood the question.
> > Its an Ubuntu image. The desktop environment is gnome. And as
> > mentioned earlier, we use the HEAD of linus tree every night to boot
> > the rpi4 and test that we can login via desktop environment and that
> > there is no regression in dmesg.
>=20
> Looking at the CI, this isn't from a RPi but from qemu?
>=20
> What defconfig are you using? How did you generate the Ubuntu image?
> Through debootstrap? Any additional package?

So qemu (at least on Fedora 34) doesn't seem to have an RPI4 target, nor
upstream:
https://github.com/qemu/qemu/blob/079b1252e9de384385c9da910262312ec2e574c8/=
hw/arm/raspi.c#L367

I've tested an Ubuntu 21.04 arm64 build (since it seems like it's what
you've been using), built using debootstrap + ubuntu-desktop, both with
and without a monitor attached, and up to the desktop once logged in.

I don't see any crash.

Maxime

--75iynnnzwnech42u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUisJQAKCRDj7w1vZxhR
xa9NAP4kuM+wEd+OV/GIA51PrGSxrfLWJ5n5PbciTcg+y9yFyAD/c8dNNyHFLH4Q
2xLjeIuRoXDdJtYbf2uTJX9+/JrCXgg=
=rqGP
-----END PGP SIGNATURE-----

--75iynnnzwnech42u--
