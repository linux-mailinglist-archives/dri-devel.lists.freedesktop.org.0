Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8074AF4A7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5C410E328;
	Wed,  9 Feb 2022 15:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4E710E328
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:04:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D745560B1B;
 Wed,  9 Feb 2022 15:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F26C340E7;
 Wed,  9 Feb 2022 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644419044;
 bh=OxnEbtpnNFTYIu0BVdh7jdMb60KGrJ11+9ijMRm7QQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxDhMquQF59QKp+QuO0kF+kKQ6+lvZX2uBlSaQy5z3gsM3whNZxYZkIMRCuPxNE07
 6+qnqrvRvzRqaDkpMc7nc8qZaUWQKLEShNgwLNyz+WA73LKKHcdcJMsFBrUMZ8C1zz
 e/XKiZySMFerHQSW6mkxTE3Kw5DMq8h/lVfFf1e+WOJX3t7cHGgTmyNgy8TxeLQ7Pw
 ZTEO2QOaAlG7KzPqXbHRxxz5M14AoSTxuULGqu0hVNUMX8yMhgwP6Gl9C/Zx8M8pH7
 pryKYD+kDTl2wn/ZNOzyNRod0UvOtuEjfrz1XVz6CPVWTYwDGcKBGYscZxTCnv6hM+
 TtEGy5DrrYTrg==
Date: Wed, 9 Feb 2022 15:03:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Message-ID: <YgPX3WZRvnWBuV18@sirena.org.uk>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPE8Z7HxU2wv7J/@sirena.org.uk>
 <d1025530-90e1-fbc5-c06b-f62ed83f2f19@redhat.com>
 <YgPOKf1QcOCtTisx@sirena.org.uk>
 <561e1f22-2741-b414-0267-14587d59d5de@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ma0oporxTU2ZNkw8"
Content-Disposition: inline
In-Reply-To: <561e1f22-2741-b414-0267-14587d59d5de@redhat.com>
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


--Ma0oporxTU2ZNkw8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 03:50:13PM +0100, Javier Martinez Canillas wrote:
> On 2/9/22 15:22, Mark Brown wrote:
> > On Wed, Feb 09, 2022 at 03:17:06PM +0100, Javier Martinez Canillas wrot=
e:

> >> I guess in that case what we should do then is to just have a regulator
> >> fixed as the vbat-supply in the Device Tree, that's regulator-always-o=
n.

> > Generally I'd suggest labelling things with whatever the supply is
> > called in the board's schematics/documentation, that tends to make
> > things clearer and easier to follow.

> The display controller datasheet and schematics mention VBAT as the power
> supply but the documentation says that it's just connected to VCC and the
> label in the display says VCC.

> But I understand why the Device Tree binding and fbdev driver used VBAT
> since that's what the documentation mentions.

What is "the documentation" in this context and how is that distinct
=66rom the datasheet for the display controller?  In general the consumer
driver should be using the name from the datasheet and the regulator
itself should get a regulator-name reflecting the name in the schematic.

> > It is depressingly common to see broken code here, unfortunately
> > graphics drivers seem like one of the most common offendors.

> I'll include a patch for the existing DT binding and mark the vbat-supply
> property as required. Probably we won't be able to change the fbdev driver
> without causing regressions, and I'm not interested in that driver anyway=
s.

There should be little danger of causing regressions given that a dummy
regualtor will be provided when one is missing.

--Ma0oporxTU2ZNkw8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmID19wACgkQJNaLcl1U
h9CAzAf8CKPiD+lXXdh149xtC2P3tLmYf9/NzL3nAnYwK1PqDyJNNfWCgJ6UfoI2
JcXfedd8YDCRodJiw0OaMn44AILruUKsMh+cHHtEUkBbyPj14DvHLoYvtlW/97sW
5/eq5WpXC8v915Ma5H0u2wh5KdBeYzgTDKO2bqHRr756SRcqg82DcwO6U3tO55Fg
GY3VwTJL/hykLaOdM8gtbLbM0k/C5jcADmhKUMCMX7Dc9hyHa11opAopTliZosXl
GoknKBDa22oFsXArV7sSMiIfVz3WMaG8Z4P0RSAhzZv+e2O7sgwL42dWpio99Y1/
xpxV3/ZObW+lY3SpInYdffOcEFHgEQ==
=sOLR
-----END PGP SIGNATURE-----

--Ma0oporxTU2ZNkw8--
