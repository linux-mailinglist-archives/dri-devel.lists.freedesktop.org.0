Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61A4AF3F3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668CA10E478;
	Wed,  9 Feb 2022 14:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4CF10E478
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:22:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ECDCAB821B0;
 Wed,  9 Feb 2022 14:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F33C340E7;
 Wed,  9 Feb 2022 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644416560;
 bh=B9M1QUhxyzDTyJUIvoDWD9clUCcq5ypjGHdIH9Y1XLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezvszam4JzxtWGTKTkn/z46tgYiIjF3YOhh0B3WAQBr1/xZ0J65eNGDIolA1fKD+b
 1IcX9L3OzFYxjaDx9+OxdLcMsmVzfESU7kUhh2DCBJVZLbbGlylD+VF5Hhh7mtv0Rs
 hMTC5ZKeOzWEKK2h40tAsJAJv6pGBOtppAywQjflflU6jB3Q/0ymDNwWMW0/NYFcgR
 GPaJq5cseks1dx+RyBWt4ecCsHyye5IV+bClPHtsb12pPuOUim1MjI6GmlORh9nr5v
 2oJRiEgz6ATGL/WK2LpcFIRuNqPeAY4XcIqvgAGR16ngz4EX685CB7HnezczqX2y0J
 wKTe2eYKcX0Qg==
Date: Wed, 9 Feb 2022 14:22:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Message-ID: <YgPOKf1QcOCtTisx@sirena.org.uk>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPE8Z7HxU2wv7J/@sirena.org.uk>
 <d1025530-90e1-fbc5-c06b-f62ed83f2f19@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wE80BzLpWir2bphU"
Content-Disposition: inline
In-Reply-To: <d1025530-90e1-fbc5-c06b-f62ed83f2f19@redhat.com>
X-Cookie: Disc space -- the final frontier!
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wE80BzLpWir2bphU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 09, 2022 at 03:17:06PM +0100, Javier Martinez Canillas wrote:
> On 2/9/22 14:43, Mark Brown wrote:

> > Unless the device supports power being physically omitted regulator
> > usage should not be optional, it's just more code and a recipie for poor
> > error handling.

> The device has a VCC pin but in most cases this is just connected to a
> power provided by the board in its pinout header. For example, I've it
> connected to a rpi4 3.3v pin.

That sounds like a very common configuration.

> I guess in that case what we should do then is to just have a regulator
> fixed as the vbat-supply in the Device Tree, that's regulator-always-on.

Generally I'd suggest labelling things with whatever the supply is
called in the board's schematics/documentation, that tends to make
things clearer and easier to follow.

> The old ssd1307fb fbdev driver also had this as optional and I wanted to
> keep the new driver as backward compatible. But I understand now that is
> not describing the hardware properly by making this regulator optional.

It is depressingly common to see broken code here, unfortunately
graphics drivers seem like one of the most common offendors.

--wE80BzLpWir2bphU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIDzigACgkQJNaLcl1U
h9CIRgf9GQgvRGky+AHIz+3b4Xh9ynU6oo2+aA7UEZoXXO9GUqpQSYRbnyQ/agr3
FLnQfZ5r2/cRZlLAQLFv2MTfOCGD8gLiUctqlD37tLPXg8lwbDvbMblhskQ5PFMn
wMFyobAOlaSQnA9EuQSF33dk2esmhsxAPo3kSw3YMlpqCmp3/feYC7FwfkImDH3b
FGgL2JY9UbffMtY6kstb/WihsMhlXRP6Hj6Zch6J2vVmB+Nvn9nEMvwpWcvk9YkD
KzzzDggasIowid6/iHYMKQ2oNhTZoUXezRWXANvYJF5NpqIwe4BWGmt9Sk5eu+X5
opACYR+EewGRuXZAqeTmM2VIeYm8Uw==
=kMLR
-----END PGP SIGNATURE-----

--wE80BzLpWir2bphU--
