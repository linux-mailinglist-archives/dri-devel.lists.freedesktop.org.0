Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4BE9F6B8A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 17:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A0C10E081;
	Wed, 18 Dec 2024 16:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pv18xzyw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB1B10E081
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 16:54:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3C013A40B3B;
 Wed, 18 Dec 2024 16:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A029C4CECD;
 Wed, 18 Dec 2024 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734540890;
 bh=s2SBxETvm52Px3OUzaEAAKhG+ijEolqfdP64sqQHZgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pv18xzywipaGaOM6nq9UTilWK5sjSM1kEbxjo6Xpw6inXfOKAzFSfOIvKrq2aYGxv
 ZudnAiQMcr8FqgqxMKyW7V1YQcbrFARCSOslU8PYjNq6hrBis9sZMjbFCnDRcoaRx1
 smsgh2c6ieXd4V1gGP9WJv3t1s0/R8+O6yQSTzaXgB/5vxxLWFoiV9kwdfD6boPhbj
 7X9RosnFG5JafHWbSsywmbT0Rz+dY95UHjJNZ6E9cd79dDsX7G28l0xqujYahkGC9v
 XZpd71NE2vlVhstAi0ztSHn0qSQJdv21w1cIHaI7Emdk/4YEtF490hDc2GBl5hncXA
 9jhnLbyHwXwrg==
Date: Wed, 18 Dec 2024 16:54:44 +0000
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
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
Message-ID: <20241218-skeleton-rockband-e25b7d60e7f3@spud>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HAI+tP8+x8Vxvsmq"
Content-Disposition: inline
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
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


--HAI+tP8+x8Vxvsmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 11:53:18AM +0100, AngeloGioacchino Del Regno wrote:
> Add compatible strings for the AAL, COLOR, MERGE and PADDING
> hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HAI+tP8+x8Vxvsmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L+VAAKCRB4tDGHoIJi
0u5SAP438pw1N/Szkws84SNvpbsLnX57vLfWAKvOv2y+wBPsVQEAwtZ4NMQzmlEn
7IK6CjupfLWoWguKpgjnYhFNDzV9MAQ=
=YaS1
-----END PGP SIGNATURE-----

--HAI+tP8+x8Vxvsmq--
