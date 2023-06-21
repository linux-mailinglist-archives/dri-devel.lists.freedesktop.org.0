Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A2738FB3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 21:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF30D10E34E;
	Wed, 21 Jun 2023 19:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A803810E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 19:12:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A04BE6162C;
 Wed, 21 Jun 2023 19:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BBCC433C0;
 Wed, 21 Jun 2023 19:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687374751;
 bh=pvCW0ClizpVygxK7cLsFvnijZg0ttHOEE9V2jUKQpgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oHL9+XIgNaaOilNmMrifzgvsqMAt/28ocdOB2oS9N75pxCDkggkVGFVcp5CObbkkP
 NbwVU7rrIPvSYFWHFpuOKBGp56aOE30dPo7wGq+KLJzMXRq6R25Ra9UClqYyb+3KYr
 AwCzyup08Mpeo4vw0G/b2iZpv97eKWfZBarkjrOoJd72LjmGOJ5+4zbnY9lfWRwZUZ
 00SAkjcmvY++1Vi0cbSFj7GrVB40e6CnWKKDXT9TxnqGWNehXMH1OMsK8h0kM4wh5D
 w0DMeItYBJD68kX4TYgu6DUK4oxYrbdK61Rl+Ji2FRGAQMpEOE/qQH407qWB951RmN
 yh/lXrNNDJg/w==
Date: Wed, 21 Jun 2023 20:12:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 2/9] mfd: atmel-hlcdc: Add compatible for SAM9X7 HLCD
 controller
Message-ID: <20230621-pampers-dial-07b6c3e7602a@spud>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-3-manikandan.m@microchip.com>
 <20230621175645.GR10378@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zsZwVK0nRU6jEjva"
Content-Disposition: inline
In-Reply-To: <20230621175645.GR10378@google.com>
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
Cc: alexandre.belloni@bootlin.com, Nayabbasha.Sayed@microchip.com,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 Hari.PrasathGE@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 Varshini.Rajendran@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, Dharma.B@microchip.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, robh+dt@kernel.org,
 Durai.ManickamKR@microchip.com, linux-arm-kernel@lists.infradead.org,
 Balakrishnan.S@microchip.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zsZwVK0nRU6jEjva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 06:56:45PM +0100, Lee Jones wrote:
> On Tue, 13 Jun 2023, Manikandan Muralidharan wrote:
>=20
> > Add compatible for SAM9X7 HLCD controller.
> >=20
> > Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> > ---
> >  drivers/mfd/atmel-hlcdc.c | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Applied, thanks

Hmm, Nicolas pointed out that this compatible is likely insufficient,
and it'll likely need to be sam9x70 & sam9x75 as there are differences
between what each of these SoCs support.
https://lore.kernel.org/all/ef09246c-9220-4c71-4ac2-2792d9ca519d@microchip.=
com/
I guess it doesn't really matter, since the binding didn't get applied
and what's in the driver can be arbitrarily changed?

Cheers,
Conor.

--zsZwVK0nRU6jEjva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJNLmAAKCRB4tDGHoIJi
0vYDAQCrn4A14yblpV2uYnp7eJiwUWDuCmKo5+fc3VkNOrvitQEA5QIV7hQdQCRR
lzZK9jhg9rQhq32EGUiTjXEFKLzAKQw=
=/8eC
-----END PGP SIGNATURE-----

--zsZwVK0nRU6jEjva--
