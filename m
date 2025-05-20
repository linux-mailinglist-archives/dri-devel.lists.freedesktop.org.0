Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A290DABDFE7
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1A410E5D1;
	Tue, 20 May 2025 16:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XCYApDKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863AF10E664
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 16:04:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E8B656154E;
 Tue, 20 May 2025 16:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819BFC4CEE9;
 Tue, 20 May 2025 16:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747757074;
 bh=T8djPkiQ161lybXxMJx00BJYl2fbFkyUwvaxa66GR0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XCYApDKkKbQ8RZcHcYsx+1rBYlRV7fQdnAVx9yRyY+NPFYoz6kHYVyW+Jh6L25OmF
 Uzb3T4IFmtnpC0nH0jxklZne5MvPbi9thxqqoGL0yoKWrdW9dP8nlx9hgiJcgWNLni
 kOK1s4+HXnzN5dj2OHyCI43Q2e38DDMfzA/wJIrN5C+ZfyUepuds+sCdkfH3ucwP6O
 AYieyxsxl24AP3uJ3mcY4zqfbz/50G8Jj517bXuxP5M6X4R0IqI6cCJSxwEJJWX/1K
 7Pm0i+JDkPoauHVYiNEEEkLAoc2P++oCZvz015+pf1y7WsM2gsJgJ05WHO994RCpKo
 HcMIVdeiWhEFQ==
Date: Tue, 20 May 2025 17:04:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Message-ID: <20250520-varying-empathy-42a2e2a6a017@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I2SZYbhisflRuX3q"
Content-Disposition: inline
In-Reply-To: <20250520151112.3278569-1-hugo@hugovil.com>
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


--I2SZYbhisflRuX3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Allow to inherit valid properties from the dsi-controller. This fixes the
> following warning when adding a panel property:
>=20
> rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do n=
ot
>     match any of the regexes: 'pinctrl-[0-9]+'
>     from schema $id:
>         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
>=20
> Also add a panel property to the example.
>=20
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--I2SZYbhisflRuX3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCyoDAAKCRB4tDGHoIJi
0iIqAP98S0xKvMAlh2ZWVp+/y/p5FSrNAgAPPZFxpVcJKPWGpgD+M+6pCwtsw3it
k0J+4a9xCAW+39d/eRtypgwUC9cXfQ4=
=he3N
-----END PGP SIGNATURE-----

--I2SZYbhisflRuX3q--
