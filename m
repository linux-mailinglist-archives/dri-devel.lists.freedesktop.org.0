Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70678C7289
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64D810E1A1;
	Thu, 16 May 2024 08:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eC9YOc7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29FB10E1A1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:11:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F54E61630;
 Thu, 16 May 2024 08:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5C1C113CC;
 Thu, 16 May 2024 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715847103;
 bh=SDHydIIcgExVBBEGQEV4opyzcJq5q4MSmcgzjXkbO1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eC9YOc7pWDAxfIPvy6qHkI5yDPZzkilKJ8iFLiIsMFpGmxtavV4DoI4rrgbvfWwOf
 UzHnDPn7xheBOmWtjuti6olVKO2UJICtwiKqS1ML7RSWPNb4GTyLzR+OfyTJwU5qq3
 3aQ2Z2c+cC56OM0PaEyXDZcfAClAV60I76ybPtnGzwxXTKhmJXgbnMSTnHNlTKI3Y6
 DMCggVedsvUreGsKZwQoDuMz7RFRE27ydn47607BbtUoHGgJtcOU4omAx/XA7R25Iy
 xTGhf7OC54ObcQTJCTWsz4/K5ukJ7oTsNnmYh9HZNinjeuEoLvinfeFPQCbFM/xCG8
 gbvbiV/pq7BAw==
Date: Thu, 16 May 2024 10:11:39 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Boris Brezillon <boris.brezillon@bootlin.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 2/7] drm/bridge: cdns-dsi: Fix minor bugs
Message-ID: <20240516-stereotyped-precise-wapiti-6d0cd3@penduick>
References: <20240511153051.1355825-1-a-bhatia1@ti.com>
 <20240511153051.1355825-3-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cnswkacfnsz3omkc"
Content-Disposition: inline
In-Reply-To: <20240511153051.1355825-3-a-bhatia1@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cnswkacfnsz3omkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 11, 2024 at 09:00:46PM +0530, Aradhya Bhatia wrote:
> Update the Phy initialized state to "not initialized" when the driver
> (and the hardware by extension) gets suspended. This will allow the Phy
> to get initialized again after resume.
>=20
> Fix the OF node that gets passed to find the next available bridge in
> the display pipeline.
>=20
> Fix the order of DSI Link and DSI Phy inits. The link init needs to
> happen before the Phy is initialized, so the Phy can lock on the
> incoming PLL reference clock. If this doesn't happen, the Phy cannot
> lock (until DSI Link is init later on). This causes a warning dump
> during the kernel boot.
>=20
> Allow the D-Phy config checks to use mode->clock instead of
> mode->crtc_clock during mode_valid checks, like everywhere else in the
> driver.

All these should be in separate patches.

Maxime

--cnswkacfnsz3omkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkW/uwAKCRAnX84Zoj2+
dvbiAYCTM8TvoHNwZ6Dm4SMhmLrZgas5Prx9utVjWzNDduffCVKQ1muJvPEoKLqS
yfhdttQBgJkKcyWiqBjQtycklQDU+f/9fZ9eqO63kMLYM4jz3wRj66wF92677VhA
nVOw35Wlnw==
=NUy6
-----END PGP SIGNATURE-----

--cnswkacfnsz3omkc--
