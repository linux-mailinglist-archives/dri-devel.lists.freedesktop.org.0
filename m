Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C54CA1B1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9056010E5EF;
	Wed,  2 Mar 2022 10:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABF410E5EF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:04:23 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BA1775C0417;
 Wed,  2 Mar 2022 05:04:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 02 Mar 2022 05:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=6y6ZD7L379+Hpp0zad66Htn29bd+irRqd5Vz0B
 3wnD0=; b=h1C1yjVYFJ4GyFxOxjxd6WgnmzIMpA6ouela9aqRGijX+QK4IFPsaK
 XdR+Odch+ByvnGhkLNDkuSHXllJiKYDKSHs8ESiud7M4m4SWebusl0PjnGiVvQxb
 BGT62yOlirAsCcFZrjr1aowJSgEmfddWxcL8RArclIhgefLiCZgTQE+uPLqAzjOk
 TTb1GreK6DAS7+v00DuUjavLcvFQIdBOloAL1VEb3jLYdt64O3T/5a+hKQk9aZu9
 Er5dCnsc7nr6zIvjd1F3ekhr7FjZrdFUTcElone1v9ThWAV/tqZmo1W4TyF6HD7D
 UM95QELZ3B0BcJFLOoYxCTvzXkbpd1Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6y6ZD7L379+Hpp0za
 d66Htn29bd+irRqd5Vz0B3wnD0=; b=JBWmsLmTJK6ylouhMlEHAzxI3MvuXYk7m
 LCIB6wcyw3D97UhzZ4rT3DF9OxT4s+gCPy+8BzrR1e7CP82amftwVXfJVJh0RFbk
 zg/FEP+f9z1pEIPtlnmiSPuTflRk3cC60qwYysLHQjvgoEHinDaOB8n2e7vb5nVv
 KcOXzNb/d9y7QLT4nuiZgYLZfDUvoVS2zTrBogwv+BbZ/DFxvQC3CvrK6uqYfOhk
 CYL4VSjxdvtLoSiuxNcCWkYfVzhZchOfyZPbu3BVLaKXQ3wZRHIHizkLrBicHPYy
 rHW8VHskDrUbToMfqCBn14qsbE7SKbkcHRMy6mOrXMv630PnNH33w==
X-ME-Sender: <xms:JkEfYvk92P-hgIN7fweNozXHpIFmjD-EaDfSHLbRAY9H-xSDtqZIfw>
 <xme:JkEfYi01Qo5pMg9FeAITyCGc8MuotGy6XdZANJka_K1F3w2Q6BSJSPrwHSfsAJZKy
 BRwP2AuEOGp-ZpiQd0>
X-ME-Received: <xmr:JkEfYlpq0xCAn37Qq2-zrmxl3qmA47mWQLoPga3xONcU3FEHWc-1N5oI66vdrNmBwXX-t3NVpM5WCBcSG3zVJIl41k_KgqjP1Z-ZFCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JkEfYnmQbHcVY-qe6JGq5N-hTX6KKgJcd7_OZuFrygGTQM0lhw6jMA>
 <xmx:JkEfYt391bz9wPsqdFJ30gxUi8FL6uXJzVKQtqZrWdV1y_A8BQqTgw>
 <xmx:JkEfYmtB1NeOVaBbWvYqwzLYbmbmUjpcb3sagLcFpp8VA2y4-EveSg>
 <xmx:JkEfYoTqksrAdXXfqFyGYl318RYGgq8VI8GObltiR4V80_TyPBuYTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:04:22 -0500 (EST)
Date: Wed, 2 Mar 2022 11:04:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 07/12] drm: bridge: icn6211: Disable DPI color swap
Message-ID: <20220302100421.vhg5h2p7j5xr2ih3@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-8-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m546wz7kcqlmgty7"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-8-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m546wz7kcqlmgty7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:25AM +0100, Marek Vasut wrote:
> The chip is capable of swapping DPI RGB channels. The driver currently
> does not implement support for this functionality. Write the MIPI_PN_SWAP
> register to 0 to assure the color swap is disabled.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--m546wz7kcqlmgty7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9BJQAKCRDj7w1vZxhR
xQpxAP4s7e1dSW5/pceiMwxUU4ddMF7I7znn10KAhL+cDQjL7AD/bkSh+YgkT+G5
S2K7Z9+KnqPZ0tdAkajWUlPQ+qluMgQ=
=GxZ0
-----END PGP SIGNATURE-----

--m546wz7kcqlmgty7--
