Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61225BF2B87
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 19:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7804410E49B;
	Mon, 20 Oct 2025 17:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KVf/5gWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1459D10E49B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:31:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D68EB419C8;
 Mon, 20 Oct 2025 17:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDDFC4CEF9;
 Mon, 20 Oct 2025 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760981490;
 bh=Rj8TnVP8wPWGT2UvO9eiDZL3aqksBHrM83YzLn2wHRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KVf/5gWInfOxWLr9UCSHl+uXjgtqZ+92BuMAJPEsB+6mbaoMKbY5mks735Na5ATlB
 yZMr3d96jcLPL9mbv9/p5XtJTtpHaRDaow9e0Tl+uKnZljkNc0QoBvBztpcJPaJ4nt
 fWaRGHiruJAl3HCL18abEJHPCgSdeJclmLzacOHSqDo6JW2LmQ4HfIADjEBJmvUg2o
 wXR1e5GfNtWKdIIQTsjY5l185wyD4rJPThNJM2RRHYYv0ut+SC/7JGRhILjbKxYirJ
 qrKNxzMHBjDmmg512MlFcrlRXZVrV3EIBGDha8dKCAeIP0+v5P9uJoIgdnVhMLaL6Z
 z+5BGuKDHz3hA==
Date: Mon, 20 Oct 2025 18:31:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
Message-ID: <20251020-freebee-asleep-702062240cbd@spud>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Pg9U5fLbI3MpnTw5"
Content-Disposition: inline
In-Reply-To: <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
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


--Pg9U5fLbI3MpnTw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 03:15:14PM +0000, Matt Coster wrote:
> Hi Marek,
>=20
> On 18/10/2025 14:00, Marek Vasut wrote:
> > The power-domains items: list is not very informative, replace it
> > with plain minItems/maxItems instead.
> >=20
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> I would R-b this, but I want to wait for feedback from a dt maintainer
> to make sure this is an approach they're happy with. In the meantime:

I mean, yeah - they literally provide zero value over the names.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Pg9U5fLbI3MpnTw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZx7AAKCRB4tDGHoIJi
0skAAQDWz7xM6sOMHi+9ICDux0to/OJRLITPWezXMx6MAzC0wgD9EGjMakpX6pVN
XvM7QU3Rz7z4I2zFS+awmJOC0RKSOAE=
=btcv
-----END PGP SIGNATURE-----

--Pg9U5fLbI3MpnTw5--
