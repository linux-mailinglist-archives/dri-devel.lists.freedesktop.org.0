Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA5144455
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 19:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5F86EE22;
	Tue, 21 Jan 2020 18:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D1FA6EE22
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 18:32:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DC861FB;
 Tue, 21 Jan 2020 10:32:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F7533F6C4;
 Tue, 21 Jan 2020 10:32:50 -0800 (PST)
Date: Tue, 21 Jan 2020 18:32:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 2/2] drm: sun4i: hdmi: Add support for sun4i HDMI
 encoder audio
Message-ID: <20200121183247.GL4656@sirena.org.uk>
References: <20200120123326.30743-1-stefan@olimex.com>
 <20200120123326.30743-3-stefan@olimex.com>
 <20200121182905.pxs72ojqx5fz2gi3@gilmour.lan>
 <20200121182937.2ak72e4eklk4za2u@gilmour.lan>
MIME-Version: 1.0
In-Reply-To: <20200121182937.2ak72e4eklk4za2u@gilmour.lan>
X-Cookie: You too can wear a nose mitten.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0090561749=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0090561749==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gwtGiOGliFx8mAnm"
Content-Disposition: inline


--gwtGiOGliFx8mAnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 07:29:37PM +0100, Maxime Ripard wrote:

> > Mark, our issue here is that we have a driver tied to a device that is
> > an HDMI encoder. Obviously, we'll want to register into DRM, which is
> > what we were doing so far, with the usual case where at remove /
> > unbind time, in order to free the resources, we just retrieve our
> > pointer to our private structure using the device's drvdata.

> > Now, snd_soc_register_card also sets that pointer to the card we try
> > to register, which is problematic. It seems that it's used to handle
> > suspend / resume automatically, which in this case would be also not
> > really fit for us (or rather, we would need to do more that just
> > suspend the audio part).

There's a drvdata field in the snd_soc_card for cases like this - would
that work for you?

--gwtGiOGliFx8mAnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nQ84ACgkQJNaLcl1U
h9DTsQf/ZXhHyM/3fgvqMJFm1rMy0RUSq2MP43zhb1/fioi7vxLOoPvc5jQzGwUw
0WCUnqbv87LZXwtMbvIx1TS2xVzFt1EvAuRX+XwwVYlmTP2svfRkN+pjdNGscEcY
Y9dO1Klqekk2WyzZsQ9fkDM8hoJtjXZ0oFRrPlUsae9jbmymykgqmK48XLVKFd3x
AaeVd0BuUIXA+6jlFqTBgaIA35TffdliRrgSxjwxoy3Jk+wrW562WgM/isGD2qjK
Jn+alQQhlwRYsN3Xmuni7Fd4P9zf5r7o8twcyijEOH/Um76H8d+vSjrwI2tCJfAm
c0+F7U3m8NTne3fCjVXvL4/ipHzMGQ==
=km+F
-----END PGP SIGNATURE-----

--gwtGiOGliFx8mAnm--

--===============0090561749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0090561749==--
