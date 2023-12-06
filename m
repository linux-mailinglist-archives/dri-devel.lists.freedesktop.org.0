Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F032807272
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 15:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBB410E11A;
	Wed,  6 Dec 2023 14:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E7910E11A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 14:31:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3EE28B81DD4;
 Wed,  6 Dec 2023 14:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9BCC433C7;
 Wed,  6 Dec 2023 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701873102;
 bh=jxQtCX9Tnj5Rn5bgII5oPUR6Vl+e2nBLKxf7aaoQeMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzMUmksiJQNyvHH9O1O5A2uWk+4owp54WXqV28gCUOj5HpzeCiAd56Bi+vY14f1EM
 eUhWfanjkDqFYfr9AtbhtYkVN1lLeiUJMT0nUErzs0Wn5xl6OXxh/R1YFjeoJGi1k3
 Z/11WR2zHc6B9HRuYpMJ/7eH9c5ac9pSmXpI1NJ0l3Z8TDUsD75f+NXh2Kzg0kiN8V
 Z2d55NLUJvmDjhNuOU244HEqu4TPdrxDcQUlVXGkXzT0W6/iGWI5qTQQcwvQtrvby7
 2uPwlDrElvAc1CfgBiXMUxr4yM+HdejfAsHKcv6XH2fKUqbDvl53akwJh0Jyx6YxA+
 pgxf/NKhirbUg==
Date: Wed, 6 Dec 2023 15:31:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 0/4] drm: Fix errors about uninitialized/wrong variables
Message-ID: <be65q5mrkoq55lnusz6xm2s6vl5h7gt3333j7lrazutrngbyom@m3atoa24sxzg>
References: <20231103-uninit-fixes-v2-0-c22b2444f5f5@ideasonboard.com>
 <0d458603-fc4a-44cc-bf90-eccee875d014@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t2peozghuvu7sqte"
Content-Disposition: inline
In-Reply-To: <0d458603-fc4a-44cc-bf90-eccee875d014@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Parshuram Thombare <pthombar@cadence.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--t2peozghuvu7sqte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 02:50:57PM +0200, Tomi Valkeinen wrote:
> Hi all,
>=20
> On 03/11/2023 15:14, Tomi Valkeinen wrote:
> > Fix cases where smatch reports a use of an uninitialized variable, and
> > one where the variable is initialized but contains wrong value.
> >=20
> >   Tomi
> >=20
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> > Changes in v2:
> > - Added two more fixes
> > - Link to v1: https://lore.kernel.org/r/20230804-uninit-fixes-v1-0-a607=
72c04db5@ideasonboard.com
> >=20
> > ---
> > Tomi Valkeinen (4):
> >        drm/drm_file: fix use of uninitialized variable
> >        drm/framebuffer: Fix use of uninitialized variable
> >        drm/bridge: cdns-mhdp8546: Fix use of uninitialized variable
> >        drm/bridge: tc358767: Fix return value on error case
> >=20
> >   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c | 3 ++-
> >   drivers/gpu/drm/bridge/tc358767.c                   | 2 +-
> >   drivers/gpu/drm/drm_file.c                          | 2 +-
> >   drivers/gpu/drm/drm_framebuffer.c                   | 2 +-
> >   4 files changed, 5 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 9d7c8c066916f231ca0ed4e4fce6c4b58ca3e451
> > change-id: 20230804-uninit-fixes-188f92d60ac3
> >=20
> > Best regards,
>=20
> Ping on this (or I'll forget the series...).

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--t2peozghuvu7sqte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXCFywAKCRDj7w1vZxhR
xWkGAP9+CxSw6oCLELzhvUt4toOjxTWe1Z4y84jRB9x56ljN4gD/X8l9hCmN36Yb
nqU83CX7rysJsuBCQHLyz/n0gh1zEAI=
=C+yp
-----END PGP SIGNATURE-----

--t2peozghuvu7sqte--
