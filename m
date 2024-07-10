Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80EF92D3A6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E5A10E257;
	Wed, 10 Jul 2024 14:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HlgOnuRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6018210E257
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 14:01:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49C6661A8D;
 Wed, 10 Jul 2024 14:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0FAC32781;
 Wed, 10 Jul 2024 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720620077;
 bh=DqU9cIN76ke48HhYoQkN5R6zkS5nfvCzZJkiZIS32WY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HlgOnuRbZ6Xx/tQ4gLcqAf1Gwh+iqXg4Mwrgmxhw0RxEamHK/vWBzh6aW6egfM4UU
 2VJMSyzxe9Gz34O1AHUYmkPLb+84UVZlTLaMm7RMIUwfTyrHjKU0TDn1fKlkTKCiE1
 CpS9AF1V2gFvOI/ys1c0rF0kXb2IRt2RDKUgW/Ek0YTL2qxeLPwZ1Ni4lJg9Z6LZ1y
 J+hXtqI2ygWYGSp8+GOSVeLVHALLni5Ji0i2R/6/UrdSdP9h4GS8fppawM8UfRBy4r
 8RE30X/M+dLvqXO/TZGsJrhsvXpmFSlyuYz8ElZxikpuTX88ZOoQoZRn9jnPgF1Nfp
 VIf1GNy49IdqA==
Date: Wed, 10 Jul 2024 15:01:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: display: st7701: Add Anbernic RG28XX
 panel
Message-ID: <20240710-showdown-antirust-a3eb8b65c57f@spud>
References: <20240706102338.99231-1-kikuchan98@gmail.com>
 <20240706102338.99231-4-kikuchan98@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HFMSCswt+gKrOFT8"
Content-Disposition: inline
In-Reply-To: <20240706102338.99231-4-kikuchan98@gmail.com>
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


--HFMSCswt+gKrOFT8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2024 at 07:23:34PM +0900, Hironori KIKUCHI wrote:
> The RG28XX panel is a display panel of the Anbernic RG28XX, a handheld
> gaming device from Anbernic. It is 2.8 inches in size (diagonally) with
> a resolution of 480x640.
>=20
> This panel is driven by a variant of the ST7701 driver IC internally,
> confirmed by dumping and analyzing its BSP initialization sequence
> by using a logic analyzer. It is very similar to the existing
> densitron,dmt028vghmcmi-1a panel, but differs in some unknown
> register values, so add a new entry for the panel to distinguish them.
>=20
> Additionally, the panel only has an SPI instead of MIPI DSI.
> So add and modify for SPI as well.
>=20
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>

With a mention in the commit message about why we are adding a property
and then immediately forbidding its use:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--HFMSCswt+gKrOFT8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo6UJwAKCRB4tDGHoIJi
0rWJAP9IHO7fHqyM5a/UICny+oqraSfmKGBb4QQ3LA2EqBU78AD/a0EsmZU8OROj
g207SYlLjekZTX5pN4bqKdUwpSj4AQE=
=8tYI
-----END PGP SIGNATURE-----

--HFMSCswt+gKrOFT8--
