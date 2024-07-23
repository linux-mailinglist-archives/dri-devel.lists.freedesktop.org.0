Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A1693A7E2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 21:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D5510E586;
	Tue, 23 Jul 2024 19:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SJ9N2AlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065F610E586
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 19:57:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E694F60DD7;
 Tue, 23 Jul 2024 19:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA3FC4AF09;
 Tue, 23 Jul 2024 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721764629;
 bh=6GyisGMMWTqJb0J2MvRmj6DjMSNitzmY3uf2SOHcka0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJ9N2AlICiYaJmyL8ODA1rY6n++1CJ5LuYUDeZE1iVkMXB/0RbMgtvp2lx5paTlXC
 o6MNFVsgEdO7FKf1Anb1oIOo57qrR748GcJxmYwtRxucv0XOlWlkhT84HLMoj5RiHY
 Uw8AiQYKcLpyv9yAoWCs5qiGu1/HT6tjW9QgTuoA8sG2QgtrM7uc08y4PRzXs8YG3J
 gBgW8eMbYPad1PZ4qHDfcjPVCeoJAkTFhsZsai3l9XLydAaBGm4V6/9zSMazkg2puL
 0DMJtAfA2z94lQqxv2ZaF/lDNmz2JApCrbWajLi8Qq5m0OO1sl5hjm3djWQC4LGyYU
 Tl9FLiGQqbq4g==
Date: Tue, 23 Jul 2024 20:57:03 +0100
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
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240723-bounce-pliable-f81d8ea0cff8@spud>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240627-display-quantum-48c2fa48ed1a@spud>
 <e9d53545-80fc-46d2-83a1-79842a729688@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tI2IJ38L9kmhKqI9"
Content-Disposition: inline
In-Reply-To: <e9d53545-80fc-46d2-83a1-79842a729688@freebox.fr>
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


--tI2IJ38L9kmhKqI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 05:17:12PM +0200, Marc Gonzalez wrote:
> On 27/06/2024 18:25, Conor Dooley wrote:
>=20
> > On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
> >
> >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> >> It supports 4 TMDS channels, HPD, and a DDC interface.
> >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> >> for power reduction. Several methods of power management are
> >> implemented to reduce overall power consumption.
> >> It supports fixed receiver EQ gain using I2C or pin strap to
> >> compensate for different lengths input cable or board traces.
> >>
> >> Features
> >>
> >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> >> data rate, compatible with HDMI 2.0b electrical parameters
> >> - DisplayPort dual-mode standard version 1.1
> >> - Programmable fixed receiver equalizer up to 15.5dB
> >> - Global or independent high speed lane control, pre-emphasis
> >> and transmit swing, and slew rate control
> >> - I2C or pin strap programmable
> >> - Configurable as a DisplayPort redriver through I2C
> >> - Full lane swap on main lanes
> >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> >>
> >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> >>
> >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> >> ---
> >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 +++++++++++++=
+++++++++
> >>  1 file changed, 51 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp15=
8.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >> new file mode 100644
> >> index 0000000000000..21c8585c3bb2d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >> @@ -0,0 +1,51 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: TI TDP158 HDMI to TMDS Redriver
> >> +
> >> +maintainers:
> >> +  - Arnaud Vrac <avrac@freebox.fr>
> >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: ti,tdp158
> >> +
> >> +  reg:
> >> +    description: I2C address of the device
> >=20
> > Is reg not required? How do you communicate with the device if the i2c
> > bus is not connected? Is the enable GPIO enough to operate it in some
> > situations?
> >=20
> > Otherwise this looks good to me, but given Maxime commented about the
> > complexity of the device, I'm probably out of my depth!
>=20
> Hello Conor,
>=20
> A cycle has been detected:
> Above, you defer to Maxime.
> Yet later, he wrote:
> "DT maintainers have required that reg is always present"

I think he was actually talking about Krzysztof.

> I propose we NOT mark the "reg" property as required.
> (Thus, keep the binding as proposed in v3.)
>=20
> Rationale:
>=20
> - The device can be statically configured by pin straps,
> in which case it is NOT connected to an I2C bus.

I'm inclined to say that, because connecting the i2c bus is not required
at all for the device to be usable in some circumstances that we should
not require reg. Someone could, in theory, use the device with a SoC
without an i2c controller, right?

> - Even if the device IS connected to an I2C bus,
> no I2C accesses are required if the default configuration
> meets the ODM's needs.

In this case, I think a reg property is required actually, because it is
on the bus, and devices on an i2c bus must have a reg property. That
aside, even if the ODM doesn't want to change the defaults, the owner
might.

> Is that OK with you? Can I get your Amen?

Sure.

--tI2IJ38L9kmhKqI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqALDwAKCRB4tDGHoIJi
0jh+AP9u8ZEH5hVvvCvRGra8iZ6dpbt0ZZjMWAd0jcsWuKtCAQD8DyrLRyc5cySR
CJO4+GDZkxrNsHJvaHuL2/bzqmuNig4=
=X93R
-----END PGP SIGNATURE-----

--tI2IJ38L9kmhKqI9--
