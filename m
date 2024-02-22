Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB285F5BD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FBE10E0A5;
	Thu, 22 Feb 2024 10:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GLpeCnbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505F510E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:29:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FEA16142D;
 Thu, 22 Feb 2024 10:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86506C433F1;
 Thu, 22 Feb 2024 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708597794;
 bh=Wzsp+43YqM+LlxN0cpsEdEREeR6hPbCyLnqKwXy8YPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GLpeCnbBnu29hs6MZNOozG2jG6b1fFuTJVhE3nvd7tjl6OJrs/6etqCnvwC1gydFc
 fZaiIs07i5pfwnXJ+lyW5Irfyo1A4zz85pj1wabeJ7hHUqk2KOdpUel/X2TixStzQz
 V58Kw1xhT+bVoCZNonvGZgNysqVEW/SraW2A6pjK7nU1YpFwSWACfR/7CkFRkFf7mE
 OPikCWYMo91ZsmfU/RQ/POBakSS1xVnR7T2/P/ZpO+odkg+uBRfP4f62sytseG05jY
 P0L90QvV7eZlk0m9ZoDBIDUf8lS9dwxaWtHQuXvP5xb8VBZaX1IWZFRjlm6KMap4uX
 Ng7/DDdFyaRkg==
Date: Thu, 22 Feb 2024 11:29:51 +0100
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
Message-ID: <ia7e7gqozltl5wkfdvwtf2rw2ko2dt67qxtuqbavsroyv4ifys@x4mbulqhhri5>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
 <poua4bzyciiwt65sqjf2whqfdumvoe4h3bkjpf64px2vwgumrf@sai73byg2iju>
 <87sf1zxb0s.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bml6dpjoov3orz5g"
Content-Disposition: inline
In-Reply-To: <87sf1zxb0s.fsf@oltmanns.dev>
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


--bml6dpjoov3orz5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 11, 2024 at 04:42:43PM +0100, Frank Oltmanns wrote:
>=20
> On 2024-02-08 at 20:05:08 +0100, Maxime Ripard <mripard@kernel.org> wrote:
> > [[PGP Signed Part:Undecided]]
> > Hi Frank,
> >
> > On Mon, Feb 05, 2024 at 04:22:28PM +0100, Frank Oltmanns wrote:
> >> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
> >> The SOC requires pll-mipi to run at more than 500 MHz.
> >>
> >> This is the relevant clock tree:
> >>  pll-mipi
> >>     tcon0
> >>        tcon-data-clock
> >>
> >> tcon-data-clock has to run at 1/4 the DSI per-lane bit rate. The XBD599
> >> has 24 bpp and 4 lanes. Therefore, the resulting requested
> >> tcon-data-clock rate is:
> >>     crtc_clock * 1000 * (24 / 4) / 4
> >>
> >> tcon-data-clock runs at tcon0 / 4 (fixed divisor), so it requests a
> >> parent rate of
> >>     4 * (crtc_clock * 1000 * (24 / 4) / 4)
> >>
> >> Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mip=
i.
> >>
> >> pll-mipi's constraint to run at 500MHz or higher forces us to have a
> >> crtc_clock >=3D 83333 kHz if we want a 60 Hz vertical refresh rate.
> >>
> >> Change [hv]sync_(start|end) so that we reach a clock rate of 83502 kHz
> >> so that it is high enough to align with pll-pipi limits.
> >>
> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >
> > That commit log is great, but it's kind of off-topic. It's a panel
> > driver, it can be used on any MIPI-DSI controller, the only relevant
> > information there should be the panel timings required in the datasheet.
> >
> > The PLL setup is something for the MIPI-DSI driver to adjust, not for
> > the panel to care for.
> >
>=20
> I absolutely agree. It even was the reason for my submission of a
> sunxi-ng patch series last year that was accepted, to make pll-mipi more
> flexible. :)
>=20
> The only remaining option I currently see for adjusting the sunxi-ng
> driver to further accomodate the panel, is trying to use a higher
> divisor than 4 for calculating tcon-data-clock from tcon0. I remember
> reading a discussion about this, but as far as I remember that proposal
> was rejected (by you, IIRC).
>=20
> While I appreciate other suggestion as well, I'll look into options for
> using a different divisor than 4.

Like I said, I'm not against the patch at all, it looks great to me on
principle. I just think you should completely rephrase the commit log
using the datasheet as the only reliable source of the display timings.
Whether sun4i can work around the panel requirements is something
completely orthogonal to the discussion, and thus the commit log.

Maxime

--bml6dpjoov3orz5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdciHgAKCRDj7w1vZxhR
xfJ1APsGJxlhH6N9Zf5Bg18E9npao1trsNfER/3ulA49l/e3zQEArlyYygxuPvKn
3nkhyF0YeukoDf5065tfHAeU7wy1JQA=
=mdeZ
-----END PGP SIGNATURE-----

--bml6dpjoov3orz5g--
