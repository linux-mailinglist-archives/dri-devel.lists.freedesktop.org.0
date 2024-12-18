Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2F9F6B8E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 17:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DE610E22B;
	Wed, 18 Dec 2024 16:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ETuj7uIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8B810E22B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 16:55:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0AA595C4D43;
 Wed, 18 Dec 2024 16:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F8FC4CECD;
 Wed, 18 Dec 2024 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734540907;
 bh=0o6YsCPhoR+Sa9h4tInrAJarF+q0Du6OnRImy1JmvmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ETuj7uIuB6eGGCOGJuPf2ESKnfDQu/dRe9fQo0z4552Gg5u913QqHQyhGaFWw2h8+
 XQyOTzs9U157pAsvf6Z6zwoeOPckmNGbzr/gatH/rpgh0loc2KRboRECMPlsPdjxQs
 2C8NbCc7U2UVNUBG9AAFVVIL5H1uhN3XN5gOSuQw/7kTVp5VTJaTZrFlgfXh+MP2bF
 QhRcudzP57qlhGdQX4URy9g+upSVe3jxQA+DNU0A4iuhxMSqWff5VZPuobsn4O5+pt
 lO/rv4VllUbq71t9kIa2cWog5aAyrNqGpTIFBg40MfR0/iahOh7phDXJ3WL25ROoQS
 dbVw93/FoFkuQ==
Date: Wed, 18 Dec 2024 16:55:01 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mchehab@kernel.org,
 matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Subject: Re: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add
 compatibles for MT8188 MDP3
Message-ID: <20241218-easiness-appraiser-4bbd32caa2cd@spud>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Askt30FtJgx6rtkn"
Content-Disposition: inline
In-Reply-To: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
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


--Askt30FtJgx6rtkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 11:53:19AM +0100, AngeloGioacchino Del Regno wrote:
> Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
> and WROT hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Askt30FtJgx6rtkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L+ZQAKCRB4tDGHoIJi
0vwxAQDrAZFkEkmMQ5Z2MU2rY35fE61lDYWUebQGDUKcgUN1kQEA5mSrpxLH3nkg
sit8kCz+rofS8aJwNcWgW3XNlnMmTAU=
=ZFd/
-----END PGP SIGNATURE-----

--Askt30FtJgx6rtkn--
