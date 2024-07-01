Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6091E13A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 15:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3744C10E03D;
	Mon,  1 Jul 2024 13:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fpRAI4Hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2311610E03D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 13:50:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4BFD8CE13C4;
 Mon,  1 Jul 2024 13:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085A4C116B1;
 Mon,  1 Jul 2024 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719841818;
 bh=AI7XCMBHlAs+uHRLozdpytNX6tSgpWifdmWB2XL1pAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fpRAI4HiyBs+3fWrGSovWnRMEEPFxscml8os9TLHv/K41wCzBjPrziWjr8SitAJRm
 WhC7nqyvfaNSivXKyaSSdYNjEcGSQyDA3ro/m1avt86SPLgtQj9opHTmpWOtxzVzhU
 Z9ashPmLUspz/YFjslefZ6HxgoUo6mdL9WPYNZ52XaMoSQ4Y95zoZONl5iUApEQ7j1
 LtkpX/spX5K0SITT6jjFiJNeVWeCClD8O52YtyIYuvRt1WnVMLrU8n1kGsR2PCtbJp
 PufAaSwwhTOHCkKe6sGAzOhEROqDn5AGiLasj3/mv6JpZ72Ow8bnt3JU3+o3/U4dn3
 +bd6s2BktjkgA==
Date: Mon, 1 Jul 2024 15:50:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240701-bug-of-great-honeydew-cfb6ef@houat>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lhkfrzu56kvv4h74"
Content-Disposition: inline
In-Reply-To: <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
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


--lhkfrzu56kvv4h74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> It supports 4 TMDS channels, HPD, and a DDC interface.
> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> for power reduction. Several methods of power management are
> implemented to reduce overall power consumption.
> It supports fixed receiver EQ gain using I2C or pin strap to
> compensate for different lengths input cable or board traces.
>=20
> Features
>=20
> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> data rate, compatible with HDMI 2.0b electrical parameters
> - DisplayPort dual-mode standard version 1.1
> - Programmable fixed receiver equalizer up to 15.5dB
> - Global or independent high speed lane control, pre-emphasis
> and transmit swing, and slew rate control
> - I2C or pin strap programmable
> - Configurable as a DisplayPort redriver through I2C
> - Full lane swap on main lanes
> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>=20
> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.y=
aml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> new file mode 100644
> index 0000000000000..21c8585c3bb2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> @@ -0,0 +1,51 @@
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
> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
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

The device supports DVI, HDMI or DP input, with various requirements and
capabilities depending on the input. Your binding doesn't address that.

Similarly, it can do lane-swapping, so we should probably have a
property to describe what mapping we want to use.

The i2c register access (and the whole behaviour of the device) is
constrained on the I2C_EN pin status, and you can't read it from the
device, so it's also something we need to have in the DT.

Maxime

--lhkfrzu56kvv4h74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoK0FwAKCRDj7w1vZxhR
xb5SAQC7C1i3V14Bm9Ek2IIKLRXmtEYsKcUrZ4FlRIjZRzvKtAEAy0aBt+rbc0v4
otC/OGrbBAmUt8Dp4qXiky4om9DL8ws=
=RIJA
-----END PGP SIGNATURE-----

--lhkfrzu56kvv4h74--
