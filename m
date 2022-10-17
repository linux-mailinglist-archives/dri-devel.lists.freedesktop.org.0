Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264496006D2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 08:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D7710E37A;
	Mon, 17 Oct 2022 06:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7DA10E37A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 06:49:37 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5247A3200657;
 Mon, 17 Oct 2022 02:49:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 17 Oct 2022 02:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665989371; x=1666075771; bh=tU2JJCuwZl
 +gjIPBkX8sE1GuAoVHZj5y6pY09ftVJgs=; b=QetRwSYytubNbWQND/z1cfmwsv
 /ohEpNx2ahlUopWJep07CTZIaO0H1he80THWWlEot2CaEoWdso+c4oy4fuw0aCa3
 Bn2r/56QdqdWIzl+9lmlToTOJbxfigY+kYDJYTcw3l+f1Sx9p7bhQF5P+uIGX+FQ
 1ZlmUAeXenMzubvqGhr3dKv7MSbmfkOT8xg2bs4T/foYA/J7QITWl5H9iSZ9Pyxe
 xrNXa82kviNaL8YN0AbWzwwx7sCSoFeEnVsBBeEtiw9kidYsRnElmyK3u/1uNJAE
 3BoBfOyvBbXkTzKk9WI3DowTKOYdoFWlVpzxUV1QZSIk48cEVTN5mcs514eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665989371; x=1666075771; bh=tU2JJCuwZl+gjIPBkX8sE1GuAoVH
 Zj5y6pY09ftVJgs=; b=jiOOb4UAC8duVrOPn0OTwstQJNizcoin+hLMcr1pyhqR
 4Macb0+JsmfPVv/XZVNmFOf6c5s8dZPyq4MyKXqqU8t3F5B5at2pBBaQ3HDOvciJ
 d3hM52IRm0Pw483a8E4zoJZYdMv13LYnWq918y0xjisGmpY+Wsg+RB/jHSJOutzx
 QN4lbudEqZ40x02Y6cWa4Wb7hzUXWOSFtr6kHE3PU+EWGu+290k6qqGcVEMxFhhK
 GlWddjn0qPh1/3Mw/8r+RMyb5Sw9hSmcNP9+IWVmEnlOnYLyUtdLNXCBwfOz9JkL
 qhzPAr/7Yr/gUnFsdiSgxndsiFcsvUOHkiLY/eOukA==
X-ME-Sender: <xms:-_pMY7Y92qnlozu8NUGnjDX2voR2QVjn48WOtUpqtWFN-xCFN-uRTw>
 <xme:-_pMY6bmG2VZ3VnrjngT5vxXUN1H-_1pvRvv9L2CRksK7ip9VXglnI80doOL6Ihjl
 W6N7hCD4Qv1LV-YQ3g>
X-ME-Received: <xmr:-_pMY9-wgqrvM3AIs7tCLzNjZQT7FMLX3pJFJJH6NZl3BDB0Jd67f2CJaQng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekkedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-_pMYxoVBbmV4VFPu5Xoa9oCqZ7OhqdvnYLq7QBiEvpcqX5bP0E3JA>
 <xmx:-_pMY2ocW5Qh6bZ7QgCYVZpv7t5BFVb1z7e08LxukOeByFjQS9-emQ>
 <xmx:-_pMY3Tx8KTB1YubXUqAKUpq5JihoxHXnNgw6nj9heiMIZerhBqJmA>
 <xmx:-_pMYxDcjWdxEQAY6L8H_47ElbeY-Vc42d__sdUw5AaBij_LwHWqMw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Oct 2022 02:49:30 -0400 (EDT)
Date: Mon, 17 Oct 2022 08:49:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Set default CLRSIPO count
Message-ID: <20221017064928.bchnn3wmzri42g33@houat>
References: <20221016003556.406441-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zyqtwk25nj27r54r"
Content-Disposition: inline
In-Reply-To: <20221016003556.406441-1-marex@denx.de>
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
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zyqtwk25nj27r54r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 16, 2022 at 02:35:56AM +0200, Marek Vasut wrote:
> The current CLRSIPO count is still marginal and does not work with high
> DSI clock rates in burst mode. Increase it further to allow the DSI link
> to work at up to 1Gbps lane speed. This returns the counts to defaults
> as provided by datasheet.
>=20
> Fixes: ea6490b02240b ("drm/bridge: tc358767: increase CLRSIPO count")
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--zyqtwk25nj27r54r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0z63wAKCRDj7w1vZxhR
xUyoAP4g6dGT8Ytk8EbNlvKpA2ffgEiGVz7TcSSDEK7wQoT42gEAgUQ+pzYbuiId
BU9Y3nazjRJuH2B4c9WklWK+EiQPGAc=
=/S5q
-----END PGP SIGNATURE-----

--zyqtwk25nj27r54r--
