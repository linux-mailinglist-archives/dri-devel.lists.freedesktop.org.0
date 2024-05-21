Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D68CB387
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 20:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE8610EDAF;
	Tue, 21 May 2024 18:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EWsp6MCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522E10ED9C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 18:31:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6B83623F2;
 Tue, 21 May 2024 18:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C90C2BD11;
 Tue, 21 May 2024 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716316317;
 bh=73vaEc2+Ila3l2dDk9+94NR4FaAuj1CJocbODWzqAFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EWsp6MCxzQpqz5SpHf3xVk0D/9iv7MMU9rMvhEOxMl8R74bdHXIcV+reNkhyrWM6c
 Z+aKJdfkvC1tS1A5kHVg6Yc0FjFl2SFERlC8So7+BWuBo//ANiyD6mZW5jkDHvjxiw
 EY0mTzmtEVh/3/7h+O7tNPpwgkgvOh5vYmMLbHm3dEz6DOaloLqtmq4uNT2Pr6PrMY
 EH06i/oI6jaZP8XLtEuRrDXB6Bpuu3waTR630XnR6ozYIV0ngU9xfgIJrT9u0vnsBt
 3530qbHyqCQ0vS193WSOHgHQtCdDHqp2qhMBe5A8Uj0JqyM1eP9YGUJDWF2oY99oK4
 iLyTMBabjaydQ==
Date: Tue, 21 May 2024 19:31:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: display: vop2: Add VP clock resets
Message-ID: <20240521-silver-exciting-bb3725dc495d@spud>
References: <20240514152328.21415-1-detlev.casanova@collabora.com>
 <20240515-risk-exes-13db315da6bb@spud> <2182693.irdbgypaU6@diego>
 <13628421.uLZWGnKmhe@arisu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r8AEGgMh3QAZNC29"
Content-Disposition: inline
In-Reply-To: <13628421.uLZWGnKmhe@arisu>
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


--r8AEGgMh3QAZNC29
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 01:15:46PM -0400, Detlev Casanova wrote:
> On Wednesday, May 15, 2024 12:33:22 P.M. EDT Heiko St=FCbner wrote:
> > Am Mittwoch, 15. Mai 2024, 18:19:29 CEST schrieb Conor Dooley:
> > > On Tue, May 14, 2024 at 11:19:47AM -0400, Detlev Casanova wrote:
> > > > Add the documentation for VOP2 video ports reset clocks.
> > > > One reset can be set per video port.
> > > >=20
> > > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > >=20
> > > Are these resets valid for all VOPs or just the one on 3588?
> >=20
> > Not in that form.
> > I.e. rk3588 has 4 video-ports (0-3), while rk3568 has 3 (0-2).
> >=20
> > So the binding should take into account that rk3568 also has the
> > SRST_VOP0 ... SRST_VOP2.
>=20
> That is what is set in the example and the reason why I set minItems to 3=
 in=20
> the main bindings.
> Then, the rk3588 specific part sets it to 4.
>=20
> Isn't that enough ?

Not quite - you need to restrict maxItems to 3 for the other devices if
the clocks are not valid. What you've got says that 4 clocks are
possible but not needed on !rk3588.

Cheers,
Conor.

--r8AEGgMh3QAZNC29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkzolwAKCRB4tDGHoIJi
0n6OAP4wwXEM/mpcp22FOi2YHaUbxut8mO+9Vbudzw42lFwLEAD+LZI8reFtSZ0L
4FVV8PWuTYl0PJwEL+Xc2KHa7boG/AE=
=rTte
-----END PGP SIGNATURE-----

--r8AEGgMh3QAZNC29--
