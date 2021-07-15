Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF73C9ADA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382456E5AB;
	Thu, 15 Jul 2021 08:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799786E5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:50:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0DE652B0123A;
 Thu, 15 Jul 2021 04:50:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 15 Jul 2021 04:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=M62QmRJ7jfZ7a1XtGtHuOAWYYSW
 wR+kSOaB6+SmVLRQ=; b=uHQrz46SB4AlRrqZRmnIGrRuad2JA/Ocz6DDilfxtug
 QSghwY+JKkd70u+mFEnFLl4XoIgs0zKCzFO0CiRoV1PPG1XwNLFa3prM5FXSCtPY
 e1j+WtFLfXZ8dFknkJCilYNk/xAqFHtxQ+zry262vOMTwan/gJWWQMCUEhK3c9BA
 usVaUY4V9o8jo+OpXg4g20SLmCRJwYp1zvDYb69ewcSvxV8740TcCqjrQJvHiMzz
 GTCw3SUQRMyspP8t3E4Kcfn7/ApOhNDew/fUVuCjVSf+wwSyTEBqYdlpQ3PRvEQf
 HUYgc5IB3ZASuLtk248iHOiaO7hw/VfEyzkd5jP0m7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=M62QmR
 J7jfZ7a1XtGtHuOAWYYSWwR+kSOaB6+SmVLRQ=; b=YWcIxaWQeWZfhRrYjY0Je6
 gJhvJRMMfd+Ys3BSIljxs4630nSCijWYNfynMsDBEbNSUN5xFf1kD7wO8VPQiXg/
 kMu7XjczvRQ6omdd6569TxH67pWMblhAqbK5ShPbUAVED0eKiAacV+bm5m2zRaEd
 NMh+bnpf7hS8eUsCHHoBEZAuyVv7B4Y3yl0gPK1JrJBgPaUMWz3kQFElLOPAjrVv
 CCZ9wcj31tb09jhWf2fK2tuO+c6wWEtNZpkzRHFDvBBrDWiRCb3//19B4mwnQoYc
 Sl2VfqEFSEcaYh4m9S5ohOVNuRedWJyEu0WwQA9IY36rVI+xwoKr8lekJSVwVAWQ
 ==
X-ME-Sender: <xms:6_bvYNzOgMQfnPW4TBgwI3eJOJe9C_ZmmTC5Ad-TVGGeDel24l8XVQ>
 <xme:6_bvYNTXdycciScMO7Z1Mx6b8TiEjpZ3N8B_La_n8RG2CNeF-CPX_X2pSTlneo26H
 POmRUPoS_mrlb_mygo>
X-ME-Received: <xmr:6_bvYHW1v0AwjHsl_KXIoVxVAjiBvI7nw432qbYHH__HF4n70FpNdGfRDHzFnBRAKv33Q1TfT8TfLOorllrPqj1I9G4jZM8ignUW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6_bvYPjMZtH6Hi8ERaOcw5iXNB9vewotb1dg6bePbuSj-0mFOq0jUQ>
 <xmx:6_bvYPDZz8UUvJ1LAcHdUpJhhF01tQ4m6iDaS6z07yfGk-e7dvlJaA>
 <xmx:6_bvYIIHdIE33OV28QHTr2J7rLPZz61kTlu1dkAj8rZ5wPo5vGKWWg>
 <xmx:7fbvYHbx1pXnKOVPd_up3EXOKrTCHG22xhrcDXFKX2vZbKWIJjrQrZyuKeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jul 2021 04:50:51 -0400 (EDT)
Date: Thu, 15 Jul 2021 10:50:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 0/3] drm/vc4: hdmi: Interrupt fixes
Message-ID: <20210715085048.ij547jpeawmooqxh@gilmour>
References: <20210707095112.1469670-1-maxime@cerno.tech>
 <CAPY8ntD-fi1Zm5eDQd4JR9qOcwfQukkEbMQvYaOgdhOHcQMUDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ssgiwnlmwhlnlhsx"
Content-Disposition: inline
In-Reply-To: <CAPY8ntD-fi1Zm5eDQd4JR9qOcwfQukkEbMQvYaOgdhOHcQMUDw@mail.gmail.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Tim Gover <tim.gover@raspberrypi.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, bcm-kernel-feedback-list@broadcom.com,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ssgiwnlmwhlnlhsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 11:05:12AM +0100, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Wed, 7 Jul 2021 at 10:51, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > Those are three fixes for race conditions we currently have in the vc4 =
HDMI
> > driver with regard to the interrupts handling.
> >
> > The first two are fixing an issue where the handler will be removed by =
devm
> > after the resources it uses have been free'd already.
> >
> > The last one is there to deal with an interrupt coming in the window be=
tween
> > the end of the driver's bind and the  DRM device registration.
> >
> > Let me know what you think,
> > Maxime
>=20
> For the series
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied all three patches, thanks!
Maxime

--ssgiwnlmwhlnlhsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYO/26AAKCRDj7w1vZxhR
xfefAQCYoMbP4eIscMPpXfK079e68sQVNNEbdZX4NQ5951zZswEAgSU2CcYAw1M3
T9OBBpolpINn+DasnplcUfmCczAmlg8=
=8xff
-----END PGP SIGNATURE-----

--ssgiwnlmwhlnlhsx--
