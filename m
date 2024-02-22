Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2585F59B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE4210E8A5;
	Thu, 22 Feb 2024 10:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kxttw6OI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E1010E8A5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:26:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AC1B5CE217C;
 Thu, 22 Feb 2024 10:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C466C433F1;
 Thu, 22 Feb 2024 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708597566;
 bh=C5DPs1TcjLjs6ZDKjoVkY+BUT+jRjaN7GiNU8pWZYA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kxttw6OIm01Rb9mT8fkBwjc3CFksX9rBo3NfSD0JjTxVvmXKbzkVXMXnUHdRLcg0C
 +C6uGjnlieQizZfaY6+hyS0UfsuQssNpvGUcDdPKTkaTr54xN/BA8iCfXP4VGwLqvK
 dl/edARIVtGsLb011Jg4+PPYrrGn+m5ntYqVRs1Ta2adzPiBZI5vMLuFQxAJrfuX+5
 5tq9nUYKJap7Y3PM7rnJOVG5GXkYCB+28YMHAbt2IuxYXuT4PLNEV69qaMtpTV7uDf
 u3QDCcJjm2h3sPGv0mVwXdbdYmgQG5D8PhsWciunNQg9GPUcTXfzbGPdpidBC79z6X
 al629d1dgQlJw==
Date: Thu, 22 Feb 2024 11:26:03 +0100
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
Message-ID: <3kbqdgbfn2nioch3gvofvj7pzx7f5gkuwx77u5nkgxao6qo654@3nvjifkrxcjb>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-3-96a46a2d8c9b@oltmanns.dev>
 <exb2lvjcozak5fayrgyenrd3ntii4jfxgvqork4klyz5pky2aq@dj2zyw5su6pv>
 <874je6b2g4.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5tmnnujq4ct6ko4m"
Content-Disposition: inline
In-Reply-To: <874je6b2g4.fsf@oltmanns.dev>
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


--5tmnnujq4ct6ko4m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 18, 2024 at 09:29:15AM +0100, Frank Oltmanns wrote:
> Hi Maxime,
>=20
> On 2024-02-08 at 13:16:27 +0100, Maxime Ripard <mripard@kernel.org> wrote:
> > [[PGP Signed Part:Undecided]]
> > On Mon, Feb 05, 2024 at 04:22:26PM +0100, Frank Oltmanns wrote:
> >> According to the Allwinner User Manual, the Allwinner A64 requires
> >> PLL-MIPI to run at 500MHz-1.4GHz. Add support for that to ccu_nkm.
> >>
> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >> ---
> >>  drivers/clk/sunxi-ng/ccu_nkm.c | 13 +++++++++++++
> >>  drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
> >>  2 files changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu=
_nkm.c
> >> index 1168d894d636..7d135908d6e0 100644
> >> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> >> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> >> @@ -181,6 +181,12 @@ static unsigned long ccu_nkm_round_rate(struct cc=
u_mux_internal *mux,
> >>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
> >>  		rate *=3D nkm->fixed_post_div;
> >>
> >> +	if (nkm->min_rate && rate < nkm->min_rate)
> >> +		rate =3D nkm->min_rate;
> >> +
> >> +	if (nkm->max_rate && rate > nkm->max_rate)
> >> +		rate =3D nkm->max_rate;
> >> +
> >
> > This is provided by the clock range already. If you call
> > clk_hw_set_rate_range, it should work just fine.
>=20
> I have to admit, that I don't know that much about sunxi-ng or the CCF
> and therefore humbly request some guidance.
>=20
> I've looked at other examples of clk_hw_set_rate_range() usage and it
> seems there is not a lot of adoption for this functionality even though
> it was already introduced mid-2015. This makes me wonder, why that is.

There's no reason, really. I would expect a big part of it to be "if it
works don't fix it" :)

> Anyhow, it seems in all examples I found, clk_hw_set_rate_range() is
> called immediately after registering the clk_hw. So, in the case of
> sunxi-ng, we'd need to do that in sunxi_ccu_probe, which is a common
> function for all sunxi-ng clock types. Correct?

Yup.

> If so, surely, you don't want me to introduce clock type specific code
> to a common function, so I assume you want min_rate and max_rate to
> become members of struct ccu_common. Correct?

Yes, that would be reasonable indeed.

> If so, since there already are some clock types in sunxi-ng that support
> having a minimum and maximum rate, these clocks should be refactored
> eventually. Correct?

I guess. I don't consider it to be a pre-requisite to your patch though.

> Finally, in sunxi-ng there is a feature of having a fixed_post_div (see,
> e.g., the first to lines of the diff above). It seems to me that CCF
> cannot know about these post_divs, so we'd also need to transfer the
> fixed_post_div to ccu_common and use that when calling
> clk_hw_set_rate_range. Correct?

Not really, no. The fixed post divider is an additional divider that
needs to be considered for the clock rate.

See the A64's periph0 PLL for example. Its fixed post divider is 2, and
its rate is 24MHz * N * K / 2. The rate should be bounded by its minimal
and maximal rate taking the post divider into account. The CCF doesn't
have to know about it.

Maxime

--5tmnnujq4ct6ko4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdchOgAKCRDj7w1vZxhR
xeYcAQD8kfuph/bvW3AkRtRhUQiaaX8I5NZXLMQKI8xcnhEbcAD+Ld8/FcBSyHu3
/mny/ZO6Y0sXVbHPtYWYHq9nH0sHGA8=
=noRe
-----END PGP SIGNATURE-----

--5tmnnujq4ct6ko4m--
