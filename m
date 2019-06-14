Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A446928
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6099D88E79;
	Fri, 14 Jun 2019 20:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id D10FC88E79
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:31:46 +0000 (UTC)
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
 by pokefinder.org (Postfix) with ESMTPSA id E6D7B2CF690;
 Fri, 14 Jun 2019 22:31:44 +0200 (CEST)
Date: Fri, 14 Jun 2019 22:31:44 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 06/28] drivers: Add generic helper to match by of_node
Message-ID: <20190614203144.GB7991@kunai>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-7-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
In-Reply-To: <1560534863-15115-7-git-send-email-suzuki.poulose@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thor Thayer <thor.thayer@linux.intel.com>,
 rafael@kernel.org, David Airlie <airlied@linux.ie>, linux-fpga@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Peter Rosin <peda@axentia.se>,
 Frank Rowand <frowand.list@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Jiri Slaby <jslaby@suse.com>,
 devicetree@vger.kernel.org, Alan Tull <atull@kernel.org>,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Joe Perches <joe@perches.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: multipart/mixed; boundary="===============0614952494=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0614952494==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +
> +int device_match_of_node(struct device *dev, const void *np)
> +{
> +	return dev->of_node == np;
> +}
> +EXPORT_SYMBOL_GPL(device_match_of_node);

Is it an option to 'static inline' this simple function in the header,
saving the EXPORT?


--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0EBDAACgkQFA3kzBSg
KbZQeg/+MjmzU/IJj8oHfL4ndVmHrnLSPM/0OA0J/USTiS12dT9fwVXWkkaLZlRR
cZkTt2QJ3UkAf+rbhooH8c/uo56rhY/LLFM7CT+4b360BZ1CYaVT8ttPRYSs5jtC
CV9vMHwMl1kI1vAg5uSMb0EIjR/0dEl4Q8ol4MYMYqR7fusVx+qGRnVPW9zePbEI
x3F/0woDahhQj0i12ETLSl2ONa8A54M1BgmOHRdcbfrdEnuUnyb0gmnKJDuQu7pz
MDYW2ILMYPOewsH3DJSHpH7HuzgDTjqlgmWIBlKn0EbpgMT2UqyuoxHJ1lkOh4yk
llNaipn5AyS6IbodA4F5TZu2NHJkPhwUgfCy9rXUG5/IGYPq43f9DjLNEzNqHhMI
4nZi5EGx6o8Y5641xf3hZxRjDqu610k19RX3QSOXZxLoOQ9+CSFEwfXxIVDgD11o
B4NMXI6cD3cddQgHfSyUNKDCn9lNMLk7uqbuXnAGEbreQ5InjVBgeZ3O59mDaVrW
1qR3/yup3CR/nOLPdfzR2E4yiwTAKc+B4Vo52DP8X6OnQR/u/05CCTKHaeh8SOjT
uP31ar1Au18BDkCxNuw4NijvDnIGAjqTO/0GLV2m5ViWAeq1nAMpIoCIiR6dhMpK
naLg0mc136SskefQhRyOrVOmm7rLHV9oQmzG7Lb8maF3BNuStsk=
=CJt5
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--

--===============0614952494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0614952494==--
