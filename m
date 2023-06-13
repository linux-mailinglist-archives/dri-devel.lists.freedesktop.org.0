Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D872EAC1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115F10E3D8;
	Tue, 13 Jun 2023 18:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2DE10E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:21:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6FCA62EBD;
 Tue, 13 Jun 2023 18:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A444BC433F0;
 Tue, 13 Jun 2023 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686680492;
 bh=JbA/OIPZczrs6+hrFo3waVWa5we5btG8RcPcykOUAAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FdR1amv9ArUBADECJrhV1TrtcpF7JIExxEbZjZVWWGBw95umvWUa4OKPe5tSXICx6
 /VoV9VrkbVD51MFKSV71HOtePjpV1bNvrO4amZX+E6U0bTz1KDA9ca7rBK7QhOmisp
 ZFzsc6BIK7SVahDUd4FIXJ4xE1FU+4LXZFj9jqrPn1KXE506lzdHN6yCN6wCZdwhFW
 ygRTg7NIaPREKbelKUkC6b4BPV5SoDV8W3giMk+bVatF5OUHMCPsMrjhIncsaF6/K5
 SX7+ACXEsAx3IY1SfvGrL1Bo+MGKB7nWdpWS8D0yPYRayv3uwpaXsqAqOvQNOe2tok
 TisDqghK9DYSQ==
Date: Tue, 13 Jun 2023 19:21:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Message-ID: <20230613-slider-coherent-d508d67afc91@spud>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-2-manikandan.m@microchip.com>
 <a0b059d1-df4d-10ce-fb7c-7acea0a20793@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iQJwmfp/Oz6KiCqX"
Content-Disposition: inline
In-Reply-To: <a0b059d1-df4d-10ce-fb7c-7acea0a20793@linaro.org>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hari.PrasathGE@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 Varshini.Rajendran@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, lee@kernel.org,
 Dharma.B@microchip.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh+dt@kernel.org, Durai.ManickamKR@microchip.com,
 linux-arm-kernel@lists.infradead.org, Balakrishnan.S@microchip.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iQJwmfp/Oz6KiCqX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:17:13PM +0200, Krzysztof Kozlowski wrote:
> On 13/06/2023 09:04, Manikandan Muralidharan wrote:
> > Add new compatible string for the XLCD controller on SAM9X7 SoC.
> >=20
> > Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt b/Do=
cumentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> > index 5f8880cc757e..7c77b6bf4adb 100644
> > --- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> > +++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> > @@ -8,6 +8,7 @@ Required properties:
> >     "atmel,sama5d3-hlcdc"
> >     "atmel,sama5d4-hlcdc"
> >     "microchip,sam9x60-hlcdc"
> > +   "microchip,sam9x7-xlcdc"
>=20
> Google says sam9x7 is a series, not a SoC. Please add compatibles for
> specific SoCs, not for series.

We had this one a few weeks ago, see
https://lore.kernel.org/all/add5e49e-8416-ba9f-819a-da944938c05f@microchip.=
com/
and its parents. Outcome of that seemed to be that using "sam9x7" was fine.

--iQJwmfp/Oz6KiCqX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIizpQAKCRB4tDGHoIJi
0taPAP9mfEFbmWZH97Xic24LzvzkZr/xL3arGzQUX+b5NcVxXwEA49L2IEZg8BGI
oZKsWMxtmZW0Ilm5EKx0KsafXgngkQ8=
=gUpc
-----END PGP SIGNATURE-----

--iQJwmfp/Oz6KiCqX--
