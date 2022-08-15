Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D19F5942C4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 00:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B27CD098;
	Mon, 15 Aug 2022 22:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0422D5D45
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 22:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A6BAB8122C;
 Mon, 15 Aug 2022 22:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DE2C433B5;
 Mon, 15 Aug 2022 22:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660601266;
 bh=7yW4D4Jr+GwP+dL8bSYKzTZ6Vx8kkiE7EcnoGyP8Vh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uGSvNd4EV/iKCG9xuv/NuL0wUEPyTOXe4dGEfb36EKNtmW7Yrk4D28+3A2W6rz7np
 vnJ5Bz6il26/cO+xSbchp7Unh3LfVSjGWZIyAOjHJmfKdIu/zIQuUHlOoLaRXNrpLU
 EvZQ45i6fdrm9fR5izg3RpHaVzHZUhSzHCOijXiwAs3KOuFh0+boQ4TildPz2mAXId
 MzSfYwK9QO5cWQIuI+W7EcKFgMWzy/7x7xOXSniSYIXaj9fPlSpASJbfwQIpl7oZMl
 j1tNrmiH89nPEZ2chBnnA78u2OXQEjvr0Wbkb8feNgx0F11Jq7oz6P5tfZaczr5TuE
 H+1q+hp23/fjg==
Date: Mon, 15 Aug 2022 23:07:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <YvrDp32/TknqV05t@sirena.org.uk>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VUoPU3p+8USLMiyu"
Content-Disposition: inline
In-Reply-To: <20220815205857.308B1C433D6@smtp.kernel.org>
X-Cookie: We have ears, earther...FOUR OF THEM!
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
Cc: Miaoqian Lin <linmq006@gmail.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Turq uette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Johan Hovold <johan+linaro@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--VUoPU3p+8USLMiyu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 15, 2022 at 01:58:55PM -0700, Stephen Boyd wrote:
> Quoting Laurent Pinchart (2022-08-15 11:52:36)
> > On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:
> > > On Mon, Aug 15, 2022 at 06:54:45PM +0300, Laurent Pinchart wrote:

> > > > - With devres, you don't have full control over the order in which
> > > >   resources will be released, which means that you can't control the
> > > >   power off sequence, in particular if it needs to be sequenced with
> > > >   GPIOs and clocks. That's not a concern for all drivers, but this API
> > > >   will creep in in places where it shouldn't be used, driver authours
> > > >   should really pay attention to power management and not live with the
> > > >   false impression that everything will be handled automatically for
> > > >   them. In the worst cases, an incorrect power off sequence could lead
> > > >   to hardware damage.

> I think the main issue is that platform drivers are being asked to do
> too much. We've put the burden on platform driver authors to intimately
> understand how their devices are integrated, and as we all know they're

This is for the regulator API, it's mainly for off SoC devices so it's
not a question of understanding the integration of a device into a piece
of silicon, it's a question of understanding the integration of a chip
into a board which seems reasonably in scope for a chip driver and is
certainly the sort of thing that you'd be talking to your customers
about as a silicon vendor.

> The basic idea is that drivers should be focused on what they're
> driving, not navigating the (sometimes) complex integration that's
> taking place around them. When a device driver probe function is called
> the device should already be powered on. When the driver is
> removed/unbound, the power should be removed after the driver's remove
> function is called. We're only going to be able to solve the power
> sequencing and ordering problem by taking away power control and
> sequencing from drivers.

That is a sensible approach for most on SoC things but for something
shipped as a separate driver there's little point in separating the
power and clocking domain driver from the device since there's typically
a 1:1 mapping.  Usually either it's extremely simple (eg, turn
everything on and remove reset) but some devices really need to manage
things.  There's obviously some edge cases in SoC integration as well
(eg, the need to manage card supplies for SD controllers, or knowing
exact clock rates for things like audio controllers) so you need some
flex.

--VUoPU3p+8USLMiyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL6w6YACgkQJNaLcl1U
h9Dj/Qf+Irhly4mQ6388aBof87f+fRZyTpfRbk1B1J89HNrKzDUxTc8jId0ibmOh
XP6CnxFT1ppn79ZTYaYepg5Gj95WFKW5W+ZJHwuG8LXfkbUu4hBYRufm+/CxYoxG
x4ZwtE3q1fA3zcCiTUsAYldU2zuNucCo+p/GRSHc3khhEEDepTmKF8Ifvt7EjMvx
YzoIDe3t68bxJ0qO+nlndzie3mI8drGHfU5pr/BZroJY6WMlhG8InmyNpaYb5Wj+
TzNpM7qWZFvYzEXTe6Dd3lBBcBiWaW3P2KcFKdysY2Kcc0+HTiQVxjgn5pjLQa9R
3+8IJudr63VwjCEgMbDPRxVG7Ht+9Q==
=CRju
-----END PGP SIGNATURE-----

--VUoPU3p+8USLMiyu--
