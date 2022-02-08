Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E230E4ADC3F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16A010E3E5;
	Tue,  8 Feb 2022 15:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405E310E3E5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 15:18:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17D9CB81B97;
 Tue,  8 Feb 2022 15:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071E2C004E1;
 Tue,  8 Feb 2022 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644333501;
 bh=9zUs0iuzKwulU200Q6NMliFAJbLi0oQzH9htLDfo/j8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jec8CourqxGwtOULAuUJQ2M06wpyEydYcArcgJdKsAi2pDpknemzA3PLWTfMKSj7k
 UDzxVpfxINAj6NXq1W4KUyDdHKyM51z62OlSYsrEJOcVZbQybOEJNB6Y/FESnlSAdw
 s+kZ3C6+D9EpV9zfi/4v42c21hn321m0WQijY487BF3RlwwxK4RXsiIFqskCZKGg2X
 YZWojAT2oRg5AxPl4e2OOP/6DUinHkbXLQ7JADrUsYjDmOza9sAg5gbYVmYEefXPVj
 HhDLH0L2g/iD0eNGQf+ZyGAUmEYBS4BjNfqd7OdQKIK7dCh/DYx+/uRVmhDXdrYyYv
 JIrzOMR83Rk4w==
Date: Tue, 8 Feb 2022 15:18:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
Message-ID: <YgKJtjoFMSzxNiiI@sirena.org.uk>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6nCHMM5kfVPLymNn"
Content-Disposition: inline
In-Reply-To: <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
X-Cookie: This is your fortune.
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6nCHMM5kfVPLymNn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 08, 2022 at 04:10:49PM +0100, Javier Martinez Canillas wrote:
> On 2/8/22 15:19, Geert Uytterhoeven wrote:

> >   - "time ls" on the serial console (no files in the current directory,
> >     so nothing to print) increases from 0.86s to 1.92s, so the system is
> >     more loaded.  As ssd1307fb relied on deferred I/O too, the slowdown
> >     might be (partly) due to redrawing of the visual artefacts
> >     mentioned above.

> I was trying to first have the driver and then figure out how to optimize
> it. For v3 I'm using regmap to access instead of the I2C layer directly.

> I noticed that this is even slower but it makes the driver more clean and
> allows to support both I2C and SPI (untested but will include it as a WIP).

I wouldn't have expected regmap to add huge overhead relative to I2C,
partly predicated on I2C being rather slow itself.  There will be some
overhead for concurrency protection and data marshalling but for I2C
clocked at normal speeds it's surprising.

--6nCHMM5kfVPLymNn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmICibYACgkQJNaLcl1U
h9AOugf/QJOPSSqlU4nYtDxke7z0DHEFzbA063OycyGY8coF3lZCkjrBvoV2zp5r
gBY8Wdmv00psAkmZE7Pg3o8IZhaBn9mZ7+u/GZ0/Rzv7P+oNScm9ixRfPzOVAw5n
8ipOUBx2JYFmxMaYKsahkKl/IMSZ7w14roD+GnSHomyk1yK47L+7+ILdJdzC9Gg4
0rDNz+IF+tKQu4SrwyteAmwy0a3ufos9kj+zOH61iVOv4388BuSnoUCa0ADUCGMb
n7MkSDMlJwuTJkX3sS5jJeJdi0AP+uuPwUa73zAAq3FDi7Zn3wjnRlEHP+QNa3B/
yQIr2nXx8Oy5WWWQc8CPGM7d4u+3EQ==
=0FAN
-----END PGP SIGNATURE-----

--6nCHMM5kfVPLymNn--
