Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC3590C903
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1E210E630;
	Tue, 18 Jun 2024 11:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="0sDeS6Wh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2024 11:20:53 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79F610E642
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1718709653; x=1750245653;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n1uBEzddLoQxzz/zi7h7jNVb1T7Yuzm7uH8yjdAGoOg=;
 b=0sDeS6Wh1Ov++DG8XA5/kofH1QSl2TsdTk3Ollh5HgrqVXDWCy6tlzkG
 ynpZeAHpNePEsRxO4rAJq/px0B4u7WiOh3GWIyzpO5ymkTMGJspK1CMSP
 YIlALOizuR0J19eSI7Z2bpaGzLHjBYd2RQyztcsQmAsyKdVboBdSoSjSH
 yn73AyEzFmErwEdIdKrRKdVV0ZI5XhJa+4AlJoxD6tGhUOo9/KZBu2177
 KltQxTmUHdRL48ef66TV8mXxBV8sxAb6raoknKXXBCjS3LaRfmcXA4mjJ
 0+yaespfE/GGgfG+m3tlUSkdxzavop+9al/aC0Tef4vS2oHxUXqAXGojC w==;
X-CSE-ConnectionGUID: zYlIm9dBTaSY1wpJsScrNw==
X-CSE-MsgGUID: 4UpTHyHNTjSfIYFq8mQwRA==
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
 d="asc'?scan'208";a="195436468"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jun 2024 04:13:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 18 Jun 2024 04:13:43 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 18 Jun 2024 04:13:40 -0700
Date: Tue, 18 Jun 2024 12:13:22 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Ryan Walklin <ryan@testtoast.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI
 <kikuchan98@gmail.com>, Chris Morgan <macroalpha82@gmail.com>, Andre Przywara
 <andre.przywara@arm.com>, John Watts <contact@jookia.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240618-reverse-kinship-7f8df8c8e111@wendy>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
 <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
 <20240606-refreshing-cinnamon-ibex-a0fe73@houat>
 <20240606-authentic-mongoose-9485904a91a1@spud>
 <20240618-silky-holistic-oyster-bf59fe@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l3zryIkCRYabdmHC"
Content-Disposition: inline
In-Reply-To: <20240618-silky-holistic-oyster-bf59fe@houat>
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

--l3zryIkCRYabdmHC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 11:04:09AM +0200, Maxime Ripard wrote:
> Hi Conor,
>=20
> Sorry, I missed the news of you becoming a DT maintainer, so most of my
> previous points are obviously bogus. And congrats :)

I've been doing it for over a year, so news travels to some corners slowly
I guess. I'm not just being a pest in dozens of subsystems for fun!

> On Thu, Jun 06, 2024 at 12:51:33PM GMT, Conor Dooley wrote:
> > On Thu, Jun 06, 2024 at 01:23:03PM +0200, Maxime Ripard wrote:
> > > On Thu, Jun 06, 2024 at 11:37:31AM GMT, Neil Armstrong wrote:
> > > > On 06/06/2024 11:32, Maxime Ripard wrote:
> > > > > On Fri, May 31, 2024 at 09:12:14AM GMT, Ryan Walklin wrote:
> > > > > > The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display used in=
 a
> > > > > > number of handheld gaming devices made by Anbernic. By consensu=
s a
> > > > > > vendor prefix is not provided as the panel OEM is unknown.
> > > > >=20
> > > > > Where has this consensus been found?
> > > > >=20
> > > > > I had a look at the previous discussions, and I can't find any co=
nsensus
> > > > > being reached there. And for that kind of thing, having the ack or
> > > > > review of any of the DT maintainers would have been great.
> > > >=20
> > > > There was a consensus with Conor, this is why he acked v2, see
> > > > https://lore.kernel.org/all/20240525-velvet-citable-a45dd06847a7@sp=
ud/
> > >=20
> > > It's probably a matter of semantics here, but if it's with only one
> > > person, it's not a consensus but an agreement.
> > >=20
> > > > ```
> > > > I think if we genuinely do not know what the vendor is then we just
> > > > don't have a prefix.
> > > > ```
> > >=20
> > > And even then, I don't interpret Conor's statement as a formal agreem=
ent
> > > but rather an acknowledgment of the issue.
> >=20
> > I mean, I specifically left an r-b below that line in v2:
> > https://lore.kernel.org/all/20240530-satchel-playgroup-e8aa6937b8b9@spu=
d/
> >=20
> > I'm not a displays guy, so my sources were limited to what I could find
> > from search engines, but I spent some time looking for an actual vendor
> > of the panel and could not. All I found was various listings on places
> > like AliExpress that did not mention an manufacturer. I'd rather not
> > invent a vendor because we could not find the actual vendor of the
> > panel & it seemed rather unreasonable to block support for the device
> > on the basis of not being able to figure out the vendor. If you, as
> > someone knowledgeable on displays, can figure the vendor out, then
> > yeah we should definitely add it.
>=20
> It's still a bit surprising to me. We've merged[1][2][3][4], and are still
> merging[5], panels from this particular vendor that have no clearly
> identified OEMs. Just like any other panel, really. We almost *never*
> have the actual OEM, we just go with whatever is the easiest to identify
> it.

It wasn't (isn't?) clear to me that Abernic is even the vendor of the
panel, just that it works for their devices. If there's an established
policy here of making up vendors for these panels, then sure, override
me and use them as the prefix.

> Plus, if there ever is another WL-355608-A8 part from a completely
> unrelated vendor, then you'll have a naming clash with no clear
> indication about which is which.
>
> 1: https://lore.kernel.org/all/20230426143213.4178586-1-macroalpha82@gmai=
l.com/
> 2: https://lore.kernel.org/all/20231003163355.143704-1-macroalpha82@gmail=
=2Ecom/
> 3: https://lore.kernel.org/all/20231117202536.1387815-1-macroalpha82@gmai=
l.com/
> 4: https://lore.kernel.org/all/20231208154847.130615-1-macroalpha82@gmail=
=2Ecom/
> 5: https://lore.kernel.org/dri-devel/20240618081515.1215552-1-kikuchan98@=
gmail.com/



--l3zryIkCRYabdmHC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnFr0gAKCRB4tDGHoIJi
0nNKAP9FXUwcEobDw50Su/jD9Rq0NeMXmlICEhZpWrY+9SbnOQD+PCw5NPlSttJw
WrSOVuBE04SJhTvPItRO1kbqWM1eRwM=
=1CBj
-----END PGP SIGNATURE-----

--l3zryIkCRYabdmHC--
