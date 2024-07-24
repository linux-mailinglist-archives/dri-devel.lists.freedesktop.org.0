Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF793B238
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 16:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1986610E6E1;
	Wed, 24 Jul 2024 14:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gkAUAM8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A2410E6B9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 14:03:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32A9FCE0AF8;
 Wed, 24 Jul 2024 14:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE92CC32781;
 Wed, 24 Jul 2024 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721829830;
 bh=O/+y/UtVZ2bDaLCFltamLCHQHJh35aLRK+efdWipark=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gkAUAM8P+xRwZ1NeEGewbzcM9Uo8Maepvr4aeF4J/nlCLmZP4N3ZeZXYjmB8jbbc9
 +9mk5yBaRvPdVpTzpOsKssq3KR+Ts4KGGt+wN7c5bJEkGwaO3mZLyotrAgCZrjZY5s
 QYdT7njfXcx4AB3mzgAdOyJg04p36v28cv29OWUel8SGNHIMA7+qlg8kiVvubC2uNg
 a1UPkYxIVU3OCvhEQpqNWdmKgHox5nAhxw+EdIqJyDyiVLxX0haWS7p87GTWb2wPIJ
 ok9FXatrtRZSzb6ywItrgkqXRTNPOkhl0dZu+1birhG/QtCh/av8Q5OEFKTVyZegJr
 DO1SGoPRzrOvA==
Date: Wed, 24 Jul 2024 16:03:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240724-mysterious-resilient-muskrat-7aff25@houat>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240627-display-quantum-48c2fa48ed1a@spud>
 <e9d53545-80fc-46d2-83a1-79842a729688@freebox.fr>
 <20240723-bounce-pliable-f81d8ea0cff8@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="upkro6rw6xcihwyi"
Content-Disposition: inline
In-Reply-To: <20240723-bounce-pliable-f81d8ea0cff8@spud>
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


--upkro6rw6xcihwyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 08:57:03PM GMT, Conor Dooley wrote:
> On Tue, Jul 23, 2024 at 05:17:12PM +0200, Marc Gonzalez wrote:
> > On 27/06/2024 18:25, Conor Dooley wrote:
> >=20
> > > On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
> > >
> > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > >> for power reduction. Several methods of power management are
> > >> implemented to reduce overall power consumption.
> > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > >> compensate for different lengths input cable or board traces.
> > >>
> > >> Features
> > >>
> > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > >> data rate, compatible with HDMI 2.0b electrical parameters
> > >> - DisplayPort dual-mode standard version 1.1
> > >> - Programmable fixed receiver equalizer up to 15.5dB
> > >> - Global or independent high speed lane control, pre-emphasis
> > >> and transmit swing, and slew rate control
> > >> - I2C or pin strap programmable
> > >> - Configurable as a DisplayPort redriver through I2C
> > >> - Full lane swap on main lanes
> > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > >>
> > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > >>
> > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > >> ---
> > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 +++++++++++=
+++++++++++
> > >>  1 file changed, 51 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp=
158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > >> new file mode 100644
> > >> index 0000000000000..21c8585c3bb2d
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > >> @@ -0,0 +1,51 @@
> > >> +# SPDX-License-Identifier: GPL-2.0-only
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: TI TDP158 HDMI to TMDS Redriver
> > >> +
> > >> +maintainers:
> > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: ti,tdp158
> > >> +
> > >> +  reg:
> > >> +    description: I2C address of the device
> > >=20
> > > Is reg not required? How do you communicate with the device if the i2c
> > > bus is not connected? Is the enable GPIO enough to operate it in some
> > > situations?
> > >=20
> > > Otherwise this looks good to me, but given Maxime commented about the
> > > complexity of the device, I'm probably out of my depth!
> >=20
> > Hello Conor,
> >=20
> > A cycle has been detected:
> > Above, you defer to Maxime.
> > Yet later, he wrote:
> > "DT maintainers have required that reg is always present"
>=20
> I think he was actually talking about Krzysztof.

I was.

> > I propose we NOT mark the "reg" property as required.
> > (Thus, keep the binding as proposed in v3.)
> >=20
> > Rationale:
> >=20
> > - The device can be statically configured by pin straps,
> > in which case it is NOT connected to an I2C bus.
>=20
> I'm inclined to say that, because connecting the i2c bus is not required
> at all for the device to be usable in some circumstances that we should
> not require reg. Someone could, in theory, use the device with a SoC
> without an i2c controller, right?
>=20
> > - Even if the device IS connected to an I2C bus,
> > no I2C accesses are required if the default configuration
> > meets the ODM's needs.
>=20
> In this case, I think a reg property is required actually, because it is
> on the bus, and devices on an i2c bus must have a reg property. That
> aside, even if the ODM doesn't want to change the defaults, the owner
> might.
>=20
> > Is that OK with you? Can I get your Amen?
>=20
> Sure.

We still have an entire sub-thread to this conversation that has been
completely ignored by Marc. Upstreaming is process where both sides need
to be involved, and I'm not seeing that so far.

So, yeah, until that other sub-thread is somewhat resolved, I don't see
how we can vet those bindings.

Maxime

--upkro6rw6xcihwyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqEJvgAKCRAnX84Zoj2+
dgmpAYDbRLtTGUTmlXDJIswJQAGw38HYIIWOc0s3wtlMM8zet3yeTgobIjlrnHlL
uZ8gDLwBgKAltB+vtFO7j/F8k5IKFDTm5y2BSfV0kq7bW4yI3CakTXu8KVTmngYn
wDLSylBHZw==
=3p8e
-----END PGP SIGNATURE-----

--upkro6rw6xcihwyi--
