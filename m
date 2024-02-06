Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF084BA13
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1C4112C9C;
	Tue,  6 Feb 2024 15:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sN//mvjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A58112C9C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:48:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B622B615A1;
 Tue,  6 Feb 2024 15:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB66C433F1;
 Tue,  6 Feb 2024 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707234480;
 bh=23DzthJXVC7vl2loyVn7P3Oe8LvV0igxtj6YGRqIgLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sN//mvjt3Sb3Mpx+5RopHhPSeUGP/jVXTdPXAPxdiimZ52OrZiHopaDdQ2+s7qMCl
 mjrvFoEVyUMF1W92/h5v+3/kyv8bo9p7iD/UGgQMnSmcuPplOv2pS2CxSEk/G79SM3
 YsRTtiJqgmAuQpppFRRqNL0nWeKgOqRi/HSE250se/ZcZzW8YTLEqPoMlFOiYSf/D6
 L5SjDzqmfX3beSFpKEDoUz5ZlYSdd1yIdBbkQ+kpKQ7LvAEFoKBoi4HCFL+WsUBRmN
 No6jZLSH1NwaHZh+zmu+3Oy704l5oWVAnrSffpOOk57h8BGk9fq1W5WvjqxtTlFC0N
 26h5csDgvGarQ==
Date: Tue, 6 Feb 2024 15:47:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Shengyang Chen <shengyang.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de,
 tomi.valkeinen@ideasonboard.com, r-ravikumar@ti.com,
 aford173@gmail.com, agx@sigxcpu.org, rdunlap@infradead.org,
 u.kleine-koenig@pengutronix.de, sam@ravnborg.org,
 bbrezillon@kernel.org, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: cdns: Add display
 bridge support for dsi on StarFive JH7110 SoC
Message-ID: <20240206-construct-slum-20f58637a228@spud>
References: <20240206065709.108684-1-shengyang.chen@starfivetech.com>
 <20240206065709.108684-2-shengyang.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UBTuCz2QbktCyFae"
Content-Disposition: inline
In-Reply-To: <20240206065709.108684-2-shengyang.chen@starfivetech.com>
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


--UBTuCz2QbktCyFae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 02:57:08PM +0800, Shengyang Chen wrote:
> From: Keith Zhao <keith.zhao@starfivetech.com>
>=20
> Add compatible to support dsi bridge on StarFive JH7110 SoC
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--UBTuCz2QbktCyFae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcJUqAAKCRB4tDGHoIJi
0iT2AP9aMGH7lGOnPX9HNLvvULNe0bBIH2+I3Z3pLGQsIma+8AEAr9ijpMJIqsE3
Ay6/1CGLrTojHBe+KCsOuZSMRhxUSgs=
=fZyT
-----END PGP SIGNATURE-----

--UBTuCz2QbktCyFae--
