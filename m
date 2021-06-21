Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179213AED12
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427EB6E1F7;
	Mon, 21 Jun 2021 16:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482716E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 16:05:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 544A3F56;
 Mon, 21 Jun 2021 12:05:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 21 Jun 2021 12:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=mk/4kwLPhTfsKcH2zkenuopbQbh
 op/13kYsslt3x4vY=; b=AYfr9ZOffNiNISOObHr0YS5YkkIoCZLQXa0/oHvnm3t
 GdAk10jZV2zCySg6d5zCXK7sW5i74C4XIPbRGFrXOu1i67Bm/qSRh+QZ1VYDW0in
 a28Lzgao/Tl/ESqZMOU+rUezuyK76qgqJwUywrWkAaacacNpXlgYO5wlS0c1EBfp
 WO/wh1lH19miMZOSpMAcPwh53fIajVSL9X+8IPXa1gICitinXNSNIfMDA+KAbaev
 4iQp6B+5PGG9ud2cg9szLxSu2S3NuuvLZQdAAj+fuNaCOLZQIyj62biLZf7HrPRK
 +oFTFuCd/94YqnYCncoZrT8fsRbCzbdlSCH7x5IK2Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mk/4kw
 LPhTfsKcH2zkenuopbQbhop/13kYsslt3x4vY=; b=b3oRSHWtUMSypuCY9rAQFU
 2G5xiwO+oOIod5C4P8s0MSHefZGm0z/zcAeCW//xxGrHyWb311hr14laj7uVAVuR
 gcmoXCNQuxSvUsEMLdMR1X/QaUjYingdPANd3LWxetROyOpq8Yhougya2md8TjGT
 gLQ2sLzQFPPTX6XGhTWTIdgagh8TxE6/VIhSV3ouXeGBmAy/ourFjgIC+E8oQRyb
 QEk3ON1+4GzAAirqEktUnKOwMHP6f4klWuJZ22T2C29FCekfcsTrxbQLGuUTPTHp
 TY/1lrZ29RSoxHx1P3RIj3a05mMaxLc7h6m9RqDs+Qce0Exe+KByEeMTnhEORjhw
 ==
X-ME-Sender: <xms:wLjQYLENw3sSIaErRayL_1j8tauSOWfaWMr9e73yDA1xSAomzu0Jzw>
 <xme:wLjQYIX2e1UTboczR6DJdBrVHqorjdYsFWZXwwhOF9781ut5GPMtSUTMLvgn7duiD
 HkU6Umgivt1FZX44Uk>
X-ME-Received: <xmr:wLjQYNLMP1UN5pW3RAkgu5IKnR7fVtB5wm-UrX4Piq-_vOFjiW_GOdwpRd5It9fucUssWVBhTpPWpZ65I8R6p1sIcUARX_uDzW3F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefledgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wLjQYJFNqtDGvgSUAvpYLk5PslNnmLgROrsmimtQN4bQui7nkcYLEQ>
 <xmx:wLjQYBURI1aTKJEixiG4X_PeupyV9vEmI3lqj2utRzSmdHOxpAC-kg>
 <xmx:wLjQYEPAiaSLZ9LDAEEX3aTA8gNIWJ6tyYoFIwOekyaegeOSz93aqw>
 <xmx:wbjQYMNpbFcH8uRIqzdBRzlrduslc94ugdGSNap40QkRrbGqGpslY5lO4JM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jun 2021 12:05:19 -0400 (EDT)
Date: Mon, 21 Jun 2021 18:05:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/vc4: dsi: Only register our component once a DSI
 device is attached
Message-ID: <20210621160517.5fptdj4tkbzgqn76@gilmour>
References: <20200707101912.571531-1-maxime@cerno.tech>
 <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3ksxvmnjsmsf76mt"
Content-Disposition: inline
In-Reply-To: <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3ksxvmnjsmsf76mt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Sun, Jun 20, 2021 at 04:44:33AM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> I'm testing this, and I'm afraid it causes an issue with all the
> I2C-controlled bridges. I'm focussing on the newly merged ti-sn65dsi83
> driver at the moment, but other are affected the same way.
>=20
> With this patch, the DSI component is only added when the DSI device is
> attached to the host with mipi_dsi_attach(). In the ti-sn65dsi83 driver,
> this happens in the bridge attach callback, which is called when the
> bridge is attached by a call to drm_bridge_attach() in vc4_dsi_bind().
> This creates a circular dependency, and the DRM/KMS device is never
> created.

We discussed it on IRC, but it makes more sense here.

The thing is, that patch is fixing a circular dependency we discussed
with Andrzej a year ago:

https://lore.kernel.org/dri-devel/20200630132711.ezywhvoiuv3swo57@gilmour.l=
an/

It seems like we have to choose between having the panels or bridges
working :/

Maxime

--3ksxvmnjsmsf76mt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNC4vQAKCRDj7w1vZxhR
xSLcAQDaSnT7X8iy3Cv8nH20JGeb14FgJH4/UPGtXb8fCwZc6AEAr6FM5zAXAEqf
xgklsDB05uespz3Ze/lYNgKOG6bY3Q4=
=1NSQ
-----END PGP SIGNATURE-----

--3ksxvmnjsmsf76mt--
