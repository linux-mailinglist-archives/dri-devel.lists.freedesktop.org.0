Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD93885D5A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 17:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F96710E86F;
	Thu, 21 Mar 2024 16:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zwl1hCY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE1C10E86F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 16:25:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9CFFCE0E42;
 Thu, 21 Mar 2024 16:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFBCC433C7;
 Thu, 21 Mar 2024 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711038301;
 bh=ogc/U6YBTmcb0BC3PL0tlRW7N+zLZ+qmeYO8A+GuUJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zwl1hCY/3Q5C+aesvtYbUBMjYMpGrWG/uiQCilI8ysGe6Q/8ZcAZzpetMacQ991U8
 Y9IC0utl6SJMnak51fdEygBjIYUYms3VR2ZFBnd3kDNj2KHGdXfInl3iTgb7LIMOst
 CCnNgUpOyLR+dUY4jHk1sfltTr1cGdMSmUNhTUcVBe33L+5a8jU4hbypPJT8Atf6JJ
 EQi8g0MKwBv0lp9+oDpTUemckCfhBqTvzni+6aObQtIMME9QFk0VuH6r6DDjBQjMqi
 Dv5OzsKp9siW1+GYB1AbC+4npmqz802j2LIUmk7DcLf5HUNw+aLpwRWfVXurIGZzJ5
 Bgaya0n5FikcQ==
Date: Thu, 21 Mar 2024 17:24:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Frank Oltmanns <frank@oltmanns.dev>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Ondrej Jirman <x@xnux.eu>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: tcon: Support keeping dclk rate upon ancestor
 clock changes
Message-ID: <20240321-faithful-caterpillar-of-health-52d87f@houat>
References: <20240310-tcon_keep_stable_rate-v1-1-0296b0a85c02@oltmanns.dev>
 <20240314-careful-silky-bear-8ee43f@houat>
 <5448341.Sb9uPGUboI@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5hh7c6ibu6zg4s6a"
Content-Disposition: inline
In-Reply-To: <5448341.Sb9uPGUboI@jernej-laptop>
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


--5hh7c6ibu6zg4s6a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 06:20:58PM +0100, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 14. marec 2024 ob 15:42:24 CET je Maxime Ripard napisal=
(a):
> > On Sun, Mar 10, 2024 at 02:32:29PM +0100, Frank Oltmanns wrote:
> > > Allow the dclk to reset its rate when a rate change is initiated from=
 an
> > > ancestor clock. This makes it possible to no longer to get an exclusi=
ve
> > > lock. As a consequence, it is now possible to set new rates if
> > > necessary, e.g. when an external display is connected.
> > >=20
> > > The first user of this functionality is the A64 because PLL-VIDEO0 is=
 an
> > > ancestor for both HDMI and TCON0. This allows to select an optimal ra=
te
> > > for TCON0 as long as there is no external HDMI connection. Once a cha=
nge
> > > in PLL-VIDEO0 is performed when an HDMI connection is established, TC=
ON0
> > > can react gracefully and select an optimal rate based on this the new
> > > constraint.
> > >=20
> > > Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> > > ---
> > > I would like to make the Allwinner A64's data-clock keep its rate
> > > when its ancestor's (pll-video0) rate changes. Keeping data-clock's r=
ate
> > > is required, to let the A64 drive both an LCD and HDMI display at the
> > > same time, because both have pll-video0 as an ancestor.
> > >=20
> > > TCONs that use this flag store the ideal rate for their data-clock and
> > > subscribe to be notified when data-clock changes. When rate setting h=
as
> > > finished (indicated by a POST_RATE_CHANGE event) the call back functi=
on
> > > schedules delayed work to set the data-clock's rate to the initial va=
lue
> > > after 100 ms. Using delayed work maks sure that the clock setting is
> > > finished.
> > >=20
> > > I've implemented this functionality as a quirk, so that it is possible
> > > to use it only for the A64.
> > >=20
> > > This patch supersedes [1].
> > >=20
> > > This work is inspired by an out-of-tree patchset [2] [3] [4].
> > > Unfortunately, the patchset uses clk_set_rate() directly in a notifier
> > > callback, which the following comment on clk_notifier_register()
> > > forbids: "The callbacks associated with the notifier must not re-enter
> > > into the clk framework by calling any top-level clk APIs." [5]
> > > Furthermore, that out-of-tree patchset no longer works since 6.6,
> > > because setting pll-mipi is now also resetting pll-video0 and therefo=
re
> > > causes a race condition.
> >=20
> > Workqueues don't have an upper boundary on when they execute. As we
> > discussed multiple times, this should be solved in the clock framework
> > itself, not bypassing it.
>=20
> I think TCON code still needs to be touched due to clk_rate_exclusive_get=
()
> calls which effectively lock whole chain. You can't have both TCONs locki=
ng
> rate on A64 for this to work correctly.
>=20
> What was original reason for clk_rate_exclusive_get()? I forgot already.

IIRC, it was because the D-PHY and DSI controller derive from the same
clock, and we needed to make sure setting one wouldn't affect the other
one.

Maxime

--5hh7c6ibu6zg4s6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfxfWgAKCRDj7w1vZxhR
xfv3AQDxIiMi1g+0nI7JKGoqxMzWuC13RajfFCHNbQGYsy0IBQD/XJHBNS4oJzSG
eOlBThbUoxtCgz90wXUf/Plufp64XAE=
=F9E+
-----END PGP SIGNATURE-----

--5hh7c6ibu6zg4s6a--
