Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE590C525
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDEF10E5E3;
	Tue, 18 Jun 2024 09:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mxacwh8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9B710E5E3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:04:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8BF7DCE147B;
 Tue, 18 Jun 2024 09:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69735C4AF1A;
 Tue, 18 Jun 2024 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718701451;
 bh=2Lu5aSmINCBVk6WqvBkdisoVRAKEwJjOlaRIvMyOS3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mxacwh8cdFIVC8BQFcEwgwWaIUE2riQls7fpXtIZ6cqCqBgjkoag0TZUP4Ho9VjtO
 z+xVYWFGKn9/3k6992ant9SOHTpBs+ppZr0iD0tWwmeCkleLAnhloxCGdBTuaI+650
 wzbP1e0UU/vN11VVu5Wr0/26YqqTIa9+nHDaqiMmRhF4YNbGnM0Nv2t7NIZ+XlU9cH
 FKWB5aChFdjO+4l38drp9o456ihzuv3znrsiQ3/BMTKSTnV14mhSiVWPk/lr6LqQQt
 9jXV8nS9ZFV8eKf35pCcIoieAXc+dDLc2mruUOFbrQuFXe5On4hiLhZS5diPCFvJpa
 n4wCfyO15t6Uw==
Date: Tue, 18 Jun 2024 11:04:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Chris Morgan <macroalpha82@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 John Watts <contact@jookia.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240618-silky-holistic-oyster-bf59fe@houat>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
 <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
 <20240606-refreshing-cinnamon-ibex-a0fe73@houat>
 <20240606-authentic-mongoose-9485904a91a1@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p7klevgvv277nvt2"
Content-Disposition: inline
In-Reply-To: <20240606-authentic-mongoose-9485904a91a1@spud>
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


--p7klevgvv277nvt2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Sorry, I missed the news of you becoming a DT maintainer, so most of my
previous points are obviously bogus. And congrats :)

On Thu, Jun 06, 2024 at 12:51:33PM GMT, Conor Dooley wrote:
> On Thu, Jun 06, 2024 at 01:23:03PM +0200, Maxime Ripard wrote:
> > On Thu, Jun 06, 2024 at 11:37:31AM GMT, Neil Armstrong wrote:
> > > On 06/06/2024 11:32, Maxime Ripard wrote:
> > > > On Fri, May 31, 2024 at 09:12:14AM GMT, Ryan Walklin wrote:
> > > > > The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display used in a
> > > > > number of handheld gaming devices made by Anbernic. By consensus a
> > > > > vendor prefix is not provided as the panel OEM is unknown.
> > > >=20
> > > > Where has this consensus been found?
> > > >=20
> > > > I had a look at the previous discussions, and I can't find any cons=
ensus
> > > > being reached there. And for that kind of thing, having the ack or
> > > > review of any of the DT maintainers would have been great.
> > >=20
> > > There was a consensus with Conor, this is why he acked v2, see
> > > https://lore.kernel.org/all/20240525-velvet-citable-a45dd06847a7@spud/
> >=20
> > It's probably a matter of semantics here, but if it's with only one
> > person, it's not a consensus but an agreement.
> >=20
> > > ```
> > > I think if we genuinely do not know what the vendor is then we just
> > > don't have a prefix.
> > > ```
> >=20
> > And even then, I don't interpret Conor's statement as a formal agreement
> > but rather an acknowledgment of the issue.
>=20
> I mean, I specifically left an r-b below that line in v2:
> https://lore.kernel.org/all/20240530-satchel-playgroup-e8aa6937b8b9@spud/
>=20
> I'm not a displays guy, so my sources were limited to what I could find
> from search engines, but I spent some time looking for an actual vendor
> of the panel and could not. All I found was various listings on places
> like AliExpress that did not mention an manufacturer. I'd rather not
> invent a vendor because we could not find the actual vendor of the
> panel & it seemed rather unreasonable to block support for the device
> on the basis of not being able to figure out the vendor. If you, as
> someone knowledgeable on displays, can figure the vendor out, then
> yeah we should definitely add it.

It's still a bit surprising to me. We've merged[1][2][3][4], and are still
merging[5], panels from this particular vendor that have no clearly
identified OEMs. Just like any other panel, really. We almost *never*
have the actual OEM, we just go with whatever is the easiest to identify
it.

Plus, if there ever is another WL-355608-A8 part from a completely
unrelated vendor, then you'll have a naming clash with no clear
indication about which is which.

Maxime

1: https://lore.kernel.org/all/20230426143213.4178586-1-macroalpha82@gmail.=
com/
2: https://lore.kernel.org/all/20231003163355.143704-1-macroalpha82@gmail.c=
om/
3: https://lore.kernel.org/all/20231117202536.1387815-1-macroalpha82@gmail.=
com/
4: https://lore.kernel.org/all/20231208154847.130615-1-macroalpha82@gmail.c=
om/
5: https://lore.kernel.org/dri-devel/20240618081515.1215552-1-kikuchan98@gm=
ail.com/

--p7klevgvv277nvt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnFNiAAKCRDj7w1vZxhR
xTjLAQCbSznFNSaTDELJw2cyFvcFo6WuegJ22APcuEASspXmYgEA230nYNw/QP+8
VEfFU7rJtXOOsGPo+twnK3G1aV30agQ=
=5pkb
-----END PGP SIGNATURE-----

--p7klevgvv277nvt2--
