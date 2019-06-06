Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D82837253
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 13:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DB7895C4;
	Thu,  6 Jun 2019 11:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278598944A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:00:06 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYq7f-0005Nj-Pk; Thu, 06 Jun 2019 10:59:55 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 450A6440046; Thu,  6 Jun 2019 11:59:55 +0100 (BST)
Date: Thu, 6 Jun 2019 11:59:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 8/8] drivers: regulator: 88pm800: fix warning same module
 names
Message-ID: <20190606105954.GZ2456@sirena.org.uk>
References: <20190606094736.23970-1-anders.roxell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190606094736.23970-1-anders.roxell@linaro.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oYOXjRQFx1z+6E0ax1Zx11BDYlrCjP+RsMwp6EKLiOI=; b=VBDtL01GAkY/Njk3N1+4YBarr
 nqRuHuFxIQzaLsab8s4rUGOZcri4e+qIwZxuPxc/OLVKZZzNQpWNmtVd6VDXKqxpf8FWnFUmG8ZDo
 3zKZWtwFZqHgv4VDrv/7IdbEHbB5FChNwmygerYfXaq13TpYL7RuwPZVk2n19X0vEUpiA=;
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
Cc: andrew@lunn.ch, linux-fbdev@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, lee.jones@linaro.org, marex@denx.de,
 f.fainelli@gmail.com, vivien.didelot@gmail.com, linux-media@vger.kernel.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 lgirdwood@gmail.com, shawnguo@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com
Content-Type: multipart/mixed; boundary="===============0097323219=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0097323219==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JbpSbCMiCLmwdpgc"
Content-Disposition: inline


--JbpSbCMiCLmwdpgc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 11:47:36AM +0200, Anders Roxell wrote:

>  obj-$(CONFIG_REGULATOR_88PG86X) += 88pg86x.o
> -obj-$(CONFIG_REGULATOR_88PM800) += 88pm800.o
> +obj-$(CONFIG_REGULATOR_88PM800) += 88pm800-regulator.o
> +88pm800-regulator-objs		:= 88pm800.o

Don't do this, no need for this driver to look different to all the
others in the Makefile - just rename the whole file.

--JbpSbCMiCLmwdpgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz48ioACgkQJNaLcl1U
h9CG4wf+KwJtkqXwPsGULtOJI6nSm5LEkmrz72NfdgOqj1WW7rLXjWvVzFh/6QR4
Yx2iXClMJ3RT5wsgfK/nlN0mPPVrA7hVeHFDLig5RdvadGQZd0UdN6BgUYcZpZat
5jUkB6rgNxVOe+6kO4onKQn4RWHwkF3Sy7xlN0adWD2b2qqoZPMy3Sc62S+JtAb7
KcHORRkbS49Q1xEtsikUD7SZY3cgJOqjQ6ZQcd9dr1iEXZr8wQ3A8wAnBtqm+OEQ
ptNlJi9FmLI9Ihk1Ps82hCwgTT8hWRdQU0JxFV5ybOtLv5y24PoXCvdo2NNtRcdr
ysZl+LpymLjvpEgM2ByRehnnqcnyuQ==
=2HyU
-----END PGP SIGNATURE-----

--JbpSbCMiCLmwdpgc--

--===============0097323219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0097323219==--
