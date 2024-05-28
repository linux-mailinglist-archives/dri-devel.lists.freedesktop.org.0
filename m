Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412E8D1572
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 09:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DB510E03B;
	Tue, 28 May 2024 07:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I8es+Eqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0BF10E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:44:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAF7261D7F;
 Tue, 28 May 2024 07:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B7CC3277B;
 Tue, 28 May 2024 07:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716882238;
 bh=qqkIGLNEovL5EX+lxvVPigpfq8LxO6k+4ZKyolw9Obs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I8es+Eqwr5udBHLBPzlh4vKY6efRmlOo8fM2MEQGaDqRhQZuNnyMTzo97XNXyVusL
 bjQbCWJ6E/a2sqpGHmEoBuxEJICnbJ57WaCTrDMKpAp1/HMHNNvAvsRHSHwpi2eXX7
 E7G5qxPXiv3OUI0KxqA2PYYjQl/WHjhaiYg1aPyqICmLCNoLpQlhN3BCMOTRA5huVo
 UbdahYEWZlOLHaMoB28gyf1vA0l+VpJ1cn9ljmiLab+UhiIn1ZiRrptTNF1+8jho3x
 ar8Dxjda32H8enBuqW8oKmZrubmUsR2t+k2ZDUz3wUO9Ds7kvaORm0SMbKcBM51sKu
 kMMBJkWzczrpw==
Date: Tue, 28 May 2024 09:43:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
References: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="r6nfkdbujxaxc736"
Content-Disposition: inline
In-Reply-To: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
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


--r6nfkdbujxaxc736
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 27, 2024 at 06:03:56PM GMT, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
>=20
> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
>=20
> Since it's an I2C-programmable bridge, it could have a proper driver,
> but the default settings work fine, thus simple bridge is sufficient.

No it doesn't. That bridge supports HDMI 2.0 which means you'll need to
change the TMDS clock ratio when programming a TMDS character rate
higher than 340MHz. And you'll need hotplug support to deal with it
properly too.

So sorry, you need a real driver there.

> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bri=
dge/simple-bridge.c
> index 5813a2c4fc5ee..b138279864750 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -292,6 +292,11 @@ static const struct of_device_id simple_bridge_match=
[] =3D {
>  			.timings =3D &ti_ths8134_bridge_timings,
>  			.connector_type =3D DRM_MODE_CONNECTOR_VGA,
>  		},
> +	}, {
> +		.compatible =3D "ti,tdp158",
> +		.data =3D &(const struct simple_bridge_info) {
> +			.connector_type =3D DRM_MODE_CONNECTOR_HDMIA,
> +		},

You'll need a DT binding for that too.

Maxime

--r6nfkdbujxaxc736
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlWLNgAKCRAnX84Zoj2+
ducOAX9fNeHhpYg4bPevoJBuD/X+OgnFLJU8xWy3jrCTPBm0HtKMO3YJPDxsGgxr
tzYZ5OUBfRadQTjP+D5jNSUo7jPx8Cnis/p2m3tC+MrvbYKo6B+LiXSv06Jdp8Xf
VqKyEj3rsQ==
=ljib
-----END PGP SIGNATURE-----

--r6nfkdbujxaxc736--
