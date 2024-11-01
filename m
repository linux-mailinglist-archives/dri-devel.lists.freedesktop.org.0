Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216579B987D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 20:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AE210E176;
	Fri,  1 Nov 2024 19:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SaFXkfUu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F3710E176
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 19:26:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88B595C5A4A;
 Fri,  1 Nov 2024 19:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691F2C4CED1;
 Fri,  1 Nov 2024 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730489211;
 bh=Sa/HhTUDVpk4NXfCGGmyvJmpwzaluhlGU0TChrjB+bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SaFXkfUuVpXBA4XRS/CsNDgnVARbi2alUSb+Hi/XtJC1GKki1zmHwC/kEqPNARka3
 9A8fYPfozklJGgLPZ2Dk7KQbLBQTUftc76f5NWJF8nfXehWeNU8NtYmxAWbSXJfFWi
 H/KN35oAasjjbOuYK9HMZI3TK6h68sKN2QJJNH1ZIgJWT9oyLceeERvCkBX+JFo5ji
 QUPRvx+waOf0+Gs6+GQQQ0LNiCHD6GdNfjU15c0Hd2Tx4CgIis6LL4602aCUmdOyy4
 GuJcEublpLssP2OKfyLFXaTvkVpaAza+PmxCx0JeSEftPfqu8JO5YyRy2y0y005DDz
 HIHZCCTxXvtEg==
Date: Fri, 1 Nov 2024 19:26:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Russell King <linux@armlinux.org.uk>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RFC v2 2/7] ASoC: hdmi-codec: move no_capture_mute to
 struct hdmi_codec_pdata
Message-ID: <e57aa9c7-1a35-4ed3-94c7-f3acd3293b6d@sirena.org.uk>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
 <20241101-drm-bridge-hdmi-connector-v2-2-739ef9addf9e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Xe2LhHWxNYWP+TP/"
Content-Disposition: inline
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-2-739ef9addf9e@linaro.org>
X-Cookie: We read to say that we have read.
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


--Xe2LhHWxNYWP+TP/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 12:19:03PM +0200, Dmitry Baryshkov wrote:
> The no_capture_mute flag might differ from platform to platform,
> especially in the case of the wrapping implementations, like the
> upcoming DRM HDMI Codec framework. Move the flag next to all other flags
> in struct hdmi_codec_pdata.

Acked-by: Mark Brown <broonie@kernel.org>

--Xe2LhHWxNYWP+TP/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmclK3AACgkQJNaLcl1U
h9AmVwf/dWfRKRI7gD3AqmFK1DexdVqm2bNZhFPhh2L1LOQy2vXI7nvVt/2acOos
2JHf3BYuLSIWMThTjkBKh173OCY3MTjzfkZIXRpsK6c7DuqPKLvJSakMt7/bWzvI
fb7j49YV7k/kD7rEZBGA6cm4UTMLe9STpUG3fyNqIBBWEtnxZmGLR99iBXiM+m5R
PoqILxDPVsroDHtz5xX/rUOxM6Fj9vG8TRgkfdHLvRdOjmYQxDD67WiUJKH8RSJ+
li+pH4COp9QU4likh9C3pYaLUEZ4s8Jm9boYt2IZtt66rnGl8vsAjoSW8LOnKlQM
3gmYAtofdaWiOHyS73Z1FO3Eu1quBw==
=ZSKp
-----END PGP SIGNATURE-----

--Xe2LhHWxNYWP+TP/--
