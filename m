Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DDF52ECCC
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 15:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016AB10FF6D;
	Fri, 20 May 2022 13:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F3910FF6B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 13:01:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B375D32008FA;
 Fri, 20 May 2022 09:01:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 20 May 2022 09:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1653051676; x=1653138076; bh=7WG2msiVtl
 Di+HfG6ZYZnoIURv7z4Laekuafd5LUeFM=; b=HZgiGWiZepfWLw9P4fR5xvzsri
 6J8wFYdbAv6l3s9fVB70miLqTCaVR+IJs2DAoD5RERJ2eMJSLP0x9VHAeIAEvBA4
 CIMDYubvtNh33gMKJhDhx0tpQVpYEEuUNeUtR/VTkc6Sz/+jT+dB5FQ1Qr9JZ+Z5
 Sz9rUeEmAL4voylf+R+PUB1A6c5DeMNrgpj+PeSBCdM/hXdIPSEF65L6fm6fP1Jf
 qeVrL1fLiD0eqt7yMx8BE1SozLq0PcY9qp1430NU7tZQhzrAxqe3muNBRaoSu+o+
 hu0ibZpQBig26E1wCn5XO8ttT04NyhEB/KtO8gNecBAvul13Eamq+Ofkf7dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653051676; x=1653138076; bh=7WG2msiVtlDi+HfG6ZYZnoIURv7z
 4Laekuafd5LUeFM=; b=V3mgdQlmhISLu7ofKI+Fp9K+hItMSLNKAVSP75mIyinQ
 MYmIJ8J9J0LJ2ZCTFs8m35t5CVyvBy9dm9Zk0d/lZ5GLTeshrg6nqjvHKjS1xG1J
 X+xzPUn/y8QWCvoPB7vc2B87TOmtiprx0ye2dyusLC6pIsCDid7VkmUT9fg0Y726
 16rz9xCEa9M1JkV8BvE2q4EC/RKAbIy4DJHnldHqA0t1RyN7wd8NnK0HEuEzVzgL
 GY0zi/oMPJ48CFQSpVC3UOgQGFW3YqmUvSrihxGn5SnbqcPSkinr7VFvMaLUozyg
 WDwz3Q2TVpa5C1drmbrjQadUjhfa97pWixu4EGgrtw==
X-ME-Sender: <xms:GpGHYkhVEm8powS2dDSLYA66RCvrK6IZ8Tc2GdERfz3CUsq0iJ_j7A>
 <xme:GpGHYtAbwxluLBcMIGPQd-99tMKe11sz2g-uzRQ_DnNHX1WjV4lxhS4XSr6Sanq_A
 5WZ_bWLv-4ohj26jSc>
X-ME-Received: <xmr:GpGHYsEPMD6Ta-kEqEqqEZwRIDoTY2sMlzQI3sGIk4n0yOJFFP5GiPkdcNDPbOp4PWaGaDLjT8bDBs0hujnpp2Ila50Ff65pTAh0-P4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GpGHYlSHbdHN_5yF5SFoS5w2ricaPhgUWrRcvrhmkw7kgpQeoC_o_w>
 <xmx:GpGHYhzb62hIdFE1qt7WGqf4S0ByBBNZ3G-5PeGb1vbjU985GWC63A>
 <xmx:GpGHYj4P_lndFi2_xoUTAZBCnoX5m04g2MsnGsfLA_aUkHurayc7Bw>
 <xmx:HJGHYomcX6iqEZS5qTlw_7AF3oJ7tfHnGGSRT3CzqWZwk40rTY9ECA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 09:01:13 -0400 (EDT)
Date: Fri, 20 May 2022 15:01:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v4] drm/bridge: tc358767: Make sure Refclk clock are
 enabled
Message-ID: <20220520130111.eamzbs2qnyzwxipa@houat>
References: <20220520121543.11550-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vcfuae2g537qkqea"
Content-Disposition: inline
In-Reply-To: <20220520121543.11550-1-marex@denx.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, robert.foss@linaro.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vcfuae2g537qkqea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 02:15:43PM +0200, Marek Vasut wrote:
> The Refclk may be supplied by SoC clock output instead of crystal
> oscillator, make sure the clock are enabled before any other action
> is performed with the bridge chip, otherwise it may either fail to
> operate at all, or miss reset GPIO toggle.
>=20
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Fixes: 7caff0fc4296e ("drm/bridge: tc358767: Add DPI to eDP bridge driver=
")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--vcfuae2g537qkqea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYoeRFwAKCRDj7w1vZxhR
xdjkAQCCEhVoprjI8s9rFtk3y+aMYgbq6RhbJq1s2OIDp+N9aQD/VFZcBpGBfD8C
ratausZdlWJZBPbry2+nhks/oWNFBQ0=
=dozJ
-----END PGP SIGNATURE-----

--vcfuae2g537qkqea--
