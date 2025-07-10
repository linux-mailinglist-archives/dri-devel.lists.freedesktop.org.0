Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4CAAFFADA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF95E10E891;
	Thu, 10 Jul 2025 07:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZeI8/VKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCDB10E891
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 07:28:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 42EF761469;
 Thu, 10 Jul 2025 07:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76868C4CEE3;
 Thu, 10 Jul 2025 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752132500;
 bh=hdXjeCliRyJZCw75XF5LZkP9DunbKaTwr/NS/YNlOm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZeI8/VKQ537VmiYeHP0ZLXzBPqlrlyjylv5W7wUsHSWpYtHGVaIBqg6l6kKPGtv+l
 WTGESYCudcBEy6Vj4g5+7Mj93flVBEhf2P9CVsPyB6X984Fotx5ddKzOzPe9STOA2y
 sjbiQqPfX0xGiHit7XfBjif2Gplod4TliLjXUlzwqlhK4G9eQgERHD77DE2fQer7Rz
 dXYaQtKpEV97iE+ZSNvTrgBwrE689dTDnV8tJb3L+ZpFt0a5Qiv1B95uoD9E6ydZX6
 50IFww7wcn26Lpv6QZa2FBjdVNxhX4nrBOhE6guCoMQjop8A9ufVZgtOAY95+1IBIe
 KxTwI2QQLSj6Q==
Date: Thu, 10 Jul 2025 09:28:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] drm/imx: parallel-display: put the bridge returned
 by drm_bridge_get_next_bridge()
Message-ID: <20250710-dashing-origami-ara-ef9fc1@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
 <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-9-48920b9cf369@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6tqwawwu3nnorjig"
Content-Disposition: inline
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-9-48920b9cf369@bootlin.com>
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


--6tqwawwu3nnorjig
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 9/9] drm/imx: parallel-display: put the bridge returned
 by drm_bridge_get_next_bridge()
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 06:48:08PM +0200, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_get_next_bridge() is refcounted. Put it
> when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Same comments than on the previous patch here.

Maxime

--6tqwawwu3nnorjig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG9rkAAKCRAnX84Zoj2+
dnTtAYDyf/Yxt9bmEdmMUGLXyfbD9i2hhDEJkGJ8L01jt7ghkn+L5uWiwnMPQKFR
XgUd/r8BgJt8+q4jJcV+k0qVy9a+O6Na5wzUPuLCVbN5rC+8KA4NNINmo7vDm9ob
Wf/nc0V2xw==
=dhT/
-----END PGP SIGNATURE-----

--6tqwawwu3nnorjig--
