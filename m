Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C628E5A4FE9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD18A10F384;
	Mon, 29 Aug 2022 15:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C6110F384
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:11:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9217B3200910;
 Mon, 29 Aug 2022 11:11:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 11:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661785905; x=1661872305; bh=6czT/Mr/tB
 NII304BwOJWEFTmduamBRB/vYIYcaFWLM=; b=qapDGo5tcLVEKwppV3GTP6EJnZ
 gHmNPPR7sQ1DR35PRGuSnxkoYc3bv+j1b+ie4fbxwRQmf7IongiXEgf23B9k2q6Y
 SbvMaSyjOuLwujmuWugu4bZQ7AAHZRkMPm7Zp1GUYwc1FK9fzhcwz8gt18pzSPia
 IYFweSWcONYHRAZ1vaxHPIWgsbnV20rx89rSt+7vTFMY1lMt13s2nHJVQZ/77AZ4
 wavzxFURF0C/MgxM5y4ewzgVjKruwf6KYR4o5b+Izc7tmQrNapJt+3cg+Fs9mJFR
 8vhfuogPeTckHcXRwz+cJtdSN7oPiQlUdGTuLp3MWBD54jG3pY/hmEo18vFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661785905; x=1661872305; bh=6czT/Mr/tBNII304BwOJWEFTmdua
 mBRB/vYIYcaFWLM=; b=rvGLYeTjHIwCfhZSdGXvYnzOBJZXciZk0i9i2lc4xLQl
 OMQxGc1kZrb7PQ7zyvdyRlaRdn/qpS8cZhFuGlSR7SW8FgTyW7gfzjWJsqcGf65v
 asZmgcxybeKVE1SJ9fqZoxl7BDCIi94NfW2TOz8pNL3jg/OMJ6nCsHIPx+ZAsTEG
 u0LzdJzuecFinO/cOX5Zau1XravGpjlCNVsKm46XHBvEaAaDcaPOOT6g0AYfTfk0
 PZF5ZevXkl15rjUFeDFKxEEm9GcuWGc1MXoV12ed4Zm9rhhApbr0O/N9+Sm8s0BE
 gntFDDxbMbh2ZTXErW5y4Uuo5DfY/XVBIDl5ceFJ9w==
X-ME-Sender: <xms:MNcMY-oRFbsI2adoHwD29LDYENeXQqfHithXrfilhcnd_nE83tjZgw>
 <xme:MNcMY8r4vk1gfZit61cCwxkmWeYshRDp5drYvaODatPBAdbO5G_tzg4-ycRT8bImu
 QwPpgly5xtX9UufdY0>
X-ME-Received: <xmr:MNcMYzPCbSuPplAsvs9r5M1MNud3sDnXWtOpDC6jGqhKYb13RMX4UyQ6qgH5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:MNcMY97tHKDVtpRPU9oyDXhNuUeIOfh7tsX0P_preM8t3zTTvbO2cg>
 <xmx:MNcMY95_8jKcnlfyBoBgTZ9Rl_waMmQcJ7L2J6tH2U3lwNiUoRM4dQ>
 <xmx:MNcMY9iBsHUlxvSd20CfSbC6e0vp2ulQ9PNonVPVvXfQyjZCU1162Q>
 <xmx:MdcMY8JYAaBKq3ThYEoUTyiL9btvPk3zcJWW88Afsv0EDEVwrZKiPQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 11:11:43 -0400 (EDT)
Date: Mon, 29 Aug 2022 17:11:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 0/7] drm/vc4: Fix the core clock behaviour
Message-ID: <20220829151141.jomryjqvn7i7a3jr@houat>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dmvoqxtqdjvru6cj"
Content-Disposition: inline
In-Reply-To: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Emma Anholt <emma@anholt.net>,
 Scott Branden <sbranden@broadcom.com>, David Airlie <airlied@linux.ie>,
 Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dmvoqxtqdjvru6cj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen, Mike,

On Mon, Aug 15, 2022 at 05:31:22PM +0200, Maxime Ripard wrote:
> Those patches used to be part of a larger clock fixes series:
> https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cerno.t=
ech/
>=20
> However, that series doesn't seem to be getting anywhere, so I've split o=
ut
> these patches that fix a regression that has been there since 5.18 and th=
at
> prevents the 4k output from working on the RaspberryPi4.
>=20
> Hopefully, we will be able to merge those patches through the DRM tree to=
 avoid
> any further disruption.

I've ping'd Stephen privately on IRC multiple times, and it's basically
a resend of the previous clock series linked above that has been around
since almost a month and a half.

Can you Ack the first three patches so we can merge those patches
through the DRM tree and close this regression?

Maxime

--dmvoqxtqdjvru6cj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwzXLQAKCRDj7w1vZxhR
xcvRAQC49KThyWL6K2eQpUaeK1sR8DbrsEuq4KorK0kwbmehxQEAtHKGmyKmHqVH
spWXuwujJHmnrDGzoeUfncXXu6ybtwk=
=aWzc
-----END PGP SIGNATURE-----

--dmvoqxtqdjvru6cj--
