Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B284CA1B2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6322410EC33;
	Wed,  2 Mar 2022 10:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7EB10EC33
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:04:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 55E6C5C040B;
 Wed,  2 Mar 2022 05:04:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 02 Mar 2022 05:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=DfINnAMmoEEs1Ohz9V4Cn+k2cqrcKwFZSDf+uG
 BB9dY=; b=JKB4L8Blo05dShRot8yBDtQNEzY+aodTwMIQD87PphO99WBfj9CrgK
 FXDGqUgIdPigOz2EiNjMS6uKDirAesbK9ys3jvGYXSkSbHJxulcUd7q2CxUlRKbi
 AQ2C3We7bbgmd/SZjlT13BsdH38GRZCukUAbBT3yb5PWS1cQkYkNLH+o/aww53ep
 QXSPU+QuMN5YaF7xB4STcpdGHHF/5NnVQ7XLBugleAm3Am9y6X+79CUy7sG+3651
 XXl3RuWHxrIqvjbBjM8LHjrc8/lz7HBUfnlw8gq2nnBgwlc3QS2ikPpwwSJJTGxO
 +l+AeYBlnTK7P27AoWVB2EMEDMgd51WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DfINnAMmoEEs1Ohz9
 V4Cn+k2cqrcKwFZSDf+uGBB9dY=; b=DXZUi7QlNX1kGCvXCJ9CqH2hhE0UIwBrV
 Txe5C9QTJlEY2VlwJeKFWcu+p6z6KoCPrV7nKXy2Z6ZF2u5zx2qRBPg10ZmAgdEA
 M/EAzpuvuhSA88wyd/iykPeeS34oFhtzV083AzeHGenUswwBXeNrKNW/kFT1gm7W
 OG5lPavf4t5JU//GI49VlaDncf5iDVw+wquKQYv5xcGq4/KFGEBZi6uZSDx18rwy
 CdUujJbW7S+BA+/aK8BJjwYqUDEmJKlZyWsch03DKQiVzA0ARVTguq9z/Qcs6M3R
 fFVXX4rAI+pwWQHil4KXRRu+s82e331mAIy3p7eWw2H6SLihXC+hQ==
X-ME-Sender: <xms:OUEfYobEwhMU52Pe3pwuyiSQEMMCSgvZMtiSSijIt9sd3rLADrCUIQ>
 <xme:OUEfYjYt_A2me44r-OejPYUD0v-XEleRZ5v1DoRnhZKxNzp0cSH6qpaVM-0oHCnPf
 jkZTKPMHJENilkExdU>
X-ME-Received: <xmr:OUEfYi8cJv4Hij-jI8Kau7vj4cNeoMHfRBk1I8-BZeNszjFuQaK157bxxGdVxGJtAvFvK5BR_qUuQbgP4Zw3paVjadf-DlL_ICXNbNM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OUEfYiqmw3UM6y6HU_3ps2FAFSXKsa0jz-HZKwdabcdL6D10psglhQ>
 <xmx:OUEfYjpAk8IcIo0lBxHUzpR1QqwtDRSC66CdfMmoEx-KdTk77D2GKA>
 <xmx:OUEfYgQRxSb7pG0OdcWpCrH12wtyRXdOGPQIlVurFyf3poE8khN1Dg>
 <xmx:OUEfYkkEfObD7Bcod1ijpeRO8YHKJMgq-lgHQygJJPRExN5GZ2isig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:04:40 -0500 (EST)
Date: Wed, 2 Mar 2022 11:04:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 08/12] drm: bridge: icn6211: Set SYS_CTRL_1 to value
 used in examples
Message-ID: <20220302100439.zrm4ta5dccqdoxrg@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-9-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7nyf73ydjzatbmae"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-9-marex@denx.de>
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


--7nyf73ydjzatbmae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:26AM +0100, Marek Vasut wrote:
> Both example code [1], [2] as well as one provided by custom panel vendor
> set register SYS_CTRL_1 to 0x88. What exactly does the value mean is unkn=
own
> due to unavailable datasheet. Align this register value with example code.
>=20
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gp=
u/drm/bridge/icn6211.c
> [2] https://github.com/tdjastrzebski/ICN6211-Configurator
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

--7nyf73ydjzatbmae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9BNwAKCRDj7w1vZxhR
xRnRAQD4EppSgW/zAFJUgkVecURBxY0AFFo9u07/O0FoCB849AEAp5Juh39trAT4
r6f0e5ZhRH88ZX/gtOBbofnL2VGO1AI=
=O9Qr
-----END PGP SIGNATURE-----

--7nyf73ydjzatbmae--
