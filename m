Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F4A35E19
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 13:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C26A10E2C7;
	Fri, 14 Feb 2025 12:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PDnSVwqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC17110E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 12:59:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A50F5A42A6D;
 Fri, 14 Feb 2025 12:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5DAC4CEE6;
 Fri, 14 Feb 2025 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739537944;
 bh=xnL5roeRyaUK5/UTEapgfClZfOGKu54LwE3xY8RZjwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PDnSVwqf2bT+JVes18OBSs9+X8bW4sk1MXFracTGyBEM0W+6qGxyYOp+T+LHlNaQg
 gGZge+yKfKwnRnFlbe61b80MzImGqkwgvZLtCfQ+p7+k10cjx+OGH+QfeakGjK8ruI
 WEjKrV/fYOAvsdBaNX0gvJJYa1fsopROQT0bwpmJ3rxoCdrrXZhOYkKe0cQTEnT/Wr
 EF6lgMDDwO2wHDlwI4Kx4iZ2K0OG1dIES0KGGhiBoaq+GHrRI0Hl85lFQIiDvNBBnJ
 7Ms9IIs5WMa4IsOxmupgNGJZZQ/HeTY1EhjLdMoXqNW8mr3wY3AeQVqFalChpMWnt0
 H2yOlhoYzBFCA==
Date: Fri, 14 Feb 2025 13:59:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 30/37] drm/bridge: Assume that a bridge is atomic if
 it has atomic_reset
Message-ID: <20250214-icy-earthworm-of-happiness-6bca70@houat>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-30-e71598f49c8f@kernel.org>
 <vjdpctck2afcjrt2rlgjtzmrkf4a5bg5ihymc53vuw6md576wd@kbb5y27a5woi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7xu255utmz4lugjt"
Content-Disposition: inline
In-Reply-To: <vjdpctck2afcjrt2rlgjtzmrkf4a5bg5ihymc53vuw6md576wd@kbb5y27a5woi>
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


--7xu255utmz4lugjt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 30/37] drm/bridge: Assume that a bridge is atomic if
 it has atomic_reset
MIME-Version: 1.0

On Thu, Feb 13, 2025 at 06:29:46PM +0200, Dmitry Baryshkov wrote:
> On Thu, Feb 13, 2025 at 03:43:49PM +0100, Maxime Ripard wrote:
> > The drm_atomic_bridge_check() runs the atomic_check callback if needed,
> > or falls back to mode_fixup if it's not there.
> >=20
> > Going forward, we'll need to setup the bridge atomic state even though
> > drivers might not be implementing atomic_check at all.
> >=20
> > We can thus switch to using drm_bridge_is_atomic() to take the atomic
> > path, and do additional things there in the future, or go the mode_fixup
> > route.
>=20
> This will break bridges like tc358768, rcar_lvds and mtk_hdmi: they
> implement atomic_reset() and mode_fixup().

What is your suggestion then? I kind of did what you were suggesting on
patch 1, but it wasn't working. Then you want me to roll back to that,
or something else?

Maxime

--7xu255utmz4lugjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ68+EAAKCRAnX84Zoj2+
duVPAX9RWiQ9+jWgdM6ESAMNwaYpcNcURXyxAsSygsXExJ5yfs3sA+eRSXUdufcw
tyFdbfEBgKNPYZt3cWfztBz3p4+/y2bAl+25qcUw/nZaffsxmlGDMoiHBqq5jsff
sba18eOz8Q==
=CRpZ
-----END PGP SIGNATURE-----

--7xu255utmz4lugjt--
