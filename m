Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB34786FE4D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1802110FF1B;
	Mon,  4 Mar 2024 10:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pww2daha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867BA10FF1C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:06:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA55C60E09;
 Mon,  4 Mar 2024 10:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E61C433C7;
 Mon,  4 Mar 2024 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709546801;
 bh=ql2YE9dLy7/HqksxFsL3EMa70qfrq6G0Ss3uyxIAfU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pww2dahaYktpZw8zT+GAeiG3eZOnqVJMgGXYa9jEHCUPuvpwexEgiwYHLp8oIPWV1
 p9Nfs2tLGMtfRtk/61TvqOxv6B/o8bdnNnoNv4fmtMezl9QEk1KTwDhwsXfJQhjb0R
 S8h/M2BjnZsTX1daFrf3PHgFHyPx/I/hW2Bd7Tg7nKt2GEvzlbv3awpzmXs8VmBuEz
 YAzCR9rxIfj0eY9MHL/Hs6xaKa1v/WiUM4kjerG4w5F0PtzOvRZsegSxW7fevoo+Wl
 L6UHJUJs6JB0QPzhTtfH3TutaU8TBxfoCo5iNyFvwFfdBp+I8psu0Q8zPKUB5ig+iD
 mpOFS/TxydkMA==
Date: Mon, 4 Mar 2024 11:06:38 +0100
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
Message-ID: <20240304-satisfied-terrier-of-refinement-af48cd@houat>
References: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
 <20240304-pinephone-pll-fixes-v3-1-94ab828f269a@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="66d2eote3zmcdjtu"
Content-Disposition: inline
In-Reply-To: <20240304-pinephone-pll-fixes-v3-1-94ab828f269a@oltmanns.dev>
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


--66d2eote3zmcdjtu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 08:29:17AM +0100, Frank Oltmanns wrote:
> The Allwinner SoC's typically have an upper and lower limit for their
> clocks' rates. Up until now, support for that has been implemented
> separately for each clock type.
>=20
> Implement that functionality in the sunxi-ng's common part making use of
> the CCF rate liming capabilities, so that it is available for all clock
> types.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> Cc: stable@vger.kernel.org
> ---
>  drivers/clk/sunxi-ng/ccu_common.c | 15 +++++++++++++++
>  drivers/clk/sunxi-ng/ccu_common.h |  3 +++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu=
_common.c
> index 8babce55302f..2152063eee16 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.c
> +++ b/drivers/clk/sunxi-ng/ccu_common.c
> @@ -44,6 +44,12 @@ bool ccu_is_better_rate(struct ccu_common *common,
>  			unsigned long current_rate,
>  			unsigned long best_rate)
>  {
> +	if (common->max_rate && current_rate > common->max_rate)
> +		return false;
> +
> +	if (common->min_rate && current_rate < common->min_rate)
> +		return false;
> +

We should use clk_hw_get_rate_range() here, there might be some
additional constraints to the rate range than the hardware ones (ie,
calls to clk_set_rate_range()).

>  	if (common->features & CCU_FEATURE_CLOSEST_RATE)
>  		return abs(current_rate - target_rate) < abs(best_rate - target_rate);
> =20
> @@ -122,7 +128,10 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, st=
ruct device *dev,
> =20
>  	for (i =3D 0; i < desc->hw_clks->num ; i++) {
>  		struct clk_hw *hw =3D desc->hw_clks->hws[i];
> +		struct ccu_common *common =3D hw_to_ccu_common(hw);
>  		const char *name;
> +		unsigned long min_rate =3D 0;
> +		unsigned long max_rate =3D ULONG_MAX;
> =20
>  		if (!hw)
>  			continue;
> @@ -136,6 +145,12 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, st=
ruct device *dev,
>  			pr_err("Couldn't register clock %d - %s\n", i, name);
>  			goto err_clk_unreg;
>  		}
> +
> +		if (common->min_rate)
> +			min_rate =3D common->min_rate;
> +		if (common->max_rate)
> +			max_rate =3D common->max_rate;

max_rate should always be set to ULONG_MAX. I would drop the tests for
both here, and warn if max_rate is set to 0.

Maxime

--66d2eote3zmcdjtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeWdLgAKCRDj7w1vZxhR
xb2SAP9ET0NeahIoRnvn18FEj694GWHVCshWmVdZSbx52ubyUQEAquQE3UNMNiFK
TI7im2BmnlMaX7gl9ElohBH6qB5TBgE=
=/sgn
-----END PGP SIGNATURE-----

--66d2eote3zmcdjtu--
