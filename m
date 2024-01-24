Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91B283AE83
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 17:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC9710F508;
	Wed, 24 Jan 2024 16:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B0110EA4A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 16:41:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B6B4B61D9B;
 Wed, 24 Jan 2024 16:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B26C433C7;
 Wed, 24 Jan 2024 16:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706114464;
 bh=ONOtItDiqerRu78BREMGnu+yeJ0zfW2JVHtYWZ249aU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gxTA1Uf3IlC2Ga4JaHA7FL9yZn+M+pCSiqz/jNZtCCDjl75Wgk9+Ko4xV3jMhAv0a
 B18AS49vKQaWw+2bmtlz3pD4YrdPCOLKMQBO85IqYXNLVMIpYKh+XoBQwCd62VeIay
 VdGE370zKZClitEpeQccu2i/S8WD5CXZ328SjyMjiU/r1ZgsCSy+LPIpmYuOGxIpH0
 dUSPn7l26mQZXbsQmYO3Mcp6MXzp9PDr/chvKuCAeq4Ru6uOO2JaYC56Hnemi97fW+
 omnd3qAW1v0JffnytEC3tzY9kMPm/8Wuu4l7cqycUY+4J4xDAZ1l4zoB8mj/9NHKBE
 qEmqCJMhRyjEg==
Date: Wed, 24 Jan 2024 16:40:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v4 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Message-ID: <20240124-portal-sputter-f5207ac206ee@spud>
References: <20240124100019.290120-1-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PFa2V87EteAGYYHw"
Content-Disposition: inline
In-Reply-To: <20240124100019.290120-1-dharma.b@microchip.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 krzysztof.kozlowski+dt@linaro.org, bbrezillon@kernel.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, lee@kernel.org, nicolas.ferre@microchip.com,
 mripard@kernel.org, claudiu.beznea@tuxon.dev, robh+dt@kernel.org,
 thierry.reding@gmail.com, alexandre.belloni@bootlin.com, tzimmermann@suse.de,
 u.kleine-koenig@pengutronix.de, airlied@gmail.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PFa2V87EteAGYYHw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 03:30:16PM +0530, Dharma Balasubiramani wrote:
> Converted the text bindings to YAML and validated them individually using=
 following commands
>=20
> $ make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindin=
gs/
> $ make dtbs_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/
>=20
> changelogs are available in respective patches.
>=20
> As Sam suggested I'm sending the PWM binding as it is in this patch serie=
s, clean up patch
> will be sent as separate patch.

Please give discussion on the previous version some time to complete
before sending a new one. I've still got questions about the clocks
there.

Thanks,
Conor.


--PFa2V87EteAGYYHw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbE9mQAKCRB4tDGHoIJi
0sx+AQCWoBw03P0+i3/9lXINUcT6usQ2ObrMgRBpWhf2k6/JzgEAmCmKoq8qb8N1
/umMvdxtM/qUvSySnYx/ozU4sQrHYA4=
=BgZl
-----END PGP SIGNATURE-----

--PFa2V87EteAGYYHw--
