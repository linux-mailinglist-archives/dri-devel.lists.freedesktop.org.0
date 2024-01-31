Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556E84455F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 17:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5859910FB40;
	Wed, 31 Jan 2024 16:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F7A10FB71
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 16:58:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FAE9618D6;
 Wed, 31 Jan 2024 16:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32405C43141;
 Wed, 31 Jan 2024 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706720280;
 bh=AAYWli0+ekhwWji5QCBI9mHhUVTGhsGXqS6v4AGlvlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bzd32YWSJzGiNrYKNjcbSmNWQC1tX4vuCsbNRyS4hcXoKvaWKLbAXclry+EhmcuJc
 E8zUGGnjhHod98dwmRjly8o80Y6dt946OjRBjKYburDoqu7vC0MQbvCJnObOtL5k2l
 Yztm2wprEf7HxsFGZkw9yYUSsYEl4hbOPhTGKbG5kr6EC46OpdiFA0JbDtNSutf8G9
 GvvTbK8O93UBVZdR/dqomTQeeh8XmSmz0uSFYpsUqa86TtTiYTB2uW1TXIZNA6afko
 Opl0Hv0E7H0eQipEEHSoxIsBkh6lmZnn5VAbMxP2GqamcL/vjvfR/qPOPCPFFOYVaq
 riRoyy7u1s6gQ==
Date: Wed, 31 Jan 2024 16:57:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [linux][PATCH v5 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to
 DT schema format
Message-ID: <20240131-spray-commodity-673622ffc1b0@spud>
References: <20240131033523.577450-1-dharma.b@microchip.com>
 <20240131033523.577450-4-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Up5J+MjpJWWvw0o9"
Content-Disposition: inline
In-Reply-To: <20240131033523.577450-4-dharma.b@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, hari.prasathge@microchip.com, sam@ravnborg.org,
 manikandan.m@microchip.com, lee@kernel.org, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Up5J+MjpJWWvw0o9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 09:05:23AM +0530, Dharma Balasubiramani wrote:
> Convert the atmel,hlcdc binding to DT schema format.
>=20
> Align clocks and clock-names properties to clearly indicate that the LCD
> controller expects lvds_pll_clk when interfaced with the lvds display. Th=
is
> alignment with the specific hardware requirements ensures accurate device=
 tree
> configuration for systems utilizing the HLCDC IP.
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Up5J+MjpJWWvw0o9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbp8EQAKCRB4tDGHoIJi
0pFnAQCKH+mkNUeIXKouL9L0h7OnKONe67YgBm0bChu/ir7aEQD+J9bT3DR1BQ5V
CebLc0QPs+K8WjytedCfx8EaPxvUBwM=
=OQtS
-----END PGP SIGNATURE-----

--Up5J+MjpJWWvw0o9--
