Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2252104A2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE376E829;
	Wed,  1 Jul 2020 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9406E44A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 06:51:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DC494AA7;
 Wed,  1 Jul 2020 02:51:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 01 Jul 2020 02:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=DMlwC4LDZdJp/AElsdSkN7QDFdA
 xaBzbT1BNfb3j+c0=; b=cxLxSk93t8J6dOd9wq+KFmXn34ZCBDSQqIKdR4Wb0yL
 AIKvHg2d9TLY1njfPXqdbyId8+oRdwWGKfYlvRU8Dw0zdDSBSFlEPRbpDAzvG+qk
 VcW+WwrBnCEfKDRG6Ne8GyvqEoUgV2SLIcNRN4xz5BgXqiDd4BxzbBZ1JMwIyRIJ
 DvjUrIW0pkXRlsMoU48b8x+gdMhxa74miehgDWW6He23mwJpdgtpSGcg+Wf97Jic
 I+4I2ifemhF/DdTiNw1mPrfqjlldNa2MpRBkhUS2ogAF16GbE5P5RKoMm0wTEB2P
 TMJa70yPIhhtd6WhKr7ImA8hISsQ9f8AK9WicAd24hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DMlwC4
 LDZdJp/AElsdSkN7QDFdAxaBzbT1BNfb3j+c0=; b=Thb2uVjhGDFYSOBdjBXJiP
 3u+y5J53+9pRuUxU/eNw+cZVANLrLEyXbpP1gi8c61D+J6U0U6742MUlUwl1a8Yz
 pi7i0OcwrDbjDuwyOrCRKOebG335obRy12b6DmZV0EDDpUAdYET1ml9y+23EAPLQ
 tHMmAA+1gIum1iRzIyuibLTJnpIbi4n+Dle/2ozZkrIKTRntq5DIIqMjkeuHcByr
 ZNH4kYqvUREJjZsm9Ddpbo556E6pwddXGBg1YcztLNbA5TCgVYlmzOLaPJ1K7ukW
 eTQI1ec7dQ/KUIEPFJn3mcRSnjHVR6LDrzNlCsQBOvm4SJCq6FhYcPrBCulynbQQ
 ==
X-ME-Sender: <xms:XDL8Xmq0aaZWCwKkaWJfKNzsiK-nqXWWAxS5A5o1psW4xi9xgacQow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtddugdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XDL8Xkopx1jOmA49yAwBC3rc-9VW7Yr8xqo03MtoZug9NgM462_4Og>
 <xmx:XDL8XrNofe-BCmqXUMGf01Hm3tgRMX_R-sUyFNUNQtzsRF5e7jEY2g>
 <xmx:XDL8Xl7SXahVf5qVwJPf1hroEw3NXNxK709Aw9haqlEyaFyCXqdOEA>
 <xmx:XzL8XlGFyaNxBpbCImJWUPj1CEyjT3kkOA4udqttLvAMOhQaU1a0ag>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1ABE7328005A;
 Wed,  1 Jul 2020 02:51:08 -0400 (EDT)
Date: Wed, 1 Jul 2020 08:51:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: Convert connectors to DT schema
Message-ID: <20200701065105.skz3ln54h3qo4div@gilmour.lan>
References: <20200630200216.1172566-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200630200216.1172566-1-robh@kernel.org>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0983961832=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0983961832==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g3kj2uw52dmun5h6"
Content-Disposition: inline


--g3kj2uw52dmun5h6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 02:02:16PM -0600, Rob Herring wrote:
> Convert the analog TV, DVI, HDMI, and VGA connector bindings to DT schema
> format.
>=20
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--g3kj2uw52dmun5h6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXvwyWQAKCRDj7w1vZxhR
xasDAP9r4tg1fgeE0OZMBPlT1tZ6mI4krecIcchC8sEDC0LnWwD/d6jfFt9QEnRZ
Ekag5CaO0kUl1bT5fgnQxuhWYFlaRg0=
=2psa
-----END PGP SIGNATURE-----

--g3kj2uw52dmun5h6--

--===============0983961832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0983961832==--
