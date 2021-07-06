Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8323BC879
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27EB89DA9;
	Tue,  6 Jul 2021 09:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE85089DA9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:25:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id F3AE2580643;
 Tue,  6 Jul 2021 05:25:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Jul 2021 05:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=RYFK3uCIujEv/Omrcqdc0v+UNeD
 +JKOwGd/0E/VyQU0=; b=oYQ67i1GUdsIuy+ixvHZuCFmIQgsKX1uYJMW5bYOmVx
 pa40wfpOy+Ramx6TdveFQ4aV5+baLZack23w5Tb/+BV3DOU3U9oEoKKaQNj+czf6
 zeDTQeIWgDzNfcd7jNKpNf0T7BHcvijCHgPTC3+l7Bhaq//uaDohx/ZyhpMpAu+T
 WsZjTYZq+zf4GOLKjdVa5NOEGAOHjeG/hHnOAxHeEfTRpGLe+OUeSNPutsfh6kUT
 DJyQXU2a6EqHSOk9GgeVeaahxng7FeAZjr8onY8YqQdKl0St7MZ0udBfqQPAi0oj
 u6RshDsmmCIN3OelwrhFA2dzd3hsJkW/MINkShBqEmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RYFK3u
 CIujEv/Omrcqdc0v+UNeD+JKOwGd/0E/VyQU0=; b=pI3t0Dhy8ZLRdX1SOnf4vu
 HQvBZGHxELLTWsdIc1rTblVBAeS2d/pZ5nTQXzefMkRXjzprqg8+X0JablzhU79/
 PEt0MZL6giANwMURDhnYL9xNWATUi6Rk9nHziP8UftMiFzgxRhnA+YbsiCuSFxs7
 G7z7gjH5R+PLKehi9jwl+uU4agNOkYM0zobwTs3SH29AbPnvmK+ywAbiiZINYeqa
 3EJDvz7Xmb/yKvFXn3AG9TShWaqnO70Pm9ilc2u5fvpAfGYgarvibLJVCR5vCgqS
 3a5l8wvd6qME1BJ+JsdcuuOWvuZWw6gdgXZvX+7t1Fc9dEAZoq8HfZBRK4aEfRkA
 ==
X-ME-Sender: <xms:miHkYFoWiiST6153DgPO_6z2OY3GTbQoBqOZ8hWF6K0Nb5uNEXotdw>
 <xme:miHkYHp8zo12v2b_EFSf39UqzGaTvPH09M_jT8Xx5-GsvUHTR_zKnQ99xjniJTt6r
 Qc2YmHm8IuzCQQog6Y>
X-ME-Received: <xmr:miHkYCP0mGizCKwljLKbabZ3EearEw3K0toi3qFj9r2IwV2YRkckveH2XDZQI6haFXVf4erVJUf1oBu2DpaeO0D0jR1odpOkt5CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:miHkYA7RnqMLq-DA7SioIvXwWP1RzuRMOHSc4HuQBt_ztYzOUEMMYQ>
 <xmx:miHkYE5bnXMJfB0y7-toAM3yVaWhg8MhbVzNLiLmt172hWxVN80NYA>
 <xmx:miHkYIiQ1upEtMsJAi9oueDaR0XXbMPgVMGOYs-Wa2gl6R3FJD-UYw>
 <xmx:myHkYPIqduI6ijFReLDNLKKo-3CpTZApzS0vaPf8U2AmmKMtR5ENjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 05:25:45 -0400 (EDT)
Date: Tue, 6 Jul 2021 11:25:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: vc4: Fix pixel-wrap issue with DVP teardown
Message-ID: <20210706092543.ek2by2utlc75bhl5@gilmour>
References: <20210628130533.144617-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="syhha5txe3pcjom5"
Content-Disposition: inline
In-Reply-To: <20210628130533.144617-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--syhha5txe3pcjom5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 03:05:33PM +0200, Maxime Ripard wrote:
> From: Tim Gover <tim.gover@raspberrypi.com>
>=20
> Adjust the DVP enable/disable sequence to avoid a pixel getting stuck
> in an internal, non resettable FIFO within PixelValve when changing
> HDMI resolution.
>=20
> The blank pixels features of the DVP can prevent signals back to
> pixelvalve causing it to not clear the FIFO. Adjust the ordering
> and timing of operations to ensure the clear signal makes it through to
> pixelvalve.
>=20
> Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied

Maxime

--syhha5txe3pcjom5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYOQhlwAKCRDj7w1vZxhR
xao8AP9+kYodDYwWLfugATpx8VVY3PsupvsBakFbW5ld3V/tuAEAyfAh/FA8fkKm
feVkdag9TFy5cwdssnuGqcGo32zZ5wA=
=eRuZ
-----END PGP SIGNATURE-----

--syhha5txe3pcjom5--
