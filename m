Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAD8B56EA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 13:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961D110FA4E;
	Mon, 29 Apr 2024 11:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HC+nGYW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BC010FA4E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 11:39:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BF5860C75;
 Mon, 29 Apr 2024 11:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A805C113CD;
 Mon, 29 Apr 2024 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714390748;
 bh=uZu3wKHQNWr0ZLymAFjd5ivV78yNbTAn33ozggWSTE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HC+nGYW2S8rw/A3OruRlx4jB+D0gz6jk7NqR9R3PD4B/0HEXqW+bZlzv5BlOdJrrY
 35TrG6u24kc/7Igpkw3xHpC+21isyj/mWgnZaz7LUqmvQhTK0ATuaZwqpAgWjUXkI9
 qK4HvdMYxr/fLAh8VFLa7Y7Wh3NOqqp0VQ2Qrkq+2K+0xti8Dz4wpSBsp26g9nXvK6
 GOL3H26QxYWHjhZi3rPuusu+SBqJpF9boYvhrXddnSQMK8CEnNcfWqsCg8MvbXQFye
 0ENWLu3F3Wxv5CffhqU4AovNvY79Jb0X2BrlZp1mDFVfpaUjT3EPaFa42qr3QA+Zxf
 DUIqQ5gZ080tQ==
Date: Mon, 29 Apr 2024 13:39:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <dlechner@baylibre.com>, 
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] drm/ili9341: Remove the duplicative driver
Message-ID: <20240429-gorgeous-beetle-of-downpour-492bbd@houat>
References: <20240425124208.2255265-1-andriy.shevchenko@linux.intel.com>
 <20240425-perky-myrtle-gorilla-e1e24f@penduick>
 <ZipxEk9Lpff1kB7b@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ypdsdw5t4cfybdrt"
Content-Disposition: inline
In-Reply-To: <ZipxEk9Lpff1kB7b@smile.fi.intel.com>
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


--ypdsdw5t4cfybdrt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 06:04:50PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 25, 2024 at 04:58:06PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Apr 25, 2024 at 03:42:07PM +0300, Andy Shevchenko wrote:
> > > First of all, the driver was introduced when it was already
> > > two drivers available for Ilitek 9341 panels.
> > >=20
> > > Second, the most recent (fourth!) driver has incorporated this one
> > > and hence, when enabled, it covers the provided functionality.
> > >=20
> > > Taking into account the above, remove duplicative driver and make
> > > maintenance and support eaiser for everybody.
> > >=20
> > > Also see discussion [1] for details about Ilitek 9341 duplication
> > > code.
> > >=20
> > > Link: https://lore.kernel.org/r/ZXM9pG-53V4S8E2H@smile.fi.intel.com [=
1]
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > I think it should be the other way around and we should remove the
> > mipi-dbi handling from panel/panel-ilitek-ili9341.c
>=20
> Then please do it! I whining already for a few years about this.

I have neither the hardware nor the interest to do so. Seems it looks
like you have plenty of the latter at least, I'm sure you'll find some
time to tackle this.

Maxime

--ypdsdw5t4cfybdrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZi+G2QAKCRAnX84Zoj2+
dpzEAX9NlMH8mHXaP+9bA+sNZT1R3FNYhW4Pt/1Pn1ubi1pgXk5iBoL6JrqISoVP
QXA4pXMBgORaHd6OB/qFoTj87/v5BZX5gZC0QpOeO4bItwlvpgRISkUwBwjWNi6u
pd9y46+Yag==
=V5/I
-----END PGP SIGNATURE-----

--ypdsdw5t4cfybdrt--
