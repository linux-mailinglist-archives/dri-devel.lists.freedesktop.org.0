Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43983AE779B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 08:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A01610E672;
	Wed, 25 Jun 2025 06:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s+69cIVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247110E672
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:57:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 39D7861126;
 Wed, 25 Jun 2025 06:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EE6C4CEF1;
 Wed, 25 Jun 2025 06:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750834646;
 bh=VbDwXsKrhM8CHsbHpV38JK2VbTNZhGvF2JCOWkAiZ/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s+69cIVkBWEaspGFnnCUJWn4Q2gZQMJWOnRrLgtfZJ7B7TkA78C/I2UDeJhUnXWJr
 k1Deg/jPGYKFxnV3i7mgF4XosKTM/BjRcWJxXEzRTsQVkXMCBDrI7XniMCp00IKWVs
 NQZVNJjWK5am1RpauxlrRpiWBdane3OaCeH+4CCGo2y0s5jk9PnOOZKACWueXtHIvY
 ewH1fvQJNwB9SOxV9S9kc48ZfevAUbAVK/DV7O1rjzN1TIQLffcNnDV/XqueEq2E6x
 McsPljU5io0vhm9JRiEdI7Ah0adW7S9j4xCuyWU3in3VNfQYKQu89qgj/WbvcaGe3R
 /Xa/PSe1GG3+g==
Date: Wed, 25 Jun 2025 08:57:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] drm/bridge: microchip-lvds: add atomic
 pre_enable() and post_disable()
Message-ID: <20250625-mongrel-of-holistic-fascination-4f1a44@houat>
References: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
 <20250625-microchip-lvds-v5-3-624cf72b2651@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vb3krjv7gv7cfhgo"
Content-Disposition: inline
In-Reply-To: <20250625-microchip-lvds-v5-3-624cf72b2651@microchip.com>
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


--vb3krjv7gv7cfhgo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4] drm/bridge: microchip-lvds: add atomic
 pre_enable() and post_disable()
MIME-Version: 1.0

On Wed, Jun 25, 2025 at 10:26:11AM +0530, Dharma Balasubiramani wrote:
> pm_runtime_get_sync() and clk_prepare_enable() must be outside the atomic
> context, hence move the sleepable operations accordingly.
>=20
> - atomic_pre_enable() handles pm_runtime and clock preparation
> - atomic_enable() enables the serializer based on panel format
> - atomic_disable() turns off the serializer
> - atomic_post_disable() disables clock and releases runtime PM
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

If that's the reason you wanted to split the enable and disable hooks in
two, you don't need to. You can sleep in any context here.

Maxime

--vb3krjv7gv7cfhgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFud1AAKCRAnX84Zoj2+
diamAX9Q2VxvGLr4UTpE/YYMeO43sN+fUFjGx2oEGs2EYLpe/t3hfdfhBIxeyHdD
R6jM0JQBfjCCXgDU6myUftntCZOhDlTIHbL1lK9JKqZYzIuugWSbEtC/bPKzVP5y
pEV+FRRDqA==
=8zuh
-----END PGP SIGNATURE-----

--vb3krjv7gv7cfhgo--
