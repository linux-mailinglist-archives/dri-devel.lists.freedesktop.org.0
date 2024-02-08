Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E531684E8A7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 20:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA5610EA6E;
	Thu,  8 Feb 2024 19:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CS+rhKX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAAE10EA6E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 19:05:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 00F19CE1DBA;
 Thu,  8 Feb 2024 19:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FA8C433C7;
 Thu,  8 Feb 2024 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707419111;
 bh=2qlm0ODvAMoRIMtaJwc8hZTrxizT0hsAuAgTKH9Ac6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CS+rhKX+zDJN3T7gIg8okrFgf1lLcVxRZ5Cz2/LEoMRiSQxKhS1AYIReNBGBrTVOa
 yGqJm+psHTpyryvSVn48tarXkW32jPdhOsJuUilGnCn5RyDnnW1xE+F3m6ufGOSxpY
 6dgpYCNtVr0JoPVCUH1dwTJp7pwPM6zLkXbZGLRjdHQgqfLmr/SiIpq6wlLl9xK8SP
 m+jk10SQh1NBroTiSMleSL7a5iOztf6nOKR5PJnZ5FJHfSitqkdlzKZcTSAANynisw
 OMLtJJ5En7QH+SIapHuil/lYGb3Kq2NHrOGS5iEHl/Vggqzzd8k1Hoc3o+w4i15teY
 gx/zycT4wEFVg==
Date: Thu, 8 Feb 2024 20:05:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
Message-ID: <poua4bzyciiwt65sqjf2whqfdumvoe4h3bkjpf64px2vwgumrf@sai73byg2iju>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fpufhrhdecowdrbb"
Content-Disposition: inline
In-Reply-To: <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
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


--fpufhrhdecowdrbb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Mon, Feb 05, 2024 at 04:22:28PM +0100, Frank Oltmanns wrote:
> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
> The SOC requires pll-mipi to run at more than 500 MHz.
>=20
> This is the relevant clock tree:
>  pll-mipi
>     tcon0
>        tcon-data-clock
>=20
> tcon-data-clock has to run at 1/4 the DSI per-lane bit rate. The XBD599
> has 24 bpp and 4 lanes. Therefore, the resulting requested
> tcon-data-clock rate is:
>     crtc_clock * 1000 * (24 / 4) / 4
>=20
> tcon-data-clock runs at tcon0 / 4 (fixed divisor), so it requests a
> parent rate of
>     4 * (crtc_clock * 1000 * (24 / 4) / 4)
>=20
> Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mipi.
>=20
> pll-mipi's constraint to run at 500MHz or higher forces us to have a
> crtc_clock >=3D 83333 kHz if we want a 60 Hz vertical refresh rate.
>=20
> Change [hv]sync_(start|end) so that we reach a clock rate of 83502 kHz
> so that it is high enough to align with pll-pipi limits.
>=20
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

That commit log is great, but it's kind of off-topic. It's a panel
driver, it can be used on any MIPI-DSI controller, the only relevant
information there should be the panel timings required in the datasheet.

The PLL setup is something for the MIPI-DSI driver to adjust, not for
the panel to care for.

Maxime

--fpufhrhdecowdrbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcUl4wAKCRDj7w1vZxhR
xTm0AQDNC/Tab28G6xBV/FvvVOHHELD/uZcAMloaia6Nu7yTjQD/bu1heOYZp8J7
/+vAKLYzF/jNMgEObqQ/VnHSFbOX+Ag=
=CNG5
-----END PGP SIGNATURE-----

--fpufhrhdecowdrbb--
