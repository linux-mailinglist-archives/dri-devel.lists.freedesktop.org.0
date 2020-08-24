Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE082528DB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17896EA4B;
	Wed, 26 Aug 2020 08:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030D86E937
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 13:35:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 25E955800F9;
 Tue, 25 Aug 2020 09:35:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=BD5bjXAobBCo9yTevZ5BZkrhVrV
 sqNpdHQCkmUriY40=; b=kuV2RCaEiK33UvZoHu5zDowvk+1jn3Yo0s+6FrDTG4T
 vkpluoU5hENDRI3Dh30C6mvULk9bTrGgyZwXQuIAlTeX/9JWKUK/WQE2dkUzMvgQ
 M4LkeCSOw0a6YRIYoOrPMjMh5UvJyWa9dc5yqktipM77D/3Asz+SPqU+5ePwS60s
 O1XjVAmAvv7FJtrlUyiJtchoqBaHD0bJ6+NAiCTA9Pjt/zCERA5EN6R7h9OsOLaY
 fqoqRwuP/8MqJV0fIeHlHkrdoRmyf3jO60Sz2vrUo9KN2Efug87QhFh+8ERF+XC9
 7ZLn4TthxylC8UbRqMsCQpeGNByMuOCH3h7r9x2qv5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BD5bjX
 AobBCo9yTevZ5BZkrhVrVsqNpdHQCkmUriY40=; b=BqNzfJk9idLMcxnAJ3vfsf
 +ZUuvY9k2OeVrrgatSXhQ7leyf2HWpge8QmJYMjBmR7xbdRg02NzuvEpYi9hEO7a
 G9qeMgzfoNqzYXORpMUuqOUC4k/J7ahp4OB9o+wfddjmr12ANDgMd7G8xo3BZDNz
 IZO6+oRwEnmTauNTmZETu6cQVAin9XSJDtqdK77c5V0zRDyVbbcfbfNUhPsmoPB4
 dDuJonGD7lRzU53k2AdaxO3u0/wjcwzr+mWgP3BGZurekknd2LVT1KQnmcpbdv2E
 3EcNoOoToPiM2r9CoWgR0Id5ejn3fhArslG9hyyBAExlcXWIhcAwNNbL2+Ji7yOQ
 ==
X-ME-Sender: <xms:qhNFXzOpmuQP1n_ZBDvo8EYhCmcSFDeNC84gEqTrZy3zIujHkjqTrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptdejfeekvdffhffhffehjeevjefhfeffffdvieevtdeghfelveeuuddtffei
 gfehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshhpihhnihgtshdrnhgvthdpfi
 hhihhtvghquhgrrhhkrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvg
 hrnhhordhtvggthh
X-ME-Proxy: <xmx:qhNFX9_418Z59Wk0Kr4eooCWpDW8MTOqqJiyJV4NvTmY-CYrUK_Jhw>
 <xmx:qhNFXySpgXqXKBjYIHUNPOiCh932i_hiwGtBHqOaqM4aplZfCAEEDA>
 <xmx:qhNFX3vIPhFRDfg3IYr9Limzm3QXoWQ_7zDiSditLNiVJhKHPFrPuw>
 <xmx:qxNFX_79UvOw9T7WNzjnEvscx8-QeKJcvTNKUW7_p-HYl8EbiS0ajA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 46C0930600A6;
 Tue, 25 Aug 2020 09:35:38 -0400 (EDT)
Date: Mon, 24 Aug 2020 15:11:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 13/14] [DO NOT MERGE] arm64: dts: allwinner: h6: Add
 GPU OPP table
Message-ID: <20200824131133.hp3resve6c3r3xqq@gilmour.lan>
References: <20200704102535.189647-1-peron.clem@gmail.com>
 <20200704102535.189647-14-peron.clem@gmail.com>
 <20200704121301.jfd3m3jnlghmddg4@gilmour.lan>
 <CAJiuCceMS__bNVO54E2OYnqnaOAL9pGkxRo4XAABiyqagaEtmw@mail.gmail.com>
 <CAJiuCce58Gaxf_Qg2cnMwvOgUqYU__eKb3MDX1Fe_+47htg2bA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJiuCce58Gaxf_Qg2cnMwvOgUqYU__eKb3MDX1Fe_+47htg2bA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Ondrej Jirman <megous@megous.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: multipart/mixed; boundary="===============1548566252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1548566252==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ssjrkcbupbbjduka"
Content-Disposition: inline


--ssjrkcbupbbjduka
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Clement,

