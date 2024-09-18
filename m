Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE197B8F3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 10:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CB510E084;
	Wed, 18 Sep 2024 08:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vKz6pjT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D6510E084
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 08:04:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2BF69A4367C;
 Wed, 18 Sep 2024 08:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40932C4CEC3;
 Wed, 18 Sep 2024 08:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726646689;
 bh=CQpaFzysb4OVegJAA2SGpwkBi1FpniqWiux2/BwVPz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vKz6pjT8tQ7gXW4b12FNAM0Ow63owPjNv97x/c0DbBnxpIX72WC0RV7AeZd16B8YD
 yaSYyZQAxwVQtg77ATahJhS87G2rTF5nKYhEr/9Spb0F72Lci81jAntvdo8AES88fa
 JR30B13QFSArCwPjNCbZFJWOFa7thHqJgWWtaCsz4jfDoGLoVxor547dfauqpnEXtT
 Z4UIT9udfbB4gBP6fJ0jfgzt+pRdLcQRsfXee92bUdCBGzJMN0nu+HLQOsyjyuU/Um
 fC40NpYA5HvvAMjqxlYYkiaC1yLhBvBg5gkc98f4SUnQG18yvKxRR2WoFwkN/H1Cec
 EqZ/UUaigKcKw==
Date: Wed, 18 Sep 2024 09:04:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan.M@microchip.com
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@armlinux.org.uk,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, arnd@arndb.de, geert+renesas@glider.be,
 mpe@ellerman.id.au, rdunlap@infradead.org, Dharma.B@microchip.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add
 sam9x75-mipi-dsi binding
Message-ID: <20240918-concert-liability-fab83f411cfa@squawk>
References: <20240814105256.177319-1-manikandan.m@microchip.com>
 <20240814105256.177319-2-manikandan.m@microchip.com>
 <20240814-anaerobic-unpainted-532b8b117b79@spud>
 <5cb63b40-9710-4a6d-984d-1be1394dcb63@microchip.com>
 <20240917-verdict-nativity-3b84cc3457cc@squawk>
 <d343d34e-f810-4375-882e-d74f104ce215@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wyxYEbU3SQR8ONJ3"
Content-Disposition: inline
In-Reply-To: <d343d34e-f810-4375-882e-d74f104ce215@microchip.com>
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


--wyxYEbU3SQR8ONJ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 03:00:45AM +0000, Manikandan.M@microchip.com wrote:
> On 17/09/24 6:08 pm, Conor Dooley wrote:
> > On Tue, Sep 17, 2024 at 03:16:53AM +0000,Manikandan.M@microchip.com  wr=
ote:
> >> Hi Conor,
> >>
> >> On 14/08/24 7:29 pm, Conor Dooley wrote:
> >>> On Wed, Aug 14, 2024 at 04:22:53PM +0530, Manikandan Muralidharan wro=
te:

> >>>> +  microchip,sfr:
> >>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>> +    description:
> >>>> +      phandle to Special Function Register (SFR) node.To enable the=
 DSI/CSI
> >>>> +      selection bit in SFR's ISS Configuration Register.
> >>> I'm curious - why is this phandle required? How many SFR nodes are th=
ere
> >>> on the platform?
> >> This phandle is to map the memory region of SFR node and configure the
> >> DSI bit in the SFR's ISS configuration register.
> >> currently there is only one SFR node in this platform.
> > What does "currently" mean? The platform either has one or it does not,
> > currently makes it sound like it has more than one but the dts only has
> > one.
> Apologies, I would like to clarify the statement that this platform only=
=20
> has one 32-bit special function register implemented.

In that case, you dont need a phandle at all, just look the sfr up by
its compatible.

--wyxYEbU3SQR8ONJ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuqJnwAKCRB4tDGHoIJi
0ix4AQChrfrTy2bNfbi7J9Cmvc0AkOrqd4lC8oOBGlzlXXvbeAD1HqbkyJyyxQph
0xKmWJd1OCZWfCk7wGtjmG795nIHAA==
=/n4k
-----END PGP SIGNATURE-----

--wyxYEbU3SQR8ONJ3--
