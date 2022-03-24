Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC1A4E603C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 09:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BA310E93A;
	Thu, 24 Mar 2022 08:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11B810E93A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 08:18:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1F2663201DE8;
 Thu, 24 Mar 2022 04:18:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 24 Mar 2022 04:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=b6GhHis3jApfda+V/kkvAKnDf4OSbjz/21GAxn
 v88Sw=; b=uhsVhrKFY1a4bLO6URCWJxnXNoq/pNNLt9lEffQnFoIZkxbaSpIq1r
 WWTH85wBgSNiyDgO9v6YANa93ALL9EPs/N8sAQc48ZAzegJLccx6TdcBfaOWGBQ+
 gudsWW0SuaFwdf3JgG0b+gOOGctMy+JbDWMBzrugrpOwHmjAggprWc3O2OwGbKzD
 uCpoosTfUK0RhKoWzoAmfAEEFfRRBbNSj2Ubdw92DWSGhjF9Q5Ejd/3GA54uuKkV
 DWMxLd0SqgFmngwxmB4Olup7OzDB+U6wg1LNE1PMCZg7XAAz101anXNPsIgkQM+d
 RDH1bfBx/q8jjuV8RxFGX/nVPDpQU5KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=b6GhHis3jApfda+V/
 kkvAKnDf4OSbjz/21GAxnv88Sw=; b=Q7hN/zon+sa0tHflvzuwhatm3ndn3TBe2
 +WbBYA7eyhs352b+4KPOa67exnxnPvVJVfhj62PU4I/kXIEbD8xe8vtwAlBO24cV
 WQRds6EGeYnn6+CqRGomhMtkALwvfs0gkEkX6AQw9WxkOu5/mhjYvtCR0LGRNgUB
 sQibLODVO9IVzkAYqL5VwZ4bLnM3v0AGsQR7zcYmj5VewhIThuEYPLx3uq9P2Tm1
 pFblaUpiIUVbgMVpzWuSyyJBPQWTxXk3FjahnMG+Nuzt0yzVSAMzmNWhhn826ghk
 +Z/EbKTq4DHDYYd3cFp7iMXtULtZqaDxCrmzWX/Hph5H8lQrZDNfw==
X-ME-Sender: <xms:TSk8YhlZdxNYpUR3IwYZo8eXWpRwg5RiZMiUQ7CvfGwTN-SrbYWf7w>
 <xme:TSk8Ys2B35zz-FO4G7WbFgcrSy4C3jxrbsT8Wrj8c-Irm2yR_DjZj6_ELZgyCp2fl
 aMyUaLN9ClmaRejiaY>
X-ME-Received: <xmr:TSk8YnrKJAB9YdiH2D3EYOf8Lii3RaLas7gm5gHzCBU04poQyOPQ4syegmchMu4m5NMxr8k-QsqBTpjMJ7LZ7syneh3g0VIIhqnIRxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegkedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TSk8Yhk-79btzWZK4yTNFdaqB-D0a-lj233NMms5o2XYHHaTB2wBoQ>
 <xmx:TSk8Yv2q9568yP3iiOILIqexz-30_jt0cdJhmVckGLOFF4wnN3jOXQ>
 <xmx:TSk8Ygu4NbsxGqOA7EeDmvsLSNrqzh_1SxD7NrP9YfFDgUnrsODSqg>
 <xmx:Tik8Ym2iHuz2udE4i2fvihD_s_C81Fsl2Apq5r5O4rcM7RMecLqfeA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 04:18:21 -0400 (EDT)
Date: Thu, 24 Mar 2022 09:18:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <20220324081819.niz4pdqu3j7n2ivh@houat>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YjuFO45Gr1vmKxWG@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="levbpfevtgiw2mg7"
Content-Disposition: inline
In-Reply-To: <YjuFO45Gr1vmKxWG@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--levbpfevtgiw2mg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 10:38:19PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> (CC'ing Sakari)
>=20
> Thank you for the patch.
>=20
> On Wed, Mar 23, 2022 at 04:48:23PM +0100, Maxime Ripard wrote:
> > MIPI-DSI devices, if they are controlled through the bus itself, have to
> > be described as a child node of the controller they are attached to.
> >=20
> > Thus, there's no requirement on the controller having an OF-Graph output
> > port to model the data stream: it's assumed that it would go from the
> > parent to the child.
> >=20
> > However, some bridges controlled through the DSI bus still require an
> > input OF-Graph port, thus requiring a controller with an OF-Graph output
> > port. This prevents those bridges from being used with the controllers
> > that do not have one without any particular reason to.
> >=20
> > Let's drop that requirement.
>=20
> I'm sure this won't come as a surprise, I'm very much opposed to this
> change, for two reasons.
>=20
> First, ports are part of the hardware, even if they're not connected. It
> thus simplifies handling in drivers if they're always present.
>=20
> Then, and that's the most important reason, I think it's a mistake not
> to model the DSI data connection using OF graph unconditionally, even
> when the DSI sink device is also controlled through the DSI bus (using
> DCS) and is in that case a child of the DSI source device in the DT
> hierarchy.

That's the way we do for any other device though. You never addressed
that comment, but it's very much the same that occurs for i2c or spi
controllers and their device. They all get their data from the parent
bus. I don't see you advocate for using OF-Graph for those devices.

> The device tree describes a control hierarchy between devices. OF graph
> overlays on top of that a data transfer graph. The two are different
> concepts, and the fact that DSI can sometimes be used as a control bus
> doesn't change the concept. Using OF graph unconditionally to describe
> the data connections for DSI leads to less variation in the device tree
> structure, and thus less complexity in the implementation. We're
> suffering from the fact we haven't made it a requirement in the first
> place, which can't be fixed due to ABI breakage constraints, but let's
> not acknowledge it as a good idea.

Honestly, it doesn't matter one bit.

We have a huge discrepancy here today, and only a couple of bridges have
that arbitrary restriction. The situation you don't want to acknowledge
is the de-facto standard, by the generic binding and by what all the
bridges and panels are implementing. Even panel-simple-dsi is doing it.
So it's very much there already.

What I'm trying to address here is that some controllers that do
everything right can't be used because that restriction is completely
arbitrary and in opposition to the consensus. And they can't be used
*today*.

If we want to change that consensus, fine, but we should still have one.
Having some bridges enforcing custom rules for no reason is very much
unacceptable.

And changing that consensus won't happen overtime, we'll have to take
care of the backward compatibility, etc. So it won't fix the issue that
we can't use any bridge with any controller any time soon.

Maxime

--levbpfevtgiw2mg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjwpSgAKCRDj7w1vZxhR
xRF0AQDrhvsP4GkYXGTe9JP+dIwFnLgWhO3DqHnfcE2sg47wjwEA4p4g4fF/Yyo7
dDtndMYJVtqb6htoP4UmAY8CJ9XsSAw=
=w21h
-----END PGP SIGNATURE-----

--levbpfevtgiw2mg7--
