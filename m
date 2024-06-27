Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48991AC67
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 18:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DB810E0ED;
	Thu, 27 Jun 2024 16:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hu1PvAP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6756E10E183
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:16:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62C0E61E1B;
 Thu, 27 Jun 2024 16:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C6AC2BBFC;
 Thu, 27 Jun 2024 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719504964;
 bh=K7c7Tx/3He/q87nxZHcjEEng/1qj921BjrT9VEi1+Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hu1PvAP6ZKVn0NLwjayviOkvW8z9WohVpCofjvKPM2XNBcoEXOFxaDSqRN4LK40pk
 WkKe59SHzoOeq/+ykXeFfp3pCIj9kbyhJr0ou2hc95d4f3aeutbzbmnngl9QrYNSvI
 IjL8Uxuy45qrXu1eQ7RNSPfXqVs2hbnwY6NhOYKxrXpnw/p3rhCXpDpEJBg/G1mqxn
 bkSdQ0gpxK/GVYsaiYFRpWNkQ7M33X1Y4leT7SnqYmUTGE6XmkS2149B7js2BjRKTj
 3plIuDo/xzIxR/qjDNnR+iz5gneAPR0+h/MM8eE6k6sL+XjPFrIvg9U8t/Z0QDgjbG
 qoKe3AaByLFWA==
Date: Thu, 27 Jun 2024 17:15:57 +0100
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
Message-ID: <20240627-headscarf-density-81bce4f05db4@spud>
References: <20240625-tdp158-v2-0-a3b344707fa7@freebox.fr>
 <20240625-tdp158-v2-1-a3b344707fa7@freebox.fr>
 <20240626-blah-unseated-6cab234bae61@spud>
 <d2012a93-911c-403e-b1c5-f01916a3200e@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="51j+MB7mBaap5O9i"
Content-Disposition: inline
In-Reply-To: <d2012a93-911c-403e-b1c5-f01916a3200e@freebox.fr>
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


--51j+MB7mBaap5O9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 07:20:46PM +0200, Marc Gonzalez wrote:
> On 26/06/2024 18:08, Conor Dooley wrote:
>=20
> > On Tue, Jun 25, 2024 at 06:38:12PM +0200, Marc Gonzalez wrote:
> >
> >> The TI TDP158 is an HDMI to TMDS Redriver.
> >>
> >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> >> ---
> >>  .../bindings/display/bridge/ti,tdp158.yaml         | 48 +++++++++++++=
+++++++++
> >>  1 file changed, 48 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp15=
8.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >> new file mode 100644
> >> index 0000000000000..b687699e2ba80
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >> @@ -0,0 +1,48 @@
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
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: ti,tdp158
> >> +
> >> +  reg:
> >> +    description: I2C address of the device
> >> +
> >> +  enable-gpios:
> >> +    description: GPIO controlling bridge enable
> >> +
> >> +  vcc-supply:
> >> +    description: Power supply 3.3V
> >> +
> >> +  vdd-supply:
> >> +    description: Power supply 1.1V
> >=20
> > Are these supplies not also required? Surely the device needs the power
> > to function?
>=20
> Maybe if the hamsters spin fast enough in their wheels,
> these supplies won't be required? :)
>=20
> The reason I hesitated to mark them as required,
> is because the HW engineer told us that on our board
> they were connected to a power line that is shared
> between several functional blocks.
>=20
> I suppose that's not a reason?

Then all of those blocks should have their supplies described in the
devicetree! FWIW, if you don't put them in your dts, you'll get
validation failures but the regulator core will produce dummy regulators
so your driver should "just workTM". I'd suggest that you add the
supplies though to these other functional blocks so that the OS can
manage them properly.

> Required means "device doesn't work if they're not connected" ?

Correct.

Thanks,
Conor.


--51j+MB7mBaap5O9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2QPQAKCRB4tDGHoIJi
0i6XAQChdyjhbaQztpw+CtTA1/jCwob7Fi1bMxWkvk9HlRCwTgEAvCKfze8ePxUC
qM4DvTLH0GmtnZV0kZoAeKfijK9ngww=
=+dA0
-----END PGP SIGNATURE-----

--51j+MB7mBaap5O9i--
