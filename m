Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF081A61905
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 19:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7410EA2A;
	Fri, 14 Mar 2025 18:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EEGAuMio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AC710EA2A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 18:08:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C460FA48854;
 Fri, 14 Mar 2025 18:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD0DC4CEE3;
 Fri, 14 Mar 2025 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741975705;
 bh=pMndPzOi39LiqdZDL0zZ2D/xV+aNKHKbxp2vkbYQzcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEGAuMioxwmMWMH7D1iLTaJ1TstHwcF5CkjS7V6l1SxaUPZEhUf7Qcw+g/XCFMVui
 AmygB1SFx8T7kM8igKskWpBDTliayYSZ+Ly1JdSv5HYqyVDrp2rotsOEOA9JAE4+AQ
 w72KM5ezEX1XdaDBL6Xy1l4SG6Mri7pt/x0Uqkszj/gcLL8Qlv+OmwVbxrfQEqD+GF
 y0/0w80+BXczoAcY6Ar1YLjdk3sc11iNZr4lp0E+HgJVSnhEco4cCmHzzkwbCQSOPN
 gJK6lcXQIyPHcxpmtskWzTLykqYKE9kiatCEYyynfZ65S+0rwBlmPl/6blwh8+QPgG
 Z8k5MQCwq89iQ==
Date: Fri, 14 Mar 2025 19:08:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 05/11] drm/bridge: add a cleanup action for
 scope-based drm_bridge_put() invocation
Message-ID: <20250314-banana-toucanet-of-masquerade-8eeb4e@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-drm-bridge-refcount-v7-5-152571f8c694@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nzqdgqjykuda4cgv"
Content-Disposition: inline
In-Reply-To: <20250314-drm-bridge-refcount-v7-5-152571f8c694@bootlin.com>
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


--nzqdgqjykuda4cgv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 05/11] drm/bridge: add a cleanup action for
 scope-based drm_bridge_put() invocation
MIME-Version: 1.0

On Fri, Mar 14, 2025 at 11:31:18AM +0100, Luca Ceresoli wrote:
> Many functions get a drm_bridge pointer, only use it in the function body
> (or a smaller scope such as a loop body), and don't store it. In these
> cases they always need to drm_bridge_put() it before returning (or exiting
> the scope).
>=20
> Some of those functions have complex code paths with multiple return poin=
ts
> or loop break/continue. This makes adding drm_bridge_put() in the right
> places tricky, ugly and error prone in case of future code changes.
>=20
> Others use the bridge pointer in the return statement and would need to
> split the return line to fit the drm_bridge_put, which is a bit annoying:
>=20
>   -return some_thing(bridge);
>   +ret =3D some_thing(bridge);
>   +drm_bridge_put(bridge);
>   +return ret;
>=20
> To make it easier for all of them to put the bridge reference correctly
> without complicating code, define a scope-based cleanup action to be used
> with __free().
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v7.
> ---
>  include/drm/drm_bridge.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 5c1e2b9cafb12eb429d1f5d3ef312e6cf9b54f47..a5accd64c364ebb57903ae1e7=
459034ad9ebf4f3 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -23,6 +23,7 @@
>  #ifndef __DRM_BRIDGE_H__
>  #define __DRM_BRIDGE_H__
> =20
> +#include <linux/cleanup.h>
>  #include <linux/ctype.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> @@ -995,6 +996,9 @@ static inline struct drm_bridge *drm_bridge_put(struc=
t drm_bridge *bridge)
>  	return bridge;
>  }
> =20
> +/* Cleanup action for use with __free() */
> +DEFINE_FREE(drm_bridge_put, struct drm_bridge *, if (_T) drm_bridge_put(=
_T))
> +

IIRC, drm_bridge_put already checks for the pointer being null before
dereferencing it, right? Then we can probably simplify the macro here.

Either way,

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--nzqdgqjykuda4cgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9RwlgAKCRAnX84Zoj2+
dnRWAYDqJA/VzvRJeITRDaiSnp2e56ZEkITDBPZ7/s3WFGqse2NghJmcSAfLhnuR
0TgauxABfA8DQKzCstRILIp+mDGDhAoLus6nq23qduwVcOmS4bwHSjtg2Al4L1qn
7TGVN2z+zg==
=GY7p
-----END PGP SIGNATURE-----

--nzqdgqjykuda4cgv--
