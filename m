Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493FA1B7E7C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 21:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601DA6EB07;
	Fri, 24 Apr 2020 19:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E17C6EB07
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 19:04:24 +0000 (UTC)
Received: from localhost (p5486CE62.dip0.t-ipconnect.de [84.134.206.98])
 by pokefinder.org (Postfix) with ESMTPSA id E69B42C2019;
 Fri, 24 Apr 2020 21:04:23 +0200 (CEST)
Date: Fri, 24 Apr 2020 21:04:22 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 01/91] i2c: brcmstb: Allow to compile it on BCM2835
Message-ID: <20200424190422.GA5220@kunai>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
 <20200424161353.GA4487@kunai>
 <bedfe073-6ff4-69ee-fe39-d5802cc3ecfd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <bedfe073-6ff4-69ee-fe39-d5802cc3ecfd@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1819759057=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1819759057==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 10:07:25AM -0700, Florian Fainelli wrote:
>=20
>=20
> On 4/24/2020 9:13 AM, Wolfram Sang wrote:
> >=20
> >>  config I2C_BRCMSTB
> >>  	tristate "BRCM Settop/DSL I2C controller"
> >> -	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
> >> -		   COMPILE_TEST
> >> +	depends on ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC || \
> >> +		   ARCH_BCM_63XX || COMPILE_TEST
> >=20
> > Isn't there something like ARCH_BROADCOM which we could use here instead
> > of adding each and every SoC?
>=20
> If you are worried about this list growing bigger, I do not think this
> is going to happen beyond this changeset (famous last words).

Okay, thanks for the heads up.

I wonder, then, if the description after 'tristate' is still accurate?

But that withstanding, I am fine with this patch:

Acked-by: Wolfram Sang <wsa@the-dreams.de>

Let me know if I shall take this via I2C.


--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6jODIACgkQFA3kzBSg
KbYN+Q//SQP+Vpeh1qTzUNAUeo0heLgu/UyeswoGy/XX0fkPi1VnjHdErSP3hI5i
qDLv1Xsz6XsjjlNPIIjMyisPgLT1blkvBicJnfNcjh+6ztSQaO1TqUscpgxxxG6f
n4Dk+CRwVEgmbYI3B/CAxxLSV+ulKl4l6/QSHoDXEdlNcpnQVYqB9noyJh9DJenG
MUb3zxOoJSDvuNVftZg1Pc07yexfFgRvix0JYC41z9A/bD3yrw/apd4omkuzpojG
dqEg+xeqCCg6kC4TozKlcqi7Zq4n+pjO0M5crP9U1jllCxgo0pMDbdF7QSXnWuiC
GVToAKqKWMZbnm4h05ZrGt7IujJExmpRIj6tr6TySvyMpGM3h3EGGjebLFhvRJ2q
AdRodX9+cAnIQl9HP+eXFHuvp/VzPY8RPgSK3XjAogMNgIQqTTa8L4a6rfNOz83F
yI0nf2ftcX+7ukUGmtWzL7XT9njqBNhNgTUOXMQ7ccFTe9bpxQxcukYYM/3asi14
DrcWVHQ6VRbjHvn52lRqfw0rKMaCLGSPgsSd9wXA9OiHCexTDjP7LMdzLKW+QgJq
1CCCwRvvct6pMvLsHnEhCdwC11ZIHnVOagtvt6p9YrOJOjBSBak3+/IpXaVQ/eSY
F5UsPOi0nuo0ZLmBLnn/uU4/yK4ciPgZRdX/pe9iRlkSY0V5STo=
=kdd5
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

--===============1819759057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1819759057==--
