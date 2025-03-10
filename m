Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D1A59050
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03C110E3E5;
	Mon, 10 Mar 2025 09:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e7FE5Dfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E2B10E3E5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:53:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DEF43A449E7;
 Mon, 10 Mar 2025 09:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450ADC4CEE5;
 Mon, 10 Mar 2025 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741600396;
 bh=C8cQBoSLgcQl6tmD3Xal2tFbWst3CZYzZlbhfgxnR8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e7FE5DfzHboSIvO5aiHAlSQ6D2hWo3tT4t6XteTOws1h+83pp7enNxpUqjQ7UylSL
 bmjDnqykEs7XyNzSI/QQfptktGsTuvXWOzBLfd98Xb8mos7gElcihUuPu6TS5aF/Og
 2jiuUHYqsg4Qk4zb0P391BlcP6FNMA83O0cIXVphEkHMrqcuh7KerRZjoGADBZV7SR
 RCwVyZS/sdGx0xvFGB/d11mPyszuAkA3y6VX9tvAkw/IGeqYCFtRYO4KMZQBt+FRpb
 WlUlrSZn2MLnYS6MZQVn7NQ7F7Wm5vSWr0d4Rv3sYI9afbf1bbO61fOHv9uF8v4bik
 7y177l72prllw==
Date: Mon, 10 Mar 2025 10:53:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
Message-ID: <20250310-orthodox-unyielding-kagu-decaf9@houat>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304152320.GA2630063-robh@kernel.org>
 <1891036.atdPhlSkOF@steina-w>
 <20250305163805.GA2071011-robh@kernel.org>
 <7d98163d-10c8-457d-92e7-6a1d6e379beb@nxp.com>
 <20250306-kangaroo-of-pastoral-typhoon-8aefb2@houat>
 <20250306203444.GA570402-robh@kernel.org>
 <3836a4d2-ef4e-427e-a820-39dd4823458b@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nokzvrads2o637d3"
Content-Disposition: inline
In-Reply-To: <3836a4d2-ef4e-427e-a820-39dd4823458b@nxp.com>
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


--nokzvrads2o637d3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
MIME-Version: 1.0

On Fri, Mar 07, 2025 at 11:25:40AM +0800, Liu Ying wrote:
> On 03/07/2025, Rob Herring wrote:
> > On Thu, Mar 06, 2025 at 12:35:49PM +0100, Maxime Ripard wrote:
> >> On Thu, Mar 06, 2025 at 03:02:41PM +0800, Liu Ying wrote:
> >>> On 03/06/2025, Rob Herring wrote:
> >>>> On Wed, Mar 05, 2025 at 10:35:26AM +0100, Alexander Stein wrote:
> >>>>> Hi,
> >>>>>
> >>>>> Am Dienstag, 4. M=E4rz 2025, 16:23:20 CET schrieb Rob Herring:
> >>>>>> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
> >>>>>>> A DPI color encoder, as a simple display bridge, converts input D=
PI color
> >>>>>>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1=
] which
> >>>>>>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low =
padding
> >>>>>>> bits in every color component though). Document the DPI color enc=
oder.
> >>>>>>
> >>>>>> Why do we need a node for this? Isn't this just wired how it is wi=
red=20
> >>>>>> and there's nothing for s/w to see or do? I suppose if you are try=
ing to=20
> >>>>>> resolve the mode with 24-bit on one end and 18-bit on the other en=
d, you=20
> >>>>>> need to allow that and not require an exact match. You still might=
 need=20
> >>>>>> to figure out which pins the 18-bit data comes out on, but you hav=
e that=20
> >>>>>> problem with an 18-bit panel too. IOW, how is this any different i=
f you=20
> >>>>>> have an 18-bit panel versus 24-bit panel?
> >>>>>
> >>>>> Especially panel-simple.c has a fixed configuration for each displa=
y, such as:
> >>>>>> .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18
> >>>>>
> >>>>> How would you allow or even know it should be addressed as
> >>>>> MEDIA_BUS_FMT_RGB888_1X24 instead? I see different ways:
> >>>>> 1. Create a new display setting/compatible
> >>>>> 2. Add an overwrite property to the displays
> >>>>> 3. Use a (transparent) bridge (this series)
> >>>>>
> >>>>> Number 1 is IMHO out of question.=20
> >>>>
> >>>> Agreed.
> >>>>
> >>>>> I personally don't like number 2 as this
> >>>>> feels like adding quirks to displays, which they don't have.
> >>>>
> >>>> This is what I would do except apply it to the controller side. We k=
now=20
> >>>> the panel side already. This is a board variation, so a property mak=
es=20
> >>>> sense. I don't think you need any more than knowing what's on each e=
nd.=20
> >>>
> >>> With option 2, no matter putting a property in source side or sink si=
de,
> >>> impacted display drivers and DT bindings need to be changed, once a b=
oard
> >>> manipulates the DPI color coding.  This adds burdens and introduces n=
ew
> >>> versions of those DT bindings.  Is this what we want?
> >>
> >> There's an option 4: make it a property of the OF graph endpoints. In
> >> essence, it's similar to properties that are already there like
> >> lane-mapping, and it wouldn't affect the panel drivers, or create an
> >> intermediate bridge.
> >=20
> > Yes, that's actually where I meant to put the property(ies).
>=20
> Put optional dpi-color-coding or something else in endpoint-base?

I'm not sure what you mean by endpoint base, but it would be just like
data-lanes, on the endpoint itself, right next to remote-endpoint. Given
the nomenclature we have, something like "color-format" or
"color-encoding", and taking the media format bus as value.

> Assuming it's optional, then it implies that it will overwrite OS's
> setting, which sounds kinda awkward, because it is supposed to be
> required to describe the actual color coding.

I'm sorry, I don't understand what you mean here. Your bridge would have
been optional as well, right?

Worst case scenario, your driver could make that property mandatory on
its endpoints. Plenty of drivers are doing it.

Maxime

--nokzvrads2o637d3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ862iQAKCRDj7w1vZxhR
xfjPAP9Q21oDiutNW4kjM5Uqr1gdJjlndAkKPdt4WIFvmF8NagD7BJzqcRLgcvQ2
oQiFDp8F/4TL/si8mNvOwh7oIGZonwo=
=j0ea
-----END PGP SIGNATURE-----

--nokzvrads2o637d3--
