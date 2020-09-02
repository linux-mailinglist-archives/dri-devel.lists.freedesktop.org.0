Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0C25BDC4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D376E1B6;
	Thu,  3 Sep 2020 08:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E760989850
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 13:52:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 679675DD;
 Wed,  2 Sep 2020 09:52:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Sep 2020 09:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=uYl4BPHJHJwCu+IH/QSOVmLDopG
 QR9pU8iqrt6n2QJ0=; b=XXkBZ0AU1gPtIpCT7UwgtStXIxC4oVjC5FcJH6iX5uu
 wU8wjbZRK+1vICtZ/tqPMGhwhPvsfFVbDVuin0kFLguFYqVV50GOYS1zHOhHen3i
 KeeHo1QhqbPDsysn7wll3hIotJ3Cd69FKxgIqtbZiAv8H7Jo/lo/wDHUs51Fhjl9
 Fxy9ABtJ1odVwjWjiKsdTFMRZSER7IySA/+KejSIreeCxel/DIYZJrl5wO1a1XjI
 wTEZSN5YjXCj98GWwBOo4QxYVOoU4rTGY5oHFSPX87u2PX5ER6llcTj63hVJ94Be
 79kH65Z/JoTSk1DYXlsSCpgWMBQVshsyTTo1SRScd2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uYl4BP
 HJHJwCu+IH/QSOVmLDopGQR9pU8iqrt6n2QJ0=; b=tWoJdaczodYmxy9J3bFBoX
 buLaM3YefbPsTm0YESK7pU2fH2O4d9bhnx1mMLYb1e1MGPjUJw7DmKqkOSn3vAaH
 cii0IYzDwoc2KYriGH/w0x0dFr+WoE6aqxDPL2QYIvF7Q/WVfWXoLhLsrrrsWxLn
 lr2YERIwgcuvlIt832jKJXsjfJx7w0lDm5b+6+nCr5UJNKSznDikAtCKmUL479i/
 fjkPOhVgHUdNr15aa//iCKtzrtFsRV7TfH4ysy0syrENwm/Y674NDOiM2pt2KOpX
 Avh4zd2A2sjHztEX+71YVf57YMP608BpfL4z0JIavPbzsDUbBut785e9GvY7HTYQ
 ==
X-ME-Sender: <xms:n6NPX_qTozjzfe7fC4apLu9gBl2-reHQmCuC-doz2DB5lGMOkSgSGw>
 <xme:n6NPX5q5BpOf_e2Ys3Ec66brJ63DJNPwSSkiJuqz4WccZWPmi824aRCXvQJL7t0rq
 LjXYDTPN53sumIMlp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n6NPX8O69UHTuexuOmoIizn2havGvGAJxVqtDwjneINQxnWDPV_KXg>
 <xmx:n6NPXy4jE2Y_PBTupPEGBJBijeDTFyEWOj9ThEqavfUXNml4oOyjcQ>
 <xmx:n6NPX-4SbTbPsnGqG7FfpQFxNJ0FpD68ZtoqHuh7YL63anamrGAenw>
 <xmx:oaNPX9RvhgC5IuuXK-6wp4pu4tPY8NNdvcBQt_Nnj2BubG8zLBazXVNhzPg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B013D328005E;
 Wed,  2 Sep 2020 09:52:31 -0400 (EDT)
Date: Wed, 2 Sep 2020 15:52:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v4 00/78] drm/vc4: Support BCM2711 Display Pipeline
Message-ID: <20200902135230.5hpvfjqsamot5zg6@gilmour.lan>
References: <CGME20200709070649epcas1p13664bacc66a0f73443bf4d3e8940f933@epcas1p1.samsung.com>
 <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <1a39aedf-b708-e490-6acb-9a07e1b73300@samsung.com>
 <20200902133220.avp6dhfv2fhpiyf3@gilmour.lan>
MIME-Version: 1.0
In-Reply-To: <20200902133220.avp6dhfv2fhpiyf3@gilmour.lan>
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0367542293=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0367542293==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hfgqy6buhvjnpemx"
Content-Disposition: inline


--hfgqy6buhvjnpemx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 03:32:20PM +0200, Maxime Ripard wrote:
> Hi Hoegeun
>=20
> On Fri, Aug 21, 2020 at 04:18:34PM +0900, Hoegeun Kwon wrote:
> > Hi Maxime,
> >=20
> > Thank you for your version 4 patch.
> > I tested all 78 patches based on the next-20200708.
> >=20
> >=20
> > Dual HDMI opearation does not work normally.
> > flip_done timed out occurs and doesn't work.
> > Could you check please it.
> >=20
> > [=A0 105.694541] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [CRTC:64:crtc-3] flip_done timed out
> > [=A0 115.934994] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [CONNECTOR:32:HDMI-A-1] flip_done timed out
> > [=A0 126.174545] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [PLANE:60:plane-3] flip_done timed out
>=20
> Thanks for testing and reporting this. I've been looking into it, and it
> seems that it's not just the dual output that's broken, but HDMI1
> entirely (so even a single display connected to HDMI1 doesn't work).
>=20
> Is it happening for you as well?

Nevermind, I had the DSI panel connected and it was interfering

Maxime


--hfgqy6buhvjnpemx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0+jngAKCRDj7w1vZxhR
xVSHAQCnCDlA/SJLCP5PetU7Iyf4P2mZvBCHHAz/RyMCctXhaAEA+AQnVnAQhqZZ
mmLYhcaotKt4KrJuuhWp61WNWd0RMwQ=
=1Ln2
-----END PGP SIGNATURE-----

--hfgqy6buhvjnpemx--

--===============0367542293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0367542293==--
