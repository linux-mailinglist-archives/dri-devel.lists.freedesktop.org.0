Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5217F6CEC4B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 16:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F1410E021;
	Wed, 29 Mar 2023 14:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028F010E021
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 14:59:44 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 89213582152;
 Wed, 29 Mar 2023 10:59:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 29 Mar 2023 10:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680101982; x=1680109182; bh=/R
 f1DBC2WMIYkr+Jb4z1OBHAGwhx+V0jxtj3s2JHCvw=; b=m1v7hQovafx4X39Fr1
 nAXXtqcTTowIyUnVN4Npm7RonqPcHBDhODQRLpuH2gHj69N6ftuzhHkkCvKN2OZg
 jRULbaAiru1V6PK3zTxxrkeh+JizuIYLLMR3DAIFgBJUav+1JXYKEX0LVnM+uIyE
 94Ooonr4P73Zt0WtdxRtEAF2YnCyTrhiJpDUPzceqx63EDSyeQyBuFqJ6u5/U4K2
 xzIyGBjFNoRUFaG9sN6NKvBAb5CONgWNxUv6ku0OHgW5VBeZ/RESlpLB5bl6OQDQ
 bYev7JdqmOZiZVDOdX7j5HJdzsMRfJTReE7p4+fEs7d6RHRXbPa4bm1X4INWr3g6
 19kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680101982; x=1680109182; bh=/Rf1DBC2WMIYk
 r+Jb4z1OBHAGwhx+V0jxtj3s2JHCvw=; b=kMHIWsO1SOZmGAa79IJB54hecQ6S/
 +U8TJbH+FRh9WPxducMnPcwyTfz/9LBdRWPrYCNsqU2J1ja64Zz9/qiMTJRTm0n0
 BXxvzgDeHtHWpwvmIJDCPqa/CjA8idpG3+fjDpkf0K56SsA+XU9hmJqMq64PmCAJ
 596JBWTw6gdZCUyPi2eS3BcZRowvbcECHTJk85MGPuwBfHkEVQmMpRrP74x6uIZ9
 JwnQZJzXP/XrSpGZ+USm093L/8+V9+NtiLIg/pC7e04bVJUYxpPuhkL/GUk4f/0i
 N742A6Ue88srdSRjTX4/JSSCcgjGmFgwJZs0+48iCedKcXdVgF+sSQWfA==
X-ME-Sender: <xms:XVIkZHgtT0gPuwRw9nXiS0Id8VF418hbhxy5k1UZnkwVrLdowgYHCw>
 <xme:XVIkZEBIJi-4V2rEE2AfrtisgUHFESdubCiSuRgNTIJ5RHm73PFSoJWUq-5T5ugCV
 nwPtGcVtLpyff6hc5E>
X-ME-Received: <xmr:XVIkZHGbloo5-4oO3kF5gujdkzOFhdNrLtU_fS18W1O2MWqAiUmpXYPkI18>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XVIkZEQh1-DjZir-ksDy4eB9T04PPUBf0nf1BCXisvYw-4hvPV9nSg>
 <xmx:XVIkZEwGcOLr28Q6yLFYj___AhuNzFDthXSGCHfhreS6NNLUwILz0g>
 <xmx:XVIkZK6SUUYOw1pkgsmL0C12TaUIVQhaUTtGHEJuRfdpcQOXKsHScw>
 <xmx:XlIkZBHupX7Y1xm-7sqTSjer9ypR2T-wBft2y2xjwLwdbGjUyQW9nA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 10:59:40 -0400 (EDT)
Date: Wed, 29 Mar 2023 16:59:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v7 12/12] drm: sun4: dsi: Convert to bridge driver
Message-ID: <20230329145939.7zcex4x2pipivuj4@penduick>
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <20230329131929.1328612-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6fhpyyv3p3yi6x2l"
Content-Disposition: inline
In-Reply-To: <20230329131929.1328612-3-jagan@amarulasolutions.com>
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


--6fhpyyv3p3yi6x2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

The patch prefix should be drm/sun4i:

On Wed, Mar 29, 2023 at 06:49:29PM +0530, Jagan Teki wrote:
> Convert the encoder to bridge driver in order to standardize on a
> single API by supporting all varients of downstream bridge devices.

Which variant, and why do we need to convert to a bridge to support all of =
them?

> The drm_encoder can't be removed as it's exposed to userspace, so it
> then becomes a dumb encoder, without any operation implemented.
>=20
> Tested on DSI Panel, DSI Bridge, I2C-Configured DSI Bridge.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

[...]

> +static const struct component_ops sun6i_dsi_ops;
> +
>  static int sun6i_dsi_attach(struct mipi_dsi_host *host,
>  			    struct mipi_dsi_device *device)
>  {
>  	struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> -	struct drm_panel *panel =3D of_drm_find_panel(device->dev.of_node);

That one looks unrelated. Why do you need that change?

Maxime

--6fhpyyv3p3yi6x2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCRSWwAKCRDj7w1vZxhR
xVxjAQDRiN3Xre3IIz1T4C43lttqvpbPqcE2DHMmgqXL79FOnwD+MQuYxHs10wNq
DIbqsDZm77R7tky3bD6gIHherQx6qw0=
=ztGu
-----END PGP SIGNATURE-----

--6fhpyyv3p3yi6x2l--
