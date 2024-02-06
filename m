Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34084B885
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1156B10E097;
	Tue,  6 Feb 2024 14:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dKPMwO3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5F310E097
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 14:55:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8BF4D6154A;
 Tue,  6 Feb 2024 14:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3A3C433F1;
 Tue,  6 Feb 2024 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707231318;
 bh=rC14wVFYqy4h/Awdz20rT2AXbkytWG1Up7dvXS+wKTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKPMwO3zpuufaHVwrevb03P/7KzYU8fGHI9AvBbZ+BUm6dQJOkhg4xx3hAPXMtvd4
 3knWHB0o9HPhdijomX7dJQuwP/kMbs0o3Ymjwenj3p3oNkQcgeqq7iIteAPRPH3yPA
 zg2o7DS/BiHmYC9YrHDwkC+KC47/bmtCXatzb7+WZlBMSZw2EobSXhBqJzB1oKSb9y
 kzqUF6X6bBtmcWRypHZe1Szgl68JfDev8cJmc6dt4Bd+o+Rd7HsUfunMRlQEzDpYQa
 /hbgYLE9FHo3ImSOy1YdZhPoqS5CNuxiPZbSXwPokiidMIIYtARn399TV1MnJc9mS9
 bI0g1oIfIvdog==
Date: Tue, 6 Feb 2024 14:55:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: display: add STM32 LVDS device
Message-ID: <20240206-retail-thicket-75e6e0b1fe45@spud>
References: <20240206-lvds-v4-0-98d5f9af399d@foss.st.com>
 <20240206-lvds-v4-1-98d5f9af399d@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O7hGylNQGhupJghO"
Content-Disposition: inline
In-Reply-To: <20240206-lvds-v4-1-98d5f9af399d@foss.st.com>
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


--O7hGylNQGhupJghO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 12:33:16PM +0100, Raphael Gallais-Pou wrote:
> Add "st,stm32mp25-lvds" compatible.
>=20
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--O7hGylNQGhupJghO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcJIUAAKCRB4tDGHoIJi
0ioEAQDsRUQ93I+XdwHLaxkV5SJzSoKt5JQzOfsQK+/3zHdkVAD+LY7mLq3aUNP+
xrS2FVr3QwhqlMobEa8ll1JafDbFTAI=
=OGHJ
-----END PGP SIGNATURE-----

--O7hGylNQGhupJghO--
