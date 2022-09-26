Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B745EA677
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2110E3FB;
	Mon, 26 Sep 2022 12:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E1410E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:47:45 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 07D8B5C00ED;
 Mon, 26 Sep 2022 08:47:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Sep 2022 08:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664196465; x=1664282865; bh=R4Pq0cYb1F
 e6z3DYfXIKp/lfSNn8NhGKkRs2aQhPb5c=; b=dC89crZscEUGypaOMBMmy7TuKI
 vR1NS4AZDP30m5DTYed9pUUQE3E3YsBDSF2Gp95+WJJ61CQv/fYWucXn4i4i4R6i
 IOp8XXLrgzf17AJzZfJ1GquA7vYq5/YZ9ajeiF5se3BrYzE8xoUUoS7NfpW6NjIn
 omIRwlYozZoqvPtRDSpsLhmqxuyWmtjL5o3jHxf5SVK2TaJ1eoUMxrUCKlruE4in
 95hnQMtqWlU0msxeR+Yhtx2cWQFK55L7QbywNm2eOIDnCZMPTdYTQYiAkUX11mN6
 382pt1D/JO54DusGPOjKs9S7My8qBzqjpnHp0PX/9AO6r5awIlpG45Qc97VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664196465; x=1664282865; bh=R4Pq0cYb1Fe6z3DYfXIKp/lfSNn8
 NhGKkRs2aQhPb5c=; b=CTxfwu7DP5qvcxA9q5CLgo/Z1mMirvX+1YSap7x6RNeY
 f+n2GSQAs2JFK3T3T04HxEM4qUdbMM7Wi5CBZzOtReeQu+y339OlN/M9W5a27/fk
 2Qmt4gKAzoeTnDoeThpZYCKTw5YH6rFyAo7nwFY/13262gEqrBy8UzwZtipFs//A
 J8IdhxFzPdreNAsplYxXRBYdZ/2MN3PHOlu+jhHYbigkcPGrEhYUHO7SPZnWxoY1
 C9f+ZZqtQpEHBWLiR+t599g0yFLYNb2ugPV69C5HVdE4ZkGxWRyC2TJh+k2o3Nve
 /0JmIMRYlK162+jovA6YpQLQGywqHgtzCqGV1NI+sw==
X-ME-Sender: <xms:cJ8xY6c-8NVe0ESDRYEIICBhsfwY3KCjPaK96D8eJG2gqQ6Rx0QSxw>
 <xme:cJ8xY0PTfstNT2Fus1gsbICrzYJoRp4eJP-SGpQhjtfD3Hb9tgCjGY6wcwALOIuU-
 QY58F617D7PTDJyAEY>
X-ME-Received: <xmr:cJ8xY7h98mkInHcS7SSXBEGvOePz-yolbL6GvxShHnmwUYJL2xLbqeuen4NCvkt5RGzm1EtWxniAlyaAYXLpY3kKySCNwzUm1HQB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cJ8xY39DtrP0BWtjUgMQW9OGFtE7-qEnCX0CLFTa9EkH_UEVWp8uGA>
 <xmx:cJ8xY2ubltxhjCJPLOedQD8xVdjQvz58oy-WmaUbt8C-WpnYrDOBtA>
 <xmx:cJ8xY-HqTM3Loy91et7zQaZ6DV5cl4lZmaLlELWIulcun27pQjQ89g>
 <xmx:cZ8xY0BEnPpFa5CQE4oulABr1M2S_3ueYOF8qqHpwvElJCzMQkOSiw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 08:47:44 -0400 (EDT)
Date: Mon, 26 Sep 2022 14:47:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220926124743.5s7x3dwhzienqs3x@houat>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6ncmuxhvxikylz3j"
Content-Disposition: inline
In-Reply-To: <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6ncmuxhvxikylz3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrote:
> On 26.09.2022 14:08:04, Stefan Wahren wrote:
> > Hi Marc,
> >=20
> > Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > > I'm on a Raspberry Pi 3 Model B+ running current Debian testing A=
RM64,
> > > > > using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
> > > > >=20
> > > > > | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x41=
0fd034]
> > > > > | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@list=
s.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for De=
bian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > > 9-01)
> > > > > | [    0.000000] Machine model: Raspberry Pi 3 Model B+
> > > > > | [    3.747500] raspberrypi-firmware soc:firmware: Attached to f=
irmware from 2022-03-24T13:21:11
> > > > >=20
> > > > > As soon a the vc4 module is loaded the following warnings hits 4
> > > > > times, then the machine stops.
> > > [...]
> > >=20
> > > > The warning itself is fixed, both upstream and in stable (5.19.7).
> > > Ok. Debian is using 5.19.6
> > >=20
> > > > It shouldn't have any relation to the hang though. Can you share yo=
ur
> > > > setup?
> > > - config.txt:
> > >=20
> > > -------->8-------->8-------->8-------->8--------
> > > gpu_mem=3D16
> > > disable_splash=3D1
> > >=20
> > > arm_64bit=3D1
> > > enable_uart=3D1
> > > uart_2ndstage=3D1
> > >=20
> > > os_prefix=3D/u-boot/
> > >=20
> > > [pi3]
> > > force_turbo=3D1
> > > -------->8-------->8-------->8-------->8--------
> > >=20
> > > - Raspberry Pi 3 Model B+
> > > - no HDMI connected
> >=20
> > Does it mean, the issue only occurs without HDMI connected?
> > If you didn't test with HDMI yet, could you please do?
>=20
> The error occurs with HDMI not connected, as vc4 is the gfx driver I
> thought this might be of interest. :)
>=20
> I don't have a HDMI monitor here, but I'll come back to you as soon as I
> get access to one (might take some time).

It's not the first time an issue like this one would occur. I'm trying
to make my Pi3 boot again, and will try to bisect the issue.

Maxime

--6ncmuxhvxikylz3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzGfbwAKCRDj7w1vZxhR
xdeYAP9VaHJj+YJ5xjsCjqfxkyaMLx8GNV3YQevGtcWWFr+j/wD/dHOA65fzd6+N
jLGTjC7EvyUcvcV/G6G5ArZY5sidhwY=
=pm7T
-----END PGP SIGNATURE-----

--6ncmuxhvxikylz3j--
