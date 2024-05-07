Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B031E8BE9C1
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F31810E577;
	Tue,  7 May 2024 16:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XO7XZgIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B30110EDFE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:52:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DB027CE1387;
 Tue,  7 May 2024 16:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EF0C2BBFC;
 Tue,  7 May 2024 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715100749;
 bh=EBegyrKIs9IsYSSriyOSaPz8FbhxduoJLnhVxNryoTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XO7XZgIzvemyxCi2RURGMKL6uGpqeJtc/aJvHHs2u9K20CkJcikHjNrg/ok2fO8Le
 8aVtSyMBrnRfjPxx7X3xsZr+EITGhnVcZbF+xUmpnRfGOEEcNvE/ucs2WDEElZ7VSL
 2k8XXthmphV5XhVO/hY9P9GGrwU/sT/Os0219QiCGySo7Dmn8nt17SKNRyvedI8ilt
 0I+r/gXx8mDSfO0u0DnLdXlluPJHmGQh/5M82UaiPX0Og6fneW3kz2ZqUBYAeQwYGE
 Cpbvu+H9cjjlv4sSOwZhYJEBvBOGQgsiik/YSOHYGD65Sl7HUfi/UoRDp4u6gPyyL7
 mF9IpH/v2OE/g==
Date: Tue, 7 May 2024 17:52:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display: rockchip, dw-mipi-dsi: Document
 RK3128 DSI
Message-ID: <20240507-buddhism-revivable-3cb51e6dbe96@spud>
References: <20240506194343.282119-1-knaerzche@gmail.com>
 <20240506194343.282119-2-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ggiKIBO6YyUKyAXI"
Content-Disposition: inline
In-Reply-To: <20240506194343.282119-2-knaerzche@gmail.com>
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


--ggiKIBO6YyUKyAXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 09:43:36PM +0200, Alex Bee wrote:
> Document the MIPI DSI controller for Rockchip RK3128. The integration is
> similar to PX30 so it's bindings-constraints can be re-used.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--ggiKIBO6YyUKyAXI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpcRwAKCRB4tDGHoIJi
0lM7AQCvbplIJz/h1RX6+gLccUZy7DZiRifU7S/pEFYX0WnQqwD7BNLAxWiT95Tt
FkeFbO2gnRBBmZX4oS2RXJeiz1OEtgo=
=r4ma
-----END PGP SIGNATURE-----

--ggiKIBO6YyUKyAXI--
