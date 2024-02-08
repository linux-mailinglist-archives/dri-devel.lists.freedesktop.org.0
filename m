Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDF684E080
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 13:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB0210E0C1;
	Thu,  8 Feb 2024 12:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mSnsdIyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F60510E0C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 12:16:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F6D961B57;
 Thu,  8 Feb 2024 12:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64826C433F1;
 Thu,  8 Feb 2024 12:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707394590;
 bh=USkxMo00wu+oAG8dbi0UUhcAygROpPKwwkXbpptKPw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mSnsdIyBgjtrpmx4IO6IAxNTOBoAYUpwNNlSLkBDFRnlYsNjH6LMU1HMJ9mrpFb75
 /2cZcLMxIxfdsFyq3dzzxkFBVmCZj8wEvJO5olQyLjIDdYyI7cJ8GP555tVOQNl6uD
 TXMtm9Nafx5RjDeopn5SJdGpdshEIZ+wmtBNcJU0Q1xYd/hS5eawcY2mjSd3siFvEg
 kJC7o74B+5/K5POXR5b0Tsbt7roheh+iUaNazrmA+c/NYYEX3MgYRRnswxeMiycbfZ
 tQt3o5/vBBmHR8FNOTEz+GFJEhpvcn7aYFZ1/ByDQB9Vk9B9nmyFYa+7Vui4p/HIBh
 RLqvn9ug3AY/Q==
Date: Thu, 8 Feb 2024 13:16:27 +0100
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
Subject: Re: [PATCH v2 3/6] clk: sunxi-ng: nkm: Support minimum and maximum
 rate
Message-ID: <exb2lvjcozak5fayrgyenrd3ntii4jfxgvqork4klyz5pky2aq@dj2zyw5su6pv>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-3-96a46a2d8c9b@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g5pwkiip3azj2ftk"
Content-Disposition: inline
In-Reply-To: <20240205-pinephone-pll-fixes-v2-3-96a46a2d8c9b@oltmanns.dev>
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


--g5pwkiip3azj2ftk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 05, 2024 at 04:22:26PM +0100, Frank Oltmanns wrote:
> According to the Allwinner User Manual, the Allwinner A64 requires
> PLL-MIPI to run at 500MHz-1.4GHz. Add support for that to ccu_nkm.
>=20
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 13 +++++++++++++
>  drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nk=
m.c
> index 1168d894d636..7d135908d6e0 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -181,6 +181,12 @@ static unsigned long ccu_nkm_round_rate(struct ccu_m=
ux_internal *mux,
>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
>  		rate *=3D nkm->fixed_post_div;
> =20
> +	if (nkm->min_rate && rate < nkm->min_rate)
> +		rate =3D nkm->min_rate;
> +
> +	if (nkm->max_rate && rate > nkm->max_rate)
> +		rate =3D nkm->max_rate;
> +

This is provided by the clock range already. If you call
clk_hw_set_rate_range, it should work just fine.

Maxime

--g5pwkiip3azj2ftk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcTGGwAKCRDj7w1vZxhR
xfpFAQDl1iMbvaT5VL0H8/WZy4Wj8WN7EQPe6yGsH1gHJm+SJwEA2hmsuOH5dUHZ
3CUtUEMx4fGkAxCIbucEMa+tx6gRUgI=
=MjMG
-----END PGP SIGNATURE-----

--g5pwkiip3azj2ftk--
