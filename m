Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A1139B487
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1336F5C6;
	Fri,  4 Jun 2021 08:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36506F5C6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 08:01:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 865F5580754;
 Fri,  4 Jun 2021 04:01:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 04 Jun 2021 04:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=d6Op0QNDoeWd4gbKTHgliin4s0e
 PEYJfFD48xSnda+M=; b=5BmzMujvnzu7vqEXN0tttnu4QAdLVr1yXj3+d0ldS5O
 GY7v3bhzPDMFM7olBLBe+7tiEqL2WOOPTUggkS0G75dnoOf9aQpy1rZY96Mx+uRv
 Kwr5XpvZOTJLIYwgFf2CkhOjSOKZ5i+IuskH/G9vMm77stviuC1Cu7Xth+7sVkgr
 KqUZiQzQVR8SaIR19HBRhLDRol6EFfNvVuKXdkuVAytzQdyGqyPkBGmnHiPil/hJ
 QjgmD/Bl9cwv2kDgvHjJbyJ3srx9gMF3CVEAoB+mWCG5ugZAiOdLt4xss0rQfDMx
 bhJRONsKdxgmV7t9a6LQlaRmpFfqwrDEdAlquy2GLrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=d6Op0Q
 NDoeWd4gbKTHgliin4s0ePEYJfFD48xSnda+M=; b=i1NC1qJ3KvZPozfdKTxlRH
 7yaYqDGjZ27YwCBXiO6cZf7pga9SG32k2NqviIWcShHPWcCWXuMgYBUh05kXM63F
 IdRMmJyzrTrbq8Y3zAsrCTwQU2dgpYsxFIdXgBd4BjaGkP2WeBMWE9miOIOJHuHY
 XCS8uoO0UCOO6WmExtqMtY083/Gz5BteMv7vFLKfC1H4FxnbJVutGyfGZMZguDIy
 EqBOQxCJ9vg+yCkm87Co/GDAJyLTTgxNpKxAjUA/5Jiww0ZciRfmx7/LoociB03j
 AwZa7Kf7fL2/x2gYw8AZG46qcxS0mydseGqapLd6ekb7uccAR5d2l0n4ytLxADfg
 ==
X-ME-Sender: <xms:5d25YKYFIqYFe6OvYHoK7BA873Aui0742GrWd3XHA9hTamomzyn2_A>
 <xme:5d25YNanjb4IK_Wx2jQ7pz-InDS2HdFxM4Bi1svnG0mnhYW7Awl4QMLBo-hFC1yaD
 O1cWZaFR5iPiPlN5Hw>
X-ME-Received: <xmr:5d25YE8Sw6twg4s2EbZo5xvBbpBxk0XoUIjfWfKcC285Q-tisBe1Y-yvommtX-OiHIz8DVHqBnGtKtouAac5ARaA4A0TuY5v1E4X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5d25YMoxOQzHAB4JtTBWbFdeA18qrxbGXnwAGrk0bR9Q3CLPBkv15A>
 <xmx:5d25YFpzkeV6HcgtcyZ6CR_anY-jA_C6VNLTURY-RkkPuYuE1ogKWQ>
 <xmx:5d25YKSVb1CTJsec1KVzhYg3hbHrXtL9gm0M8PnOemO7NdCgPzH7Gg>
 <xmx:6N25YDhr3iBmRCemf5SU8tmj2H_4Cd-W1btgdOnxqPtPY53gJtbWlQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 04:01:41 -0400 (EDT)
Date: Fri, 4 Jun 2021 10:01:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Convert to gpiod
Message-ID: <20210604080139.sccm3fggd3jvkkpa@gilmour>
References: <20210524131852.263883-1-maxime@cerno.tech>
 <20210524131852.263883-2-maxime@cerno.tech>
 <CACRpkdbVyMBEAr0n1+d3KSwV5J3spgfW6US9vwz1=2f34Ep3dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2zwov2bq536bd3vs"
Content-Disposition: inline
In-Reply-To: <CACRpkdbVyMBEAr0n1+d3KSwV5J3spgfW6US9vwz1=2f34Ep3dQ@mail.gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2zwov2bq536bd3vs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus

On Fri, May 28, 2021 at 01:57:56AM +0200, Linus Walleij wrote:
> On Mon, May 24, 2021 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > The new gpiod interface takes care of parsing the GPIO flags and to
> > return the logical value when accessing an active-low GPIO, so switching
> > to it simplifies a lot the driver.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Thanks for fixing this!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Is it for both patches or just this one?

Thanks!
Maxime

--2zwov2bq536bd3vs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYLnd4wAKCRDj7w1vZxhR
xRGKAQCcy4GAjw4pSmbaho00DbxjemLaezjlyXEdRNf5h+1nOAD+ISGuPfebZZT4
AAkIR+R/nZaYXe8Lk5BXBW0b1lzLdQU=
=Zlwr
-----END PGP SIGNATURE-----

--2zwov2bq536bd3vs--
