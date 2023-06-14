Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F49872FA2D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 12:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B6A10E438;
	Wed, 14 Jun 2023 10:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100C710E438
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686737526; x=1718273526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uD8/gYwMDSCsMRFNcUWFBwbUbtR8k/3vS7WndAmhn9w=;
 b=XHybbfAdFOSYpni1dXvz0iyWCAUZC4UjZXtYp0ARdhVLO+kcugO6yQCj
 yaQXlB9MA48xqJ9h3K/R/bkDdE4iPXzrb+MegLaybSD9h1LgLdgkD2SnL
 dTMrAvQ+GdtXozenTM2gae0pczp9N4SqBPLSOgEGtHsaYmZLVq2hu02qM
 cxtDpJn3kG8uAZdeIW+ynmjOc3lljpPxeJu0NCMJ0Exb2/siw+8Chfi/g
 /YDa9LOHavdkehjuZy5CUJe3iY2NoyUMzMr7dGZ+VZmgVbEHIopkKLpIq
 fy33GOIkXOAunxyuDtYxc3maLD7T8IMu+MKzuPTujYM/laT8+SMYSWs0b g==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
 d="asc'?scan'208";a="218425827"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jun 2023 03:12:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 03:12:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 14 Jun 2023 03:11:56 -0700
Date: Wed, 14 Jun 2023 11:11:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Message-ID: <20230614-sterling-staff-5c9c03392a2c@wendy>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-2-manikandan.m@microchip.com>
 <20230613-scouting-barricade-56cadb14657c@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MxL6TWAcPPWIl+0J"
Content-Disposition: inline
In-Reply-To: <20230613-scouting-barricade-56cadb14657c@spud>
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

--MxL6TWAcPPWIl+0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 07:18:25PM +0100, Conor Dooley wrote:
> On Tue, Jun 13, 2023 at 12:34:18PM +0530, Manikandan Muralidharan wrote:
> > Add new compatible string for the XLCD controller on SAM9X7 SoC.
>=20
> You should probably indicate here why this is not compatible with the
> existing SoCs that are supported. To hazard a guess, it is the HLCDC IP
> (I forget the exact letters!)?

Manikandan pointed out off list that this was not clear.
Looking at it again, I think I actually truncated my sentence - it
should've been something like "it is the HLCDC IP ... is not a subset of
the XLCDC IP." Sorry for that Manikandan.

> If so,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Cheers,
> Conor.
>=20
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
> >   - reg: base address and size of the HLCDC device registers.
> >   - clock-names: the name of the 3 clocks requested by the HLCDC device.
> >     Should contain "periph_clk", "sys_clk" and "slow_clk".
> > --=20
> > 2.25.1
> >=20



--MxL6TWAcPPWIl+0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZImSUwAKCRB4tDGHoIJi
0nVyAQDnv7lrFojIn1tU/unzTD77IuY5h3hrvcCGgDe30HmP4QD8D+26ukUo6Woe
6Krnu+i2ZCkcn7QoUXiR9c179UNQ6w8=
=TYyE
-----END PGP SIGNATURE-----

--MxL6TWAcPPWIl+0J--
