Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D31E9F390A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE4B10E75C;
	Mon, 16 Dec 2024 18:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="odN/eE6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9710E75C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 18:34:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 580075C5EED;
 Mon, 16 Dec 2024 18:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E155C4CED0;
 Mon, 16 Dec 2024 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734374044;
 bh=nw8UVxaMbWL48QkwsLr0oUgQdps5wyPksK5zCKSYkLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=odN/eE6LX2KpPfc0YITRoNGsqnYJWctCV8Ur+IosRPS1CM/UqFacRE3qLooqwPCpP
 DIoL8S3WXwPuK9XzAdmo6EiqPjK3TwQ6MmIKdMD60lpYaSs/OdDqMKMLofoDeIDx+/
 uHIVAdOsxHBphHhFUmdxv2Sh8IC0V53OzS8UhpfUkJevqgRp4Yu6Y6ktPmwuoIsj/+
 cCzE1bAteLlSKtTvSGehVLRs3bILDPhTddZDIly0y7FrxJx+D+/U/eXb7CDAKIxjEW
 TmQktcsN8cuab51JIfFajVCL3hoETzyS8fnwG1lnEKEllP4P8uPbm+fSyi+xmO0X/2
 nVcNVzCVtTwkA==
Date: Mon, 16 Dec 2024 18:33:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add Tianma
 TM070JDHG34-00 panel
Message-ID: <20241216-keg-retaining-ea61c056a4d3@spud>
References: <20241216-tianma_tm070jdhg34-v2-0-0b319a0bac39@bootlin.com>
 <20241216-tianma_tm070jdhg34-v2-1-0b319a0bac39@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GFVoHBN/mStFRhus"
Content-Disposition: inline
In-Reply-To: <20241216-tianma_tm070jdhg34-v2-1-0b319a0bac39@bootlin.com>
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


--GFVoHBN/mStFRhus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 05:21:34PM +0100, Luca Ceresoli wrote:
> Add the Tianma Micro-electronics TM070JDHG34-00 7.0" LVDS LCD TFT panel.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--GFVoHBN/mStFRhus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2BylgAKCRB4tDGHoIJi
0ipbAQCBhb4DomJO24VJv8xhyhUlmVBc4kF+R7hA6Coun2tA2AEA1BzTLldvymsr
18PFr2/GDimTXv2gy3Y0FukunfTPKws=
=sJ9X
-----END PGP SIGNATURE-----

--GFVoHBN/mStFRhus--
