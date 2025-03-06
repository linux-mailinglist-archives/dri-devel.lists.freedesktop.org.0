Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093AEA54989
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 12:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52E010E945;
	Thu,  6 Mar 2025 11:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t0ZjVSbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A3A10E945
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 11:35:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C1E525C4724;
 Thu,  6 Mar 2025 11:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD17C4CEE0;
 Thu,  6 Mar 2025 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741260952;
 bh=Leu1gIlGz01KC2qXmkX9EuXv0fktHfYgkAuj3cjXmYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t0ZjVSbHtMk/AGk/0+5zsZZmWz1J7zYKKn+hgJMgEH/5yGLibX4OccWyYTsj6JiFn
 8uT1wq0eVoMClAebU6guvInopQZS8/Z7J88QvR4dOVuk18BEu/PWpZR3tzmot/iiO/
 mbda0FdpDb2a0eZe48pUemGsg1lyySxbs+kaP6TFgD7xicZK4+X30SBzNQ/3G4AHuR
 LK4tmDjTqwl6YLhd6bVVOZWyQ0nFwnzYBLXnhXzO/FcR6W8DYoBXYhi7SjrzKVE8a9
 wfABHD6hbH43LxKxNNbnRiWgm2tZKFRvVltOdPlqRzWkHne7xu2MAfN/j6QBtwBqEp
 aIerDMl4OwgAA==
Date: Thu, 6 Mar 2025 12:35:49 +0100
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
Message-ID: <20250306-kangaroo-of-pastoral-typhoon-8aefb2@houat>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304152320.GA2630063-robh@kernel.org>
 <1891036.atdPhlSkOF@steina-w>
 <20250305163805.GA2071011-robh@kernel.org>
 <7d98163d-10c8-457d-92e7-6a1d6e379beb@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qxu4bxugckchmvib"
Content-Disposition: inline
In-Reply-To: <7d98163d-10c8-457d-92e7-6a1d6e379beb@nxp.com>
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


--qxu4bxugckchmvib
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
MIME-Version: 1.0

On Thu, Mar 06, 2025 at 03:02:41PM +0800, Liu Ying wrote:
> On 03/06/2025, Rob Herring wrote:
> > On Wed, Mar 05, 2025 at 10:35:26AM +0100, Alexander Stein wrote:
> >> Hi,
> >>
> >> Am Dienstag, 4. M=E4rz 2025, 16:23:20 CET schrieb Rob Herring:
> >>> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
> >>>> A DPI color encoder, as a simple display bridge, converts input DPI =
color
> >>>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] w=
hich
> >>>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low pad=
ding
> >>>> bits in every color component though). Document the DPI color encode=
r.
> >>>
> >>> Why do we need a node for this? Isn't this just wired how it is wired=
=20
> >>> and there's nothing for s/w to see or do? I suppose if you are trying=
 to=20
> >>> resolve the mode with 24-bit on one end and 18-bit on the other end, =
you=20
> >>> need to allow that and not require an exact match. You still might ne=
ed=20
> >>> to figure out which pins the 18-bit data comes out on, but you have t=
hat=20
> >>> problem with an 18-bit panel too. IOW, how is this any different if y=
ou=20
> >>> have an 18-bit panel versus 24-bit panel?
> >>
> >> Especially panel-simple.c has a fixed configuration for each display, =
such as:
> >>> .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18
> >>
> >> How would you allow or even know it should be addressed as
> >> MEDIA_BUS_FMT_RGB888_1X24 instead? I see different ways:
> >> 1. Create a new display setting/compatible
> >> 2. Add an overwrite property to the displays
> >> 3. Use a (transparent) bridge (this series)
> >>
> >> Number 1 is IMHO out of question.=20
> >=20
> > Agreed.
> >=20
> >> I personally don't like number 2 as this
> >> feels like adding quirks to displays, which they don't have.
> >=20
> > This is what I would do except apply it to the controller side. We know=
=20
> > the panel side already. This is a board variation, so a property makes=
=20
> > sense. I don't think you need any more than knowing what's on each end.=
=20
>=20
> With option 2, no matter putting a property in source side or sink side,
> impacted display drivers and DT bindings need to be changed, once a board
> manipulates the DPI color coding.  This adds burdens and introduces new
> versions of those DT bindings.  Is this what we want?

There's an option 4: make it a property of the OF graph endpoints. In
essence, it's similar to properties that are already there like
lane-mapping, and it wouldn't affect the panel drivers, or create an
intermediate bridge.

Maxime

--qxu4bxugckchmvib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8mIlQAKCRAnX84Zoj2+
dnSoAYDBB/bDc4oiForTt6hTu2T7k5fxsgOo6hpzAFvD1SElI/SAR1gLrEg+btZA
V7TvczkBgLPm3LiHqD7N6MPlIcKl0SPzNFbP8/UcGvqUWcgBigVdJhw6AY6uj4Ey
73K5s0Sz4A==
=a1cs
-----END PGP SIGNATURE-----

--qxu4bxugckchmvib--
