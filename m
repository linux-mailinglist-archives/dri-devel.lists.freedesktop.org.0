Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D990C4CE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C94310E5D0;
	Tue, 18 Jun 2024 08:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dtjuvzkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2621B10E5D0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:16:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 96848CE1247;
 Tue, 18 Jun 2024 08:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918D9C3277B;
 Tue, 18 Jun 2024 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718698616;
 bh=AnHPQh9Ws7FCn5Y0bhEFJjmVr5CmxaG2VtfLyAikIhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DtjuvzkzmQUY8B6zgAe2OZf2Ge6HFUNYDOHah5zXPAlNwsSVcFgLFt+FDQ0AMU2WE
 y8fi2K0dCjOm6cAkB8wtBgZHQLrnlD3AiD7M6xEcDH2nuepk5xeAgGxbPbcTak81nF
 xk1mimJtzBZe+6I1azrUnHTFOIEMaS3TtGdBMldAqxF0dBIOAF5SSngTXDefq5FCCa
 v9xdle+3hVKjw3UtdGZcVHnGpax17YX7Z0ShP5+9DSHmA8sSCITseOTgpaIGUh8HEH
 MtcfPSoyUhqw3sh7U9nLi8Guy1383eXSVcT0Or1IB2WpMCyhNQypz4bItuH+2EQ4AY
 oQdnyurwXuIUA==
Date: Tue, 18 Jun 2024 10:16:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/4] drm: bridge: simple-bridge: use dev pointer in probe
Message-ID: <20240618-hot-centipede-of-contentment-bafcfc@houat>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-2-df98ef7dec6d@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6j5qm7tab4pveph5"
Content-Disposition: inline
In-Reply-To: <20240617-tdp158-v1-2-df98ef7dec6d@freebox.fr>
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


--6j5qm7tab4pveph5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 06:03:00PM GMT, Marc Gonzalez wrote:
> Prepare to factorize probe function.
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

=2E.. And since we would need a separate binding file, we probably don't
want to add things to simple-bridge that would not be part of its
binding.

Even more so when bridge drivers are that simple to write.

Maxime

--6j5qm7tab4pveph5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnFCdQAKCRDj7w1vZxhR
xSOGAQCyONwu9r3f/CI8n8WI6HWYwIWpVaBHAiQkqRvdA331GwD/UPE/Ia5NbW01
YA06OHStsPC8FhSXLmOvPo/JdGkDeQA=
=BELX
-----END PGP SIGNATURE-----

--6j5qm7tab4pveph5--
