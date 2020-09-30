Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2802A27FB52
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22176E873;
	Thu,  1 Oct 2020 08:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52CA6E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 12:08:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D2365C0191;
 Wed, 30 Sep 2020 08:08:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 30 Sep 2020 08:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Y17Usp4zsVcIqllYvXx2vn9IgwX
 CRfWXZlARyKTxdTo=; b=rouREQCpbTk2BpuVDtvYY5pH0N/uqQFRLSa6Yfy4PmU
 hCgi7cQNKNzSbD/DNKvH3LgUtUMdthn5mOhoNDbWzzGXzVpOpeioyori8CpEpeZ2
 LfF03esPzYqi7XFgvxnfQk7D64eR+JhlcWqzGnsSmL8zWmdkvxwKZv7JN4EjSc/y
 jJcWGONuQ7UWsDfZKQ85Gn00tyG6kKUa1p7+2vmkiTTEQWsR7hWzjqof5h1PkbEc
 iLnAc6jCovro95ljNkAxyMEYkYxt12wFgnjpu8mpRNpt/H9SRYKcHpXUlOnQEcqa
 tZrBFDgoku7W7MnBY+Cn5PH9xGg6ObAVP4WQtAL2hww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Y17Usp
 4zsVcIqllYvXx2vn9IgwXCRfWXZlARyKTxdTo=; b=vbOQyValQHPlWzy6tqCJJw
 zyw+FcW/utBzbCe0dIIT8Q5XKqMB90vUSbZLR/EwkhjMb9KOvKWz4UBaYB1W+Y85
 ePA8xNhcDTEGnuLDipGBrKa+430AfZP48KaAe9Mw+vEZ4+hrmgKyLMBoxMXhXgIY
 Ul2H54IWqugaSJdeIqn0ldQ0V5af1P+CdxymF5w7p2BeAFOO8ZTzEbZTOaye66WK
 ANk2Hol9/131v8azYx6BFbIOX6MdPMPS28FEW0sCeiZSRJaMKSFrpOXikYoxYxrU
 su77UYvCsCFeAxgfzx5eXziOiPQ9te5AzJf63S4B2ySCmHmK1j8shGcX+xMIWAEA
 ==
X-ME-Sender: <xms:RnV0X_cAuIcVCm5oorL8PTi5-wm2nyG865N2n1dfAWCRxYhZX9LtGg>
 <xme:RnV0X1Nv4HfaB0Xe3xXfeNl8aNS0LUjc-iArPlt7vbmo3fWTB_4y2tfW-gj-Fpc92
 GTZDGKxLpfsYPFzkWk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RnV0X4hQeEAbtqPP5tBsCsqoEXJ0s0Nwz9oDL6H_yKv2YitYekBUlQ>
 <xmx:RnV0Xw_m1_3MD0M7FBdsPdh2z6HfHGAE1A_W_kpyWb4I4DVJRaPjxw>
 <xmx:RnV0X7sytmHkXa5JarobDBP_IZu3Bvvz05PqjMY9wXmco-SXpmOfPA>
 <xmx:R3V0X0904LSjgimmDfFeu0QYmBRX6vTiO-2d_t6YbEUuDNJGCW11sA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 114913280063;
 Wed, 30 Sep 2020 08:08:37 -0400 (EDT)
Date: Wed, 30 Sep 2020 14:08:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH 1/2] drm/vc4: kms: Assign a FIFO to enabled CRTCs instead
 of active
Message-ID: <20200930120837.jowt5dijwa7pdb6a@gilmour.lan>
References: <CGME20200919084635epcas1p3b36b85b4445709cf3595fc62e659c1ae@epcas1p3.samsung.com>
 <20200918145918.101068-1-maxime@cerno.tech>
 <226dbb4a-e97a-f6b3-645e-785a20bbdacd@samsung.com>
MIME-Version: 1.0
In-Reply-To: <226dbb4a-e97a-f6b3-645e-785a20bbdacd@samsung.com>
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 =?utf-8?B?64KY7ISx6rWt?= <sungguk.na@samsung.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1881503552=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1881503552==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ug6ta5tvkq4rvquy"
Content-Disposition: inline


--ug6ta5tvkq4rvquy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 05:08:56PM +0900, Hoegeun Kwon wrote:
> Hi Maxime,
>=20
> On 9/18/20 11:59 PM, Maxime Ripard wrote:
> > The HVS has three FIFOs that can be assigned to a number of PixelValves
> > through a mux.
> >
> > However, changing that FIFO requires that we disable and then enable the
> > pixelvalve, so we want to assign FIFOs to all the enabled CRTCs, and not
> > just the active ones.
>=20
> Thanks for the patch.
>=20
> There is a problem when doing page flip.
> After connecting 2 HDMIs without hotplug and booting.(Same thing when
> using hotplug.)
>=20
> When executing page flip for each of HDMI 0 and 1 in modetest
> operation does not work normally. (crtc irq does not occur, so timeout=20
> occurs.)
> Sometimes both hdmi 0 or 1 work or not.
>=20
> LOGs:
> root:~> modetest -Mvc4 -s 32:1280x720 -v
> setting mode 1280x720-60Hz@XR24 on connectors 32, crtc 64
> failed to set gamma: Invalid argument
> freq: 60.24Hz
> freq: 60.00Hz
>=20
> root:~> modetest -Mvc4 -s 38:1280x720 -v
> setting mode 1280x720-60Hz@XR24 on connectors 38, crtc 69
> failed to set gamma: Invalid argument
> select timed out or error (ret 0)
> select timed out or error (ret 0)
>=20
> Could you please check it?

I'll look into it, thanks :)

Maxime

--ug6ta5tvkq4rvquy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3R1RQAKCRDj7w1vZxhR
xfIKAP0ZxKnpINZ5Kg3q04USDs9Vo9efen8Srisy8b8ZoBxv1gEAiL6lw6Jae2g5
tgTom4FUgrP++/1IjDfYje2WZl5wDQ8=
=/0Ob
-----END PGP SIGNATURE-----

--ug6ta5tvkq4rvquy--

--===============1881503552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1881503552==--
