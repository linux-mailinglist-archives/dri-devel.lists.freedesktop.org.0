Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B124E6CEC53
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8245010E162;
	Wed, 29 Mar 2023 15:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9EC10E162
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:03:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C9C55582063;
 Wed, 29 Mar 2023 11:03:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Mar 2023 11:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680102219; x=1680109419; bh=K2
 0fsOhg+vLZkzgTF7tMB4jS0IqXYodIByC6uEoduaQ=; b=dcqVt1CftKkmEFlhA+
 aOiURFLLuXg9F3fCMb80o/A0C6pXoSTQ9EAi80tVrRlGItHiYi4fcOHXtqRcr4dA
 rsvr5aLS5spMJ/RBwjzF10usaznM3gM0ptdHwagUwajYxvW7NEe9BIFNnnLSrZWa
 nlpP78ehuzFNrjQv28Gnbk6E0Fg7omUkUbE19MM6URUF/2VKMdx5juf4lZCorG0D
 E60/lfaIIZ3C1NW/DxrZq15vZyhirjv9Qh5VnKxp4MKynITU/f8LvVLxS83Fg2TP
 5IHB+VzFHX+FvE6bdSjVdaYfa3CakBRhl+9CI0HkX7AIa37gmum+22WeutnlbBmf
 PUlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680102219; x=1680109419; bh=K20fsOhg+vLZk
 zgTF7tMB4jS0IqXYodIByC6uEoduaQ=; b=g1Uxe8rdB4qbec0xJ+fatyynl5wUs
 hI05spyEIsmVIZuVf7mTWJifwi7jxOo5M99CwQFSWSTRjoBkhQGXxVLWDdt8uoUI
 7qD+ByCOABSeNw/5KWFGwEAGWKXxTTyLHdKjQu6xKE+Bdcvc3oaklodCcRbmIsMh
 FqWk4vJRVX36d1b+MerwS9B0+D39D8Ande9HpMYcuDpoDmyG6VItWfawmxvdi8E5
 sPgka40+Q0T95d2hukuTp5in1pPM389WSzgub7TCyUNC4O+14yI+dGpDoqXYLRS8
 gHMCvmch8AViRblK/sZyBSiK6MTTP/OJKncn5LUcFubpcSlQvGQkqSweA==
X-ME-Sender: <xms:S1MkZBK2HGGs7qEpRQ7JQKxK1-Y_supwOiO5Sq4JAhDw8aO3Y1crRg>
 <xme:S1MkZNLNW-FCeehuAMp_LEfIT0H17tp1PXLuZPksVC9SAbmwry3IAclClbh6N45Z4
 xGMFxUaNfger-dsyiY>
X-ME-Received: <xmr:S1MkZJum-T-S-a1UFYqO2-fDEbVQ3KpBhxtzPd6ze_n1ecQdaHBcD91QQQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:S1MkZCaews5Wr_TMWSm1_01sHGtx_lRvkHnNQXxsFbFdEH-TJDtZMg>
 <xmx:S1MkZIY-P97PO3zqJtVt6z9gdUIOJ2dh8D04CFF0KKvh6Rh6zWbQNQ>
 <xmx:S1MkZGCfiMuYHOmACOAkXzUPgoPZnpZkph1ygdRvrcM3Kqb1wX4BPw>
 <xmx:S1MkZIM_scTgLi4bwdm01gw2xSenepub0hhSTSKwt42Te685av8duA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 11:03:38 -0400 (EDT)
Date: Wed, 29 Mar 2023 17:03:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v7 02/12] drm: bridge: panel: Implement
 drmm_of_dsi_get_bridge helper
Message-ID: <20230329150337.ua6qz7rvupk6vizl@penduick>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
 <20230329131615.1328366-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ljsqm2m3jhzjakbp"
Content-Disposition: inline
In-Reply-To: <20230329131615.1328366-3-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ljsqm2m3jhzjakbp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 06:46:08PM +0530, Jagan Teki wrote:
> Implement a DRM-managed action helper that returns the next DSI bridge
> in the chain.
>=20
> Unlike general bridge return helper drmm_of_get_bridge, this helper
> uses the dsi specific panel_or_bridge helper to find the next DSI
> device in the pipeline.
>=20
> Helper lookup a given downstream DSI device that has been added via
> child or OF-graph port or ports node.
>=20
> Upstream DSI looks for downstream devices using drm pointer, port and
> endpoint number. Downstream devices added via child node don't affect
> the port and endpoint number arguments.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

If you intend to use it with the sun4i driver, then don't. The sun4i
driver is barely using drm-managed resources, so chances are all its
resources will be freed by the time this action will run.

Maxime

--ljsqm2m3jhzjakbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCRTSQAKCRDj7w1vZxhR
xWkLAQDKdxnGogs9xO7ZMu/Rv+wkevLJj7FxIC5ShbdCE04h8gEAx1vP1JqLCeBi
rKCBc8nwgsdozelmB6QXQSsY/3wbNwQ=
=SDoE
-----END PGP SIGNATURE-----

--ljsqm2m3jhzjakbp--
