Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3C58FE547
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F55410E8EA;
	Thu,  6 Jun 2024 11:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ahZuNJhu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B539310E8EA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 11:24:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 510E2CE1B1B;
 Thu,  6 Jun 2024 11:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A31C4AF0E;
 Thu,  6 Jun 2024 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717672986;
 bh=EDhiJivZreO9d0/qonxCfwRWsq4IzCERJAQDg+Bsxgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ahZuNJhuFcU80SKjffOkSB+akHM3EIbytnw7Y7Y9ZV0KdpAYd0p7vO513lWGp3nXv
 2DfE1zeCu4TRhctzMc55xSz9GHhPKVPDRIfdIeORU91a+VRFAgCRTAGKOqOVgjuyJ8
 n0wYnk0FUZ+QsVKMhRCgv0uhNEEKUkrbM5A6dw5qBsppDNnkXZWcnUmAOZvlAtNBb/
 PakHncmBM5mPsZ4VpRoZMlY9cGDCubO14h5NIpKu5qMOAH6jHRQVeWv4NS6JF5nwpO
 wY/S8I/7qTI/zaIn4Dt/EfPssVptOVGOeudNtGQ40KBdXlYn8lCZfRaCSKOYWYTzqA
 /MXrQZa9BRUHg==
Date: Thu, 6 Jun 2024 13:23:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Hironori KIKUCHI <kikuchan98@gmail.com>, Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>, 
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240606-refreshing-cinnamon-ibex-a0fe73@houat>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
 <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="q3hiu4dcyk7yygm2"
Content-Disposition: inline
In-Reply-To: <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
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


--q3hiu4dcyk7yygm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 11:37:31AM GMT, Neil Armstrong wrote:
> On 06/06/2024 11:32, Maxime Ripard wrote:
> > On Fri, May 31, 2024 at 09:12:14AM GMT, Ryan Walklin wrote:
> > > The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display used in a
> > > number of handheld gaming devices made by Anbernic. By consensus a
> > > vendor prefix is not provided as the panel OEM is unknown.
> >=20
> > Where has this consensus been found?
> >=20
> > I had a look at the previous discussions, and I can't find any consensus
> > being reached there. And for that kind of thing, having the ack or
> > review of any of the DT maintainers would have been great.
>=20
> There was a consensus with Conor, this is why he acked v2, see
> https://lore.kernel.org/all/20240525-velvet-citable-a45dd06847a7@spud/

It's probably a matter of semantics here, but if it's with only one
person, it's not a consensus but an agreement.

> ```
> I think if we genuinely do not know what the vendor is then we just
> don't have a prefix.
> ```

And even then, I don't interpret Conor's statement as a formal agreement
but rather an acknowledgment of the issue.

> I agree with Conor so I applied the patchset after Connor reviewed it and=
 the comment was fixed in v3:
> https://lore.kernel.org/all/20240530-satchel-playgroup-e8aa6937b8b9@spud/

Yeah, I know. Still, it's a major deviation to what we've always been
doing, getting the DT maintainers voice on that would have been a good
idea.

Maxime

--q3hiu4dcyk7yygm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZmGcFgAKCRAnX84Zoj2+
dkUYAYCXwrDgo1KATTDcFdJY/lwZcLjYhGqWZbadZKZqSt1Nq6v60CtI5x6SUjKm
kAWhuLYBgOMMP9FddW2uvd89ISvKRiJGtQ6AKVTmRa3PvGN4tElI4Htdmm+A+u7A
BdBvxbKM2w==
=lcBK
-----END PGP SIGNATURE-----

--q3hiu4dcyk7yygm2--
