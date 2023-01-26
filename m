Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CEF67CAA5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586A610E150;
	Thu, 26 Jan 2023 12:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E7A10E150
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:12:32 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 43C895832A4;
 Thu, 26 Jan 2023 07:12:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 26 Jan 2023 07:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674735151; x=1674742351; bh=h+X9F9/Ov3
 IoqHzLlmAlnrB+n/1ONiXGP4XLtnNsEs0=; b=RaU6rHlVnmR2CkA2ZCRURML+2m
 ZGBoei4WU6RaehRFjBSb1MNGTH5cs3h3PMHBYaBOc60bU5rM4ibTYqmMp0RQ94CO
 Ly4Vy9+e+Aoks5S7VbirSvI6VQekNoka78VBbklummZQ4UbmggbXki0r+jNG4oMn
 4xuIOU9aBFVPyCqV84r7E4R503cliAF1K+5n/Dn8jBr9qeKnlXrvQb03unp6/0RD
 xMGIqHP74vzijeCt68FjOpdp4E/sG7f440oUtA32GBiEUYej3JcbEJVT6fycBoDX
 9kVykq8Z2Kyt0AjGJ7f5gEcEwZoOkA4uqj+eP+NtmTEhR2yuNxQgLAUurz7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674735151; x=1674742351; bh=h+X9F9/Ov3IoqHzLlmAlnrB+n/1O
 NiXGP4XLtnNsEs0=; b=OepO88OFz7am6UzIu+uLKplQPHEmKFoyeLtcozGpww7O
 qCBW55gMdLkU2USaER/65dBx1MNU+3KNw+0T80Fev0C6b/VK9lfuxyC5GC0BT1E2
 SIiTNYCzvoncOg4SpotgWSssVPxP7c3oajfw19oFnHADyN7YZz6PFHuZnlo2mNa1
 nYKaYf+elxDQspdO5HBd7w3fDGcVi7umcj0dfip12DGLzOPI8vFTzYmG2743cWbk
 26pmV4SylnrW6lMz6XV+Ik0fOWwgkFsATDVqkM9bW2cLX9soss1ufKF78HO+9VIZ
 P8wjPcE5Zz/UcE32k4aDzWSywWPKcD8gX1m6SBbkhA==
X-ME-Sender: <xms:LW7SYxvBEipxjqKRqHkqFoOp6UuV8K6SdgJZFz9DIm6rsfitJSoY-w>
 <xme:LW7SY6eWVHq5YN6hXCXaYL2bmupkFsj8N9ynb99Wum3_IZPWJqTigmmhUG7V0uh7t
 PUydpv0x2PMSF-TFao>
X-ME-Received: <xmr:LW7SY0yHssCE_h0ClVzcVpTILope-i0mLg_TiraZpaFKJn_ua0H8AQqHre4nMgbGKczzrS-dmuD0TAeiyJY33cO_34WFOatQzL9wZmYHiixOcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LW7SY4NPhVicQxU9rt06Uf0U4KJYIVQUYrtpZ-WoH4AHEqfYoAvgsQ>
 <xmx:LW7SYx9ROpl3gX3enIZEM0y-y-6FHsCmEx5BYD_SkVvEP0SBqP41Pw>
 <xmx:LW7SY4UAMc4YfeX4Wgls7CMsGT7K4ozLSTK1QRbEV4PNgzZBJu1MEA>
 <xmx:L27SYwA-J4c7cGshqKZSWzZAsplL3FKf6uyFbxQS1WFrGr0A4eZ3wQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 07:12:29 -0500 (EST)
Date: Thu, 26 Jan 2023 13:12:27 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
Message-ID: <20230126121227.qcnftqvgiz44egpg@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4plkw473wjs2mrvy"
Content-Disposition: inline
In-Reply-To: <20230123151212.269082-3-jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4plkw473wjs2mrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> Add devm OF helper to return the next DSI bridge in the chain.
>=20
> Unlike general bridge return helper devm_drm_of_get_bridge, this
> helper uses the dsi specific panel_or_bridge helper to find the
> next DSI device in the pipeline.
>=20
> Helper lookup a given child DSI node or a DT node's port and
> endpoint number, find the connected node and return either
> the associated struct drm_panel or drm_bridge device.

I'm not sure that using a device managed helper is the right choice
here. The bridge will stay longer than the backing device so it will
create a use-after-free. You should probably use a DRM-managed action
here instead.

Maxime

--4plkw473wjs2mrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9JuKwAKCRDj7w1vZxhR
xSymAQC9Iq3pCnbt2LojyWMd4OEfhmUAFJqWCxCseECQy70ryAD+LHI6RQQqM3gO
Ic/5QXBWP5sANjuX8q+Tjb7h4dQsXg8=
=eyo5
-----END PGP SIGNATURE-----

--4plkw473wjs2mrvy--
