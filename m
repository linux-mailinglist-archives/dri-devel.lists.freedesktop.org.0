Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E804896EC8F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF8510E872;
	Fri,  6 Sep 2024 07:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ji6a+zWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4A910E872
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:51:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F352A5C597F;
 Fri,  6 Sep 2024 07:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C84C4CEC4;
 Fri,  6 Sep 2024 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725609104;
 bh=4Q6QBPQx0Q3Hsvug/TgTFRvcIUp3b3WiTX1Mnyr8qBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ji6a+zWiL9JTLas91YgLsCxxIqj2cN/GecYl72V+r40HHNcJsHL/xeioVwrSOt1LY
 A6mNFmNqSxCdXE1oiGpqPjYunpCg89upZAH77wad3kbLV3JAJwwgtah53asWHRHg6O
 JJL78UGtHDMTTGjI2RMOkTjL4JWDC3sKDNGSr7/hXEBVXlYL2gLZOdLhu5a2Q1Xl5k
 f7aY3an9ijVUpBhNNhkSrCa1sBIw6uljUM23wxX0hC+3E8wicnDMph1UpI6AMpAaRu
 tvcWeFjGYaArmuR/K9Gr1/4WTSnsdD2GPva9Clkb+FOiOeMdKYBRPsL8mtFox9HuyH
 NACu5UrNSJZkA==
Date: Fri, 6 Sep 2024 09:51:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with
 selected clock
Message-ID: <20240906-strange-spiffy-nautilus-330add@houat>
References: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
 <CAHCN7xLmZYZcHyPh3gy20vFKP7aTDKvWu+a_mbG6LN2gdEifTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ejxvdrh7pzfeccnj"
Content-Disposition: inline
In-Reply-To: <CAHCN7xLmZYZcHyPh3gy20vFKP7aTDKvWu+a_mbG6LN2gdEifTA@mail.gmail.com>
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


--ejxvdrh7pzfeccnj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 08:23:51PM GMT, Adam Ford wrote:
> On Wed, Sep 4, 2024 at 3:31=E2=80=AFAM Dominique Martinet
> <dominique.martinet@atmark-techno.com> wrote:
> >
> > This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when =
we
> > cannot output the exact frequency, enabling the imx8mp HDMI output to
> > support more modes
> >
> I went from 19 options on Modetest with my AOC 4K monitor to 31.  Of
> those 31, three did not appear to sync, but not all the frequencies in
> the LUT sync for me either, so I have no objection to moving forward
> with this, but I wonder if we should have a note in there about why we
> have a 5% tolerance.

Yeah, I agree, it's something you want a comment for.

Maxime

--ejxvdrh7pzfeccnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtq0iAAKCRAnX84Zoj2+
dkeCAXwPeLKzxqgBG+rta8SfG1sXvEd6pNwz9VSiFA47y7aJ9OD7j+7lQJW5Hp9A
f8lglUYBgKqiDZpM9XRPFEvccSnysACDM8/y9q+NAxU4Y9HqgSK9gBnnPQl+OJqX
ls8XD7B2aw==
=SnQ0
-----END PGP SIGNATURE-----

--ejxvdrh7pzfeccnj--
