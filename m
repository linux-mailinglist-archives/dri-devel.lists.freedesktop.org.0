Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25614377F65
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 11:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEED36E446;
	Mon, 10 May 2021 09:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96A26E441;
 Mon, 10 May 2021 09:30:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 965255805E9;
 Mon, 10 May 2021 05:30:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 10 May 2021 05:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=o+RlLCP+uehcYeWcqJXYSH2E672
 srG6HjVhpuNJ5Otw=; b=LRzN7R2mzE2k+V6J5lq2UK+fX2nKfXfQYuOHuKoyzRu
 j+lbi1CqL+NP52cHv+CUoC6WJXpUlgycBjwv4T1j9a/DEjiG7Zyhv/1xpTUitXZL
 7Fd/mDNx/OUdkho08SBnpHWnVIiHROf+vqN/fyEFiSEDxbh1551GhyRMuFrp5cMd
 R69z7nR31SgF8D/SYPRt47jYKanW+Oo6pnXuIYvoWFyzmei4QJf02LXSZDvyhN8x
 tFXcVYkbq/9yygODAYeQE2tG1RbZFfzu+w4RTsg6w/rAX1FD0QAdBoT+3q34uO3X
 8ZEI4WPUzpLkycyYgQSbm1zm45+vtE0MK2Xu6lI/uyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=o+RlLC
 P+uehcYeWcqJXYSH2E672srG6HjVhpuNJ5Otw=; b=VX3bQ+xcj3x7+sHu1YxUks
 X8wNw+Fd01R1yQydbq78L0Cby+TIrelv5tOaVpJB/GWvl8D+sH8CgIaGNO69c5IY
 hEiQyv7Y2Jgds5qY1uFrSkOnaYEbYBOomlV5EOFkf4/PnX9Rs462yg/zF5Eu9QbD
 h35gXkLL9xRD38Zar2zQmtsODpC5f73Otu29yGjoiZfNH7VAztnGyVNb0Xl2Qsfd
 mBZFcJ8Cpo/Uq/1IUet2WiVQkTW8LqJQY+moL/C+vVhWEQf5kgbquj+p8tQ2+wl6
 Xb3HAqB+d4YF37Bop+OEKqzE+NZnmG6gffrLPiQ6QQEf2UWv1Z+z3gZkoqJ+yX0g
 ==
X-ME-Sender: <xms:Of2YYIpYtkrA164iwUrw7wmpDV4h9axrUp3B3CJweKypS-TZA0NZbQ>
 <xme:Of2YYOrKXTbfHrPgXqLYRwJGj6xl7MIhjhonGFzBdcfa6_pxjeDoxX_BgrbeBrv58
 VZBGEOrsS_alylWUFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegkedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Of2YYNP5VV3a0_SvB0NmN01X54WjaQrB9NnSc1yQ8lerLAQ02VA-RA>
 <xmx:Of2YYP5cdonqadux1oSBLKDrcufNnALJwsSgUalM6zcH4dGR8Q7IXw>
 <xmx:Of2YYH6QXRm5sYUZeJeRhxcWbGatnMHT3BFkpsgl982tUJuGTZbjjg>
 <xmx:PP2YYHpBFc5v6b-bl_ORTr9Vz8bRf0QCFHdpWHXnPOnKVzQnXk9B9Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 05:30:33 -0400 (EDT)
Date: Mon, 10 May 2021 11:30:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/5] drm/connector: Create a helper to attach the
 hdr_output_metadata property
Message-ID: <20210510093030.nqbfw7iayhmtnljg@gilmour>
References: <20210430094451.2145002-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="faciecejyji5pg3t"
Content-Disposition: inline
In-Reply-To: <20210430094451.2145002-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, amd-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Dom Cobley <dom@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--faciecejyji5pg3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 30, 2021 at 11:44:47AM +0200, Maxime Ripard wrote:
> All the drivers that implement HDR output call pretty much the same
> function to initialise the hdr_output_metadata property, and while the
> creation of that property is in a helper, every driver uses the same
> code to attach it.
>=20
> Provide a helper for it as well
>=20
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I pushed all 5 patches on friday

Maxime

--faciecejyji5pg3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYJj9NgAKCRDj7w1vZxhR
xTd/AP48Cj/pWzxu4xJM1P/Gl4C1i/fr6aJANTq2rOju3Y84FQD/Re0cYaNtLidN
8GBg64zcLh2z0n9CYT4Vc6km4PVungw=
=/OMZ
-----END PGP SIGNATURE-----

--faciecejyji5pg3t--
