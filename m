Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D97581A4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C4710E36D;
	Tue, 18 Jul 2023 16:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951B010E36D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:04:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F377961600;
 Tue, 18 Jul 2023 16:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B152C433C8;
 Tue, 18 Jul 2023 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689696266;
 bh=KpLtuC/owlDra2MRE8Ta8/1qVd8xTu4USdwqr246vPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hGzvBXN2It4iW5ZVxE7FEZIkGeWmc1fn75D/PIR1wyodsQn2eG5agjcGTZ8veMOlW
 I+9bIX6Tii3Ym69X5c3jj6DbzBQL+L9LocKNFFHS9QWwEboflAxZBLv+Xi07xoIwZG
 NAaIRkWSnjS+fn+UOAyOH/T050pgXpXzmygkCUPcq1AVfb9pYFwMAUGVFIKJMpGyfx
 NeCP3WaCKKqoNtnTzw99NNy9rpvLENWV4oyTYAj5dsW9lcDy38m5rBWzmaTP4JtDIo
 SvIFGsewl9EB14iQyxS1wCIbg4t3oSsD4/Fckujqb8mNZvBrh8cpT3tEyHUt7BGXd0
 Tx/DUqCpBSLxA==
Date: Tue, 18 Jul 2023 17:04:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 2/4] dt-bindings: display: st7789v: add jasonic
 jt240mhqs-hwt-ek-e3 display
Message-ID: <20230718-popper-unrivaled-dae204940094@spud>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <20230718-feature-lcd-panel-v1-2-e9a85d5374fd@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dfkE5JaiJoHSnNRG"
Content-Disposition: inline
In-Reply-To: <20230718-feature-lcd-panel-v1-2-e9a85d5374fd@wolfvision.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dfkE5JaiJoHSnNRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 05:31:51PM +0200, Michael Riesch wrote:
> Add compatible for the Jasonic Technology Ltd. JT240MHQS-HWT-EK-E3
> display.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml | =
1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7=
789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789=
v.yaml
> index 905c064cd106..eb1a7256ac32 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.ya=
ml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - edt,et028013dma
>        - inanbo,t28cp45tn89-v17
> +      - jasonic,jt240mhqs-hwt-ek-e3

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>        - sitronix,st7789v
> =20
>    reg: true
>=20
> --=20
> 2.30.2
>=20

--dfkE5JaiJoHSnNRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLa4BAAKCRB4tDGHoIJi
0lGcAQCzZ+ilxAtoiJh6JOa61LrzqrMCGZ9S+wVR5O9qT33nTgEA4xpTjrWZ96u0
CmzULkM3CKVNhgrk4IxAI6N16acLAwM=
=0upB
-----END PGP SIGNATURE-----

--dfkE5JaiJoHSnNRG--
