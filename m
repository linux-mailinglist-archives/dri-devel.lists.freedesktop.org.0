Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E690AD96
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35A10E36D;
	Mon, 17 Jun 2024 12:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oUPASJIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEF910E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:07:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31F5361122;
 Mon, 17 Jun 2024 12:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49683C2BD10;
 Mon, 17 Jun 2024 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718626067;
 bh=lLf4l6RsdqXzGuno7XkQH16nzoJvIKQHVIIM8S2lni0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUPASJIm+bV/3LFwysjCkUOcpMLIYbDiZ1PD4hYFkmBiXBoBkA4pY9t79A8lWV39S
 2qzpeq0ChuXqAOb02aApgiGRL25ykRONP+EUNZIEbEf1JrBLPXpx2RitWtp0iFC+Cl
 ktyOmX93LLc/ser+JfArp97qVcvyPu3ZURfWBQ1v8HtjtruLjTtyLjizI+5o3XPVH/
 IvfnH3lWgeXcvPqsFWRfy1yXaAM7ra8Sl/7hqXzPTvQRj8A+pgZ245HKUyfJixFvyH
 uK7FhMFEhFb67bSQU3tDyPQk6k3Z6BKIdQ65yAJb98zLRs9K/wEJPSFoM91ldCrJe7
 AirYH7yy/G1BQ==
Date: Mon, 17 Jun 2024 13:07:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 2/5] ASoC: hdmi-codec: pass data to get_dai_id too
Message-ID: <723df0d7-fd52-4b14-bc59-254d94369721@sirena.org.uk>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-2-d59fc7865ab2@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XtVbdI0Tw2PNjcEk"
Content-Disposition: inline
In-Reply-To: <20240615-drm-bridge-hdmi-connector-v1-2-d59fc7865ab2@linaro.org>
X-Cookie: Life is the urge to ecstasy.
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


--XtVbdI0Tw2PNjcEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 15, 2024 at 08:53:31PM +0300, Dmitry Baryshkov wrote:
> The upcoming DRM connector HDMI codec implementation is going to use
> codec-specific data in the .get_dai_id to get drm_connector. Pass data
> to the callback, as it is done with other hdmi_codec_ops callbacks.

Acked-by: Mark Brown <broonie@kernel.org>

--XtVbdI0Tw2PNjcEk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwJwsACgkQJNaLcl1U
h9Ddiwf7B9RIPxE1KgzuGsGiFXQOUSUjl3Yznz5/+WBr2xZJpAlBHYswQFGUEikT
Gu6kk6LDHX6vF9wV+Z1Uq1U/LRSjYfPa+zl2+R+4A9vvyUxooQSTDpTu4KNcBDX7
D3TpXv9axeb9RPmfH0fw6FX4ABxz3Tpwz2fQGFzLAh6PaVA9O9CNNWgkDKvE61Ke
4EWvmr6GB1erLa97l68vEGCjTTejAs97ZXFxZYGPdmK/FqjeyR2dEPUYfgzQmgi3
W1uA0uI3jqFGv74skoytSEOR3i1eToyvYzidUkhO6Gz7nIBLBlbw/i/j5tV0UeoB
HW4EKT4EkpO2IGygQWnl0C0tH4PJpw==
=gM/U
-----END PGP SIGNATURE-----

--XtVbdI0Tw2PNjcEk--