On Mon, Aug 03, 2020 at 09:54:05AM +0200, Cl=E9ment P=E9ron wrote:
> Hi Maxime and All,
>=20
> On Sat, 4 Jul 2020 at 16:56, Cl=E9ment P=E9ron <peron.clem@gmail.com> wro=
te:
> >
> > Hi Maxime,
> >
> > On Sat, 4 Jul 2020 at 14:13, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > On Sat, Jul 04, 2020 at 12:25:34PM +0200, Cl=E9ment P=E9ron wrote:
> > > > Add an Operating Performance Points table for the GPU to
> > > > enable Dynamic Voltage & Frequency Scaling on the H6.
> > > >
> > > > The voltage range is set with minival voltage set to the target
> > > > and the maximal voltage set to 1.2V. This allow DVFS framework to
> > > > work properly on board with fixed regulator.
> > > >
> > > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > >
> > > That patch seems reasonable, why shouldn't we merge it?
> >
> > I didn't test it a lot and last time I did, some frequencies looked uns=
table.
> > https://lore.kernel.org/patchwork/cover/1239739/
> >
> > This series adds regulator support to Panfrost devfreq, I will send a
> > new one if DVFS on the H6 GPU is stable.
> >
> > I got this running glmark2 last time
> > # glmark2-es2-drm
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >     glmark2 2017.07
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >     OpenGL Information
> >     GL_VENDOR:     Panfrost
> >     GL_RENDERER:   Mali T720 (Panfrost)
> >     GL_VERSION:    OpenGL ES 2.0 Mesa 20.0.5
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >
> > [   93.550063] panfrost 1800000.gpu: GPU Fault 0x00000088 (UNKNOWN) at
> > 0x0000000080117100
> > [   94.045401] panfrost 1800000.gpu: gpu sched timeout, js=3D0,
> > config=3D0x3700, status=3D0x8, head=3D0x21d6c00, tail=3D0x21d6c00,
> > sched_job=3D00000000e3c2132f
> >
> > [  328.871070] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
> > 0x0000000000000000
> > [  328.871070] Reason: TODO
> > [  328.871070] raw fault status: 0xAA0003C2
> > [  328.871070] decoded fault status: SLAVE FAULT
> > [  328.871070] exception type 0xC2: TRANSLATION_FAULT_LEVEL2
> > [  328.871070] access type 0x3: WRITE
> > [  328.871070] source id 0xAA00
> > [  329.373327] panfrost 1800000.gpu: gpu sched timeout, js=3D1,
> > config=3D0x3700, status=3D0x8, head=3D0xa1a4900, tail=3D0xa1a4900,
> > sched_job=3D000000007ac31097
> > [  329.386527] panfrost 1800000.gpu: js fault, js=3D0,
> > status=3DDATA_INVALID_FAULT, head=3D0xa1a4c00, tail=3D0xa1a4c00
> > [  329.396293] panfrost 1800000.gpu: gpu sched timeout, js=3D0,
> > config=3D0x3700, status=3D0x58, head=3D0xa1a4c00, tail=3D0xa1a4c00,
> > sched_job=3D0000000004c90381
> > [  329.411521] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
> > 0x0000000000000000
> > [  329.411521] Reason: TODO
> > [  329.411521] raw fault status: 0xAA0003C2
> > [  329.411521] decoded fault status: SLAVE FAULT
> > [  329.411521] exception type 0xC2: TRANSLATION_FAULT_LEVEL2
> > [  329.411521] access type 0x3: WRITE
> > [  329.411521] source id 0xAA00
>=20
> Just to keep a track of this issue.
>=20
> Piotr Oniszczuk give more test and seems to be software related:
> https://www.spinics.net/lists/dri-devel/msg264279.html
>=20
> Ondrej gave a great explanation about a possible origin of this issue:
> https://freenode.irclog.whitequark.org/linux-sunxi/2020-07-11
>=20
> 20:12 <megi> looks like gpu pll on H6 is NKMP clock, and those are
> implemented in such a way in mainline that they are prone to
> overshooting the frequency during output divider reduction
> 20:13 <megi> so disabling P divider may help
> 20:13 <megi> or fixing the dividers
> 20:14 <megi> and just allowing N to change
> 20:22 <megi> hmm, I haven't looked at this for quite some time, but H6
> BSP way of setting PLL factors actually makes the most sense out of
> everything I've seen/tested so far
> 20:23 <megi> it waits for lock not after setting NK factors, but after
> reducing the M factor (pre-divider)
> 20:24 <megi> I might as well re-run my CPU PLL tester with this
> algorithm, to see if it fixes the lockups
> 20:26 <megi> it makes sense to wait for PLL to stabilize "after"
> changing all the factors that actually affect the VCO, and not just
> some of them
> 20:27 <megi> warpme_: ^
> 20:28 <megi> it may be the same thing that plagues the CPU PLL rate
> changes at runtime

I guess it's one of the bugs we never heard of...

It would be a good idea to test it on another platform (like Rockchip?)
to rule out any driver issue?

What do you think?

Maxime

--ssjrkcbupbbjduka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0O8hQAKCRDj7w1vZxhR
xYVDAQDDudJ6bCiXmHhPMijhyU+WqByi72nw3zyKM0R1vtKqHAEA09BJDULh+d1r
DAOm2fiobSXmAHKe46f2he9tBkh/KgM=
=/QwQ
-----END PGP SIGNATURE-----

--ssjrkcbupbbjduka--

--===============1548566252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1548566252==--
