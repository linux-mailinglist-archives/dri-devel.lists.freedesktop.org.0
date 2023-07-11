Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E274F7F8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 20:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EDD10E424;
	Tue, 11 Jul 2023 18:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4FA10E426
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 18:24:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DCA05614C6;
 Tue, 11 Jul 2023 18:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56524C433C7;
 Tue, 11 Jul 2023 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689099885;
 bh=zJPtfI/auSCS+FXnUdN2m+m5+pRku+Q7oweliXmmQCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jy8+pLrpW2sllchUXbaisHq93qc5rUvsUIaccrabrs4feG5vBgkLHH5scuoHHqh6P
 wAfxhKU3kFAj+t/a6AZQZ+ZQMNJJeS3WoPMpzzJpT1U7HBK/1zNsaJ2LVWGxqchL9k
 SvonL5sypVn4RHmddCGkitBHQi72pp+yvv6jgUqfrsceQ5PNb+QUQA3WTNUbMThtj9
 +zgpGM27Mo+//EkMnYVOMbf7hq1FHWmSN2SAIDgW0Y3J8i++R39+995iMA7OjNzasO
 dChxtjIUtCV2xROgGzBsIBbaCxzjQoZCKJ8cklMQ4UtEbPj+aSj7jVJrDE4tvMdLAW
 e6JXuzO2I3a+A==
Date: Tue, 11 Jul 2023 19:24:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: add startek
 kd070fhfid015 support
Message-ID: <20230711-expiring-properly-297b5d5a03c1@spud>
References: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
 <20230711-startek_display-v1-1-163917bed385@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dWksGz8zakQe6R4S"
Content-Disposition: inline
In-Reply-To: <20230711-startek_display-v1-1-163917bed385@baylibre.com>
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
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dWksGz8zakQe6R4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 05:36:27PM +0200, Alexandre Mergnat wrote:
> The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution
> of 1024 x 600 pixels.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../display/panel/startek,kd070fhfid015.yaml       | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd07=
0fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd=
070fhfid015.yaml
> new file mode 100644
> index 000000000000..857658e002fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid0=
15.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/startek,kd070fhfid015.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Startek Electronic Technology Co. kd070fhfid015 7 inch TFT LCD pa=
nel
> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: startek,kd070fhfid015
> +
> +  dcdc-gpios: true
> +
> +  height-mm:
> +    const: 151

Are height-mm and width-mm useful if they are always a fixed value?

Otherwise, it looks grand to me,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +
> +  iovcc-supply:
> +    description: Reference to the regulator powering the panel IO pins.
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel

nit: usually reg gets sorted after compatible, even if everything else
is in alphabetical order, but hardly important.


--dWksGz8zakQe6R4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK2eZwAKCRB4tDGHoIJi
0lLgAQCMb1PplJgTtOG7x2uyoj1EXik6O19bpIBNBdF79BMKxwD/T3mMvbBEowXo
mHoVlAsjsPjjzJxrxpefepaliX1CDgI=
=QhPy
-----END PGP SIGNATURE-----

--dWksGz8zakQe6R4S--
