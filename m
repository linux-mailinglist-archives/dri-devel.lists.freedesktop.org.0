Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433FF18825D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 12:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFCC898E4;
	Tue, 17 Mar 2020 11:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2727898E4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 11:39:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42FBE1FB;
 Tue, 17 Mar 2020 04:39:04 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22AE3F534;
 Tue, 17 Mar 2020 04:39:03 -0700 (PDT)
Date: Tue, 17 Mar 2020 11:39:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 02/36] dt-bindings: spi: support non-spi bindings as
 SPI slaves
Message-ID: <20200317113902.GA3971@sirena.org.uk>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-3-sam@ravnborg.org>
 <20200316204850.gggeyjulgiy53i7x@gilmour.lan>
 <20200316214346.GA23637@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200316214346.GA23637@ravnborg.org>
X-Cookie: There's only one everything.
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
 Alexandre Courbot <acourbot@nvidia.com>, Maxime Ripard <maxime@cerno.tech>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: multipart/mixed; boundary="===============1054706137=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1054706137==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2020 at 10:43:46PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 16, 2020 at 09:48:50PM +0100, Maxime Ripard wrote:

> > All the SPI devices will be declared under a spi controller node that
> > will validate its child nodes (and thus the devices) already.

> This was the missing piece - thanks.
> And as Mark put it "why is this suddenly an issue"?
> Turns out this is already properly handled and I made up an issue.
> Maybe Mark tried to explian it to me already...

No, I didn't actually understand how it worked - I was just pretty sure
that it should and trusted that Rob and Maxime had got it right.

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5wttMACgkQJNaLcl1U
h9BF/Qf/e1f3FiL65tLxhJHgSVGWUtvYFUQ6BgqVznQPLNNNIGBfYV1AQsue7zDt
t4vHT0WIpuT/meGsf6ZOMs/tQlq7gQK2+tZzTJEyFCpV1oRmUjdxX63sJtsPVV3T
6rcE1CWMOlAAWIPfegrrkfLvK/LjS7bzRLhYYo7NCgqiRnCMOjsAZawCJtyWYep7
ffPIaxTv+73EvIDvy7/CYjsJRHUGbHtta8CiKb3cm0urAvtvLbcx0ppLHhyr9GcJ
L8uBdMkWd3DRDQM/fPUNmyuWSqGRZwBJmhU+z+jN9bKlQqIC4Iw7JytoE6IOgtg8
9AoTLBvS4BqnlQTGit3CFa6sWdqwIg==
=Df56
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--

--===============1054706137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1054706137==--
