Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F095B9F5341
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D97A10EA37;
	Tue, 17 Dec 2024 17:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nx01bi8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B5110EA37
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 17:26:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 581E6A41EAC;
 Tue, 17 Dec 2024 17:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FAFC4CEE1;
 Tue, 17 Dec 2024 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734456414;
 bh=QXzUJkAz64sJ80IKvVtChQECu3WgfGbwg6qz2UoSbug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nx01bi8KPQ5AJUh6lfSaMQrMGjIyN+q1Qp6+yXCh7/Mxjb+e9bHvWRdzV01bcQ8y0
 i8ie8Y/NujnlNqJR6Y9pQnvm4behKD90+LCnQbC7rjN6gAsUbcVHvZgt297Ygx/NSH
 30GwVb6tMjglGjo9u4FXXLiexT9X6S37Id/RmjY443ItN75GMZqoxCIKhqxU5A6yFj
 0+bxW/ndE2+NelqAMVC+iDVrSKoZx8v2aegJrGsfD17blbQlrsDDVfGKDwLo2PPwwZ
 dCyxMXyalNc2iAForBQAY7TjKG2iI/uY7ShJXL1NPDXROQKWm0I644Vid7iSNOJELs
 Ke78Dv/pbldFQ==
Date: Tue, 17 Dec 2024 18:26:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 08/10] drm/vc4: hdmi: switch to using generic HDMI
 Codec infrastructure
Message-ID: <20241217-maize-jackrabbit-of-valor-3e7272@houat>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-drm-bridge-hdmi-connector-v7-8-cb9df2b6a515@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4ldlghaina2qyeiu"
Content-Disposition: inline
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-8-cb9df2b6a515@linaro.org>
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


--4ldlghaina2qyeiu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 08/10] drm/vc4: hdmi: switch to using generic HDMI
 Codec infrastructure
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 02:40:30AM +0200, Dmitry Baryshkov wrote:
> Drop driver-specific implementation and use the generic HDMI Codec
> framework in order to implement the HDMI audio support.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Assuming it's been tested:

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--4ldlghaina2qyeiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2G0WwAKCRAnX84Zoj2+
djRwAX4lGsyzkJYk6ZmDuGmyZDppdqT1lnMIOP1B8pdj3PYKbBomfAOHn9pOprem
K1Sa8+oBfjriGqxsXserhLXCHtyjDN/PGYMspNa66DtZfqfMrAVAH3vy1OOE6Zc/
OH+fS4Gkbw==
=9Qa5
-----END PGP SIGNATURE-----

--4ldlghaina2qyeiu--
