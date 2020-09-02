Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2015925BDC3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDBE6E1B4;
	Thu,  3 Sep 2020 08:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356B86E3F7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 13:32:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9C5C6E96;
 Wed,  2 Sep 2020 09:32:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Sep 2020 09:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=y4ddWAdtJRtlQaf00kaReh39twe
 7Zr1EjOVYFP+ScYo=; b=je3R8F/N9IrxQXtWq/Z22fFeLkYOOBe4P2Z/qkoUrZK
 1sUpau9WJpMNd5SPQEvrUDKuGIvk3vIgDX7TIxJG0GspwoQJuO/Dv9PLDVt3hGwh
 3/teGTHbzJJ7AFiM9wtVNcu1VcwllFhE7bls/1bWkArQEULRWThpM/++6v6aujpt
 WAg839Qe9+hUtDUSjgM+l6JutxHh9MinPPVJ6oDJKgFm9cttTXOPdSyW5Jw4OpWO
 dN4vv0A+Q53lWOGHbACp+SdNSOJe6oReyuA51dFerEusZIk4CqLKapWR573OmO8/
 WEcbasZZ8a7BmKp9RMnRiWi8z+jl7epKnt4od88MOpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y4ddWA
 dtJRtlQaf00kaReh39twe7Zr1EjOVYFP+ScYo=; b=lQbFkQ4H2MnmJI23oXWQ9P
 RX+NyCbMmiOt9zkN+aA4zt1pl/ghgzJvApoGpVFIG5ZF2SczjofRFPPUr0ESgSwl
 BWk7s70xOgfTS/oP0SnDCdkPMDYhQw77E8Cpp886hLO+d/aurmwv5rPgolFSj3QB
 5MWbPh/UAGZaZJDX/U5Hjcp8yy8R4s+yO19J4NvA1mqrkH0AMKhjpI3bNIpnUmga
 a1Wraq/nzWVm2lSELDck37SzFxGSscE/ES1/Ay8SI7/Lw8G/0AgTjq0ywlFyvzX1
 HDdDxH0mdvRVdOdcmOamzAWhNrGAiMbCdHWLrAWj6lpz4FUTf5mcySrL3KGl9hlQ
 ==
X-ME-Sender: <xms:5Z5PX8gKFSRpYuzEvSBaxN7XGSFBX2nRZODNr-E7PPSqDGoOySobtA>
 <xme:5Z5PX1Bj--xlWu-xQx01wtIrHRwr2kHBSdtmMQOoqrpJoUO1qrRT9856sqcV4hcs7
 REx95fmfIhka9S_iOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5Z5PX0GBY6dwnhdFyJPru3PMm3WkCz7dPtPnCTB0-39rYjKh4CFqPw>
 <xmx:5Z5PX9TaTXaseCkiyeUSKOqrIWnrxffQIq3kcMQkjPmgLqbv0vUDnA>
 <xmx:5Z5PX5xodCGa1NWCbBVuehMOSqBeA9tNGQ0OAhve471IBFjmC8HLmw>
 <xmx:555PX-JxpMUQeawDrYfvmh9UoqEsXNKKZvQvtrbFREkXg-k9HYRWewTXY8o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A56B23280060;
 Wed,  2 Sep 2020 09:32:21 -0400 (EDT)
Date: Wed, 2 Sep 2020 15:32:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v4 00/78] drm/vc4: Support BCM2711 Display Pipeline
Message-ID: <20200902133220.avp6dhfv2fhpiyf3@gilmour.lan>
References: <CGME20200709070649epcas1p13664bacc66a0f73443bf4d3e8940f933@epcas1p1.samsung.com>
 <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <1a39aedf-b708-e490-6acb-9a07e1b73300@samsung.com>
MIME-Version: 1.0
In-Reply-To: <1a39aedf-b708-e490-6acb-9a07e1b73300@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============0734506097=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0734506097==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ptnwrc5vhcz5nwzs"
Content-Disposition: inline


--ptnwrc5vhcz5nwzs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hoegeun

On Fri, Aug 21, 2020 at 04:18:34PM +0900, Hoegeun Kwon wrote:
> Hi Maxime,
>=20
> Thank you for your version 4 patch.
> I tested all 78 patches based on the next-20200708.
>=20
>=20
> Dual HDMI opearation does not work normally.
> flip_done timed out occurs and doesn't work.
> Could you check please it.
>=20
> [=A0 105.694541] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=20
> [CRTC:64:crtc-3] flip_done timed out
> [=A0 115.934994] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=20
> [CONNECTOR:32:HDMI-A-1] flip_done timed out
> [=A0 126.174545] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=20
> [PLANE:60:plane-3] flip_done timed out

Thanks for testing and reporting this. I've been looking into it, and it
seems that it's not just the dual output that's broken, but HDMI1
entirely (so even a single display connected to HDMI1 doesn't work).

Is it happening for you as well?

Maxime

--ptnwrc5vhcz5nwzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0+e5AAKCRDj7w1vZxhR
xR+5APoDUUTLzhy0qxhPFbilcNUaS2gepejJLqHbcQU3isBUBQEAzxjkL4IbaWNw
oW7yn9VBzDQ8y/JSlGuj5y3LEiaGzgs=
=L5e7
-----END PGP SIGNATURE-----

--ptnwrc5vhcz5nwzs--

--===============0734506097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0734506097==--
