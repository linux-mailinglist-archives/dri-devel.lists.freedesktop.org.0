Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F101B7B40
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 18:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6869F6EAC4;
	Fri, 24 Apr 2020 16:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1904A6EAC4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 16:13:54 +0000 (UTC)
Received: from localhost (p5486CE62.dip0.t-ipconnect.de [84.134.206.98])
 by pokefinder.org (Postfix) with ESMTPSA id BEDB82C1FE8;
 Fri, 24 Apr 2020 18:13:53 +0200 (CEST)
Date: Fri, 24 Apr 2020 18:13:53 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 01/91] i2c: brcmstb: Allow to compile it on BCM2835
Message-ID: <20200424161353.GA4487@kunai>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1035524913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1035524913==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  config I2C_BRCMSTB
>  	tristate "BRCM Settop/DSL I2C controller"
> -	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
> -		   COMPILE_TEST
> +	depends on ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC || \
> +		   ARCH_BCM_63XX || COMPILE_TEST

Isn't there something like ARCH_BROADCOM which we could use here instead
of adding each and every SoC?


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6jED0ACgkQFA3kzBSg
KbZtQw//Uc4PYUUonN3o9vdnsuv4ID4p7OzoESWkaIHHkfPe4JBvfqW2iWFD0aKc
eebtlPWs93veah4FV2HAJWbAci4wTdPquffZkSFppnOKwYxMXPH7dqprhnJ1ie1y
wE3GmAuijco4Tx4Vcxu2OWZU4C2D4BobfOl7CxFMdpfye6XljwCJ/PFABnPWAxoM
23ur9k86e/Xk6jTnKAvZFSI2PFRGMbV28UQ1iLY0M7FhNA2E32DVg6U5lOaQrtt+
RE/xVQCI0/hEWBimID2K7Dy365BZRJfofHAniCCHmxwsnlwma7uifChHWtP6Apip
p+KUO9CbEU+pqapwH1FbUoL7yTYpKF1q0eTuIRmIbsdXqvFvU0GVJRzl8s20FvJq
V0aaj+B4qfW2tWqn2t4er200m6XWwZ/eFzJCxNv8cdq1Z/aCD3mDNb405o86Ztvn
lM/Bt23upIjuV2imatRrqJgg6qpcBhPQlMJWMjuc372f/wp0Wi35JDiRzPMGJnGp
wPVloECrn8NSBKRSnhvS5c5wa8IuU9EWk3meTLI0tYBInOEBXurgH791capAyrab
KCqmhD6sjqSTUyru93mzHZPwvu5xMvOdPWPukBATQVwwVBM0+emqn68UHeh80R40
yByqFbiHrJLUIZ+3vpfyykuKJWcclQBTjXx+DNbz0xmhEIQRIxE=
=czLk
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

--===============1035524913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1035524913==--
