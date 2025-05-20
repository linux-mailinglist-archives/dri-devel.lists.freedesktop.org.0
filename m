Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D489ABDFC7
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF23310E485;
	Tue, 20 May 2025 16:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nQDsY2hH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E2210E485
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 16:00:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 026CAA4ECC2;
 Tue, 20 May 2025 16:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FE8C4CEE9;
 Tue, 20 May 2025 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747756817;
 bh=NIKYYPe3EmOSzVPiSBtsF5ApdyDmuYMiB1qW2RbeOtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQDsY2hHVinQBaPnK5GMtLsl9eV1WR0v1BmAezlOZaNDySAj9m4rkCeN5P8TqCsgc
 OJwqHx+iISjVOadEY5fSiDW9ex+5NrZO7UQzog8sQfJhK8Irb2RrTM4oX7rG6YewMf
 z0Ty+gyXatVRR9zXy9RuRqpIWiiq2abMIGQSxWCVCml6nsgwJ60Q38WWqkPv0Sp3e3
 ixVVEsjqTB2fBzdKuC+q/ZPK/XRzUyPNyqptwaJZURqhhcQ3/fsUbnWgU5cF/jQGeV
 aaoUZnSX23de6yVYOfRmmQey7kA88la+dcen7wMJqNDh7Uk+U+3YmxzOWtA1Hqm+Sc
 0K1w61q12t6Gg==
Date: Tue, 20 May 2025 17:00:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Message-ID: <20250520-lens-dizziness-4d098c031b10@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
 <20250520-fidelity-mooned-5d4262d0a7ef@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KX0eqYpyQaNdsuzX"
Content-Disposition: inline
In-Reply-To: <20250520-fidelity-mooned-5d4262d0a7ef@spud>
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


--KX0eqYpyQaNdsuzX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 04:58:12PM +0100, Conor Dooley wrote:
> On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >=20
> > Allow to inherit valid properties from the dsi-controller. This fixes t=
he
> > following warning when adding a panel property:
> >=20
> > rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do=
 not
> >     match any of the regexes: 'pinctrl-[0-9]+'
> >     from schema $id:
> >         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> >=20
> > Also add a panel property to the example.
>=20
> I don't think adding the example should be in the same patch as a fix.

Or am I misunderstanding, and this is a new type of usage, rather than a
fix?

--KX0eqYpyQaNdsuzX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCynCwAKCRB4tDGHoIJi
0mUqAQDwvTMEhM3RPqXtrZBVjKFOWgbEhyAZdZMRK5tkQ1gUYAD8D4/MXSTv0OwH
7fZFnceSin+yW2XBYbBiVF/XJ4fbBg8=
=VoS0
-----END PGP SIGNATURE-----

--KX0eqYpyQaNdsuzX--
