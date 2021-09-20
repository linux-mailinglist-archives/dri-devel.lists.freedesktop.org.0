Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539F411429
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 14:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE146E4C4;
	Mon, 20 Sep 2021 12:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2A6E4C4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 12:18:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4DBB75C0163;
 Mon, 20 Sep 2021 08:18:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 20 Sep 2021 08:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=2vW9NFwlxBO5UbfO4C0PUUfkDI6
 QoaKFyXfybxrHMtM=; b=s9ngmFeiOzp2YGiueh+8GCZ76T+ugpZFh93If/+nmsK
 fJLoTyj4x3IQTKyzrsTde4Bb7SoVAh4EA+a0gs6Vtxk03WLA9y67oQMJTvHafdog
 iDfwQHaGh75BrMR68KuinK2hZcVUP5vBnFZ4JhIc4ciTmz/jkBxNex5ak2alCZXg
 DU6gdwjq3Vb8CDymja62rtl4IzNCfBsP9EbRJYTZ4MlueKt3Z5IwX6HgrtwPwuQs
 iZL48MWjWyOOhjYJCX6Og0uePYL+0UIoBwYK9uiISqw7TEKpdzH9d/6Umbdj1rre
 lrdfYJeDa4zNzuwWrW7eTYw3d30F5+tUbjF+ipS6Jcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2vW9NF
 wlxBO5UbfO4C0PUUfkDI6QoaKFyXfybxrHMtM=; b=WS05qf2Nc+zZmii/gGfdDe
 a10K0cLSN18nE3CNAvx24tRhv6GV003BwnZ4O8/wFg7wtEL0cCDR6NkwQDQv4h80
 dWN1yuZpHe1Sxa7ZfYdqt4+7I/3x5//BL5X1PJjYlRDCXT8WcSzjzqqcdj16yxHp
 AFBlMWq3zzQs9YDhpCJtm84QpX7ImIpfKvgSazoTNYDABlVdYT2PVU9AZwGsk3hf
 GQVM+T32PbqkRklxeGXUyB1J/toHaEAj2dpG3WvfKWVgxmzi5pgyrbiHf7k03Lvi
 uQPi+uLqoSV9JkiReq9pX6fqfGH3ieqnKIyocA1UMSNfhaqxxAet/6ASz/sOK9gA
 ==
X-ME-Sender: <xms:_ntIYeU2FnXaTFKBnkqQO014pJhd3rUQ8G83dIQZEpAJraQdey8bww>
 <xme:_ntIYak52Uj3Izgx9ekVh99GXhsY2ehHYrmFswX2dCdgzBIZmNVN7OoqbbVR0Au-Q
 GbxNcph9Okn15K5xIc>
X-ME-Received: <xmr:_ntIYSa7d9seLMYY2ayZj8mt9v_UmCyaJuZ6ds3-pNcsy5UFwhwK44c6TyLr4nMIFnzrBSMyO47YgzDvdxpiSJ8R1WGWshz1bzBh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgeffteeutdduhfejffetueekkefhjeejudetheejffeuudevjedtteekfeef
 vdeinecuffhomhgrihhnpehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdpiigvkh
 hjuhhrrdhnvghtpdhgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhophdrohhrghen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_ntIYVU_CsSEe8eC27zfxMIVarh4p47VdNERoik2_qItdQhe4LfHVA>
 <xmx:_ntIYYkZ4wEE3juPWZ33qSdmMjS2LRlGSCghwvbUek2etAnnJ0iVXw>
 <xmx:_ntIYaeR1a9eHgLDs-PBImtZkkU88UWLA_yIcSeN-Ao1KMJ36-V9-w>
 <xmx:_3tIYSjlyftjf4Y8NrwIxEoA6qP4GyAMYCJZ-jCGUIAQFa5q2WHxWA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 08:18:06 -0400 (EDT)
Date: Mon, 20 Sep 2021 14:18:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Stapelberg <michael@stapelberg.ch>
Cc: dri-devel@lists.freedesktop.org, torvalds@linux-foundation.org,
 felix.kuehling@amd.com, Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
Message-ID: <20210920121805.2ffgjsz2wmkhkf36@gilmour>
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <20210920085531.jd4r2kvva6jxyzd2@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3tjqxtqp7dbrim5h"
Content-Disposition: inline
In-Reply-To: <20210920085531.jd4r2kvva6jxyzd2@gilmour>
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


--3tjqxtqp7dbrim5h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 10:55:31AM +0200, Maxime Ripard wrote:
> Hi,
>=20
> On Sat, Sep 18, 2021 at 11:18:33AM +0200, Michael Stapelberg wrote:
> > torvalds at linux-foundation.org (Linus Torvalds) writes:
> > > Did I fix it up correctly? Who knows. The code makes more sense to me
> > > now and seems valid. But I really *really* want to stress how locking
> > > is important.
> >=20
> > As far as I can tell, this merge conflict resolution made my Raspberry
> > Pi 3 hang on boot. You can find the full serial console output at:
> >=20
> > https://t.zekjur.net/linux-5.14-raspberry-pi-3-hang-vc4.txt
> >=20
> > The last few messages are from vc4, then the boot hangs.
> >=20
> > Using git-bisect, I tracked this down to
> > https://github.com/torvalds/linux/commit/e058a84bfddc42ba356a2316f2cf11=
41974625c9,
> > which is the merge you=E2=80=99re talking about here, AFAICT.
> >=20
> > I also tried the git://anongit.freedesktop.org/drm/drm, and that tree
> > boots as expected, suggesting that the problem really is with the
> > additional changes.
> >=20
> > The code seems to work on my Raspberry Pi 4, just not on the Raspberry
> > Pi 3. Any ideas why that might be, and how to fix it?
>=20
> I assume you run your Pi without anything connected on HDMI, and without
> hdmi_force_hotplug in your config.txt?
>=20
> If so, can you test that branch, and let me know if it works for you
> https://github.com/mripard/linux/tree/rpi/bug-fixes

This breaks every one else, unfortunately. I'll try to come up with somethi=
ng.

Maxime

--3tjqxtqp7dbrim5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUh7/QAKCRDj7w1vZxhR
xW4SAP4m8Xf1oPrynxXCqWU7Hn6YNG6OhY/c4QIwR3orMg3c6QEAzsf9yU8N0GDj
IzMH8oZXcaYw2GjzdDzoTbnblJmJNAI=
=fG3S
-----END PGP SIGNATURE-----

--3tjqxtqp7dbrim5h--
