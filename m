Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED89186D7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE9F10E939;
	Wed, 26 Jun 2024 16:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OwBFktIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB0510E939
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:08:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E49C861B7C;
 Wed, 26 Jun 2024 16:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A050AC32782;
 Wed, 26 Jun 2024 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719418126;
 bh=R3x9Qh3h6BGgYuJkBKgcw1BLoF4es+mIXSb3IK4TuwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OwBFktIe0w1DhXqVjonq9MSd9eZiE+477ZfFRPLvoCLko/7/nOAOxuMRvwoDBZIpe
 eSG+m1/EY2tm/P1YBj/MDvPdWNkeqk8fb6Ypo8zcwCUCEqcVUExRd8OECJVjYwHJSd
 S94pBntXM1to2ZLp2yZbwUMOaVNT1rfOB9RucdVfelRouRVzlOizFW4TIaBZZSqH5C
 QAv4xJQRIhL6HV76V8ew6drmLGynp4lp//v1134SyInjQ2aJWFJTOK+Hu6Q0jCixqa
 2VcXoFDDd3Wa2utwViXxUkxM8XaqdfwrURykVuRI4+H5TSMmdYnD7aMqIfrpsSp4jh
 lY0ieyi8PfB2w==
Date: Wed, 26 Jun 2024 17:08:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240626-blah-unseated-6cab234bae61@spud>
References: <20240625-tdp158-v2-0-a3b344707fa7@freebox.fr>
 <20240625-tdp158-v2-1-a3b344707fa7@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="shHLQp0U9lySaFvQ"
Content-Disposition: inline
In-Reply-To: <20240625-tdp158-v2-1-a3b344707fa7@freebox.fr>
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


--shHLQp0U9lySaFvQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 06:38:12PM +0200, Marc Gonzalez wrote:
> The TI TDP158 is an HDMI to TMDS Redriver.
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  .../bindings/display/bridge/ti,tdp158.yaml         | 48 ++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.y=
aml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> new file mode 100644
> index 0000000000000..b687699e2ba80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI TDP158 HDMI to TMDS Redriver
> +
> +maintainers:
> +  - Arnaud Vrac <avrac@freebox.fr>
> +
> +properties:
> +  compatible:
> +    const: ti,tdp158
> +
> +  reg:
> +    description: I2C address of the device
> +
> +  enable-gpios:
> +    description: GPIO controlling bridge enable
> +
> +  vcc-supply:
> +    description: Power supply 3.3V
> +
> +  vdd-supply:
> +    description: Power supply 1.1V

Are these supplies not also required? Surely the device needs the power
to function?

Cheers,
Conor.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Bridge input
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Bridge output
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - ports
> +
> +additionalProperties: false
>=20
> --=20
> 2.34.1
>=20

--shHLQp0U9lySaFvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnw9CAAKCRB4tDGHoIJi
0hW/AQCuXyLDVNayVEDkdp7woR1S7bg90VStUy/d6BWh1qk6YQD+POXJw8PCAZOG
oq4b67YwBhRFdbn+Ks523MofTlIG4gw=
=yWby
-----END PGP SIGNATURE-----

--shHLQp0U9lySaFvQ--
