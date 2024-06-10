Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FEC9026C9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 18:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2CA10E458;
	Mon, 10 Jun 2024 16:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Iwa32bmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FE310E458
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 16:32:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 37D8CCE16B8;
 Mon, 10 Jun 2024 16:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2D9C2BBFC;
 Mon, 10 Jun 2024 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718037153;
 bh=t3huLbYF+iqIvyjBa2Lrl3w5SrJDDUFNPpkhxQFR8lE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Iwa32bmP1FleUw+0UYiDwS1tt+D4BxK7bOYhNs/ktjU28WW/ryG8MQ3gjjilliHDC
 rrcwcHYjJwE5SqfJMbNveCT4SwsMBYEFhHsZtM+sweE290C2KlhwKByytFl9aqiwxx
 9NCgVlT+0vhqFFJhNYg6B4wVvrhGMPVBExNKmST18i82qUIQas7Ozc+QE6+U4Gd5FU
 RJK9RLAbVz/E4S/ks6fIi8fHABIUDKpUJDoAGVV0scmUSFKLIoVHw6rI9j/AlwRri0
 4+GR87IyfXBEN38PzAjtPUXvpsEqaPXI831o0177KxHP52BX/9V2pD2yu5KXXeoMUl
 fZ43wlAmvr7yw==
Date: Mon, 10 Jun 2024 17:32:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 1/8] dt-bindings: bus: allwinner: add H616 DE33
 bindings
Message-ID: <20240610-morbidity-slum-d733494f1939@spud>
References: <20240607110227.49848-1-ryan@testtoast.com>
 <20240607110227.49848-2-ryan@testtoast.com>
 <20240607-gag-radiantly-37bc3ac76907@spud>
 <e9e7a362-c41e-41f8-b6cd-02fbbd16ce8c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p5IxoNo8buJ/UBHS"
Content-Disposition: inline
In-Reply-To: <e9e7a362-c41e-41f8-b6cd-02fbbd16ce8c@app.fastmail.com>
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


--p5IxoNo8buJ/UBHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 09, 2024 at 03:19:55PM +1200, Ryan Walklin wrote:
> On Sat, 8 Jun 2024, at 2:23 AM, Conor Dooley wrote:

> >> +      - const: allwinner,sun50i-h616-de33-clk
> >
> > I think this is not right, as a corresponding driver change is missing.
> > Either you're missing a clock driver patch or you didn't test your dts.
>=20
> The clock driver patch with this compatible string is in patch 8/8.

Ahh, I didn't notice that " drm: sun4i: add Display Engine 3.3 (DE33)
support" had a clk driver. That needs to go into a patch of its own.

--p5IxoNo8buJ/UBHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcqmwAKCRB4tDGHoIJi
0tu7AQCo8gZn4juYCM25OwzfJQq7/23ZcuOT80PyC9J9xBK+qQEA/EVLDLvMiLow
eaJLi+JsbSGZdPTSG/nuSu8+I+D9eQc=
=1+Ai
-----END PGP SIGNATURE-----

--p5IxoNo8buJ/UBHS--
