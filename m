Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520EAE778E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 08:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F0810E671;
	Wed, 25 Jun 2025 06:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Op9KWhD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CE010E671
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:54:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A158BA50B84;
 Wed, 25 Jun 2025 06:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AE4C4CEEA;
 Wed, 25 Jun 2025 06:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750834458;
 bh=EJ6IID65Z59BonlU2Wioe3+d9CPG513VPf/OtFb1x3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Op9KWhD7Tl8bgWQE/7eKqgkVQFEMl8g7KVNycN1XQVNQXfrB4tbP37rEwZX7RtHKX
 peFUjIUsdNDzCEsBTh3X5Ygtz70+gw6wWPn3pzQTHIAOCG71bnzOl4x7ekCvS13Ewf
 6wexrg/3Ehuj+yoNoJvuIiag66Qvmz1L9XtQPjFY0G+hRaPe3oYRQmwEqG82LF6zfh
 0ZxdW5Fl+Ym1pD0a52HKqX/VJl9snMIhKjsiLpUkDHHKCpYfcXn28MUxSEL67uf9Re
 BCfJk2T8Scde9eHHNoWEhkuBzBRpGn76Lq8wnabe/ZFiavLuyAFhbd84sK1WOyLUZb
 pupmyI1NdOlww==
Date: Wed, 25 Jun 2025 08:54:15 +0200
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
Subject: Re: [PATCH v5 2/4] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
Message-ID: <20250625-fuzzy-expert-mackerel-6edb0a@houat>
References: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
 <20250625-microchip-lvds-v5-2-624cf72b2651@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6z6sx6lev5afoa2i"
Content-Disposition: inline
In-Reply-To: <20250625-microchip-lvds-v5-2-624cf72b2651@microchip.com>
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


--6z6sx6lev5afoa2i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/4] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
MIME-Version: 1.0

On Wed, Jun 25, 2025 at 10:26:10AM +0530, Dharma Balasubiramani wrote:
> Replace legacy .enable and .disable callbacks with their atomic
> counterparts .atomic_enable and .atomic_disable.
>=20
> Also, add turn off the serialiser inside atomic_disable().
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

As a rule of thumb, if you have "Also, do X" in your commit log, you
need a separate patch.

And you need to explain why turning off the serialiser inside
atomic_disable() is needed. It might make sense to you, it's not really
obvious to me from that patch, and it will definitely not be to someone
trying to identify fixes and doing backports.

Maxime

--6z6sx6lev5afoa2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFudFwAKCRAnX84Zoj2+
dg3pAX4y3Yi3BylDrRvImHJ6tZO2C6bUIS4QiSNbxE0IbU8hkmLYjQgwjgDXDOZG
CkX75UABgLmdldLD92owbUSs1wsQekEjYvEW7r6qN3JEABjnRR4qqdjRzJtXApxT
rVeZAqqImg==
=Ag6x
-----END PGP SIGNATURE-----

--6z6sx6lev5afoa2i--
