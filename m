Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DFE916DF7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 18:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A32410E6B5;
	Tue, 25 Jun 2024 16:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JCe+ijNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A905610E6B5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 16:23:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C134A614E8;
 Tue, 25 Jun 2024 16:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BE2C32781;
 Tue, 25 Jun 2024 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719332620;
 bh=T6WcmYyrG4RDnVy0C9I1xyHe/lqPeAD4ypoU12fA2sY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JCe+ijNMzfgTJ8otc6zD+pzRapbGk8sJQ8A41JfbOlO4wTgmQSH4RH3QrTP8eyzmo
 M0KTLmYsBNKMlM8tNqcpHQJR7XmMgT7RM+CMlPWTuCgI4yB3hJzwPZGlsUVwcXMzlJ
 +4GwL1Up06l+dkuzxzIW2wZ6GxHU1Evns7R5+bcZNaM4NZpPmXOn7SgwdfcVUBxkHZ
 PaEeDjt3vxoNe8KGCyj7AS1PrxRkUobtWC/xfnQyljoK5Ds0iffqi+J0juuviWEZ4y
 LJB3UegpXQESQu+qTblA0t/hv1+IMomRPs/evTRhpSOZPlTBqG0HYLpv5RCRc0U4hM
 46HFiD2YDSQZA==
Date: Tue, 25 Jun 2024 17:23:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dt-bindings: display: meson-dw-hdmi: add missing
 power-domain
Message-ID: <20240625-growl-unseated-e612193d93bd@spud>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
 <20240625145017.1003346-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ryZ1T0F0MK8qog8O"
Content-Disposition: inline
In-Reply-To: <20240625145017.1003346-2-jbrunet@baylibre.com>
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


--ryZ1T0F0MK8qog8O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 04:50:14PM +0200, Jerome Brunet wrote:
> All Amlogic instances of the Synopsys HDMI controller need a power domain
> enabled. This is currently missing because the Amlogic HDMI driver direct=
ly
> pokes the power domain controller registers, which it should not do.
>=20
> Instead The HDMI controller should use the power controller.
> Fix the bindings accordingly.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ryZ1T0F0MK8qog8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrvBQAKCRB4tDGHoIJi
0j6wAQCWm7LMe5lduj3W/J09vudOmNS2YYempj7Y7+BPJ0R2gQEA1WXqC9XZoQ97
I4MAXT7SsMcT9W2RDG9SUfFvkITeNwU=
=UL7b
-----END PGP SIGNATURE-----

--ryZ1T0F0MK8qog8O--
