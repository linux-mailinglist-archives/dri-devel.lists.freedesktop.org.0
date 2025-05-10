Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C07AB2235
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 10:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F8810E04F;
	Sat, 10 May 2025 08:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cf25X2Dl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1507810E04F;
 Sat, 10 May 2025 08:44:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63302450B0;
 Sat, 10 May 2025 08:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83328C4CEE2;
 Sat, 10 May 2025 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746866640;
 bh=iZP0INqkNVJuqSHAtR4h42xNc68rjVjaWzE+UVHVyVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cf25X2DlYFqigNEHaUMVIeSZvZx5mMBMfSzlXZh6IR3yRDGG2JP2se3Xi0GUaRRXC
 RHAswulPL2o/Pu8CqhMFklkb261bJF7PuKzyTJBFfoQdYMudvn0NQ9MppKC/GoKCMT
 UxAlc4FeAi19ZF/qEhl2UFsXIhG5PhmX9ubf5wzszMnkQOKxcWJCVDZnJg851wO8U0
 kTWLIRMy5T1VyNl3f9SWXtOcnJjxbEyqha7GSa79N+AqWLSkNuhVXOE0FS2oMO1JRZ
 VThrHCnZwR6Rq0g0ELeJB3Pa5IH9mLfbpSLf18puH5eXsNJlQWdWUJPMr/VfA4P9d1
 m0M5pmefqYnvQ==
Date: Sat, 10 May 2025 10:43:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, "Rob Herring (Arm)" <robh@kernel.org>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Jani Nikula <jani.nikula@intel.com>, 
 Pin-yen Lin <treapking@chromium.org>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v3 03/22] drm/bridge: anx7625: convert to
 devm_drm_bridge_alloc() API
Message-ID: <3cccwtayrisa4x6gn4wvmd3unabionun7va3qlh7cmfxf4ukqd@vgwai2ralai7>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-3-b8bc1f16d7aa@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="42gmp23z7tcowblp"
Content-Disposition: inline
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-3-b8bc1f16d7aa@bootlin.com>
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


--42gmp23z7tcowblp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 03/22] drm/bridge: anx7625: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Fri, May 09, 2025 at 03:53:29PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

--42gmp23z7tcowblp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaB8RzAAKCRAnX84Zoj2+
dln/AX40pKuqkRhkQVs6JCH/aLBJ1p4FH2jOlqJApLLs496lo7sUBly+1PuPiI35
tNCYL7gBgKXxlSu1iZTnQQ03NSmiS7pU7xW+Lr1Yp4YkNPcG6zX8UJqs8WwQCQyQ
xhT5uOOImg==
=3aXy
-----END PGP SIGNATURE-----

--42gmp23z7tcowblp--
