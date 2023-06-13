Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2031572EAAA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5006410E3D4;
	Tue, 13 Jun 2023 18:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05310E3D4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:17:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DD77616DF;
 Tue, 13 Jun 2023 18:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBA3C433D9;
 Tue, 13 Jun 2023 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686680231;
 bh=XTG2klyPf0oT75Kv3XuLzl4bkZFcLP4Om9Y9CJiTxXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l/rINJ26xpgNTIWBu2mAqPIfXNTg/865ib3LfIal3P9wIMWz06nB2MmFTDaY+l/ct
 hvgukZzRYlr2g+fhgOMDluOdAoaUvhx9Lf7Cxd/fa8dcUeX73pRmnVlhAFrAiAZNWY
 uViP+XJJC/v0zvgPhdOY6iqxWffqzrpPvGXSWdHV9zJk+/3jbgektHlKFq+KNCgJLI
 bYmRO0Ye+CyxsriYG5OIFej7tXenif3SjZfvYKJZl9GyrA/iuM6vmHMTL0KuTomMTV
 bBAVhWtTpRVbjjKmjVEstjJ2+t6Gr2HlQCElzsExBOQ2WEWOJq3a/8wFighLoGlOAh
 u1JwuoE5cmyPQ==
Date: Tue, 13 Jun 2023 19:17:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH 6/9] drm: atmel_hlcdc: Add support for XLCDC in atmel LCD
 driver
Message-ID: <20230613-recant-citadel-a3d3878ced06@spud>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-7-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2qFolLM+MCUnaiMP"
Content-Disposition: inline
In-Reply-To: <20230613070426.467389-7-manikandan.m@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 Hari.PrasathGE@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 Varshini.Rajendran@microchip.com, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, lee@kernel.org,
 Dharma.B@microchip.com, Nayabbasha.Sayed@microchip.com, conor+dt@kernel.org,
 robh+dt@kernel.org, Durai.ManickamKR@microchip.com,
 linux-arm-kernel@lists.infradead.org, Balakrishnan.S@microchip.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2qFolLM+MCUnaiMP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 12:34:23PM +0530, Manikandan Muralidharan wrote:
> - XLCDC in SAM9X7 has different sets of registers and additional
> configuration bits when compared to previous HLCDC IP. Read/write
> operation on the controller registers is now separated using the
> XLCDC status flag.
> 	- HEO scaling, window resampling, Alpha blending, YUV-to-RGB
> conversion in XLCDC is derived and handled using additional
> configuration bits and registers.
> 	- Writing one to the Enable fields of each layer in LCD_ATTRE
> is required to reflect the values set in Configuration, FBA, Enable
> registers of each layer
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> [Hari.PrasathGE@microchip.com: update the attribute field for each layer]
> Signed-off-by: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
> [durai.manickamkr@microchip.com: implement status flag to seprate registe=
r update]

These things inside [] look suspiciously like they should be
co-developed-bys...


--2qFolLM+MCUnaiMP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIiyoAAKCRB4tDGHoIJi
0sLzAP0Zkw/eYHzkGeK+6kpdWRLLsfZ8lM2aucgkkRrlw9+AQAD/RMzPg4U7Jd4l
w7bDsBluRxpYOapZPx5QzBXcbWUXHgY=
=QOaw
-----END PGP SIGNATURE-----

--2qFolLM+MCUnaiMP--
