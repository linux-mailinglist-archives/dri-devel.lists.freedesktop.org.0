Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525429E016F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8641710E22C;
	Mon,  2 Dec 2024 12:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hbHRhY2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D8610E22C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 12:06:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 909855C545C;
 Mon,  2 Dec 2024 12:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0A9C4CED1;
 Mon,  2 Dec 2024 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733141171;
 bh=gonlDT3L++kFgkgr8dwEbfsoVRovNYHWTLew/Kf9tDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hbHRhY2lub2ExTdOJetcBFDhwu+3jfa+EiLOFKIZCj5FsnpxL5dkE4OSA/5YzfCiN
 BytwJIUKzld/skAfD1J8BjcoBn766ZcovPof/X2UuZ3ijUE+wkrD4YfKUheuGHuYiS
 tc+HuLijZQ9cTgJqM7EIAUrRszprQLw63h3LN7njOsUB4o24JXn/sjx1ulgtyy5Sh1
 jp7CXNyPFcIeh0ROCIoDm7k1QgaJd0UBSYQsythHssl+2kNqrCAdwlPDY+UWTOnm/9
 gzbkFc2ly+khQjDQORZIQaw4D+o72MclNW80EuUB3aFpsXy6+mcARrVDfYMdVQbMgy
 00ORvUoOAUqgQ==
Date: Mon, 2 Dec 2024 13:06:09 +0100
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
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <20241202-bald-just-guan-c5d41b@houat>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6bleloymsoph6swm"
Content-Disposition: inline
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
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


--6bleloymsoph6swm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
MIME-Version: 1.0

Hi,

On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:
> The no_capture_mute flag might differ from platform to platform,
> especially in the case of the wrapping implementations, like the
> upcoming DRM HDMI Codec framework. Move the flag next to all other flags
> in struct hdmi_codec_pdata.
>=20
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I appreciate it might be a dumb question, but I never really understood
what no_capture_mute was all about. And in that context, why some
drivers would need / use it, and some won't.

Maxime

--6bleloymsoph6swm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02isAAKCRAnX84Zoj2+
dh7cAX0XHBjVLJpBJcVNDhUwsok/1i+5fU7IyNojyr9o2nI4uQUWrlieIDKy+bqP
ioHa5RoBfjSfWzdwDB7Ep7QSE5U9JkH9uF5girAsucCKcCXGsKLVLM1wLOEDZrqo
t4ux4qxeCw==
=KL7e
-----END PGP SIGNATURE-----

--6bleloymsoph6swm--
