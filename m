Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815DC6FDF8C
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7374610E4A5;
	Wed, 10 May 2023 14:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21AC10E04C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 14:04:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id F03755C02AE;
 Wed, 10 May 2023 10:04:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 May 2023 10:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1683727484; x=1683813884; bh=eM
 LG8cI+bk2suxzsIte63viAaoBZ73Ac/tl0ZA9OObU=; b=hSvY6jPSX+3ye8vFZW
 Z4Pwjtb9a28CKdwvDPXdLkAlhUy7mG2y9lmqIhYTXeZsW9TGpYUQ5D+LYArSHdc8
 aTvDTu6Zb6WLIHulUY8HY3XXauStHbRR4tkEaH9IGsKjHhb4+KtXdF6QOYEXBbYO
 CWgJR+lNatZ8xcs1R4csXAROHDNR181eyJWI9Swr/DVX4Bu7/Lgru1LsCgEpYgM5
 ZVFrlWjtXIK2TSdLXWNt5hQrwCWgwV9yQyvvTR/o6+RbTeBF4KFulclGupojh/k5
 x6T5mt1k1U6kmFVAo9RK9MLpHBTt5W/uArXecC7EF+plOf3V+H2FtbFN6FvxhUXp
 fRzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1683727484; x=1683813884; bh=eMLG8cI+bk2su
 xzsIte63viAaoBZ73Ac/tl0ZA9OObU=; b=GaYoJBmg1Kk2qKf+1zPY8YkW+tQH9
 XjDHFC6los5UT5lT2OaYwAMJU/aNHyA3cih1tTLuqS33U9j9/XRrk1oyqGi9OaeU
 jqdnO6eXyCWmfdB072dMSsGcfgoEWVqk/ZkZvJQLFoJAelIHmeacOCayNsIPB3LL
 JO0y11nibQnAgIatUNPDczwp1BND+8Depc3TZYih1It/CC+8bN5pjBLpUgJlmr25
 m4LFxFS7MBeyIOeiKwDMB2oWwJf6CvL8apgGVBKZ41XztoqX5NEvn9lIv3LOzmbC
 3G2hzEH22bxFBSCMirPV1+bjvZRplVU5CuiidSP1WjfK/fRd6gU4wh+AA==
X-ME-Sender: <xms:fKRbZGIOCd2YphH9oJ2G_VyXV98s1pT3JL1InYbEIp6t3SIXTBUdiQ>
 <xme:fKRbZOJHFcYp2dx_uz4I6aX1eoboETbrLY7Pf1_gmDnkrXqd4fdjGgPnqq1vPve_1
 uX97aeTctqZaPyWkP4>
X-ME-Received: <xmr:fKRbZGv_XK2k99aXUSB5qM8Te__3yk4tOvNpNY99W6L3_qQGXHd3TGb42RpKZEk_zivIq2wSsG7lhGI9RQ77mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegiedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fKRbZLZOmuN65ERe6NDNCP0p8RkoWX4FQEx3qjBB-fCQAIldxk8qpQ>
 <xmx:fKRbZNbLdiuK4K0WqJWJzVMIlJO0cIa1buefDfQFZMfc99d2tdaQ4w>
 <xmx:fKRbZHCq5TqplPYCWMYHZFloap1AbeZJAqDj4K0ki_PrCIPGCyxOog>
 <xmx:fKRbZLuqi11S7iwarJCHgRNgNoRK1qrZ3Nh-k7sM5cPewR4HTZzytg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 May 2023 10:04:43 -0400 (EDT)
Date: Wed, 10 May 2023 16:04:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: a64: force select PLL_MIPI in
 TCON0 mux
Message-ID: <nxecivh4r7x2ucefudcb3wm2hlpdbsqxf66jnqvyy46k6iurlh@ghtx4npggfv7>
References: <20230505052110.67514-1-me@crly.cz>
 <20230505052110.67514-2-me@crly.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dam5q5w65wzz6wwy"
Content-Disposition: inline
In-Reply-To: <20230505052110.67514-2-me@crly.cz>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Frank Oltmanns <frank@oltmanns.dev>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dam5q5w65wzz6wwy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2023 at 07:21:07AM +0200, Roman Beranek wrote:
> TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X),
> however MIPI DSI output only seems to work when PLL_MIPI is selected and
> thus the choice must be hardcoded in.
>=20
> Currently, this driver can't propagate rate change from N-K-M clocks
> (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> in setting of the TCON0 data clock rate, limiting the precision with
> which a target pixel clock can be matched.
>=20
> For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotclock
> can deviate up to 8% off target.
>=20
> Signed-off-by: Roman Beranek <me@crly.cz>

Acked-by: Maxime Ripard <maxime@cerno.tech>


--dam5q5w65wzz6wwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZFukegAKCRDj7w1vZxhR
xa9uAQCWrJGP22hp/Ff3pvC1XPdpu0BZ40Y2i+mt7ej81tWPHAEA4tuZhwmGDmpm
axxVKC6x9CTPwIa0iDAy0SVGc6KKYAE=
=yR0U
-----END PGP SIGNATURE-----

--dam5q5w65wzz6wwy--
