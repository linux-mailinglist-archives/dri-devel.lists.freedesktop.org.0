Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFD9E0332
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 14:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC1E10E2EB;
	Mon,  2 Dec 2024 13:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ja5YJfKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F9A10E2EB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 13:20:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 30F96A40CDD;
 Mon,  2 Dec 2024 13:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1A8C4CED1;
 Mon,  2 Dec 2024 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733145607;
 bh=cuZbfqLYHQS/1GAYDtMRKOLhWIMgYEMtvry7OBgUlJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ja5YJfKEpMZVqAcOsS9VwFVxwUPlCtxVzQl7ZDIXMcG5Uy68wX2q1TO2zHiwZoQFL
 sRrfDQnF5zYJ0gHNjVcRFjWI/RnxfDTcpDBBmQLctpbWmYRKw8ULXNPvoUg3Oqb0kU
 6hDfNE4K9dlvEMuybzZuqcYUB0zUguLdKl1WYSw8JqR4KE3ddWPCyk6yn8CvNEUJG7
 IX2wJi4MAwL6VD0MV7GUCkuK6LCHXZnVHQqt/gV5E8fyfqojj0Q65QrLyTFYK5SCC0
 mwuj+l01dIHDSqYN3IDMM+mXb0cZibWBU9+v3hRepcooVifZKL5QSpm2Aaa38U5TVb
 sNdiloTWDun/g==
Date: Mon, 2 Dec 2024 14:20:04 +0100
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
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Message-ID: <20241202-industrious-unnatural-beagle-7da5d4@houat>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vbtgu33lsjanu5xg"
Content-Disposition: inline
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
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


--vbtgu33lsjanu5xg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
MIME-Version: 1.0

Hi,

Sorry, I've been drowning under work and couldn't review that series before.

I'll review the driver API for now, and we can focus on the exact
implementation later on.

On Sun, Dec 01, 2024 at 02:44:12AM +0200, Dmitry Baryshkov wrote:
> Drop driver-specific implementation and use the generic HDMI Codec
> framework in order to implement the HDMI audio support.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 68 ++++++++++--------------------------=
------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
>  2 files changed, 15 insertions(+), 55 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 7295834e75fb1ab0cd241ed274e675567e66870b..d0a9aff7ad43016647493263c=
00d593296a1e3ad 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -595,6 +595,9 @@ static int vc4_hdmi_connector_init(struct drm_device =
*dev,
>  	if (vc4_hdmi->variant->supports_hdr)
>  		max_bpc =3D 12;
> =20
> +	connector->hdmi_codec.max_i2s_channels =3D 8;
> +	connector->hdmi_codec.i2s =3D 1;
> +

I guess it's a similar discussion than we had with HDMI2.0+ earlier
today, but I don't really like initializing by structs. Struct fields
are easy to miss, and can be easily uninitialized by mistake.

I think I'd prefer to have them as argument to the init function. And if
they are optional, we can explicitly mark them as unused.

Like, it looks like the get_dai_id implementation relies on it being set
to < 0 for it to be ignored, but it's not here, so I'd assume it's used
with an ID of 0, even though the driver didn't support get_dai_id so
far?

Maxime

--vbtgu33lsjanu5xg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02z/QAKCRAnX84Zoj2+
dpzbAYDixtv7TbkB/8hZMKjc8sAQyzE2ixGhzfLm1/mizfxI+p8zsxyz2xkCmeAU
CvjfI6UBgKALmNU3qiLez7ENeyLRh+cvBGhV2M7F3LMKGHgUca3NdOUGKZ2Ss9j2
Qw//3ctIIw==
=RzH8
-----END PGP SIGNATURE-----

--vbtgu33lsjanu5xg--
