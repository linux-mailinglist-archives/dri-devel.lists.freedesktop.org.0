Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D377811A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 21:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239E010E5E1;
	Thu, 10 Aug 2023 19:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC1410E5E1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 19:14:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7868766746;
 Thu, 10 Aug 2023 19:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7ABC433C7;
 Thu, 10 Aug 2023 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691694851;
 bh=kqCd67KWHHOLReJvm60zqqKL8Zb5KIbe0uvLTrSIOZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKiS+ULIakQrrpijPFaaf0WBEim2QoRzv+C220roUF0VfjlU17zCdMn2SzsEhU6FP
 SRtpPfGcARWlvKncZkOLSN2YI/UMmKBldJtxyKl4PMIwfYhSUbNw0Ka2/iv0UdoJV3
 6nuYDDlVc1aMF7JMomgxsXiGeENAXSM5Qy45kkgmWIoEJjYbcd7KlLacAdqRD4aa6d
 w3cgON9vVn+sS3nuEAK7s4vFIHDt82UaFvXB0Sai71E3bzB172dULGdRIA1CbNyWm6
 0nLYTOgQKs4HZFo9KLXNcRXw13T/htD5/445A8BuoSNxvtP+OOilpXdP4LXEH/ZfFK
 t7xoqjuIrGKXw==
Date: Thu, 10 Aug 2023 20:14:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/6] dt-bindings: trivial-devices: Remove national,lm75
Message-ID: <20230810-prissy-nibble-9f7747bdb64e@spud>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
 <20230810144451.1459985-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kIdsuo58jt+pjDVs"
Content-Disposition: inline
In-Reply-To: <20230810144451.1459985-2-alexander.stein@ew.tq-group.com>
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kIdsuo58jt+pjDVs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 04:44:46PM +0200, Alexander Stein wrote:
> Starting with commit 3e37c9d48f7a ("dt-bindings: hwmon: Convert lm75
> bindings to yaml") 'national,lm75' has it's own dedicated (YAML) binding.
> If kept in this file device specific properties as 'vs-supply' are
> considered excessive. Remove compatible here so it can be checked with
> more specific binding.
> arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: sensor@48: 'vs-supply' does not
> match any of the regexes: 'pinctrl-[0-9]+'
>   From schema: Documentation/devicetree/bindings/trivial-devices.yaml
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 40bc475ee7e1..e30335d4e504 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -295,8 +295,6 @@ properties:
>            - miramems,da311
>              # Temperature sensor with integrated fan control
>            - national,lm63
> -            # I2C TEMP SENSOR
> -          - national,lm75
>              # Serial Interface ACPI-Compatible Microprocessor System Har=
dware Monitor
>            - national,lm80
>              # Serial Interface ACPI-Compatible Microprocessor System Har=
dware Monitor
> --=20
> 2.34.1
>=20

--kIdsuo58jt+pjDVs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNU2/AAKCRB4tDGHoIJi
0lwWAQDrilXexeGOevcNPNlmm6AD15crdC32Z29BDRztUy33MQD/V1hjWuJ7t9ek
NCcwFrHAYB6J63OH6XLI1MraklBLBAw=
=4Iva
-----END PGP SIGNATURE-----

--kIdsuo58jt+pjDVs--
