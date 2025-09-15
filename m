Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88086B5729A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 10:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C242810E33C;
	Mon, 15 Sep 2025 08:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UUMHKQbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D612310E33C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 08:12:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA54C60191;
 Mon, 15 Sep 2025 08:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1C6C4CEF1;
 Mon, 15 Sep 2025 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757923961;
 bh=/4t6fTEmgCtsxXWdHX8SLp+/K26imMxcD2QP8Rrpas4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UUMHKQbp5umS/OO5KvDllD0mhbzCtK71FoLECRiJE4U0wXEomZNMWvQGVkmjAgt7o
 jHE3ssHi+Fh+YxBNhfl1dHNO4Sys5n9SMBtDz1amHpMNK7D8kW1AFpcqxk/HbRaLBA
 2SCRrZ0H28gy6esFOvq1MCIObqpSUjPYrvhVPKautZ27tbFF+ivhpG22HTf4jP63fy
 d8JiUKe4k2zCKrLudR0UQEdZcEyZ8wfl9wIBKdgN2ia2jIU/oz6aiCEsRPDCKYj9N8
 XyZHK0xAm1yXDmP4ON70ElgkXfDeocnHWocSzJrIjtRZOdUMgF2GNmTgwFzm4z1OwB
 gYcMyKGwwMkzQ==
Date: Mon, 15 Sep 2025 10:12:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v8 2/3] drm/debugfs: show removed bridges
Message-ID: <20250915-whimsical-kickass-snake-ebb4dd@penduick>
References: <20250912-drm-bridge-debugfs-removed-v8-0-5c33d87ccb55@bootlin.com>
 <20250912-drm-bridge-debugfs-removed-v8-2-5c33d87ccb55@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vo2dcwrkr42b6wcz"
Content-Disposition: inline
In-Reply-To: <20250912-drm-bridge-debugfs-removed-v8-2-5c33d87ccb55@bootlin.com>
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


--vo2dcwrkr42b6wcz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 2/3] drm/debugfs: show removed bridges
MIME-Version: 1.0

On Fri, Sep 12, 2025 at 07:03:42PM +0200, Luca Ceresoli wrote:
> The usefulness of /sys/kernel/debug/dri/bridges is limited as it only sho=
ws
> bridges between drm_bridge_add() and drm_bridge_remove(). However
> refcounted bridges can stay allocated for a long time after
> drm_bridge_remove(), and a memory leak due to a missing drm_bridge_put()
> would not be visible in this debugfs file.
>=20
> Add removed bridges to the /sys/kernel/debug/dri/bridges output.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Changes in v8:
> - updated to rename bridge_removed_list -> bridge_lingering_list
>=20
> Changes in v7:
> - rebased on current code which is in drm_bridge.c now
> - removed if (drm_bridge_is_refcounted(bridge)), refcounting is not
>   optional
> - don't show bridge address
> - improve commit message
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 9491ae7c884d355be4a82fb02a43a42d17fa8e0c..fccc42017fd4df6ecfb596325=
df2dc4d17566f39 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1491,17 +1491,20 @@ EXPORT_SYMBOL(devm_drm_put_bridge);
> =20
>  static void drm_bridge_debugfs_show_bridge(struct drm_printer *p,
>  					   struct drm_bridge *bridge,
> -					   unsigned int idx)
> +					   unsigned int idx,
> +					   bool removed)
>  {
>  	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
> =20
> -	drm_printf(p, "\trefcount: %u\n", kref_read(&bridge->refcount));
> +	drm_printf(p, "\trefcount: %u%s\n", kref_read(&bridge->refcount),
> +		   removed ? " [removed]" : "");

I would use lingering here too, and your commit logs haven't been
updated either.

Maxime

--vo2dcwrkr42b6wcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMfKdQAKCRAnX84Zoj2+
do9DAYDteYvIWCYPLySGJQruS1YCaGAxQ2F7TafW4OXMiCb3CG2tYRWisadWJgAV
mEsHYskBgL5tJgMWTqIxYJsG0nfjKy/66BmYLhsi5EGTEbeaZKx/CQMo/jtd6ixe
hncfQHsIWg==
=FajZ
-----END PGP SIGNATURE-----

--vo2dcwrkr42b6wcz--
