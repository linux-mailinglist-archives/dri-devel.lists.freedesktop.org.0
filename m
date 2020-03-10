Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1917F4D7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 11:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCAE6E86C;
	Tue, 10 Mar 2020 10:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id B518D6E85C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:16:14 +0000 (UTC)
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
 by pokefinder.org (Postfix) with ESMTPSA id F2DDE2C1EB6;
 Tue, 10 Mar 2020 11:16:13 +0100 (CET)
Date: Tue, 10 Mar 2020 11:16:13 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 04/89] i2c: brcmstb: Allow to compile it on BCM2835
Message-ID: <20200310101613.GN1987@ninjato>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <0ec2a26c7492b1ef6554d3bdada7a6fb8b41ab1c.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <0ec2a26c7492b1ef6554d3bdada7a6fb8b41ab1c.1582533919.git-series.maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============0429104122=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0429104122==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ztcJpsdPpsnnlAp8"
Content-Disposition: inline


--ztcJpsdPpsnnlAp8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  config I2C_BRCMSTB
>  	tristate "BRCM Settop/DSL I2C controller"
>  	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
> -		   COMPILE_TEST
> +		   COMPILE_TEST || ARCH_BCM2835

Can you please sort if for easier maintenance?


--ztcJpsdPpsnnlAp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5naO0ACgkQFA3kzBSg
Kbbotw/+MzEKdBWRAl9XS4c7JMOrYWcaHDXRPlPcgpby/WGwtkBcP3qMVLzhUK3P
wmRIwVMeZxmVzF6//Nj0RUMzHdMABDfMxroBW71xRaksB0X1Z4QwQoPhJrySz880
n7CosfR4WmdVujIgSA4G5Wx7Izqbw6Y3F5MBI4q9hDQC4yB6+0ByDA5PdC2c/ze8
UtrISDP7GZyfGY8j7+R5jycrYzGAZo+nsQ96AphoZYqnMoOaVhMU8e9zKzcPZjXE
y7gjuKI9drofcEYwZSwfA7xBN3mjG/zGaQdcfw8wYd9dX6+7Rw4ufZ36t6xKjvGv
OtMuow5QkSJAnjoTxFx8AvfqpXuGFTaRIq8znaIPOLp3OfwbWy6YpMQXwBTuhdip
GHouuNT9FKOfKhNxWo4wRox1VnaI9a/88X6L8VPu6hCpk2y+Ok6vzdcd//aA56/W
JeSFvdkFW305mu4CGGLq7CSH/w86tjSSmQveOXgRrsYfZ8fJL5TrQUIkkVCZG9Gk
Tj9LqtT4b97xVY6bNloTPRF3xAiu9t6pvJna/J8RSSIct6bjSPXJ5wuZW7eykUYD
DKOCd2LRmDbjwU0niH6Xt9K5FOK05SVdQDvSgFNABjGJTkaH29yxtoA+MQ8PTDaS
5J1H1Vzqf6tuGQ1I4Iv/W2yS9GmOlwY6pW8qvi+csOoeW4TXMR8=
=UluX
-----END PGP SIGNATURE-----

--ztcJpsdPpsnnlAp8--

--===============0429104122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0429104122==--
