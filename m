Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6CABDFE3
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5310E58D;
	Tue, 20 May 2025 16:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qR5/y/Oo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6452610E58D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 16:04:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88D1C5C4988;
 Tue, 20 May 2025 16:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFE9C4CEE9;
 Tue, 20 May 2025 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747757041;
 bh=6mBuWVdazhthev+3GPquL4EBApLGjTcl0YN+QuZ9GkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qR5/y/OoDvhsNZGQUznIP2NV/CFi7vMBprjxGkoA3ZQXHAWp9cAAc4jHIT/vTNfPK
 qXNPT5Urb4zfVDkUe4Na33bDi4XFLOopzzJs6y4FnVQPJx6XBp5XYQ+0JVWJl+7ICF
 ipNmKQv29R/qQQYNIvdbGmfH0v+W1q+tlLpVksmL8o4r0CDD99xiTCJ/2euY8r7Py1
 J07VYZ2odnf3u0gkSjip1kzUKGi5wWl9SxUldqw0amPi6zn7zoEIPo/1mkcTHnPxL7
 R4tGJq0cNt4fJFqymEvSpn/Tu12YoedpZDpMLAfNrnB3p5qx6gUCyJ0CS8/VQ6BFKR
 1ZimGJSiE+JXg==
Date: Tue, 20 May 2025 17:03:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Message-ID: <20250520-pluck-exhume-a3973899bf92@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
 <20250520-fidelity-mooned-5d4262d0a7ef@spud>
 <20250520-lens-dizziness-4d098c031b10@spud>
 <20250520120225.fe7983a91ad1452b734d42fa@hugovil.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jEz/NuChb6ALuzUC"
Content-Disposition: inline
In-Reply-To: <20250520120225.fe7983a91ad1452b734d42fa@hugovil.com>
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


--jEz/NuChb6ALuzUC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:02:25PM -0400, Hugo Villeneuve wrote:
> On Tue, 20 May 2025 17:00:11 +0100
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Tue, May 20, 2025 at 04:58:12PM +0100, Conor Dooley wrote:
> > > On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> > > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > >=20
> > > > Allow to inherit valid properties from the dsi-controller. This fix=
es the
> > > > following warning when adding a panel property:
> > > >=20
> > > > rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0=
' do not
> > > >     match any of the regexes: 'pinctrl-[0-9]+'
> > > >     from schema $id:
> > > >         http://devicetree.org/schemas/display/bridge/renesas,dsi.ya=
ml#
> > > >=20
> > > > Also add a panel property to the example.
> > >=20
> > > I don't think adding the example should be in the same patch as a fix.
> >=20
> > Or am I misunderstanding, and this is a new type of usage, rather than a
> > fix?
>=20
> Hi Conor,
> it is more like a new type of usage.

Then it's fine.

--jEz/NuChb6ALuzUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCyn6gAKCRB4tDGHoIJi
0jQ4AP0RW9bfV+NMEX8LXYSuMxON1iJdXzMLIyDbjSdzUaPwjwD/V+dUbxivv0Du
Bkqix57bQc+UKOHdNbx4wcY1IsLy3wg=
=UZZq
-----END PGP SIGNATURE-----

--jEz/NuChb6ALuzUC--
