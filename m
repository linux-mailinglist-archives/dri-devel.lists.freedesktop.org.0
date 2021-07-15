Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC93C9B01
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 11:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224296E5B4;
	Thu, 15 Jul 2021 09:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19B6E5B4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 09:09:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 529F62B01171;
 Thu, 15 Jul 2021 05:09:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 15 Jul 2021 05:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ScnZcDkeqgi021UbtkLgSOvzBFI
 mwJYFF65EbFt7ZYA=; b=O1jTplhyaASxc60iLclqKp5lYz8dIoTLFvKV1/ohUwB
 kJqY2jRRCJP+J6SeZQ0t/XbTy4Ygs0dw1PGZdiYTqIbCOkvs3pRg/m8AxRZ7vU7W
 I254ka2fYr52zeL+F5kORD++L+AF/R8ojjkbW4X2lX1KR6p/oAegVPtA+73GPzBr
 e2ev3FGwj9nKT3wfou65KMbMfywG9tpkhFT/k6SA/QRRoMojeMawILetitbjo9vX
 Y2QvZPQpk+WmbM5ASqGWb1kvh9BcKD9XVftab5N9Bsdm8LwqsYIwEeIS4bB4DMM7
 nhoLT947iiWuLcyJ2u5l2FpnZcQ8AbcbJ4zQk08NuzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ScnZcD
 keqgi021UbtkLgSOvzBFImwJYFF65EbFt7ZYA=; b=LRjtKGywStqnLNrFQ0JVIm
 XfRNF5jB/uiYbhK5BABUXivHG+irftoH/azEY328oP6xiC+EZtXYymlmov4w/lly
 6frmK7KIqkr7Dv3vACRNzvzuuyn8GNtLdwC4hIbg/AmPDK1rg3RepmrUK62Bc3TU
 SMaaS+TcWFqpXyTSy7IHXZqA2e81W3thGFj6LjM+kwq1TlBolUeGH8QlEEke9DGi
 YrNmUAsBd/n67nSfE4AJPpL8OyMwA7Iqvj/OVgMasij9cchvsm2CSswiA/fSPyyY
 xSOlEi+3Vq0n32ppQ+Sf0R7Uvp/iNQFbaiwnpLnHwreFWug6LUWyUn65HyixXkbQ
 ==
X-ME-Sender: <xms:OPvvYDGKdmCtwMyqGXPtlXtzPWz0-w58Tf4eKAYYe4rWzrw0N_hQEg>
 <xme:OPvvYAX5wr2-fYAwAx_mIYERVN1SU-By-WXSHRWDliVNas2mSWmhtmVmjTeD1_JLZ
 5C0uUct737NiJX7Tgc>
X-ME-Received: <xmr:OPvvYFLdutWS_ucGw1BCkc9qJ_ApPDUkQ8Rom1kNk-CE8gaSMdqN50nEVmyUROP6PZvmTw2U46_GyARK7dAhh8RVbGqcULomIzoK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OPvvYBFU40vVqURQ-vOXsSZLxqDf_o5uobtTj2VboXisnUE12R1cxw>
 <xmx:OPvvYJXVQQfz2OZgN7ro-CGxU0cdQGxcW3Gtxjic4BvbWEQ891YwAQ>
 <xmx:OPvvYMNqLtk8OY4TjyAnjQXSHG8UW6wzgjhTx613dStBbuYHdBR3XA>
 <xmx:OfvvYCP3TJOX3-cwDANDj11pgPe1EyCzKFdikMlt9sCEXr9pmDltZNzQZjs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jul 2021 05:09:11 -0400 (EDT)
Date: Thu, 15 Jul 2021 11:09:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vc4: hdmi: Remove drm_encoder->crtc usage
Message-ID: <20210715090910.5ttvydtcgdcuz7nb@gilmour>
References: <20210707141930.1811128-1-maxime@cerno.tech>
 <ef4c5e92-f564-402d-4224-6fc24c720cab@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ndycn3oocozy7tw"
Content-Disposition: inline
In-Reply-To: <ef4c5e92-f564-402d-4224-6fc24c720cab@suse.de>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2ndycn3oocozy7tw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 05:35:53PM +0200, Thomas Zimmermann wrote:
>=20
>=20
> Am 07.07.21 um 16:19 schrieb Maxime Ripard:
> > The drm_encoder crtc pointer isn't really fit for an atomic driver,
> > let's rely on the connector state instead.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied, thanks
Maxime

--2ndycn3oocozy7tw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYO/7NgAKCRDj7w1vZxhR
xRRyAQCNuYHZpGd2YiOCCslVAbCike84dB2dsJwURmmPLRe5VwD3VjnMrfoXfqcv
bR0rLX0gYx1QP2a4K+nSa7Dhk5nlAQ==
=+3ch
-----END PGP SIGNATURE-----

--2ndycn3oocozy7tw--
