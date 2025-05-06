Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D0AACB0F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 18:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A1410E6FE;
	Tue,  6 May 2025 16:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j557xrhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275AA10E6FE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 16:33:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F0C1244E77;
 Tue,  6 May 2025 16:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DDDC4CEEB;
 Tue,  6 May 2025 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746549192;
 bh=T5IwqVc6xFlXyQ8S8dzAZ6X4EgS5Ru1mHBEXNH45t/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j557xrhrILi2MnAwG8b+Vun0FgPtExVIsTvVw1RZAHUnV7mry6ggoagqoPe3R61bt
 JPJoyOrQ1CLGe+dkWR/csvarBAWtpQM+zyjj+SgsoWF3hFKQnOz6WMnKBVaiT1uDHr
 hLRAC09tpACodPknrf5H/yZW0hU7qn0pLDwRmr56/esoSen3HfNFXnalmWjUZj6Kik
 LPckqFnXXVtbwGcs9Q9ASS0E+V9r7LUHJYK4i4ugfhIsTY2TPg3HpB0uB0uotiCpnS
 1/6uzGGnsV4adsrCQ+HrypTqjXoXXUWKNFQxLzs2azgvzMDvd4Yu5CGhzlV3FC8y2l
 n3Dfu70dY8TLQ==
Date: Tue, 6 May 2025 17:33:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/V2N SoC
Message-ID: <20250506-collie-rover-9e157c442748@spud>
References: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wuQ590LFJw1Dw6xo"
Content-Disposition: inline
In-Reply-To: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


--wuQ590LFJw1Dw6xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 05:25:40PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a compatible string for the Renesas RZ/V2N SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--wuQ590LFJw1Dw6xo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo5wwAKCRB4tDGHoIJi
0pvJAP42yoslbjgKSBdNI1/TOdTQv+1AzQzyz4vG84MvPhN6QwEAl5hUJaIS8obI
Ijtv2fy6kUplbiuNHrDRhIpGHpWB7gg=
=S3tM
-----END PGP SIGNATURE-----

--wuQ590LFJw1Dw6xo--
