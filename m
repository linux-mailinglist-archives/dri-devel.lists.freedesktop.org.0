Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC99F529E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8CF10EA2A;
	Tue, 17 Dec 2024 17:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QTo3p09H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CF010EA2A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 17:21:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73BC15C66A2;
 Tue, 17 Dec 2024 17:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A627EC4CEDF;
 Tue, 17 Dec 2024 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734456073;
 bh=gSxnS9OdKpfAXVd8d7j5pZW75+bllE3VDBoL+UPSVRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QTo3p09H4cMOYL0FydQyXHFf7eXEVuGWQHoPrBAwbMTGZ9yOmld+WlMig8fKO0ucg
 BhmmWEXrchYEe8MjLZrX3hkOkUdqQgtzBg+L6ArV5uW8MOI1IFo/868cNTyyuNDNvw
 tQZsBU5V3Oa8NSnz8O2TVMns+i4tn3frVx2jWiH+9sGKjur5C9cXXGGl018nk2Q36o
 B9fEZsOQ7Pdc+GiY0DH+0IjVLdX1tA3YZwcnGzLKBrhTWo3ixw9O1TZKjDkaJ5lC4n
 rteOmT/nwZYJaDNDv5IeE6K2btbB8PlFTSvAPNLMYf/UUpv+MrrQwgfHB974muo3bc
 WagjPbTiHXOnw==
Date: Tue, 17 Dec 2024 18:21:10 +0100
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
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
Message-ID: <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mn7xe23uuqeljxgv"
Content-Disposition: inline
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
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


--mn7xe23uuqeljxgv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
MIME-Version: 1.0

Hi,

On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> framework, I stumbled upon an issue while handling the Audio InfoFrames.
> The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> there was no simple way to get the drm_connector that stayed at the end
> of the bridge chain. At the same point the drm_hdmi_connector functions
> expected to get drm_connector instance.
>=20
> While looking for a way to solve the issue, I stumbled upon several
> deficiencies in existing hdmi_codec_ops implementations. Only few of the
> implementations were able to handle codec's 'plugged' callback. One
> third of the drivers didn't implement the get_eld() callback.
>=20
> Most of the issues can be solved if drm_connector handles
> hdmi-audio-codec on its own, delegating functionality to the actual
> implementation, be it a driver that implements drm_connector or
> drm_bridge.
>=20
> Implement such high-level framework, adding proper support for Audio
> InfoFrame generation to the LT9611 driver.
>=20
> Several design decisions to be kept in mind:
>=20
> - drm_connector_hdmi_codec is kept as simple as possible. It implements
>   generic functionality (ELD, hotplug, registration).
>=20
> - drm_hdmi_connector sets up HDMI codec device if the connector
>   is setup correspondingly (either I2S or S/PDIF is marked as
>   supported).
>=20
> - drm_bridge_connector provides a way to link HDMI audio codec
>   funcionality in the drm_bridge with the drm_connector_hdmi_codec
>   framework.
>=20
> - It might be worth reverting the no_i2s_capture / no_spdif_capture
>   bits. Only TDA889x driver sets them, while it's safe to assume that
>   most of HDMI / DP devices do not support ARC / capture. I think the
>   drivers should opt-in capture support rather than having to opt-out of
>   it.

Sorry if this isn't clear to me and I'm quite late to the party, but did
you test this on vc4 with both a pi3 and pi4, or was it just compile
tested?

Maxime

--mn7xe23uuqeljxgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2GzBgAKCRAnX84Zoj2+
doz7AYD+E+d4erzl9Bf5sWASu56Udkv+Nd2LpLqsDi351KTvI53a2703lFD4C28T
bGfQBG0BfiHdABYx41nUCejaduluIOxnFrtPmutUYSE5mvh38CG3Ej7/08luvURz
jbdIEtzSlQ==
=zUgb
-----END PGP SIGNATURE-----

--mn7xe23uuqeljxgv--
