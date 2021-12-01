Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF85464EFA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 14:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FF46FEFF;
	Wed,  1 Dec 2021 13:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Wed, 01 Dec 2021 13:47:16 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B365F6FEFF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 13:47:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 740F7CE01C1;
 Wed,  1 Dec 2021 13:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16209C53FAD;
 Wed,  1 Dec 2021 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638365952;
 bh=OkFkg4SRT3IbrSqIc6ZCbd/DtTHU30OPhfc04/lnNWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U4wQkk/KPrKKZ6dQzs14gda4o1k/Qp0XOZRvnAiuaOzI/KzgMxXV3+DCjHQOiVaxi
 vPkpktHNQqv9MuV40AULna1+NwRs40hRF9pA13avqwallmxNsoopM3k0HchlmzXODh
 NNxdY1+Q71eKSQwPj28we0Y+kH+0VVwMuN4WBybMozx5R/VFVL+GMDjQ0f4rzYRl2x
 2/KeywZQ/IlOdgSOU6KgqZfqbZ4r/bLfvKlP4TSQCMI6xYk3wpXre9FlnE+upmaLoF
 k2E9kyAk1ohRRaGogNmApbN+I8KGg7d6Zw4rHlbIl3c5ztI5ixIvd1Ejyv9zLowN45
 Dl+32xSgFjHRA==
Date: Wed, 1 Dec 2021 13:39:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v10 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
Message-ID: <Yad69aTXcGixXvy3@sirena.org.uk>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>
References: <cover.1638307601.git.hns@goldelico.com>
 <4daf0c5dbed2c47c97003ab8de0a7dbd2a335dc3.1638307601.git.hns@goldelico.com>
 <LKTF3R.YREPOCHOSMQN2@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="urTHJbSJd+hEE4ly"
Content-Disposition: inline
In-Reply-To: <LKTF3R.YREPOCHOSMQN2@crapouillou.net>
X-Cookie: All true wisdom is found on T-shirts.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--urTHJbSJd+hEE4ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 01, 2021 at 01:02:45PM +0000, Paul Cercueil wrote:
> Le mar., nov. 30 2021 at 22:26:37 +0100, H. Nikolaus Schaller

> > +	regulator = devm_regulator_get_optional(&pdev->dev, "hdmi-5v");
> > +	if (IS_ERR(regulator)) {
> > +		ret = PTR_ERR(regulator);

Why is this using _optional()?  This should only be done when the supply
can be physically absent (in which case I'd expect to see special
handling).

--urTHJbSJd+hEE4ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGnevQACgkQJNaLcl1U
h9Dsbwf/e+Vh4NXLEM4GwwLFBAyDYCgyZOJxrdbM4ruocDneNLXbljJTQhnP40/5
NQY2reFsFCX2dDUeaLgmeBH1JgXmP4cstxeIifm7hVWPBtyzbiNEZ31mzoczVwXc
CRLE93/Y4Vt0dBmK6/zPrlYri1QRUgmC8JEI9oGNgTmJPeUzJeRtrqTn6qgMCBIf
FA99JndFSq6KpNBn3gb9EeC+fenFK2RWTSxbDlowTmhRAk0ADSvbbzEDRqiPVIHt
V6xxybtHL0vYRibGYj2h8mqTqdYQ+38Lpwb0UU9GhyRCXvY6ofFSaycULe6a+uWU
rTBMUeX7y57rdLq61ZW3XAr1G6y/KQ==
=yrgX
-----END PGP SIGNATURE-----

--urTHJbSJd+hEE4ly--
