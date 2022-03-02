Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246F4CA1A4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA94010F32B;
	Wed,  2 Mar 2022 10:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EFD10F32B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:02:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3EB8C5C00B9;
 Wed,  2 Mar 2022 05:02:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 02 Mar 2022 05:02:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=QtKqkW/kZXmhsuKsm2YypGF5T7gpe9xcJbRTXN
 txCkI=; b=c6knt2d9ERSXAltqJdSVvidYoT/GipzgBj3iuDZLDPX4C6FFdUFNi9
 7hyqgCCQCkyLgJqKijDmOin0mWtnZyfR1x3qjaUBlQjMpViyd1vhQpj07/Tu0BEA
 C/Q9jCsovmkSTjPQ5L3uO2zqlUNfgwSXNW7lp7IFy6aufqHEwEqv4SCQGK6nuhCx
 C1obOqMrHAaijtie2BLcpSl8R4D1zAPW5WotJBfT6wug9uW6MezrHcxIRQgyHctn
 bNVNst0vyF3cw7axOuyzNE0nRd3orOh4LRGlClG46/EsXKu5T1xAhZshUPzn++KP
 Eb3VyHNOjAUGwKSC6weCwL1v8K9O4Uzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QtKqkW/kZXmhsuKsm
 2YypGF5T7gpe9xcJbRTXNtxCkI=; b=bZLhDHh8N3yb1PX7Nspb3gXC3zOkx2akK
 pu1lgtGJ5kn0mDAdgJrTbvHwCg/WCx/YVWDQnwXZBDkPXDcLvNkYzio/78ppcn3H
 7/KL9RtD20iSjVQ9uGRLfjK+IiAYQSouvtEKVq/+pYd8qhEzVdayq8CPMeJROXNH
 ggCETVavys6WvcUwzQFP2/9/bMl9s/VBXp3kJlItMaOOAEWPNL9AvJh2HgcGcRmb
 LsGKeDmYOb+7pFLb82q+KY9JhJMwgwNQ3ULpwOBwHeSceOIfqeNgBv4Y7M0EjLg9
 +pHVYQds5A0rgnAZh0uywpGlA/TIRcYMKbHIVuACowBhyX1QwnpCA==
X-ME-Sender: <xms:q0AfYtva4SRqrtUm5_WAm5pkbKi1GaSdOjAeNFF_dbT23ssrydNTjg>
 <xme:q0AfYmcNpZLeDqKbkz9JROyXjYux-rZSWOjGk92ui9cIzxXkIWKtRROwsXPtPHErR
 HiaXhYyO1ZmnguBukk>
X-ME-Received: <xmr:q0AfYgyXpV4C77IT9zbXesgm74BuBf7E915ZGrCmcFXBOBmEUp2x36cVA1A7sO6EPzmlBvo-5gY5Aj_FyYY8oX4ECUX-yY2xtIqJ-98>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q0AfYkOEKf4Q_LUU9PiRnOD-2Tqs77GcjM_8TbbIYmIe1JPgns4Zug>
 <xmx:q0AfYt9GicghB6bZ7UNl4ThQkMoc4Va3Srd5nwJRSpTKzIKtJgJWEQ>
 <xmx:q0AfYkUjmvDdJ3pt77ZyDtbR609QGd6STUfu9G2tlLhfFoT-JYWXpQ>
 <xmx:q0AfYpYYDitwWTv5AzsY3GwVAxridemF9z90nOdYHXoYR6vt7EHR7w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:02:18 -0500 (EST)
Date: Wed, 2 Mar 2022 11:02:17 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 05/12] drm: bridge: icn6211: Add generic DSI-to-DPI
 PLL configuration
Message-ID: <20220302100217.ceqpp5jgmqtkboq6@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-6-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="caxsjqthnai6v34f"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-6-marex@denx.de>
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


--caxsjqthnai6v34f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:23AM +0100, Marek Vasut wrote:
> The chip contains fractional PLL, however the driver currently hard-codes
> one specific PLL setting. Implement generic PLL parameter calculation cod=
e,
> so any DPI panel with arbitrary pixel clock can be attached to this bridg=
e.
>=20
> The datasheet for this bridge is not available, the PLL behavior has been
> inferred from [1] and [2] and by analyzing the DPI pixel clock with scope.
> The PLL limits might be wrong, but at least the calculated values match a=
ll
> the example code available. This is better than one hard-coded pixel clock
> value anyway.
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

--caxsjqthnai6v34f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9AqQAKCRDj7w1vZxhR
xUycAQCYmU+s5sDLhQSg4Z2u7dcBd3CreQtmW33j08DUl75AzwD+M8xT1P8pxn3A
2azznhp68h1zkk1ppRpBOh0pkpk9gQ8=
=UxyS
-----END PGP SIGNATURE-----

--caxsjqthnai6v34f--
