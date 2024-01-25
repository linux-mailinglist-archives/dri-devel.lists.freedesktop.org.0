Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8606183BC00
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 09:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B520310F84D;
	Thu, 25 Jan 2024 08:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026EF10F84D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706171323; x=1737707323;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0o18t8f3/iC5wQSPwN+S8bs8VJQ/VDGiBZsmcwU/bDw=;
 b=BHmM4ValmvcLfJEJdTVonDwnRaHvkenAn/eeotq+kgyv0mEV5CkNGKnU
 0/grncAqtf14LO4p9k5KQSS9N8mV2iJ5vq6++L4IlaMTsp9slz7kFCAey
 huzXGMqgU6c9uqqYRMgiQyX0oy38z3U0CeVjzNlYMDdu6V+Fwy3bYRxeN
 SK+p+vkcXG/oNQw/9tDrlE+YvLECfCbRkD0JY397kxUsyTz9H2d95K8qh
 F4eVOBcpEuTt9pg9g2il21Zs2gqmByb0o1UD9EhVjJqFqHgLdgkI43q5e
 zURNnrSi12K51Pm7lJN9dxkNRmA6vc5M/GSr0JQD8qWg1kV+pjTQvS+3k g==;
X-CSE-ConnectionGUID: yWKH6XeGSSC8CBa5MkUWWA==
X-CSE-MsgGUID: /2Vw4AgiQCK4jHQhEACeAA==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; 
 d="asc'?scan'208";a="15276256"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jan 2024 01:28:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 01:28:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Jan 2024 01:28:32 -0700
Date: Thu, 25 Jan 2024 08:27:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <Dharma.B@microchip.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Message-ID: <20240125-proved-passage-7fa128f828db@wendy>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
 <20240118-recent-glorified-fd35d72e006e@spud>
 <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
 <20240119-character-mardi-43571d7fe7d5@wendy>
 <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
 <20240122-stark-duress-2f59294dcf27@spud>
 <4906b7e2-0ddb-4d3c-a48b-e16278f2d649@microchip.com>
 <20240124-lend-emerald-1028fe65cc39@spud>
 <c3c30bf2-e7c2-4861-bfdf-519a7afde476@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KV2dTBGvLz55uW11"
Content-Disposition: inline
In-Reply-To: <c3c30bf2-e7c2-4861-bfdf-519a7afde476@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev, airlied@gmail.com,
 sam@ravnborg.org, lee@kernel.org, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org,
 daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--KV2dTBGvLz55uW11
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > If the lvds pll is an input to the hlcdc, you need to add it here.
> >  From your description earlier it does sound like it is an input to
> > the hlcdc, but now you are claiming that it is not.
>=20
> The LVDS PLL serves as an input to both the LCDC and LVDSC

Then it should be an input to both the LCDC and LVDSC in the devicetree.

> with the=20
> LVDS_PLL multiplied by 7 for the Pixel clock to the LVDS PHY, and=20

Are you sure? The diagram doesn't show a multiplier, the 7x comment
there seems to be showing relations?

> LVDS_PLL divided by 7 for the Pixel clock to the LCDC.

> I am inclined to believe that appropriately configuring and enabling it=
=20
> in the LVDS driver would be the appropriate course of action.

We're talking about bindings here, not drivers, but I would imagine that
if two peripherals are using the same clock then both of them should be
getting a reference to and enabling that clock so that the clock
framework can correctly track the users.

> > I don't know your hardware, so I have no idea which of the two is
> > correct, but it sounds like the former. Without digging into how this
> > works my assumption about the hardware here looks like is that the lvds
> > controller is a clock provider,
>=20
> It's a PLL clock from PMC.
>=20
> > and that the lvds controller's clock is
> > an optional input for the hlcdc.
>=20
> Again it's a PLL clock from PMC.
>=20
> Please refer Section 39.3=20
> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductD=
ocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf

It is not the same exact clock as you pointed out above though, so the
by 7 divider should be modelled.

> > Can you please explain what provides the lvds pll clock and show an
> > example of how you think the devictree would look with "the lvds pll in
> > the lvds dt node"?
>=20
> Sure, Please see the below example
>=20
> The typical lvds node will look like
>=20
>                  lvds_controller: lvds-controller@f8060000 {
>                          compatible =3D "microchip,sam9x7-lvds";
>                          reg =3D <0xf8060000 0x100>;
>                          interrupts =3D <56 IRQ_TYPE_LEVEL_HIGH 0>;
>                          clocks =3D <&pmc PMC_TYPE_PERIPHERAL 56>, <&pmc=
=20
> PMC_TYPE_CORE PMC_LVDSPLL>;
>                          clock-names =3D "pclk", "lvds_pll_clk";
>                          status =3D "disabled";
>                  };

In isolation, this looks fine.

Cheers,
Conor.

--KV2dTBGvLz55uW11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbIbiwAKCRB4tDGHoIJi
0h+8AQCpYI71+drl2FDrbEGThmMOFS/iz1jS+CPJczvYePVUqwD/ZilClwywAcjj
BSSdZJ4KLwpHGZIe4dxZJbifZWhXPAY=
=rMTy
-----END PGP SIGNATURE-----

--KV2dTBGvLz55uW11--
