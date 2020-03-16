Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D518701D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 17:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419696E22E;
	Mon, 16 Mar 2020 16:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D55846E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 16:35:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 145371FB;
 Mon, 16 Mar 2020 09:35:40 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 931FB3F534;
 Mon, 16 Mar 2020 09:35:39 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:35:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 02/36] dt-bindings: spi: support non-spi bindings as
 SPI slaves
Message-ID: <20200316163538.GJ5010@sirena.org.uk>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-3-sam@ravnborg.org>
 <20200316120239.GC5010@sirena.org.uk>
 <20200316132844.GA22822@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200316132844.GA22822@ravnborg.org>
X-Cookie: I thought YOU silenced the guard!
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: multipart/mixed; boundary="===============1925844773=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1925844773==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3MMMIZFJzhAsRj/+"
Content-Disposition: inline


--3MMMIZFJzhAsRj/+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2020 at 02:28:44PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 16, 2020 at 12:02:41PM +0000, Mark Brown wrote:
> > On Sun, Mar 15, 2020 at 02:43:42PM +0100, Sam Ravnborg wrote:

> > > Independent bindings can be SPI slaves which for example is
> > > the case for several panel bindings.

> > What is an "independent binding"?

> For several panels we have device trees that looks like this:

So what you're trying to do is define a generic class for SPI slaves
which are just normal children of SPI nodes?  I really can't get to
there from your changelog so we need some work there - in particular
"non-spi bindings" is *very* confusing as as far as I can see these are
bindings for SPI devices.

> The bindings are child of the spi controller node, but not specified
> in the same binding file as the spi controller node.

Of course not, this how all buses work isn't it?

> So SPI slaves can now reference spi-slave.yaml to get access to
> the SPI slave properties - and the copies can be avoided.
> Likewise spi-controller.yml now references spi-slave.yaml.

> This was the best way I saw it could be done.

Rob didn't do the binding conversion but he did review it - I'm a bit
surprised that there's issues here?

Also shouldn't there be some constraint that these devices have to be
the child of a SPI controller or something?  Just including a file
doesn't look right for something like class definition.

--3MMMIZFJzhAsRj/+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5vqtkACgkQJNaLcl1U
h9D9Jgf7BDsLTp/6OG/zIxXw5pr33X7ZgheGEgzqYDaH/LK45lJUNdpYb2eTABDv
Jg1MzeqqPxP1ppvEvmo3VRdudgU+m+hKTtHAbIwVnxY32nmSAweUnDySfKWCNl/1
LZXTrA6hFaFU4AmTj3iCIbNe4mHY9jt5f+DZN/31ZNr43VGfjXvqpSei/exRu+/i
Hnh0w0MvGQVHfD3V6AMGlaFrhLO59ZR6KPxXfQCGlJRfCuAgrjgJUK+0KSGsDf48
oTef8wJIjDm4r8LCFdN10GzODwdcLE6HGGzWl8pB1sEfKP4p4tFtWOTh/JIyTQZM
dHvwfKrDy65fP8P6ytpHy352wV8kQw==
=nY4o
-----END PGP SIGNATURE-----

--3MMMIZFJzhAsRj/+--

--===============1925844773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1925844773==--
